Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C49EB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 22:16:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjGTWQW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 18:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGTWQV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 18:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D0D1719
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 15:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689891332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jiBM0NhNH9zoQghOdBXzLiG9pF7WWbT0KDXTbOiJRh4=;
        b=hORkukRkOueeYiv/kgBw2JohAZBIy2JccObUg/2/o7rzjb9feR3/SAXWx+1GFBB+zGeq+I
        oMVPCsnFCrfTf9VC6BmLIBXnIIAWGP0kcVVLV6i/Ra+bzbzjmix3eAC8MMtJgpIapBY3wr
        s6gfxqgwXj0Y5xDQPO77bfvmQYhISUU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-E8lIKbthMHCFHEkxV73NxA-1; Thu, 20 Jul 2023 18:15:31 -0400
X-MC-Unique: E8lIKbthMHCFHEkxV73NxA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-97542592eb9so79757866b.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 15:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689891330; x=1690496130;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiBM0NhNH9zoQghOdBXzLiG9pF7WWbT0KDXTbOiJRh4=;
        b=DujNj6VIWikYI4U/jbtG56GL1kcYWKCFR+NG+iAGjr+Z6vssjTdcwsNYOkT6vd7254
         0gsdsWVbdUEzl4kgh+wJliDGscmnRJeSqzIVGB6QkxfFAcPkQFhyruA0/hvUiFUkr/4M
         txvgHLW1+dyD/Uhrfr7szlgkLIuWiM6GSD+xsHq2GFzDiCNX3Obzc7/hRpcVh7OAGm2W
         is/hLJe1wrq3vcpNjrGY7xEedI8tatqJt3pKzl4jyKLmF/hXDy1mEjqgm8jKHlYYhafD
         3sO2kRgtGsN2Yc/B93NW4Ui/O1LH2XTb++LOfHfcf/CwNktz/WizFqYLcB+bYIfn8Gxh
         rXKw==
X-Gm-Message-State: ABy/qLZSFbdbVKyUIl8+5C7jiw4DBQNIEwSq0PE+i7en9r0GzbsphCP4
        Qjw6Lii9VB8bUbyUZbdBu3P6SoKsrdbJhSaP7pbxOw6BotXQEeqiCPv2CAh0Aqaw/5LPRyxtVSn
        ok2SMsqydLDkYphANzk8j
X-Received: by 2002:a17:906:5354:b0:991:e458:d16 with SMTP id j20-20020a170906535400b00991e4580d16mr62259ejo.72.1689891330351;
        Thu, 20 Jul 2023 15:15:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlECUhn9EK2zpYiJA37fNk3260rSjUtuX6ugQu1C3qduT+/RDuNw7+Jcosu0bPOTztBCM08zWQ==
X-Received: by 2002:a17:906:5354:b0:991:e458:d16 with SMTP id j20-20020a170906535400b00991e4580d16mr62233ejo.72.1689891330015;
        Thu, 20 Jul 2023 15:15:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id lf26-20020a170906ae5a00b0098e42bef736sm1267207ejb.176.2023.07.20.15.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 15:15:29 -0700 (PDT)
Message-ID: <bcc3325c-ff04-431e-1c72-f4dab957b5a3@redhat.com>
Date:   Thu, 20 Jul 2023 23:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-misc-next v8 01/12] drm: manager to keep track of GPUs
 VA mappings
Content-Language: en-US
To:     Steven Price <steven.price@arm.com>
Cc:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net,
        donald.robson@imgtec.com,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>, linux-doc@vger.kernel.org,
        nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-2-dakr@redhat.com>
 <2bf64010-c40a-8b84-144c-5387412b579e@arm.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <2bf64010-c40a-8b84-144c-5387412b579e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/20/23 12:44, Steven Price wrote:
> On 20/07/2023 01:14, Danilo Krummrich wrote:
>> Add infrastructure to keep track of GPU virtual address (VA) mappings
>> with a decicated VA space manager implementation.
>>
>> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
>> start implementing, allow userspace applications to request multiple and
>> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
>> intended to serve the following purposes in this context.
>>
>> 1) Provide infrastructure to track GPU VA allocations and mappings,
>>     making using an interval tree (RB-tree).
>>
>> 2) Generically connect GPU VA mappings to their backing buffers, in
>>     particular DRM GEM objects.
>>
>> 3) Provide a common implementation to perform more complex mapping
>>     operations on the GPU VA space. In particular splitting and merging
>>     of GPU VA mappings, e.g. for intersecting mapping requests or partial
>>     unmap requests.
>>
>> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Acked-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Tested-by: Matthew Brost <matthew.brost@intel.com>
>> Tested-by: Donald Robson <donald.robson@imgtec.com>
>> Suggested-by: Dave Airlie <airlied@redhat.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
>> new file mode 100644
>> index 000000000000..dee2235530d6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> 
> [...]
> 
>> +static bool
>> +drm_gpuva_check_overflow(u64 addr, u64 range)
>> +{
>> +	u64 end;
>> +
>> +	return WARN(check_add_overflow(addr, range, &end),
>> +		    "GPUVA address limited to %lu bytes.\n", sizeof(end));
>> +}
> 
> This produces a warning on 32 bit systems as sizeof() isn't necessarily
> an unsigned long. The fix below silences the warning.

Thank you for fixing this up! Applied both of your patches to drm-misc-next.

- Danilo

> 
> Thanks,
> 
> Steve
> 
> ---8<-----
>  From 9c7356580362b6ac4673724f18ea6e8453b52913 Mon Sep 17 00:00:00 2001
> From: Steven Price <steven.price@arm.com>
> Date: Thu, 20 Jul 2023 10:58:09 +0100
> Subject: [PATCH] drm: manager: Fix printk format for size_t
> 
> sizeof() returns a size_t which may be different to an unsigned long.
> Use the correct format specifier of '%zu' to prevent compiler warnings.
> 
> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   drivers/gpu/drm/drm_gpuva_mgr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index 0b80177592a6..f86bfad74ff8 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -619,7 +619,7 @@ drm_gpuva_check_overflow(u64 addr, u64 range)
>   	u64 end;
>   
>   	return WARN(check_add_overflow(addr, range, &end),
> -		    "GPUVA address limited to %lu bytes.\n", sizeof(end));
> +		    "GPUVA address limited to %zu bytes.\n", sizeof(end));
>   }
>   
>   static bool

