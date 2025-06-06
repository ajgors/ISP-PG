/*****************************************************************************

  Licensed to Accellera Systems Initiative Inc. (Accellera) under one or
  more contributor license agreements.  See the NOTICE file distributed
  with this work for additional information regarding copyright ownership.
  Accellera licenses this file to you under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with the
  License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
  implied.  See the License for the specific language governing
  permissions and limitations under the License.

 *****************************************************************************/

/*****************************************************************************

  sc_unsigned.h -- Arbitrary precision unsigned arithmetic.

    This file includes the definitions of sc_unsigned_bitref,
    sc_unsigned_subref, and sc_unsigned classes. The first two classes
    are proxy classes to reference one bit and a range of bits of a
    sc_unsigned number, respectively.

    An sc_signed number has the sign-magnitude representation
    internally. However, its interface guarantees a 2's-complement
    representation. The sign-magnitude representation is chosen
    because of its efficiency: The sc_signed and sc_unsigned types are
    optimized for arithmetic rather than bitwise operations. For
    arithmetic operations, the sign-magnitude representation performs
    better.

    It is also important to note that an sc_unsigned number with n
    bits is equivalent to an sc_signed non-negative number with n + 1
    bits.

    For the behavior of operators, we have two semantics: the old and
    new. The most important difference between these two semantics is
    that the old semantics is closer to C/C++ semantics in that the
    result type of a binary operator on unsigned and signed arguments
    is unsigned; the new semantics, on the other hand, requires the
    result type be signed. The new semantics is required by the VSIA
    C/C++ data types standard. We have implemented the new semantics.

  Original Author: Ali Dasdan, Synopsys, Inc.

 *****************************************************************************/

/*****************************************************************************

  MODIFICATION LOG - modifiers, enter your name, affiliation, date and
  changes you are making here.

      Name, Affiliation, Date:
  Description of Modification:

 *****************************************************************************/

// $Log: sc_unsigned.h,v $
// Revision 1.4  2011/08/24 22:05:46  acg
//  Torsten Maehne: initialization changes to remove warnings.
//
// Revision 1.3  2011/02/18 20:19:15  acg
//  Andy Goodrich: updating Copyright notice.
//
// Revision 1.2  2009/02/28 00:26:26  acg
//  Andy Goodrich: bug fixes.
//
// Revision 1.1.1.1  2006/12/15 20:20:05  acg
// SystemC 2.3
//
// Revision 1.5  2006/05/08 17:50:02  acg
//   Andy Goodrich: Added David Long's declarations for friend operators,
//   functions, and methods, to keep the Microsoft compiler happy.
//
// Revision 1.4  2006/03/13 20:25:27  acg
//  Andy Goodrich: Addition of function declarations, e.g., xor_signed_friend()
//  to keep gcc 4.x happy.
//
// Revision 1.3  2006/01/13 18:49:32  acg
// Added $Log command so that CVS check in comments are reproduced in the
// source.
//

#ifndef SC_UNSIGNED_H
#define SC_UNSIGNED_H


#include "sysc/kernel/sc_object.h"
#include "sysc/datatypes/misc/sc_value_base.h"
#include "sysc/utils/sc_iostream.h"
#include "sysc/utils/sc_temporary.h"
#include "sysc/datatypes/int/sc_length_param.h"
#include "sysc/datatypes/int/sc_nbdefs.h"
#include "sysc/datatypes/int/sc_nbutils.h"
#include "sysc/datatypes/int/sc_vector_utils.h"
#include "sysc/utils/sc_temporary.h"


namespace sc_dt
{

// classes defined in this module
class sc_unsigned_bitref_r;
class sc_unsigned_bitref;
class sc_unsigned_subref_r;
class sc_unsigned_subref;
class sc_concatref;
class sc_unsigned;

// forward class declarations
class sc_bv_base;
class sc_lv_base;
class sc_int_base;
class sc_uint_base;
class sc_int_subref_r;
class sc_uint_subref_r;
class sc_signed;
class sc_signed_subref_r;
class sc_fxval;
class sc_fxval_fast;
class sc_fxnum;
class sc_fxnum_fast;

// Operators that need to be declared so they can be friends:

#define SCFP inline
#include "sc_unsigned_friends.h"
#undef SCFP

  // Unary arithmetic operators

  SC_API sc_unsigned operator + (const sc_unsigned& u);
  SC_API sc_signed operator - (const sc_unsigned& u);

  // Bitwise NOT operator (unary).

  SC_API sc_signed operator ~ (const sc_unsigned& u);

// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned_bitref_r
//
//  Proxy class for sc_unsigned bit selection (r-value only).
// ----------------------------------------------------------------------------

class SC_API sc_unsigned_bitref_r : public sc_value_base
{
    friend class sc_unsigned;

protected:

    // construction and initialization:

    sc_unsigned_bitref_r() : sc_value_base(), m_index(0), m_obj_p(0)
        {}

    void initialize( const sc_unsigned* obj_p, int index_ )
        {
	    m_obj_p = const_cast<sc_unsigned*>( obj_p );
	    m_index = index_;
	}

public:

    // destructor

    virtual ~sc_unsigned_bitref_r()
	{}

    // copy constructor

    sc_unsigned_bitref_r( const sc_unsigned_bitref_r& a )
	: sc_value_base(a), m_index( a.m_index ), m_obj_p( a.m_obj_p )
	{}

    // capacity

    int length() const
	{ return 1; }


    // implicit conversion to bool

    operator uint64 () const;
    bool operator ! () const;
    bool operator ~ () const;


    // explicit conversions

    bool value() const
	{ return operator uint64(); }

    bool to_bool() const
	{ return operator uint64(); }


    // concatenation support

    virtual int concat_length(bool* xz_present_p) const
        { if ( xz_present_p ) *xz_present_p = false; return 1; }
    virtual uint64 concat_get_uint64() const
        { return (uint64)operator uint64(); }
    virtual bool concat_get_ctrl( sc_digit* dst_p, int low_i ) const
        {
            int  bit_mask = 1 << SC_BIT_INDEX(low_i);
            int  word_i = SC_DIGIT_INDEX(low_i);
	    dst_p[word_i] &= ~bit_mask;
	    return false;
        }
    virtual bool concat_get_data( sc_digit* dst_p, int low_i ) const
        {
            int  bit_mask = 1 << SC_BIT_INDEX(low_i);
	    bool result;	// True if non-zero.
            int  word_i = SC_DIGIT_INDEX(low_i);
            if ( operator uint64() )
	    {
                dst_p[word_i] |= bit_mask;
		result = true;
	    }
            else
	    {
                dst_p[word_i] &= ~bit_mask;
		result = false;
	    }
	    return result;
        }


