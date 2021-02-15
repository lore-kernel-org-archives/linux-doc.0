Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D56C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B482E64E26
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhBOQZU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 11:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbhBOQVg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 11:21:36 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B57C061797
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=dPwDA9f36jIiA9u+9rbZ4zRphrpbPB5TI4ZFHHGGJrs=; b=mlfpl0XGY9e/pY7yIJOwOskv23
        QA1bO+abTCk6tM+swTXr3HCf+OIRlKrvKrOr1pbPZFnXCnH7XwpWNrnVJuBfTpmFz6/58wl/w5qrL
        Ob0NAeKXsBv235n85ErWJroDFDrd4TENyJrGBzEbMD/jIv0tgkNpObMkn0O2tjK9fdYWOkDrOqcMw
        3CHkEC7esoRUz1pZgv5EpZFlApQ1poPitksRGOtNWpuYq0soU2v6d1ZdrGx5Wwp45aazqDhGTCyon
        HG64X/Y630U9uJJGOpv5lm7V41e6LvXpW2vCMWDr+cu5jjqqDtJY2ZEm+KMrrJJow4Vtjantlll1J
        axLzKYyw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lBgZR-00Flvf-Q2; Mon, 15 Feb 2021 16:17:58 +0000
Date:   Mon, 15 Feb 2021 16:17:57 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Fix unaesthetic indentation
Message-ID: <20210215161757.GD2858050@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current documentation build looks like this:

$ make htmldocs
  SPHINX  htmldocs --> file:///home/willy/kernel/linux-next/Documentation/output
make[2]: Nothing to be done for 'html'.
WARNING: The kernel documentation build process
        support for Sphinx v3.0 and above is brand new. Be prepared for
        possible issues in the generated output.
        $

That extra indentation before my next prompt isn't pretty.  This patch
fixes it, but I'm not a pythonista, and maybe there's a better way.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5bd45d5fb0a0..8a9ed3f29cd5 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -50,7 +50,7 @@ if major >= 3:
     sys.stderr.write('''WARNING: The kernel documentation build process
         support for Sphinx v3.0 and above is brand new. Be prepared for
         possible issues in the generated output.
-        ''')
+''')
     if (major > 3) or (minor > 0 or patch >= 2):
         # Sphinx c function parser is more pedantic with regards to type
         # checking. Due to that, having macros at c:function cause problems.
