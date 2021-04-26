Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBAFC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 13:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03BBC6135A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 13:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhDZN31 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 09:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60239 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230250AbhDZN31 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 09:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619443725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0w6s9JA5RI0isSgkR+9N2p6gh0AphGNhzBqN3GnUkgk=;
        b=ZxEL3uDCP4XY2kBOHuJa1g1RLzGVLdHBmzpmDg3b9YJkyjrgOe3BKchnOgMmOyZ1Vce/6w
        Uivr1t3/52oejcmWuRqVmKXCwHlqehHymVJWtNVfGjVRzHnWgSychWw+rkWgxsDUwMCQsQ
        VIbBS6/1gIFfyCcNnz0CMKOdiu96N0Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-4pdVgbJAPBK1ZBjJZDafQg-1; Mon, 26 Apr 2021 09:28:43 -0400
X-MC-Unique: 4pdVgbJAPBK1ZBjJZDafQg-1
Received: by mail-ej1-f70.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so10184162ejz.5
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 06:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0w6s9JA5RI0isSgkR+9N2p6gh0AphGNhzBqN3GnUkgk=;
        b=WTaohIMaoV3Wrsa0RvahGeHhpPzhhbQudNWoSnITQzFPbkhTjF9C+Uxnv9Hxbq2onw
         +PJFsr4AW8CZ6jZ5Q1zDu8e5JsAOtmEvk3ez1MlTd01s/FrWzUg7GkRWRkAuT68KA7ZP
         eP04qB27ygk0afcezV0STzPmtKJOhP98ICmfiuAuA+FgM7dOyl0lokBQ2d5KQ7llKBv8
         hJnvqzX978exyAwxHXT8KPTnDoLhs0kilEeVGewftTzdFTTsL/cckD9Uoe9RjuoqXyNF
         YRVKCyy6eQVZTcoPMPgHLHsa/nNQVdproocaBxIqrC9I22Njctgs81WVUjs5VJQ8bPH8
         3hsA==
X-Gm-Message-State: AOAM532OOIpMskEoiiBNZYI8FUFCaJvehFlz128ngnkn10G2suV/1Vu1
        xSXruWMgo4XKAEhwNZoNJoqbNDFVWZnKL8z7JKKtl50PyG2HWiTZlv2xZCe7l67Q0OCQseExmDg
        3wSsu4djXd1E5TXsp84js
X-Received: by 2002:a17:906:6d12:: with SMTP id m18mr18622113ejr.435.1619443722513;
        Mon, 26 Apr 2021 06:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTAoew1cy3xv0PXLFesxN7tVtkXGTKdLFUD1tKu7GQzZWvKsNtpzG29ZVwDbpmC/gjb8duKw==
X-Received: by 2002:a17:906:6d12:: with SMTP id m18mr18622054ejr.435.1619443721952;
        Mon, 26 Apr 2021 06:28:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id q25sm14448253edt.51.2021.04.26.06.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 06:28:41 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] KVM: x86: Introduce KVM_GET_SREGS2 /
 KVM_SET_SREGS2
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20210426111333.967729-1-mlevitsk@redhat.com>
 <20210426111333.967729-5-mlevitsk@redhat.com>
 <898a9b18-4578-cb9d-ece7-f45ba5b7bb89@redhat.com>
 <eeaa6c0f6efef926eb606b354052aba8cfef2c21.camel@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <05161b6e-6d85-be14-9e30-e61cb742f6d0@redhat.com>
Date:   Mon, 26 Apr 2021 15:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eeaa6c0f6efef926eb606b354052aba8cfef2c21.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26/04/21 14:56, Maxim Levitsky wrote:
> On Mon, 2021-04-26 at 14:32 +0200, Paolo Bonzini wrote:
>> On 26/04/21 13:13, Maxim Levitsky wrote:
>>> +	if (sregs2->flags & KVM_SREGS2_FLAGS_PDPTRS_VALID) {
>>> +
>>> +		if (!is_pae_paging(vcpu))
>>> +			return -EINVAL;
>>> +
>>> +		for (i = 0 ; i < 4 ; i++)
>>> +			kvm_pdptr_write(vcpu, i, sregs2->pdptrs[i]);
>>> +
>>> +		kvm_register_mark_dirty(vcpu, VCPU_EXREG_PDPTR);
>>> +		mmu_reset_needed = 1;
>>> +	}
>>
>> I think this should also have
>>
>> 	else {
>> 		if (is_pae_paging(vcpu))
>> 			return -EINVAL;
>> 	}
> 
> 
> What about the case when we migrate from qemu that doesn't use
> this ioctl to qemu that does?

Right, that makes sense but then the "else" branch should do the same as 
KVM_SET_SREGS.  Maybe add a "load_pdptrs" bool to __set_sregs_common?

Paolo

