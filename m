Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B43C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Feb 2022 14:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236496AbiBRO4r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Feb 2022 09:56:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236397AbiBRO4e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Feb 2022 09:56:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A8D557B3B
        for <linux-doc@vger.kernel.org>; Fri, 18 Feb 2022 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645196170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4ldn/wyFUYS9oX2H4KZV4SRGFhvLNkEJlNBHlweSE44=;
        b=cXG2pkHclWEghRUsotYGFMqC858u+8tvxFFEZTFiMTdqfBWEtAP4pAdMgYTmFf/V/1/Whj
        3lYEFHjmDIh+9x/fUEEIXHjhf4TS9CNFFJ7lKogI1jQTlenWtzmvhJ3iqTVPy0r9ohldk2
        XmWmPj+zWWTrmIj3O8UwBnanttq2aus=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-b3WX4GbqOI6eTLEa5tiQ4A-1; Fri, 18 Feb 2022 09:56:02 -0500
X-MC-Unique: b3WX4GbqOI6eTLEa5tiQ4A-1
Received: by mail-qk1-f200.google.com with SMTP id 199-20020a3703d0000000b005f17c5b0356so4216284qkd.16
        for <linux-doc@vger.kernel.org>; Fri, 18 Feb 2022 06:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4ldn/wyFUYS9oX2H4KZV4SRGFhvLNkEJlNBHlweSE44=;
        b=3fN8im1WJFjikEYwMxF7nHIDJUGAWa+IAexbSqf5rYlfT2FvanoQGfasrQNz1daNRh
         JZ+tQCVkLx/sivNYn7QsSSLD544m9YxFCjKz+D2Ew5LAc/mULx4hzeHqlagjptyZjpXe
         COXzn16U+X0biw5bLcwL5J7wQAw1nZFe7XA/Zw/XKxhvQPZfyI0BU6fVzEb9Q9yVEOih
         abbNegfQcMRl+hrYIub9nlxd+W9xJhk52EJoFTovUHLYRScICm17U+f2pIC0Yv8FlYsH
         jTITdTsXKFqUcyBQmzPPypNWtY0OlXVbQ52WjPYJ070guLmsWSdo9t4bKjtxKkArldzO
         s/Rw==
X-Gm-Message-State: AOAM530VpwOVKXq0hA8eu3s8II0/saJonuK15WnaGA2/GOKKfxHoyfB5
        euTuERgy2H30fYCshblqTSy3ZXoSP77JGxLJ5kCu5tq5j2qbRr/stehgplYwdbvPjsLIghFHroP
        1u8VNpZor0LgIk3XauI+K
X-Received: by 2002:ac8:5c8f:0:b0:2dd:b404:bd94 with SMTP id r15-20020ac85c8f000000b002ddb404bd94mr1693191qta.50.1645196161892;
        Fri, 18 Feb 2022 06:56:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8JBQaaH0N3aIPc7v5Iu6VHkGq5FX+w6ES4TNS3Zwc4jIuKXDTgK1I/UV9BSzRxEBdFdrTJA==
X-Received: by 2002:ac8:5c8f:0:b0:2dd:b404:bd94 with SMTP id r15-20020ac85c8f000000b002ddb404bd94mr1693178qta.50.1645196161706;
        Fri, 18 Feb 2022 06:56:01 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id w3sm25923138qta.13.2022.02.18.06.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 06:56:01 -0800 (PST)
Subject: Re: [PATCH v1 4/7] fpga: dfl: fix VF creation when ports have no
 local BAR space
To:     "Zhang, Tianfei" <tianfei.zhang@intel.com>,
        "Wu, Hao" <hao.wu@intel.com>, "mdf@kernel.org" <mdf@kernel.org>,
        "Xu, Yilun" <yilun.xu@intel.com>,
        "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        Matthew Gerlach <matthew.gerlach@linux.intel.com>
References: <20220214112619.219761-1-tianfei.zhang@intel.com>
 <20220214112619.219761-5-tianfei.zhang@intel.com>
 <c527e9c7-4588-463b-8a6b-3db68d003d7a@redhat.com>
 <BN9PR11MB54830E0D185101B6B1517113E3379@BN9PR11MB5483.namprd11.prod.outlook.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <1281cbc7-7a1f-da84-3713-0d81982379ab@redhat.com>
