Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D9707D062
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 05:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754715AbeFRFsV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 01:48:21 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:39089 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754013AbeFRFsR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jun 2018 01:48:17 -0400
Received: by mail-wr0-f195.google.com with SMTP id w7-v6so15373115wrn.6
        for <linux-doc@vger.kernel.org>; Sun, 17 Jun 2018 22:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WtYdziSqrC+D16a75PaSD2xxmYWgF/xPtyOXU+148n8=;
        b=Of8VHgPyBu/KE3zUVWsIn5xzIabHeXWyDQeGXlqWLWYkhcnvKzluw85gfDPYzAfIuc
         4twh0PvOLAaTxi5AIUjHSCkTZlZOf5xP+l3ImV67rtS5h4VGu2nIAb7wNxysENXkadmf
         NxvwjVgI8mhkKNvFp9H2eN3t8bEdF4jy/NGvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WtYdziSqrC+D16a75PaSD2xxmYWgF/xPtyOXU+148n8=;
        b=acHLNyHlHesgbqR4wE7dEEaGG0U7AT2abWkXsoa3tCQCOfOZOql5k+FUlVku4NhnAf
         98a9D901A98B6uA2MMCZW1VRVP6uEoGXJEN1na72dwsfPJWOF6YMnqkyM0bvgGz99kz0
         zQvYHZEohgnWEenFdosCC8/wB59D3ry+J+5Fe6+QK+gl5vr7zzoMsS1CqXILy140dMWP
         ChZXYDt3Lakqx+Aj8ncaZfGeL44H693kQVYW0fJCgGH/+7Bzyr1lsJlikjimCqrS33DX
         iW4NlQGeu6GfbN0egsatyTSafrjY8vQ/zlWBWleSI/fq8tWuQ9btkiS0Ppu4TvC5eNJn
         0XpA==
X-Gm-Message-State: APt69E07i3m+tVGJaX4qzEO5FQFmsLx6owqrwasJpISwRIkMGJjHLXBb
        uh6GDvffs/WxC8XT8o7SDFhSIA==
X-Google-Smtp-Source: ADUXVKKVMAHGJ0enc6ET3CloRSPLv3GCxwF7Nf6dWX6IB2KKg3A6gmHws6Riqd+engEwxWa9WVTx+Q==
X-Received: by 2002:adf:ad2f:: with SMTP id p44-v6mr9290595wrc.164.1529300896274;
        Sun, 17 Jun 2018 22:48:16 -0700 (PDT)
Received: from dell ([95.149.160.78])
        by smtp.gmail.com with ESMTPSA id p38-v6sm32515687wrc.11.2018.06.17.22.48.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jun 2018 22:48:15 -0700 (PDT)
Date:   Mon, 18 Jun 2018 06:48:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 22/26] devicetree: fix name of pinctrl-bindings.txt
Message-ID: <20180618054813.GA31141@dell>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
 <1832904c012f823958663464ac4fb249f77978b5.1529079120.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1832904c012f823958663464ac4fb249f77978b5.1529079120.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 15 Jun 2018, Mauro Carvalho Chehab wrote:

> Rename:
> 	pinctrl-binding.txt -> pinctrl-bindings.txt
> 
> In order to match the current name of this file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt | 2 +-

>  Documentation/devicetree/bindings/mfd/as3722.txt              | 2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  .../devicetree/bindings/mmc/microchip,sdhci-pic32.txt         | 2 +-
>  Documentation/devicetree/bindings/mmc/sdhci-st.txt            | 2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-max77620.txt          | 4 ++--
>  .../devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt          | 4 ++--
>  Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt   | 4 ++--
>  .../devicetree/bindings/serial/microchip,pic32-uart.txt       | 2 +-
>  Documentation/devicetree/bindings/spi/spi-st-ssc.txt          | 2 +-
>  9 files changed, 12 insertions(+), 12 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
