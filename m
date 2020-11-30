Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A4EC71155
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:55:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F23D620789
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:55:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W62WWk1n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbgK3RzP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:55:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45139 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726770AbgK3RzO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 12:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606758828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gi4Rht/ELTnFAZIunHo+toOTUWTBXEGXm5AWopX3S1M=;
        b=W62WWk1nFL06H8WfpvwDAkAaE61mXJcvFTHqHY/Cm9mvhQvNHNvm0QGmL4EvxFQiN84BPV
        G3L37cTJFHDtlHZWyHJoHnOgD0VkQ85F/eY1ieNRYzMPtdoDl5Ve6ne3gP9+bCdU8TZRLO
        fA+DOI9MvlVFevBbERTSBB9UxnH6McY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-3CqJ5speNYee_2ossWV-NA-1; Mon, 30 Nov 2020 12:53:45 -0500
X-MC-Unique: 3CqJ5speNYee_2ossWV-NA-1
Received: by mail-ed1-f69.google.com with SMTP id dc6so4970594edb.14
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 09:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gi4Rht/ELTnFAZIunHo+toOTUWTBXEGXm5AWopX3S1M=;
        b=sJ6J1EKJiOQQWc2fLZVINKDAEgL2UDPsF4mARibLofKJmVB0vEOXv+LpIoRRTs2dRK
         qcQKAR6S8DG/8KCOplk2lbmpfDrpgboOpseiHbSqAkif8JV1HpoTgixWybT5ZPO7Drdz
         IbsKp7ReK5Mo7A7hlEW/ScWadXhxAAm78vJgd7vGM4imBQoFGmECZqdBoRr335CGY7bz
         pVaAe4EMmmAmbvHDnq5bb8w+7YaemJ8Oi6aL2GyTmPdwBM2e7BxUzHYExpPd4o51eOm/
         uYxdVgHIn9g1EaqHWXjVjRJgFyKFdMLlTNy0rLRrnSwnnWYzswN+vpVjQMslSBIHLZmp
         4d1w==
X-Gm-Message-State: AOAM532d6ThegbCivP+JdctGBQx4iUtMxYjiBezu8Pwiyb5LqtN8448O
        TRV9an71oPuJPZZtVoSmn9gk40PZ4l4+xcnSFx4pgcc8SCLNfs8n7YGST34gk791AtGCx7lg6kb
        N5g1FcHPxV0i/PnPbaIm9eb6EtL+Szd9AH4/rrpHDVirttD41DAph3/ZmgDQv7TE21l/f1rTp
X-Received: by 2002:a17:907:d01:: with SMTP id gn1mr22075308ejc.357.1606758823839;
        Mon, 30 Nov 2020 09:53:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPXCLLq0F7NsxdGneoiL0swBKFgNHMjS0gZzWEdxb5xTK81UZfS/uvqb99Yq+sqLin3REwrQ==
X-Received: by 2002:a17:907:d01:: with SMTP id gn1mr22075268ejc.357.1606758823492;
        Mon, 30 Nov 2020 09:53:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m2sm6847080edf.27.2020.11.30.09.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 09:53:42 -0800 (PST)
Subject: Re: [PATCH] kvm/x86/mmu: use the correct inherited permissions to get
 shadow page
To:     Sean Christopherson <seanjc@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Lai Jiangshan <laijs@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Avi Kivity <avi@qumranet.com>, linux-doc@vger.kernel.org
References: <20201120095517.19211-1-jiangshanlai@gmail.com>
 <20201126000549.GC450871@google.com>
 <0724aeb9-3466-5505-8f12-a5899144e68f@redhat.com>
 <CAJhGHyApvmQk4bxxK2rJKzyAShFSXyEb2W0qyFcVoUEcsMKs_w@mail.gmail.com>
 <X8Uux62rJdf2feJ2@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a9d3517-7bcc-723a-5ec5-80018d0850d7@redhat.com>
Date:   Mon, 30 Nov 2020 18:53:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X8Uux62rJdf2feJ2@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/11/20 18:41, Sean Christopherson wrote:
>>
>> pmd1 and pmd2 point to the same pte table, so:
>> ptr1 and ptr3 points to the same page.
>> ptr2 and ptr4 points to the same page.
>>
>>    The guess read-accesses to ptr1 first. So the hypervisor gets the
>> shadow pte page table with role.access=u-- among other things.
>>     (Note the shadowed pmd1's access is uwx)
>>
>>    And then the guest write-accesses to ptr2, and the hypervisor
>> set up shadow page for ptr2.
>>     (Note the hypervisor silencely accepts the role.access=u--
>>      shadow pte page table in FNAME(fetch))
>>
>>    After that, the guess read-accesses to ptr3, the hypervisor
>> reused the same shadow pte page table as above.
>>
>>    At last, the guest writes to ptr4 without vmexit nor pagefault,
>> Which should cause vmexit as the guest expects.
>
> Hmm, yes, KVM would incorrectly handle this scenario.  But, the proposed patch
> would not address the issue as KVM always maps non-leaf shadow pages with full
> access permissions.

Can we have a testcase in kvm-unit-tests?  It's okay of course if it 
only fails with ept=0.

Paolo

