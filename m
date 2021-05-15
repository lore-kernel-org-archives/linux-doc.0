Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CFCC433ED
	for <linux-doc@archiver.kernel.org>; Sat, 15 May 2021 21:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0206E61287
	for <linux-doc@archiver.kernel.org>; Sat, 15 May 2021 21:46:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235140AbhEOVsF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 May 2021 17:48:05 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:1480 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235133AbhEOVsF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 15 May 2021 17:48:05 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 28840891;
        Sat, 15 May 2021 23:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        in-reply-to:content-transfer-encoding:content-disposition
        :content-type:content-type:mime-version:references:message-id
        :subject:subject:from:from:date:date:received:received:received;
         s=dkim20160331; t=1621115208; x=1622929609; bh=eaJHCHUjbjCOs253
        ucS2E+23HKRDmXY1/ctfNTFqYqo=; b=wXIhRgOAyE4d/E5L+6b1pEp7T3wxljzj
        s69+HBjXtfoBSL6St1lwU1sUMl1yoYWhUVyj11D5KkNraLNt0WKny8hnJlUfPPkm
        EZ76V7XQZDdrbAtmbQy7xFsv1vUA6adxP1/9rb+q2GHMudKNOOyX2V7tRVE5Jzzb
        RjnWZhe1g+u+u5Kale62FpEW9sGxZIAwR6wMX3Lz7yT2LXFu7RaoAes+iFg1f4RC
        MGPaIBASVBY387WWlK1+NuMDzjDPe8cLwMDAAuDYeEbA8ZsMYcMiQwr1R1j+D1Ru
        SQLJPIdnh6bbTOgAaVkOzNqGdhaUeXf+qadhBCXMQQWHdFhW6RSaxJf7IaeeAW4t
        kBbRqwPKAGkn0OmHuVdOnVqwUmL44HD734eOSVl4IRNnZd2qCfvYk+vYXnMxpB3g
        Un+d7q6chJLxjigcJhHyn461wVCy8OiU13N/GLMaFzZCEb6t1p86NMkV8bJhlhJq
        7RHGqZZm+nktM3L5FkllMZzzd+9FLbGKBGNpQgRNgFP3y2gDOwkz8Iszay1GQJV8
        QWPQ/ChcjsVZV7T0q/4dra3AR96Jeq9vjIAoWyp5fXJBDUZVeItq3ll3NZfrvxuv
        lhdTGhOlBwVk8SN2AAQZKKE8qO7UUf1xbdsk+SbDkRgv1ldvUWtIm2Guh+HEI3eN
        Ru2g+GrNxt4=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id B4eNjsr2Bvl4; Sat, 15 May 2021 23:46:48 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id 58CD1627;
        Sat, 15 May 2021 23:46:48 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 98D56410;
        Sat, 15 May 2021 23:46:46 +0200 (CEST)
Date:   Sat, 15 May 2021 23:46:42 +0200
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/3] Documentation/translations/it_IT: switch some
 links to https
Message-ID: <20210515214642.exmxqsvo4yx4elhb@numero86.vaga.pv.it>
References: <7263fc90.AUcAAC_sKFEAAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgn5QG@mailjet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7263fc90.AUcAAC_sKFEAAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgn5QG@mailjet.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 15, 2021 at 03:08:18PM +0800, Sanjeev Gupta wrote:
>Links have been checked to ensure that the old and new URL
>return the same page.  This is not true for many links.
>
>Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
>
>---
> .../translations/it_IT/doc-guide/kernel-doc.rst        |  2 +-
> Documentation/translations/it_IT/doc-guide/sphinx.rst  | 10 +++++-----
> Documentation/translations/it_IT/process/changes.rst   |  2 +-
> .../translations/it_IT/process/coding-style.rst        |  2 +-
> 4 files changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
>index 009cdac014b6..4d22df6a59d6 100644
>--- a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
>+++ b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
>@@ -24,7 +24,7 @@ vengono filtrare per cercare i riferimenti ed i marcatori.
>
> Vedere di seguito per maggiori dettagli.
>
>-.. _`dominio Sphinx per il C`: http://www.sphinx-doc.org/en/stable/domains.html
>+.. _`dominio Sphinx per il C`: https://www.sphinx-doc.org/en/stable/domains.html
>
> Tutte le funzioni esportate verso i moduli esterni utilizzando
> ``EXPORT_SYMBOL`` o ``EXPORT_SYMBOL_GPL`` dovrebbero avere un commento
>diff --git a/Documentation/translations/it_IT/doc-guide/sphinx.rst b/Documentation/translations/it_IT/doc-guide/sphinx.rst
>index 0046d75d9a70..f7db5db3766f 100644
>--- a/Documentation/translations/it_IT/doc-guide/sphinx.rst
>+++ b/Documentation/translations/it_IT/doc-guide/sphinx.rst
>@@ -14,7 +14,7 @@ Per generare la documentazione in HTML o PDF, usate comandi ``make htmldocs`` o
> ``make pdfdocs``. La documentazione così generata sarà disponibile nella
> cartella ``Documentation/output``.
>
>-.. _Sphinx: http://www.sphinx-doc.org/
>+.. _Sphinx: https://www.sphinx-doc.org/
> .. _reStructuredText: http://docutils.sourceforge.net/rst.html
>
> I file reStructuredText possono contenere delle direttive che permettono di
>@@ -175,7 +175,7 @@ Aggiungere nuova documentazione è semplice:
> 2. aggiungete un riferimento ad esso nell'indice (`TOC tree`_) in
>    ``Documentation/index.rst``.
>
>-.. _TOC tree: http://www.sphinx-doc.org/en/stable/markup/toctree.html
>+.. _TOC tree: https://www.sphinx-doc.org/en/stable/markup/toctree.html
>
> Questo, di solito, è sufficiente per la documentazione più semplice (come
> quella che state leggendo ora), ma per una documentazione più elaborata è
>@@ -191,8 +191,8 @@ informazione circa le loro potenzialità. In particolare, il
> cui cominciare. Esistono, inoltre, anche alcuni
> `costruttori specifici per Sphinx`_.
>
>-.. _`manuale introduttivo a reStructuredText`: http://www.sphinx-doc.org/en/stable/rest.html
>-.. _`costruttori specifici per Sphinx`: http://www.sphinx-doc.org/en/stable/markup/index.html
>+.. _`manuale introduttivo a reStructuredText`: https://www.sphinx-doc.org/en/stable/rest.html
>+.. _`costruttori specifici per Sphinx`: https://www.sphinx-doc.org/en/stable/markup/index.html
>
> Guide linea per la documentazione del kernel
> --------------------------------------------
>@@ -417,7 +417,7 @@ formato SVG (:ref:`it_svg_image_example`)::
> Le direttive del kernel per figure ed immagini supportano il formato **DOT**,
> per maggiori informazioni
>
>-* DOT: http://graphviz.org/pdf/dotguide.pdf
>+* DOT: https://graphviz.org/pdf/dotguide.pdf
> * Graphviz: http://www.graphviz.org/content/dot-language

Why not also the last link?

https://graphviz.org/doc/info/lang.html
