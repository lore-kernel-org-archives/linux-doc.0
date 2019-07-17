Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B75497D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 11:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfGQLG1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 07:06:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48640 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfGQLG1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 07:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TeaGt8pI6Vwu62riXQZpDCGAriDc3nIBGdy7UclDHhY=; b=FeMM/bySi/3Y6cSmJk5saNZbaU
        GG3cdUvXOnJHZWBAHQhc+/KdyjiNXtSqVsQ5SZ/bR4TmoQx/mf3E5U+8HIGgYQjcgADgNI++NKFhp
        lmOCgTVlKj8ExD94fq5YvqDF4II1KNkFaPFXD+ZvRaUojFcsWwqWyLQeHTFck6iTMhZjr3NjrLBMD
        /RUlAWOW40MeRx8ve5+evfiMOCGXyAtyS1IHZC+4VJIaHQikG5PgGuJ2M7Uko9DydNypN3sgmIEIc
        3uadI/5oT+geRYMxp0DHTbIrCbIn4fAQ2z8ljf13lWZCJCuS4xd6c+t+/M9KtPcSixpQVwnAOR4yk
        TjzuBbUg==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhlP-0005Q3-Mh; Wed, 17 Jul 2019 11:06:23 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhlN-0003Ce-PJ; Wed, 17 Jul 2019 08:06:21 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] docs: gpu: add msm-crash-dump.rst to the index.rst file
Date:   Wed, 17 Jul 2019 08:06:20 -0300
Message-Id: <4d4868a11449a1a34f38da48f527c051fc00e1a9.1563361575.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <7f18c2e0b5e39e6b7eb55ddeb043b8b260b49f2d.1563361575.git.mchehab+samsung@kernel.org>
References: <7f18c2e0b5e39e6b7eb55ddeb043b8b260b49f2d.1563361575.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This file is currently orphaned.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/gpu/drivers.rst        | 1 +
 Documentation/gpu/msm-crash-dump.rst | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 4bfb7068e9f7..6c88c57b90cf 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -20,6 +20,7 @@ GPU Driver Documentation
    xen-front
    afbc
    komeda-kms
+   msm-crash-dump
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/msm-crash-dump.rst b/Documentation/gpu/msm-crash-dump.rst
index 240ef200f76c..757cd257e0d8 100644
--- a/Documentation/gpu/msm-crash-dump.rst
+++ b/Documentation/gpu/msm-crash-dump.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 =====================
 MSM Crash Dump Format
 =====================
-- 
2.21.0

