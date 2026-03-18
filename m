Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C23CE494;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843979; cv=none; b=RsLGESlqtXtDZ3KKghch3rRBtLO2gcovyitdMOhr3UiJAz6QzYeyYmzyW4ySOI2FUUpwV6g6/6iEoBruAo7ljHrubvk3tifNhaskmSBX79DDtgYqMYwg+8vgZ78KboQ1fcK8kexN2UH5b1Lw/SdqpkTHJZpwJX4wmV+kbCwuwZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843979; c=relaxed/simple;
	bh=BpwNhxJRllBxsUNnr5dU2iSGcWYnZ5DXu4osdBW+RuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HgMWCi8o185NxBMNPCDos/Tn+sryKLiQwEs6ZMwSpFg5QatapuqDpAIVj5ZHUtg9IZej/BsGyq7pSg94TzlkKLyQ+98p2mfQIcD5CaCS4dAhzfiAS9WZ8OW/FJbOZxMg7qqI4699F3tbPmOFA8pCKt9Ds0DcEZ88L/aiHG7f5Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGCzNoQW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGCzNoQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1980C19421;
	Wed, 18 Mar 2026 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843979;
	bh=BpwNhxJRllBxsUNnr5dU2iSGcWYnZ5DXu4osdBW+RuA=;
	h=From:To:Cc:Subject:Date:From;
	b=LGCzNoQWrMQb76v9uT5EbbT+p2Hir1Lcr/RN4AGS5LC4X8SVuXzHOAApwuRar4+WA
	 yKaL8h4Nfql393h327oMoCUyWvgdBahQn9Pe/0PRLCE2ePVlyWW7ktkjut6d1Ju0QI
	 ad0d7syQ3jPix8BRF9sQekhGHTcsApF4artD1bCXBcreM6s6d1y9SsupmC8YdB1SUX
	 WqXzMMIRRzrVucy4bpU+rW4Bgeu23gAR5lN/D1XmfvbV35Tr+EzV/0O6gGZihsajFZ
	 8teKFOI0XO/gBcAn+vfG3tug6flYozwomV9XalekPse7o3+bKyV0/V3ErS4hvyq0Vv
	 gCzJuJFhzgg6A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqj-00000004HVm-09Qh;
	Wed, 18 Mar 2026 15:26:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 0/7] More kernel-doc unit tests
Date: Wed, 18 Mar 2026 15:26:04 +0100
Message-ID: <cover.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This series comes after
        https://lore.kernel.org/linux-doc/20260318104321.53065c27@foz.lan/T/#t

and contains the remaining patches I have ready to be merged.

Its focus is primarly on adding unit tests for some corner
cases. Several of such tests came from Randy, and were already
previously submitted on some old series.

I added a couple of extra tests there to check if tables and code
blocks will be properly producing rst and man content.

Due to such test, I ended discovering one bug, fixed on the last
patch on this series.

On this series, the actual tests are not part of the unit test
source code. Instead, they're loaded from an yaml file that
uses a properly defined schema. One of the tests check if the
file follows such schema.

Now, the end-to-end validation tool also suports specifying
an yaml file:

	$  tools/unittests/test_kdoc_parser.py -h
	options:
	  -h, --help            show this help message and exit
	  -v, --verbose
	  -f, --failfast
	  -k, --keyword KEYWORD
	                        Regex pattern to filter test methods
	  -y, --yaml-file, --yaml YAML_FILE
	                        Name of the yaml file to load


That alows an workflow where, before applying a patch series,
one can save either (or both) html and/or man output into an
yaml and test if something changed before/after a patch series:

	$ ./tools/docs/kernel-doc --man --rst --yaml all.yaml . 2>err.log
	<apply a patch series>
	$ tools/unittests/test_kdoc_parser.py -y all.yaml
	...
	Ran 154975 tests in 237.783s

	OK (expected failures=4)
	test_kdoc_parser:
	...
	Ran 154975 tests

In practice, instead of running all of them, one could use
a subset, like checking only the files that are inside
a Documentation file with:

	$ ./tools/docs/kernel-doc --man --rst --yaml kdoc.yaml $(git grep kernel-doc:: Documentation|cut -d: -f4|sort|uniq) 2>/dev/null
	<apply a patch series>
	$ tools/unittests/test_kdoc_parser.py -y kdoc.yaml
	Ran 35701 tests in 40.083s

	OK (expected failures=4)
	test_kdoc_parser:
	    CToMan:
	        test_man_test_Documentation_gpu_rfc_i915_small_bar_h_000:                       OK
	        test_man_test_Documentation_gpu_rfc_i915_small_bar_h_001:                       OK
	...
	        test_rst_test_tools_testing_selftests_kselftest_harness_h_036:                  OK
	        test_rst_test_tools_testing_selftests_kselftest_harness_h_037:                  OK
	    TestSelfValidate:
	        test_parse_pass:                                                                OK

	Ran 35701 tests

