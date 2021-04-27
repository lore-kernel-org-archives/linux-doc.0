Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619CFC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 27 Apr 2021 11:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31BC7600D1
	for <linux-doc@archiver.kernel.org>; Tue, 27 Apr 2021 11:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbhD0LtZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Apr 2021 07:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhD0LtZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Apr 2021 07:49:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D958DC061574
        for <linux-doc@vger.kernel.org>; Tue, 27 Apr 2021 04:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=KgqNrvhqbkYRs1e8PRO7AAt99JGYyuzsaLp4r/w6m6g=; b=McDuv/e6A+tsBP2W2ocFcElcG8
        jZ0vjki90jc36R9t8QwRd0ckdgv/0yylO5IU8A/IJvjk1h6GL5lqLWEK1r5uXDvcRYVGOEaXOu8wk
        Ogwi0bb88YcJJqDY0DXWnZFvgXgrZBrRuWA/WUALmWpZxlqp533CVgi3Zj+HTP8Zo72gndpH/Wgl6
        7ZMyVbCzrw+F/bmJSLlavZ45DzNa9zdc0VFbPImlss4ukUbTEbNq52CxlMiD03K/NcCekYOqfqou2
        vDvFb7MmlDIrbV3fihpXLbPsfgANo6eD2vX0SkoxnS46BUefXb3BtnUuBrZN00aOWmUWfNGkt64I9
        rvw8uvww==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lbMCa-006rdI-9c; Tue, 27 Apr 2021 11:48:32 +0000
Date:   Tue, 27 Apr 2021 12:48:28 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, mchehab+huawei@kernel.org,
        yashsri421@gmail.com, lukas.bulwahn@gmail.com
Subject: [PATCH] kernel-doc: Add support for __deprecated
Message-ID: <20210427114828.GY235567@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current linux-next tree has a new error:

./Documentation/gpu/drm-mm:445: ./drivers/gpu/drm/drm_prime.c:994: WARNING: Error in declarator or parameters
Invalid C declaration: Expecting "(" in parameters. [error at 17]
  int __deprecated drm_prime_sg_to_page_array (struct sg_table *sgt, struct page **pages, int max_entries)
  -----------------^

While we might consider that documenting a deprecated interface is not
necessarily best practice, removing the error is easy.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 2a85d34fdcd0..4840e748fca8 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1777,6 +1777,7 @@ sub dump_function($$) {
     $prototype =~ s/^noinline +//;
     $prototype =~ s/__init +//;
     $prototype =~ s/__init_or_module +//;
+    $prototype =~ s/__deprecated +//;
     $prototype =~ s/__flatten +//;
     $prototype =~ s/__meminit +//;
     $prototype =~ s/__must_check +//;
