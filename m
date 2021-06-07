Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B5AC48BC2
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 08:14:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B868461205
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 08:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhFGIPx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 04:15:53 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50017 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhFGIPx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 04:15:53 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2E3C21BF20C;
        Mon,  7 Jun 2021 08:14:01 +0000 (UTC)
Date:   Mon, 7 Jun 2021 10:14:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Corentin Labbe <clabbe@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/12] MAINTAINERS: update faraday,ftrtc010.yaml reference
Message-ID: <YL3VSGSp/keQDqZd@piout.net>
References: <cover.1622648507.git.mchehab+huawei@kernel.org>
 <0d437806f3f8d2c930656872be482820ef1c2301.1622648507.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d437806f3f8d2c930656872be482820ef1c2301.1622648507.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/06/2021 17:43:14+0200, Mauro Carvalho Chehab wrote:
> Changeset 8df65d4adca6 ("dt-bindings: convert rtc/faraday,ftrtc01 to yaml")
> renamed: Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
> to: Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 8df65d4adca6 ("dt-bindings: convert rtc/faraday,ftrtc01 to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2800307082a9..8b423b7246a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1818,7 +1818,7 @@ T:	git git://github.com/ulli-kroll/linux.git
>  F:	Documentation/devicetree/bindings/arm/gemini.txt
>  F:	Documentation/devicetree/bindings/net/cortina,gemini-ethernet.txt
>  F:	Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
> -F:	Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
> +F:	Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
>  F:	arch/arm/mach-gemini/
>  F:	drivers/net/ethernet/cortina/
>  F:	drivers/pinctrl/pinctrl-gemini.c
> -- 
> 2.31.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
