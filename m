Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20E297DE7A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 22:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936291AbeCSWQF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 18:16:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55806 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032449AbeCSWPy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 18:15:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8BF8460C5F; Mon, 19 Mar 2018 22:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521497753;
        bh=Kxd8Lj3zFtRonCrevkivSzg9Z5bGG0a1edreSN/pfm8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jorQoIZrm5pK/tE52pHIaev3y7+wZSkI7B2j2n6GFUki/bS6kV5j6+0aPIqxRkhes
         Sf6OZkxmHGh5b4seiw99Cu+tRyHNr0VZq0D/t5wOCFulCQRCg/IBLVnsdo+h4Hwes0
         qxrfik1Mtms2g1NmwwGSvVhPobBjgEWKXy4mx7xs=
Received: from [10.226.58.86] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sdharia@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F075960128;
        Mon, 19 Mar 2018 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521497752;
        bh=Kxd8Lj3zFtRonCrevkivSzg9Z5bGG0a1edreSN/pfm8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VOE7Yb4yIbMqdDu46bsiojt53F7bZV80U+YSD8qunxivsUXX3W/pnzNJpvtpvEfRW
         7sUqq8bq/7rHHkBD+uWlgMme2P14GsetSwEfsldj6K9gT4vlJQqLc4eSZiH/bslnf5
         yH7Iz5T2+hjlhY3LIySsiO3f6tta1El7odWWQuIc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F075960128
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sdharia@codeaurora.org
Subject: Re: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
To:     Doug Anderson <dianders@chromium.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
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
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com>
From:   Sagar Dharia <sdharia@codeaurora.org>
Message-ID: <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org>
Date:   Mon, 19 Mar 2018 16:15:50 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Doug,
Thanks for reviewing the patch.

On 3/16/2018 5:54 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 14, 2018 at 4:58 PM, Karthikeyan Ramasubramanian
> <kramasub@codeaurora.org> wrote:
>> Add I2C master controller support for a built-in test I2C slave.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 19 +++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 29 +++++++++++++++++++++++++++++
>>  2 files changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> index ea3efc5..69445f1 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> @@ -27,6 +27,10 @@
>>                 serial@a84000 {
>>                         status = "okay";
>>                 };
>> +
>> +               i2c@a88000 {
>> +                       status = "okay";
> 
> Any idea what clock frequency is appropriate for MTP?  You've got some
> pretty beefy 2.2K external pulls I think, so presumably 400 KHz is
> what you're aiming for?  It would be nice to specify one so you don't
> end up the the spam in the log "Bus frequency not specified ..."
> 
> 

Yes, we plan to use 400Khz. We will specify it here.

>> +               };
>>         };
>>
>>         pinctrl@3400000 {
>> @@ -50,5 +54,20 @@
>>                                 bias-pull-down;
>>                         };
>>                 };
>> +
>> +               qup-i2c10-default {
> 
> nit: probably in the pinctrl section we want to sort alphabetically?
> We could try to sort by "lowest numbered pin", but IMHO alphabetical
> makes the most sense.
> 
Sure.
> 
>> +                       pinconf {
>> +                               pins = "gpio55", "gpio56";
>> +                               drive-strength = <2>;
>> +                               bias-disable;
>> +                       };
>> +               };
>> +
>> +               qup-i2c10-sleep {
>> +                       pinconf {
>> +                               pins = "gpio55", "gpio56";
>> +                               bias-pull-up;
> 
> Are you sure that you want pullups enabled for sleep here?  There are
> external pulls on this line (as there are on many i2c busses) so doing
> this will double-enable pulls.  It probably won't hurt, but I'm
> curious if there's some sort of reason here.
> 
1. We need the lines to remain high to avoid slaves sensing a false
start-condition (this can happen if the SDA goes down before SCL).
2. Disclaimer: I'm not a HW expert, but we were told that
tri-state/bias-disabled lines can draw more current. I will find out
more about that.

> 
>> +                       };
>> +               };
>>         };
>>  };
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 59334d9..9ef056f 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -209,6 +209,21 @@
>>                                         pins = "gpio4", "gpio5";
>>                                 };
>>                         };
>> +
>> +                       qup_i2c10_default: qup-i2c10-default {
>> +                               pinmux {
>> +                                       function = "qup10";
>> +                                       pins = "gpio55", "gpio56";
>> +                               };
>> +                       };
>> +
>> +                       qup_i2c10_sleep: qup-i2c10-sleep {
>> +                               pinmux {
>> +                                       function = "gpio";
>> +                                       pins = "gpio55", "gpio56";
>> +                               };
>> +                       };
>> +
>>                 };
>>
>>                 timer@17c90000 {
>> @@ -309,6 +324,20 @@
>>                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>>                                 status = "disabled";
>>                         };
>> +
>> +                       i2c10: i2c@a88000 {
> 
> Seems like it might be nice to add all the i2c busses into the main
> sdm845.dtsi file.  Sure, most won't be enabled, but it seems like it
> would avoid churn later.
> 
> ...if you're sure you want to add only one i2c controller, subject of
> this patch should indicate that.
> 

Yes, we typically have a "platform(sdm845 here)-qupv3.dtsi" defining
most of the serial-bus instances (i2c, spi, and uart with
status=disabled) that we include from the common header. The boards
enable instances they need.
Will that be okay?

Thanks
Sagar
> 
>> +                               compatible = "qcom,geni-i2c";
>> +                               reg = <0xa88000 0x4000>;
>> +                               clock-names = "se";
>> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
>> +                               pinctrl-names = "default", "sleep";
>> +                               pinctrl-0 = <&qup_i2c10_default>;
>> +                               pinctrl-1 = <&qup_i2c10_sleep>;
>> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               status = "disabled";
>> +                       };
>>                 };
>>         };
>>  };
>> --
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
