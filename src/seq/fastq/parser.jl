# WARNING: This file was generated from seq/fastq/parser.rl using ragel. Do not edit!
const fastqparser_start  = 18
const fastqparser_first_final  = 18
const fastqparser_error  = 0
const fastqparser_en_main  = 18
const _fastqparser_nfa_targs = Int8[0, 0 , ]
const _fastqparser_nfa_offsets = Int8[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , ]
const _fastqparser_nfa_push_actions = Int8[0, 0 , ]
const _fastqparser_nfa_pop_trans = Int8[0, 0 , ]
# FIXME: output type may be too loose
Ragel.@generate_read!_function(
"fastqparser",
FASTQReader,
SeqRecord,
begin
	if p == pe
		@goto _test_eof

	end
	if cs  == 18
		@goto st_case_18
	elseif cs  == 0
		@goto st_case_0
	elseif cs  == 1
		@goto st_case_1
	elseif cs  == 2
		@goto st_case_2
	elseif cs  == 3
		@goto st_case_3
	elseif cs  == 4
		@goto st_case_4
	elseif cs  == 5
		@goto st_case_5
	elseif cs  == 6
		@goto st_case_6
	elseif cs  == 7
		@goto st_case_7
	elseif cs  == 8
		@goto st_case_8
	elseif cs  == 9
		@goto st_case_9
	elseif cs  == 10
		@goto st_case_10
	elseif cs  == 11
		@goto st_case_11
	elseif cs  == 12
		@goto st_case_12
	elseif cs  == 19
		@goto st_case_19
	elseif cs  == 13
		@goto st_case_13
	elseif cs  == 14
		@goto st_case_14
	elseif cs  == 15
		@goto st_case_15
	elseif cs  == 16
		@goto st_case_16
	elseif cs  == 17
		@goto st_case_17
	end
	@goto st_out
	@label ctr39
	state.linenum += 1
	@goto st18
	@label st18
	p+= 1
	if p == pe
		@goto _test_eof18

	end
	@label st_case_18
	if (data[1+(p )]) == 10
		@goto ctr39
	elseif (data[1+(p )]) == 32
		@goto st18
	elseif (data[1+(p )]) == 64
		ck = 0;
		if (length(input.qualbuf) == length(input.seqbuf)
			)
			ck += 1

		end
		if 1 <= ck
			@goto st1

		end
		@goto st0
	end
	if 9 <= (data[1+(p )])&& (data[1+(p )])<= 13
		@goto st18

	end
	@goto st0
	@label st_case_0
	@label st0
	cs = 0
	@goto _out
	@label ctr41
	if length(input.seqbuf) != length(input.qualbuf)
		error("Error parsing FASTQ: sequence and quality scores must be of equal length")
	end

	# if a name and s description are repeated (i.e. old-fashioned fastq)
		# make sure they match.
		if (!isempty(input.name2buf) && input.name2buf != output.name) ||
			(!isempty(input.desc2buf) && input.desc2buf != output.metadata.description)
			error("Error parsing FASTQ: sequence and quality scores have non-matching identifiers")
		end

		# sequence
		resize!(output.seq, input.seqbuf.position - 1)
		if !isnull(input.fill_ambiguous)
			byte = convert(UInt8, convert(Char, get(input.fill_ambiguous)))
			for i in 1:input.seqbuf.position-1
			b = input.seqbuf.buffer[i]
			if isambiguous(convert(DNANucleotide, convert(Char, b)))
				input.seqbuf.buffer[i] = byte
			end
		end
	end
	encode_copy!(output.seq, 1, input.seqbuf.buffer, 1, input.seqbuf.position - 1)

	# quality
	check_quality_string(input.quality_encoding, input.qualbuf.buffer, 1, input.qualbuf.position - 1)
	decode_quality_string!(input.quality_encoding, input.qualbuf.buffer,
	output.metadata.quality, 1,
	input.qualbuf.position - 1)

	# reset temporaries for the next run
	empty!(input.qualbuf)
	empty!(input.seqbuf)
	empty!(input.name2buf)
	empty!(input.desc2buf)

	Ragel.@yield 1
	@goto st1
	@label st1
	p+= 1
	if p == pe
		@goto _test_eof1

	end
	@label st_case_1
	if (data[1+(p )])== 32
		@goto st0

	end
	if 9 <= (data[1+(p )])&& (data[1+(p )])<= 13
		@goto st0

	end
	@goto ctr0
	@label ctr0
	Ragel.@anchor!; @goto st2
	@label st2
	p+= 1
	if p == pe
		@goto _test_eof2

	end
	@label st_case_2
	if (data[1+(p )]) == 10
		@goto ctr4
	elseif (data[1+(p )]) == 12
		@goto st0
	elseif (data[1+(p )]) == 13
		@goto ctr5
	elseif (data[1+(p )]) == 32
		@goto ctr3
	end
	if 9 <= (data[1+(p )])&& (data[1+(p )])<= 11
		@goto ctr3

	end
	@goto st2
	@label ctr3
	Ragel.@copy_from_anchor!(output.name); @goto st3
	@label st3
	p+= 1
	if p == pe
		@goto _test_eof3

	end
	@label st_case_3
	if (data[1+(p )]) == 10
		@goto st0
	elseif (data[1+(p )]) == 32
		@goto st3
	end
	if (data[1+(p )])> 11
		if (data[1+(p )])<= 13
			@goto st0

		end

	elseif (data[1+(p )])>= 9
		@goto st3

	end
	@goto ctr6
	@label ctr6
	Ragel.@anchor!; @goto st4
	@label st4
	p+= 1
	if p == pe
		@goto _test_eof4

	end
	@label st_case_4
	if (data[1+(p )]) == 10
		@goto ctr9
	elseif (data[1+(p )]) == 13
		@goto ctr10
	end
	@goto st4
	@label ctr4
	Ragel.@copy_from_anchor!(output.name); state.linenum += 1
	@goto st5
	@label ctr9
	Ragel.@copy_from_anchor!(output.metadata.description); state.linenum += 1
	@goto st5
	@label ctr37
	state.linenum += 1
	@goto st5
	@label st5
	p+= 1
	if p == pe
		@goto _test_eof5

	end
	@label st_case_5
	if (data[1+(p )]) == 10
		@goto ctr11
	elseif (data[1+(p )]) == 13
		@goto st7
	end
	if 65 <= (data[1+(p )])&& (data[1+(p )])<= 122
		@goto ctr13

	end
	@goto st0
	@label ctr11
	state.linenum += 1
	@goto st6
	@label ctr34
	Ragel.@append_from_anchor!(input.seqbuf); state.linenum += 1
	@goto st6
	@label st6
	p+= 1
	if p == pe
		@goto _test_eof6

	end
	@label st_case_6
	if (data[1+(p )]) == 10
		@goto ctr11
	elseif (data[1+(p )]) == 13
		@goto st7
	elseif (data[1+(p )]) == 43
		@goto st8
	end
	if 65 <= (data[1+(p )])&& (data[1+(p )])<= 122
		@goto ctr13

	end
	@goto st0
	@label ctr35
	Ragel.@append_from_anchor!(input.seqbuf); @goto st7
	@label st7
	p+= 1
	if p == pe
		@goto _test_eof7

	end
	@label st_case_7
	if (data[1+(p )])== 10
		@goto ctr11

	end
	@goto st0
	@label st8
	p+= 1
	if p == pe
		@goto _test_eof8

	end
	@label st_case_8
	if (data[1+(p )]) == 10
		@goto ctr16
	elseif (data[1+(p )]) == 13
		@goto st15
	elseif (data[1+(p )]) == 32
		@goto st0
	end
	if 9 <= (data[1+(p )])&& (data[1+(p )])<= 12
		@goto st0

	end
	@goto ctr15
	@label ctr15
	Ragel.@anchor!; @goto st9
	@label st9
	p+= 1
	if p == pe
		@goto _test_eof9

	end
	@label st_case_9
	if (data[1+(p )]) == 10
		@goto ctr20
	elseif (data[1+(p )]) == 12
		@goto st0
	elseif (data[1+(p )]) == 13
		@goto ctr21
	elseif (data[1+(p )]) == 32
		@goto ctr19
	end
	if 9 <= (data[1+(p )])&& (data[1+(p )])<= 11
		@goto ctr19

	end
	@goto st9
	@label ctr19
	Ragel.@copy_from_anchor!(input.name2buf); @goto st10
	@label st10
	p+= 1
	if p == pe
		@goto _test_eof10

	end
	@label st_case_10
	if (data[1+(p )]) == 10
		@goto st0
	elseif (data[1+(p )]) == 32
		@goto st10
	end
	if (data[1+(p )])> 11
		if (data[1+(p )])<= 13
			@goto st0

		end

	elseif (data[1+(p )])>= 9
		@goto st10

	end
	@goto ctr22
	@label ctr22
	Ragel.@anchor!; @goto st11
	@label st11
	p+= 1
	if p == pe
		@goto _test_eof11

	end
	@label st_case_11
	if (data[1+(p )]) == 10
		@goto ctr25
	elseif (data[1+(p )]) == 13
		@goto ctr26
	end
	@goto st11
	@label ctr16
	state.linenum += 1
	@goto st12
	@label ctr20
	Ragel.@copy_from_anchor!(input.name2buf); state.linenum += 1
	@goto st12
	@label ctr25
	Ragel.@copy_from_anchor!(input.desc2buf); state.linenum += 1
	@goto st12
	@label st12
	p+= 1
	if p == pe
		@goto _test_eof12

	end
	@label st_case_12
	if (data[1+(p )]) == 10
		@goto ctr27
	elseif (data[1+(p )]) == 13
		@goto st13
	end
	if 33 <= (data[1+(p )])&& (data[1+(p )])<= 126
		ck = 0;
		if (length(input.qualbuf) + input.qualcount < length(input.seqbuf)
			)
			ck += 1

		end
		if 1 <= ck
			@goto ctr29

		end
		@goto st0

	end
	@goto st0
	@label ctr27
	state.linenum += 1
	@goto st19
	@label ctr31
	Ragel.@append_from_anchor!(input.qualbuf)
	input.qualcount = 0
	state.linenum += 1
	@goto st19
	@label st19
	p+= 1
	if p == pe
		@goto _test_eof19

	end
	@label st_case_19
	if (data[1+(p )]) == 10
		@goto ctr27
	elseif (data[1+(p )]) == 13
		@goto st13
	elseif (data[1+(p )]) == 64
		ck = 0;
		if (length(input.qualbuf) + input.qualcount < length(input.seqbuf)
			)
			ck += 1

		end
		if (length(input.qualbuf) == length(input.seqbuf)
			)
			ck += 2

		end
		if ck < 2
			if 1 <= ck
				@goto ctr29

			end

		elseif ck > 2
			@goto ctr29

		else
			@goto ctr41

		end
		@goto st0
	end
	if 33 <= (data[1+(p )])&& (data[1+(p )])<= 126
		ck = 0;
		if (length(input.qualbuf) + input.qualcount < length(input.seqbuf)
			)
			ck += 1

		end
		if 1 <= ck
			@goto ctr29

		end
		@goto st0

	end
	@goto st0
	@label ctr32
	Ragel.@append_from_anchor!(input.qualbuf)
	input.qualcount = 0
	@goto st13
	@label st13
	p+= 1
	if p == pe
		@goto _test_eof13

	end
	@label st_case_13
	if (data[1+(p )])== 10
		@goto ctr27

	end
	@goto st0
	@label ctr29
	Ragel.@anchor!; input.qualcount += 1
	@goto st14
	@label ctr33
	input.qualcount += 1
	@goto st14
	@label st14
	p+= 1
	if p == pe
		@goto _test_eof14

	end
	@label st_case_14
	if (data[1+(p )]) == 10
		@goto ctr31
	elseif (data[1+(p )]) == 13
		@goto ctr32
	end
	if 33 <= (data[1+(p )])&& (data[1+(p )])<= 126
		ck = 0;
		if (length(input.qualbuf) + input.qualcount < length(input.seqbuf)
			)
			ck += 1

		end
		if 1 <= ck
			@goto ctr33

		end
		@goto st0

	end
	@goto st0
	@label ctr21
	Ragel.@copy_from_anchor!(input.name2buf); @goto st15
	@label ctr26
	Ragel.@copy_from_anchor!(input.desc2buf); @goto st15
	@label st15
	p+= 1
	if p == pe
		@goto _test_eof15

	end
	@label st_case_15
	if (data[1+(p )])== 10
		@goto ctr16

	end
	@goto st0
	@label ctr13
	Ragel.@anchor!; @goto st16
	@label st16
	p+= 1
	if p == pe
		@goto _test_eof16

	end
	@label st_case_16
	if (data[1+(p )]) == 10
		@goto ctr34
	elseif (data[1+(p )]) == 13
		@goto ctr35
	end
	if 65 <= (data[1+(p )])&& (data[1+(p )])<= 122
		@goto st16

	end
	@goto st0
	@label ctr5
	Ragel.@copy_from_anchor!(output.name); @goto st17
	@label ctr10
	Ragel.@copy_from_anchor!(output.metadata.description); @goto st17
	@label st17
	p+= 1
	if p == pe
		@goto _test_eof17

	end
	@label st_case_17
	if (data[1+(p )])== 10
		@goto ctr37

	end
	@goto st0
	@label st_out
	@label _test_eof18
	cs = 18
	@goto _test_eof
	@label _test_eof1
	cs = 1
	@goto _test_eof
	@label _test_eof2
	cs = 2
	@goto _test_eof
	@label _test_eof3
	cs = 3
	@goto _test_eof
	@label _test_eof4
	cs = 4
	@goto _test_eof
	@label _test_eof5
	cs = 5
	@goto _test_eof
	@label _test_eof6
	cs = 6
	@goto _test_eof
	@label _test_eof7
	cs = 7
	@goto _test_eof
	@label _test_eof8
	cs = 8
	@goto _test_eof
	@label _test_eof9
	cs = 9
	@goto _test_eof
	@label _test_eof10
	cs = 10
	@goto _test_eof
	@label _test_eof11
	cs = 11
	@goto _test_eof
	@label _test_eof12
	cs = 12
	@goto _test_eof
	@label _test_eof19
	cs = 19
	@goto _test_eof
	@label _test_eof13
	cs = 13
	@goto _test_eof
	@label _test_eof14
	cs = 14
	@goto _test_eof
	@label _test_eof15
	cs = 15
	@goto _test_eof
	@label _test_eof16
	cs = 16
	@goto _test_eof
	@label _test_eof17
	cs = 17
	@goto _test_eof
	@label _test_eof
	if p == eof
		if cs  == 19
			if length(input.seqbuf) != length(input.qualbuf)
				error("Error parsing FASTQ: sequence and quality scores must be of equal length")
			end

			# if a name and s description are repeated (i.e. old-fashioned fastq)
				# make sure they match.
				if (!isempty(input.name2buf) && input.name2buf != output.name) ||
					(!isempty(input.desc2buf) && input.desc2buf != output.metadata.description)
					error("Error parsing FASTQ: sequence and quality scores have non-matching identifiers")
				end

				# sequence
				resize!(output.seq, input.seqbuf.position - 1)
				if !isnull(input.fill_ambiguous)
					byte = convert(UInt8, convert(Char, get(input.fill_ambiguous)))
					for i in 1:input.seqbuf.position-1
					b = input.seqbuf.buffer[i]
					if isambiguous(convert(DNANucleotide, convert(Char, b)))
						input.seqbuf.buffer[i] = byte
					end
				end
			end
			encode_copy!(output.seq, 1, input.seqbuf.buffer, 1, input.seqbuf.position - 1)

			# quality
			check_quality_string(input.quality_encoding, input.qualbuf.buffer, 1, input.qualbuf.position - 1)
			decode_quality_string!(input.quality_encoding, input.qualbuf.buffer,
			output.metadata.quality, 1,
			input.qualbuf.position - 1)

			# reset temporaries for the next run
			empty!(input.qualbuf)
			empty!(input.seqbuf)
			empty!(input.name2buf)
			empty!(input.desc2buf)

			Ragel.@yield 0
		end

	end
	@label _out
end)
