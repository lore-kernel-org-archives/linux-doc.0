Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42796285C91
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 05:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762493402; cv=none; b=mGwSXzUN9hIJNNpMEwYjFEDDabtVKeyp7okaM79GMCqVfbLI2l4gdz+IqwhGx8UUOO1CS1oiG5wWdSQ7bD90lIcsFmxwIek0ir/sm8XSWryqLBXEFz41e4kg316oVsXH8Ry3u4c1mcY/KITcYpviolPy5VNCFVBu6MUfhr8yaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762493402; c=relaxed/simple;
	bh=tMUP/7PQ0R0uG3j3317zYrgNiTq3tLLP5J++lGodLN8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CurKP4cqStLJ4qi1NegDTo/2rZZQSarOHWL1zB9Op3J/0KuxOxn/PNiL/J6QoW5XJd+46BT1O9wLH529bMyTvcK0Z0n3hxbBYmJlgBNS/lnyYk90GzE61G5AyROw5ZpZ9oK2gkeJLWBhQpTcVOAA43dpWpVUtAx5dTBLG1jJdUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=huaRM6Uu; arc=none smtp.client-ip=209.85.219.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="huaRM6Uu"
Received: by mail-qv1-f74.google.com with SMTP id 6a1803df08f44-88041f9e686so11646286d6.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 21:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762493398; x=1763098198; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHuVMFMOmBcBnySC+NLlmq0lf2rmosYLrIuF3P/08MI=;
        b=huaRM6UuaW/z1yDZ73vkSNWSvwmdrg4ZKP914dCAKSyZnJPU+1W+Hey9xIXqjrCpEa
         rCO6wFCnGOt3y3lbnSHfm/8AcZ+fMMF77bTfBDQouOMd57uQMamQVOUjF8wK/aeKTJcg
         9CojwJ977UxIh8msfNmQEvDSbwAWxNHXcoDsLjuATeRzhQyA6GUVBdTfNtnJQn1NVibP
         vRZPpwRzm0JnmgMkZ3Z7eeKXhgUxozA0zpE1ovpj1+wM9nwRftZt5A/b39V1mhyN8Pl5
         Tx0X7bWVk8DddiyGEXcunv51kIs33hTNRfkaKQC8x5Q6BuOlGUJiAgnAUjbWbF4vHlP3
         C8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762493398; x=1763098198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHuVMFMOmBcBnySC+NLlmq0lf2rmosYLrIuF3P/08MI=;
        b=TgQ5+nYzsC0hUeD2+uu1jbtKdCukiTr/oPshhePjnDbgmyxFyDfKL7GrtUVGZriF8d
         KUe18bIMVK2C+ekDdyZKgN2Wo41S3gazQ5D8AVuy4WI5vVtCuhdevfsZmEb7aDZNI2B8
         v9dj6kuYJ9A7/GLA1egHcciByX4VBx3ZqdEDS5kq27Jv09C3X8qDUcLIFcr/cIgp3EjT
         lmAWDexeXVY8SwpM35sz/kPbFD3YvE9OpgpaMwqQufu84x7woJ+rQrdx2DPl1I97CMsQ
         mw++INQYT/SIuuRUqzfvcQirFJOIKQQDwAwYCRSbLSw9FzQCRifNJ6kuS08ST05BOXqL
         E94A==
X-Forwarded-Encrypted: i=1; AJvYcCXPlNRwrVz8fYb/TZcClGmAINqDRbUHm5gFUlY4s63CrbnX0UyeUpRvqAqnrQqL1/s640hGnHvfzxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnolAaO9CvNyRlr1oBJvxZgh8HU7TslxmXCkn9JWDtdZCaayF
	dNQTAvifEd8u1qCpR/bF6CtvY/Uj3JuWipfBZYdY28ZXNuREs2eaapN2fHBlBjRNOEjuUOev6yh
	f7A==
X-Google-Smtp-Source: AGHT+IGp7s78iu2xje/V+eMJgfG1eE3TFtYt6exwrw0FOTs4FULoLCiswwTPKFjpZHXMSFCnjmVX6xqQBg==
X-Received: from qvbks29.prod.google.com ([2002:a05:6214:311d:b0:882:2f2f:9ed])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6214:5085:b0:87c:67a:ca69
 with SMTP id 6a1803df08f44-881767a7142mr26911986d6.61.1762493398062; Thu, 06
 Nov 2025 21:29:58 -0800 (PST)
