Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6538AC4332F
	for <linux-doc@archiver.kernel.org>; Wed, 21 Dec 2022 17:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbiLUR1m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Dec 2022 12:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234732AbiLUR1j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Dec 2022 12:27:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAA3644A
        for <linux-doc@vger.kernel.org>; Wed, 21 Dec 2022 09:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671643612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NuanpIiit3pxf0DfbjP3/X8tU6mOQsYwFdbXpF1jEBw=;
        b=UEyL5cmLiTs6BVItbEfqAYnMfOl4X0sDbNVxqAQK8GFWgkVvbcsQF/eI9mA8usrwJUO3UE
        qAjq4BiICdwDTBfmnpMAkTATH64UaIiH+k0KrccrerpRNjLLy3JQgf0qJgAk3+oc0Qw2gf
        hmHLcAzDwVUCMwJiZBsI/ijlskyRBes=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-usN0rZ9zMFCsnnmF-4Wdmg-1; Wed, 21 Dec 2022 12:26:50 -0500
X-MC-Unique: usN0rZ9zMFCsnnmF-4Wdmg-1
Received: by mail-wr1-f70.google.com with SMTP id j29-20020adfb31d000000b0024237066261so3130515wrd.14
        for <linux-doc@vger.kernel.org>; Wed, 21 Dec 2022 09:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuanpIiit3pxf0DfbjP3/X8tU6mOQsYwFdbXpF1jEBw=;
        b=Y+LFIfaEdCyABvGhOF5Xc1Wkx9bRYcHjLzIfszl1WYDqSFhLCQegrShwyPruxeP7k7
         0/XJ50GeW5p3/1mrNuclq+4Ua69/iuKMKKEAmWhR76pkPV2SbLpVT1J8Y4d+mYGkwSn6
         HN684svw0MkDUOgLBuiVJZFhh/Vd7ZJneNusPWCBOMvnCz0BiV6o8E36RWU2O7GvG5vQ
         MzmU+W81H4S3faXGPMo4apUKpJafsAl892ekfi/1ijpLUV1WpkEwJ8804eRjkTuF8X/P
         78LjZuZpuVnIYSiJLYkrPgeA3FK93nC/Rf35V60JuYw98IQjsmamRadKlnuJskPtJ+kM
         rd5Q==
X-Gm-Message-State: AFqh2krX2y0FM79rnafYaLccJeYL1WngipGhud1b0YNydiVUXm75TjTp
        6KteX6TXq2RPX1EE2m8YF+3dypuvsNZWyfEbjS1W3Kjkz2uBqfO07AJUcaytOJ3A4dl7I+Zfffc
        RHZ0bMOjcIsc53sRz4nc=
X-Received: by 2002:a05:600c:1f12:b0:3cf:8155:2adc with SMTP id bd18-20020a05600c1f1200b003cf81552adcmr2334951wmb.33.1671643609330;
        Wed, 21 Dec 2022 09:26:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmCCrwZo4nu1X4aGkuZsQZJ+WKxm5A/pgzSMDNUisKMUrHcMJkTIyFUzoV5mJaknfoOilw9A==
X-Received: by 2002:a05:600c:1f12:b0:3cf:8155:2adc with SMTP id bd18-20020a05600c1f1200b003cf81552adcmr2334924wmb.33.1671643609137;
        Wed, 21 Dec 2022 09:26:49 -0800 (PST)
Received: from [192.168.9.16] (net-2-34-28-158.cust.vodafonedsl.it. [2.34.28.158])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c310f00b003b47e75b401sm3174983wmo.37.2022.12.21.09.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 09:26:48 -0800 (PST)
Message-ID: <d34b021c-eec4-905e-f352-734db2d8338a@redhat.com>
Date:   Wed, 21 Dec 2022 18:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v7 4/4] tty: serial: 8250: add DFL bus driver for Altera
 16550.
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        matthew.gerlach@linux.intel.com
Cc:     hao.wu@intel.com, yilun.xu@intel.com, russell.h.weight@intel.com,
        basheer.ahmed.muddebihal@intel.com, trix@redhat.com,
        mdf@kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianfei.zhang@intel.com, corbet@lwn.net,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        jirislaby@kernel.org, geert+renesas@glider.be,
        niklas.soderlund+renesas@ragnatech.se, macro@orcam.me.uk,
        johan@kernel.org, lukas@wunner.de, ilpo.jarvinen@linux.intel.com,
        bagasdotme@gmail.com
References: <20221220163652.499831-1-matthew.gerlach@linux.intel.com>
 <20221220163652.499831-5-matthew.gerlach@linux.intel.com>
 <Y6HsQJQMDnHgTesF@smile.fi.intel.com>
Content-Language: en-US
From:   Marco Pagani <marpagan@redhat.com>
In-Reply-To: <Y6HsQJQMDnHgTesF@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2022-12-20 18:09, Andy Shevchenko wrote:
> On Tue, Dec 20, 2022 at 08:36:52AM -0800, matthew.gerlach@linux.intel.com wrote:
>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>
>> Add a Device Feature List (DFL) bus driver for the Altera
>> 16550 implementation of UART.
> 
> In general the code here looks good to me, but one thing to discuss due to
> comment to the previous patch(es).
> 
> ...
> 
>> +	u64 *p;
>> +
>> +	p = dfh_find_param(dfl_dev, DFHv1_PARAM_ID_CLK_FRQ);
>> +	if (!p)
>> +		return dev_err_probe(dev, -EINVAL, "missing CLK_FRQ param\n");
>> +
>> +	p++;
>> +	uart->port.uartclk = *p;
> 
> So, here and the below is using always the second u64 from the returned data.
> Does it mean:
> - we always skip the first u64 from the returned buffer and hence... (see below)
> - we may actually return the second u64 as a plain number (not a pointer) from
>   (an additional?) API? In such case we would not need to take care about this
>   p++; lines here and there.
> - we have fixed length of the data, returned by find_param(), i.e. 2 u64 words?
> 

I also had the impression that this method of getting and incrementing a pointer
to the beginning of the parameter block is a bit more error-prone than necessary.
Since parameter blocks are now standardized, wouldn't be easier and safer to wrap
the access logic into a helper function like:

u16 dfh_get_param_data(struct dfl_device *dfl_dev, u16 param_id, u64 *data)

that directly provides a copy of the parameter's data into a pointer provided by
the caller and returns the parameter version or an error if not found?

Thanks,
Marco