    // other methods

    void print( ::std::ostream& os = ::std::cout ) const
	{ os << to_bool(); }

protected:

    int          m_index;
    sc_unsigned* m_obj_p;

private: // disabled
    const sc_unsigned_bitref_r& operator = ( const sc_unsigned_bitref_r& );
};



inline
::std::ostream&
operator<<( ::std::ostream&, const sc_unsigned_bitref_r& );


// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned_bitref
//
//  Proxy class for sc_unsigned bit selection (r-value and l-value).
// ----------------------------------------------------------------------------

class SC_API sc_unsigned_bitref
    : public sc_unsigned_bitref_r
{
    friend class sc_unsigned;
    friend class sc_core::sc_vpool<sc_unsigned_bitref>;


protected: // construction

    sc_unsigned_bitref() : sc_unsigned_bitref_r()
        {}

public:

    // copy constructor

    sc_unsigned_bitref( const sc_unsigned_bitref& a )
	: sc_unsigned_bitref_r( a )
	{}


    // assignment operators

    const sc_unsigned_bitref& operator = ( const sc_unsigned_bitref_r& );
    const sc_unsigned_bitref& operator = ( const sc_unsigned_bitref& );
    const sc_unsigned_bitref& operator = ( bool );

    const sc_unsigned_bitref& operator &= ( bool );
    const sc_unsigned_bitref& operator |= ( bool );
    const sc_unsigned_bitref& operator ^= ( bool );

    // concatenation methods

    virtual void concat_set(int64 src, int low_i);
    virtual void concat_set(const sc_signed& src, int low_i);
    virtual void concat_set(const sc_unsigned& src, int low_i);
    virtual void concat_set(uint64 src, int low_i);


    // other methods

    void scan( ::std::istream& is = ::std::cin );

};



inline
::std::istream&
operator>>( ::std::istream&, sc_unsigned_bitref& );


// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned_subref_r
//
//  Proxy class for sc_unsigned part selection (r-value only).
// ----------------------------------------------------------------------------

class SC_API sc_unsigned_subref_r : public sc_value_base
{
    friend class sc_signed;
    friend class sc_unsigned;
    friend class sc_unsigned_signal;

protected:

    // constructor

    sc_unsigned_subref_r() : sc_value_base(), m_left(0), m_obj_p(0), m_right(0)
	{}

    void initialize( const sc_unsigned* obj_p, int left_, int right_ )
	{
	    m_obj_p = const_cast<sc_unsigned*>( obj_p );
	    m_left = left_;
	    m_right = right_;
	}

public:

    // destructor

    virtual ~sc_unsigned_subref_r()
	{}


    // copy constructor

    sc_unsigned_subref_r( const sc_unsigned_subref_r& a )
	: sc_value_base(a), m_left( a.m_left ), m_obj_p( a.m_obj_p ),
	  m_right( a.m_right )
	{}


    // capacity

    int length() const
	{ return m_left >= m_right ? (m_left-m_right+1) : (m_right-m_left+1 ); }


    // implicit conversion to sc_unsigned

    operator sc_unsigned () const;


    // explicit conversions

    double               to_double() const;
    inline int           to_int() const;
    inline unsigned int  to_uint() const;
    inline long          to_long() const;
    inline unsigned long to_ulong() const;
    inline int64         to_int64() const;
    inline uint64        to_uint64() const;


    // explicit conversion to character string

    const std::string to_string( sc_numrep numrep = SC_DEC ) const;
    const std::string to_string( sc_numrep numrep, bool w_prefix ) const;


    // shift operators

    inline sc_unsigned operator<<( int v ) const;
    inline sc_unsigned operator<<(const sc_signed&    v) const;
    inline sc_unsigned operator<<(const sc_unsigned&  v) const;

    inline sc_unsigned operator>>( int v ) const;
    inline sc_unsigned operator>>(const sc_signed&    v) const;
    inline sc_unsigned operator>>(const sc_unsigned&  v) const;

    // concatenation support

    virtual int concat_length(bool* xz_present_p) const
	{
	    if ( xz_present_p ) *xz_present_p = false;
	    return m_left - m_right + 1;
	}
    virtual uint64 concat_get_uint64() const;
    virtual bool concat_get_ctrl( sc_digit* dst_p, int low_i ) const;
    virtual bool concat_get_data( sc_digit* dst_p, int low_i ) const;

    // reduce methods

    bool and_reduce() const;
    bool nand_reduce() const;
    bool or_reduce() const;
    bool nor_reduce() const;
    bool xor_reduce() const ;
    bool xnor_reduce() const;

    // other methods

    void print( ::std::ostream& os = ::std::cout ) const
	{ os << to_string(sc_io_base(os,SC_DEC),sc_io_show_base(os)); }
 protected:
    uint64 to_uint64_reversed() const;

protected:

