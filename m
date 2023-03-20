Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1BCC6FD1D
	for <linux-doc@archiver.kernel.org>; Mon, 20 Mar 2023 11:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjCTLGg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Mar 2023 07:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjCTLFy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Mar 2023 07:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DE82DE59
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679310007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YvwS21V87OZURkjfZ9iHLFx7wse477fWO8o7cVdC8zE=;
        b=MdRPEgE5VvQvfQcgZUUy4mNEkVBiMLnAep96N9EojmfFh2UIDUndOaBykFo9ReIQ7I2Kqm
        ZRaHnzv9W4C8TrQBzmd4xC0+l6j/ja/mqQvn00/NWr6b8c/l/TAhWIyDL1tKayk52rLMiP
        mXHUj2jk2g31Cu7YB7bGLbScBRY0uQ4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-TkcUlpndNk2OTLL6QrOnSQ-1; Mon, 20 Mar 2023 07:00:06 -0400
X-MC-Unique: TkcUlpndNk2OTLL6QrOnSQ-1
Received: by mail-wm1-f70.google.com with SMTP id k18-20020a05600c1c9200b003ed2a3f101fso8251350wms.9
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 04:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679310005;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvwS21V87OZURkjfZ9iHLFx7wse477fWO8o7cVdC8zE=;
        b=ON9bMAhk4oH0FOF52YwmjMckswnMKsBRa4q2tMcgOcozcdM3oHdZZL2K5QmVrD2rOI
         /kgj1S1jfVE86uISvZogjp5c/zVor8cppryATLbsbwjuHUma2xQjhqBOVIGTzF7nTvts
         n1t7ptQP0cnSBgcUj5pl/3XklzFL02x+s84G3D1GYPQKq5HGR4wuPRB3wjLiK6SnMExL
         Mp0rW6prJnHCFEBZV9IGiGBpp7+hQDD9Lhw9djhbD4T5QZpSs4gC7ItnHPwe9TuYSuIF
         8jxFdcNgGVPTKfS5B0U4FYfBBIWKj8peCCEgFSIetxT0Kit8jlP7KSLImjRk+FJsYi3u
         7H6g==
X-Gm-Message-State: AO0yUKVLYzuSegMMryDjCsW8Pqp0LOP8UHr/CrS+Iq7Xhv19o0igbrdD
        hsXbCpdIXTPDjDl47QgfcLEjSt8cizcNZdJckjDHwY24gmyADoGB8hEl84SJMiuPS1BiIwrA5Ew
        qVUi6xRIKzj1hHUE4vDMH
X-Received: by 2002:adf:fb01:0:b0:2ce:b7a1:c1a3 with SMTP id c1-20020adffb01000000b002ceb7a1c1a3mr13234752wrr.3.1679310005016;
        Mon, 20 Mar 2023 04:00:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Nm/AP50JtymPg9eFJ2hX8KoBE8+/Y4A7ha4GmGX4nlc3yTngMWY2fH+jF7oTeCP5yHiDIEA==
X-Received: by 2002:adf:fb01:0:b0:2ce:b7a1:c1a3 with SMTP id c1-20020adffb01000000b002ceb7a1c1a3mr13234726wrr.3.1679310004672;
        Mon, 20 Mar 2023 04:00:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id u8-20020adfdb88000000b002cff06039d7sm8616030wri.39.2023.03.20.04.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 04:00:04 -0700 (PDT)
Message-ID: <94d228b4-3d49-8cb0-a45c-3342c8b1da22@redhat.com>
Date:   Mon, 20 Mar 2023 12:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 26/40] mm: Warn on shadow stack memory in wrong vma
Content-Language: en-US
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        debug@rivosinc.com, szabolcs.nagy@arm.com
References: <20230319001535.23210-1-rick.p.edgecombe@intel.com>
 <20230319001535.23210-27-rick.p.edgecombe@intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230319001535.23210-27-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.03.23 01:15, Rick Edgecombe wrote:
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> One sharp edge is that PTEs that are both Write=0 and Dirty=1 are
> treated as shadow by the CPU, but this combination used to be created by
> the kernel on x86. Previous patches have changed the kernel to now avoid
> creating these PTEs unless they are for shadow stack memory. In case any
> missed corners of the kernel are still creating PTEs like this for
> non-shadow stack memory, and to catch any re-introductions of the logic,
> warn if any shadow stack PTEs (Write=0, Dirty=1) are found in non-shadow
> stack VMAs when they are being zapped. This won't catch transient cases
> but should have decent coverage. It will be compiled out when shadow
> stack is not configured.
> 
> In order to check if a PTE is shadow stack in core mm code, add two arch
> breakouts arch_check_zapped_pte/pmd(). This will allow shadow stack
> specific code to be kept in arch/x86.
> 
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Tested-by: Kees Cook <keescook@chromium.org>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

