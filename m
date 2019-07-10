Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BCAAA7D92A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Jul 2019 15:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfGJPbm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Jul 2019 11:31:42 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44906 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfGJPbk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jul 2019 11:31:40 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so1884965lfm.11
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2019 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kT4SgXaqaE6g+9MWv9VaHuJsn71MgZgDLbK4RzJDByw=;
        b=YemC4rvt7R00JtZfg7hXOLzvKjhHsHBazb0p1ypnK0AcC91kCHOBjyaoCY+q9nmJwN
         us/RDg8clMBCG6wqJhVc51OqXKOayANp30swyF4v+ZJ8qfzgZ36sDuM3wmv0PtXurKrZ
         +J3sOXSUBvyEcgBJa4nvRf9X4dFQebBwHbtLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kT4SgXaqaE6g+9MWv9VaHuJsn71MgZgDLbK4RzJDByw=;
        b=W45dMcmzIDLUuBrj5Y4x/2zZN7xP34d0RUreD92+APIL/WmXZamnDSEO4bEpeqW2UH
         +SkryVrDWvIoiU/3EkTds+TJ/9J9nKdBH38qaQ07Nh+k+nYjmz/4sPKH3tloaKgP40MB
         Ow+qGbu/wUEv7SUaXHCC4oPUhm1upnkcFujYOxO9WpMFJiC1dZiejDn2PWuab5FlfeDw
         ti3yMVeZ0N5ff67MhxEb+ifqvsU2K6XkkQ2cO4TjVLp4faPMsvNj/47NYVrAhHYhjVId
         ahtHrPXIl9pwmjQYyDJWsj6dnwZR/QCfjXM+zS6jYEC0cO2lk93ENogLsPSMXqUbrUCU
         BtwQ==
X-Gm-Message-State: APjAAAWopexqeKqSLQhyE4DdHubrQYZpkq746lnHgLdiIjFG5sACHEFa
        aCFdY2oZocZTh3sW67vh4u8kVg==
X-Google-Smtp-Source: APXvYqzNcOC6VXyyydnq+IdKVH/E9wpLKyGohxE2qSzeP4J60HEleQIEFSUcWOBjbYQbSN5f1NvMNw==
X-Received: by 2002:ac2:5601:: with SMTP id v1mr15571407lfd.106.1562772696751;
        Wed, 10 Jul 2019 08:31:36 -0700 (PDT)
Received: from luke-XPS-13.home (159-205-76-204.adsl.inetia.pl. [159.205.76.204])
        by smtp.gmail.com with ESMTPSA id o17sm517208ljg.71.2019.07.10.08.31.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 08:31:36 -0700 (PDT)
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
X-Google-Original-From: Luke Nowakowski-Krijger <lnowakow@neg.ucsd.edu>
To:     linux-kernel-mentees@lists.linuxfoundation.org
Cc:     Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>,
        pbonzini@redhat.com, rkrcmar@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] Documentation: kvm: Convert cpuid.txt to .rst
Date:   Wed, 10 Jul 2019 08:30:53 -0700
Message-Id: <20190710153054.29564-3-lnowakow@neg.ucsd.edu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710153054.29564-1-lnowakow@neg.ucsd.edu>
References: <20190710153054.29564-1-lnowakow@neg.ucsd.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>

Convert cpuid.txt to .rst format to be parsable by sphinx.

Change format and spacing to make function definitions and return values
much more clear. Also added a table that is parsable by sphinx and makes
the information much more clean. Updated Author email to their new
active email address. Added license identifier with the consent of the
author.

Signed-off-by: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
---
 Changes since v3:
 + added table entries that were in updated cpuid.txt
 Changes since v2:
 + added updated Author email address
 + changed table to simpler format
 - removed function bolding from v1
 Changes since v1:
 + Converted doc to .rst format

 .../virtual/kvm/{cpuid.txt => cpuid.rst}      | 162 ++++++++++--------
 1 file changed, 89 insertions(+), 73 deletions(-)
 rename Documentation/virtual/kvm/{cpuid.txt => cpuid.rst} (13%)

