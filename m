Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ED9407D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Mar 2019 15:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfC1P0P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Mar 2019 11:26:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41077 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfC1P0O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Mar 2019 11:26:14 -0400
Received: by mail-ot1-f65.google.com with SMTP id 64so18674136otb.8;
        Thu, 28 Mar 2019 08:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eoa9rk2+5Eom845SpcSwTOojF0mqyj+sqPnptts2DbU=;
        b=nzqFN/LhYFhUtDkYEUw1JTvS8+1TX/8DvrptKx/jZ9ae3aEoqUAB5Agv6MRreLiV3P
         gOiyirzfzlXkIIQMdLLyIO+ztsL4dvWdJKXJ2nrRy8Vvs8VVcyw7bLouTB1SB3N3Hry0
         OBe4tEiCKaib4oKWW0vcKsdhrVRGk/3kFb9grZbcVo5HWAOwSaxcOrUU1O9kF8yZHXaE
         xERNVSq9obZp0cAx9j6ibDczHpg+RsPXDbzYOEGmAjCmM7qbBECZPpd7vH7nhUUhfsED
         bu+nbp5P+fsAg+bpbGwc9SaSOAfbGRfQZh9A3E2XBkQE9Fr+P7LiapJQxmGPNQ5N16ph
         RA4w==
X-Gm-Message-State: APjAAAVy0ON2dXgI/mUTjGMJnX974+1V7L3yjwq+FrRCtpZAi7+0GXzl
        UUuTzI2CMIOttiV4KNEqHw==
X-Google-Smtp-Source: APXvYqwgZ359wDtVagDy1HX1traJ1VhAmpotzI4REfWC+Xblr7ISqN9wcqPEZNp59kOvtYr3DPBBuw==
X-Received: by 2002:a9d:6347:: with SMTP id y7mr6507283otk.34.1553786773543;
        Thu, 28 Mar 2019 08:26:13 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q19sm10148341ota.28.2019.03.28.08.26.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 08:26:12 -0700 (PDT)
Date:   Thu, 28 Mar 2019 10:26:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH 4/6] ARM: dts: stm32: Add hwspinlock node for stm32mp157
 SoC
Message-ID: <20190328152612.GA464@bogus>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
 <1552492237-28810-5-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552492237-28810-5-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 13, 2019 at 04:50:35PM +0100, Fabien Dessenne wrote:
> Declare hwspinlock device for stm32mp157 SoC
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 105e21f..18baaea 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -886,6 +886,15 @@
>  			status = "disabled";
>  		};
>  
> +		hsem: hwspinlock@4c000000 {
> +			compatible = "st,stm32-hwspinlock";
> +			#hwlock-cells = <2>;
> +			reg = <0x4c000000 0x400>;
> +			clocks = <&rcc HSEM>;
> +			clock-names = "hsem";
> +			status = "okay";

okay is the default, so you can remove it.

> +		};
> +
>  		ipcc: mailbox@4c001000 {
>  			compatible = "st,stm32mp1-ipcc";
>  			#mbox-cells = <1>;
> -- 
> 2.7.4
> 
