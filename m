Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 379057D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 15:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfJGPlo convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Oct 2019 11:41:44 -0400
Received: from ms.lwn.net ([45.79.88.28]:58024 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbfJGPlo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Oct 2019 11:41:44 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 300DD316;
        Mon,  7 Oct 2019 15:41:44 +0000 (UTC)
Date:   Mon, 7 Oct 2019 09:41:43 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: 'make help' br0ken for @echo ' valid values for SPHINXDIRS are:
 $(_SPHINXDIRS)'
Message-ID: <20191007094143.3a4d8a09@lwn.net>
In-Reply-To: <416a61e8-e40a-6266-3f6a-bdbadf9a10c3@infradead.org>
References: <416a61e8-e40a-6266-3f6a-bdbadf9a10c3@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2 Oct 2019 16:16:07 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> It seems that _SPHINXDIRS is empty.  I'm getting (short extract):
> 
>   make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2
>   valid values for SPHINXDIRS are: 
> 
>   make SPHINX_CONF={conf-file} [target] use *additional* sphinx-build
>   configuration. This is e.g. useful to build with nit-picking config.
> 
>   Default location for the generated documents is Documentation/output

Hmm...it looks like that broke with 9fc3a18a942f, which got rid of the
various conf.py files.  Something like the following seems to do the right
thing?  (It also shows that we have way too many top-level directories, but
that's a separate issue...)

Thanks,

jon

From d402c2de65bb9353e6222a05095f32929ae62373 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 7 Oct 2019 09:38:58 -0600
Subject: [PATCH] docs: Fix "make help" suggestion for SPHINXDIR

Commit 9fc3a18a942f ("docs: remove extra conf.py files") broke the setting
of _SPHINXDIRS in Documentation/Makefile.  Let's just have it look for an
index.rst file instead.

Fixes: 9fc3a18a942f ("docs: remove extra conf.py files")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index c6e564656a5b..ce8eb63b523a 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -13,7 +13,7 @@ endif
 SPHINXBUILD   = sphinx-build
 SPHINXOPTS    =
 SPHINXDIRS    = .
-_SPHINXDIRS   = $(patsubst $(srctree)/Documentation/%/conf.py,%,$(wildcard $(srctree)/Documentation/*/conf.py))
+_SPHINXDIRS   = $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst))
 SPHINX_CONF   = conf.py
 PAPER         =
 BUILDDIR      = $(obj)/output
-- 
2.21.0

