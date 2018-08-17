Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 061027D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 17 Aug 2018 04:12:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbeHQHN6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 17 Aug 2018 03:13:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33432 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbeHQHN6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Aug 2018 03:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Cc:Subject:From:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6icK3hqcwiU+dGAr4pRZr6S8nGOm/V4v5PIM+5fUT9M=; b=LP+Pg2l4HED4hAQKQpL+45hrT
        C4LgkJC8pp1qQl9Qi14IDt0PUVAKxCKCXK3nQUXMkh++U/xT0ZMAfpEL0K9h3J08Z7sknrlGlOr4k
        fQk7m5IeGghkbYHAt9USnU7CK/GS+apTp56wzmS2GOVQYwxa2R52Au3YlvQfS+SRRLVZEv67Z7k9H
        bMI27gOMQ+ZTgSurOIz9KNk9KhKRaFGKJWaZyT9OdnIOU9kcbmEBzqPrx8JU3tm06YzZcwEc90R0d
        8CYxrsk7ZE3KUyidVtRXSiRUFflrOYKmHZ06M9Hs/gOLbulDTdMDgwGEcyr69uEJIXBTYe9fVqCFD
        K4WGYc3Aw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fqW7M-0004EL-FM; Fri, 17 Aug 2018 04:12:08 +0000
To:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation/fb/vesafb.txt: "inverse" option corrections
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Antonino Daplas <adaplas@gmail.com>
Message-ID: <b77dcfee-2cc2-adb0-645e-369fc032abd1@infradead.org>
Date:   Thu, 16 Aug 2018 21:12:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Spell the vesafb "inverse" option correctly and tell what it does.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Antonino A. Daplas <adaplas@gmail.com>
---
 Documentation/fb/vesafb.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-418.orig/Documentation/fb/vesafb.txt
+++ lnx-418/Documentation/fb/vesafb.txt
@@ -114,11 +114,11 @@ to turn it on.
 
 You can pass options to vesafb using "video=vesafb:option" on
 the kernel command line.  Multiple options should be separated
-by comma, like this: "video=vesafb:ypan,invers"
+by comma, like this: "video=vesafb:ypan,inverse"
 
 Accepted options:
 
-invers	no comment...
+inverse	use inverse color map
 
 ypan	enable display panning using the VESA protected mode 
 	interface.  The visible screen is just a window of the

