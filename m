Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6AC537DE79
	for <lwn-linux-doc@archive.lwn.net>; Sat, 28 Apr 2018 04:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751311AbeD1EiV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 28 Apr 2018 00:38:21 -0400
Received: from merlin.infradead.org ([205.233.59.134]:48524 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751294AbeD1EiU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Apr 2018 00:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P87JumWWkUPP2LRlgwgcpEYZd1QN8drrXKONWAXZOHo=; b=AWyio4TBG8b90YUWLGJ7dMtOPN
        DqubWFuv9uehUK0/uZVpgAjjt57OZ3oFpKdwAbYXPPmWUDzJ/kuQtVAm/FstfKB9zwQS/X9ZH7r82
        NMRZFhc5zYTpzbXuHO2U8tHXirQe5iqVeMrk3pBiFhiK7RBDDMXrczIA7HVQ4bsQzsK0KUNaO2Mil
        MYeIEtyRyTz4rT1PtE6rgQ1Z2fSYTGbXbOsQZ8Lg0bkJ7+LFCjuAlJMZe+t3Y3c2FpsCv7S0UAJVB
        RJEoKAuMmAL9mNNLQPvn0jaPpKaS6dox755dLewQ8dLVr8XIcOXoSa80uUpqQr4+g2SGKICw0dsSs
        kTRTJR0Q==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fCHco-0003O4-Rq; Sat, 28 Apr 2018 04:38:19 +0000
To:     linux-kselftest@vger.kernel.org,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kselftests: fix grammar and non-ASCII space
Message-ID: <b1c47352-9389-0117-2a6b-ef552f6b82e5@infradead.org>
Date:   Fri, 27 Apr 2018 21:38:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

This is a small cleanup to kselftest.rst:

- Fix some language typos in the usage instructions.
- Change one non-ASCII space to an ASCII space.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/dev-tools/kselftest.rst |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- linux-next-20180426.orig/Documentation/dev-tools/kselftest.rst
+++ linux-next-20180426/Documentation/dev-tools/kselftest.rst
@@ -9,7 +9,7 @@ and booting a kernel.
 
 On some systems, hot-plug tests could hang forever waiting for cpu and
 memory to be ready to be offlined. A special hot-plug target is created
-to run full range of hot-plug tests. In default mode, hot-plug tests run
+to run the full range of hot-plug tests. In default mode, hot-plug tests run
 in safe mode with a limited scope. In limited mode, cpu-hotplug test is
 run on a single cpu as opposed to all hotplug capable cpus, and memory
 hotplug test is run on 2% of hotplug capable memory instead of 10%.
@@ -89,9 +89,9 @@ Note that some tests will require root p
 Install selftests
 =================
 
-You can use kselftest_install.sh tool installs selftests in default
-location which is tools/testing/selftests/kselftest or a user specified
-location.
+You can use the kselftest_install.sh tool to install selftests in the
+default location, which is tools/testing/selftests/kselftest, or in a
+user specified location.
 
 To install selftests in default location::
 
@@ -109,7 +109,7 @@ Running installed selftests
 Kselftest install as well as the Kselftest tarball provide a script
 named "run_kselftest.sh" to run the tests.
 
-You can simply do the following to run the installed Kselftests.Â Please
+You can simply do the following to run the installed Kselftests. Please
 note some tests will require root privileges::
 
    $ cd kselftest
@@ -139,7 +139,7 @@ Contributing new tests (details)
    default.
 
    TEST_CUSTOM_PROGS should be used by tests that require custom build
-   rule and prevent common build rule use.
+   rules and prevent common build rule use.
 
    TEST_PROGS are for test shell scripts. Please ensure shell script has
    its exec bit set. Otherwise, lib.mk run_tests will generate a warning.


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
