Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D26C4741F
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0438520760
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993090;
	bh=lFEzsRGazv6x3BF+7IzZhV96OJvEaoKXaQrpvpjxmPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=JCSqftrL8LUqgGPZ78/FLjSe+vVr78v09ztGhsVfNL2oEdHBN5LbEJqDW4tQNfw4j
	 8XhmyGW2sWwYsFTMHnDrNLuS/d2nTgCKj85RZvpeBghVpagl9rgaR3Y3M+J8SQIgmf
	 is0IKR3WFs787rm4rEy6oXiH2b/iiR8NCgHBFVN8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgJFOEi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:04:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:33308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgJFOD5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:57 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A83E723119;
        Tue,  6 Oct 2020 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993035;
        bh=lFEzsRGazv6x3BF+7IzZhV96OJvEaoKXaQrpvpjxmPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NJaZRNvukt2ysPBrOilsq68dO6o5dHYG8LjEX1XAAQ5cvnMGDs99NTeafRuDRPJAC
         HYVpH1tZGlkbVlb7pZudXfBcH+6P9KhW9yDY+knV8NWvCnGrqCu9kMqbqQYJgC1Xvk
         QRqo/4p425Mt+VVxQln0JhdM8sspNrorxCdF3Uqw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019Fm-BH; Tue, 06 Oct 2020 16:03:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 29/52] docs: basics.rst: move kernel-doc workqueue markups to workqueue.rst
Date:   Tue,  6 Oct 2020 16:03:26 +0200
Message-Id: <c03064a3b88d2d8e43fada8dbe38fae8ac97d1c6.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As there's already a rst file with workqueue markups, containing
part of them, move the other definitions, in order to avoid
warnings with Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/core-api/workqueue.rst | 2 ++
 Documentation/driver-api/basics.rst  | 9 ---------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index 00a5ba51e63f..541d31de8926 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -396,3 +396,5 @@ Kernel Inline Documentations Reference
 ======================================
 
 .. kernel-doc:: include/linux/workqueue.h
+
+.. kernel-doc:: kernel/workqueue.c
diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 1ba88c7b3984..54f8d5ca7475 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -55,15 +55,6 @@ High-resolution timers
 .. kernel-doc:: kernel/time/hrtimer.c
    :export:
 
-Workqueues and Kevents
-----------------------
-
-.. kernel-doc:: include/linux/workqueue.h
-   :internal:
-
-.. kernel-doc:: kernel/workqueue.c
-   :export:
-
 Internal Functions
 ------------------
 
-- 
2.26.2

