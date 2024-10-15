Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397421CCB55
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980311; cv=none; b=GkNcr1B8U6M6CXW3CqXg8lWS6JOOBGfcFAzqOd0GdYI77c98nF20lKcyQibWWg2z227GXtp6hRScpa5vSTwJ7odVz4PQ4ihVgc8HZrnQClOMgPfxT05c+8NDGlkPf9ST3Q0ocCJBe7B72wcQwzhBnExKLmbF3nRkALHCf3tfbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980311; c=relaxed/simple;
	bh=ZvCjhxA9HJtkjiVT2jrS8KFmWhTXeVw6tlAsxhIikfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UzRBjlJ0oFmpAVOyaGOOwo+0NfHPxgJxVvvZzg7h3LRqN8gzPfxNHMJ30tghi/fxrlnIuQyR/QvD4o+Kle2wMPL9CQ0Hd0YHS+cizgaSww9em4dFFVvg+yhtI0pRlSgqOCMPrqYWgSOZnQM6lIM7tyzYnCgpf5eRBXY7rxi8oj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PlN0vY5d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PlN0vY5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728980309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSzugHJUE0V5VnxcNgtSlLmUlo3tP8MuSc6Q2lgQWPQ=;
	b=PlN0vY5d2rAcP6oz79QGB/0TZVvSgpdjthV6FyUha+MluFABcaXkj4pJTgEsPyPzx/NqBf
	WGQ3zARVmIwWLthZqiDto2nfdty6JdXSABwhlNfPi2aXw3mjeoNtU3sWpvLD2mhqUbveWt
	5RQDnUpHthwhi2lJ5Nq0jH//a+fk69Q=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-M2NVFvjENcakLPTw-_bsyQ-1; Tue, 15 Oct 2024 04:18:27 -0400
X-MC-Unique: M2NVFvjENcakLPTw-_bsyQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2fb3da343ceso16663981fa.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 01:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980306; x=1729585106;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSzugHJUE0V5VnxcNgtSlLmUlo3tP8MuSc6Q2lgQWPQ=;
        b=hdn4pUqHpnetc2enbwAlk/AmqpOpp04zC6u/0zNvVMcP1OOEcamOTn6rbhj8tgIIG6
         lqgCRdRdj9lD6WsUIxI+27ag7QSShRzuUXhP+MSx8Dw3U7e9uZXaGk/IjGu3ffpvseZq
         JCYafL/fVC47CBEI43Nwi+hAUnYfP0jbNTZvmAxIrg4fNVt1jbRsWgp4Q073YJ1o55T8
         OPWNZPLKxmLAU3ddHhuH/Vh26Kp8IJkXOoz1J5pan3WhMgbEHW59gjo1ppDB0519LFWU
         vaTtHdpIpZ09C84hJ7+fqjUit0lUw8PuCr8B4PMg8jxd2bAgOUiv9lW1vsighQY8vLL6
         5RIg==
X-Forwarded-Encrypted: i=1; AJvYcCUqg6yJ/QjWEfmlEItZ2zMyufQbXB0hZ+Q1z7M1GXYoakK568WlC5n1RPdA//tkvtTL+vo+qj38cYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdt+5EFmm3UcJCk5OXZl3u4eIxWtHuFsIBqEeiVoeRE+6BmWc
	WLC7oWMMguwPRFMVb+PTo155zWw7dhxns9S9INlToTMO4Z2FYw4pLoNg4BM6qMtPxqcErfFHDTP
	cC2WoLyUANv6QWG+f+7sWAT1FYHmZhOUTBZ9l/vgSRsZZsNi1TyAZhFH3Sg==
X-Received: by 2002:a05:6512:110c:b0:539:e65a:8a71 with SMTP id 2adb3069b0e04-539e65a8c28mr4531972e87.34.1728980305704;
        Tue, 15 Oct 2024 01:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM8egqE9jF4dTVTryZ5qbA3smtlVhU0CSpeShuRlF/pW2Bor/bfD2IwVw3AXprpgQ+VaOz1g==
