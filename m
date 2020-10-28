Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B9EC4363A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:56:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21553207DE
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603932981;
	bh=Bc48DMVromEXcAPrh73xm9mJBiyt5U+xZVP6uUdJV0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=K4QK6iM9riimbhck/BYt9olcRC1T01aOLhKJSwNiO+n+cc4nVWeqUqtVRVn0EiFEI
	 JEQJNZNLobKA57RvT6h3L0EkpR8zGjnh+2HPAzWZpKFGpUnOp9gyM78YVnLkiCmjLn
	 u9wJ05Hp2Too2Ep68AwbFZ0rKdb11+o5qh0Wziek=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgJ2A4D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:56:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:60514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731639AbgJ1WRh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:37 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5785C247A5;
        Wed, 28 Oct 2020 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603895015;
        bh=Bc48DMVromEXcAPrh73xm9mJBiyt5U+xZVP6uUdJV0w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HO3nkyxxyd6+pZV93/SJ9jIABPlO+odqAzJUFoLkYg5jmyQ0TvIS3NuQ2Oh4HtJO+
         Q1QX/ruyNRn5NwZjIp/VEl34NKIuZgU8yXW5oeDxKql2mLLEkTy9AqJtg00h9fD5me
         vigLhKuMvqm0JKkJRfPqdyhmQLQwsReul1LkS3bg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXmMP-003hlp-Bx; Wed, 28 Oct 2020 15:23:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 24/33] docs: abi-testing.rst: enable --rst-sources when building docs
Date:   Wed, 28 Oct 2020 15:23:22 +0100
Message-Id: <5548e1ab29905a4e0e91e5b8926412a6ef9f7be3.1603893146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Now that ABI/testing documents were fixed, add --rst-sources to
the ABI/testing too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/abi-testing.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index 5c886fc50b9e..b205b16a72d0 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -17,3 +17,4 @@ name to the description of these interfaces, so that the kernel
 developers can easily notify them if any changes occur.
 
 .. kernel-abi:: $srctree/Documentation/ABI/testing
+   :rst:
-- 
2.26.2

