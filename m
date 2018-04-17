Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FA1F7E86F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 18:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752227AbeDQSQ0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 14:16:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:52617 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751980AbeDQSQX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Apr 2018 14:16:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Apr 2018 11:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,464,1517904000"; 
   d="scan'208";a="192235645"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.150]) ([10.7.153.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Apr 2018 11:16:22 -0700
Subject: Re: [PATCH v3 04/10] Documentations: dt-bindings: Add a document of
 PECI adapter driver for Aspeed AST24xx/25xx SoCs
To:     Rob Herring <robh@kernel.org>
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
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-5-jae.hyun.yoo@linux.intel.com>
 <20180416181035.rcjvt4rlrwaj5yxf@rob-hp-laptop>
 <53ff5b2b-eba8-8311-64a9-abd4bc72226d@linux.intel.com>
 <CAL_Jsq+1wC-KhXPeCSNhCeCih6=CatJbyumO51ucD17Rt7qofw@mail.gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f07623c4-5f0c-4ab1-f761-44bd702bbdf0@linux.intel.com>
Date:   Tue, 17 Apr 2018 11:16:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+1wC-KhXPeCSNhCeCih6=CatJbyumO51ucD17Rt7qofw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/17/2018 6:16 AM, Rob Herring wrote:
> On Mon, Apr 16, 2018 at 6:12 PM, Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>> On 4/16/2018 11:10 AM, Rob Herring wrote:
>>>
>>> On Tue, Apr 10, 2018 at 11:32:06AM -0700, Jae Hyun Yoo wrote:
>>>>
>>>> This commit adds a dt-bindings document of PECI adapter driver for Aspeed
>>>> AST24xx/25xx SoCs.
> 
> [...]
> 
>>>> +- clocks            : Should contain clock source for PECI controller.
>>>> +                     Should reference clkin.
>>>> +- clock_frequency   : Should contain the operation frequency of PECI
>>>> controller
>>>> +                     in units of Hz.
>>>> +                     187500 ~ 24000000
>>>
>>>
>>> This is the frequency of the bus or used to derive it? It would be
>>> better to specify the bus frequency instead and have the driver
>>> calculate its internal freq. And then use "bus-frequency" instead.
>>>
>>
>> I agree with you. Actually, it is being used for operation frequency setting
>> of PECI controller module in SoC so it's different from the meaning of
>> "bus-frequency". I'll change it to "operation-frequency".
> 
> No, now you've gone from a standard property name to something custom.
> Why do you need to set the frequency in DT if it is not related to the
> interface frequency?
> 
> Rob
> 

Actually, the interface frequency is affected by the operation frequency
but there is no description of its relationship in datasheet. I'll check
again about the detail to ASPEED chip vendor and will use
'bus-frequency' if available.

Thanks,

Jae
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