Date: Fri,  7 Nov 2025 05:29:24 +0000
In-Reply-To: <20251107052926.3403265-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251107052926.3403265-1-rmoar@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107052926.3403265-4-rmoar@google.com>
Subject: [PATCH RESEND 3/5] ktap_v2: add test metadata
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	raemoar63@gmail.com, Tim.Bird@sony.com, shuah@kernel.org
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Add specification for test metadata to the KTAP v2 spec.

KTAP v1 only specifies the output format of very basic test information:
test result and test name. Any additional test information either gets
added to general diagnostic data or is not included in the output at all.

The purpose of KTAP metadata is to create a framework to include and
easily identify additional important test information in KTAP.

KTAP metadata could include any test information that is pertinent for
user interaction before or after the running of the test. For example,
the test file path or the test speed.

Since this includes a large variety of information, this specification
will recognize notable types of KTAP metadata to ensure consistent format
across test frameworks. See the full list of types in the specification.

Example of KTAP Metadata:

 KTAP version 2
 #:ktap_test: main
 #:ktap_arch: uml
 1..1
     KTAP version 2
     #:ktap_test: suite_1
     #:ktap_subsystem: example
     #:ktap_test_file: lib/test.c
     1..2
     ok 1 test_1
     #:ktap_test: test_2
     #:ktap_speed: very_slow
     # test_2 has begun
     #:custom_is_flaky: true
     ok 2 test_2
 # suite_1 has passed
 ok 1 suite_1

The changes to the KTAP specification outline the format, location, and
different types of metadata.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 249 ++++++++++++++++++++++++++++++-
 1 file changed, 244 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 21e1b80fddd7..70f1557e47ac 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -17,20 +17,21 @@ KTAP test results describe a series of tests (which may be nested: i.e., test
 can have subtests), each of which can contain both diagnostic data -- e.g., log
 lines -- and a final result. The test structure and results are
 machine-readable, whereas the diagnostic data is unstructured and is there to
-aid human debugging.
-
-KTAP output is built from four different types of lines:
+aid human debugging. Since version 2, tests can also contain metadata which
+consists of important supplemental test information and can be
+machine-readable.
 
+KTAP output is built from five different types of lines:
 - Version lines
 - Plan lines
 - Test case result lines
 - Diagnostic lines
+- Metadata lines
 
 In general, valid KTAP output should also form valid TAP output, but some
 information, in particular nested test results, may be lost. Also note that
 there is a stagnant draft specification for TAP14, KTAP diverges from this in
-a couple of places (notably the "Subtest" header), which are described where
-relevant later in this document.
+a couple of places, which are described where relevant later in this document.
 
 Version lines
 -------------
@@ -168,6 +169,238 @@ even if they do not start with a "#": this is to capture any other useful
 kernel output which may help debug the test. It is nevertheless recommended
 that tests always prefix any diagnostic output they have with a "#" character.
 
