Return-Path: <SRS0=UKPC=ZL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E66AC43215
	for <linux-doc@archiver.kernel.org>; Tue, 19 Nov 2019 23:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 391EF222A9
	for <linux-doc@archiver.kernel.org>; Tue, 19 Nov 2019 23:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nVyamhsn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfKSXjM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Nov 2019 18:39:12 -0500
Received: from mail-qt1-f202.google.com ([209.85.160.202]:56390 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfKSXjM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 18:39:12 -0500
Received: by mail-qt1-f202.google.com with SMTP id b26so15764299qtr.23
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 15:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=v88ei6S0wJCSuWhgUCtsKkdiH3vVNQzI6rAeWB+JwIg=;
        b=nVyamhsnnw49KvDFXJqRcw24+36HKRxF7kRHa/oYiyRG4Z8oBVaLN+xKmh9d9E1s2K
         u6XyPFga73VtusgKNCUPU9GaT2Z5UhqrBEPQSpT5DxL1rRj6OVhxlPqtcl983/Hp5Brf
         85amkgIoeKTSJ/s4laVzmNCzQE8/Ul36XqKaQh+P/WqbbFRethcZDT4FhcHEmsH23Yy1
         IrVfiVnW9gkh/UIS7SgEI65s9wIcSfjTyYmrXqJRxwxoUyfkKi1PYjg+dBLltIxc1EGc
         BeihLMykTtyCc2aaOpK9pGJ78bL3/Q2itMkh13oXTJZPDHJ8vMCc2XC0UVREqaR4YqME
         Pwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=v88ei6S0wJCSuWhgUCtsKkdiH3vVNQzI6rAeWB+JwIg=;
        b=tvd1zDVC2tmWT+uY2NoeRon0ZAvY4OmvEgnS6sjcdLOgmyJB1IXg6c3cFX+Mv2sXha
         hofnoVnqPoBzpaVyxQxjY7q7PuVmvhZvW/+dMx4EX9W1lz2x68n7EbCEhsi7K3rWMA//
         cAJ7730WkRLoHAh8lA6wCpwsWjK/mIWTKBV8hchTYWYbtvytxTuMnjoqU50SUUcm1DCM
         HGPHSVOaOvig6ln+NRfwA1h/jxOOvvBL5D7KQNamZIiG9Ps4IHMQJCMdhRN7Jtx+3GOC
         Oh1FWRIyw6u45a1r4Q5huzzpsXMPyrkQQr6PZ3CoKzedH0Nq/WHh5PR5G44q8BRSNf5D
         uniQ==
X-Gm-Message-State: APjAAAUYuozYZNP4iTCwjhj4GTqaYlwaDXWKLYsScqrljRdqmwRjLytm
        kDf8gIXNVbx2Meeqz+VTKLO9ReENZEeJsAcZYCnO9g==
X-Google-Smtp-Source: APXvYqzxdP/LNyepUZH2pNvrgYeyjUNcOVDfMPsW2DGEDSpW7QzxnPjZXdfyr+lf7q8ugUYTyiDGuJP5nwG4HEvt/E8s3A==
X-Received: by 2002:ac8:7253:: with SMTP id l19mr430821qtp.363.1574206751015;
 Tue, 19 Nov 2019 15:39:11 -0800 (PST)
Date:   Tue, 19 Nov 2019 15:38:10 -0800
Message-Id: <20191119233810.207487-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH linux-kselftest/test v2] Documentation: kunit: fix typos and
 gramatical errors
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com
Cc:     kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, heidifahim@google.com, trishalfonso@google.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rinat Ibragimov <ibragimovrinat@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix typos and gramatical errors in the Getting Started and Usage guide
for KUnit.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://patchwork.kernel.org/patch/11156481/
Reported-by: Rinat Ibragimov <ibragimovrinat@mail.ru>
Link: https://github.com/google/kunit-docs/issues/1
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: David Gow <davidgow@google.com>
---
 Documentation/dev-tools/kunit/start.rst |  8 ++++----
 Documentation/dev-tools/kunit/usage.rst | 24 ++++++++++++------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
