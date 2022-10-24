Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69664C38A2D
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 07:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiJXHtr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 03:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiJXHtp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 03:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D785F614A
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666597780;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hTXcuxXaRWJo+QWiUsGFLWlPsijUBF5y61S7CoQKJ+g=;
        b=P/hjjeOi+aikjK9t9s5eeSxFt2uhLkebDA2zIY8yqyAXlZnwbwq82yilOrEPmJD5aXQOOE
        EEG3i3BAj/u94JLsLer1Ci51dtih+/A5TDCf5avM59OFkgHHKJDIIMBlGLqDK/MG8yfxJi
        ckS4BK4WNMlpE+q63KXvNTR0Q/lVX4A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-S8ZJuYCAPJaUM-uWEABwPg-1; Mon, 24 Oct 2022 03:49:38 -0400
X-MC-Unique: S8ZJuYCAPJaUM-uWEABwPg-1
Received: by mail-qv1-f70.google.com with SMTP id mo15-20020a056214330f00b004b96d712bccso4847653qvb.22
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 00:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTXcuxXaRWJo+QWiUsGFLWlPsijUBF5y61S7CoQKJ+g=;
        b=PiUcCYXlKs/E3mFP1QjvM8LAYGtV6ADwdHsXf88XfbpNWOUuQ5ZfYeMfkoMRY4LQu6
         m4u/HK0WPeEBa8423TFnsoD2HitxT1+Mvh0B3/nI5H2teFT/aOeqNw5vfJ5eS8gwQs+h
         02kfNUX2duQzhfGZuhn6uUcq0tYxiV3gpJnUenV7dU/J1awGddNKiVLfW7s8WmDXMTM6
         ykT6LpupmKM2/vO16i3zGn3R9DPQuopDXrAtT4GsvJoRT7pRUKJUZnmmTmB3PiYUe2I9
         EDF3nX4+5RNfkP8FdrQFtcZPza+y8MuLm3CsXGaI8UIn1XSkTiPELe86H2FCJwyJ+LYq
         xD1A==
X-Gm-Message-State: ACrzQf0PLXJSjt2pUO7nZ5HehBIEwisDQneRFmNVy1d3CRF/rzfwGP6Q
        ZPV/K/NgiQcSgAw1FDZzm1us/PuBxXDAh4JrVF7FnwyRkbcvFAVCEu77rVqDMnTlBYhRndHaoWB
        NbLEXW3Iv++MixDYhofUi
X-Received: by 2002:a05:622a:4cc:b0:39c:bfb1:8a45 with SMTP id q12-20020a05622a04cc00b0039cbfb18a45mr26104977qtx.647.1666597777842;
        Mon, 24 Oct 2022 00:49:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42uYz07Bby0ZO6+SEobL92Tz9k1kX6G3Tj2qNlGA0BZtOZOgF7K5QRbwlEvLDlM/ObENXC/A==
X-Received: by 2002:a05:622a:4cc:b0:39c:bfb1:8a45 with SMTP id q12-20020a05622a04cc00b0039cbfb18a45mr26104970qtx.647.1666597777593;
        Mon, 24 Oct 2022 00:49:37 -0700 (PDT)
Received: from [192.168.149.123] (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
        by smtp.gmail.com with ESMTPSA id bm2-20020a05620a198200b006ce7d9dea7asm14815613qkb.13.2022.10.24.00.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 00:49:36 -0700 (PDT)
Message-ID: <2bd40960-e65e-db2b-ae8f-1109cb9f3fa0@redhat.com>
Date:   Mon, 24 Oct 2022 09:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] KVM: use signals to abort enter_guest/blocking and
 retry
Content-Language: en-US
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221022154819.1823133-1-eesposit@redhat.com>
 <20221022154819.1823133-5-eesposit@redhat.com>
 <5ee4eeb8-4d61-06fc-f80d-06efeeffe902@redhat.com>
 <4ef882c2-1535-d7df-d474-e5fab2975f53@redhat.com>
In-Reply-To: <4ef882c2-1535-d7df-d474-e5fab2975f53@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Am 24/10/2022 um 09:43 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 23/10/2022 um 19:48 schrieb Paolo Bonzini:
>> On 10/22/22 17:48, Emanuele Giuseppe Esposito wrote:
>>> Once a vcpu exectues KVM_RUN, it could enter two states:
>>> enter guest mode, or block/halt.
>>> Use a signal to allow a vcpu to exit the guest state or unblock,
>>> so that it can exit KVM_RUN and release the read semaphore,
>>> allowing a pending KVM_KICK_ALL_RUNNING_VCPUS to continue.
>>>
>>> Note that the signal is not deleted and used to propagate the
>>> exit reason till vcpu_run(). It will be clearead only by
>>> KVM_RESUME_ALL_KICKED_VCPUS. This allows the vcpu to keep try
>>> entering KVM_RUN and perform again all checks done in
>>> kvm_arch_vcpu_ioctl_run() before entering the guest state,
>>> where it will return again if the request is still set.
>>>
>>> However, the userspace hypervisor should also try to avoid
>>> continuously calling KVM_RUN after invoking KVM_KICK_ALL_RUNNING_VCPUS,
>>> because such call will just translate in a back-to-back down_read()
>>> and up_read() (thanks to the signal).
>>
>> Since the userspace should anyway avoid going into this effectively-busy
>> wait, what about clearing the request after the first exit?  The
>> cancellation ioctl can be kept for vCPUs that are never entered after
>> KVM_KICK_ALL_RUNNING_VCPUS.  Alternatively, kvm_clear_all_cpus_request
>> could be done right before up_write().
> 
> Clearing makes sense, but should we "trust" the userspace not to go into
> busy wait?

