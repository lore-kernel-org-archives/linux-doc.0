Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6D6F67DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 11:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757443AbeD0LUm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 07:20:42 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:60983 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751792AbeD0LUl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 07:20:41 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3RBKYhZ030985;
        Fri, 27 Apr 2018 06:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524828034;
        bh=FNzz0uh2+cQcFBXIvJ+a6n+xGbe6tVhdZpxq6tNO170=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=Kt1SO9FMAb67WufzN0x3LErDlovzYS88Ebg8bCfZuF7txOUNBxlWG64mlNAGu5s2s
         Il4yVS7PoBUM/8kG7GjYXjm7uxIJD9aU+3Xs6D4UrhTmfvIKQIlnapBARDd94+Fa1O
         vTK+2rrSHOTLlF8QVwPd0dYyeig34FNpGjlw69Nc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3RBKYvg010200;
        Fri, 27 Apr 2018 06:20:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Fri, 27
 Apr 2018 06:20:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Fri, 27 Apr 2018 06:20:33 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3RBKSnT005653;
        Fri, 27 Apr 2018 06:20:29 -0500
Subject: Re: [PATCH v3 11/15] ARM: dts: dra7-evm: Add wilink8 wlan support
To:     Rob Herring <robh+dt@kernel.org>
References: <20180425125449.19755-1-kishon@ti.com>
 <20180425125449.19755-12-kishon@ti.com>
 <CAL_JsqKBXbcQxbN7z9j_DKgiaQg4buUa+08fg9zPELv-ucpRZA@mail.gmail.com>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Hari Nagalla <hnagalla@ti.com>, Ido Yariv <ido@wizery.com>,
        Eyal Reizer <eyalr@ti.com>, Sekhar Nori <nsekhar@ti.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <b3e16fc6-e620-29a4-71e7-5abe9a6da4d8@ti.com>
Date:   Fri, 27 Apr 2018 16:50:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKBXbcQxbN7z9j_DKgiaQg4buUa+08fg9zPELv-ucpRZA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Rob,

On Wednesday 25 April 2018 08:17 PM, Rob Herring wrote:
> On Wed, Apr 25, 2018 at 7:54 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>> From: Hari Nagalla <hnagalla@ti.com>
>>
>> The wilink module is a combo wireless connectivity sdio
>> card based on Texas Instrument's wl18xx solution. It is a
>> 4-wire, 1.8V, embedded sdio wlan device with an external
>> irq line and is power-controlled by a gpio-based fixed
>> regulator.
>>
>> Add pinmux configuration and IODelay values for MMC4.
>> On dra7-evm, MMC4 is used for connecting to wilink module.
>>
>> IODelay data credits to :  Vishal Mahaveer <vishalm@ti.com>
>> and Sekhar Nori <nsekhar@ti.com>
>>
>> Signed-off-by: Ido Yariv <ido@wizery.com>
>> Signed-off-by: Eyal Reizer <eyalr@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
>> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
>> ---
>>  arch/arm/boot/dts/dra7-evm-common.dtsi | 15 +++++++++++++++
>>  arch/arm/boot/dts/dra7-evm.dts         | 25 +++++++++++++++++++++++++
>>  2 files changed, 40 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
>> index 05a7b1a01bc3..3590c40fc112 100644
>> --- a/arch/arm/boot/dts/dra7-evm-common.dtsi
>> +++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
>> @@ -260,3 +260,18 @@
>>  &pcie1_rc {
>>         status = "okay";
>>  };
>> +
>> +&mmc4 {
>> +       bus-width = <4>;
>> +       cap-power-off-card;
>> +       keep-power-in-suspend;
>> +       non-removable;
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       wlcore: wlcore@2 {
> 
> wifi@2

sure, I'll fix it in the next revision.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
