Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41654C678D4
	for <linux-doc@archiver.kernel.org>; Tue,  7 Mar 2023 10:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbjCGKpn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Mar 2023 05:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbjCGKpD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Mar 2023 05:45:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AD63CE38
        for <linux-doc@vger.kernel.org>; Tue,  7 Mar 2023 02:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678185855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aDXgYZBLxUfMsLcw1qS/eHbSsPTT2QidbprcFoL7C7U=;
        b=Uw2yQU2IjZkKV1LZhnRjpb6VALYc+A6jZV9Xb5IUk739rUxj2JP1AqWsijTS2DrDEuyTLt
        CkkdKm64bD6aNNLp8WZujGgq4lm5Y3f5zr5ASA2ABKvqPc8reH/B8Yh05+w228MdP3OtUW
        D8I8UT+NjCH0hZdiPurVbasxyBpjlG4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-1fJvw1SjOFyClrL237OlEg-1; Tue, 07 Mar 2023 05:44:07 -0500
X-MC-Unique: 1fJvw1SjOFyClrL237OlEg-1
Received: by mail-wm1-f72.google.com with SMTP id x18-20020a1c7c12000000b003e1e7d3cf9fso8082546wmc.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Mar 2023 02:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678185846;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDXgYZBLxUfMsLcw1qS/eHbSsPTT2QidbprcFoL7C7U=;
        b=zqgrnC3FGHKITMrO8N4+d/V5ilhMyukGc/CnQwo5WJ0GR2ywh3G15JOpG9NZkNiN25
         ueKd6xitIwo49/HYqzP0t4BsM7A+N1XGIM+oZ+Gbs0op/SDR85UFSZmAnbZaI+FQ1EFv
         Af9mFSvL4E3us7yikigg1DatiU8XMuYj4/UfKULkMfzGexF0zcf8ZFMY2Kz/iStX5QHF
         pteOHOO7RmrnD/W+SczqcsPsNgQjI/BtPA+2hrrZfCecWrRbtmrW/BKXLyIkHGPAdPAZ
         19N8TPlPfI6snE975GqayAjg6Cdj2Sy44c7EphOaGKGHvm1k43DMV2vBZoo3aUpvGSB1
         +njw==
X-Gm-Message-State: AO0yUKV3+MQ0b4OecSjreeuiwIyrZrLJUT9xwbf6cIyljNaSeQSV39Xa
        cxBEQqQmHlrSR1a4cG6iQl12dTe7o7xb2atgx0onzy41s4gcSLg84UgYJHcDTh7aUnT7rBlZHKq
        hvTxVBWk+xfa+K5ZdPZid
X-Received: by 2002:a5d:624a:0:b0:2c8:42b5:8022 with SMTP id m10-20020a5d624a000000b002c842b58022mr6952075wrv.59.1678185845831;
        Tue, 07 Mar 2023 02:44:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8rPLXlJpSgekHE+458YNHtAM8ubtbpYEdRQYCtKzuI4JLsz2YQyUNjVRF4VCLQBPbLMtbcAg==
X-Received: by 2002:a5d:624a:0:b0:2c8:42b5:8022 with SMTP id m10-20020a5d624a000000b002c842b58022mr6952069wrv.59.1678185845517;
        Tue, 07 Mar 2023 02:44:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:a100:e20:41da:c49b:8974? (p200300cbc707a1000e2041dac49b8974.dip0.t-ipconnect.de. [2003:cb:c707:a100:e20:41da:c49b:8974])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002c7163660a9sm12202423wru.105.2023.03.07.02.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 02:44:05 -0800 (PST)
Message-ID: <f31108e7-c862-ace7-23b2-82ae9376ad38@redhat.com>
Date:   Tue, 7 Mar 2023 11:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 21/41] mm: Add guard pages around a shadow stack.
Content-Language: en-US
To:     Borislav Petkov <bp@alien8.de>,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "Eranian, Stephane" <eranian@google.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "fweimer@redhat.com" <fweimer@redhat.com>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "kcc@google.com" <kcc@google.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>, "oleg@redhat.com" <oleg@redhat.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "Schimpe, Christina" <christina.schimpe@intel.com>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "debug@rivosinc.com" <debug@rivosinc.com>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>
References: <20230227222957.24501-1-rick.p.edgecombe@intel.com>
 <20230227222957.24501-22-rick.p.edgecombe@intel.com>
 <ZAWfZcJLXUfNt1Fs@zn.tnic>
 <f91bbe94b51c0855da921a770685aa17c06c8beb.camel@intel.com>
 <20230307103251.GAZAcS0zpon573Ox3N@fat_crate.local>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230307103251.GAZAcS0zpon573Ox3N@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.03.23 11:32, Borislav Petkov wrote:
> On Tue, Mar 07, 2023 at 01:29:50AM +0000, Edgecombe, Rick P wrote:
>> On Mon, 2023-03-06 at 09:08 +0100, Borislav Petkov wrote:
>>> Just typos:
>>
>> All seem reasonable to me. Thanks.
>>
>> For using the log verbiage for the comment, it is quite big. Does
>> something like this seem reasonable?
> 
> Yeah, it does. I wouldn't want to lose that explanation in a commit
> message.
> 
> However, this special aspect pertains to the shstk implementation in x86
> but the code is generic mm and such arch-specific comments are kinda
> unfitting there.
> 
> I wonder if it would be better if you could stick that explanation
> somewhere in arch/x86/ and only refer to it in a short comment above
> VM_SHADOW_STACK check in stack_guard_start_gap()...

+1

-- 
Thanks,

David / dhildenb

