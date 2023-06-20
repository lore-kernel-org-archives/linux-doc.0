Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12970EB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 13:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbjFTN7r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 09:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbjFTN7q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 09:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1891B6
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687269547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QTLnyrCbOY1xAfP5SqHK9oZhSTIFzQoN+FT5nbHO/xo=;
        b=dxHcvQ2irS/IXiBDe+bJkryhqR92sUPmxPHEyIqEvVkfDky9GVUYaCsCMCEd7MMVxRe98t
        ulFHuwqmlgybPkFwWsmVgvTBQk6Q/DqEE5iQzxb7mR7Rju/AmuQKiHyEs/XOaItU5fCn6y
        sOquqecRcS2iLJYd8TnvvQHHwQPc5Ew=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-t-wZmbamNGmxz2ercdai_A-1; Tue, 20 Jun 2023 09:59:05 -0400
X-MC-Unique: t-wZmbamNGmxz2ercdai_A-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-514a6909c35so3104316a12.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 06:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687269543; x=1689861543;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTLnyrCbOY1xAfP5SqHK9oZhSTIFzQoN+FT5nbHO/xo=;
        b=Tcqi4aFME9Z2orLSZpCQX/qpKBX/zchKzV8y2H4tjatD6TL5q6GeAdlNHmFLqjNZ5W
         E+HDAgmO3tGbJZy9kc0mG/ffY3g0kWe7eOfz+KCX8zsajVZC94U5xW5Ymz9cI+SWiC4R
         ED/aW9WmrRHKCCqF0wmWaCizHrtuQrXqL7F5MKBIX4zM7uTRcui7z/dq/wXBCa4dSroK
         ZEkcOSF9WuOcfa/1GQkdjN5Jv9GbRz0vmFMEzCihQBlIq9KmUYzqNHW4G7w4QV6sTxfe
         dCkAV1qECOureEfHZnJW/i1vVjwmCKpEmWDABrP8TB8xRA+m7RzHnBME/0DKHMLYWrqq
         BNYg==
X-Gm-Message-State: AC+VfDxp4zlm7h7aaIhZYc7lUGlB+UnjOo9auDgW31f2gcEEswSD3k0c
        UCqUdde81EPdN0TiEN2czBvdOA0qpsylxIll9IaY4JZVRulwo9/2+BdXQFbXLjB7EjI70KXcafC
        57AJ4cbs2pi3wZ29kUKf2
X-Received: by 2002:aa7:d888:0:b0:51a:23fb:355c with SMTP id u8-20020aa7d888000000b0051a23fb355cmr8076331edq.10.1687269543776;
        Tue, 20 Jun 2023 06:59:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6b5AT6QAAjfNGSFqHnSqiPb5mv+npztwci67WB0CYLQf6lJNAROx+U2HhYdxy7fYnS0gvCQg==
X-Received: by 2002:aa7:d888:0:b0:51a:23fb:355c with SMTP id u8-20020aa7d888000000b0051a23fb355cmr8076320edq.10.1687269543440;
        Tue, 20 Jun 2023 06:59:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id x22-20020aa7dad6000000b0050d83a39e6fsm1278687eds.4.2023.06.20.06.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 06:59:02 -0700 (PDT)
Message-ID: <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
Date:   Tue, 20 Jun 2023 14:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
        Liam.Howlett@oracle.com, matthew.brost@intel.com,
        boris.brezillon@collabora.com, alexdeucher@gmail.com,
        ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
        jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Donald Robson <donald.robson@imgtec.com>,
        Dave Airlie <airlied@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christian,

On 6/20/23 08:45, Christian König wrote:
> Hi Danilo,
> 
> sorry for the delayed reply. I've trying to dig myself out of a hole at 
> the moment.

No worries, thank you for taking a look anyway!

> 
> Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
>> [SNIP]
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index bbc721870c13..5ec8148a30ee 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -36,6 +36,8 @@
>>   #include <linux/kref.h>
>>   #include <linux/dma-resv.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>>   #include <drm/drm_vma_manager.h>
>> @@ -379,6 +381,18 @@ struct drm_gem_object {
>>        */
>>       struct dma_resv _resv;
>> +    /**
>> +     * @gpuva:
>> +     *
>> +     * Provides the list of GPU VAs attached to this GEM object.
>> +     *
>> +     * Drivers should lock list accesses with the GEMs &dma_resv lock
>> +     * (&drm_gem_object.resv).
>> +     */
>> +    struct {
>> +        struct list_head list;
>> +    } gpuva;
>> +
>>       /**
>>        * @funcs:
>>        *
> 
> I'm pretty sure that it's not a good idea to attach this directly to the 
> GEM object.

Why do you think so? IMHO having a common way to connect mappings to 
their backing buffers is a good thing, since every driver needs this 
connection anyway.

E.g. when a BO gets evicted, drivers can just iterate the list of 
mappings and, as the circumstances require, invalidate the corresponding 
mappings or to unmap all existing mappings of a given buffer.

What would be the advantage to let every driver implement a driver 
specific way of keeping this connection? Do you see cases where this 
kind of connection between mappings and backing buffers wouldn't be good 
enough? If so, which cases do you have in mind? Maybe we can cover them 
in a common way as well?

> 
> As you wrote in the commit message it's highly driver specific what to 
> map and where to map it.

In the end the common case should be that in a VA space at least every 
mapping being backed by a BO is represented by a struct drm_gpuva.

> 
> Instead I suggest to have a separate structure for mappings in a VA 
> space which driver can then add to their GEM objects or whatever they 
> want to map into their VMs.

Which kind of separate structure for mappings? Another one analogous to 
struct drm_gpuva?

- Danilo

> 
> Regards,
> Christian.
> 
> 

