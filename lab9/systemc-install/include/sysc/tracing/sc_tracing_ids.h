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

  sc_tracing_ids.h -- Report ids for the tracing code.

  Original Author: Philipp A. Hartmann, OFFIS, 2013-11-17

  CHANGE LOG AT END OF FILE
 *****************************************************************************/

#ifndef SC_TRACING_IDS_H
#define SC_TRACING_IDS_H

#include "sysc/kernel/sc_cmnhdr.h"

// ----------------------------------------------------------------------------
//  Report ids (tracing)
//
//  Report ids in the range of 700-799.
// ----------------------------------------------------------------------------

#ifndef SC_DEFINE_MESSAGE
#define SC_DEFINE_MESSAGE(id,unused1,unused2) \
    namespace sc_core { extern SC_API const char id[]; }
#endif

SC_DEFINE_MESSAGE( SC_ID_TRACING_FOPEN_FAILED_,         701,
                   "cannot open trace file for writing" )

SC_DEFINE_MESSAGE( SC_ID_TRACING_TIMESCALE_DEFAULT_,    702,
                  "default timescale unit used for tracing" )
SC_DEFINE_MESSAGE( SC_ID_TRACING_TIMESCALE_UNIT_,       703,
                   "tracing timescale unit set" )
SC_DEFINE_MESSAGE( SC_ID_TRACING_VCD_DELTA_CYCLE_,      704,
   "VCD delta cycle tracing with pseudo timesteps (1 unit)" )
SC_DEFINE_MESSAGE( SC_ID_TRACING_INVALID_TIMESCALE_UNIT_, 705,
   "invalid tracing timescale unit set" )
/* unused IDs 706-709 */
SC_DEFINE_MESSAGE( SC_ID_TRACING_OBJECT_IGNORED_,       710,
                   "object cannot not be traced" )
SC_DEFINE_MESSAGE( SC_ID_TRACING_OBJECT_NAME_FILTERED_, 711,
                   "traced object name filtered" )
SC_DEFINE_MESSAGE( SC_ID_TRACING_INVALID_ENUM_VALUE_,   712,
                "traced value of enumerated type undefined" )
SC_DEFINE_MESSAGE( SC_ID_TRACING_VCD_TIME_RESOLUTION_,  713,
  "current kernel time is not representable in VCD time units" )
SC_DEFINE_MESSAGE( SC_ID_TRACING_REVERSED_TIME_,        714,
 "tracing cycle with duplicate or reversed time detected" )
SC_DEFINE_MESSAGE( SC_ID_TRACING_CLOSE_EMPTY_FILE_,     715,
 "trace file closed before any cycles were traced, file not written" )
/* unused IDs 716-719 */
SC_DEFINE_MESSAGE( SC_ID_TRACING_ALREADY_INITIALIZED_,  720,
                   "sc_trace_file already initialized" )


/*****************************************************************************

  MODIFICATION LOG - modifiers, enter your name, affiliation, date and
  changes you are making here.

      Name, Affiliation, Date:
  Description of Modification:

 *****************************************************************************/

#endif // SC_TRACING_IDS_H
// Taf!
