// Generated by CIRCT firtool-1.66.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module TLSourceCombiner(
  input         clock,
  input         reset,
  output        auto_in_a_ready,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input         auto_in_a_valid,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [2:0]  auto_in_a_bits_opcode,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [2:0]  auto_in_a_bits_param,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [2:0]  auto_in_a_bits_size,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [8:0]  auto_in_a_bits_source,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [30:0] auto_in_a_bits_address,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [7:0]  auto_in_a_bits_mask,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [63:0] auto_in_a_bits_data,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input         auto_in_a_bits_corrupt,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input         auto_in_d_ready,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output        auto_in_d_valid,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [2:0]  auto_in_d_bits_opcode,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [1:0]  auto_in_d_bits_param,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [2:0]  auto_in_d_bits_size,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [8:0]  auto_in_d_bits_source,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output        auto_in_d_bits_sink,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output        auto_in_d_bits_denied,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [63:0] auto_in_d_bits_data,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output        auto_in_d_bits_corrupt,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input         auto_out_a_ready,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output        auto_out_a_valid,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [2:0]  auto_out_a_bits_opcode,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [2:0]  auto_out_a_bits_param,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [2:0]  auto_out_a_bits_size,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [9:0]  auto_out_a_bits_source,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [30:0] auto_out_a_bits_address,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [7:0]  auto_out_a_bits_mask,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output [63:0] auto_out_a_bits_data,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output        auto_out_a_bits_corrupt,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  output        auto_out_d_ready,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input         auto_out_d_valid,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [2:0]  auto_out_d_bits_opcode,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [1:0]  auto_out_d_bits_param,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [2:0]  auto_out_d_bits_size,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [9:0]  auto_out_d_bits_source,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input         auto_out_d_bits_sink,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input         auto_out_d_bits_denied,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input  [63:0] auto_out_d_bits_data,	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
  input         auto_out_d_bits_corrupt	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25]
);

  wire          nodeIn_a_ready;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:50:33]
  wire [8:0]    _sourceIdMap_ext_R0_data;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:39:28]
  wire [1:0]    _GEN = 2'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire          _GEN_0 = 1'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire          _GEN_1 = 1'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire          _GEN_2 = 1'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire [63:0]   _GEN_3 = 64'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire [7:0]    _GEN_4 = 8'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire [30:0]   _GEN_5 = 31'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire [8:0]    _GEN_6 = 9'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire [2:0]    _GEN_7 = 3'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  wire [2:0]    _GEN_8 = 3'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:61]
  reg  [63:0]   allocated;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:40:30]
  wire [63:0]   _nextFreeOH_T_22 = ~allocated;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:40:30, :41:33]
  wire [62:0]   _nextFreeOH_T_3 = _nextFreeOH_T_22[62:0] | {_nextFreeOH_T_22[61:0], 1'h0};	// @[generators/rocket-chip/src/main/scala/util/package.scala:253:{43,53}, generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:41:33]
  wire [62:0]   _nextFreeOH_T_6 = _nextFreeOH_T_3 | {_nextFreeOH_T_3[60:0], 2'h0};	// @[generators/rocket-chip/src/main/scala/util/package.scala:253:{43,53}]
  wire [62:0]   _nextFreeOH_T_9 = _nextFreeOH_T_6 | {_nextFreeOH_T_6[58:0], 4'h0};	// @[generators/rocket-chip/src/main/scala/util/package.scala:253:{43,48,53}]
  wire [62:0]   _nextFreeOH_T_12 = _nextFreeOH_T_9 | {_nextFreeOH_T_9[54:0], 8'h0};	// @[generators/rocket-chip/src/main/scala/util/package.scala:253:{43,53}]
  wire [62:0]   _nextFreeOH_T_15 = _nextFreeOH_T_12 | {_nextFreeOH_T_12[46:0], 16'h0};	// @[generators/rocket-chip/src/main/scala/util/package.scala:253:{43,48,53}]
  wire [63:0]   nextFree_lo = {~(_nextFreeOH_T_15 | {_nextFreeOH_T_15[30:0], 32'h0}), 1'h1} & _nextFreeOH_T_22;	// @[generators/rocket-chip/src/main/scala/util/package.scala:253:{43,48,53}, generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:41:{24,33,51}]
  wire [30:0]   _nextFree_T_3 = nextFree_lo[63:33] | nextFree_lo[31:1];	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:41:51, src/main/scala/chisel3/util/OneHot.scala:30:18, :31:18, :32:28]
  wire [14:0]   _nextFree_T_5 = _nextFree_T_3[30:16] | _nextFree_T_3[14:0];	// @[src/main/scala/chisel3/util/OneHot.scala:30:18, :31:18, :32:28]
  wire [6:0]    _nextFree_T_7 = _nextFree_T_5[14:8] | _nextFree_T_5[6:0];	// @[src/main/scala/chisel3/util/OneHot.scala:30:18, :31:18, :32:28]
  wire [2:0]    _nextFree_T_9 = _nextFree_T_7[6:4] | _nextFree_T_7[2:0];	// @[src/main/scala/chisel3/util/OneHot.scala:30:18, :31:18, :32:28]
  wire          _nextFree_T_11 = _nextFree_T_9[2] | _nextFree_T_9[0];	// @[src/main/scala/chisel3/util/OneHot.scala:30:18, :31:18, :32:28]
  wire [6:0]    nextFree = {1'h0, |(nextFree_lo[63:32]), |(_nextFree_T_3[30:15]), |(_nextFree_T_5[14:7]), |(_nextFree_T_7[6:3]), |(_nextFree_T_9[2:1]), _nextFree_T_11};	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:41:51, src/main/scala/chisel3/util/OneHot.scala:30:18, :32:{10,14,28}]
  wire          _alloc_T = nodeIn_a_ready & auto_in_a_valid;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:50:33, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  reg  [2:0]    a_first_counter;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27]
  wire          a_first = a_first_counter == 3'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27, :231:25]
  reg  [2:0]    d_last_counter;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27]
  wire          a_shrink = auto_in_a_bits_source == 9'h100 | auto_in_a_bits_source[8:6] == 3'h0 | auto_in_a_bits_source[8:6] == 3'h1 | auto_in_a_bits_source[8:6] == 3'h2 | auto_in_a_bits_source[8:6] == 3'h3;	// @[generators/rocket-chip/src/main/scala/diplomacy/Parameters.scala:46:9, :54:{10,32}, generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:47:88]
  wire          block = a_first & (&allocated) & a_shrink;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:231:25, generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:40:30, :43:28, :47:88, :49:{27,35}]
  assign nodeIn_a_ready = auto_out_a_ready & ~block;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:49:{27,35}, :50:{33,36}]
  reg  [6:0]    nodeOut_a_bits_source_r;	// @[generators/rocket-chip/src/main/scala/util/package.scala:88:63]
  wire [9:0]    _free_id_T = auto_out_d_bits_source - 10'h200;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:58:71]
  wire [12:0]   _a_first_beats1_decode_T_1 = 13'h3F << auto_in_a_bits_size;	// @[generators/rocket-chip/src/main/scala/util/package.scala:243:71]
  wire          _free_T = auto_in_d_ready & auto_out_d_valid;	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire [12:0]   _d_last_beats1_decode_T_1 = 13'h3F << auto_out_d_bits_size;	// @[generators/rocket-chip/src/main/scala/util/package.scala:243:71]
  wire [2:0]    d_last_beats1 = auto_out_d_bits_opcode[0] ? ~(_d_last_beats1_decode_T_1[5:3]) : 3'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:106:36, :221:14, generators/rocket-chip/src/main/scala/util/package.scala:243:{46,71,76}]
  wire [1023:0] _free_id_T_2 = 1024'h1 << _free_id_T;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:58:71, src/main/scala/chisel3/util/OneHot.scala:58:35]
  always @(posedge clock) begin
    if (reset) begin
      allocated <= 64'h0;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:40:30]
      a_first_counter <= 3'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27]
      d_last_counter <= 3'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27]
    end
    else begin
      allocated <= ~((d_last_counter == 3'h1 | d_last_beats1 == 3'h0) & _free_T & auto_out_d_bits_source[9] ? _free_id_T_2[63:0] : 64'h0) & (allocated | (a_first & _alloc_T & a_shrink ? nextFree_lo : 64'h0));	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:221:14, :229:27, :231:25, :232:{25,33,43}, generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:40:30, :41:51, :47:88, :55:40, :64:{27,40}, :65:{25,38}, :66:25, :67:24, :68:{31,43,45}, src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/chisel3/util/OneHot.scala:58:35]
      if (_alloc_T) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        if (a_first)	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:231:25]
          a_first_counter <= auto_in_a_bits_opcode[2] ? 3'h0 : ~(_a_first_beats1_decode_T_1[5:3]);	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:92:37, :221:14, :229:27, generators/rocket-chip/src/main/scala/util/package.scala:243:{46,71,76}]
        else	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:231:25]
          a_first_counter <= a_first_counter - 3'h1;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27, :230:28]
      end
      if (_free_T) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        if (d_last_counter == 3'h0)	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27, :231:25]
          d_last_counter <= d_last_beats1;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:221:14, :229:27]
        else	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:231:25]
          d_last_counter <= d_last_counter - 3'h1;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27, :230:28]
      end
    end
    if (a_first)	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:231:25]
      nodeOut_a_bits_source_r <= nextFree;	// @[generators/rocket-chip/src/main/scala/util/package.scala:88:63, src/main/scala/chisel3/util/OneHot.scala:32:10]
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:2];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        allocated = {_RANDOM[2'h0], _RANDOM[2'h1]};	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:40:30]
        a_first_counter = _RANDOM[2'h2][2:0];	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27]
        d_last_counter = _RANDOM[2'h2][5:3];	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27]
        nodeOut_a_bits_source_r = _RANDOM[2'h2][12:6];	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:229:27, generators/rocket-chip/src/main/scala/util/package.scala:88:63]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  sourceIdMap_64x9 sourceIdMap_ext (	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:39:28]
    .R0_addr (_free_id_T[5:0]),	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:58:{52,71}]
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_sourceIdMap_ext_R0_data),
    .W0_addr ({|(nextFree_lo[63:32]), |(_nextFree_T_3[30:15]), |(_nextFree_T_5[14:7]), |(_nextFree_T_7[6:3]), |(_nextFree_T_9[2:1]), _nextFree_T_11}),	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:41:51, :61:20, src/main/scala/chisel3/util/OneHot.scala:30:18, :32:{14,28}]
    .W0_en   (a_first & _alloc_T & a_shrink),	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:231:25, generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:47:88, :60:{21,34}, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    .W0_clk  (clock),
    .W0_data (auto_in_a_bits_source)
  );	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:39:28]
  assign auto_in_a_ready = nodeIn_a_ready;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:50:33]
  assign auto_in_d_valid = auto_out_d_valid;
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_param = auto_out_d_bits_param;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_source = auto_out_d_bits_source[9] ? _sourceIdMap_ext_R0_data : auto_out_d_bits_source[8:0];	// @[generators/diplomacy/diplomacy/src/diplomacy/lazymodule/LazyModuleImp.scala:100:25, generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:39:28, :55:40, :58:30]
  assign auto_in_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_d_bits_denied = auto_out_d_bits_denied;
  assign auto_in_d_bits_data = auto_out_d_bits_data;
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt;
  assign auto_out_a_valid = auto_in_a_valid & ~block;	// @[generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:49:{27,35}, :50:36, :51:33]
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_a_bits_param = auto_in_a_bits_param;
  assign auto_out_a_bits_size = auto_in_a_bits_size;
  assign auto_out_a_bits_source = a_shrink ? {3'h0, a_first ? nextFree : nodeOut_a_bits_source_r} - 10'h200 : {1'h0, auto_in_a_bits_source};	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:231:25, generators/rocket-chip/src/main/scala/util/package.scala:88:{42,63}, generators/testchipip/src/main/scala/serdes/SourceCombiner.scala:47:88, :53:{31,72}, src/main/scala/chisel3/util/OneHot.scala:32:10]
  assign auto_out_a_bits_address = auto_in_a_bits_address;
  assign auto_out_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_a_bits_data = auto_in_a_bits_data;
  assign auto_out_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_d_ready = auto_in_d_ready;
endmodule

