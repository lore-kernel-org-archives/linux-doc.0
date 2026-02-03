Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF53ACF08;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=TP4Gpv4pFzYuuIWrH6sKUj6ljTXJSBwXdc1MSN/ydD/AZHCVh8J5FWu2eehIMQIokrQoXkG4fxxcAxh3fq4rcnXU8XA51HO9P9w+gQIfO7BxLAUtuFu7cIz2ecXfdVpdgtiw6J5ha2wNPkMot+sFo4pWc/nLerRaF3ZyPNA+kDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=S2F14OX/iOb3Mix0qC5561BA7vNfLfJ5uy5w+wqXU4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qZ0ygTnmYBxx0KycICXlAoCF3Ptt6V7F8Bw0utQFPDkUMFZQCkC3XhNZH8b2qSXdvmKOnpbb9wk4C7gz7YeF5FIvhZJzvoCbPcILOzUbjdA+WbRoVL5TkiaeUOTyQaC2HLs5i0zHCX9vFbGFv6hnFwqszRuNy3NUwkmI+LFW3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZ5ZNnOj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZ5ZNnOj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7688C16AAE;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130555;
	bh=S2F14OX/iOb3Mix0qC5561BA7vNfLfJ5uy5w+wqXU4c=;
	h=From:To:Cc:Subject:Date:From;
	b=EZ5ZNnOjDx6hIeh8J9WAyLwExkPFTZF9ZuZORDBfAPl4M2eUwzUEqMctRbwpvILDo
	 zyNdYg3lBLjsSvNyoLs4vOeym+1TgMglu49y39jQuPOGGhmawZXPWGy4vhEmmwfp1q
	 6nfmKTMrQAfYHpW0fzaxiMUlT4emkD/qCleBT8XeFHhW3dj+QAc0x0t1vC5zB2DWpP
	 ko7bIKy6izlfDcDPgu+9sv+noHYDmauOWY01dTBycvFjHdK93xa8XwPigkUnt5iKxb
	 zIv3BVAB+dy7ur0BginnJRWo3NW9rblHQcULhv4sq4FJI1WODD4rORRo3dNCZd3cc5
	 I9TYlJIjx+jgw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHom-000000027U5-3GZH;
	Tue, 03 Feb 2026 15:55:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 00/15] Add unit tests for kernel-doc parser and output
Date: Tue,  3 Feb 2026 15:55:28 +0100
Message-ID: <cover.1770128540.git.mchehab+huawei@kernel.org>
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

This series comes after my previous one:
    https://lore.kernel.org/linux-doc/cover.1769867953.git.mchehab+huawei@kernel.org/

and depends on it. It is focusing on providing a more comprehensive
selftests/unittests for kernel-doc.

It also adds a tool to allow executing all tests inside
tools/unittests altogether:

    $ ./tools/unittests/run.py
    Ran 35 tests in 0.081s
    
    OK (expected failures=4)
    test_kdoc_parser:
        CToKdocItem:
            test_gen_func2:                             OK
        CToMan:
            test_man_func1:                             OK
        KdocItemToMan:
            test_man_func2:                             OK
        KdocItemToRest:
            test_rst_func2:                             OK
        TestSelfValidate:
            test_parse_pass:                            OK
    
    test_kdoc_test_schema:
        TestYAMLSchemaValidation:
            test_kdoc_test_yaml_followsschema:          OK
    
    test_kdoc_xforms:
        TestDifferentReplacements:
            test_strip_multiple_acquires:               OK
            test_sub_count_parameter:                   OK
            test_sub_mixed_placeholders:                OK
            test_sub_multiple_placeholders:             OK
            test_sub_no_placeholder:                    OK
            test_sub_single_placeholder:                OK
            test_sub_with_capture:                      OK
            test_sub_zero_placeholder:                  OK
        TestMultipleMacros:
            test_acquires_multiple:                     OK
            test_acquires_nested_paren:                 OK
            test_acquires_simple:                       OK
            test_mixed_macros:                          OK
            test_must_hold:                             OK
            test_must_hold_shared:                      OK
            test_no_false_positive:                     OK
            test_no_function:                           OK
            test_no_macro_remains:                      OK
        TestRealUsecases:
            test_functions_with_acquires_and_releases:  OK
            test_raw_struct_group:                      OK
            test_raw_struct_group_tagged:               OK
            test_struct_group:                          OK
            test_struct_group_attr:                     OK
            test_struct_group_tagged_with_private:      OK
            test_struct_kcov:                           OK
            test_vars_stackdepot:                       OK
    
    
    Ran 35 tests

