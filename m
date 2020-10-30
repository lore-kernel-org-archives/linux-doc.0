Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3EFC64E69
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09AC122228
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604043824;
	bh=zC6uotoZC5URus/Ygfz/qeT2QIvCXOIgT+5HOKI+wVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Su6W0ZrG2r1x7ecWGo6ebBOklILrxrVkBDNI9HLjOwIe4CftrxSzCGkba6uR+MMN7
	 fEegoGzr/FcSGCJYW0Bp6zkFZkhOn7V0wlRYgzpdjhKzJ6w8y0tmUh/pMb3DrkrMDQ
	 NSgY2Ze3W+aqZrwmPYpc54eXejtWZYG5N7FwLpsc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgJ3HlE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:41:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:51630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbgJ3HlD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:41:03 -0400
Received: from mail.kernel.org (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 842A022228;
        Fri, 30 Oct 2020 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043662;
        bh=zC6uotoZC5URus/Ygfz/qeT2QIvCXOIgT+5HOKI+wVM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rNMqq6Y3bPE2+GddyPIo/quZlO24OutVIEzP6QhnCKC61IMC0n3yzfzUYE1NGVsYz
         Wav66iHR0bn7V0IO5tuzIeEWCI3D8sWqoikb7ghr3hjRtRR1sKvEKyqutXyT8PvxfW
         4T8j79jkJFSe+9mVkXEY2PnU6w+LSsNZMFcqCLl4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kYP1w-004Off-Jb; Fri, 30 Oct 2020 08:41:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/39] docs: kernellog.py: add support for info()
Date:   Fri, 30 Oct 2020 08:40:30 +0100
Message-Id: <0ddebd8677605d789d53433c8a5344c68da82a73.1604042072.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604042072.git.mchehab+huawei@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An extension may want to just inform about something. So, add
support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernellog.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/kernellog.py b/Documentation/sphinx/kernellog.py
index af924f51a7dc..8ac7d274f542 100644
--- a/Documentation/sphinx/kernellog.py
+++ b/Documentation/sphinx/kernellog.py
@@ -25,4 +25,8 @@ def verbose(app, message):
     else:
         app.verbose(message)
 
-
+def info(app, message):
+    if UseLogging:
+        logger.info(message)
+    else:
+        app.info(message)
-- 
2.26.2