+KTAP metadata lines
+-------------------
+
+KTAP metadata lines are used to include and easily identify important
+supplemental test information in KTAP. These lines may appear similar to
+diagnostic lines. They were introduced in KTAP version 2. The format of
+metadata lines is below:
+
+.. code-block:: none
+
+	#:<prefix>_<metadata type>: <metadata value>
+
+The <prefix> indicates where to find the specification for the type of
+metadata, such as the name of a test framework or "ktap" to indicate this
+specification. The list of currently approved prefixes and where to find the
+documentation of the metadata types is below. Note any metadata type that does
+not use a prefix from the list below must use the prefix "custom".
+
+Current List of Approved Prefixes:
+
+- ``ktap``: See Types of KTAP Metadata below for the list of metadata types.
+
+The format of <metadata type> and <value> varies based on the type. See the
+individual specification. For "custom" types the <metadata type> can be any
+string excluding ":", spaces, or newline characters and the <value> can be any
+string.
+
+**Location:**
+
+The first KTAP metadata line for a test must be "#:ktap_test: <test name>",
+which acts as a header to associate metadata with the correct test. Metadata
+for the main KTAP level uses the test name "main". A test's metadata ends
+with a "ktap_test" line for a different test.
+
+For test cases, the location of the metadata is between the prior test result
+line and the current test result line. For test suites, the location of the
+metadata is between the suite's version line and test plan line. For the main
+level, the location of the metadata is between the main version line and main
+test plan line. See the example below.
+
+Note that a test case's metadata is inline with the test's result line. Whereas
+a suite's metadata is inline with the suite's version line and thus will be
+more indented than the suite's result line. Additionally, metadata for the main
+level is inline with the main version line.
+
+KTAP metadata for a test does not need to be contiguous. For example, a kernel
+warning or other diagnostic output could interrupt metadata lines. However, it
+is recommended to keep a test's metadata lines in the correct location and
+together when possible, as this improves readability.
+
+**Example of KTAP metadata:**
+
+::
+
+        KTAP version 2
+        #:ktap_test: main
+        #:ktap_arch: uml
+        1..1
+          KTAP version 2
+          #:ktap_test: suite_1
+          #:ktap_subsystem: example
+          #:ktap_test_file: lib/test.c
+          1..2
+          # WARNING: test_1 skipped
+          ok 1 test_1 # SKIP
+          #:ktap_test: test_2
+          #:ktap_speed: very_slow
+          # test_2 has begun
+          #:custom_is_flaky: true
+          ok 2 test_2
+        # suite_1 passed
+        ok 1 suite_1
+
+In this example, the tests are running on UML. The test suite "suite_1" is part
+of the subsystem "example" and belongs to the file "lib/test.c". It has
+two subtests, "test_1" and "test_2". The subtest "test_2" has a speed of
+"very_slow" and has been marked with a custom KTAP metadata type called
+"custom_is_flaky" with the value of "true".
+
+**Inheritance of KTAP metadata**
+
+Tests can inherit KTAP metadata. A child test inherits all the parent test's
+KTAP metadata except for directly opposing metadata.  For example, if a suite
+has a property of "#:ktap_speed: slow", all child test cases are also marked as
+slow. However, if one of the test cases has metadata of "#:ktap_speed:
+very_slow" then that test case would be marked as very_slow instead and not
+slow.
+
+Note if a test case inherits metadata it does not need to appear as a line in
+the KTAP. Using the example above, not every test case would have the line
+"#:ktap_speed: slow" in their metadata.
+
+**Edge Case Examples of KTAP metadata**
+
+Here are a few edge case examples of KTAP metadata. The first example shows
+metadata in the wrong location.
+
+::
+
+        KTAP version 2
+        1..1
+          KTAP version 2
+          #:ktap_test: suite_1
+          1..3
+          ok 1 test_1
+          #:ktap_test: test_2
+          #:ktap_speed: very_slow
+          ok 2 test_2
+          #:ktap_duration: 1.342s
+          #:ktap_test: test_3
+          #:ktap_speed: slow
+          ok 3 test_3
+        ok 1 suite_1
+
+In this example, the metadata "#:ktap_duration: 1.342s" is in the wrong
+location. It was meant to belong to test_2 but was printed late. The location
+of this metadata is not recommended. However, it is allowed because the line is
+still below "#:ktap_test: test_2" and above any other ktap_test lines.
+
+This second example shows metadata in the correct location but without the
+proper header.
+
+::
+
+        KTAP version 2
+        1..1
+          KTAP version 2
+          #:ktap_test: suite_1
+          1..2
+          not ok 1 test_1
+          #:ktap_speed: very_slow
+          ok 2 test_2
+        ok 1 suite_1
+
+In this example, the metadata "#:ktap_speed: very_slow" is meant to belong to
+test_2. It is in the correct location but does not fall below a ktap_test line
+for test_2. Instead this metadata might be mistaken for belonging to suite_1
+because it does fall under the ktap_test line for suite_1. This lack of header
+is not allowed.
+
+**Types of KTAP Metadata:**
+
+This is the current list of KTAP metadata types recognized in this
+specification. Note that all of these metadata types are optional (except for
+ktap_test as the KTAP metadata header).
+
+- ``ktap_test``: Name of test (used as header of KTAP metadata). This should
+  match the test name printed in the test result line: "ok 1 [test_name]".
+
+- ``ktap_module``: Name of the module containing the test
+
+- ``ktap_subsystem``: Name of the subsystem being tested
+
+- ``ktap_start_time``: Time tests started in ISO8601 format
+
+  - Example: "#:ktap_start_time: 2024-01-09T13:09:01.990000+00:00"
+
+- ``ktap_duration``: Time taken (in seconds) to execute the test
+
+  - Example: "#:ktap_duration: 10.154s"
+
+- ``ktap_speed``: Category of how fast test runs: "normal", "slow", or
+  "very_slow"
+
+- ``ktap_test_file``: Path to source file containing the test. This metadata
+  line can be repeated if the test is spread across multiple files.
+
+  - Example: "#:ktap_test_file: lib/test.c"
+
+- ``ktap_generated_file``: Description of and path to file generated during
+  test execution. This could be a core dump, generated filesystem image, some
+  form of visual output (for graphics drivers), etc. This metadata line can be
+  repeated to attach multiple files to the test. Note use ktap_log_file or
+  ktap_error_file instead of this type if more applicable.
+
+  - Example: "#:ktap_generated_file: Core dump: /var/lib/systemd/coredump/hello.core"
+
+- ``ktap_log_file``: Path to file containing kernel log test output
+
+  - Example: "#:ktap_log_file: /sys/kernel/debugfs/kunit/example/results"
+
+- ``ktap_error_file``: Path to file containing context for test failure or
+  error. This could include the difference between optimal test output and
+  actual test output.
+
+  - Example: "#:ktap_error_file: fs/results/example.out.bad"
+
+- ``ktap_results_url``: Link to webpage describing this test run and its
+  results
+
+  - Example: "#:ktap_results_url: https://kcidb.kernelci.org/hello"
+
+- ``ktap_arch``: Architecture used during test run
+
+  - Example: "#:ktap_arch: x86_64"
+
+- ``ktap_compiler``: Compiler used during test run
+
+  - Example: "#:ktap_compiler: gcc (GCC) 10.1.1 20200507 (Red Hat 10.1.1-1)"
+
+- ``ktap_respository_url``: Link to git repository of the checked out code.
+
+  - Example: "#:ktap_respository_url: https://github.com/torvalds/linux.git"
+
+- ``ktap_git_branch``: Name of git branch of checked out code
+
+  - Example: "#:ktap_git_branch: kselftest/kunit"
+
+- ``ktap_kernel_version``: Version of Linux Kernel being used during test run
+
+  - Example: "#:ktap_kernel_version: 6.7-rc1"
+
+- ``ktap_config``: Config name and value. This does not necessarly need to be
+  restricted to Kconfig.
+
+  - Example: "#:ktap_config: CONFIG_SYSFS=y"
+
+- ``ktap_id``: Description of ID and ID value. This is an open-ended metadata
+  used for IDs, such as checkout id or test run id.
+
+  - Example: "#:ktap_id: Test run id: 14e782"
+
+- ``ktap_commit_hash``: The full git commit hash of the checked out base code.
+
+  - Example: "#:ktap_commit_hash: 064725faf8ec2e6e36d51e22d3b86d2707f0f47f"
+
+**Other Metadata Types:**
+
+There can also be KTAP metadata that is not included in the recognized list
+above. This metadata must be prefixed with the test framework, ie. "kselftest",
+or with the prefix "custom". For example, "# custom_batch: 20".
+
 Unknown lines
 -------------
 
