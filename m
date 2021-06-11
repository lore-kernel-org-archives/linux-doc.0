Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BD6C48BE0
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 13:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A85161357
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 13:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhFKNy2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 09:54:28 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:34524 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230187AbhFKNy2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Jun 2021 09:54:28 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id D93A4C08;
        Fri, 11 Jun 2021 15:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1623419548; x=1625233949; bh=YtnvBwMRei0rHdqiRNINSXdIt21DPzmoVwm
        El2yCfCA=; b=oKgBsyCva7uXDZb8WZklQszuppSGrtahg7eEywAeFzZZUinioyw
        23cqPwWiVZ1jFJbEH0W2x8/75oQs7x6QOdShuzSuUb7vvku4GZEotjpM9IoNV6I8
        fYPq2Ub0B1cyCpofEsIWSpsXsVqa6ge75PKcy946hfpF0fnBeutOKIefFkC0iFd5
        VkGkElnVr1rwJTY8JHCuec/QXZrTvzDYj8+roXSWmwhWmRvOLPp+qDrTWS0JKvrX
        eiqi2EILXH+vTA2o/Tq+JdPMF+GeyJPoJFf2UH5lz/06qecyvWcNz0iUJgtX60cY
        QHI22ej1vg0dJvMA12fy3IKSrn7Bw2e/Myml75onNnx1ATup0WCNsVt7EoNYxT4j
        a6smG8DpSSnoEuExQBgnAvIZLB1GJxLLVjvm7cEuiTVbIaZTBuSNr5g9Tbv5NGfx
        WURL9vgMSIFopGxtPm+PtpDEVl9WYXE//gx/0PCpPl8BNP2SQXnStUkz9osuF+4u
        6mOGtQVx6yxC6fmdKCimIadOaDT2kAiA9mASiV/VPfn7NllTHX60JuX8xvpkTBvK
        klc2fFT1UdE7i2L79J8KS+sJ/hGkVvjHGWlG7je9HqRPCjkXuG31wXnfn2uNXyoZ
        px8e7Sp1wC0ljmHD+Mgsl9ms9IbxOufruLsgtmWF5GOmlIX/ESRix6hI=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ke56CqWWP4e6; Fri, 11 Jun 2021 15:52:28 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id DC1776A8;
        Fri, 11 Jun 2021 15:52:26 +0200 (CEST)
Received: from int-subm002.mykolab.com (unknown [10.9.37.2])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 013E1251D;
        Fri, 11 Jun 2021 15:52:22 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 11 Jun 2021 15:52:20 +0200
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] Documentation/translations/it_IT: switch some links
 to https
In-Reply-To: <d6364079.AVcAADGh3uAAAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgvu8L@mailjet.com>
References: <20210608041545.4312-1-ghane0@gmail.com>
 <d6364079.AVcAADGh3uAAAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgvu8L@mailjet.com>
Message-ID: <588d1ea5bdea1a60702e8ef51d234b01@vaga.pv.it>
X-Sender: federico.vaga@vaga.pv.it
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021-06-08 06:15, Sanjeev Gupta wrote:
> Links have been checked to ensure that the old and new URL
> return the same page.  This is not true for many links.
> 
> Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
> ---
>  .../translations/it_IT/doc-guide/kernel-doc.rst        |  2 +-
>  Documentation/translations/it_IT/doc-guide/sphinx.rst  | 10 +++++-----
>  Documentation/translations/it_IT/process/changes.rst   |  2 +-
>  .../translations/it_IT/process/coding-style.rst        |  2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

Of course, there is nothing wrong with the patch, so it can be applied.
But, I give you exactly the same comment I gave you last time (see 
inline)

