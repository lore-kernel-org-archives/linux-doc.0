Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C3C417DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 03:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751687AbeCUDrw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 23:47:52 -0400
Received: from mail-ua0-f173.google.com ([209.85.217.173]:39851 "EHLO
        mail-ua0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751820AbeCUDru (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 23:47:50 -0400
Received: by mail-ua0-f173.google.com with SMTP id m47so2489963uae.6
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 20:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=p9C1jcGInAaCeKl2up2jqHf5peEQ7QUHNvZa+hrQviQ=;
        b=ZjN0WJRTo64J+l3WwSxj+7D1zF4DEt2PFEZx9eTkajESapwdUr7Nzl4rs+mFdFgJtq
         djLV5pXHnSA4UY4FeFQ3oJoWYMt6jOR5YgAwfXsekscrvMVidQ5wb24zH0urcNIimG8H
         /X5Q/GPxU52u9fED1WLrKk0e/AaTW6rSTAX9DV+nbMr1T4tnCnCV1IK253x9Rignxccy
         L9zEVUO+JJTA4JL+jQFT8tqaKw0nfrUDiprZjHEQvdjF7QW5m66vyWzHcyg2mM8KHJk8
         7g0febeRU8At9VP/GuzT/UDHewltP8ZYEqT4r908MzfWkhM+mDVeamyv5pbqeKxp6ATm
         dqYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=p9C1jcGInAaCeKl2up2jqHf5peEQ7QUHNvZa+hrQviQ=;
        b=jaHjXeiiFuNAqmGvY0NdBxl5ogMacftQyMvj6rLdDDcd2B2CO+wWx2YJ4RNeeVKv5Y
         llc26aI1oxQ5yAgcYLDTeWqN8qbuX8L90QEBx0OxpKSvR0wocz/EBQaceYMjhHYb6TqX
         acmv9lU6+aPpHPrtOh98e1EFr1URCMwkAEKcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=p9C1jcGInAaCeKl2up2jqHf5peEQ7QUHNvZa+hrQviQ=;
        b=cCPDkkLn/WBKFTVev3TIKZKfRmhLVHXu4JdN/PbQbtlGbZRgeDAiU50mC2VrxspW5X
         oJ+/jWI/moOEw8Hp++6jNaCMedOCFvVblHlSniVAKUbjaYULm5mZkEKx8U4WPyIQnp9t
         l/yc4deWEZ17BGnn3b7CT+GIOi86cMxWMzj2YLNBvdkDQxWe7bf4Mq4TYhciX8zn9iXc
         8PwR8RWu7XBLgra2fXXDsThN8smurLmwFYGHC3kV1k3SWBarU9RnDFg7pcSInmVBs/fl
         RyFSLBoeGo+NSRDmAGS5uBkN6xFhneKvb2+QJgaqECpCy/zTgWwytQwLd5ydaL4g9dGL
         rFFA==
X-Gm-Message-State: AElRT7GGZ3yb9xRNs5Gq55ko6NrWHVV7BUAF2gV9wsdJQmlukni4idLK
        xXRkpGjQfALnVw1ViZqJhiMkj3jvPH2A28otpIuCyQ==
X-Google-Smtp-Source: AG47ELtGxb0x0XkH8TMb9qRHDC8BhBMFvpJs689ZuTxB2RRRrT0xUenCjhf9prUDiEbRTZkk9hjq//3DAmMo9HdiKsc=
X-Received: by 10.176.86.74 with SMTP id z10mr12767100uaa.154.1521604069141;
 Tue, 20 Mar 2018 20:47:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.180.195 with HTTP; Tue, 20 Mar 2018 20:47:48 -0700 (PDT)
In-Reply-To: <c9e6f964-4e84-a5ed-77c4-e0a6655ee146@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com>
 <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org> <CAD=FV=Vq4Q2LvY_O-YsdyUmQOUANa0ap+U9j7PXSD3_ao6sCdQ@mail.gmail.com>
 <c9e6f964-4e84-a5ed-77c4-e0a6655ee146@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 20 Mar 2018 20:47:48 -0700
X-Google-Sender-Auth: OhoOAuYLL6Lhbh_okSnNaUsbEEI
Message-ID: <CAD=FV=WLiX8kiOxtAbnEfj9cLGtpbTad6AfWY=t0Ro843UFL9g@mail.gmail.com>
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

On Tue, Mar 20, 2018 at 3:16 PM, Sagar Dharia <sdharia@codeaurora.org> wrote:
>>>>> +                       pinconf {
>>>>> +                               pins = "gpio55", "gpio56";
>>>>> +                               drive-strength = <2>;
>>>>> +                               bias-disable;
>>>>> +                       };
>>>>> +               };
>>>>> +
>>>>> +               qup-i2c10-sleep {
>>>>> +                       pinconf {
>>>>> +                               pins = "gpio55", "gpio56";
>>>>> +                               bias-pull-up;
>>>>
>>>> Are you sure that you want pullups enabled for sleep here?  There are
>>>> external pulls on this line (as there are on many i2c busses) so doing
>>>> this will double-enable pulls.  It probably won't hurt, but I'm
>>>> curious if there's some sort of reason here.
>>>>
>>> 1. We need the lines to remain high to avoid slaves sensing a false
>>> start-condition (this can happen if the SDA goes down before SCL).
>>> 2. Disclaimer: I'm not a HW expert, but we were told that
>>> tri-state/bias-disabled lines can draw more current. I will find out
>>> more about that.
>>
>> Agreed that they need to remain high, but you've got very strong
>> pullups external to the SoC.  Those will keep it high.  You don't need
>> the internal ones too.
>>
>> As extra evidence that the external pullups _must_ be present on your
>> board: you specify bias-disable in the active state.  That can only
>> work if there are external pullups (or if there were some special
>> extra secret internal pullups that were part of geni).  i2c is an
>> open-drain bus and thus there must be pullups on the bus in order to
>> communicate.
>>
>
> You are right, I followed up about the pull-up recommendation and that
> was for a GPIO where there was no external pull-up (GPIO was not used
> for I2C). It's safe to assume I2C will always have external pullup.

It is even more safe to say that I2C will always have an external
pullup on the SDM845-MTP.  Remember that the pullup config is in the
board device tree file, not the SoC one.  So even if someone out there
decides that the internal pull is somehow good enough for their own
board and they don't stuff external ones, then it will be up to them
to turn the pull up on in their own board file.


> We
> will change sleep-config of I2C GPIOs to no-pull.

Even better IMHO: don't specify the bias in the sleep config.  I don't
believe it's possible for the sleep config to take effect without the
default config since the default config applies at probe time.  ...so
you'll always get the default config applied at probe time and you
don't need to touch the bias at sleep time.


>>>>> +                       i2c10: i2c@a88000 {
>>>>
>>>> Seems like it might be nice to add all the i2c busses into the main
>>>> sdm845.dtsi file.  Sure, most won't be enabled, but it seems like it
>>>> would avoid churn later.
>>>>
>>>> ...if you're sure you want to add only one i2c controller, subject of
>>>> this patch should indicate that.
>>>>
>>>
>>> Yes, we typically have a "platform(sdm845 here)-qupv3.dtsi" defining
>>> most of the serial-bus instances (i2c, spi, and uart with
>>> status=disabled) that we include from the common header. The boards
>>> enable instances they need.
>>> Will that be okay?
>>
>> Unless you really feel the need to put these in a separate file I'd
>> just put them straight in sdm845.dtsi.  Yeah, it'll get big, but
>> that's OK by me.  I _think_ this matches what Bjorn was suggesting on
>> previous device tree patches, but CCing him just in case.  I'm
>> personally OK with whatever Bjorn and other folks with more Qualcomm
>> history would like.
>>
>> ...but yeah, I'm asking for them all to be listed with status="disabled".
>>
>
> Sure, we will change the subject of this patch to indicate that we are
> adding 1 controller as of now. Later we will add all I2C controllers to
> dtsi as another patch since that will need pinctrl settings for GPIOs
> used by those instances and the wrappers devices needed by them.

Yeah, it's fine to just change the subject of this patch.  It would be
nice to add all the other controllers in sooner rather than later, but
it doesn't have to be today.


-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
