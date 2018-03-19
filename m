Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD9C27D0DA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 23:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756038AbeCSX4c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 19:56:32 -0400
Received: from mail-ua0-f175.google.com ([209.85.217.175]:33581 "EHLO
        mail-ua0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756033AbeCSX4a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 19:56:30 -0400
Received: by mail-ua0-f175.google.com with SMTP id f6so12088175ual.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Mar 2018 16:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Mk2Sg0jsZhYEJJoZ7yHxPaQADRnuuU72oTx7q/B95IM=;
        b=PUQc1QBE8Zb5B1kFsrBRO2e/6KLJGyPLd8TtFsQXDVLY7rY2zgrgBYRhHm+/lEZHBu
         ozmwUCmdJwTe/A/V+D6g2gYuCypNtWfNwsQ0XCskHwv8qeBp+ZrWZsdD+ggd4UQCDVjr
         rYVbhTLBmU8/RdX8EbJb5fNNJ7qGzSye7sd1f93ecsLIpuai7mcrdbqftCcxFJfZxhGJ
         yz6bvVdwbFV123TbUq4L+re12M56n6v/p2IotPC8LX74llgrphPKkTisaP5v9/WJAHfw
         uIfz4AryS28sf88JXDnO11TXYj87WX6NcKwu5lnDsJNMVhHJo9MtX3DMtyEojJZ8lr34
         Du6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Mk2Sg0jsZhYEJJoZ7yHxPaQADRnuuU72oTx7q/B95IM=;
        b=h09RKJgNJ83Ru4fVAyWnpS3R9BT4rKzdO/GVQ3FQH8qvb66BzwSW7bR55HIt7JGM0l
         lKqsvmxJqvZyVkfilIKiclezWKZF5XdyhEG8fM87q1azWXA7idQVkGB1UVPAaPiwltMY
         IsZyqTAAhsTWIAIVStJdpYyh9umIDam0lQzpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=Mk2Sg0jsZhYEJJoZ7yHxPaQADRnuuU72oTx7q/B95IM=;
        b=j6l1DcawNHF52Nn0Jsc+DtnTVIFdzAZeVBbY5XaAYBx3mkT9o7chcCS/8z+hgSGsIH
         jUSTUHzsAHhFcyzbjQBVjKiT0sgH34yCmECSC+Kk6dAqB2d5FjcqxV2h8XPgLY2MTHbw
         uve/vKvcH7JuX7KwXGXpZgCLY/IfVH3Mguw3d/FF4PAcVm55JOWxqptEJT+yIQWxTMi1
         m9mn9IrERddF6SMh0Gv62daL1dRfRzNal0mbLb529845fP1v9ADKrn26h+H0PXldVBZz
         DXA7HCKSCKbnywMt++OfNOY1nQdnoDw6QqQf86ZUD8UHfqV7zJHYzDB6WdOEM09ATycF
         7WVA==
X-Gm-Message-State: AElRT7Fxh4/yfAd17WdjJnEl1xpgpvztIIQMTKACNKNkThutwQ9hpwBL
        mSESOzHvIxTsXselc7P18Dmd9vzmIz3O+prbPPa8MQ==
X-Google-Smtp-Source: AG47ELuymYUdQyv8DegfujE210jTAGkFiglixgwdrvgQpg17ltMBt8mtaeBS1IHUdVdGQC4xvVz/S4X9UMZSyX9k8ww=
X-Received: by 10.176.22.201 with SMTP id g9mr9658003uaf.62.1521503788452;
 Mon, 19 Mar 2018 16:56:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.180.195 with HTTP; Mon, 19 Mar 2018 16:56:27 -0700 (PDT)
In-Reply-To: <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com> <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 19 Mar 2018 16:56:27 -0700
X-Google-Sender-Auth: m_8ZfxDVa7MTElJMzmcuyEu2oFk
Message-ID: <CAD=FV=Vq4Q2LvY_O-YsdyUmQOUANa0ap+U9j7PXSD3_ao6sCdQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
To:     Sagar Dharia <sdharia@codeaurora.org>
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Mar 19, 2018 at 3:15 PM, Sagar Dharia <sdharia@codeaurora.org> wrote:
>>> +                       pinconf {
>>> +                               pins = "gpio55", "gpio56";
>>> +                               drive-strength = <2>;
>>> +                               bias-disable;
>>> +                       };
>>> +               };
>>> +
>>> +               qup-i2c10-sleep {
>>> +                       pinconf {
>>> +                               pins = "gpio55", "gpio56";
>>> +                               bias-pull-up;
>>
>> Are you sure that you want pullups enabled for sleep here?  There are
>> external pulls on this line (as there are on many i2c busses) so doing
>> this will double-enable pulls.  It probably won't hurt, but I'm
>> curious if there's some sort of reason here.
>>
> 1. We need the lines to remain high to avoid slaves sensing a false
> start-condition (this can happen if the SDA goes down before SCL).
> 2. Disclaimer: I'm not a HW expert, but we were told that
> tri-state/bias-disabled lines can draw more current. I will find out
> more about that.

Agreed that they need to remain high, but you've got very strong
pullups external to the SoC.  Those will keep it high.  You don't need
the internal ones too.

As extra evidence that the external pullups _must_ be present on your
board: you specify bias-disable in the active state.  That can only
work if there are external pullups (or if there were some special
extra secret internal pullups that were part of geni).  i2c is an
open-drain bus and thus there must be pullups on the bus in order to
communicate.


>>> +                       };
>>> +               };
>>>         };
>>>  };
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> index 59334d9..9ef056f 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -209,6 +209,21 @@
>>>                                         pins = "gpio4", "gpio5";
>>>                                 };
>>>                         };
>>> +
>>> +                       qup_i2c10_default: qup-i2c10-default {
>>> +                               pinmux {
>>> +                                       function = "qup10";
>>> +                                       pins = "gpio55", "gpio56";
>>> +                               };
>>> +                       };
>>> +
>>> +                       qup_i2c10_sleep: qup-i2c10-sleep {
>>> +                               pinmux {
>>> +                                       function = "gpio";
>>> +                                       pins = "gpio55", "gpio56";
>>> +                               };
>>> +                       };
>>> +
>>>                 };
>>>
>>>                 timer@17c90000 {
>>> @@ -309,6 +324,20 @@
>>>                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>>>                                 status = "disabled";
>>>                         };
>>> +
>>> +                       i2c10: i2c@a88000 {
>>
>> Seems like it might be nice to add all the i2c busses into the main
>> sdm845.dtsi file.  Sure, most won't be enabled, but it seems like it
>> would avoid churn later.
>>
>> ...if you're sure you want to add only one i2c controller, subject of
>> this patch should indicate that.
>>
>
> Yes, we typically have a "platform(sdm845 here)-qupv3.dtsi" defining
> most of the serial-bus instances (i2c, spi, and uart with
> status=disabled) that we include from the common header. The boards
> enable instances they need.
> Will that be okay?

Unless you really feel the need to put these in a separate file I'd
just put them straight in sdm845.dtsi.  Yeah, it'll get big, but
that's OK by me.  I _think_ this matches what Bjorn was suggesting on
previous device tree patches, but CCing him just in case.  I'm
personally OK with whatever Bjorn and other folks with more Qualcomm
history would like.

...but yeah, I'm asking for them all to be listed with status="disabled".


-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