> diff --git a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
> b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
> index 009cdac014b6..4d22df6a59d6 100644
> --- a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
> +++ b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
> @@ -24,7 +24,7 @@ vengono filtrare per cercare i riferimenti ed i 
> marcatori.
> 
>  Vedere di seguito per maggiori dettagli.
> 
> -.. _`dominio Sphinx per il C`: 
> http://www.sphinx-doc.org/en/stable/domains.html
> +.. _`dominio Sphinx per il C`:
> https://www.sphinx-doc.org/en/stable/domains.html
> 
>  Tutte le funzioni esportate verso i moduli esterni utilizzando
>  ``EXPORT_SYMBOL`` o ``EXPORT_SYMBOL_GPL`` dovrebbero avere un commento
> diff --git a/Documentation/translations/it_IT/doc-guide/sphinx.rst
> b/Documentation/translations/it_IT/doc-guide/sphinx.rst
> index 0046d75d9a70..f7db5db3766f 100644
> --- a/Documentation/translations/it_IT/doc-guide/sphinx.rst
> +++ b/Documentation/translations/it_IT/doc-guide/sphinx.rst
> @@ -14,7 +14,7 @@ Per generare la documentazione in HTML o PDF, usate
> comandi ``make htmldocs`` o
>  ``make pdfdocs``. La documentazione così generata sarà disponibile 
> nella
>  cartella ``Documentation/output``.
> 
> -.. _Sphinx: http://www.sphinx-doc.org/
> +.. _Sphinx: https://www.sphinx-doc.org/
>  .. _reStructuredText: http://docutils.sourceforge.net/rst.html

Can you convert the reStructuredText link to https?

https://docutils.sourceforge.io/rst.html

>  I file reStructuredText possono contenere delle direttive che 
> permettono di
> @@ -175,7 +175,7 @@ Aggiungere nuova documentazione è semplice:
>  2. aggiungete un riferimento ad esso nell'indice (`TOC tree`_) in
>     ``Documentation/index.rst``.
> 
> -.. _TOC tree: http://www.sphinx-doc.org/en/stable/markup/toctree.html
> +.. _TOC tree: https://www.sphinx-doc.org/en/stable/markup/toctree.html
> 
>  Questo, di solito, è sufficiente per la documentazione più semplice 
> (come
>  quella che state leggendo ora), ma per una documentazione più 
> elaborata è
> @@ -191,8 +191,8 @@ informazione circa le loro potenzialità. In 
> particolare, il
>  cui cominciare. Esistono, inoltre, anche alcuni
>  `costruttori specifici per Sphinx`_.
> 
> -.. _`manuale introduttivo a reStructuredText`:
> http://www.sphinx-doc.org/en/stable/rest.html
> -.. _`costruttori specifici per Sphinx`:
> http://www.sphinx-doc.org/en/stable/markup/index.html
> +.. _`manuale introduttivo a reStructuredText`:
> https://www.sphinx-doc.org/en/stable/rest.html
> +.. _`costruttori specifici per Sphinx`:
> https://www.sphinx-doc.org/en/stable/markup/index.html
> 
>  Guide linea per la documentazione del kernel
>  --------------------------------------------
> @@ -417,7 +417,7 @@ formato SVG (:ref:`it_svg_image_example`)::
>  Le direttive del kernel per figure ed immagini supportano il formato 
> **DOT**,
>  per maggiori informazioni
> 
> -* DOT: http://graphviz.org/pdf/dotguide.pdf
> +* DOT: https://graphviz.org/pdf/dotguide.pdf
>  * Graphviz: http://www.graphviz.org/content/dot-language

Can you convert also the Graphviz link to https?

https://graphviz.org/doc/info/lang.html

>  Un piccolo esempio (:ref:`it_hello_dot_file`)::
> diff --git a/Documentation/translations/it_IT/process/changes.rst
> b/Documentation/translations/it_IT/process/changes.rst
> index 87d081889bfc..b5a326379d5d 100644
> --- a/Documentation/translations/it_IT/process/changes.rst
> +++ b/Documentation/translations/it_IT/process/changes.rst
> @@ -497,4 +497,4 @@ Documentazione del kernel
>  Sphinx
>  ------
> 
> -- <http://www.sphinx-doc.org/>
> +- <https://www.sphinx-doc.org/>
> diff --git a/Documentation/translations/it_IT/process/coding-style.rst
> b/Documentation/translations/it_IT/process/coding-style.rst
> index 95f2e7c985e2..2a0e8bc0f688 100644
> --- a/Documentation/translations/it_IT/process/coding-style.rst
> +++ b/Documentation/translations/it_IT/process/coding-style.rst
> @@ -1166,7 +1166,7 @@ ISBN 0-201-61586-X.
> 
>  Manuali GNU - nei casi in cui sono compatibili con K&R e questo 
> documento -
>  per indent, cpp, gcc e i suoi dettagli interni, tutto disponibile qui
> -http://www.gnu.org/manual/
> +https://www.gnu.org/manual/
> 
>  WG14 è il gruppo internazionale di standardizzazione per il linguaggio 
> C,
>  URL: http://www.open-std.org/JTC1/SC22/WG14/

-- 
Federico Vaga