Date:   Fri, 18 Feb 2022 06:55:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <BN9PR11MB54830E0D185101B6B1517113E3379@BN9PR11MB5483.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2/18/22 12:14 AM, Zhang, Tianfei wrote:
>
>> -----Original Message-----
>> From: Tom Rix <trix@redhat.com>
>> Sent: Tuesday, February 15, 2022 11:51 PM
>> To: Zhang, Tianfei <tianfei.zhang@intel.com>; Wu, Hao <hao.wu@intel.com>;
>> mdf@kernel.org; Xu, Yilun <yilun.xu@intel.com>; linux-fpga@vger.kernel.org;
>> linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: corbet@lwn.net; Matthew Gerlach <matthew.gerlach@linux.intel.com>
>> Subject: Re: [PATCH v1 4/7] fpga: dfl: fix VF creation when ports have no local
>> BAR space
>>
>>
>> On 2/14/22 3:26 AM, Tianfei zhang wrote:
>>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>>
>>> When a port is not connected to the same PCIe endpoint as the FME, the
>>> port does not need to be released before being virtualized.  Fix VF
>>> creation code to handle this new use
>> Similar, how does this fit in with iofs, this looks like it would not be valid for the
>> existing cards
> IOFS introducing multiple methods for PR and AFU access.
> 1. Legacy Model.
> 2. Micro-Personas in AFU.
> 3. Multiple VFs per PR slot.
>
> For 1 and 2 model, there are 1:1 mapping between Port device and PR slot (or entire AFU). In virtualization,
> it should release the Port device firstly and then assign to VM. In this models, the DFL driver will track  that
> the number of port devices has released (cdev->released_port_num in dfl_fpga_cdev_config_ports_vf() function)
> are equal with the numbers of SRIOV or not. But in model 3, it has multiple VFs per PR slot, and assign the VF to VM
> without release the port device, so the tracking mechanism of cdev->released_port_num is not workable on new

If ->release_port_num is not workable, then it needs to be generalized.

Refactor to handle all the cases.

Tom

> model. This patch want to handle this new model during VF creation.
>
>>> case.
>>>
>>> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>
>>> ---
>>>    drivers/fpga/dfl.c | 11 +++++++++--
>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c index
>>> 26f8cf890700..cfc539a656f0 100644
>>> --- a/drivers/fpga/dfl.c
>>> +++ b/drivers/fpga/dfl.c
>>> @@ -1705,15 +1705,22 @@
>> EXPORT_SYMBOL_GPL(dfl_fpga_cdev_config_ports_pf);
>>>    int dfl_fpga_cdev_config_ports_vf(struct dfl_fpga_cdev *cdev, int num_vfs)
>>>    {
>>>    	struct dfl_feature_platform_data *pdata;
>>> -	int ret = 0;
>>> +	int ret = 0, port_count = 0;
>>>
>>>    	mutex_lock(&cdev->lock);
>>> +
>>> +	list_for_each_entry(pdata, &cdev->port_dev_list, node) {
>>> +		if (pdata->dev)
>> This looks wrong,
>>
>> pdata->dev is dereferenced below, if there is a case were (!pdata->dev)
>> here there would be crash later.
>>
>>> +			continue;
>>> +		port_count++;
>> how does this work when only some of the ports are handled in the new way ?
> This code want to handle the " Multiple VFs per PR slot" model as I mentioned above.
> In new model, the port_count want to count that how many port devices have released.
> This code looks not good readability, I try to re-write it.
>
>> Tom
>>
>>> +	}
>>> +
>>>    	/*
>>>    	 * can't turn multiple ports into 1 VF device, only 1 port for 1 VF
>>>    	 * device, so if released port number doesn't match VF device number,
>>>    	 * then reject the request with -EINVAL error code.
>>>    	 */
>>> -	if (cdev->released_port_num != num_vfs) {
>>> +	if (port_count && cdev->released_port_num != num_vfs) {
>>>    		ret = -EINVAL;
>>>    		goto done;
>>>    	}

