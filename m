Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E9CF7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 21:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752162AbeDRV3F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 17:29:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751256AbeDRV3D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Apr 2018 17:29:03 -0400
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com [209.85.216.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9C6E217D6;
        Wed, 18 Apr 2018 21:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C6E217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh@kernel.org
Received: by mail-qt0-f170.google.com with SMTP id s2-v6so3410667qti.2;
        Wed, 18 Apr 2018 14:29:02 -0700 (PDT)
X-Gm-Message-State: ALQs6tA6qxN45qmwERp7F+XLwi0/3Hlb3Bh7Eelmw1YK7XqS28kexm23
        +oxEigVaAT12PQzZk9VP6R4dkvfejA1cOIoJrQ==
X-Google-Smtp-Source: AB8JxZpjehDv9GEMb7zMUxyGTg6ruwBlcCd9u6rPsdxt/wEL5p6PPiq9NkWk/xJWdYWxBehJA3bOoddH4xuGT5nPo/k=
X-Received: by 2002:ac8:1e18:: with SMTP id n24-v6mr3770556qtl.118.1524086941975;
 Wed, 18 Apr 2018 14:29:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.228 with HTTP; Wed, 18 Apr 2018 14:28:41 -0700 (PDT)
In-Reply-To: <1f2a86ff-b902-1d1d-488a-807ac1dd20cc@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-8-jae.hyun.yoo@linux.intel.com> <20180416181423.t4vf7sugv6z3aw5h@rob-hp-laptop>
 <aee4e04c-885f-b1d8-9e85-9e741551342f@linux.intel.com> <287e0fd9-b631-2602-2785-7b8aaed7a6b9@linux.intel.com>
 <6ff697e8-cd20-e551-da13-b614cc39f900@linux.intel.com> <CAL_JsqLcxEnCOywTtU14G4=6A5m6G=KH3oi8m1VxKSEdxuv-ww@mail.gmail.com>
 <1f2a86ff-b902-1d1d-488a-807ac1dd20cc@linux.intel.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 18 Apr 2018 16:28:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLpuNj4kQ8oXB0kxOsS7ww9Jk-oq4tJrroDKkLRTPrjSA@mail.gmail.com>
Message-ID: <CAL_JsqLpuNj4kQ8oXB0kxOsS7ww9Jk-oq4tJrroDKkLRTPrjSA@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] Documentation: dt-bindings: Add documents for
 PECI hwmon client drivers
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 18, 2018 at 3:28 PM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> On 4/18/2018 7:32 AM, Rob Herring wrote:
>>
>> On Tue, Apr 17, 2018 at 3:40 PM, Jae Hyun Yoo
>> <jae.hyun.yoo@linux.intel.com> wrote:
>>>
>>> On 4/16/2018 4:51 PM, Jae Hyun Yoo wrote:
>>>>
>>>>
>>>> On 4/16/2018 4:22 PM, Jae Hyun Yoo wrote:
>>>>>
>>>>>
>>>>> On 4/16/2018 11:14 AM, Rob Herring wrote:
>>>>>>
>>>>>>
>>>>>> On Tue, Apr 10, 2018 at 11:32:09AM -0700, Jae Hyun Yoo wrote:
>>>>>>>
>>>>>>>
>>>>>>> This commit adds dt-bindings documents for PECI cputemp and dimmtemp
>>>>>>> client
>>>>>>> drivers.
>>>>>>
>>>>>>
>>>>>>
>>>
>>> [...]
>>>
>>>>>>> +Example:
>>>>>>> +    peci-bus@0 {
>>>>>>> +        #address-cells = <1>;
>>>>>>> +        #size-cells = <0>;
>>>>>>> +        < more properties >
>>>>>>> +
>>>>>>> +        peci-dimmtemp@cpu0 {
>>>>>>
>>>>>>
>>>>>>
>>>>>> unit-address is wrong.
>>>>>>
>>>>>
>>>>> Will fix it using the reg value.
>>>>>
>>>>>> It is a different bus from cputemp? Otherwise, you have conflicting
>>>>>> addresses. If that's the case, probably should make it clear by
>>>>>> showing
>>>>>> different host adapters for each example.
>>>>>>
>>>>>
>>>>> It could be the same bus with cputemp. Also, client address sharing is
>>>>> possible by PECI core if the functionality is different. I mean,
>>>>> cputemp and
>>>>> dimmtemp targeting the same client is possible case like this.
>>>>> peci-cputemp@30
>>>>> peci-dimmtemp@30
>>>>>
>>>>
>>>> Oh, I got your point. Probably, I should change these separate settings
>>>> into one like
>>>>
>>>> peci-client@30 {
>>>>       compatible = "intel,peci-client";
>>>>       reg = <0x30>;
>>>> };
>>>>
>>>> Then cputemp and dimmtemp drivers could refer the same compatible
>>>> string.
>>>> Will rewrite it.
>>>>
>>>
>>> I've checked it again and realized that it should use function based node
>>> name like:
>>>
>>> peci-cputemp@30
>>> peci-dimmtemp@30
>>>
>>> If it use the same string like 'peci-client@30', the drivers cannot be
>>> selectively enabled. The client address sharing way is well handled in
>>> PECI
>>> core and this way would be better for the future implementations of other
>>> PECI functional drivers such as crash dump driver and so on. So I'm going
>>> change the unit-address only.
>>
>>
>> 2 nodes at the same address is wrong (and soon dtc will warn you on
>> this). You have 2 potential options. The first is you need additional
>> address information in the DT if these are in fact 2 independent
>> devices. This could be something like a function number to use
>> something from PCI addressing. From what I found on PECI, it doesn't
>> seem to have anything like that. The 2nd option is you have a single
>> DT node which registers multiple hwmon devices. DT nodes and drivers
>> don't have to be 1-1. Don't design your DT nodes from how you want to
>> partition drivers in some OS.
>>
>> Rob
>>
>
> Please correct me if I'm wrong but I'm still thinking that it is
> possible. Also, I did compile it but dtc doesn't make a warning. Let me
> show an another use case which is similar to this case:

I did say *soon*. It's in dtc repo, but not the kernel copy yet.

> In arch/arm/boot/dts/aspeed-g5.dtsi
> [...]
> lpc_host: lpc-host@80 {
>         compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
>         reg = <0x80 0x1e0>;
>         reg-io-width = <4>;
>
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges = <0x0 0x80 0x1e0>;
>
>         lpc_ctrl: lpc-ctrl@0 {
>                 compatible = "aspeed,ast2500-lpc-ctrl";
>                 reg = <0x0 0x80>;
>                 clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>                 status = "disabled";
>         };
>
>         lpc_snoop: lpc-snoop@0 {
>                 compatible = "aspeed,ast2500-lpc-snoop";
>                 reg = <0x0 0x80>;
>                 interrupts = <8>;
>                 status = "disabled";
>         };
> }
> [...]
>
> This is device tree setting for LPC interface and its child nodes.
> LPC interface can be used as a multi-functional interface such as
> snoop 80, KCS, SIO and so on. In this use case, lpc-ctrl@0 and
> lpc-snoop@0 are sharing their address range from their individual
> driver modules and they can be registered quite well through both
> static dt or dynamic dtoverlay. PECI is also a multi-functional
> interface which is similar to the above case, I think.

This case too is poor design and should be fixed as well. Simply put,
you can have 2 devices on a bus at the same address without some sort
of mux or arbitration device in the middle. If you have a device/block
with multiple functions provided to the OS, then it is the OS's
problem to arbitrate access. It is not a DT problem because OS's can
vary in how they handle that both from OS to OS and over time.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
