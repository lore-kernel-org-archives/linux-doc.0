Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F7DC35DF9
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 10:34:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8077320726
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 10:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbgBYKeq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 05:34:46 -0500
Received: from ms.lwn.net ([45.79.88.28]:53206 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729417AbgBYKeq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 Feb 2020 05:34:46 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 21D516D9;
        Tue, 25 Feb 2020 10:34:43 +0000 (UTC)
Date:   Tue, 25 Feb 2020 03:34:39 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Hung <alex.hung@canonical.com>
Cc:     tglx@linutronix.de, mchehab+samsung@kernel.org,
        akpm@linux-foundation.org, pawan.kumar.gupta@linux.intel.com,
        jgross@suse.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix a typo for intel_iommu=nobounce
Message-ID: <20200225033439.77b3b73c@lwn.net>
In-Reply-To: <20200219192133.7375-1-alex.hung@canonical.com>
References: <20200219192133.7375-1-alex.hung@canonical.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 19 Feb 2020 12:21:33 -0700
Alex Hung <alex.hung@canonical.com> wrote:

> "untrusted" was mis-spelled as "unstrusted"
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index dbc22d684627..c8b7ec949453 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1775,7 +1775,7 @@
>  			provided by tboot because it makes the system
>  			vulnerable to DMA attacks.
>  		nobounce [Default off]
> -			Disable bounce buffer for unstrusted devices such as
> +			Disable bounce buffer for untrusted devices such as
>  			the Thunderbolt devices. This will treat the untrusted
>  			devices as the trusted ones, hence might expose security
>  			risks of DMA attacks.

Applied, thanks.

jon
