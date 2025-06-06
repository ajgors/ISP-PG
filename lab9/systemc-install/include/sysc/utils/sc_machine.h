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

  sc_machine.h -- Machine-dependent Environment Settings

  Original Author: Andy Goodrich, Forte Design Systems, Inc.

  CHANGE LOG AT END OF FILE
 *****************************************************************************/


#ifndef SC_MACHINE_H
#define SC_MACHINE_H

#include <climits>

// ----------------------------------------------------------------------------
//  Little or big endian machine?
// ----------------------------------------------------------------------------

#if defined(_MSC_VER) && !defined(__BYTE_ORDER__)
// Quoting from https://learn.microsoft.com/en-us/cpp/standard-library/bit-enum?view=msvc-170#remarks
//    All native scalar types are little-endian for the platforms that
//    Microsoft Visual C++ targets (x86, x64, ARM, ARM64).
#   define SC_LITTLE_ENDIAN
#elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
#   define SC_LITTLE_ENDIAN
#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
#   define SC_BIG_ENDIAN
#else
#   error "Could not detect the endianness of the CPU."
#endif

// ----------------------------------------------------------------------------
//  Are long data types 32-bit or 64-bit?
// ----------------------------------------------------------------------------

#if ULONG_MAX > 0xffffffffUL
#   define SC_LONG_64
#endif

// $Log: sc_machine.h,v $
// Revision 1.5  2011/08/26 22:58:23  acg
//  Torsten Maehne: changes for endian detection.
//
// Revision 1.4  2011/08/26 20:46:18  acg
//  Andy Goodrich: moved the modification log to the end of the file to
//  eliminate source line number skew when check-ins are done.
//
// Revision 1.3  2011/02/18 20:38:44  acg
//  Andy Goodrich: Updated Copyright notice.
//
// Revision 1.2  2010/09/06 16:35:09  acg
//  Andy Goodrich: changed i386 to __i386__ in ifdef.
//
// Revision 1.1.1.1  2006/12/15 20:20:06  acg
// SystemC 2.3
//
// Revision 1.3  2006/01/13 18:53:10  acg
// Andy Goodrich: Added $Log command so that CVS comments are reproduced in
// the source.
//

#endif // !defined(SC_MACHINE_H)
