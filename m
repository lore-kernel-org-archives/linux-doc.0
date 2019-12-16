Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B88C43603
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 13:15:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16E6D206D8
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 13:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfLPNPC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Dec 2019 08:15:02 -0500
Received: from mga09.intel.com ([134.134.136.24]:6083 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727667AbfLPNPC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Dec 2019 08:15:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 05:15:01 -0800
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
   d="scan'208";a="209297885"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 05:14:59 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] docs: Document the Link: tag formally
In-Reply-To: <20191216093859.9196-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191216093859.9196-1-linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 15:14:56 +0200
Message-ID: <877e2w1kfj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Dec 2019, Linus Walleij <linus.walleij@linaro.org> wrote:
> We have a lot of Link: tags in commits these days and they are
> not formally defined in the kernel documentation. Let's put
> a separate paragraph about it in submitting-patches.rst where
> most other tags are defined.
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Reported-by: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/process/submitting-patches.rst | 21 ++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index ba5e944c7a63..20ef984aa743 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -643,9 +643,22 @@ which stable kernel versions should receive your fix. This is the preferred
>  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
>  for more details.
>  
> +14) Link: tags
> +--------------
> +
> +A Link: attribute can be used to provide a link back to a protocol of a
> +discussion pertaining to the patch. A typical link looks like this:
> +
> +    Link: https://lore.kernel.org/r/<message-id>
> +
> +Any HTTP[S] links can be referenced. It is customary for maintainers to add
> +Link: tags to reference discussions on mailing lists, and this can be done
> +automatically with the git tool when applying patches in mailbox format, see
> +:ref:`Documentation/maintainer/configure-git.rst <configure git>`.

I'd like to emphasize even more strongly that it is applied by the
maintainer or committer, and should reference the patch that got
applied. And that the patch submitters shouldn't try to add it
themselves. (Which makes you wonder about the placement in
submitting-patches.rst.) IMO other references should use References:
that is already widely used.

The above would also match current usage in e.g. the drm subsystem.

> +
>  .. _the_canonical_patch_format:
>  
> -14) The canonical patch format
> +15) The canonical patch format

Would it be about time we dropped the numbers?


BR,
Jani.

>  ------------------------------
>  
>  This section describes how the patch itself should be formatted.  Note
> @@ -768,7 +781,7 @@ references.
>  
>  .. _explicit_in_reply_to:
>  
> -15) Explicit In-Reply-To headers
> +16) Explicit In-Reply-To headers
>  --------------------------------
>  
>  It can be helpful to manually add In-Reply-To: headers to a patch
> @@ -782,7 +795,7 @@ helpful, you can use the https://lkml.kernel.org/ redirector (e.g., in
>  the cover email text) to link to an earlier version of the patch series.
>  
>  
> -16) Providing base tree information
> +17) Providing base tree information
>  -----------------------------------
>  
>  When other developers receive your patches and start the review process,
> @@ -833,7 +846,7 @@ either below the ``---`` line or at the very bottom of all other
>  content, right before your email signature.
>  
>  
> -17) Sending ``git pull`` requests
> +18) Sending ``git pull`` requests
>  ---------------------------------
>  
>  If you have a series of patches, it may be most convenient to have the

-- 
Jani Nikula, Intel Open Source Graphics Center
