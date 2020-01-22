Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0177C32771
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC54B21835
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q98N578f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgAVXud (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 18:50:33 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:49998 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVXud (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jan 2020 18:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ds9VboYdFkgx4W8w9XxQy9BBLkBJVHphcxUoaQazHsI=; b=Q98N578f/zlxeI5oao+Iarv6I
        iL3zKBuwZd73meJTHqyx0rBiVNPhjLVtUWTnHslDnHBYl+9POKx1rhhYPbYN2osGlARX+G3BziR2s
        EEKgO/AB1wlJkYje8NR6W4hT12vXviQ7BTP82FL/0+urlni534Ljz73dTpiV8fV1RSAehZnciIg/S
        Wrsy6wgZBS5sI39H4AEfnyq5D6E/ofbU59NK1LToRDLz3HP8UAL3M4eECov2qZDxwFM2e1zSA5Q/3
        aH2NYVLKCapn3aOzEEhIbaWvmmLEglvhMI6ZTLXTOswVJ+yfP9O6WuWiEEDJzw12gSjFi13uNzXUU
        I99m7rtGg==;
Received: from [2603:3004:32:9a00::c7a3]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuPlY-00089u-TK; Wed, 22 Jan 2020 23:50:32 +0000
Subject: Re: [PATCH] Add a maintainer entry profile for Documentation/
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20200122162140.6a13e6a9@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <64abdebb-6055-7b9c-9376-607ff75c0b01@infradead.org>
Date:   Wed, 22 Jan 2020 15:50:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122162140.6a13e6a9@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/22/20 3:21 PM, Jonathan Corbet wrote:
> Documentation should lead by example, so here's a basic maintainer entry
> profile for this subsystem.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/doc-guide/index.rst             |  1 +
>  .../doc-guide/maintainer-profile.rst          | 44 +++++++++++++++++++
>  .../maintainer/maintainer-entry-profile.rst   |  1 +
>  3 files changed, 46 insertions(+)
>  create mode 100644 Documentation/doc-guide/maintainer-profile.rst
> 
> diff --git a/Documentation/doc-guide/index.rst b/Documentation/doc-guide/index.rst
> index c58de84c0d5b..7c7d97784626 100644
> --- a/Documentation/doc-guide/index.rst
> +++ b/Documentation/doc-guide/index.rst
> @@ -11,6 +11,7 @@ How to write kernel documentation
>     kernel-doc
>     parse-headers
>     contributing
> +   maintainer-profile
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/doc-guide/maintainer-profile.rst b/Documentation/doc-guide/maintainer-profile.rst
> new file mode 100644
> index 000000000000..a4e25b13250c
> --- /dev/null
> +++ b/Documentation/doc-guide/maintainer-profile.rst
> @@ -0,0 +1,44 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +Documentation subsystem maintainer entry profile
> +================================================
> +
> +The documentation "subsystem" is the central coordinating point for the
> +kernel's documentation and associated infrastructure.  It covers the
> +hierarchy under Documentation/ (with the exception of
> +Documentation/device-tree), various utilities under scripts/ and, at least
> +some of the time, LICENSES/.
> +
> +It's worth noting, though, that the boundaries of this subsystem are rather
> +fuzzier than normal.  Many other subsystem maintainers like to keep control
> +of portions of Documentation/, and many more freely apply changes there
> +when it is convenient.  Beyond that, much of the kernel's documentation is
> +found in the source as kerneldoc comments; those are usually (but not
> +always) maintained by the relevant subsystem maintainer.
> +
> +The mailing list for documentation is linux-doc@vger.kernel.org.  Patches
> +should be made against the docs-next tree whenever possible.
> +
> +Submit checklist addendum
> +-------------------------
> +
> +When making documentation changes, you should actually build the
> +documentation and ensure that no new errors have been introduced.

I would prefer "that no new errors or warnings" ...

> +Generating HTML documents and looking at the result will help to avoid
> +unsightly misunderstandings about how things will be rendered.
> +
> +Key cycle dates
> +---------------
> +
> +Patches can be sent anytime, but response will be slower than usual during
> +the merge window.  The docs tree tends to close late before the merge
> +window opens, since the risk of regressions from documentation patches is
> +low.
> +
> +Review cadence
> +--------------
> +
> +The documentation subsystem has a single maintainer who is doing the work
> +on his own time, so the response to patches will occasionally be slow.  I
> +try to always send out a notification when a patch is merged (or when I
> +decide that one cannot be).  Do not hesitate to send a ping if you have not
> +heard back within a week of sending a patch.
> diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
> index 3eaddc8ac56d..11ebe3682771 100644
> --- a/Documentation/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -99,4 +99,5 @@ to do something different in the near future.
>  .. toctree::
>     :maxdepth: 1
>  
> +   ../doc-guide/maintainer-profile
>     ../nvdimm/maintainer-entry-profile
> 


-- 
~Randy