Actually since this change is just a s/test/check, I would rather keep
test. If userspace does things wrong, this mechanism would still work
properly.

> What's the typical "contract" between KVM and the userspace? Meaning,
> should we cover the basic usage mistakes like forgetting to busy wait on
> KVM_RUN?
> 
> If we don't, I can add a comment when clearing and of course also
> mention it in the API documentation (that I forgot to update, sorry :D)
> 
> Emanuele
> 
>>
>> Paolo
>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   arch/x86/include/asm/kvm_host.h |  2 ++
>>>   arch/x86/kvm/x86.c              |  8 ++++++++
>>>   virt/kvm/kvm_main.c             | 21 +++++++++++++++++++++
>>>   3 files changed, 31 insertions(+)
>>>
>>> diff --git a/arch/x86/include/asm/kvm_host.h
>>> b/arch/x86/include/asm/kvm_host.h
>>> index aa381ab69a19..d5c37f344d65 100644
>>> --- a/arch/x86/include/asm/kvm_host.h
>>> +++ b/arch/x86/include/asm/kvm_host.h
>>> @@ -108,6 +108,8 @@
>>>       KVM_ARCH_REQ_FLAGS(30, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
>>>   #define KVM_REQ_MMU_FREE_OBSOLETE_ROOTS \
>>>       KVM_ARCH_REQ_FLAGS(31, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
>>> +#define KVM_REQ_USERSPACE_KICK        \
>>> +    KVM_ARCH_REQ_FLAGS(32, KVM_REQUEST_WAIT)
>>>     #define
>>> CR0_RESERVED_BITS                                               \
>>>       (~(unsigned long)(X86_CR0_PE | X86_CR0_MP | X86_CR0_EM |
>>> X86_CR0_TS \
>>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>>> index b0c47b41c264..2af5f427b4e9 100644
>>> --- a/arch/x86/kvm/x86.c
>>> +++ b/arch/x86/kvm/x86.c
>>> @@ -10270,6 +10270,10 @@ static int vcpu_enter_guest(struct kvm_vcpu
>>> *vcpu)
>>>       }
>>>         if (kvm_request_pending(vcpu)) {
>>> +        if (kvm_test_request(KVM_REQ_USERSPACE_KICK, vcpu)) {
>>> +            r = -EINTR;
>>> +            goto out;
>>> +        }
>>>           if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu)) {
>>>               r = -EIO;
>>>               goto out;
>>> @@ -10701,6 +10705,10 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>>>               r = vcpu_block(vcpu);
>>>           }
>>>   +        /* vcpu exited guest/unblocked because of this request */
>>> +        if (kvm_test_request(KVM_REQ_USERSPACE_KICK, vcpu))
>>> +            return -EINTR;
>>> +
>>>           if (r <= 0)
>>>               break;
>>>   diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>>> index ae0240928a4a..13fa7229b85d 100644
>>> --- a/virt/kvm/kvm_main.c
>>> +++ b/virt/kvm/kvm_main.c
>>> @@ -3431,6 +3431,8 @@ static int kvm_vcpu_check_block(struct kvm_vcpu
>>> *vcpu)
>>>           goto out;
>>>       if (kvm_check_request(KVM_REQ_UNBLOCK, vcpu))
>>>           goto out;
>>> +    if (kvm_test_request(KVM_REQ_USERSPACE_KICK, vcpu))
>>> +        goto out;
>>>         ret = 0;
>>>   out:
>>> @@ -4668,6 +4670,25 @@ static long kvm_vm_ioctl(struct file *filp,
>>>           r = kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
>>>           break;
>>>       }
>>> +    case KVM_KICK_ALL_RUNNING_VCPUS: {
>>> +        /*
>>> +         * Notify all running vcpus that they have to stop.
>>> +         * Caught in kvm_arch_vcpu_ioctl_run()
>>> +         */
>>> +        kvm_make_all_cpus_request(kvm, KVM_REQ_USERSPACE_KICK);
>>> +
>>> +        /*
>>> +         * Use wr semaphore to wait for all vcpus to exit from KVM_RUN.
>>> +         */
>>> +        down_write(&memory_transaction);
>>> +        up_write(&memory_transaction);
>>> +        break;
>>> +    }
>>> +    case KVM_RESUME_ALL_KICKED_VCPUS: {
>>> +        /* Remove all requests sent with KVM_KICK_ALL_RUNNING_VCPUS */
>>> +        kvm_clear_all_cpus_request(kvm, KVM_REQ_USERSPACE_KICK);
>>> +        break;
>>> +    }
>>>       case KVM_SET_USER_MEMORY_REGION: {
>>>           struct kvm_userspace_memory_region kvm_userspace_mem;
>>>   
>>