X-Received: by 2002:a05:6512:110c:b0:539:e65a:8a71 with SMTP id 2adb3069b0e04-539e65a8c28mr4531938e87.34.1728980305162;
        Tue, 15 Oct 2024 01:18:25 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2981765esm40175766b.129.2024.10.15.01.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 01:18:24 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Nikolas Wipper <nik.wipper@gmx.de>, Nikolas Wipper <nikwip@amazon.de>
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>, Alexander Graf
 <graf@amazon.de>, James Gowans <jgowans@amazon.com>,
 nh-open-source@amazon.com, Sean Christopherson <seanjc@google.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/7] KVM: x86: Implement Hyper-V's vCPU suspended state
In-Reply-To: <9ef935db-459a-4738-ab9a-4bd08828cb60@gmx.de>
References: <20241004140810.34231-1-nikwip@amazon.de>
 <20241004140810.34231-3-nikwip@amazon.de> <875xq0gws8.fsf@redhat.com>
 <9ef935db-459a-4738-ab9a-4bd08828cb60@gmx.de>
Date: Tue, 15 Oct 2024 10:18:23 +0200
Message-ID: <87h69dg4og.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nikolas Wipper <nik.wipper@gmx.de> writes:

> On 10.10.24 10:57, Vitaly Kuznetsov wrote:

...

>>>  int kvm_hv_vcpu_flush_tlb(struct kvm_vcpu *vcpu);
>>> +
>>> +static inline bool kvm_hv_vcpu_suspended(struct kvm_vcpu *vcpu)
>>> +{
>>> +	return vcpu->arch.hyperv_enabled &&
>>> +	       READ_ONCE(vcpu->arch.hyperv->suspended);
>>
>> I don't think READ_ONCE() means anything here, does it?
>>
>
> It does prevent compiler optimisations and is actually required[1]. Also
> it makes clear that this variable is shared, and may be accessed from
> remote CPUs.
>
> [1] https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0124r6.html#Variable%20Access

It certainly does no harm but I think if we follow 'Loads from and
stores to shared (but non-atomic) variables should be protected with the
READ_ONCE(), WRITE_ONCE()' rule literally we will need to sprinkle them
all over KVM/kernel ;-) And personally, this makes reading the code
harder.

To my (very limited) knowledge, we really need READ_ONCE()s when we need
to have some sort of a serialization, e.g. the moment when this read
happens actually makes a difference. If we can e.g. use a local variable
in the beginning of a function and replace all READ_ONCE()s with
reading this local variable -- then we don't need READ_ONCE()s and are
OK with possible compiler optimizations. Similar (reversed) thoughts go
to WRITE_ONCE().

I think it's OK to keep them but it would be nice (not mandatory IMO,
but nice) to have a comment describing which particular synchronization
we are achieving (== the compiler optimization scenario we are protecting
against). 

In this particular case, kvm_hv_vcpu_suspended() is inline so I briefly
looked at all kvm_hv_vcpu_suspended() call sites (there are three) in
your series but couldn't think of a place where the READ_ONCE() makes a
real difference. kvm_hv_hypercall_complete() looks pretty safe
anyway. kvm_hv_vcpu_unsuspend_tlb_flush() will be simplified
significantly if we merge 'suspended' with 'waiting_on': instead of 

      kvm_for_each_vcpu(i, v, vcpu->kvm) {
              vcpu_hv = to_hv_vcpu(v);

              if (kvm_hv_vcpu_suspended(v) &&
                  READ_ONCE(vcpu_hv->waiting_on) == vcpu->vcpu_id) {
...

you will have just

      kvm_for_each_vcpu(i, v, vcpu->kvm) {
              vcpu_hv = to_hv_vcpu(v);

              if (vcpu_hv && vcpu_hv->waiting_on == vcpu->vcpu_id) {
...
(and yes, I also think that READ_ONCE() is superfluous here, as real
(non-speculative) write below can't happen _before_ the check )

The last one, kvm_vcpu_running(), should also be indifferent to
READ_ONCE() in kvm_hv_vcpu_suspended(). I may had missed something, of
course, but I hope you got my line of thought.

-- 
Vitaly

