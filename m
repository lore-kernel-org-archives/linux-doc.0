Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 04CDF7D09E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 07:35:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754382AbeGCHee (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Jul 2018 03:34:34 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:47047 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753596AbeGCHec (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jul 2018 03:34:32 -0400
Received: by mail-wr0-f194.google.com with SMTP id s11-v6so824301wra.13
        for <linux-doc@vger.kernel.org>; Tue, 03 Jul 2018 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=N+YihGc9r0k8UxuN8XhBJEKLRRhDTDTb/AwWVtdk7Bg=;
        b=ISqwK3c14LoA7qpBQFRDFzxE/4e7DgJotJXwzX2faWeapR7BX0tk8Q5f0FUtDIUpAw
         4EDe8eiE6P9+jujxB1GkfEYeLsBwx9u9tGE6VFwE1GCAeqRYTTuDIpg1udTBZCNHo2ZS
         EiKxfzJByQZO4zPMNSihENGN0aMhi3QwwLTQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=N+YihGc9r0k8UxuN8XhBJEKLRRhDTDTb/AwWVtdk7Bg=;
        b=WyZ/0aMoS/3beaQO4RZwx1jeSsmQ9nqZrx6aTeMYz1iHo1AcPiHUcDkY9sCq47hodC
         JA3TukVIqstt3fXzmQd4Nui4pf2yjOum45y53TaR0lhj5Z2wPcq4uC1ar1LNachayV46
         NRA0xkEm9C5eZdU086Zi7tqdkyBTe67G0u88115nMEEh6MUym0/eEM/TNRxK+I575Dah
         aUcCOHIeqmzroQvtKgXJntGqTu7ddPCMb3YVGjUL7kHBrSkxG7EIF7JU2339jbPGMxa+
         RzKNamAAJ859EJAP2+1rTQho5reKIwG+L/HzV7201Yol8YJeIycIO+xJK6xM7KsSsfGQ
         ppiw==
X-Gm-Message-State: APt69E1kmGN6UKRf1RBK1qS/I8LLZxjjn7VzBgYD0ai8iOK1hirIYNuh
        lMmlhYycK1XYUEjd+X56+mBelA==
X-Google-Smtp-Source: AAOMgpe8+4NbHjuufNFaZKBIALJzo2lWjCgQweARbg4Pegeo0IJgXIxIk/AP2E0bvFuC3KsYAsFYyw==
X-Received: by 2002:adf:c5d2:: with SMTP id v18-v6mr2381544wrg.151.1530603271185;
        Tue, 03 Jul 2018 00:34:31 -0700 (PDT)
Received: from dell ([2.27.167.87])
        by smtp.gmail.com with ESMTPSA id x11-v6sm692830wrm.78.2018.07.03.00.34.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Jul 2018 00:34:30 -0700 (PDT)
Date:   Tue, 3 Jul 2018 08:34:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v3 24/27] devicetree: fix a series of wrong file
 references
Message-ID: <20180703073428.GH20176@dell>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
 <bce1b59268ac2d659fd7cb37f89285ef2acc8316.1528990947.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bce1b59268ac2d659fd7cb37f89285ef2acc8316.1528990947.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 14 Jun 2018, Mauro Carvalho Chehab wrote:

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
