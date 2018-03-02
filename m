Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4875F7E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 14:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1428747AbeCBOvB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 09:51:01 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55430 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1426414AbeCBOu6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 09:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3qzHz+c9Tueha68CSRg9v72bAgJe63vFEgnGN+cRjGQ=; b=KT4y2CJKPCaVe7rN77s9IhmuW
        JRrmkrvZwMMkuoepJrfm7ScZLXWwYcGahaob3t0BLGKBHkQ/MVMxQt5nIye8Y0vVM+dMtp6tD1zyf
        7WfcTOeYJ1DZg615NMOLHiNHOUiLjvKf6Kod1oXATuvfwBQ8sO7xUwanhSF1xG8ZPsaElIXBK/6sn
        IxW9oFU98VTMtD8WmYMFkjKmBP8iY4kthAeZy7VE+lsMGJ/0SspsO/exOvNrXyOLVhwoKK66edKHA
        nSAIEoEVi1qM818X6yJyfKXKSwNPpZAwN7rm4kRMgvmNUNqm0NWuBzRZOknMJThbwiw6GFYXdnWVt
        GCS+mva0Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.89 #1 (Red Hat Linux))
        id 1erm1P-0005CT-Du; Fri, 02 Mar 2018 14:50:55 +0000
Date:   Fri, 2 Mar 2018 06:50:55 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/sphinx: Fix Directive import error
Message-ID: <20180302145055.GA18137@bombadil.infradead.org>
References: <s5hbmg6hf4g.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hbmg6hf4g.wl-tiwai@suse.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 02, 2018 at 12:49:03PM +0100, Takashi Iwai wrote:
> I'm no expert of sphinx nor python, so something might be wrong.
> Please check it.

I'm also not a pythonista, but ...

> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -37,7 +37,10 @@ import glob
>  from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives
> -from sphinx.util.compat import Directive
> +try:
> +    from sphinx.util.compat import Directive
> +except ImportError:
> +    from docutils.parsers.rst import directives, Directive

It seems to me the previous line already imported
docutils.parsers.rst.directives, and we should probably prefer the newer
parser even with Sphinx 1.6, so I would think this would work better:

-from sphinx.util.compat import Directive
+try:
+    from docutils.parsers.rst import Directive
+except ImportError:
+    from sphinx.util.compat import Directive

(it works on Debian with Sphinx 1.6.7)

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
