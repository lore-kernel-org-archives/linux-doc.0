Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14E2C3F2D9
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7C942467F
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583243975;
	bh=Ot18DWlFBytWvI74fTpVOFcLADsv25orW6rh6cH6rsM=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=1y9MV1PV8ChPUq3j7Xhm+rCge1tGrAqIgX6afHewU5cyYQ/JgPE2Az6xckCDjhzKH
	 ETWQFG5FyGGzY/HdiCaGCSxTM2bSniJ7pIdRQPP8Q/siNm2wYewfawlCZgA+TnEigv
	 BXI48k8X++NfAGqYkIfqm8XPLeJ6iao9wRCRykGs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgCCN7f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 08:59:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:45724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729361AbgCCN7e (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 08:59:34 -0500
Received: from mail.kernel.org (tmo-101-56.customers.d1-online.com [80.187.101.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7D2D2166E;
        Tue,  3 Mar 2020 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583243973;
        bh=Ot18DWlFBytWvI74fTpVOFcLADsv25orW6rh6cH6rsM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g0CYCZHMxdjsi8yhkDgRJr4gZR12/iK8zGY5a6jdd52U+qHRbdH76+gm0o8X2Dxbg
         99dikWMH9JO9NL6NRQsS/hqhMEXDj1pjUbynIx/2UqFjVEaMjNVyMLYpCqcVddT083
         P+FrNiJhsJPEkmp2abuKr6IZi++rw3BcqzExpZPg=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9850-001Ydk-Go; Tue, 03 Mar 2020 14:59:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 13/18] docs: arm64: convert perf.txt to ReST format
Date:   Tue,  3 Mar 2020 14:59:20 +0100
Message-Id: <464c57fc814c370d3c4002c6768c1eac83fbc9a9.1583243826.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583243826.git.mchehab+huawei@kernel.org>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This file is almost in ReST. All it needs is a rename and
adding a :field: for the two fields at the beginning
(author and date).

While here, add a proper SPDX header, and use the standard
markup for document titles, just for consistency.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/arm64/index.rst              | 1 +
 Documentation/arm64/{perf.txt => perf.rst} | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)
 rename Documentation/arm64/{perf.txt => perf.rst} (95%)

diff --git a/Documentation/arm64/index.rst b/Documentation/arm64/index.rst
index 5c0c69dc58aa..c51d0fa80318 100644
--- a/Documentation/arm64/index.rst
+++ b/Documentation/arm64/index.rst
@@ -13,6 +13,7 @@ ARM64 Architecture
     hugetlbpage
     legacy_instructions
     memory
+    perf
     pointer-authentication
     silicon-errata
     sve
diff --git a/Documentation/arm64/perf.txt b/Documentation/arm64/perf.rst
similarity index 95%
rename from Documentation/arm64/perf.txt
rename to Documentation/arm64/perf.rst
index 0d6a7d87d49e..9c76a97baf28 100644
--- a/Documentation/arm64/perf.txt
+++ b/Documentation/arm64/perf.rst
@@ -1,8 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================
 Perf Event Attributes
 =====================
 
-Author: Andrew Murray <andrew.murray@arm.com>
-Date: 2019-03-06
+:Author: Andrew Murray <andrew.murray@arm.com>
+:Date: 2019-03-06
 
 exclude_user
 ------------
-- 
2.24.1

