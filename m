Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6C0C43467
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BB6120870
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590271;
	bh=2r6oOY4xsG1EB6Z1iMtvKymMAv8zcB6pr2HFpKVhvXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GCXnhC4O9A8J5bf4QWPKc/MmQa6Y6uWqq77Bz0HAGOceHFMTos7ZS79RMFSDuKcoy
	 5oF1GY//8GMVgVP+LJ/LEbPJVEwQU9Yp8YAd0VpXam0HYmePRZQYiD76+TOiqB0v01
	 tEaAIPuJxMziDTktNJE6/epHRDqs/7RUJfyY6NSM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgJML5u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:57:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:57414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727623AbgJMLyr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:47 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E89F224B2;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=2r6oOY4xsG1EB6Z1iMtvKymMAv8zcB6pr2HFpKVhvXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ibopTsWKw9hs5svADXE3qtIKg5fujz6f7Pz/dGNc+Ui5TttEQfPEfB3W0n52wrM13
         cYZfJBS8WvBDYRhsRI6PRXKarwRVC1st0V5Tvs4A++zRw5Id6OwddPCHtD1qKIgBY7
         6Av4A98tkr8Jp2+BxNL3Y6TQTdHOn+kbiblrzcsY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVb-5u; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Bailu Lin <bailu.lin@vivo.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 52/80] docs: zh_CN: amu.rst: fix document title markup
Date:   Tue, 13 Oct 2020 13:54:07 +0200
Message-Id: <941f4eeef21060519a88f55e45cbca2432ecb2af.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As warned by Sphinx 2.4.4:
	.../Documentation/translations/zh_CN/arm64/amu.rst:7: WARNING: Title overline too short.

Increase its size.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/translations/zh_CN/arm64/amu.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/arm64/amu.rst b/Documentation/translations/zh_CN/arm64/amu.rst
index bd875f221330..ab7180f91394 100644
--- a/Documentation/translations/zh_CN/arm64/amu.rst
+++ b/Documentation/translations/zh_CN/arm64/amu.rst
@@ -4,9 +4,9 @@
 
 Translator: Bailu Lin <bailu.lin@vivo.com>
 
-=================================
+==================================
 AArch64 Linux 中扩展的活动监控单元
-=================================
+==================================
 
 作者: Ionela Voinescu <ionela.voinescu@arm.com>
 
-- 
2.26.2

