Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BDEAB7D910
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Jun 2019 12:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfF1Mah (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 28 Jun 2019 08:30:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39056 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfF1Mah (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Jun 2019 08:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=u0XBX14yTz/qW5By7IYdw4j6K9GzLfVkB2VWy7+C92w=; b=VuCxbi5JZ8RCt9xsjkgSEKU7Vx
        Gk9p0nT7voNeKAV8jYvEMkFM9n2HQ0nzEtorTJ95K49KA9BtA/vLGPCs0f1GQXIjhPZBvqO4VHu46
        vaOaqof9DHPWQj3MjRGjmuaXh6DUeO9RSruQu0sRgee+pNT2r6XCSPWBxGSTHR/0v1/2h3y1ijQkp
        p99XZpWna1R8y6WZ/tYJ4ackuTXdXoKKlBN3sVNMD+s9Zj4/VgdYL/P6XJdWRoml+E1TmkTEzWECq
        I6+c1kuzscGcS9kzUU6yswiJ5zyn5uoIlrkdvTbTO3WkDnIhJp3QD91nUpDQzmhLJ9VQhDp79RPLb
        gSE+EXqg==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hgq1U-000557-62; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hgq1S-0005Rn-7R; Fri, 28 Jun 2019 09:30:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 11/39] docs: ioctl: add it to the uAPI guide
Date:   Fri, 28 Jun 2019 09:30:04 -0300
Message-Id: <0ad1565cdee5cf3f6ddf9d8e13e1431341ed0d0f.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While 100% of its contents is userspace, let's keep the dir
at the same place, as this is a well-known location.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/index.rst              | 1 +
 Documentation/ioctl/index.rst        | 2 +-
 Documentation/ioctl/ioctl-number.rst | 2 --
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 3a17a621896c..95db26bf2899 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -56,6 +56,7 @@ the kernel interface as seen by application developers.
    :maxdepth: 2
 
    userspace-api/index
+   ioctl/index
 
 
 Introduction to kernel development
diff --git a/Documentation/ioctl/index.rst b/Documentation/ioctl/index.rst
index 1a6f437566e3..0f0a857f6615 100644
--- a/Documentation/ioctl/index.rst
+++ b/Documentation/ioctl/index.rst
@@ -1,4 +1,4 @@
-:orphan:
+.. SPDX-License-Identifier: GPL-2.0
 
 ======
 IOCTLs
diff --git a/Documentation/ioctl/ioctl-number.rst b/Documentation/ioctl/ioctl-number.rst
index e6d07badafb1..597111dcca0c 100644
--- a/Documentation/ioctl/ioctl-number.rst
+++ b/Documentation/ioctl/ioctl-number.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 =============
 Ioctl Numbers
 =============
-- 
2.21.0

