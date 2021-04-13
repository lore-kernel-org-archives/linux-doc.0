Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7B0C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 22:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 285CB61246
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 22:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347355AbhDMWVh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 18:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55442 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347318AbhDMWVg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 18:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618352475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LmLvNrQZ8GZG6K7YchE+VPwW6vJz8AHYPWGljjVg6Kw=;
        b=KK5tUv0MqG+W/g0HavXFPq/daaCCmyrf379Ck9fM1fuzObLALtI+VsNw9eguixJxdtE86t
        DiZtmST7xlx8cTGtbROsWgNvUmrtOg2zJMtv1PIYOPaadHkGkMzged6TyxPuR8zMmfRYb1
        1iUwCh2Ty/DKyTzy/pPX4iUKAYV9f1U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-t1dgNC4cNlK3W7jaSXsqOg-1; Tue, 13 Apr 2021 18:21:11 -0400
X-MC-Unique: t1dgNC4cNlK3W7jaSXsqOg-1
Received: by mail-ed1-f72.google.com with SMTP id o4-20020a0564024384b0290378d45ecf57so2089761edc.12
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 15:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LmLvNrQZ8GZG6K7YchE+VPwW6vJz8AHYPWGljjVg6Kw=;
        b=s32HAVbaPij15xiCS5r4rLGIFJCJgijcdPa5AF3d7sfB3Nt4FAKIaW8rSfXN600PmV
         MI9bnUjeqKfRqHMfJUBRHkAKZuRx2rnYFQImFcM0d+CHzN0GRUTOQyhpkpcKuf2QqAK9
         KmMkNh7llEonvePK33ZWEZXOgQEZ/7ugjuuGtA1FPnJwLhYz48lL25iKVKEaju42W1Tc
         lQxt8rQ6UiWSPq2JjTwZqz8uwCNFoLulnCbT5VRJERywLIDPAzAwQX2h1avmcHxcnv8W
         cEe0sFpxyP5MAwd1ZbXZpL25MltAsWiXLC8Aaa+AWhbb3gzxcPHzTq4Cl9hH5FTpFr1w
         GvTA==
X-Gm-Message-State: AOAM532i4wiv5AXqNpxsJBe1Zto2w0jBnnQ7SWYqKOA1mW/sUIeJA/Ez
        yI6xQeP6TaCCz3zbwzn4tl4EfJvH/sU4fFmqw5lsrqGw0cZuyHuKtYa5DXVmj4YyCavvEpdTgfg
        dE0UesG/2+s8ltUk/dnh6
X-Received: by 2002:a17:906:2808:: with SMTP id r8mr25993276ejc.140.1618352466928;
        Tue, 13 Apr 2021 15:21:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweb6irLKjE2l7eiBtQPYc8fM3YXyt0Iw1UtOdvpJRu+d+KfeTlsGKirqaRu3/BrB0tlRN3oQ==
X-Received: by 2002:a17:906:2808:: with SMTP id r8mr25993256ejc.140.1618352466601;
        Tue, 13 Apr 2021 15:21:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id y21sm10123887edv.31.2021.04.13.15.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 15:21:06 -0700 (PDT)
Subject: Re: [PATCH] doc/virt/kvm: move KVM_X86_SET_MSR_FILTER in section 8
To:     Jonathan Corbet <corbet@lwn.net>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        linux-doc@vger.kernel.org
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210316170814.64286-1-eesposit@redhat.com>
 <87v98priev.fsf@meer.lwn.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d908ef69-72a0-80ea-4073-448f72a61560@redhat.com>
Date:   Wed, 14 Apr 2021 00:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87v98priev.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/04/21 23:20, Jonathan Corbet wrote:
> Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:
> 
>> KVM_X86_SET_MSR_FILTER is a capability, not an ioctl.
>> Therefore move it from section 4.97 to the new 8.31 (other capabilities).
>>
>> To fill the gap, move KVM_X86_SET_MSR_FILTER (was 4.126) to
>> 4.97, and shifted Xen-related ioctl (were 4.127 - 4.130) by
>> one place (4.126 - 4.129).
>>
>> Also fixed minor typo in KVM_GET_MSR_INDEX_LIST ioctl description
>> (section 4.3).
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   Documentation/virt/kvm/api.rst | 250 ++++++++++++++++-----------------
>>   1 file changed, 125 insertions(+), 125 deletions(-)
> 
> Paolo, what's your thought on this one?  If it's OK should I pick it up?

