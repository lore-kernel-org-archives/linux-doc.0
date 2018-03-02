Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C16A7E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 16:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936615AbeCBQel (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 11:34:41 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:52464 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936591AbeCBQeQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 11:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=VBPCmx1ZBaU+F2+Weutn/iX0QHUliNEYuuFfPH15M6M=; b=DJXbe6B+gsogpmXm5NJRIRRN8
        oOTAVUpr74KzKzLEdg3Yy7sm1C3fxKXJIdkD2UYMzb39R+qDmOmNLMETfbdE+P2OIaKNiq8eIUCPW
        syuMlBxYPx+V07QJrSSHsTQyqKBN0xU+C7/zOlTEEijCNfV+KFf6gQx+tToIgPy9k5pwNXF8u6zd8
        C62dfFfPsatsNHihbzpQ/lfMCrs//DgO8Jd1RfqT/Z/VQIvmMq/OvVQtLsh2jrgZT5sSmn1JLj/I1
        dkAOdtKnSDee9QwyYVBix3+wN2hdXI+pIjT+b2zrBlKMEGLRGgn9dBgU7Pv/BY8jD8AVZ0UiaHEW6
        V1vuTTeJA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.89 #1 (Red Hat Linux))
        id 1erndM-0008Ke-Dn; Fri, 02 Mar 2018 16:34:12 +0000
Date:   Fri, 2 Mar 2018 08:34:12 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@intel.com>,
        Jiri Slaby <jslaby@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/sphinx: Fix Directive import error
Message-ID: <20180302163412.GA31400@bombadil.infradead.org>
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

On Fri, Mar 02, 2018 at 04:28:31PM +0100, Takashi Iwai wrote:
>  from docutils.parsers.rst import directives
> -from sphinx.util.compat import Directive
> +try:
> +    from docutils.parsers.rst import directives, Directive

We also don't need 'directives' on this line as it was imported on the
previous line.

> +except ImportError:
> +    from sphinx.util.compat import Directive
>  from sphinx.ext.autodoc import AutodocReporter
>  
>  __version__  = '1.0'

Here's what I tested on Debian:

+++ b/Documentation/sphinx/kerneldoc.py
@@ -37,7 +37,10 @@ import glob
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives
-from sphinx.util.compat import Directive
+try:
+    from docutils.parsers.rst import Directive
+except ImportError:
+    from sphinx.util.compat import Directive
 from sphinx.ext.autodoc import AutodocReporter
 
 __version__  = '1.0'

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