most of the efforts here is to generate a test_kdoc_parser which
contains 6 test classes. The first one is mostly meant to do
a selftest on itself, checking if its checker works. The other
5 covers different test scenarios:

    - C to KdocItem;
    - C to rst;
    - C to man;
    - KdocItem to rst;
    - KdocItem to man.

Such tests are dynamically generated from a YAML file
(at tools/unittests/kdoc-test.yaml).

There is another test to check if such file follows the
schema defined for such tests, which is at
./tools/unittests/kdoc-test-schema.yaml.

Yet, as Jani already commented, populating the YAML file
can be tricky, specially with regards to the KdocItem
internal representation. To make easier to populate it,
I added support at kernel-doc to generate a file for us.

The tool uses the already-existing "--man", "--rst" and a new
"--kdoc-item" to define what will be stored.

If we want all tree, for instance, for all kernel-doc comments
from, let's say, the Xe driver, one can do:

    $ ./scripts/kernel-doc -y xe.yaml drivers/gpu/drm/xe --man --rst --kdoc-item

To execute all such tests altogether is as simple as:

    $ time tools/unittests/test_kdoc_parser.py --yaml xe.yaml
    Ran 3398 tests in 1.071s

    OK (expected failures=4)
    test_kdoc_parser:
        CToKdocItem:
        test_gen_test_drivers_gpu_drm_xe_abi_guc_actions_abi_h_000:              OK
        test_gen_test_drivers_gpu_drm_xe_abi_guc_actions_abi_h_001:              OK
        test_gen_test_drivers_gpu_drm_xe_abi_guc_actions_slpc_abi_h_000:         OK
...
        test_rst_test_drivers_gpu_drm_xe_xe_wa_h_001:                            OK
        test_rst_test_drivers_gpu_drm_xe_xe_wopcm_c_000:                         OK
        test_rst_test_drivers_gpu_drm_xe_xe_wopcm_c_001:                         OK
        test_rst_test_drivers_gpu_drm_xe_xe_wopcm_types_h_000:                   OK
    TestSelfValidate:
        test_parse_pass:                                                         OK


    Ran 3398 tests

    real    0m2.964s
    user    0m2.885s
    sys     0m0.047s

The tool also allows filtering tests by its name, but this is after
creating all dynamic tests(*):

    $ time tools/unittests/test_kdoc_parser.py --yaml foo.yaml -k v4l2-mem2mem_c
    Ran 15 tests in 0.007s

    OK
    test_kdoc_parser:
    CToKdocItem:
        test_gen_test_drivers_media_v4l2-core_v4l2-mem2mem_c_000:  OK
        test_gen_test_drivers_media_v4l2-core_v4l2-mem2mem_c_001:  OK
        test_gen_test_drivers_media_v4l2-core_v4l2-mem2mem_c_002:  OK
        test_gen_test_drivers_media_v4l2-core_v4l2-mem2mem_c_003:  OK
        test_gen_test_drivers_media_v4l2-core_v4l2-mem2mem_c_004:  OK
    KdocItemToMan:
        test_man_test_drivers_media_v4l2-core_v4l2-mem2mem_c_000:  OK
        test_man_test_drivers_media_v4l2-core_v4l2-mem2mem_c_001:  OK
        test_man_test_drivers_media_v4l2-core_v4l2-mem2mem_c_002:  OK
        test_man_test_drivers_media_v4l2-core_v4l2-mem2mem_c_003:  OK
        test_man_test_drivers_media_v4l2-core_v4l2-mem2mem_c_004:  OK
    KdocItemToRest:
        test_rst_test_drivers_media_v4l2-core_v4l2-mem2mem_c_000:  OK
        test_rst_test_drivers_media_v4l2-core_v4l2-mem2mem_c_001:  OK
        test_rst_test_drivers_media_v4l2-core_v4l2-mem2mem_c_002:  OK
        test_rst_test_drivers_media_v4l2-core_v4l2-mem2mem_c_003:  OK
        test_rst_test_drivers_media_v4l2-core_v4l2-mem2mem_c_004:  OK


    Ran 15 tests

    real    0m2.000s
    user    0m1.935s
    sys     0m0.056s

