Return-Path: <SRS0=WnF+=5Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5642C2BB1D
	for <linux-doc@archiver.kernel.org>; Wed,  8 Apr 2020 15:47:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF26120787
	for <linux-doc@archiver.kernel.org>; Wed,  8 Apr 2020 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586360823;
	bh=TDBaW2fv5MluchG9f30Ep3GiWk6bRYTPMXmOqn5u5bQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=mPk5YhdHIWNFio+MVC7zkoozNn4xljltHW7yjXHrMDDL8Velhdv3I1D3TVIfSnqX0
	 nrOC4yxapFMfPy4BsGguF4sJlgRUzsk70Eryx9HurAi5wnYZtcqoT0P61MhYY7O3kT
	 ft/v4szSEbFkaWd1OliLIieEPIZMnrz0QfXVpiJ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729711AbgDHPqd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Apr 2020 11:46:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729606AbgDHPqc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 8 Apr 2020 11:46:32 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28A01208FE;
        Wed,  8 Apr 2020 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586360791;
        bh=TDBaW2fv5MluchG9f30Ep3GiWk6bRYTPMXmOqn5u5bQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UDJfVq31ciABIS0QIxKOcq64GkxUoFgKVZD6tx5L/35W1N2l/24FLbjzA4pRTYPBA
         HHVBgIC1/p5B+54ZF0PQAirDUn0B/RjlPhZ2vJhfrMDymDHGAobM8iIo0m+FMH0IiZ
         /BK7CdnPI/j3Pcf3A0va2YYe5G5ev906LaSZXC/E=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jMCuL-000cAl-At; Wed, 08 Apr 2020 17:46:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/35] docs: arm64: booting.rst: get rid of some warnings
Date:   Wed,  8 Apr 2020 17:45:59 +0200
Message-Id: <c8b258fc8e1b7c9531ac9b74a8a01a7ae505fd15.1586359676.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586359676.git.mchehab+huawei@kernel.org>
References: <cover.1586359676.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Get rid of those warnings:

    Documentation/arm64/booting.rst:253: WARNING: Unexpected indentation.
    Documentation/arm64/booting.rst:259: WARNING: Block quote ends without a blank line; unexpected unindent.

By adding an extra blank lines where needed.

While here, use list markups on some places, as otherwise Sphinx
will consider the next lines as continuation of the privious ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/arm64/booting.rst | 36 ++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/Documentation/arm64/booting.rst b/Documentation/arm64/booting.rst
index a3f1a47b6f1c..e50186092948 100644
--- a/Documentation/arm64/booting.rst
+++ b/Documentation/arm64/booting.rst
@@ -173,7 +173,9 @@ Before jumping into the kernel, the following conditions must be met:
 - Caches, MMUs
 
   The MMU must be off.
+
   Instruction cache may be on or off.
+
   The address range corresponding to the loaded kernel image must be
   cleaned to the PoC. In the presence of a system cache or other
   coherent masters with caches enabled, this will typically require
@@ -238,6 +240,7 @@ Before jumping into the kernel, the following conditions must be met:
   - The DT or ACPI tables must describe a GICv2 interrupt controller.
 
   For CPUs with pointer authentication functionality:
+
   - If EL3 is present:
 
     - SCR_EL3.APK (bit 16) must be initialised to 0b1
@@ -249,18 +252,22 @@ Before jumping into the kernel, the following conditions must be met:
     - HCR_EL2.API (bit 41) must be initialised to 0b1
 
   For CPUs with Activity Monitors Unit v1 (AMUv1) extension present:
+
   - If EL3 is present:
-    CPTR_EL3.TAM (bit 30) must be initialised to 0b0
-    CPTR_EL2.TAM (bit 30) must be initialised to 0b0
-    AMCNTENSET0_EL0 must be initialised to 0b1111
-    AMCNTENSET1_EL0 must be initialised to a platform specific value
-    having 0b1 set for the corresponding bit for each of the auxiliary
-    counters present.
+
+    - CPTR_EL3.TAM (bit 30) must be initialised to 0b0
+    - CPTR_EL2.TAM (bit 30) must be initialised to 0b0
+    - AMCNTENSET0_EL0 must be initialised to 0b1111
+    - AMCNTENSET1_EL0 must be initialised to a platform specific value
+      having 0b1 set for the corresponding bit for each of the auxiliary
+      counters present.
+
   - If the kernel is entered at EL1:
-    AMCNTENSET0_EL0 must be initialised to 0b1111
-    AMCNTENSET1_EL0 must be initialised to a platform specific value
-    having 0b1 set for the corresponding bit for each of the auxiliary
-    counters present.
+
+    - AMCNTENSET0_EL0 must be initialised to 0b1111
+    - AMCNTENSET1_EL0 must be initialised to a platform specific value
+      having 0b1 set for the corresponding bit for each of the auxiliary
+      counters present.
 
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
@@ -304,7 +311,8 @@ following manner:
   Documentation/devicetree/bindings/arm/psci.yaml.
 
 - Secondary CPU general-purpose register settings
-  x0 = 0 (reserved for future use)
-  x1 = 0 (reserved for future use)
-  x2 = 0 (reserved for future use)
-  x3 = 0 (reserved for future use)
+
+  - x0 = 0 (reserved for future use)
+  - x1 = 0 (reserved for future use)
+  - x2 = 0 (reserved for future use)
+  - x3 = 0 (reserved for future use)
-- 
2.25.2

