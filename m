Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BAAF47D2EF
	for <lwn-linux-doc@archive.lwn.net>; Sat, 22 Jun 2019 17:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfFVRrv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 22 Jun 2019 13:47:51 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46540 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfFVRrv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jun 2019 13:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mW9Wc/CU/UJbAQZ138GmClrxJfe6OfdsVjDCEUqxJpo=; b=Bp5CXpqL1F1hcSOGQAGMR20qc
        PHBWx5xsmYiHuhui86o634LyAwhnVUzq+3tVYMuCkpICz/3cvBjsYO2dmaxh3+Z9hu+o+ZSPZY0BY
        Ix3/Gt+lBsTNf9B7hT5FT0sY9n5U76y8ow0zbYo+kYN14wGNne/dMZnIAVvBx7Pnnynt265TzT6o/
        mIfAb+yKTwRbgJb0//S/ZUU4NXivCWDPV+3G1om4wQ6+MafGNJTXwr6kbzqsg773x5RV6Dy5q77oU
        q9ffjmlPsCPxRidCz2hSztLzDT+aA2e0JxWdVzaL4eDzqKyhrf9sPrQLQUGSstrTHvr/d0nTQh5h4
        /AkLg/Z0A==;
Received: from [179.95.45.115] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hek7C-0003CJ-F2; Sat, 22 Jun 2019 17:47:50 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hek79-0001S1-58; Sat, 22 Jun 2019 14:47:47 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>
Subject: [PATCH] docs: zh_CN: submitting-drivers.rst: Remove a duplicated Documentation/
Date:   Sat, 22 Jun 2019 14:47:46 -0300
Message-Id: <47f81418930438d1deab8da1307bcd89ba9afd91.1561225663.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Somehow, this file ended with Documentation/ twice.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/translations/zh_CN/process/submitting-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/process/submitting-drivers.rst b/Documentation/translations/zh_CN/process/submitting-drivers.rst
index 72c6cd935821..72f4f45c98de 100644
--- a/Documentation/translations/zh_CN/process/submitting-drivers.rst
+++ b/Documentation/translations/zh_CN/process/submitting-drivers.rst
@@ -22,7 +22,7 @@
 兴趣的是显卡驱动程序，你也许应该访问 XFree86 项目(http://www.xfree86.org/)
 和／或 X.org 项目 (http://x.org)。
 
-另请参阅 Documentation/Documentation/translations/zh_CN/process/submitting-patches.rst 文档。
+另请参阅 Documentation/translations/zh_CN/process/submitting-patches.rst 文档。
 
 
 分配设备号
-- 
2.21.0