@@ -208,6 +441,7 @@ An example of a test with two nested subtests:
 	KTAP version 2
 	1..1
 	  KTAP version 2
+	  #:ktap_test: example
 	  1..2
 	  ok 1 test_1
 	  not ok 2 test_2
@@ -221,6 +455,7 @@ An example format with multiple levels of nested testing:
 	KTAP version 2
 	1..2
 	  KTAP version 2
+	  #:ktap_test: example_test_1
 	  1..2
 	    KTAP version 2
 	    1..2
@@ -256,6 +491,7 @@ Example KTAP output
 	KTAP version 2
 	1..1
 	  KTAP version 2
+	  #:ktap_test: main_test
 	  1..3
 	    KTAP version 2
 	    1..1
@@ -263,11 +499,14 @@ Example KTAP output
 	    ok 1 test_1
 	  ok 1 example_test_1
 	    KTAP version 2
+	    #:ktap_test: example_test_2
+	    #:ktap_speed: slow
 	    1..2
 	    ok 1 test_1 # SKIP test_1 skipped
 	    ok 2 test_2
 	  ok 2 example_test_2
 	    KTAP version 2
+	    #:ktap_test: example_test_3
 	    1..3
 	    ok 1 test_1
 	    # test_2: FAIL
-- 
2.51.2.1041.gc1ab5b90ca-goog

