Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 05BF97D062
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 05:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754088AbeFRFtQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 01:49:16 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:38294 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754013AbeFRFtO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jun 2018 01:49:14 -0400
Received: by mail-wm0-f66.google.com with SMTP id 69-v6so13064660wmf.3
        for <linux-doc@vger.kernel.org>; Sun, 17 Jun 2018 22:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8g0AKcEhteGjD2j26njqMl6S39jFe6MEKYzcmetNbuc=;
        b=BR4Uo+DAWEZpKn4qe+R+75IBuzLovya8gPgt1A7L2QoQAWE83esIoNjy/YcY7DpQSL
         NEPVAMO+tp3IGVFy3kPtk1xTuzbto3mX8NvEu+lK+AIi5Ju+vhM3W85s2s00lXi4kpUS
         NTAbJdza1HqSQt2kAb/lMqbmMx0OOEQQ14yuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8g0AKcEhteGjD2j26njqMl6S39jFe6MEKYzcmetNbuc=;
        b=Ox8IpWODz41OQZfAJV/LtVq38J2Rb1IVMn8SAHgKO09e3DMtfMMfxQkF+GGdpv8kzP
         gswsn4X3cIhUcneRIVlLjggzBXgOgDjXRZbiHDAS8eOMd602P4IDnxXPVUfFf06zDwSS
         zex0XqC4UXrWD48toswqPxrJUE9Uh2h4ofilNZsgRW1PZeCR2SpepJU83a2ZjAi2h0Be
         TEbQixH/bNkRJFLdXz3lILhKnUyXT7TVjzRUrIOb4p7fOJYbXNIHm8DeAkkLU8WVDVJP
         GmgzBDpjkJdJeoBan5C4ndQWo5+FDI3WbUEt2cuTazM3johPCAJq8edKHvKds3uP/AzZ
         tyeA==
X-Gm-Message-State: APt69E0Unyiedi81xNSoG0IcVZBQYFLR2F4+C41pGe5cn9p1d7ha1bbZ
        JdsR4w817IuzubzB97UbJPnYxg==
X-Google-Smtp-Source: ADUXVKKKXnmNTM8L4uzfDX2FolIwIPaDzfBoS6izjWBHoHwgApZ4XylYHFLYcAB52GapIJsKGL6Zog==
X-Received: by 2002:a1c:b18a:: with SMTP id a132-v6mr6908081wmf.18.1529300953032;
        Sun, 17 Jun 2018 22:49:13 -0700 (PDT)
Received: from dell ([95.149.160.78])
        by smtp.gmail.com with ESMTPSA id w2-v6sm11587242wrn.77.2018.06.17.22.49.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jun 2018 22:49:12 -0700 (PDT)
Date:   Mon, 18 Jun 2018 06:49:10 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Xiaowei Song <songxiaowei@hisilicon.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v4 23/26] devicetree: fix a series of wrong file
 references
Message-ID: <20180618054910.GB31141@dell>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
 <266e5f874b36aa83f3327879d85921fab52d5461.1529079120.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <266e5f874b36aa83f3327879d85921fab52d5461.1529079120.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 15 Jun 2018, Mauro Carvalho Chehab wrote:

> As files got renamed, their references broke.
> 
> Manually fix a series of broken refs at the DT bindings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  .../devicetree/bindings/input/rmi4/rmi_2d_sensor.txt |  2 +-
>  Documentation/devicetree/bindings/mfd/sun6i-prcm.txt |  2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  .../devicetree/bindings/pci/hisilicon-pcie.txt       |  2 +-
>  Documentation/devicetree/bindings/pci/kirin-pcie.txt |  2 +-
>  .../devicetree/bindings/pci/pci-keystone.txt         |  4 ++--
>  .../devicetree/bindings/sound/st,stm32-i2s.txt       |  2 +-
>  .../devicetree/bindings/sound/st,stm32-sai.txt       |  2 +-
>  MAINTAINERS                                          | 12 ++++++------
>  8 files changed, 14 insertions(+), 14 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