    int          m_left;   // Left-most bit in this part selection.
    sc_unsigned* m_obj_p;  // Target of this part selection.
    int          m_right;  // Right-most bit in this part selection.

private: // disabled
    const sc_unsigned_subref_r& operator = ( const sc_unsigned_subref_r& );
};

// functional notation for the reduce methods

inline bool and_reduce( const sc_unsigned_subref_r& a ) {
    return a.and_reduce();
}

inline bool nand_reduce( const sc_unsigned_subref_r& a ) {
    return a.nand_reduce();
}

inline bool or_reduce( const sc_unsigned_subref_r& a ) {
    return a.or_reduce();
}

inline bool nor_reduce( const sc_unsigned_subref_r& a ) {
    return a.nor_reduce();
}

inline bool xor_reduce( const sc_unsigned_subref_r& a ) {
    return a.xor_reduce();
}

inline bool xnor_reduce( const sc_unsigned_subref_r& a ) {
    return a.xnor_reduce();
}


inline
::std::ostream&
operator<<( ::std::ostream&, const sc_unsigned_subref_r& );



// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned_subref
//
//  Proxy class for sc_unsigned part selection (r-value and l-value).
// ----------------------------------------------------------------------------

class SC_API sc_unsigned_subref
    : public sc_unsigned_subref_r
{
    friend class sc_unsigned;
    friend class sc_core::sc_vpool<sc_unsigned_subref>;


    // constructor

protected:
    sc_unsigned_subref() : sc_unsigned_subref_r()
	{}

public:

    // copy constructor

    sc_unsigned_subref( const sc_unsigned_subref& a )
	: sc_unsigned_subref_r( a )
	{}

    // assignment operators

    const sc_unsigned_subref& operator = ( const sc_unsigned_subref_r& a );
    const sc_unsigned_subref& operator = ( const sc_unsigned_subref& a );
    const sc_unsigned_subref& operator = ( const sc_unsigned& a );

    template<class T>
    const sc_unsigned_subref& operator = ( const sc_generic_base<T>& a );
    const sc_unsigned_subref& operator = ( const sc_signed_subref_r& a );
    const sc_unsigned_subref& operator = ( const sc_signed& a );

    const sc_unsigned_subref& operator = ( const char* a );
    const sc_unsigned_subref& operator = ( unsigned long a );
    const sc_unsigned_subref& operator = ( long a );

    const sc_unsigned_subref& operator = ( unsigned int a )
	{ return operator = ( (unsigned long) a ); }

    const sc_unsigned_subref& operator = ( int a )
	{ return operator = ( (long) a ); }

    const sc_unsigned_subref& operator = ( uint64 a );
    const sc_unsigned_subref& operator = ( int64 a );
    const sc_unsigned_subref& operator = ( double a );
    const sc_unsigned_subref& operator = ( const sc_int_base& a );
    const sc_unsigned_subref& operator = ( const sc_uint_base& a );
    const sc_unsigned_subref& operator = ( const sc_bv_base& );
    const sc_unsigned_subref& operator = ( const sc_lv_base& );

    // concatenation methods

    virtual void concat_set(int64 src, int low_i);
    virtual void concat_set(const sc_signed& src, int low_i);
    virtual void concat_set(const sc_unsigned& src, int low_i);
    virtual void concat_set(uint64 src, int low_i);

    // other methods

    void scan( ::std::istream& is = ::std::cin );

};


inline
::std::istream&
operator>>( ::std::istream&, sc_unsigned_subref& );


// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned
//
//  Arbitrary precision unsigned number.
// ----------------------------------------------------------------------------

class SC_API sc_unsigned : public sc_value_base
{
    friend class sc_concatref;
    friend class sc_unsigned_bitref_r;
    friend class sc_unsigned_bitref;
    friend class sc_unsigned_subref_r;
    friend class sc_unsigned_subref;
    friend class sc_signed;
    friend class sc_signed_subref;
    friend class sc_signed_subref_r;
    template<int W> friend class sc_bigint;
    template<int W> friend class sc_biguint;
    template<int W> friend class sc_int;
    template<int W> friend class sc_uint;

  // Needed for types using sc_unsigned.
  typedef bool elemtype;

public:
    enum { SIGNED=0 };

public:

    // constructors

    explicit inline sc_unsigned( int nb = sc_length_param().len() );
#if !defined(SC_BIGINT_CONFIG_BASE_CLASS_HAS_STORAGE)
    explicit inline sc_unsigned( int nb, sc_digit* digits_p );
#endif // !defined(SC_BIGINT_CONFIG_BASE_CLASS_HAS_STORAGE)
    sc_unsigned( const sc_unsigned& v );
    sc_unsigned( const sc_signed&   v );
	template<class T>
    explicit sc_unsigned( const sc_generic_base<T>& v );
    explicit sc_unsigned( const sc_bv_base& v );
    explicit sc_unsigned( const sc_lv_base& v );
    explicit sc_unsigned( const sc_int_subref_r& v );
    explicit sc_unsigned( const sc_uint_subref_r& v );
    explicit sc_unsigned( const sc_signed_subref_r& v );
    explicit sc_unsigned( const sc_unsigned_subref_r& v );



    // assignment operators

    const sc_unsigned& operator = (const sc_unsigned&        v);
    inline const sc_unsigned& operator = (const sc_unsigned_subref_r& a );

    template<class T>
    const sc_unsigned& operator = ( const sc_generic_base<T>& a )
        { a->to_sc_unsigned(*this); return *this; }

    const sc_unsigned& operator = (const sc_signed&          v);
    inline const sc_unsigned& operator = (const sc_signed_subref_r& a );

    const sc_unsigned& operator = ( const char*               v);
    const sc_unsigned& operator = ( int64                     v);
    const sc_unsigned& operator = ( uint64                    v);
    const sc_unsigned& operator = ( long                      v);
    const sc_unsigned& operator = ( unsigned long             v);

    const sc_unsigned& operator = ( int                       v)
	{ return operator=((long) v); }

    const sc_unsigned& operator = ( unsigned int              v)
	{ return operator=((unsigned long) v); }

    const sc_unsigned& operator = ( double                    v);
    const sc_unsigned& operator = ( const sc_int_base&        v);
    const sc_unsigned& operator = ( const sc_uint_base&       v);

    const sc_unsigned& operator = ( const sc_bv_base& );
    const sc_unsigned& operator = ( const sc_lv_base& );

#ifdef SC_INCLUDE_FX
    const sc_unsigned& operator = ( const sc_fxval& );
    const sc_unsigned& operator = ( const sc_fxval_fast& );
    const sc_unsigned& operator = ( const sc_fxnum& );
    const sc_unsigned& operator = ( const sc_fxnum_fast& );
#endif


    // destructor:

    ~sc_unsigned()
        {
            if ( digit_is_allocated() ) { delete [] digit; }
        }

    // Concatenation support:

    sc_digit* get_raw() const { return digit; }
    virtual int concat_length(bool* xz_present_p) const
       { if ( xz_present_p ) *xz_present_p = false; return nbits-1; }
    virtual bool concat_get_ctrl( sc_digit* dst_p, int low_i ) const;
    virtual bool concat_get_data( sc_digit* dst_p, int low_i ) const;
    virtual uint64 concat_get_uint64() const;
    virtual void concat_set(int64 src, int low_i);
    virtual void concat_set(const sc_signed& src, int low_i);
    virtual void concat_set(const sc_unsigned& src, int low_i);
    virtual void concat_set(uint64 src, int low_i);

    // Increment operators.

    sc_unsigned& operator ++ ();
    inline sc_unsigned operator ++ (int);

    // Decrement operators.

    sc_unsigned& operator -- ();
    inline sc_unsigned operator -- (int);

    void invalid_init( const char* type_name, int nb ) const;

    // bit selection

