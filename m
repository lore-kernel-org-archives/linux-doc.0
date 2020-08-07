Return-Path: <SRS0=iD3b=BR=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB81C433E0
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 11:10:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 393A72177B
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 11:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgHGLKq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Aug 2020 07:10:46 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:64631 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726517AbgHGLKe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Aug 2020 07:10:34 -0400
X-IronPort-AV: E=Sophos;i="5.75,445,1589234400"; 
   d="scan'208";a="462769907"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2020 13:10:32 +0200
Date:   Fri, 7 Aug 2020 13:10:32 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
cc:     michal.lkml@markovi.net, linux-doc@vger.kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, Gilles.Muller@lip6.fr,
        nicolas.palix@imag.fr, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] documentation: coccinelle: Improve command
 example
In-Reply-To: <20200807105445.16712-1-sylphrenadin@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2008071303480.2447@hadrien>
References: <20200807105445.16712-1-sylphrenadin@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Fri, 7 Aug 2020, Sumera Priyadarsini wrote:

> This patch modifies the coccinelle documentation to add further
> description for the usage of the C variable flags by coccicheck.
>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  Documentation/dev-tools/coccinelle.rst | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
> index 6c791af1c859..dfc5d390307b 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -177,9 +177,12 @@ For example, to check drivers/net/wireless/ one may write::
>  To apply Coccinelle on a file basis, instead of a directory basis, the
>  following command may be used::
>
> +To check only recompiled files, use the value 1 for the C flag, i.e.::
> +
>      make C=1 CHECK="scripts/coccicheck"
>
> -To check only newly edited code, use the value 2 for the C flag, i.e.::
> +To check sourcefiles regardless of whether they are recompiled or not,
> +use the value 2 for the C flag, i.e.::
>
>      make C=2 CHECK="scripts/coccicheck"

I'm not sure that this is clear enough.  Should you give an example with a
specific file?  The command as presented seems to work on all files having
the given property.

I'm also not sure to understand the work "recompiled".  It's in the past
tense, so it seems like it is talking about files that have already been
compiled more than once (ie, compiled the first time and then recompiled
the second time).  Maybe it would be clearer to say "files that make
considers need to be recompiled".

julia
