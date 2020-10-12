Return-Path: <SRS0=n+aG=DT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46BCC433E7
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 08:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0D5E20757
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 08:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgJLIjl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Oct 2020 04:39:41 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:5562 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726810AbgJLIjl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Oct 2020 04:39:41 -0400
X-IronPort-AV: E=Sophos;i="5.77,366,1596492000"; 
   d="scan'208";a="472083611"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 10:39:39 +0200
Date:   Mon, 12 Oct 2020 10:39:39 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
cc:     michal.lkml@markovi.net, linux-doc@vger.kernel.org,
        Gilles.Muller@lip6.fr, corbet@lwn.net, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v4 3/3] Documentation: Coccinelle: Modify
 Parallelisation information in docs
In-Reply-To: <15c5f36aea99a8947847a31cc0f982f9e829a12b.1602410019.git.sylphrenadin@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2010121038530.2901@hadrien>
References: <cover.1602410019.git.sylphrenadin@gmail.com> <15c5f36aea99a8947847a31cc0f982f9e829a12b.1602410019.git.sylphrenadin@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Sun, 11 Oct 2020, Sumera Priyadarsini wrote:

> This patchset modifies coccicheck to use at most one thread per core by
> default in machines with more than 4 hyperthreads for optimal performance.
> Modify documentation in coccinelle.rst to reflect the same.
>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

Acked-by: Julia Lawall <julia.lawall@inria.fr>

Jonathan, will you take this patch?

thanks,
julia

> ---
>  Documentation/dev-tools/coccinelle.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
> index 74c5e6aeeff5..530d8d313601 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -130,8 +130,10 @@ To enable verbose messages set the V= variable, for example::
>  Coccinelle parallelization
>  --------------------------
>
> -By default, coccicheck tries to run as parallel as possible. To change
> -the parallelism, set the J= variable. For example, to run across 4 CPUs::
> +By default, coccicheck uses at most 1 thread per core in a machine
> +with more than 4 hyperthreads. In a machine with upto 4 threads,
> +all threads are used. To change the parallelism, set the J= variable.
> +For example, to run across 4 CPUs::
>
>     make coccicheck MODE=report J=4
>
> --
> 2.25.1
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
