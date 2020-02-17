Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCC0C3402D
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21CDE2467A
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581956450;
	bh=Ot18DWlFBytWvI74fTpVOFcLADsv25orW6rh6cH6rsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=RyFGMm/Pmh7eYmAbtTHd5wZ0WD5+2lyZ7AuM3PhFH6EfXQgTe6tdDnq3QYPXkkG2f
	 W3IIRm58Fh6jTkwnSuD+n9jQU4u03Qwk/6jtowlstZ/uCRypEgpfC9lWPHUlsCRLLQ
	 y+QJLIU2njmrZ015WJOVOF/rekFS296ngqE1f5sI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgBQQUt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 11:20:49 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54992 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728641AbgBQQUr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 11:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=e6JQvreTqUrxRNizPuTbgANlfRUXBW3r+aXd6NswrsU=; b=egZbiJM3WvHU3Rd/cH9wINSGKI
        Ub9M6TlQImpgeo4mQN5hy7xk3ZACpd3/CTwea0KadiZJDm3D3s73yVI8YTkeo7KPlNmYMQ55yJHjA
        6lXeu/tHMuxEfVCW8cFRRZfQ/qKnjdbCUQTvn7c0hupe1Smd3Y14Ln0FFn20L+luMb1ORNUvMuLYb
        0PPNXlj/CbsgmTzLFhZ9kdrIr56Ehs87HlZ+3yqxi50RHXEmHfuvgnf37ZD0Gmn626CCYF6WE9m4g
        Rl0i9mmpqqwirI/YzOsA2YQV4W8lGa1IcaLaufeRgZhElQYffbBZwui5x0jTnHrMbzW3Qv5Lbpt0m
        /yrkHKHg==;
Received: from ip-109-41-129-189.web.vodafone.de ([109.41.129.189] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j8Y-00042C-3U; Mon, 17 Feb 2020 16:20:46 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fpb-6o; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 13/24] docs: arm64: convert perf.txt to ReST format
Date:   Mon, 17 Feb 2020 17:20:31 +0100
Message-Id: <e000ccaf21f899a4c503c0a0e8734a2a3e177ee6.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

