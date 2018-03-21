Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F3437D0F4
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 08:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751737AbeCUIiH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 04:38:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35286 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751687AbeCUIiA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 04:38:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0C95160F5F; Wed, 21 Mar 2018 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521621480;
        bh=b7DZnHfzHfi5jrnYKugo55dgbwTzXE5D+8ctbog3SZU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iXK/NpAUUJXqCsBioaU+kSh2wmzmp32c9wLccbXuD4DzTHms6+PDPNpp7wSIAIeVd
         tx9PgpnV7UiQHRaqSdjrAKLKI5WG9rWic/tdH/mmxrbfm5hJc44otDcq/g/KhaHo5y
         jEwT1Xhb5y2R/sOVNWTJ2WS1xb1p0+r+K94IxFeM=
Received: from [172.16.64.124] (unknown [218.255.99.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 971F1603AF;
        Wed, 21 Mar 2018 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521621478;
        bh=b7DZnHfzHfi5jrnYKugo55dgbwTzXE5D+8ctbog3SZU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kEE9lXcagq8EId2RIOzzG9FpAFdbTL/KQa0nvDE/BjAPtUzoKdWkpz4dDxXH76R9m
         JRoQ5dxdwfc3Rh49O+R+jNPeOGKjzp2kQ+/N9rnWev84Mo1rE4/dUAVzsiSZ45snuq
         B8T3XuaLHTNPQ9GtwlgaBOxsWLdnbcfK561cVOm0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 971F1603AF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 5/6] arm64: dts: sdm845: Add serial console support
To:     Stephen Boyd <swboyd@chromium.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        evgreen@chromium.org, acourbot@chromium.org
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-6-git-send-email-kramasub@codeaurora.org>
 <152157474508.187949.10348604942277810227@swboyd.mtv.corp.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <5e8bcb81-48c9-0c35-b9d8-35c40b03ab0c@codeaurora.org>
Date:   Wed, 21 Mar 2018 14:07:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <152157474508.187949.10348604942277810227@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 3/21/2018 1:09 AM, Stephen Boyd wrote:
> Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:50)
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> index 979ab49..ea3efc5 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> @@ -12,4 +12,43 @@
>>   / {
>>          model = "Qualcomm Technologies, Inc. SDM845 MTP";
>>          compatible = "qcom,sdm845-mtp";
>> +
>> +       aliases {
>> +               serial0 = &uart2;
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = "serial0";
> 
> Also add :115200n8 ?
> 
> 
>> +       };
>> +};
>> +
>> +&soc {
> 
> I think the method is to put these inside soc node without using the
> phandle reference. So indent everything once more.

Some of this was discussed in the previous versions [1] and we arrived
at a consensus to follow this way of doing it.
Bjorn also said he was going to do a series to move all the existing
dts files to follow similar convention so its all consistent.

https://lkml.org/lkml/2018/2/6/676

> 
>> +       geniqup@ac0000 {
>> +               serial@a84000 {
>> +                       status = "okay";
>> +               };
>> +       };
>> +
>> +       pinctrl@3400000 {
>> +               qup-uart2-default {
>> +                       pinconf_tx {
>> +                               pins = "gpio4";
>> +                               drive-strength = <2>;
>> +                               bias-disable;
>> +                       };
>> +
>> +                       pinconf_rx {
>> +                               pins = "gpio5";
>> +                               drive-strength = <2>;
>> +                               bias-pull-up;
>> +                       };
>> +               };
>> +
>> +               qup-uart2-sleep {
>> +                       pinconf {
>> +                               pins = "gpio4", "gpio5";
>> +                               bias-pull-down;
>> +                       };
>> +               };
>> +       };
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 32f8561..59334d9 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -6,6 +6,7 @@
>>    */
>>   
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/qcom,gcc-sdm845.h>
>>   
>>   / {
>>          interrupt-parent = <&intc>;
>> @@ -194,6 +195,20 @@
>>                          #gpio-cells = <2>;
>>                          interrupt-controller;
>>                          #interrupt-cells = <2>;
>> +
>> +                       qup_uart2_default: qup-uart2-default {
>> +                               pinmux {
>> +                                       function = "qup9";
>> +                                       pins = "gpio4", "gpio5";
>> +                               };
>> +                       };
>> +
>> +                       qup_uart2_sleep: qup-uart2-sleep {
>> +                               pinmux {
>> +                                       function = "gpio";
>> +                                       pins = "gpio4", "gpio5";
>> +                               };
>> +                       };
> 
> Are these supposed to go to the board file?

Again, this was discussed in the previous versions, and we decided it
makes sense to have the pinmux (default) which rarely changes across
boards in the SoC file, and have boards specify the pinconf (electrical)
properties.
And get rid of all the soc-pins/board-pins/pmic-pins files.

https://lkml.org/lkml/2018/2/6/693

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
