Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EF1C64E75
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7FAA2220B
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604043778;
	bh=XR/oSElOT93+2M6RvTqr2t2UrT4aYUZtZeYaZfihrtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dWTJfmNx3hXPjzTtXeqp3n0WalBgcYWF0Dw64lP3d0uAzc2J8ovNGKNseY2CebkyW
	 9fUzsAv0tbsg3HpTbiYxYir0ccCzYbDcvS+hQ73Wusi7GkvHXcIjJ0mATdavkXKUtN
	 aQJ1htzj/tXgYyrFRFdSF9xAgYTK9fmjJEjUYDIw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgJ3Hm5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:42:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:51964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbgJ3HlF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:41:05 -0400
Received: from mail.kernel.org (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39692222E9;
        Fri, 30 Oct 2020 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043663;
        bh=XR/oSElOT93+2M6RvTqr2t2UrT4aYUZtZeYaZfihrtQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rm3jNsRInyXyrJ5WmKIGGH8jThUnLFxdVcGAKFvKX/3hVnHsGdONbFWlwT4swvusb
         z+G7QzHMcwPhrH5adLxoZPfB4hIWGt+LtCUD+c+6SkziZIKPnGIvdX60blNPe4kfuS
         Y3Vv9kCenf2ue2H8k2QNYBvsPFWNUTL57GQlV8BY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kYP1x-004OgO-9s; Fri, 30 Oct 2020 08:41:01 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/39] docs: abi-testing.rst: enable --rst-sources when building docs
Date:   Fri, 30 Oct 2020 08:40:44 +0100
Message-Id: <9242473fd3df785565bb6084b1b814cc15074fb2.1604042072.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604042072.git.mchehab+huawei@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that ABI/testing documents were fixed, add --rst-sources to
the ABI/testing too.

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