and/or use this to help adding corner cases to tools/unittests/kdoc-test.yaml.

The test scope that will be written inside the yaml file is limited
by adding one or more of those parameters:
	--man
	--rst
	--kdoc-item

Please notice that the YAML output currently doesn't work for some
broken kernel-doc markups, as it assumes an 1:1 map between symbols
and source code entries. On such cases, it will print a warning like
this one:

	Warning: lengths are different. Ignoring drivers/gpu/drm/drm_gpusvm.c

Currently just 1 test over 35702 ones generated from kernel-doc markup
has this issue.

After this series, we have 121 unit tests, all passing:

  $ ./tools/unittests/run.py
  Ran 121 tests in 0.141s

  OK (expected failures=4)
  test_cmatch:
    TestSearch:
        test_search_acquires_multiple:                               OK
        test_search_acquires_nested_paren:                           OK
        test_search_acquires_simple:                                 OK
        test_search_must_hold:                                       OK
        test_search_must_hold_shared:                                OK
        test_search_no_false_positive:                               OK
        test_search_no_function:                                     OK
        test_search_no_macro_remains:                                OK
    TestSubMultipleMacros:
        test_acquires_multiple:                                      OK
        test_acquires_nested_paren:                                  OK
        test_acquires_simple:                                        OK
        test_mixed_macros:                                           OK
        test_must_hold:                                              OK
        test_must_hold_shared:                                       OK
        test_no_false_positive:                                      OK
        test_no_function:                                            OK
        test_no_macro_remains:                                       OK
    TestSubSimple:
        test_rise_early_greedy:                                      OK
        test_rise_multiple_greedy:                                   OK
        test_strip_multiple_acquires:                                OK
        test_sub_count_parameter:                                    OK
        test_sub_mixed_placeholders:                                 OK
        test_sub_multiple_placeholders:                              OK
        test_sub_no_placeholder:                                     OK
        test_sub_single_placeholder:                                 OK
        test_sub_with_capture:                                       OK
        test_sub_zero_placeholder:                                   OK
    TestSubWithLocalXforms:
        test_functions_with_acquires_and_releases:                   OK
        test_raw_struct_group:                                       OK
        test_raw_struct_group_tagged:                                OK
        test_struct_group:                                           OK
        test_struct_group_attr:                                      OK
        test_struct_group_tagged_with_private:                       OK
        test_struct_kcov:                                            OK
        test_vars_stackdepot:                                        OK

  test_kdoc_parser:
    CToKdocItem:
        test_gen_func2:                                              OK
    CToMan:
        test_man_acpi_os_acquire_lock:                               OK
        test_man_acpi_os_release_lock:                               OK
        test_man_c_stop:                                             OK
        test_man_char_array:                                         OK
        test_man_char_pointer_var:                                   OK
        test_man_const_char_array:                                   OK
        test_man_contend_for_bm:                                     OK
        test_man_crypto_alg_lookup:                                  OK
        test_man_debugfs_enter_cancellation:                         OK
        test_man_debugfs_leave_cancellation:                         OK
        test_man_doc_with_complex_table:                             OK
        test_man_down_read_trylock:                                  OK
        test_man_enum_var:                                           OK
        test_man_free_stacks:                                        OK
        test_man_func1:                                              OK
        test_man_func_with_ascii_artwork:                            OK
        test_man_pool_offset:                                        OK
        test_man_prepare_report_consumer:                            OK
        test_man_prepare_report_producer:                            OK
        test_man_simple_tables:                                      OK
        test_man_spin_lock:                                          OK
        test_man_stack_pools:                                        OK
        test_man_static_atomic64_t_var:                              OK
        test_man_struct_kcov:                                        OK
        test_man_tcp_sigpool_start:                                  OK
        test_man_tomoyo_read_lock:                                   OK
        test_man_tomoyo_read_unlock:                                 OK
        test_man_tx:                                                 OK
        test_man_undo_report_consumer:                               OK
        test_man_unsigned_long:                                      OK
        test_man_unsigned_long_on_init:                              OK
        test_man_unsigned_long_var_on_uppercase:                     OK
        test_man_unsigned_long_with_default:                         OK
    CToRest:
        test_rst_acpi_os_acquire_lock:                               OK
        test_rst_acpi_os_release_lock:                               OK
        test_rst_c_stop:                                             OK
        test_rst_char_array:                                         OK
        test_rst_char_pointer_var:                                   OK
        test_rst_const_char_array:                                   OK
        test_rst_contend_for_bm:                                     OK
        test_rst_crypto_alg_lookup:                                  OK
        test_rst_debugfs_enter_cancellation:                         OK
        test_rst_debugfs_leave_cancellation:                         OK
        test_rst_doc_with_complex_table:                             OK
        test_rst_down_read_trylock:                                  OK
        test_rst_enum_var:                                           OK
        test_rst_free_stacks:                                        OK
        test_rst_func_with_ascii_artwork:                            OK
        test_rst_pool_offset:                                        OK
        test_rst_prepare_report_consumer:                            OK
        test_rst_prepare_report_producer:                            OK
        test_rst_simple_tables:                                      OK
        test_rst_spin_lock:                                          OK
        test_rst_stack_pools:                                        OK
        test_rst_static_atomic64_t_var:                              OK
        test_rst_struct_kcov:                                        OK
        test_rst_tcp_sigpool_start:                                  OK
        test_rst_tomoyo_read_lock:                                   OK
        test_rst_tomoyo_read_unlock:                                 OK
        test_rst_tx:                                                 OK
        test_rst_undo_report_consumer:                               OK
        test_rst_unsigned_long:                                      OK
        test_rst_unsigned_long_on_init:                              OK
        test_rst_unsigned_long_var_on_uppercase:                     OK
        test_rst_unsigned_long_with_default:                         OK
    KdocItemToMan:
        test_man_func2:                                              OK
    KdocItemToRest:
        test_rst_func2:                                              OK
    TestSelfValidate:
        test_parse_pass:                                             OK

  test_kdoc_test_schema:
    TestYAMLSchemaValidation:
        test_kdoc_test_yaml_followsschema:                           OK

  test_tokenizer:
    TestPublicPrivate:
        test_balanced_inner_private:                                 OK
        test_balanced_non_greddy_private:                            OK
        test_balanced_private:                                       OK
        test_no private:                                             OK
        test_unbalanced_inner_private:                               OK
        test_unbalanced_private:                                     OK
        test_unbalanced_struct_group_tagged_with_private:            OK
        test_unbalanced_two_struct_group_tagged_first_with_private:  OK
        test_unbalanced_without_end_of_line:                         OK
    TestTokenizer:
        test_basic_tokens:                                           OK
        test_depth_counters:                                         OK
        test_mismatch_error:                                         OK

  Ran 121 tests

