Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F265BC05027
	for <linux-doc@archiver.kernel.org>; Wed,  1 Feb 2023 18:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjBASEp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Feb 2023 13:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbjBASEm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Feb 2023 13:04:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD6F5356C
        for <linux-doc@vger.kernel.org>; Wed,  1 Feb 2023 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675274636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NHqnRVrVGsH0s7BP5ODEjlWZFmtlmfotNCTTEzO/Y1o=;
        b=DIBoJ6+80ovzVRxNc4PwCfUoztxTdNK6j596B59r5PD0Umz9nemKxn9TKynhO6DktUJDsT
        4BOM6VebW2SSf/iksi7EPB2xWNBz1Blc2kMNI1LJnRIuDwpoVpAbkV048MznuesVE/EQI7
        zoWp1s9XuyXyVHdW+uGloKFOrUAhQTk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-7MGS8arXNqC2GgaU8KzMjA-1; Wed, 01 Feb 2023 13:03:53 -0500
X-MC-Unique: 7MGS8arXNqC2GgaU8KzMjA-1
Received: by mail-wm1-f71.google.com with SMTP id o5-20020a05600c4fc500b003db0b3230efso1477090wmq.9
        for <linux-doc@vger.kernel.org>; Wed, 01 Feb 2023 10:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHqnRVrVGsH0s7BP5ODEjlWZFmtlmfotNCTTEzO/Y1o=;
        b=BG1eIVu6LvLIdVgwO392TfglAW9z0b0JmGXFpnjcnKZO6B1MdYQYn96o1VrOzOPNxc
         MJzlJBYD27Obm2IyVkJubkEkA2wNyIGNh8gX8YIibQhaf0aolAOG0O9raotBewXTVvqZ
         ed1FMG/oOSviREFFpae0rs97DW/9PG2TK9EJH0PTlT5LXBYj2C8eNN5S4K2wwp48uTes
         8leQeVbqAYmvYFccqxv/w6KOZvCjidPBhxeni47kJVSifbCt0l0v0EzyjzrIvVXNDuSk
         8zcznw+xGxHveSg5qNeeFk8oc46+ch/vPSUGjMpbo8oCvrpQYsWQHIMLdnkx/EIMnO/x
         vorg==
X-Gm-Message-State: AO0yUKXiWQA7aVjlSFwVPOB+rRbRGwf2O3+eYZM1sYKpwgUfwSxHAGOP
        nGOyH1e/Ic3Wvb2IN+bOZO2g6MzbJfe/Id3MCZLjpTre9gvxD2DSHP469TcWaE9lnPV7EMYwotR
        4/3MFq/o4jQhjmOugJ1Ok
X-Received: by 2002:a05:600c:4e53:b0:3dc:5390:6499 with SMTP id e19-20020a05600c4e5300b003dc53906499mr2951543wmq.1.1675274632546;
        Wed, 01 Feb 2023 10:03:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8RWgxHAxxme3PCml6Vw4YQkL/Vp0Q30f/GZD4RoMNh8TWXDsQ+OvBtB+e0X6QNaxXSFYW6iA==
X-Received: by 2002:a05:600c:4e53:b0:3dc:5390:6499 with SMTP id e19-20020a05600c4e5300b003dc53906499mr2951490wmq.1.1675274632249;
        Wed, 01 Feb 2023 10:03:52 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:3100:e20e:4ace:6f25:6a79? (p200300cbc7053100e20e4ace6f256a79.dip0.t-ipconnect.de. [2003:cb:c705:3100:e20e:4ace:6f25:6a79])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c544b000000b003dc4fd6e624sm2570630wmi.19.2023.02.01.10.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:03:51 -0800 (PST)
Message-ID: <fb8446af-fd87-5609-05bf-5064615c7918@redhat.com>
Date:   Wed, 1 Feb 2023 19:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 18/39] mm: Handle faultless write upgrades for shstk
Content-Language: en-US
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "Eranian, Stephane" <eranian@google.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "fweimer@redhat.com" <fweimer@redhat.com>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "kcc@google.com" <kcc@google.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "oleg@redhat.com" <oleg@redhat.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "bp@alien8.de" <bp@alien8.de>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "Schimpe, Christina" <christina.schimpe@intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>
Cc:     "Yu, Yu-cheng" <yu-cheng.yu@intel.com>
References: <20230119212317.8324-1-rick.p.edgecombe@intel.com>
 <20230119212317.8324-19-rick.p.edgecombe@intel.com>
 <7f63d13d-7940-afb6-8b25-26fdf3804e00@redhat.com>
 <50cf64932507ba60639eca28692e7df285bcc0a7.camel@intel.com>
 <1327c608-1473-af4f-d962-c24f04f3952c@redhat.com>
 <8c3820ae1448de4baffe7c476b4b5d9ba0a309ff.camel@intel.com>
 <4d224020-f26f-60a4-c7ab-721a024c7a6d@redhat.com>
 <dd06b54291ad5721da392a42f2d8e5636301ffef.camel@intel.com>
 <899d8f3baaf45b896cf335dec2143cd0969a2d8a.camel@intel.com>
 <ad7d94dd-f0aa-bf21-38c3-58ef1e9e46dc@redhat.com>
 <27b141c06c37da78afca7214ec7efeaf730162d9.camel@intel.com>
 <f4b62ed9-21a9-4b23-567e-51b339a643ac@redhat.com>
 <6a38779c1539c2bcfeb6bc8251ed04aa9b06802e.camel@intel.com>
 <0e29a2d0-08d8-bcd6-ff26-4bea0e4037b0@redhat.com>
 <f337d3b0e401c210b67a6465bf35f66f6a46fc3d.camel@intel.com>
 <a4857ccd-1d5f-2169-40bc-e7a75a0c896f@redhat.com>
 <f55d9563c432db15f8a768381103abe8e986a42b.camel@intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <f55d9563c432db15f8a768381103abe8e986a42b.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01.02.23 18:32, Edgecombe, Rick P wrote:
> On Wed, 2023-02-01 at 10:03 +0100, David Hildenbrand wrote:
>>>
>>> The other problem is that one of NULL passers is not for kernel
>>> memory.
>>> huge_pte_mkwrite() calls pte_mkwrite(). Shadow stack memory can't
>>> be
>>> created with MAP_HUGETLB, so it is not needed. Using
>>> pte_mkwrite_kernel() would look weird in this case, but making
>>> huge_pte_mkwrite() take a VMA would be for no reason. Maybe making
>>> huge_pte_mkwrite() take a VMA is the better of those two options.
>>> Or
>>> keep the NULL semantics...  Any thoughts?
>>
>> Well, the reason would be consistency. From a core-mm point of view
>> it
>> makes sense to handle this all consistency, even if the single user
>> (x86) wouldn't strictly require it right now.
>>
>> I'd just pass in the VMA and call it a day :)
> 
> Ok, I'll give it a spin.

It would be good to get more opinions on that, but I'm afraid we won't 
get more deep down in this thread :)

-- 
Thanks,

David / dhildenb