I missed the patch, I'll queue it up for 5.13.

Paolo

> Thanks,
> 
> jon
> 
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 1a2b5210cdbf..a230140d6a7f 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -201,7 +201,7 @@ Errors:
>>   
>>     ======     ============================================================
>>     EFAULT     the msr index list cannot be read from or written to
>> -  E2BIG      the msr index list is to be to fit in the array specified by
>> +  E2BIG      the msr index list is too big to fit in the array specified by
>>                the user.
>>     ======     ============================================================
>>   
>> @@ -3686,31 +3686,105 @@ which is the maximum number of possibly pending cpu-local interrupts.
>>   
>>   Queues an SMI on the thread's vcpu.
>>   
>> -4.97 KVM_CAP_PPC_MULTITCE
>> --------------------------
>> +4.97 KVM_X86_SET_MSR_FILTER
>> +----------------------------
>>   
>> -:Capability: KVM_CAP_PPC_MULTITCE
>> -:Architectures: ppc
>> -:Type: vm
>> +:Capability: KVM_X86_SET_MSR_FILTER
>> +:Architectures: x86
>> +:Type: vm ioctl
>> +:Parameters: struct kvm_msr_filter
>> +:Returns: 0 on success, < 0 on error
>>   
>> -This capability means the kernel is capable of handling hypercalls
>> -H_PUT_TCE_INDIRECT and H_STUFF_TCE without passing those into the user
>> -space. This significantly accelerates DMA operations for PPC KVM guests.
>> -User space should expect that its handlers for these hypercalls
>> -are not going to be called if user space previously registered LIOBN
>> -in KVM (via KVM_CREATE_SPAPR_TCE or similar calls).
>> +::
>>   
>> -In order to enable H_PUT_TCE_INDIRECT and H_STUFF_TCE use in the guest,
>> -user space might have to advertise it for the guest. For example,
>> -IBM pSeries (sPAPR) guest starts using them if "hcall-multi-tce" is
>> -present in the "ibm,hypertas-functions" device-tree property.
>> +  struct kvm_msr_filter_range {
>> +  #define KVM_MSR_FILTER_READ  (1 << 0)
>> +  #define KVM_MSR_FILTER_WRITE (1 << 1)
>> +	__u32 flags;
>> +	__u32 nmsrs; /* number of msrs in bitmap */
>> +	__u32 base;  /* MSR index the bitmap starts at */
>> +	__u8 *bitmap; /* a 1 bit allows the operations in flags, 0 denies */
>> +  };
>>   
>> -The hypercalls mentioned above may or may not be processed successfully
>> -in the kernel based fast path. If they can not be handled by the kernel,
>> -they will get passed on to user space. So user space still has to have
>> -an implementation for these despite the in kernel acceleration.
>> +  #define KVM_MSR_FILTER_MAX_RANGES 16
>> +  struct kvm_msr_filter {
>> +  #define KVM_MSR_FILTER_DEFAULT_ALLOW (0 << 0)
>> +  #define KVM_MSR_FILTER_DEFAULT_DENY  (1 << 0)
>> +	__u32 flags;
>> +	struct kvm_msr_filter_range ranges[KVM_MSR_FILTER_MAX_RANGES];
>> +  };
>>   
>> -This capability is always enabled.
>> +flags values for ``struct kvm_msr_filter_range``:
>> +
>> +``KVM_MSR_FILTER_READ``
>> +
>> +  Filter read accesses to MSRs using the given bitmap. A 0 in the bitmap
>> +  indicates that a read should immediately fail, while a 1 indicates that
>> +  a read for a particular MSR should be handled regardless of the default
>> +  filter action.
>> +
>> +``KVM_MSR_FILTER_WRITE``
>> +
>> +  Filter write accesses to MSRs using the given bitmap. A 0 in the bitmap
>> +  indicates that a write should immediately fail, while a 1 indicates that
>> +  a write for a particular MSR should be handled regardless of the default
>> +  filter action.
>> +
>> +``KVM_MSR_FILTER_READ | KVM_MSR_FILTER_WRITE``
>> +
>> +  Filter both read and write accesses to MSRs using the given bitmap. A 0
>> +  in the bitmap indicates that both reads and writes should immediately fail,
>> +  while a 1 indicates that reads and writes for a particular MSR are not
>> +  filtered by this range.
>> +
>> +flags values for ``struct kvm_msr_filter``:
>> +
>> +``KVM_MSR_FILTER_DEFAULT_ALLOW``
>> +
>> +  If no filter range matches an MSR index that is getting accessed, KVM will
>> +  fall back to allowing access to the MSR.
>> +
>> +``KVM_MSR_FILTER_DEFAULT_DENY``
>> +
>> +  If no filter range matches an MSR index that is getting accessed, KVM will
>> +  fall back to rejecting access to the MSR. In this mode, all MSRs that should
>> +  be processed by KVM need to explicitly be marked as allowed in the bitmaps.
>> +
>> +This ioctl allows user space to define up to 16 bitmaps of MSR ranges to
>> +specify whether a certain MSR access should be explicitly filtered for or not.
>> +
>> +If this ioctl has never been invoked, MSR accesses are not guarded and the
>> +default KVM in-kernel emulation behavior is fully preserved.
>> +
>> +Calling this ioctl with an empty set of ranges (all nmsrs == 0) disables MSR
>> +filtering. In that mode, ``KVM_MSR_FILTER_DEFAULT_DENY`` is invalid and causes
>> +an error.
>> +
>> +As soon as the filtering is in place, every MSR access is processed through
>> +the filtering except for accesses to the x2APIC MSRs (from 0x800 to 0x8ff);
>> +x2APIC MSRs are always allowed, independent of the ``default_allow`` setting,
>> +and their behavior depends on the ``X2APIC_ENABLE`` bit of the APIC base
>> +register.
>> +
>> +If a bit is within one of the defined ranges, read and write accesses are
>> +guarded by the bitmap's value for the MSR index if the kind of access
>> +is included in the ``struct kvm_msr_filter_range`` flags.  If no range
>> +cover this particular access, the behavior is determined by the flags
>> +field in the kvm_msr_filter struct: ``KVM_MSR_FILTER_DEFAULT_ALLOW``
>> +and ``KVM_MSR_FILTER_DEFAULT_DENY``.
>> +
>> +Each bitmap range specifies a range of MSRs to potentially allow access on.
>> +The range goes from MSR index [base .. base+nmsrs]. The flags field
>> +indicates whether reads, writes or both reads and writes are filtered
>> +by setting a 1 bit in the bitmap for the corresponding MSR index.
>> +
>> +If an MSR access is not permitted through the filtering, it generates a
>> +#GP inside the guest. When combined with KVM_CAP_X86_USER_SPACE_MSR, that
>> +allows user space to deflect and potentially handle various MSR accesses
>> +into user space.
>> +
>> +If a vCPU is in running state while this ioctl is invoked, the vCPU may
>> +experience inconsistent filtering behavior on MSR accesses.
>>   
>>   4.98 KVM_CREATE_SPAPR_TCE_64
>>   ----------------------------
>> @@ -4706,107 +4780,7 @@ KVM_PV_VM_VERIFY
>>     Verify the integrity of the unpacked image. Only if this succeeds,
>>     KVM is allowed to start protected VCPUs.
>>   
>> -4.126 KVM_X86_SET_MSR_FILTER
>> -----------------------------
>> -
>> -:Capability: KVM_X86_SET_MSR_FILTER
>> -:Architectures: x86
>> -:Type: vm ioctl
>> -:Parameters: struct kvm_msr_filter
>> -:Returns: 0 on success, < 0 on error
>> -
>> -::
>> -
>> -  struct kvm_msr_filter_range {
>> -  #define KVM_MSR_FILTER_READ  (1 << 0)
>> -  #define KVM_MSR_FILTER_WRITE (1 << 1)
>> -	__u32 flags;
>> -	__u32 nmsrs; /* number of msrs in bitmap */
>> -	__u32 base;  /* MSR index the bitmap starts at */
>> -	__u8 *bitmap; /* a 1 bit allows the operations in flags, 0 denies */
>> -  };
>> -
>> -  #define KVM_MSR_FILTER_MAX_RANGES 16
>> -  struct kvm_msr_filter {
>> -  #define KVM_MSR_FILTER_DEFAULT_ALLOW (0 << 0)
>> -  #define KVM_MSR_FILTER_DEFAULT_DENY  (1 << 0)
>> -	__u32 flags;
>> -	struct kvm_msr_filter_range ranges[KVM_MSR_FILTER_MAX_RANGES];
>> -  };
>> -
>> -flags values for ``struct kvm_msr_filter_range``:
>> -
>> -``KVM_MSR_FILTER_READ``
>> -
>> -  Filter read accesses to MSRs using the given bitmap. A 0 in the bitmap
>> -  indicates that a read should immediately fail, while a 1 indicates that
>> -  a read for a particular MSR should be handled regardless of the default
>> -  filter action.
>> -
>> -``KVM_MSR_FILTER_WRITE``
>> -
>> -  Filter write accesses to MSRs using the given bitmap. A 0 in the bitmap
>> -  indicates that a write should immediately fail, while a 1 indicates that
>> -  a write for a particular MSR should be handled regardless of the default
>> -  filter action.
>> -
>> -``KVM_MSR_FILTER_READ | KVM_MSR_FILTER_WRITE``
>> -
>> -  Filter both read and write accesses to MSRs using the given bitmap. A 0
>> -  in the bitmap indicates that both reads and writes should immediately fail,
>> -  while a 1 indicates that reads and writes for a particular MSR are not
>> -  filtered by this range.
>> -
>> -flags values for ``struct kvm_msr_filter``:
>> -
>> -``KVM_MSR_FILTER_DEFAULT_ALLOW``
>> -
>> -  If no filter range matches an MSR index that is getting accessed, KVM will
>> -  fall back to allowing access to the MSR.
>> -
>> -``KVM_MSR_FILTER_DEFAULT_DENY``
>> -
>> -  If no filter range matches an MSR index that is getting accessed, KVM will
>> -  fall back to rejecting access to the MSR. In this mode, all MSRs that should
>> -  be processed by KVM need to explicitly be marked as allowed in the bitmaps.
>> -
>> -This ioctl allows user space to define up to 16 bitmaps of MSR ranges to
>> -specify whether a certain MSR access should be explicitly filtered for or not.
>> -
>> -If this ioctl has never been invoked, MSR accesses are not guarded and the
>> -default KVM in-kernel emulation behavior is fully preserved.
>> -
>> -Calling this ioctl with an empty set of ranges (all nmsrs == 0) disables MSR
>> -filtering. In that mode, ``KVM_MSR_FILTER_DEFAULT_DENY`` is invalid and causes
>> -an error.
>> -
>> -As soon as the filtering is in place, every MSR access is processed through
>> -the filtering except for accesses to the x2APIC MSRs (from 0x800 to 0x8ff);
>> -x2APIC MSRs are always allowed, independent of the ``default_allow`` setting,
>> -and their behavior depends on the ``X2APIC_ENABLE`` bit of the APIC base
>> -register.
>> -
>> -If a bit is within one of the defined ranges, read and write accesses are
>> -guarded by the bitmap's value for the MSR index if the kind of access
>> -is included in the ``struct kvm_msr_filter_range`` flags.  If no range
>> -cover this particular access, the behavior is determined by the flags
>> -field in the kvm_msr_filter struct: ``KVM_MSR_FILTER_DEFAULT_ALLOW``
>> -and ``KVM_MSR_FILTER_DEFAULT_DENY``.
>> -
>> -Each bitmap range specifies a range of MSRs to potentially allow access on.
>> -The range goes from MSR index [base .. base+nmsrs]. The flags field
>> -indicates whether reads, writes or both reads and writes are filtered
>> -by setting a 1 bit in the bitmap for the corresponding MSR index.
>> -
>> -If an MSR access is not permitted through the filtering, it generates a
>> -#GP inside the guest. When combined with KVM_CAP_X86_USER_SPACE_MSR, that
>> -allows user space to deflect and potentially handle various MSR accesses
>> -into user space.
>> -
>> -If a vCPU is in running state while this ioctl is invoked, the vCPU may
>> -experience inconsistent filtering behavior on MSR accesses.
>> -
>> -4.127 KVM_XEN_HVM_SET_ATTR
>> +4.126 KVM_XEN_HVM_SET_ATTR
>>   --------------------------
>>   
>>   :Capability: KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_SHARED_INFO
>> @@ -4849,7 +4823,7 @@ KVM_XEN_ATTR_TYPE_SHARED_INFO
>>   KVM_XEN_ATTR_TYPE_UPCALL_VECTOR
>>     Sets the exception vector used to deliver Xen event channel upcalls.
>>   
>> -4.128 KVM_XEN_HVM_GET_ATTR
>> +4.127 KVM_XEN_HVM_GET_ATTR
>>   --------------------------
>>   
>>   :Capability: KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_SHARED_INFO
>> @@ -4861,7 +4835,7 @@ KVM_XEN_ATTR_TYPE_UPCALL_VECTOR
>>   Allows Xen VM attributes to be read. For the structure and types,
>>   see KVM_XEN_HVM_SET_ATTR above.
>>   
>> -4.129 KVM_XEN_VCPU_SET_ATTR
>> +4.128 KVM_XEN_VCPU_SET_ATTR
>>   ---------------------------
>>   
>>   :Capability: KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_SHARED_INFO
>> @@ -4923,7 +4897,7 @@ KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADJUST
>>     or RUNSTATE_offline) to set the current accounted state as of the
>>     adjusted state_entry_time.
>>   
>> -4.130 KVM_XEN_VCPU_GET_ATTR
>> +4.129 KVM_XEN_VCPU_GET_ATTR
>>   ---------------------------
>>   
>>   :Capability: KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_SHARED_INFO
>> @@ -6721,3 +6695,29 @@ vcpu_info is set.
>>   The KVM_XEN_HVM_CONFIG_RUNSTATE flag indicates that the runstate-related
>>   features KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR/_CURRENT/_DATA/_ADJUST are
>>   supported by the KVM_XEN_VCPU_SET_ATTR/KVM_XEN_VCPU_GET_ATTR ioctls.
>> +
>> +8.31 KVM_CAP_PPC_MULTITCE
>> +-------------------------
>> +
>> +:Capability: KVM_CAP_PPC_MULTITCE
>> +:Architectures: ppc
>> +:Type: vm
>> +
>> +This capability means the kernel is capable of handling hypercalls
>> +H_PUT_TCE_INDIRECT and H_STUFF_TCE without passing those into the user
>> +space. This significantly accelerates DMA operations for PPC KVM guests.
>> +User space should expect that its handlers for these hypercalls
>> +are not going to be called if user space previously registered LIOBN
>> +in KVM (via KVM_CREATE_SPAPR_TCE or similar calls).
>> +
>> +In order to enable H_PUT_TCE_INDIRECT and H_STUFF_TCE use in the guest,
>> +user space might have to advertise it for the guest. For example,
>> +IBM pSeries (sPAPR) guest starts using them if "hcall-multi-tce" is
>> +present in the "ibm,hypertas-functions" device-tree property.
>> +
>> +The hypercalls mentioned above may or may not be processed successfully
>> +in the kernel based fast path. If they can not be handled by the kernel,
>> +they will get passed on to user space. So user space still has to have
>> +an implementation for these despite the in kernel acceleration.
>> +
>> +This capability is always enabled.
>> \ No newline at end of file
>> -- 
>> 2.29.2
> 