index f4d9a4fa914f8..9d6db892c41c0 100644
--- a/Documentation/dev-tools/kunit/start.rst
+++ b/Documentation/dev-tools/kunit/start.rst
@@ -26,7 +26,7 @@ For more information on this wrapper (also called kunit_tool) checkout the
 
 Creating a kunitconfig
 ======================
-The Python script is a thin wrapper around Kbuild as such, it needs to be
+The Python script is a thin wrapper around Kbuild. As such, it needs to be
 configured with a ``kunitconfig`` file. This file essentially contains the
 regular Kernel config, with the specific test targets as well.
 
@@ -62,8 +62,8 @@ If everything worked correctly, you should see the following:
 followed by a list of tests that are run. All of them should be passing.
 
 .. note::
-   Because it is building a lot of sources for the first time, the ``Building
-   kunit kernel`` step may take a while.
+	Because it is building a lot of sources for the first time, the
+	``Building KUnit kernel`` step may take a while.
 
 Writing your first test
 =======================
@@ -162,7 +162,7 @@ Now you can run the test:
 
 .. code-block:: bash
 
-	./tools/testing/kunit/kunit.py
+	./tools/testing/kunit/kunit.py run
 
 You should see the following failure:
 
diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index c6e69634e274b..b9a065ab681ee 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -16,7 +16,7 @@ Organization of this document
 =============================
 
 This document is organized into two main sections: Testing and Isolating
-Behavior. The first covers what a unit test is and how to use KUnit to write
+Behavior. The first covers what unit tests are and how to use KUnit to write
 them. The second covers how to use KUnit to isolate code and make it possible
 to unit test code that was otherwise un-unit-testable.
 
@@ -174,13 +174,13 @@ Test Suites
 ~~~~~~~~~~~
 
 Now obviously one unit test isn't very helpful; the power comes from having
-many test cases covering all of your behaviors. Consequently it is common to
-have many *similar* tests; in order to reduce duplication in these closely
-related tests most unit testing frameworks provide the concept of a *test
-suite*, in KUnit we call it a *test suite*; all it is is just a collection of
-test cases for a unit of code with a set up function that gets invoked before
-every test cases and then a tear down function that gets invoked after every
-test case completes.
+many test cases covering all of a unit's behaviors. Consequently it is common
+to have many *similar* tests; in order to reduce duplication in these closely
+related tests most unit testing frameworks - including KUnit - provide the
+concept of a *test suite*. A *test suite* is just a collection of test cases
+for a unit of code with a set up function that gets invoked before every test
+case and then a tear down function that gets invoked after every test case
+completes.
 
 Example:
 
@@ -211,7 +211,7 @@ KUnit test framework.
 .. note::
    A test case will only be run if it is associated with a test suite.
 
-For a more information on these types of things see the :doc:`api/test`.
+For more information on these types of things see the :doc:`api/test`.
 
 Isolating Behavior
 ==================
@@ -338,7 +338,7 @@ We can easily test this code by *faking out* the underlying EEPROM:
 		return count;
 	}
 
-	ssize_t fake_eeprom_write(struct eeprom *this, size_t offset, const char *buffer, size_t count)
+	ssize_t fake_eeprom_write(struct eeprom *parent, size_t offset, const char *buffer, size_t count)
 	{
 		struct fake_eeprom *this = container_of(parent, struct fake_eeprom, parent);
 
@@ -454,7 +454,7 @@ KUnit on non-UML architectures
 By default KUnit uses UML as a way to provide dependencies for code under test.
 Under most circumstances KUnit's usage of UML should be treated as an
 implementation detail of how KUnit works under the hood. Nevertheless, there
-are instances where being able to run architecture specific code, or test
+are instances where being able to run architecture specific code or test
 against real hardware is desirable. For these reasons KUnit supports running on
 other architectures.
 
@@ -557,7 +557,7 @@ run your tests on your hardware setup just by compiling for your architecture.
 .. important::
    Always prefer tests that run on UML to tests that only run under a particular
    architecture, and always prefer tests that run under QEMU or another easy
-   (and monitarily free) to obtain software environment to a specific piece of
+   (and monetarily free) to obtain software environment to a specific piece of
    hardware.
 
 Nevertheless, there are still valid reasons to write an architecture or hardware
-- 
2.24.0.432.g9d3f5f5b63-goog

