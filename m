Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,RCVD_IN_DNSWL_HI autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 007AF7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Apr 2019 16:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfDBQA1 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Apr 2019 12:00:27 -0400
Received: from ms.lwn.net ([45.79.88.28]:46094 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbfDBQA1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 2 Apr 2019 12:00:27 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D04B89B5;
        Tue,  2 Apr 2019 16:00:26 +0000 (UTC)
Date:   Tue, 2 Apr 2019 10:00:25 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     harryxiyou@gmail.com, leoyang.li@nxp.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/59] Chinese docs translationn series 2
Message-ID: <20190402100025.27097923@lwn.net>
In-Reply-To: <20190401144506.49718-1-alex.shi@linux.alibaba.com>
References: <20190401144506.49718-1-alex.shi@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  1 Apr 2019 22:44:07 +0800
Alex Shi <alex.shi@linux.alibaba.com> wrote:

> This patch series add a few new docs in Chinese, updated 
> submitting-patches and howto docs, All docs rebased on Jon's
> docs-next branch.
> 
>     make htmldocs result show at:
>     http://176.122.172.82/translations/zh_CN/index.html

OK, I have applied the set.  A couple of notes/requests:

 - This set introduced this build error:

	Documentation/translations/zh_CN/process/coding-style.rst:3:
	WARNING: undefined label: codingsytle (if the link has no caption
	the label must precede a section header)

   I added the patch below to fix that.  Please be sure to build the docs
   after a series like this to ensure that no new warnings have been added.

 - This is a *lot* of stuff.  In the future, keeping each series smaller
   would be appreciated.

Thanks,

jon

From 5e3ec254e086f348346df3f00a6d372defd10d4e Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 2 Apr 2019 09:58:08 -0600
Subject: [PATCH] docs: Fix a build error in coding-style.rst

A reference typo caused an unsightly build error; fix it.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/translations/zh_CN/process/coding-style.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
index cab9ceafa267..5479c591c2f7 100644
--- a/Documentation/translations/zh_CN/process/coding-style.rst
+++ b/Documentation/translations/zh_CN/process/coding-style.rst
@@ -1,6 +1,6 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/process/coding-style.rst <codingsytle>`
+:Original: :ref:`Documentation/process/coding-style.rst <codingstyle>`
 
 .. _cn_codingstyle:
 
-- 
2.20.1


