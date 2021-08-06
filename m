Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2FEC4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 19:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51EFB61167
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 19:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244172AbhHFT5G convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Aug 2021 15:57:06 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34589 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbhHFT5G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Aug 2021 15:57:06 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 833DE1BF205;
        Fri,  6 Aug 2021 19:56:48 +0000 (UTC)
Date:   Fri, 6 Aug 2021 21:56:47 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/15] MAINTAINERS: update arm,pl353-smc.yaml reference
Message-ID: <20210806215647.46369f3f@xps13>
In-Reply-To: <1a9b26e4f9f7a01bcd676d7e7a3a929085fc2adb.1626947923.git.mchehab+huawei@kernel.org>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
        <1a9b26e4f9f7a01bcd676d7e7a3a929085fc2adb.1626947923.git.mchehab+huawei@kernel.org>
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
2021 12:00:10 +0200:

> The file name: Documentation/devicetree/bindings/mtd/arm,pl353-smc.yaml
> should be, instead: Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 813d52799ad2 ("MAINTAINERS: Add PL353 SMC entry")
> Fixes: d3d0e1e85711 ("dt-binding: memory: pl353-smc: Convert to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e1e5385d971..0a571273f308 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1488,7 +1488,7 @@ M:	Miquel Raynal <miquel.raynal@bootlin.com@bootlin.com>
>  M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/mtd/arm,pl353-smc.yaml
> +F:	Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>  F:	drivers/memory/pl353-smc.c
>  
>  ARM PRIMECELL CLCD PL110 DRIVER

Thanks,
Miquèl
