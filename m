Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 365DB7DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 16:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751555AbeDXQ0z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 12:26:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:57093 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750842AbeDXQ0r (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Apr 2018 12:26:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Apr 2018 09:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,323,1520924400"; 
   d="scan'208";a="53285316"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147]) ([10.7.153.147])
  by orsmga002.jf.intel.com with ESMTP; 24 Apr 2018 09:26:45 -0700
Subject: Re: [PATCH v3 09/10] drivers/hwmon: Add PECI hwmon client drivers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alan Cox <alan@linux.intel.com>,
        Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>,
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
        Vernon Mauery <vernon.mauery@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-10-jae.hyun.yoo@linux.intel.com>
 <1524585397.21176.502.camel@linux.intel.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c62f1c9a-1eae-49d9-2fde-c65452d5f0e6@linux.intel.com>
Date:   Tue, 24 Apr 2018 09:26:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1524585397.21176.502.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Andy,

Thanks a lot for your review. Please check my inline answers.

On 4/24/2018 8:56 AM, Andy Shevchenko wrote:
> On Tue, 2018-04-10 at 11:32 -0700, Jae Hyun Yoo wrote:
> 
>>   drivers/hwmon/peci-cputemp.c  | 783
>> ++++++++++++++++++++++++++++++++++++++++++
>>   drivers/hwmon/peci-dimmtemp.c | 432 +++++++++++++++++++++++
> 
> Does it make sense one driver per patch?
> 

Yes, I'll separate it into two patches.

>> +#define CLIENT_CPU_ID_MASK    0xf0ff0  /* Mask for Family / Model
>> info */
> 
>> +struct cpu_gen_info {
>> +	u32 type;
>> +	u32 cpu_id;
>> +	u32 core_max;
>> +};
>>
> 
>> +static const struct cpu_gen_info cpu_gen_info_table[] = {
>> +	{ .type = CPU_GEN_HSX,
>> +	  .cpu_id = 0x306f0, /* Family code: 6, Model number: 63
>> (0x3f) */
>> +	  .core_max = CORE_MAX_ON_HSX },
>> +	{ .type = CPU_GEN_BRX,
>> +	  .cpu_id = 0x406f0, /* Family code: 6, Model number: 79
>> (0x4f) */
>> +	  .core_max = CORE_MAX_ON_BDX },
>> +	{ .type = CPU_GEN_SKX,
>> +	  .cpu_id = 0x50650, /* Family code: 6, Model number: 85
>> (0x55) */
>> +	  .core_max = CORE_MAX_ON_SKX },
>> +};
> 
> Are we talking about x86 CPU IDs here?
> If so, why x86 corresponding headers, including intel-family.h are not
> used?
> 

Yes, that would make more sense. I'll include the intel-family.h and 
will use these defines instead:
INTEL_FAM6_HASWELL_X
INTEL_FAM6_BROADWELL_X
INTEL_FAM6_SKYLAKE_X

Thanks,

Jae

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
