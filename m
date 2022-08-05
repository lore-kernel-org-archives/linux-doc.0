Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0FBC25B0C
	for <linux-doc@archiver.kernel.org>; Fri,  5 Aug 2022 18:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbiHESGN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Aug 2022 14:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238133AbiHESGK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Aug 2022 14:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F32A75395
        for <linux-doc@vger.kernel.org>; Fri,  5 Aug 2022 11:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659722768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gTG5sYKz5wYWpj0OuPtAuT0vzoUTMIRW2UW4E5SQLSQ=;
        b=EqtatFDulK1RwYEUXVMucgeZtcmVXqtT8a4mf7nysaZnENR/B78tcR/PjnyTpZs7euqc4r
        /xsrR39d50VVRXAPVuQ+Fry6vuDwWyRKOM9Nc8HfsLjvPZQjxweQffVfEiqPz5dhr2xZqE
        oFEPcIKVnFDX4tLmD5mv3ASVCl9MFrw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-4E98ll57MIe9Biz7anmcIQ-1; Fri, 05 Aug 2022 14:06:07 -0400
X-MC-Unique: 4E98ll57MIe9Biz7anmcIQ-1
Received: by mail-wm1-f70.google.com with SMTP id n30-20020a05600c501e00b003a3264465ebso3575675wmr.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Aug 2022 11:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=gTG5sYKz5wYWpj0OuPtAuT0vzoUTMIRW2UW4E5SQLSQ=;
        b=ugs4QNpjrL16k7jjnnlLrxkxPTHptfQolKR4ia8GonN7CscxTXoTt4/Mg0D1mgel1+
         QOVjKbYv1pbB9HslhjY7+63C/7OfC2u0u6OTEwzv3lWKAGSH/XJjl5bpTO58g5VdYXWY
         LH7nw/ZJpUJahs9gSWeMXC3TqwnW1mxnXA7A8NrEBIaWt7MECccwGUxjw3iJWZ7/Umv/
         maryZyyuVWR/GfHl2qwkqJNsgkcra8hKhAKuE7MwkreUGonNPBUoYVsLKGoMf204kvpw
         doG9NQDyIAwMLUJ5sbFdI/xF/BLWSAVB5ARBDfu2oPdPPwOCqRsNsSj3Se0BEd2wwX2E
         iuvQ==
X-Gm-Message-State: ACgBeo3+h4H4SE4dqY25EXAff927txnukCDfaqomFr/pLKneITlA2qIR
        Nh4NVZfeIwnBuxBT927z1aDMn6tMbRm8odzb9mM96Gr2ePb11GD+rTcU0GRI1OF7SAeZK0QwQeA
        L/WKofJFEPkWGPvH01uHF
X-Received: by 2002:a05:6000:811:b0:220:6262:ac66 with SMTP id bt17-20020a056000081100b002206262ac66mr4741233wrb.529.1659722765760;
        Fri, 05 Aug 2022 11:06:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4YiYJd4RGqr8HPcVnnEu37Kzz2xizPBJ/DFAoYEPdnVgyVJMfvEXwBl3Yrl6juKrdXAyBEpQ==
X-Received: by 2002:a05:6000:811:b0:220:6262:ac66 with SMTP id bt17-20020a056000081100b002206262ac66mr4741186wrb.529.1659722765470;
        Fri, 05 Aug 2022 11:06:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52? (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de. [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b003a31b79dc0esm26070221wmq.1.2022.08.05.11.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 11:06:05 -0700 (PDT)
Message-ID: <a2b8fa73-4efd-426f-abcd-7975ff9a7101@redhat.com>
Date:   Fri, 5 Aug 2022 20:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Content-Language: en-US
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
        linux-kselftest@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
        dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05.08.22 19:55, Paolo Bonzini wrote:
> On 7/21/22 11:44, David Hildenbrand wrote:
>>
>> Also, I*think*  you can place pages via userfaultfd into shmem. Not
>> sure if that would count "auto alloc", but it would certainly bypass
>> fallocate().
> 
> Yeah, userfaultfd_register would probably have to forbid this for 
> F_SEAL_AUTO_ALLOCATE vmas.  Maybe the memfile_node can be reused for 
> this, adding a new MEMFILE_F_NO_AUTO_ALLOCATE flags?  Then 
> userfault_register would do something like 
> memfile_node_get_flags(vma->vm_file) and check the result.

An alternative is to simply have the shmem allocation fail in a similar
way. Maybe it does already, I haven't checked (don't think so).


-- 
Thanks,

David / dhildenb

