Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A09931F99D
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412640; cv=none; b=DCCHFvF5fJkV+hOQfcfIo46xK1mMJO6fFJxgPieifmtJdhZaR7nLWsJek9Wqb8bInrd5KzPwoeMNFSdWVgE5SNir2dpNHjqTcV8EQCZT7rQVguRxprjZlHnwCzptMA1DvFy4V0ur2zE7tQ5ealBIx8/M//x8J/zGMsvcLW3Rlnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412640; c=relaxed/simple;
	bh=XGF2VYl68rxHrrb3+celOOH/NDrS3MYyMHWdfsQBzvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TLjiWuzRyWqTrTgQNIkMo6jaO10aMV2SE8Ct0NQMU9ozR8q6TbYmrqS+VjxXplk0IJBqJgVvkAFUAiuC8H3OoewOtkmrUIOqaN2IZBXdxnAMS/t9G3aWiU3No3j02PJV1phy02BEA2mwwMsi/paPCjKrqcisnfqy9R9XFz3+al8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X8aWhkmN; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X8aWhkmN"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c856470fe9fso97716a12.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782412638; x=1783017438; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1CLBFjHRtepPsR7OTGTpvVtcvQrDt/pUW+o4gNlp90=;
        b=X8aWhkmNeHj5B+S2ARCMB1eYjl8r4K4etZG/HFXM6FdnlaRlqdY4o98YfqE28CTDcR
         h/5o4uydtcCJZiCzbK9sKcrbpGEB+T9aiDdWY3gbAEdzDlZbZa/q2KSuRVZ+rLox9d3p
         G4TtUWznQjge07RTSOIla9Pcp/rxD06QJ6XKnXaUvB6LS0sDQD0KiwbF/nSfSJ/UctIs
         eiYqmaiFp2MeO9M8BJQa/JwucCl/DUMXIcHS7haA2iKr7vI3h4lbwnYwrAqjdla0TWWq
         ju4VtRWlsKfyNNN3B70xbms6qUr002QyNhVZPOSpZvIhg13Wsch+aShIcJyNNQcyyMMd
         Ol+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412638; x=1783017438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1CLBFjHRtepPsR7OTGTpvVtcvQrDt/pUW+o4gNlp90=;
        b=OApHxu5ZD4FM7va44TOCuK5H5sH8XaY8n5t/UqH8aLc64ucMVhHteOrWuQYnfWrdr2
         GAiR9D2Vq+SDIJOPGcXKRo8v4kapFwQpCCE+Rj2z3x2b/JXxzHfMoXFQB3SZxDkZ+abG
         0qOJU239F3UBq3XKoz2+yHSgCHCeN/S4SupB2hCa/ap0vKBbldve+LinTWyVBpi1mLK1
         zhnFgnU4B4O9juoOLQoZgutILqBD0caJTtOAfNgx/wWdk5vXVdQ4VTj/jL8UqUf1LxmT
         xGTvcLY8xot1gXqXJCEBRUuFdoD7Klvx+bNwTSDH6aHShnbn+TL6BunAUDzWTF8e7yyD
         Ciow==
X-Forwarded-Encrypted: i=1; AFNElJ9cCqC9NqIMSKKKUCT4vIWtkRpo6gMt6LGfq3yg311hHPHEfjJF6PLr5fcpuEepr1UmLb6nSZA6R5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwDpkXQXkLr6gg7bQvV6Btjs3ULou13KZMM2W/6Y9OkyZD99u3
	PBV70z2yFQNsioYIj4eMzwaHYMAO6XU767ZHkLD8LTOR9Y4oXdXPpnB7SiY4iXdfykLrnEH8fy7
	E0gInKA==
X-Received: from pgab3.prod.google.com ([2002:a63:3403:0:b0:c89:356d:606a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6b04:b0:3b4:8aad:6337
 with SMTP id adf61e73a8af0-3bd4ac80c24mr4406701637.15.1782412638064; Thu, 25
 Jun 2026 11:37:18 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:37:17 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com>
Message-ID: <aj11XdftC_WAf6Av@google.com>
Subject: Re: [PATCH RFC 00/12] Document synchronization used in managing guest faults
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, vannapurve@google.com, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 27, 2026, Ackerley Tng wrote:
> Ackerley Tng (12):
>       Documentation: KVM: Elaborate comment on kvm_usage_lock
>       Documentation: KVM: Consolidate notes about cpu_read_lock() and kvm_lock
>       Documentation: KVM: Consolidate notes about kvm->slots_lock and irq_lock
>       Documentation: KVM: Turn - into bullet point
>       Documentation: KVM: Explain what rule the exception section is meant for
>       Documentation: KVM: Have actual headings for exceptions
>       Documentation: KVM: Drop mention of kvm->lock in SRCU documentation
>       Documentation: KVM: Add example for kvm->srcu in relation to mutex/lock
>       Documentation: KVM: Document synchronization for managing guest faults
>       KVM: guest_memfd: Clarify comment about gmem.file vs kvm->srcu
>       KVM: mmu: Point users of host_pfn_mapping_level() to docs
>       Documentation: KVM: Focus acquisition order section on preventing deadlocks

Please split these up into standalone patches or small series of patches that are
logically related at a finer granularity.  "Here's a pile of KVM documentation
updates" is not a reasonable level of granularity.
