Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B181C43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:57:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15E6C20870
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590251;
	bh=9mtg6cPA9MJfrf7/vYpFkaem8befp1IfLRwT5OVMr08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ajo1XFnZM1TUrxs04xVkNpgHaDlHyQVSDbKJQOySwGtxeF/0mUV3hQNjrbwp8WByG
	 0TMZu1s+GUZsnvICITxQ9rVs8RVK7+OaeFIE5Ji8WkXQeEaODiO6/H8HiFwQ+Cq9YC
	 sBRaJsWg7MfztcE/+UR+Appt6hyQ0UcxDlSt7RvY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgJML5a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:57:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:58030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727297AbgJMLys (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:48 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51A1922447;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=9mtg6cPA9MJfrf7/vYpFkaem8befp1IfLRwT5OVMr08=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=He/Oxt6d2cmA9KfQOE7Dt6LEH8Ncj3xqfh5tdAQ6WwqGZeNuOQQhrebZf2Q54ei+8
         +/+qrEv5gFpaa9BZ2XAp6pdewPBhX8mm6EVBw5LPJ1TsB4duKc7W7VrfhtOJKFEXZQ
         zzecwXyO2OkA79qSfSp4/rIp3ojHxAHC5a5AYpeA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVz-Cm; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 59/80] docs: powerpc: syscall64-abi.rst: fix a malformed table
Date:   Tue, 13 Oct 2020 13:54:14 +0200
Message-Id: <6dee3216d15ef03bf8b35fd55149631d7f71d62d.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As reported:

	Documentation/powerpc/syscall64-abi.rst:53: WARNING: Malformed table.
	Text in column margin in table line 2.

	=========== ============= ========================================
	--- For the sc instruction, differences with the ELF ABI ---
	r0          Volatile      (System call number.)

This table requires a different notation to be valid.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/powerpc/syscall64-abi.rst | 32 ++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/powerpc/syscall64-abi.rst b/Documentation/powerpc/syscall64-abi.rst
index 379817ca64d2..cf9b2857c72a 100644
--- a/Documentation/powerpc/syscall64-abi.rst
+++ b/Documentation/powerpc/syscall64-abi.rst
@@ -49,22 +49,22 @@ Register preservation rules
 Register preservation rules match the ELF ABI calling sequence with the
 following differences:
 
---- For the sc instruction, differences with the ELF ABI ---
-=========== ============= ========================================
-r0          Volatile      (System call number.)
-r3          Volatile      (Parameter 1, and return value.)
-r4-r8       Volatile      (Parameters 2-6.)
-cr0         Volatile      (cr0.SO is the return error condition.)
-cr1, cr5-7  Nonvolatile
-lr          Nonvolatile
-=========== ============= ========================================
-
---- For the scv 0 instruction, differences with the ELF ABI ---
-=========== ============= ========================================
-r0          Volatile      (System call number.)
-r3          Volatile      (Parameter 1, and return value.)
-r4-r8       Volatile      (Parameters 2-6.)
-=========== ============= ========================================
++------------------------------------------------------------------------+
+|        For the sc instruction, differences with the ELF ABI		 |
++--------------+--------------+------------------------------------------+
+| r0           | Volatile     | (System call number.)			 |
+| rr3          | Volatile     | (Parameter 1, and return value.)	 |
+| rr4-r8       | Volatile     | (Parameters 2-6.)			 |
+| rcr0         | Volatile     | (cr0.SO is the return error condition.)	 |
+| rcr1, cr5-7  | Nonvolatile  |						 |
+| rlr          | Nonvolatile  |						 |
++--------------+--------------+------------------------------------------+
+|      For the scv 0 instruction, differences with the ELF ABI		 |
++--------------+--------------+------------------------------------------+
+| r0           | Volatile     | (System call number.)			 |
+| r3           | Volatile     | (Parameter 1, and return value.)	 |
+| r4-r8        | Volatile     | (Parameters 2-6.)			 |
++--------------+--------------+------------------------------------------+
 
 All floating point and vector data registers as well as control and status
 registers are nonvolatile.
-- 
2.26.2