    inline void check_index( int i ) const
        { if ( (i < 0) || (i >= nbits-1) ) invalid_index(i); }

    void invalid_index( int i ) const;

    sc_unsigned_bitref* temporary_bitref() const
    {
        static sc_core::sc_vpool<sc_unsigned_bitref> pool(9);
        return pool.allocate();
    }

    sc_unsigned_bitref& operator [] ( int i )
        {
            check_index(i);
            sc_unsigned_bitref* result_p = temporary_bitref();
            result_p->initialize( this, i );
            return *result_p;
        }

    const sc_unsigned_bitref_r& operator [] ( int i ) const
        {
            check_index(i);
            sc_unsigned_bitref* result_p = temporary_bitref();
            result_p->initialize( this, i );
            return *result_p;
        }

    sc_unsigned_bitref& bit( int i )
        {
            check_index(i);
            sc_unsigned_bitref* result_p = temporary_bitref();
            result_p->initialize( this, i );
            return *result_p;
        }

    const sc_unsigned_bitref_r& bit( int i ) const
        {
            check_index(i);
            sc_unsigned_bitref* result_p = temporary_bitref();
            result_p->initialize( this, i );
            return *result_p;
        }


    // part selection

    // Subref operators. Help access the range of bits from the ith to
    // jth. These indices have arbitrary precedence with respect to each
    // other, i.e., we can have i <= j or i > j. Note the equivalence
    // between range(i, j) and operator (i, j). Also note that
    // operator (i, i) returns an unsigned number that corresponds to the
    // bit operator [i], so these two forms are not the same.

    inline void check_range( int l, int r ) const
        {
            if ( l < r )
            {
                if ( (l < 0) || (r >= nbits-1) ) invalid_range(l,r);
            }
            else
            {
                if ( (r < 0) || (l >= nbits-1) ) invalid_range(l,r);
            }
        }

    void invalid_range( int l, int r ) const;

    sc_unsigned_subref* temporary_subref() const
    {
        static sc_core::sc_vpool<sc_unsigned_subref> pool(9);
        return pool.allocate();
    }

    sc_unsigned_subref& range( int i, int j )
        {
            check_range(i,j);
            sc_unsigned_subref* result_p = temporary_subref();
            result_p->initialize( this, i, j );
            return *result_p;
        }

    const sc_unsigned_subref_r& range( int i, int j ) const
        {
            check_range(i,j);
            sc_unsigned_subref* result_p = temporary_subref();
            result_p->initialize( this, i, j );
            return *result_p;
        }

    sc_unsigned_subref& operator () ( int i, int j )
        {
            check_range(i,j);
            sc_unsigned_subref* result_p = temporary_subref();
            result_p->initialize( this, i, j );
            return *result_p;
        }

    const sc_unsigned_subref_r& operator () ( int i, int j ) const
        {
            check_range(i,j);
            sc_unsigned_subref* result_p = temporary_subref();
            result_p->initialize( this, i, j );
            return *result_p;
        }

    // temporary for concatenation:

    static sc_unsigned* temporary()
    {
        static sc_core::sc_vpool<sc_unsigned> pool(9);
        return pool.allocate();
    }

    // explicit conversions

    inline int           to_int() const;
    inline unsigned int  to_uint() const;
    inline long          to_long() const;
    inline unsigned long to_ulong() const;
    inline int64         to_int64() const;
    inline uint64        to_uint64() const;
    double               to_double() const;

    //inline operator bool() const { return to_uint64(); }

#ifdef SC_DT_DEPRECATED
    int to_signed() const
	{ return to_int(); }

    unsigned int to_unsigned() const
	{ return to_uint(); }
#endif

    // explicit conversion to character string

    const std::string to_string( sc_numrep numrep = SC_DEC ) const;
    const std::string to_string( sc_numrep numrep, bool w_prefix ) const;

    // Print functions. dump prints the internals of the class.

    void print( ::std::ostream& os = ::std::cout ) const
	{ os << to_string(sc_io_base(os,SC_DEC),sc_io_show_base(os)); }

    void scan( ::std::istream& is = ::std::cin );

    void dump( ::std::ostream& os = ::std::cout ) const;


  // Functions to find various properties.
  int  length() const { return nbits - 1; }  // Bit width.
  bool iszero() const;                       // Is the number zero?
  bool sign() const { return 0; }            // Sign.

    // reduce methods

    bool and_reduce() const;

    bool nand_reduce() const
        { return ( ! and_reduce() ); }

    bool or_reduce() const;

    bool nor_reduce() const
        { return ( ! or_reduce() ); }

    bool xor_reduce() const;

    bool xnor_reduce() const
        { return ( ! xor_reduce() ); }


  // Functions to access individual bits.

    // Set the ith bit with 1.
    inline
    void
    set(int i)
    {
      if (check_if_outside(i))
	return;

      int bit_num = SC_BIT_INDEX(i);
      int digit_num = SC_DIGIT_INDEX(i);

      digit[digit_num] |= one_and_zeros(bit_num);
      digit[digit_num] = SC_MASK_DIGIT(digit[digit_num]);
    }


    // Set the ith bit with 0, i.e., clear the ith bit.
    inline
    void
    clear(int i)
    {
      if (check_if_outside(i))
	return;

      int bit_num = SC_BIT_INDEX(i);
      int digit_num = SC_DIGIT_INDEX(i);

      digit[digit_num] &= ~(one_and_zeros(bit_num));
      digit[digit_num] = SC_MASK_DIGIT(digit[digit_num]);
    }

    // Return true if the bit i is 1, false otherwise. If i is outside the
    // bounds, return 1/0 according to the sign of the number by assuming
    // that the number has infinite length.

    inline
    bool
    test(int i) const
    {
      if (check_if_outside(i))
	return 0;

      int bit_num = SC_BIT_INDEX(i);
      int digit_num = SC_DIGIT_INDEX(i);

	return ((digit[digit_num] & one_and_zeros(bit_num)) != 0);
    }

  void set(int i, bool v)      // Set the ith bit to v.
    { if (v) set(i); else clear(i);  }
  void invert(int i)           // Negate the ith bit.
    { if (test(i)) clear(i); else set(i);  }

  // Make the number equal to its mirror image.
  void reverse();

  // Get/set a packed bit representation of the number.
  void get_packed_rep(sc_digit *buf) const;
  void set_packed_rep(sc_digit *buf);

