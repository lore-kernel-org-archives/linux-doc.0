Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5DDCC7E282
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 18:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1946447AbeCBSkU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 13:40:20 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:41270 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967965AbeCBSkR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 13:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OhYQBM53Krdm4L88RFQjUUPksu6NxoraXJ33HaU3bWI=; b=T5yQcZL1vqUEFor8epzPODil/
        bd3zcalPHV2QrJfS8Xfvu+GBktI6rJGmPDdHRk1GPuGbhEvBEmc/ouolSAZBW1CEJbf2+CwNJHR8S
        k64OLv4PlYDcymJ/UqGuspZKrLjmRrFCm2+FHDHSUPLn9if1pbyP9jEAwNgMae0vfcPQwZ8M4cJxk
        aHkUD1nWm2mno2pdKenpdFSpZ8MFrsd1NQLSSZjekMPKvdmOz/RqO0roRGS1Wc0leQnFQ1x2XGjiC
        uPxsldoCkUGbpTuTDLE0wcjogqo/ppZDg5iA+ypJS+oMDm4d909J8KlIr4cTGtGojPoHnPRV3GJpn
        MTUcaEeuQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.89 #1 (Red Hat Linux))
        id 1erpbL-0007Ed-9b; Fri, 02 Mar 2018 18:40:15 +0000
Date:   Fri, 2 Mar 2018 10:40:14 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@intel.com>,
        Jiri Slaby <jslaby@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] Documentation/sphinx: Fix Directive import error
Message-ID: <20180302184014.GG31400@bombadil.infradead.org>
References: <20180302152831.11510-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180302152831.11510-1-tiwai@suse.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Matthew Wilcox <mawilcox@microsoft.com>

Sphinx 1.7 removed sphinx.util.compat.Directive so people
who have upgraded cannot build the documentation.  Switch to
docutils.parsers.rst.Directive which has been available since
docutils 0.5 released in 2009.

Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=1083694
Co-developed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 39aa9e8697cc..fbedcc39460b 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -36,8 +36,7 @@ import glob
 
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
-from docutils.parsers.rst import directives
-from sphinx.util.compat import Directive
+from docutils.parsers.rst import directives, Directive
 from sphinx.ext.autodoc import AutodocReporter
 
 __version__  = '1.0'
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
