Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0DCC4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 19:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F093C611B0
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 19:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244137AbhHFTyC convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Aug 2021 15:54:02 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:42663 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbhHFTyC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Aug 2021 15:54:02 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B030C100002;
        Fri,  6 Aug 2021 19:53:44 +0000 (UTC)
Date:   Fri, 6 Aug 2021 21:53:43 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/15] MAINTAINERS: update mtd-physmap.yaml reference
Message-ID: <20210806215343.45617c2b@xps13>
In-Reply-To: <fa6e84084c3517bf9118f6b8ed1e440429f31636.1626947923.git.mchehab+huawei@kernel.org>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
        <fa6e84084c3517bf9118f6b8ed1e440429f31636.1626947923.git.mchehab+huawei@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote on Thu, 22 Jul
2021 12:00:06 +0200:

> Changeset 63f8e9e0ac65 ("dt-bindings: mtd: Convert mtd-physmap to DT schema")
> renamed: Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
> to: Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 63f8e9e0ac65 ("dt-bindings: mtd: Convert mtd-physmap to DT schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92be68e3efb5..bf8843b778a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8633,7 +8633,7 @@ S:	Supported
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
>  C:	irc://irc.oftc.net/mtd
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next
> -F:	Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
> +F:	Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
>  F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>  F:	drivers/mtd/hyperbus/
>  F:	include/linux/mtd/hyperbus.h

Thanks,
Miquèl
