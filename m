Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C5A747DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 11:20:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752061AbeD0LUE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 07:20:04 -0400
Received: from lelnx194.ext.ti.com ([198.47.27.80]:13988 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751566AbeD0LUC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 07:20:02 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3RBJrkZ006581;
        Fri, 27 Apr 2018 06:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524827993;
        bh=vYutYSYJxq3lRm/fgcIwExLPIDQRqcRMhuzC3WnhETQ=;
        h=Subject:To:References:CC:From:Date:In-Reply-To;
        b=w0bJidHAjfenhznGNKl81rNZSIn60eT8/PGyK+fDlgS9XcWu0DAIH8RiqWaTcD10Z
         AvNmVROmvH63XWWFoTad/faQqxqijs3chX7uYPLjv0816ymH8dyMf6uDx5Th6pnhl/
         vgY7GigJ8+6JiFSJ/675yI0XrPVxNODfv90NLojI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3RBJrTg009128;
        Fri, 27 Apr 2018 06:19:53 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Fri, 27
 Apr 2018 06:19:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Fri, 27 Apr 2018 06:19:53 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3RBJn9Z023334;
        Fri, 27 Apr 2018 06:19:49 -0500
Subject: Re: [PATCH v3 04/15] ARM: dts: dra74x-mmc-iodelay: Add a new pinctrl
 group for clk line without pullup
To:     Tony Lindgren <tony@atomide.com>
References: <20180425125449.19755-1-kishon@ti.com>
 <20180425125449.19755-5-kishon@ti.com> <20180425133529.GU5671@atomide.com>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <859a6ba4-3dd7-2507-d536-e6b559372f32@ti.com>
Date:   Fri, 27 Apr 2018 16:49:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20180425133529.GU5671@atomide.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tony,

On Wednesday 25 April 2018 07:05 PM, Tony Lindgren wrote:
> * Kishon Vijay Abraham I <kishon@ti.com> [180425 12:57]:
>> --- a/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
>> +++ b/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
>> @@ -49,6 +49,17 @@
>>  		>;
>>  	};
>>  
>> +	mmc1_pins_default_no_clk_pu: mmc1_pins_default_no_clk_pu {
>> +		pinctrl-single,pins = <
>> +			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLDOWN | MUX_MODE0) /* mmc1_clk.clk */
>> +			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
>> +			DRA7XX_CORE_IOPAD(0x375c, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat0.dat0 */
>> +			DRA7XX_CORE_IOPAD(0x3760, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat1.dat1 */
>> +			DRA7XX_CORE_IOPAD(0x3764, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat2.dat2 */
>> +			DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
>> +		>;
>> +	};
>> +
>>  	mmc1_pins_sdr12: mmc1_pins_sdr12 {
>>  		pinctrl-single,pins = <
>>  			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_clk.clk */
>> -- 
> 
> If this data is the same for all of them, why don't you add something
> like dra7-iodelay.dtsi that can be included as needed?

okay, I'll add dra7-mmc-iodelay.dtsi and send a new revision.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
