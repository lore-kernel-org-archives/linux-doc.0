Return-Path: <SRS0=NuvG=DE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13344C4346E
	for <linux-doc@archiver.kernel.org>; Sun, 27 Sep 2020 21:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD85E2311C
	for <linux-doc@archiver.kernel.org>; Sun, 27 Sep 2020 21:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgI0VC0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 27 Sep 2020 17:02:26 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:55524 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726267AbgI0VC0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Sep 2020 17:02:26 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Sep 2020 17:02:25 EDT
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; 
   d="scan'208";a="469746005"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Sep 2020 22:55:17 +0200
Date:   Sun, 27 Sep 2020 22:55:17 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
cc:     corbet@lwn.net, michal.lkml@markovi.net, Gilles.Muller@lip6.fr,
        linux-doc@vger.kernel.org, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 2/2] Documentation: Coccinelle: Modify parallelisation
 information in docs
In-Reply-To: <3ecfe0e7f95021525b7bbf783a45eb3a176791a9.1600945451.git.sylphrenadin@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2009272254140.20726@hadrien>
References: <cover.1600945451.git.sylphrenadin@gmail.com> <3ecfe0e7f95021525b7bbf783a45eb3a176791a9.1600945451.git.sylphrenadin@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Thu, 24 Sep 2020, Sumera Priyadarsini wrote:

> This patchset modifies coccicheck to use at most one thread per core by
> default for optimal performance. Modify documentation in coccinelle.rst
> to reflect the same.

It would be good for the documentation to mention that this only occurs if
the machine has more than two cores (and more than 4 hardware threads).

julia


>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  Documentation/dev-tools/coccinelle.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
> index 74c5e6aeeff5..a27a4867018c 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -130,8 +130,8 @@ To enable verbose messages set the V= variable, for example::
>  Coccinelle parallelization
>  --------------------------
>
> -By default, coccicheck tries to run as parallel as possible. To change
> -the parallelism, set the J= variable. For example, to run across 4 CPUs::
> +By default, coccicheck uses at most only one thread per core of the system.
> +To change the parallelism, set the J= variable. For example, to run across 4 CPUs::
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
