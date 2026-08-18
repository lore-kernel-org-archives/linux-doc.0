Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE0B41A50B
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069478; cv=none; b=T7bf9cfHqNjqrfMXOGAvkSbZ4ehPef7SfPV2JWm3u/SMQUsEfiwJKCnU4R95crwSMouZ9xf8XXkdymdHE0vNSQa4WsLtBLUuuEvBL8nN5rOM1S+TwzFgFCwia7RgZeJsMmvDVHNUvxaDgI0rT1j3GJayRDZQZlEbE4L/C/U/eLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069478; c=relaxed/simple;
	bh=wQ68heHkCupu6WSEgt5iLdHD+hbjTh1juZ0Wnx2wjUk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f+QRD1CvTtk/De84uoWYhz6b4pt3jCFhRtp9oeLJjpDNBR9ecOzOaAHMgD9F43fs98oIjfUzu/jzeeJ9YuJsGWUK+55iZwEAAp2znPXMPaGiCelMmOnYVxaqXr75H17g0NMjX77vUCFKqDf3C1gPxUCfGGpTXW6l1insXB5Fr50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+LvMm8s; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+LvMm8s"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15f0aea084so310404266b.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787069475; x=1787674275; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gq4c916t8aM4R9/gOTYj07vE672c6Dn+UdOcLkpJL3k=;
        b=l+LvMm8snBBsWECYIUzFC/FYZKd8BCHWXXdjW86FH+8zen02glu3JguuWDnQPCB2Vj
         6JSbrezX0QkGQUe7DCHqb7lIHyJ6DreZ5OV5OsgVKckVwYwiQgHUkQRHFDTHjaBxfoEC
         81KrXCr0adh8evguBiehgNFV4QaRWwogOo4v9jEyImzj+Dm9NH6PftFvkqkJbpNGR4Lf
         4vM95YMYHA0ePcyiNZ+pPUaR3GMn+U2G+MAN12W0O4Qq9iVjLLpsmaJtp9ntOcZ+ooPg
         sAJKrJRK09qJKgQtTrADZeeOXEwVc9DcrP4q8zO9K8J/ndw2VAAgoEk+TLA8A1fWS+gD
         Dj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069475; x=1787674275;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gq4c916t8aM4R9/gOTYj07vE672c6Dn+UdOcLkpJL3k=;
        b=nkuiPvGkF+bj5mIAHd46bPSb84IeiSVNG9hyXnKHQQ2oc+8KLbCq3xul3cn6XesKOu
         bgAu3D8ojU6JRANnu4Ir3IK1tIsLOEvZgS0IsttzcCCA/H4lZvHCdQ7hpUybjK6Jzhap
         ZcqpNosKT4sHbqmTNdDPZBXsA4yOq9VItX923mo6WxnsUGWgVnUY6ca7xJi7TGs2XUYL
         Gfyz9GFo+mrtKMNs/5rMqQFPNG+SanASUZdDW0LM657ei5RXEGtmIXkFsUeCSE3GTUkh
         0nUlWUy4K3trPmerVjZNYwRNslBdvfD494RpDvZt6zc/mHXijpNolcAFZ85CjqAKs6ss
         JN8w==
X-Forwarded-Encrypted: i=1; AHgh+Rrky3YuSIyyZeUNVwtqfMpMmndHx0pZSXagjA7UeTzJYMtL0PcQ4Sm4aoVmoZIk7zjoH10Y0sQvCLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR6Nfchun/ySrWP5GK8BO8Flkag0kuwSFjIXtkkOHzBcG04f1N
	5dio0MmZV9XviDNZ2qkUiMPml0aHO5VyEA88s/dfntqQPg+mNOtNumEwzerqHTSQQJeDNOMFhHH
	SS9p6KiZtKTsWGIsDAg==
X-Received: from edrs9.prod.google.com ([2002:aa7:c549:0:b0:6a3:6b8a:8011])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:434c:b0:69a:928:9405 with SMTP id 4fb4d7f45d1cf-6a38a8dbbefmr17632626a12.1.1787069474414;
 Tue, 18 Aug 2026 09:11:14 -0700 (PDT)
Date: Tue, 18 Aug 2026 16:11:13 +0000
In-Reply-To: <ans2Qvo0453cc_DD@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-2-tarunsahu@google.com> <anpXjM_lg_UTpl0q@google.com>
 <9huzqzk4zt3n.fsf@tarunix.c.googlers.com> <ans2Qvo0453cc_DD@google.com>
Message-ID: <9huzlda3v272.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 01/11] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
From: tarunsahu@google.com
To: Sean Christopherson <seanjc@google.com>
Cc: ackerleytng@google.com, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	linux-kselftest@vger.kernel.org, andre.przywara@arm.com, michael.roth@amd.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, will@kernel.org, 
	vannapurve@google.com, maz@kernel.org, fvdl@google.com, kvm@vger.kernel.org, 
	oliver.upton@linux.dev, kvmarm@lists.linux.dev, alexandru.elisei@arm.com, 
	skhawaja@google.com, aneesh.kumar@kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, kexec@lists.infradead.org, 
	suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Aug 11, 2026, tarunsahu@google.com wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> 
>> > On Tue, Jul 28, 2026, Tarun Sahu wrote:
>> >> Introduce the LIVEUPDATE_GUEST_MEMFD Kconfig option. This option
>> >> enables live update support for KVM guest_memfd files, enabling
>> >> guest_memfd-backed memory preservation across kernel upgrades.
>> >> 
>> >> Currently this support only guest_memfd files that are full-shared
>> >> (INIT_SHARED and no support for private_mem).
>> >
>> > Why?  Specifically, why do we need/want a separate Kconfig for guest_memfd
>> > liveupdate versus KVM liveupdate?  I can _maybe_ see a KVM-wide Kconfig, but
>> > even that seems like a stretch given that (AFAIK) hypervisors are the one and
>> > only use-case for liveupdate.
>> 
>> LIVEUPDATE is used in many subsystem. It is possible to enable
>> liveupdate and kvm without enabling KVM_GUEST_MEMFD. So GUEST_MEMFD
>> preservation must depend on CONFIG_LIVEUPDATE and KVM_GUEST_MEMFD both.
>> LIVEUPDATE_GUEST_MEMFD Kconfig is wrapper on both of them. It need not
>> to be visible in menu, So I can make it hidden. WDYT?
>> 
>> Also, KVM VM_FILE preservation and GUEST_MEMFD preservation both depends
>> on LIVEUPDATE_GUEST_MEMFD in this patch series. [PATCH 05/11]*
>> Which is wrong. So I will update KVM VM_FILE preservation to depend only
>> on CONFIG_LIVEUPDATE.
>
> Or just handle it all in the makefile?  E.g.
>
> diff --git virt/kvm/Makefile.kvm virt/kvm/Makefile.kvm
> index d047d4cf58c9..e6f098498795 100644
> --- virt/kvm/Makefile.kvm
> +++ virt/kvm/Makefile.kvm
> @@ -13,3 +13,8 @@ kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
>  kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
>  kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
>  kvm-$(CONFIG_KVM_GUEST_MEMFD) += $(KVM)/guest_memfd.o
> +
> +ifdef CONFIG_LIVEUPDATE
> +kvm-y += $(KVM)/kvm_luo.o
> +kvm-$(CONFIG_KVM_GUEST_MEMFD) += $(KVM)/guest_memfd_luo.o
> +endif

Sounds Good to me. Will take care of it. Thanks.