(*) so most of the 2 seconds here were spent with unittest
    discover and dynamic test creation, and 7 ms to run them :-)

Some notes:

1. currenty, the logic can't generate tests on some cases,
   as it wants one source code per each KdocItem/man/rst
   output. The logic with stores source code is a litle bit
   lazy doing its job, as it add items there even when
   the parser fails to create a KdocItem due to bad shaped
   kernel-doc markups.

2. At the worse-case scenario, if one creates a huge YAML file
   with all tests that pass (1):

    $ ./scripts/kernel-doc -y all.yaml --man --rst --kdoc-item .

   And run it:

    $ time tools/unittests/test_kdoc_parser.py --yaml all.yaml

    Ran 229688 tests

    FAILED (failures=1433)

    real    5m3.631s
    user    4m59.525s
    sys     0m2.124s

   1433/229688 fails (0.6% of the tests)

   I didn't check why, but, even with that, we can probably
   still use it for regression tests, calling it before/after
   some critical changes and see what changes. It would take
   ~5 mins to run all such tests, which doesn't sound too
   bad, even if one needs to run it twice. to detect what
   changed.




Mauro Carvalho Chehab (15):
  unittests: unittest_helper: store verbosity at the environment
  unittests: rename kdoc_xforms.py
  unittests: add a runner to execute all unittests
  docs: kdoc_files: use a class to group config parameters
  docs: kdoc_files: move output symbols logic to kdoc_output
  docs: kdoc_item: fix initial value for parameterdesc_start_lines
  docs: kdoc_item: add support to generate a KdocItem from a dict
  docs: kdoc_item: fix a typo on sections_start_lines
  docs: unittests: add a parser to test kernel-doc parser logic
  docs: add a schema to help creating unittests for kernel-doc
  docs: add a simple kdoc-test.yaml together with a validation tool
  docs: test_kdoc_parser: add support for dynamic test creation
  docs: add a new file to write kernel-doc output to a YAML file
  docs: kernel-doc: add support to store output on a YAML file
  unittests: test_kdoc_parser: add command line arg to read a YAML file

 tools/docs/kernel-doc                         |  48 +-
 tools/lib/python/kdoc/kdoc_files.py           | 104 ++--
 tools/lib/python/kdoc/kdoc_item.py            |  39 +-
 tools/lib/python/kdoc/kdoc_output.py          |  23 +-
 tools/lib/python/kdoc/kdoc_parser.py          |  33 +-
 tools/lib/python/kdoc/kdoc_yaml_file.py       | 155 ++++++
 tools/lib/python/unittest_helper.py           |  17 +-
 tools/unittests/kdoc-test-schema.yaml         | 156 ++++++
 tools/unittests/kdoc-test.yaml                | 154 ++++++
 tools/unittests/run.py                        |  17 +
 tools/unittests/test_kdoc_parser.py           | 523 ++++++++++++++++++
 tools/unittests/test_kdoc_test_schema.py      |  94 ++++
 .../{kdoc_xforms.py => test_kdoc_xforms.py}   |   0
 13 files changed, 1308 insertions(+), 55 deletions(-)
 create mode 100644 tools/lib/python/kdoc/kdoc_yaml_file.py
 create mode 100644 tools/unittests/kdoc-test-schema.yaml
 create mode 100644 tools/unittests/kdoc-test.yaml
 create mode 100755 tools/unittests/run.py
 create mode 100755 tools/unittests/test_kdoc_parser.py
 create mode 100755 tools/unittests/test_kdoc_test_schema.py
 rename tools/unittests/{kdoc_xforms.py => test_kdoc_xforms.py} (100%)

-- 
2.52.0

