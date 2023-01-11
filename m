Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4A6C5479D
	for <linux-doc@archiver.kernel.org>; Wed, 11 Jan 2023 22:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbjAKWuU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Jan 2023 17:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjAKWuU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jan 2023 17:50:20 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4206E1EEEE;
        Wed, 11 Jan 2023 14:50:19 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BDCFA6E3;
        Wed, 11 Jan 2023 22:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BDCFA6E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1673477418; bh=j5iS4jEB8tV2TXle41i+mK1B1yaCPyPwNX+3JgYUCmU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fw7WaVlvsHRCoyOxSPNlKyTJJVKojAeCMhXZrVi9J5x+T3qvVIkmlYVILZGz6k108
         clqIkoG14ac4/G9evwS+arqATnP1YDwXIO4RVdTmD3e3ntdutPwofGezQxHxOLb4W+
         fYAZOPqI2uFRFbZutMDdfcWmRfXBP98xZ5YXpWehNNTb8Hzj/VnLMsVBb7fUkMimMF
         ATPcoFQo9ytKRJhsTuhQvS5fox0ix+mQK1OxsV7I07KcgTj/+sbjYeGGrjqzyor7dA
         iWOck102Jwkv3n3b9OENifju3kRduNk4qKXS4VI3ZwAktCzC+gLaTb2MUN1hlsMfIS
         Q/+Ui82m8706g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc:it_IT: fix typo in email-client
In-Reply-To: <20221230172456.58745-1-federico.vaga@vaga.pv.it>
References: <20221230172456.58745-1-federico.vaga@vaga.pv.it>
Date:   Wed, 11 Jan 2023 15:50:18 -0700
Message-ID: <87lem8wus5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Federico Vaga <federico.vaga@vaga.pv.it> writes:

> `usato` becomes `usando`
>
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
> ---
>  Documentation/translations/it_IT/process/email-clients.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/it_IT/process/email-clients.rst b/Documentation/translations/it_IT/process/email-clients.rst
> index de7d32f78246..b792f2f06a74 100644
> --- a/Documentation/translations/it_IT/process/email-clients.rst
> +++ b/Documentation/translations/it_IT/process/email-clients.rst
> @@ -106,7 +106,7 @@ Funziona. Alcune persone riescono ad usarlo con successo per inviare le patch.
>  Per inserire una patch usate :menuselection:`Messaggio-->Inserisci file`
>  (:kbd:`CTRL-I`) oppure un editor esterno.
>  
> -Se la patch che avete inserito dev'essere modificata usato la finestra di
> +Se la patch che avete inserito dev'essere modificata usando la finestra di
>  scrittura di Claws, allora assicuratevi che l'"auto-interruzione" sia

Applied, thanks.

jon
