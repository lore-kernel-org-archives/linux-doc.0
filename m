Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9DFFC7E6AB
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 23:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751829AbeCPXyh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 19:54:37 -0400
Received: from mail-ua0-f196.google.com ([209.85.217.196]:38058 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbeCPXyg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Mar 2018 19:54:36 -0400
Received: by mail-ua0-f196.google.com with SMTP id b8so264945uaf.5
        for <linux-doc@vger.kernel.org>; Fri, 16 Mar 2018 16:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=uUmsV7MAc1M83RMtGowby8xYRn7BfyApX2aGIV03yNo=;
        b=RnWL6YUDiSFw6ZYbYE1vMNotlJR75QheWbUo9Pb2AdW8q55wE78p599doU/zsfDGf+
         3dLqjlp/drGd0d8Rw0paAndf2wFAYXGLvSkymT7hG3m2EA68fKSKJIw88IM8CaTPx/bA
         Ho8q5HYhZfhBodB5kslxGL8FXGoYaBmGEBa0hX62DQBXGMN9qxPZSSCfJ7+OphuQMMiu
         mNioNH2hLe107GFW0op1mQT1O1svrCt+MdHKFzgILyfIENDtze1g6gHq8l8dvw5HWqfB
         GTzzmo1E3jq2sA0g59LAe9zTC7G2reIYvSCETbwtzNSRaABau89VUNJq+iOsyJS2PUaZ
         xDXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=uUmsV7MAc1M83RMtGowby8xYRn7BfyApX2aGIV03yNo=;
        b=byb2LHN7Q5fDT6A+unFwCZHfDyRT52bz4vEFp0SiAigN+ocvvZCcK+BzKzCr3Kvj0E
         PndSFvg+hCLnL+z3T0HcHjGt+PEVy/lIpV3savU9pWl1aKOfGo0ZP4fiNMbfGkmeL+Oo
         b5ySFCLu0FB6cxMPz3YKLODGC+o0Ww4scTLT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=uUmsV7MAc1M83RMtGowby8xYRn7BfyApX2aGIV03yNo=;
        b=iUSFp5PR0P4EWMnu2griGV8C46RDqxoKsvPAXu6S1sdi7VgLLik/VavCrbZwgXU5WR
         JKrTlz5mFnEPBPggA0VeKR1C3gJd3i530WvCo7W2p6OwoNUftiR9JIYyfi9lMoIYHR/4
         W71bJJrj25Fvx8cYjmJ87pel1sVJ8zj3GrhpZjXT5zQULNc/hpYycphV9rkUkkV+qJlL
         sezjY8xtIusvchRE81g3YgpQmGEoEeT2/FMKBm+0TLcgp80XeL4XbHr/05hb/okY5TUZ
         hAr3e/ZD4WC0UQbbxhym+5QCzL2E6FlHwel/h0Hwj0hs0a+j38zm3WUPbQ0I+dGuKhUw
         +BCA==
X-Gm-Message-State: AElRT7GkvQDC/Usymy9tdUEbibofKJJSDHMxFCwWnvGkKd2vXq4feoY9
        fnxgApf1IKRCoxtTBALgWt5g1HnzqCU7eOzxr81O0w==
X-Google-Smtp-Source: AG47ELvWV+a6F0FNV4+H/RR6QO2NT5k99SP1SnGxxtz8Pa3ntCWPLscF26/QUBlq3uUALG/kxzxzdENYTu2y7DBzzxw=
X-Received: by 10.176.75.109 with SMTP id i45mr2640065uaf.120.1521244474590;
 Fri, 16 Mar 2018 16:54:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.180.195 with HTTP; Fri, 16 Mar 2018 16:54:33 -0700 (PDT)
In-Reply-To: <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org> <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 16 Mar 2018 16:54:33 -0700
X-Google-Sender-Auth: 2DRN03IJ3MfwJgPE4mzeQwGfS54
Message-ID: <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Mar 14, 2018 at 4:58 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> Add I2C master controller support for a built-in test I2C slave.
>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 29 +++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index ea3efc5..69445f1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -27,6 +27,10 @@
>                 serial@a84000 {
>                         status = "okay";
>                 };
> +
> +               i2c@a88000 {
> +                       status = "okay";

Any idea what clock frequency is appropriate for MTP?  You've got some
pretty beefy 2.2K external pulls I think, so presumably 400 KHz is
what you're aiming for?  It would be nice to specify one so you don't
end up the the spam in the log "Bus frequency not specified ..."


> +               };
>         };
>
>         pinctrl@3400000 {
> @@ -50,5 +54,20 @@
>                                 bias-pull-down;
>                         };
>                 };
> +
> +               qup-i2c10-default {

nit: probably in the pinctrl section we want to sort alphabetically?
We could try to sort by "lowest numbered pin", but IMHO alphabetical
makes the most sense.


> +                       pinconf {
> +                               pins = "gpio55", "gpio56";
> +                               drive-strength = <2>;
> +                               bias-disable;
> +                       };
> +               };
> +
> +               qup-i2c10-sleep {
> +                       pinconf {
> +                               pins = "gpio55", "gpio56";
> +                               bias-pull-up;

Are you sure that you want pullups enabled for sleep here?  There are
external pulls on this line (as there are on many i2c busses) so doing
this will double-enable pulls.  It probably won't hurt, but I'm
curious if there's some sort of reason here.


> +                       };
> +               };
>         };
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 59334d9..9ef056f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -209,6 +209,21 @@
>                                         pins = "gpio4", "gpio5";
>                                 };
>                         };
> +
> +                       qup_i2c10_default: qup-i2c10-default {
> +                               pinmux {
> +                                       function = "qup10";
> +                                       pins = "gpio55", "gpio56";
> +                               };
> +                       };
> +
> +                       qup_i2c10_sleep: qup-i2c10-sleep {
> +                               pinmux {
> +                                       function = "gpio";
> +                                       pins = "gpio55", "gpio56";
> +                               };
> +                       };
> +
>                 };
>
>                 timer@17c90000 {
> @@ -309,6 +324,20 @@
>                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>                                 status = "disabled";
>                         };
> +
> +                       i2c10: i2c@a88000 {

Seems like it might be nice to add all the i2c busses into the main
sdm845.dtsi file.  Sure, most won't be enabled, but it seems like it
would avoid churn later.

...if you're sure you want to add only one i2c controller, subject of
this patch should indicate that.


> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0xa88000 0x4000>;
> +                               clock-names = "se";
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +                               pinctrl-names = "default", "sleep";
> +                               pinctrl-0 = <&qup_i2c10_default>;
> +                               pinctrl-1 = <&qup_i2c10_sleep>;
> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               status = "disabled";
> +                       };
>                 };
>         };
>  };
> --
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