  /*
    The comparison of the old and new semantics are as follows:

    Let s = sc_signed,
        u = sc_unsigned,
        un = { uint64, unsigned long, unsigned int },
        sn = { int64, long, int, char* }, and
        OP = { +, -, *, /, % }.

    Old semantics:                     New semantics:
      u OP u -> u                        u OP u -> u
      s OP u -> u                        s OP u -> s
      u OP s -> u                        u OP s -> s
      s OP s -> s                        s OP s -> s

      u OP un = un OP u -> u             u OP un = un OP u -> u
      u OP sn = sn OP u -> u             u OP sn = sn OP u -> s

      s OP un = un OP s -> s             s OP un = un OP s -> s
      s OP sn = sn OP s -> s             s OP sn = sn OP s -> s

    In the new semantics, the result is u if both operands are u; the
    result is s otherwise. The only exception is subtraction. The result
    of a subtraction is always s.

    The old semantics is like C/C++ semantics on integer types; the
    new semantics is due to the VSIA C/C++ data types standard.
   */

    // FRIEND DECLARATIONS:

#   define SCFP friend
#   include "sc_unsigned_friends.h"
#   undef SCFP

  // SELF-REFERENCING OPERATORS:
  //
  inline sc_unsigned& operator += (const sc_signed&    v);
  inline sc_unsigned& operator += (const sc_unsigned&  v);
  inline sc_unsigned& operator += (int64               v);
  inline sc_unsigned& operator += (uint64              v);
  inline sc_unsigned& operator += (long                v);
  inline sc_unsigned& operator += (unsigned long       v);
  inline sc_unsigned& operator += (int                 v);
  inline sc_unsigned& operator += (unsigned int        v);
  inline sc_unsigned& operator += (const sc_int_base&  v);
  inline sc_unsigned& operator += (const sc_uint_base& v);

  inline sc_unsigned& operator -= (const sc_signed&    v);
  inline sc_unsigned& operator -= (const sc_unsigned&  v);
  inline sc_unsigned& operator -= (int64               v);
  inline sc_unsigned& operator -= (uint64              v);
  inline sc_unsigned& operator -= (long                v);
  inline sc_unsigned& operator -= (unsigned long       v);
  inline sc_unsigned& operator -= (int                 v);
  inline sc_unsigned& operator -= (unsigned int        v);
  inline sc_unsigned& operator -= (const sc_int_base&  v);
  inline sc_unsigned& operator -= (const sc_uint_base& v);

  inline sc_unsigned& operator *= (const sc_signed&    v);
  inline sc_unsigned& operator *= (const sc_unsigned&  v);
  inline sc_unsigned& operator *= (int64               v);
  inline sc_unsigned& operator *= (uint64              v);
  inline sc_unsigned& operator *= (long                v);
  inline sc_unsigned& operator *= (unsigned long       v);
  inline sc_unsigned& operator *= (int                 v);
  inline sc_unsigned& operator *= (unsigned int        v);
  inline sc_unsigned& operator *= (const sc_int_base&  v);
  inline sc_unsigned& operator *= (const sc_uint_base& v);

  inline sc_unsigned& operator /= (const sc_signed&    v);
  inline sc_unsigned& operator /= (const sc_unsigned&  v);
  inline sc_unsigned& operator /= (int64               v);
  inline sc_unsigned& operator /= (uint64              v);
  inline sc_unsigned& operator /= (long                v);
  inline sc_unsigned& operator /= (unsigned long       v);
  inline sc_unsigned& operator /= (int                 v);
  inline sc_unsigned& operator /= (unsigned int        v);
  inline sc_unsigned& operator /= (const sc_int_base&  v);
  inline sc_unsigned& operator /= (const sc_uint_base& v);

  inline sc_unsigned& operator %= (const sc_signed&    v);
  inline sc_unsigned& operator %= (const sc_unsigned&  v);
  inline sc_unsigned& operator %= (int64               v);
  inline sc_unsigned& operator %= (uint64              v);
  inline sc_unsigned& operator %= (long                v);
  inline sc_unsigned& operator %= (unsigned long       v);
  inline sc_unsigned& operator %= (int                 v);
  inline sc_unsigned& operator %= (unsigned int        v);
  inline sc_unsigned& operator %= (const sc_int_base&  v);
  inline sc_unsigned& operator %= (const sc_uint_base& v);

  inline sc_unsigned& operator &= (const sc_signed&    v);
  inline sc_unsigned& operator &= (const sc_unsigned&  v);
  inline sc_unsigned& operator &= (int64               v);
  inline sc_unsigned& operator &= (uint64              v);
  inline sc_unsigned& operator &= (long                v);
  inline sc_unsigned& operator &= (unsigned long       v);
  inline sc_unsigned& operator &= (int                 v);
  inline sc_unsigned& operator &= (unsigned int        v);
  inline sc_unsigned& operator &= (const sc_int_base&  v);
  inline sc_unsigned& operator &= (const sc_uint_base& v);

  inline sc_unsigned& operator |= (const sc_signed&    v);
  inline sc_unsigned& operator |= (const sc_unsigned&  v);
  inline sc_unsigned& operator |= (int64               v);
  inline sc_unsigned& operator |= (uint64              v);
  inline sc_unsigned& operator |= (long                v);
  inline sc_unsigned& operator |= (unsigned long       v);
  inline sc_unsigned& operator |= (int                 v);
  inline sc_unsigned& operator |= (unsigned int        v);
  inline sc_unsigned& operator |= (const sc_int_base&  v);
  inline sc_unsigned& operator |= (const sc_uint_base& v);

  inline sc_unsigned& operator ^= (const sc_signed&    v);
  inline sc_unsigned& operator ^= (const sc_unsigned&  v);
  inline sc_unsigned& operator ^= (int64               v);
  inline sc_unsigned& operator ^= (uint64              v);
  inline sc_unsigned& operator ^= (long                v);
  inline sc_unsigned& operator ^= (unsigned long       v);
  inline sc_unsigned& operator ^= (int                 v);
  inline sc_unsigned& operator ^= (unsigned int        v);
  inline sc_unsigned& operator ^= (const sc_int_base&  v);
  inline sc_unsigned& operator ^= (const sc_uint_base& v);

  // LEFT SHIFT operators:

  inline
  sc_unsigned
  operator<<(int v) const
  {
    if (v <= 0)
      return sc_unsigned(*this);

    int nb = nbits + v;
    int nd = DIV_CEIL(nb);
    sc_unsigned result(nb, false);

    vector_shift_left( ndigits, digit, nd, result.digit, v );
    result.adjust_hod();

    return result;
  }