diff --git a/Documentation/virtual/kvm/cpuid.txt b/Documentation/virtual/kvm/cpuid.rst
similarity index 13%
rename from Documentation/virtual/kvm/cpuid.txt
rename to Documentation/virtual/kvm/cpuid.rst
index 2bdac528e4a2..01b081f6e7ea 100644
--- a/Documentation/virtual/kvm/cpuid.txt
+++ b/Documentation/virtual/kvm/cpuid.rst
@@ -1,6 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============
 KVM CPUID bits
-Glauber Costa <glommer@redhat.com>, Red Hat Inc, 2010
-=====================================================
+==============
+
+:Author: Glauber Costa <glommer@gmail.com>
 
 A guest running on a kvm host, can check some of its features using
 cpuid. This is not always guaranteed to work, since userspace can
@@ -10,10 +14,14 @@ a guest.
 KVM cpuid functions are:
 
 function: KVM_CPUID_SIGNATURE (0x40000000)
-returns : eax = 0x40000001,
-          ebx = 0x4b4d564b,
-          ecx = 0x564b4d56,
-          edx = 0x4d.
+
+returns::
+
+   eax = 0x40000001
+   ebx = 0x4b4d564b
+   ecx = 0x564b4d56
+   edx = 0x4d
+
 Note that this value in ebx, ecx and edx corresponds to the string "KVMKVMKVM".
 The value in eax corresponds to the maximum cpuid function present in this leaf,
 and will be updated if more functions are added in the future.
@@ -21,71 +29,79 @@ Note also that old hosts set eax value to 0x0. This should
 be interpreted as if the value was 0x40000001.
 This function queries the presence of KVM cpuid leafs.
 
-
 function: define KVM_CPUID_FEATURES (0x40000001)
