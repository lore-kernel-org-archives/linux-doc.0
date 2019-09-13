Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A56117D92A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Sep 2019 16:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388683AbfIMQXh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Sep 2019 12:23:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35771 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388633AbfIMQXh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Sep 2019 12:23:37 -0400
Received: by mail-pl1-f195.google.com with SMTP id s17so8537089plp.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2019 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7cU/gXOBv6iyfoh2n80VdzW/U877gzRRBkpAQEhWdUQ=;
        b=T6jA6XrZW9NKHsa8FEdvIZ6SMSLdvfYI6ODSU0lvqq/UgF4BtGGOj92sx7XM05zc7R
         11rvAn1ZJbIeg3FrVIP+o/RO0a8J+tR2DH04pFYQhLE2FWtQDt2fUL84yf03mT5vw/6n
         IjQFsNO775pquD1TRc/9QilMNBY63Ha9gOdZxFJ2j+Vn5yje7evOyWrtSEdvA11XTY19
         mbLucsdGghe2Shx0ywO70QVehCCnWb3Z6ZEtfRvL5EpCFA8bo4F7lKC7O/eknIf4jHcW
         5k7X5x3Rao+t7ZCHzYepbAJDaU+QtxA3wRfcpOtATFXAONBVDoLMUgNlRNB9NheHzsj8
         8N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7cU/gXOBv6iyfoh2n80VdzW/U877gzRRBkpAQEhWdUQ=;
        b=A3GwAXZIklSlBYTXdltbpk6azocF/MAVcdQ4tytsYo3LMOLh2ALoZDjrBnKZQe0o0o
         hgl26h45FLLYeQDJRKSoyAxzV9pfq7phWMLml+2bG9pWSKi3tN6aCUAULOu5OIJeWyye
         hEbtD4W1mQ1X6J6cSFVRnu4BwxdufMAWgCTcvssoDV9Gm674ZTQGzDdx7q6Xw7f+Hpkv
         ZsRs709fMGxDLxT2F20jwHym4ViurBQ7SQqDpuPPg5fvvQjzC1+YTK4KO/xva9Rr7SUZ
         24kqjvOIzhgLBs8pG5iUH0N3Z5EVnfUVMeTy4TlTqW2XpXsnKHDkl2v/kstKnVa6ijE1
         8B1g==
X-Gm-Message-State: APjAAAXM4W4QH0u8K8TjftO6kK0/JkE3gfZgcz8pVNui3al/yb3gVTUN
        u1Q+ZwV4tb7SZky8Z+5YIWSgyA==
X-Google-Smtp-Source: APXvYqyMhbF/6cwDT2ZOaY1f67TOV3H9L3Ql8ZENImwIkTbMH3ywT2pX7Wd3A4sqDAEdPydeyV44hA==
X-Received: by 2002:a17:902:7001:: with SMTP id y1mr1569784plk.49.1568391814962;
        Fri, 13 Sep 2019 09:23:34 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:83a1:b44d:81f2:955a:8003? ([2605:e000:100e:83a1:b44d:81f2:955a:8003])
        by smtp.gmail.com with ESMTPSA id v21sm2720326pjy.3.2019.09.13.09.23.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2019 09:23:32 -0700 (PDT)
Subject: Re: [PATCH 3/3] null_blk: validated the number of devices
To:     Matthew Wilcox <willy@infradead.org>,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Cc:     Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>, "m@bjorling.me" <m@bjorling.me>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "krisman@collabora.com" <krisman@collabora.com>
References: <20190911144636.226945-1-andrealmeid@collabora.com>
 <20190911144636.226945-3-andrealmeid@collabora.com>
 <20190912161937.GK29434@bombadil.infradead.org>
 <dbdb0415-8762-f9c1-a65a-3531d9cca109@collabora.com>
 <DM6PR04MB5754177B405819C802549AE686B00@DM6PR04MB5754.namprd04.prod.outlook.com>
 <d55554f5-7212-c5fc-dbb0-4269be913aaa@collabora.com>
 <20190913151249.GN29434@bombadil.infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <e029c399-e0cf-62e4-5ce3-a4287eb6cd94@kernel.dk>
Date:   Fri, 13 Sep 2019 10:23:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913151249.GN29434@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/13/19 9:12 AM, Matthew Wilcox wrote:
> On Fri, Sep 13, 2019 at 11:57:17AM -0300, André Almeida wrote:
>> On 9/12/19 7:20 PM, Chaitanya Kulkarni wrote:
>>> On 09/12/2019 03:09 PM, André Almeida wrote:
>>>> Hello Matthew,
>>>>
>>>> On 9/12/19 1:19 PM, Matthew Wilcox wrote:
>>>>> On Wed, Sep 11, 2019 at 11:46:36AM -0300, André Almeida wrote:
>>>>>>
>>>>>> -static int nr_devices = 1;
>>>>>> +static unsigned int nr_devices = 1;
>>>>>>    module_param(nr_devices, int, 0444);
>>>>>
>>>>> ^^^ you forgot to change the module_param to match
>>>>>
>>>>>> +	if (!nr_devices) {
>>>>>> +		pr_err("null_blk: invalid number of devices\n");
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>
>>>>> I don't think this is necessary.
>>>>>
>>>>
>>>> Could you explain why you don't think is necessary? As I see, the module
>>>> can't be used without any /dev/nullb* device, so why we should load it?
>>>>
>>>> Thanks,
>>>> 	André
>>>>
>>>
>>> I think Matthew is right here. I think module can be loaded with
>>> nr_devices=0.
>>>
>>> Did you get a chance to test nr_device=0 condition ?
>>>
>>
>> Yes. It says "module loaded" and lsmod shows that it is loaded indeed.
>> But you don't have any /dev/nullb*, so you can't do much with the module.
>>
>> With this patch, it refuses to load the module.
> 
> Why is that an improvement?  I agree it's an uninteresting thing to ask
> for, but I don't see a compelling need to fail the module load because
> of it.

It also breaks the case of loading it, then setting up a new device
through configfs.

-- 
Jens Axboe

