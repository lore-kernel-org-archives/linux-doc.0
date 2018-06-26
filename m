Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B2FB07DF89
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 09:49:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933505AbeFZJtS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 05:49:18 -0400
Received: from osg.samsung.com ([64.30.133.232]:54850 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932629AbeFZJtS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Jun 2018 05:49:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 4C24830B9A;
        Tue, 26 Jun 2018 02:49:17 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uKM6LoYRZXsP; Tue, 26 Jun 2018 02:49:16 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.130.70.dynamic.adsl.gvt.net.br [177.41.130.70])
        by osg.samsung.com (Postfix) with ESMTPSA id 3F49B30B84;
        Tue, 26 Jun 2018 02:49:16 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fXkb4-0000lq-3c; Tue, 26 Jun 2018 06:49:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>, linux-kernel@zh-kernel.org
Subject: [PATCH 3/9] docs: zh_CN: fix location of oops-tracing.txt
Date:   Tue, 26 Jun 2018 06:49:05 -0300
Message-Id: <46a7c7ebc4b1d64f2d73fa3e9d47c0eb40685486.1530005114.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1530005114.git.mchehab+samsung@kernel.org>
References: <cover.1530005114.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1530005114.git.mchehab+samsung@kernel.org>
References: <cover.1530005114.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This file was merged with bug-hunting. Make the translation
to point for its new location.

Fixes: f226e460875d ("admin-guide: merge oops-tracing with bug-hunting")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/translations/zh_CN/oops-tracing.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/oops-tracing.txt b/Documentation/translations/zh_CN/oops-tracing.txt
index 41ab53cc0e83..a893f04dfd5d 100644
--- a/Documentation/translations/zh_CN/oops-tracing.txt
+++ b/Documentation/translations/zh_CN/oops-tracing.txt
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/admin-guide/oops-tracing.rst
+Chinese translated version of Documentation/admin-guide/bug-hunting.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -8,7 +8,7 @@ or if there is a problem with the translation.
 
 Chinese maintainer: Dave Young <hidave.darkstar@gmail.com>
 ---------------------------------------------------------------------
-Documentation/admin-guide/oops-tracing.rst 的中文翻译
+Documentation/admin-guide/bug-hunting.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
