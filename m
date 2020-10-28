Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6945C4363A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 01:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6180220782
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 01:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729102AbgJ2BnZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 21:43:25 -0400
Received: from ms.lwn.net ([45.79.88.28]:45136 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729098AbgJ1V55 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:57:57 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CEA8A99C;
        Wed, 28 Oct 2020 17:11:43 +0000 (UTC)
Date:   Wed, 28 Oct 2020 11:11:42 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] docs: Makefile: honor V=0 for docs building
Message-ID: <20201028111142.7cc8833a@lwn.net>
In-Reply-To: <478c114a2399b68a18de94ee5f98649304f3903b.1603796153.git.mchehab+huawei@kernel.org>
References: <20201016165504.3cc33889@canb.auug.org.au>
        <478c114a2399b68a18de94ee5f98649304f3903b.1603796153.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 27 Oct 2020 11:56:15 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Reduce the number of displayed mesages when building the
> docs with V=0.
> 
> Suggested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 6a59a13d3c53..61a7310b49e0 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -26,6 +26,10 @@ BUILDDIR      = $(obj)/output
>  PDFLATEX      = xelatex
>  LATEXOPTS     = -interaction=batchmode
>  
> +ifeq ($(KBUILD_VERBOSE),0)
> +SPHINXOPTS    += "-q"
> +endif
> +

Applied, thanks.  ...ahhh the silence....:)

jon
