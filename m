Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF89C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:22:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8239613C0
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhELIXz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 04:23:55 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:54760 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhELIXy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 04:23:54 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 78F6082B;
        Wed, 12 May 2021 10:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        in-reply-to:content-transfer-encoding:content-disposition
        :content-type:content-type:mime-version:references:message-id
        :subject:subject:from:from:date:date:received:received:received;
         s=dkim20160331; t=1620807763; x=1622622164; bh=BVOsD63H8FqIB5Fh
        4MG69046NAVatcNCM1KGmx+hoJc=; b=GxjhD2GUEvBPjp2Q9VwG5UN99BV9T+uS
        ClnPvpPiUTWDJX9hbgA92/GlXhqNOL3VW9KL7b1GNuqGNnWMCr9kQchhomMTG+Lt
        GSiQcdU8tzP01KcIBfBGa9fjqY+umV/XGGoPI0q7m+fdtJ/PIeu4KYCV/fbwbiax
        S0/7KZCDpjE/YkPq6DlIwUI2i8JiWBagzSZZoSiKYahVr8fUOuNa8IY7CUVGRZ/P
        GxYjRW3nhHMrpCdZ6QbNr1mWOExfWJHHLoSXmpZr3R+wle0kJLNxGoH8+u1xxzvP
        +WLz/2qC0riQtR5SnQenssKohYjDFK8Ss/NoEKN6J0nkjFtPHHfiReMFLnhkxeom
        GwLXWvyktCMXUTL7HsBeX5zZwQQm0GDUtOxvSfrFz3YcbbA0Wya0lBonqGD7K98H
        g8AlKVaFLiCzLWbHGL7hZeup/CRIID7Hn8ew8OYvINyQxfaBCI82VerS6uRsBeur
        lBDJ/qChv/m33vBerqEE1v7DXh/sCV1C67O8Xepe2uCHp6vOoIsiy2rmioWcw7Cm
        wjFQSCociMXVO8gIVnFpnxx1ghUh3FxyPTzVmny84cnVfMbQ+hk7emXbrCHKSkdR
        io+feU3UBE4AvcEtmBxbKr478jURI8wB2P4I51QDAPNvEY0N3uAUFfJJc/xnfsxZ
        enSZyXG8oWs=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OdMQlJBRoZHK; Wed, 12 May 2021 10:22:43 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id C689743D;
        Wed, 12 May 2021 10:22:43 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 5C7B5117C1;
        Wed, 12 May 2021 10:22:42 +0200 (CEST)
Date:   Wed, 12 May 2021 10:22:39 +0200
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        Alex Shi <alexs@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 1/2] Documentation/translations/it_IT: switch LWN links
 to https
Message-ID: <20210512082238.tt7bmvup6kf7xz6p@numero86.vaga.pv.it>
References: <d95d8ca4.AUcAAC8YX5oAAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgmL1D@mailjet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d95d8ca4.AUcAAC8YX5oAAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgmL1D@mailjet.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 10, 2021 at 12:57:12PM +0800, Sanjeev Gupta wrote:
>Links have been checked to ensure that the old and new URL
>return the same page.
>
>Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
>---
> Documentation/translations/it_IT/process/2.Process.rst      | 2 +-
> Documentation/translations/it_IT/process/3.Early-stage.rst  | 4 ++--
> Documentation/translations/it_IT/process/4.Coding.rst       | 2 +-
> .../translations/it_IT/process/7.AdvancedTopics.rst         | 2 +-
> Documentation/translations/it_IT/process/8.Conclusion.rst   | 6 +++---
> .../it_IT/process/volatile-considered-harmful.rst           | 4 ++--
> 6 files changed, 10 insertions(+), 10 deletions(-)
>
>diff --git a/Documentation/translations/it_IT/process/2.Process.rst b/Documentation/translations/it_IT/process/2.Process.rst
>index 62826034e0b2..b995c0e40e2e 100644
>--- a/Documentation/translations/it_IT/process/2.Process.rst
>+++ b/Documentation/translations/it_IT/process/2.Process.rst
>@@ -524,7 +524,7 @@ Andrew Morton da questo consiglio agli aspiranti sviluppatori kernel
>      collaborare con gli altri nel sistemare le cose (questo richiede
>      persistenza!) ma va bene - è parte dello sviluppo kernel.
>
>-(http://lwn.net/Articles/283982/).
>+(https://lwn.net/Articles/283982/).
>
> In assenza di problemi ovvi da risolvere, si consiglia agli sviluppatori
> di consultare, in generale, la lista di regressioni e di bachi aperti.
>diff --git a/Documentation/translations/it_IT/process/3.Early-stage.rst b/Documentation/translations/it_IT/process/3.Early-stage.rst
>index 443ac1e5558f..1885a0cc593e 100644
>--- a/Documentation/translations/it_IT/process/3.Early-stage.rst
>+++ b/Documentation/translations/it_IT/process/3.Early-stage.rst
>@@ -55,7 +55,7 @@ scrisse questo messaggio:
> 	una perdita di tempo. Loro sono troppo "intelligenti" per stare ad
> 	ascoltare dei poveri mortali.
>
>-	(http://lwn.net/Articles/131776/).
>+	(https://lwn.net/Articles/131776/).
>
> La realtà delle cose fu differente; gli sviluppatori del kernel erano molto
> più preoccupati per la stabilità del sistema, per la manutenzione di lungo
>@@ -235,7 +235,7 @@ La Linux Foundation applica un programma di NDA creato appositamente per
> aiutare le aziende in questa particolare situazione; potrete trovare più
> informazioni sul sito:
>
>-    http://www.linuxfoundation.org/en/NDA_program
>+    https://www.linuxfoundation.org/en/NDA_program

This link is broken, replace it with

https://www.linuxfoundation.org/nda/