  sc_unsigned operator<<(const sc_signed&    v) const;
  sc_unsigned operator<<(const sc_unsigned&  v) const { return operator<<( v.to_int() ); }
  sc_unsigned operator<<(int64               v) const { return operator<<( (int)v ); }
  sc_unsigned operator<<(uint64              v) const { return operator<<( (int)v ); }
  sc_unsigned operator<<(long                v) const { return operator<<( (int)v ); }
  sc_unsigned operator<<(unsigned long       v) const { return operator<<( (int)v ); }
  sc_unsigned operator<<(unsigned int        v) const { return operator<<( (int)v ); }

  const sc_unsigned&
  operator<<=(int v)
  {
    if (v <= 0)
      return *this;

    vector_shift_left( ndigits, digit, v );
    adjust_hod();

    return *this;
  }
  const sc_unsigned& operator<<=(const sc_signed&    v);
  const sc_unsigned& operator<<=(const sc_unsigned&  v) { return operator<<=( v.to_int() ); }
  const sc_unsigned& operator<<=(int64               v) { return operator<<=((int) v); }
  const sc_unsigned& operator<<=(uint64              v) { return operator<<=((int) v); }
  const sc_unsigned& operator<<=(long                v) { return operator<<=((int) v); }
  const sc_unsigned& operator<<=(unsigned long       v) { return operator<<=((int) v); }
  const sc_unsigned& operator<<=(unsigned int        v) { return operator<<=((int) v); }

  // RIGHT SHIFT operators:

  inline
  sc_unsigned
  operator>>(int v) const
  {
      if (v <= 0) {
          return sc_unsigned(*this);
      }
      int nb = nbits - v;

      // If we shift off the end return the sign bit.

      if ( 0 >= nb ) {
          sc_unsigned result(1, true);
          return result;
      }

      // Return a value that is the width of the shifted value:

      sc_unsigned result(nb, false);
      if ( nbits < 33 ) {
          result.digit[0] = (int)digit[0] >> v;
      }
      else if ( nbits < 65 ) {
          int64 tmp = digit[1];
          tmp = (tmp << 32) | digit[0];
          tmp = tmp >> v;
          result.digit[0] = (sc_digit)tmp;
          if ( nb > 32 ) {
              result.digit[1] = (tmp >>32);
          }
      }
      else {
          vector_extract(digit, result.digit, nbits-1, v);
      }
      result.adjust_hod();
      return result;
  }

  sc_unsigned operator>>(const sc_signed&  v) const;
  sc_unsigned operator>>(const sc_unsigned&  v) const { return operator>>( v.to_int() ); }
  sc_unsigned operator>>(int64               v) const { return operator>>( (int)v ); }
  sc_unsigned operator>>(uint64              v) const { return operator>>( (int)v ); }
  sc_unsigned operator>>(long                v) const { return operator>>( (int)v ); }
  sc_unsigned operator>>(unsigned long       v) const { return operator>>( (int)v ); }
  sc_unsigned operator>>(unsigned int        v) const { return operator>>( (int)v ); }

  const sc_unsigned&
  operator>>=(int v)
  {
      if (v <= 0)
          return *this;
      vector_shift_right(ndigits, digit, v, 0);
    return *this;
  }
  const sc_unsigned& operator>>=(const sc_signed&    v);
  const sc_unsigned& operator>>=(const sc_unsigned&  v) { return operator>>=(v.to_int()); }
  const sc_unsigned& operator>>=(int64               v) { return operator>>=((int)v); }
  const sc_unsigned& operator>>=(uint64              v) { return operator>>=((int)v); }
  const sc_unsigned& operator>>=(long                v) { return operator>>=((int)v); }
  const sc_unsigned& operator>>=(unsigned long       v) { return operator>>=((int)v); }
  const sc_unsigned& operator>>=(unsigned int        v) { return operator>>=((int)v); }

  // Unary arithmetic operators

  friend SC_API sc_unsigned operator + (const sc_unsigned& u);
  friend SC_API sc_signed operator - (const sc_unsigned& u);

  // Bitwise NOT operator (unary).

  friend SC_API sc_signed operator ~ (const sc_unsigned& u);

protected:

  int      nbits;                                                  // number of bits in use.
  int      ndigits;                                                // number words in 'digits'
  sc_digit *digit;                                                 // storage for our value.
  sc_digit base_vec[SC_BASE_VEC_DIGITS>0?SC_BASE_VEC_DIGITS:1]; // make small values faster.

#if !defined(SC_BIGINT_CONFIG_BASE_CLASS_HAS_STORAGE)
  bool m_free; // true if should free 'digit'.
public:
  inline bool digit_is_allocated() const { return m_free; }
#else
public:
  inline bool digit_is_allocated() const { return digit != (sc_digit*)base_vec; }
#endif

#if defined(SC_BIGINT_CONFIG_TEMPLATE_CLASS_HAS_NO_BASE_CLASS)

public: // Temporary object support:

  #define SC_UNSIGNED_TEMPS_N (1 << 15) // SC_UNSIGNED_TEMPS_N must be a power of 2.

  static sc_unsigned  m_temporaries[SC_UNSIGNED_TEMPS_N];
  static size_t       m_temporaries_i;

  static inline sc_unsigned& allocate_temporary( int nb, sc_digit* digits_p )
  {
      sc_unsigned* result_p = &m_temporaries[m_temporaries_i];
      m_temporaries_i = (m_temporaries_i + 1) & (SC_UNSIGNED_TEMPS_N-1);
      result_p->digit = digits_p;
      result_p->nbits = num_bits(nb);
      result_p->ndigits = DIV_CEIL(result_p->nbits);
#if !defined(SC_BIGINT_CONFIG_BASE_CLASS_HAS_STORAGE)
      result_p->m_free = false;
#endif
      return *result_p;
  }

#endif // defined(SC_BIGINT_CONFIG_TEMPLATE_CLASS_HAS_NO_BASE_CLASS)

  inline void adjust_hod()
  {
      sc_digit tmp = 0;
      tmp = ~tmp;
      unsigned shift = SC_BIT_INDEX( nbits-1 );
      digit[ndigits-1] &= ~(tmp << shift);
  }

public: // back door access:
  inline int        get_actual_length() const { return nbits; }
  inline sc_digit*  get_digits() const        { return digit; }
  inline sc_digit*  get_digits()              { return digit; }
  inline int        get_digits_n() const      { return ndigits; }
  inline int        get_hod() const           { return ndigits-1; }

private:
  // Private constructors:

  // Constructor for sc_biguint<W>

  explicit sc_unsigned( int nb, bool zero );

  // Create a copy of v with sign s.
  sc_unsigned(const sc_unsigned& v, small_type s);
  sc_unsigned(const sc_signed&   v, small_type s);

  // Private member functions. The called functions are inline functions.

  static int num_bits(int nb) { return nb + 1; }

  bool check_if_outside(int bit_num) const;

  void makezero() { vector_zero( 0, ndigits, digit ); }

  public: // sc_ac back door:
    sc_digit*  get_raw()                       { return digit; }
    int        get_raw_nbits() const           { return nbits; }
};


// functional notation for the reduce methods

inline bool and_reduce( const sc_unsigned& a ) { return a.and_reduce(); }

inline bool nand_reduce( const sc_unsigned& a ) { return a.nand_reduce(); }

inline bool or_reduce( const sc_unsigned& a ) { return a.or_reduce(); }

inline bool nor_reduce( const sc_unsigned& a ) { return a.nor_reduce(); }

inline bool xor_reduce( const sc_unsigned& a ) { return a.xor_reduce(); }

inline bool xnor_reduce( const sc_unsigned& a ) { return a.xnor_reduce(); }




inline
::std::ostream&
operator<<( ::std::ostream&, const sc_unsigned& );

inline
::std::istream&
operator>>( ::std::istream&, sc_unsigned& );


// IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII

// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned_bitref_r
//
//  Proxy class for sc_unsigned bit selection (r-value only).
// ----------------------------------------------------------------------------


inline
::std::ostream&
operator<<( ::std::ostream& os, const sc_unsigned_bitref_r& a )
{
    a.print( os );
    return os;
}


// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned_bitref
//
//  Proxy class for sc_unsigned bit selection (r-value and l-value).
// ----------------------------------------------------------------------------

template<class T>
inline const sc_unsigned_subref& sc_unsigned_subref::operator = (
    const sc_generic_base<T>& a )
{
    sc_unsigned temp( length() );
    a->to_sc_unsigned(temp);
    return *this = temp;
}

inline
::std::istream&
operator>>( ::std::istream& is, sc_unsigned_bitref& a )
{
    a.scan( is );
    return is;
}


// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned_subref_r
//
//  Proxy class for sc_unsigned part selection (r-value only).
// ----------------------------------------------------------------------------

// reduce methods

inline bool sc_unsigned_subref_r::and_reduce() const
{
   const sc_unsigned* target_p = m_obj_p;
   for ( int i = m_right; i <= m_left; i++ )
	if ( !target_p->test(i) ) return false;
   return true;
}

inline bool sc_unsigned_subref_r::nand_reduce() const
{
    return !and_reduce();
}

inline bool sc_unsigned_subref_r::or_reduce() const
{
   const sc_unsigned* target_p = m_obj_p;
   for ( int i = m_right; i <= m_left; i++ )
	if ( target_p->test(i) ) return true;
   return false;
}

inline bool sc_unsigned_subref_r::nor_reduce() const
{
    return !or_reduce();
}

inline bool sc_unsigned_subref_r::xor_reduce() const
{
   int                odd;
   const sc_unsigned* target_p = m_obj_p;
   odd = 0;
   for ( int i = m_right; i <= m_left; i++ )
	if ( target_p->test(i) ) odd = ~odd;
   return odd ? true : false;
}

inline bool sc_unsigned_subref_r::xnor_reduce() const
{
    return !xor_reduce();
}


inline
::std::ostream&
operator<<( ::std::ostream& os, const sc_unsigned_subref_r& a )
{
    a.print( os );
    return os;
}


// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned_subref
//
//  Proxy class for sc_unsigned part selection (r-value and l-value).
// ----------------------------------------------------------------------------

// assignment operators

inline
const sc_unsigned_subref&
sc_unsigned_subref::operator = ( const char* a )
{
    sc_unsigned aa( length() );
    return ( *this = aa = a );
}


inline
::std::istream&
operator>>( ::std::istream& is, sc_unsigned_subref& a )
{
    a.scan( is );
    return is;
}



// ----------------------------------------------------------------------------
//  CLASS : sc_unsigned
//
//  Arbitrary precision signed number.
// ----------------------------------------------------------------------------

template<class T>
sc_unsigned::sc_unsigned( const sc_generic_base<T>& v )
{
    int nb = v->length();
    if( nb > 0 ) {
        nbits = num_bits( nb );
    } else {
        char msg[BUFSIZ];
        std::snprintf(msg, sizeof(msg),
		    "sc_unsigned( sc_generic_base<T> ) : nb = %d is not valid", nb);
        SC_REPORT_ERROR( sc_core::SC_ID_INIT_FAILED_, msg );
    }
    ndigits = DIV_CEIL(nbits);
    if ( ndigits > SC_BASE_VEC_DIGITS ) {
	digit = new sc_digit[ndigits];
	SC_FREE_DIGIT(true)
    }
    else {
	digit = base_vec;
	SC_FREE_DIGIT(false)
    }
    makezero();
    v->to_sc_unsigned(*this);
}


inline
::std::ostream&
operator<<( ::std::ostream& os, const sc_unsigned& a )
{
    a.print( os );
    return os;
}

inline
::std::istream&
operator>>( ::std::istream& is, sc_unsigned& a )
{
    a.scan( is );
    return is;
}

inline
uint64
sc_unsigned_subref_r::to_uint64() const
{
	int                right = m_right;
	if ( right > m_left ) { return to_uint64_reversed(); }
	sc_digit*          digits = m_obj_p->get_raw();
	int                adjust = right + 63;
	int                left = ( adjust < m_left ) ? adjust : m_left;
	int                left_hob;
	int                left_i = SC_DIGIT_INDEX(left);
	sc_digit           mask;
	int                right_i = SC_DIGIT_INDEX(right);
	int                right_lob;
	unsigned long long result;
	switch( left_i - right_i  )
	{
	  case 0: // all in same word.
	    mask = ~((sc_digit)-2<<(left-right));
	    right_lob = SC_BIT_INDEX(right);
	    result = (digits[right_i] >> right_lob) & mask;
	    break;
	  case 1: // in two words
	    left_hob = SC_BIT_INDEX(left);
	    right_lob = SC_BIT_INDEX(right);
	    mask = ~(((sc_digit)-2)<<left_hob);
	    result = digits[left_i]&mask;
	    result = (result << (BITS_PER_DIGIT-right_lob))  |
		     (digits[right_i]>>right_lob);
	  break;
	  default: // in three words
	    left_hob = SC_BIT_INDEX(left);
	    right_lob = SC_BIT_INDEX(right);
	    mask = ~(((sc_digit)-2)<<left_hob);
	    result = (digits[left_i]&mask);
	    result = (result << BITS_PER_DIGIT) | digits[right_i+1];
	    result = (result << (BITS_PER_DIGIT-right_lob)) |
		     (digits[right_i]>>right_lob);
	  break;
	}
	return result;
}

inline
int64
sc_unsigned_subref_r::to_int64() const
{
    return (int64)to_uint64();
}


inline
int
sc_unsigned_subref_r::to_int() const
{
    return (int)to_uint64();
}

inline
unsigned int
sc_unsigned_subref_r::to_uint() const
{
    return (unsigned int)to_uint64();
}

inline
long
sc_unsigned_subref_r::to_long() const
{
    return (long)to_uint64();
}

inline
unsigned long
sc_unsigned_subref_r::to_ulong() const
{
    return (unsigned long)to_uint64();
}

// +----------------------------------------------------------------------------
// |"sc_unsigned::to_XXXX"
// |
// | These functions return an object instance's value as the requested
// | native C++ type.
// |
// | Notes:
// |   (1) These are set up for BITS_PER_DIGIT == 32.
// | Result:
// |     Native C++ type containing the object instance's value.
// +----------------------------------------------------------------------------
inline
int64
sc_unsigned::to_int64() const
{
    int64 result;

    if ( ndigits == 1 ) {
        result =  digit[0];
    }
    else {
        result = ( (int64)digit[1] << BITS_PER_DIGIT ) | digit[0];
    }
    return result;
}

inline
uint64
sc_unsigned::to_uint64() const
{
    uint64 result;

    if ( ndigits == 1 ) {
        result =  digit[0];
    }
    else {
        result = ( (uint64)digit[1] << BITS_PER_DIGIT ) | digit[0];
    }
    return result;
}

inline
long
sc_unsigned::to_long() const
{
    long result;

    if ( sizeof(long) < 5 ) {
        result =  digit[0];
    }
    else {
        if ( ndigits == 1 ) {
            result =  digit[0];
        }
        else {
            result = ( (uint64)digit[1] << BITS_PER_DIGIT ) | digit[0];
        }
    }
    return result;
}


inline
unsigned long
sc_unsigned::to_ulong() const
{
    unsigned long result;

    if ( sizeof(unsigned long) < 5 ) {
        result =  digit[0];
    }
    else {
        if ( ndigits == 1 ) {
            result =  digit[0];
        }
        else {
            result = ( (uint64)digit[1] << BITS_PER_DIGIT ) | digit[0];
        }
    }
    return result;
}


inline
int
sc_unsigned::to_int() const
{
    int result;

    result =  (int)digit[0];
    return result;
}


inline
unsigned int
sc_unsigned::to_uint() const
{
    unsigned int result;

    result =  (unsigned int)digit[0];
    return result;
}


// +----------------------------------------------------------------------------
// |"sc_unsigned::sc_unsigned"
// |
// | This is the object constructor for sc_biguint<W>.
// |
// | Arguments:
// |     nb   = number of bits the object instance needs to support.
// |     zero = true if the object's digits should be zeroed.
// +----------------------------------------------------------------------------

inline
sc_unsigned::sc_unsigned( int nb, bool zero ) :
    nbits(nb+1), ndigits( DIV_CEIL(nb+1) )
{
    if ( ndigits <= SC_BASE_VEC_DIGITS ) {
        digit = base_vec;
	SC_FREE_DIGIT(false)
    }
    else {
        digit = new sc_digit[ndigits];
	SC_FREE_DIGIT(true)
    }
    if ( zero ) {
        makezero();
    }
}

#if !defined(SC_BIGINT_CONFIG_BASE_CLASS_HAS_STORAGE)
// +----------------------------------------------------------------------------
// |"sc_unsigned::sc_unsigned"
// |
// | This is the object constructor from sc_bigint<W>. It uses the supplied
// | value buffer, that will already have been initialized.
// |
// | Arguments:
// |     nb       = number of bits the object instance needs to support.
// |     digits_p = storage from sc_bigint<W> to use as our storage.
// +----------------------------------------------------------------------------
inline
sc_unsigned::sc_unsigned( int nb, sc_digit* digits_p ) :
    nbits(nb+1), ndigits( DIV_CEIL(nb+1) )
{
#   if defined(SC_BIGINT_CONFIG_TEMPLATE_CLASS_HAS_STORAGE)
        if ( ndigits <= SC_BASE_VEC_DIGITS ) {
            digit = base_vec;
        }
        else {
            digit = digits_p;
        }
	SC_FREE_DIGIT(false)
#   else // TEMPLATE_CLASS_HAS_NO_BASE_CLASS
        digit = digits_p;
        SC_FREE_DIGIT(false)
#   endif
}
#endif // !defined(SC_BIGINT_CONFIG_BASE_CLASS_HAS_STORAGE)

// +----------------------------------------------------------------------------
// |"sc_unsigned::sc_unsigned"
// |
// | This is the explicit object constructor for this class.
// |
// | Arguments:
// |     nb   = number of bits the object instance needs to support.
// |     zero = true if the object's digits should be zeroed.
// +----------------------------------------------------------------------------

inline
sc_unsigned::sc_unsigned( int nb ) :
    sc_value_base(), nbits(), ndigits(), digit()
{
    if( nb > 0 ) {
        nbits = num_bits( nb );
    } else {
        char msg[BUFSIZ];
        std::snprintf(msg, sizeof(msg), "%s::%s( int nb ) : nb = %d is not valid",
                 "sc_unsigned", "sc_unsigned", nb );
        SC_REPORT_ERROR( sc_core::SC_ID_INIT_FAILED_, msg );
    }
    ndigits = DIV_CEIL(nbits);
    if ( ndigits > SC_BASE_VEC_DIGITS ) {
        digit = new sc_digit[ndigits];
	SC_FREE_DIGIT(true)
    }
    else {
        digit = base_vec;
	SC_FREE_DIGIT(false)
    }
    makezero();
}


} // namespace sc_dt

#endif
