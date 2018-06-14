Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 144E57D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 16:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755235AbeFNQMi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 12:12:38 -0400
Received: from osg.samsung.com ([64.30.133.232]:56964 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755556AbeFNQJl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Jun 2018 12:09:41 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 5F42820F7A;
        Thu, 14 Jun 2018 09:09:40 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6tCQb6jbiY0U; Thu, 14 Jun 2018 09:09:39 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.114.220.dynamic.adsl.gvt.net.br [177.41.114.220])
        by osg.samsung.com (Postfix) with ESMTPSA id AF6E220EB7;
        Thu, 14 Jun 2018 09:09:16 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fTUoE-0005UG-Mp; Thu, 14 Jun 2018 13:09:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 26/27] Documentation: rstFlatTable.py: fix a broken reference
Date:   Thu, 14 Jun 2018 13:09:11 -0300
Message-Id: <0b7871892e856a8855ff0683bba79d051b78332d.1528990947.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The old HOWTO was removed a long time ago. The flat table
version is not metioned elsewhere, so just get rid of the
text.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/rstFlatTable.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/sphinx/rstFlatTable.py b/Documentation/sphinx/rstFlatTable.py
index 25feb0d35e7a..2019a55f6b18 100755
--- a/Documentation/sphinx/rstFlatTable.py
+++ b/Documentation/sphinx/rstFlatTable.py
@@ -53,8 +53,6 @@ from docutils.utils import SystemMessagePropagation
 # common globals
 # ==============================================================================
 
-# The version numbering follows numbering of the specification
-# (Documentation/books/kernel-doc-HOWTO).
 __version__  = '1.0'
 
 PY3 = sys.version_info[0] == 3
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
