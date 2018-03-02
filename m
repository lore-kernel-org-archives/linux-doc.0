Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 907577E244
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 19:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1424254AbeCBTBF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 14:01:05 -0500
Received: from mga04.intel.com ([192.55.52.120]:51210 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1424211AbeCBTBF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Mar 2018 14:01:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2018 11:00:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,413,1515484800"; 
   d="scan'208";a="35047675"
Received: from walshcon-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.36.5])
  by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2018 11:00:57 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Matthew Wilcox <willy@infradead.org>, Takashi Iwai <tiwai@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jiri Slaby <jslaby@suse.cz>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Documentation/sphinx: Fix Directive import error
In-Reply-To: <20180302184014.GG31400@bombadil.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20180302152831.11510-1-tiwai@suse.de> <20180302184014.GG31400@bombadil.infradead.org>
Date:   Fri, 02 Mar 2018 21:00:53 +0200
Message-ID: <87tvtyti8q.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 02 Mar 2018, Matthew Wilcox <willy@infradead.org> wrote:
> From: Matthew Wilcox <mawilcox@microsoft.com>
>
> Sphinx 1.7 removed sphinx.util.compat.Directive so people
> who have upgraded cannot build the documentation.  Switch to
> docutils.parsers.rst.Directive which has been available since
> docutils 0.5 released in 2009.
>
> Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=1083694
> Co-developed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>

I think this is the best approach.

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index 39aa9e8697cc..fbedcc39460b 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -36,8 +36,7 @@ import glob
>  
>  from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
> -from docutils.parsers.rst import directives
> -from sphinx.util.compat import Directive
> +from docutils.parsers.rst import directives, Directive
>  from sphinx.ext.autodoc import AutodocReporter
>  
>  __version__  = '1.0'

-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