-returns : ebx, ecx
-          eax = an OR'ed group of (1 << flag), where each flags is:
-
-
-flag                               || value || meaning
-=============================================================================
-KVM_FEATURE_CLOCKSOURCE            ||     0 || kvmclock available at msrs
-                                   ||       || 0x11 and 0x12.
-------------------------------------------------------------------------------
-KVM_FEATURE_NOP_IO_DELAY           ||     1 || not necessary to perform delays
-                                   ||       || on PIO operations.
-------------------------------------------------------------------------------
-KVM_FEATURE_MMU_OP                 ||     2 || deprecated.
-------------------------------------------------------------------------------
-KVM_FEATURE_CLOCKSOURCE2           ||     3 || kvmclock available at msrs
-                                   ||       || 0x4b564d00 and 0x4b564d01
-------------------------------------------------------------------------------
-KVM_FEATURE_ASYNC_PF               ||     4 || async pf can be enabled by
-                                   ||       || writing to msr 0x4b564d02
-------------------------------------------------------------------------------
-KVM_FEATURE_STEAL_TIME             ||     5 || steal time can be enabled by
-                                   ||       || writing to msr 0x4b564d03.
-------------------------------------------------------------------------------
-KVM_FEATURE_PV_EOI                 ||     6 || paravirtualized end of interrupt
-                                   ||       || handler can be enabled by writing
-                                   ||       || to msr 0x4b564d04.
-------------------------------------------------------------------------------
-KVM_FEATURE_PV_UNHALT              ||     7 || guest checks this feature bit
-                                   ||       || before enabling paravirtualized
-                                   ||       || spinlock support.
-------------------------------------------------------------------------------
-KVM_FEATURE_PV_TLB_FLUSH           ||     9 || guest checks this feature bit
-                                   ||       || before enabling paravirtualized
-                                   ||       || tlb flush.
-------------------------------------------------------------------------------
-KVM_FEATURE_ASYNC_PF_VMEXIT        ||    10 || paravirtualized async PF VM exit
-                                   ||       || can be enabled by setting bit 2
-                                   ||       || when writing to msr 0x4b564d02
-------------------------------------------------------------------------------
-KVM_FEATURE_PV_SEND_IPI            ||    11 || guest checks this feature bit
-                                   ||       || before using paravirtualized
-                                   ||       || send IPIs.
-------------------------------------------------------------------------------
-KVM_FEATURE_PV_POLL_CONTROL        ||    12 || host-side polling on HLT can
-                                   ||       || be disabled by writing
-                                   ||       || to msr 0x4b564d05.
-------------------------------------------------------------------------------
-KVM_FEATURE_PV_SCHED_YIELD         ||    13 || guest checks this feature bit
-                                   ||       || before using paravirtualized
-                                   ||       || sched yield.
-------------------------------------------------------------------------------
-KVM_FEATURE_CLOCKSOURCE_STABLE_BIT ||    24 || host will warn if no guest-side
-                                   ||       || per-cpu warps are expected in
-                                   ||       || kvmclock.
-------------------------------------------------------------------------------
-
-          edx = an OR'ed group of (1 << flag), where each flags is:
-
-
-flag                               || value || meaning
-==================================================================================
-KVM_HINTS_REALTIME                 ||     0 || guest checks this feature bit to
-                                   ||       || determine that vCPUs are never
-                                   ||       || preempted for an unlimited time,
-                                   ||       || allowing optimizations
-----------------------------------------------------------------------------------
+
+returns::
+
+          ebx, ecx
+          eax = an OR'ed group of (1 << flag)
+
+where ``flag`` is defined as below:
+
+================================= =========== ================================
+flag                              value       meaning
+================================= =========== ================================
+KVM_FEATURE_CLOCKSOURCE           0           kvmclock available at msrs
+                                              0x11 and 0x12
+
+KVM_FEATURE_NOP_IO_DELAY          1           not necessary to perform delays
+                                              on PIO operations
+
+KVM_FEATURE_MMU_OP                2           deprecated
+
+KVM_FEATURE_CLOCKSOURCE2          3           kvmclock available at msrs
+
+                                              0x4b564d00 and 0x4b564d01
+KVM_FEATURE_ASYNC_PF              4           async pf can be enabled by
+                                              writing to msr 0x4b564d02
+
+KVM_FEATURE_STEAL_TIME            5           steal time can be enabled by
+                                              writing to msr 0x4b564d03
+
+KVM_FEATURE_PV_EOI                6           paravirtualized end of interrupt
+                                              handler can be enabled by
+                                              writing to msr 0x4b564d04
+
+KVM_FEATURE_PV_UNHAULT            7           guest checks this feature bit
+                                              before enabling paravirtualized
+                                              spinlock support
+
+KVM_FEATURE_PV_TLB_FLUSH          9           guest checks this feature bit
+                                              before enabling paravirtualized
+                                              tlb flush
+
+KVM_FEATURE_ASYNC_PF_VMEXIT       10          paravirtualized async PF VM EXIT
+                                              can be enabled by setting bit 2
+                                              when writing to msr 0x4b564d02
+
+KVM_FEATURE_PV_SEND_IPI           11          guest checks this feature bit
+                                              before enabling paravirtualized
+                                              sebd IPIs
+
+KVM_FEATURE_PV_POLL_CONTROL       12          host-side polling on HLT can
+                                              be disabled by writing
+                                              to msr 0x4b564d05.
+
+KVM_FEATURE_PV_SCHED_YIELD        13          guest checks this feature bit
+                                              before using paravirtualized
+                                              sched yield.
+
+KVM_FEATURE_CLOCSOURCE_STABLE_BIT 24          host will warn if no guest-side
+                                              per-cpu warps are expeced in
+                                              kvmclock
+================================= =========== ================================
+
+::
+
+      edx = an OR'ed group of (1 << flag)
+
+Where ``flag`` here is defined as below:
+
+================== ============ =================================
+flag               value        meaning
+================== ============ =================================
+KVM_HINTS_REALTIME 0            guest checks this feature bit to
+                                determine that vCPUs are never
+                                preempted for an unlimited time
+                                allowing optimizations
+================== ============ =================================
-- 
2.20.1