The new tests covered by the two series I sent today do an end-to-end
check of the most important logic, as they verify:

	- source code parsed into a KdocItem;
	- KdocItem to both man and rst;
	- source to man and to rst output formats.

The coverage of such tests are:
  - c_lex;
  - kdoc_item;
  - kdoc_output;
  - kdoc_parser;
  - kdoc_re;
  - xforms_lists.

Not 100% of kernel-doc, but the most relevant parts (and the ones
that require more maintainance) are now checked. It doesn't mean
that all possible corner cases are mapped, but it should be able
to identify lots of potential regressions, while still running
on fractions of seconds.

Mauro Carvalho Chehab (7):
  docs: kdoc_parser: add some debug for variable parsing
  unittests: test_kdoc_parser: add command line arg to read a YAML file
  MAINTAINERS: update documentation scripts to add unittests
  docs: tools: include kdoc_yaml_file at documentation
  docs: kdoc_yaml_file: add a representer to make strings look nicer
  docs: kdoc-test.yaml: add more tests
  docs: kdoc_output: fix handling of simple tables

 Documentation/tools/kdoc_ancillary.rst  |    8 +
 MAINTAINERS                             |    3 +-
 tools/lib/python/kdoc/kdoc_output.py    |    6 +-
 tools/lib/python/kdoc/kdoc_parser.py    |   11 +
 tools/lib/python/kdoc/kdoc_yaml_file.py |   18 +-
 tools/unittests/kdoc-test.yaml          | 1548 ++++++++++++++++++++++-
 tools/unittests/test_kdoc_parser.py     |   23 +-
 7 files changed, 1605 insertions(+), 12 deletions(-)

-- 
2.52.0

