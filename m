Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0EAAA7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 09:51:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752087AbeCWJv3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 05:51:29 -0400
Received: from osg.samsung.com ([64.30.133.232]:44363 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751839AbeCWJv2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Mar 2018 05:51:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 347DB2A16E;
        Fri, 23 Mar 2018 02:51:28 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PiQe50aaa3sQ; Fri, 23 Mar 2018 02:51:27 -0700 (PDT)
Received: from smtp.s-opensource.com (unknown [179.183.96.62])
        by osg.samsung.com (Postfix) with ESMTPSA id 1F35B2A15E;
        Fri, 23 Mar 2018 02:51:27 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1ezJM5-000639-3Y; Fri, 23 Mar 2018 06:51:25 -0300
From:   Mauro Carvalho Chehab <mchehab@s-opensource.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-doc <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonas Oberg <jonas@fsfe.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 0/2] COPYING: create a new file with points to the Kernel license files
Date:   Fri, 23 Mar 2018 06:51:04 -0300
Message-Id: <20180323095106.23108-1-mchehab@s-opensource.com>
X-Mailer: git-send-email 2.14.3
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The contents of COPYING file is now duplicated at two other
files under LICENSE:
	LICENSES/preferred/GPL-2.0
	LICENSES/exceptions/Linux-syscall-note

Also, a new file was added, with describes how SPDX should work at
the Kernel source files:
	Documentation/process/license-rules.rst

Instead fo having it copying the contents of two files, and not
even mentioning the third one, replace it by a file whose content
points to the other tree files, preserving the Kernel's license.

Adjust license-rules.rst accordingly.

No license changes.

NOTE
====

In order to make the diff easier to read, I broke it into two patches.
Feel free to merge both when merging if you want.


Mauro Carvalho Chehab (2):
  COPYING: create a new file with points to the Kernel license files
  COPYING: use the new text with points to the license files

 COPYING                                 | 358 +-------------------------------
 Documentation/process/license-rules.rst |  20 +-
 2 files changed, 21 insertions(+), 357 deletions(-)

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
