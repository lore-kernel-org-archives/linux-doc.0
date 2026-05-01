Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59A03793CA
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777674116; cv=pass; b=dzWmypnq6burFa9dslQHx3CN9vtv0aXzKKr8YUsPoYFqv/L5j3UOzOMRM/xFVJzTPc7IoG00Is7HtVGnY+8X+7hwf6+1VrftnhiN2jyg5tAlPk06OfcHIbDqUC5B3fy29dAMO/sZeZuOpPpIuyXV8iNZ9qDTIimVCPh0aM1/v8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777674116; c=relaxed/simple;
	bh=jLrfkaOhEb3MmFwOmWCGQPBbw6a6kIN8jleBSy0FvN0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/gqGr/zroXhcCuuCLhKqsn0YXwVI8/oBPedlOnKcZGlE83RlTyd5nZbnOI3seOGlhUzVdJ49Y6ddPpye98Ei3cDp+sKGcIdI3S33y92Py9qPzGckhCPwlUkX2I4Z/Y8oaSlPR1hXWMcPzeyBqJ5bATBQ4yOxqLee1gh2P+vOZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZHd7Xygz; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZHd7Xygz"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso841863e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 15:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777674114; cv=none;
        d=google.com; s=arc-20240605;
        b=QE08s59uXVSabKgkN98ib9fACKNQdDN5IqACk/4dFyoVo0iSHsFIXIxHxp4Y/IHzYg
         U250jlegkm6iOHqhWf+K8xFfSS6yxCA1QCloTYB40gkzviJhoerKkDYqAvFXe79/V4E7
         VLoaTd9y73g4ZqyiQoaW0iaqDNzUyeXm5ohoUqthEPBZEQGUJHQCArT6NXIp14FHfuhb
         f4Gj1IcSZAtA8PIaiJl9bGitJWyW4Q5Lqx5pgraUsFTDckBPvz8jDfPLHb6nwNdKEegz
         TYbrpTo8pp2vkHoY3VwvsF/G+idfItO0gFwi5soBbJRTg4jL1lm262jmU154aVftx/rT
         U2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        fh=0PC8zLqbs5STl+2FVfGVG2xBlvc+B4dPKk0LRbed0/w=;
        b=WLaMZtPbjdIFm0mDEEYap7JgyVH223ucTST96QswkzYtSpi6Z9enAUdJ8YbFKeBCiH
         U8tlVhH1uN7krJBFKzE6xHbXHiqzxYrOxLSRoKeOqUJLI3+vmQ7Q6gCrawh3tNx5q4GE
         TezbbCNS4DoOYiM3v+gdKbrD9nQvGbWoifgQI/2qPnHWaytJ+ZjsR2cyromrNYy1tF1i
         tW6xjqcxL6X/U6FFYBQRsIY5zA8iTpnhGdvh7J1j8SdA6xDLp/Lve5hvTkBKT92SZpNc
         sGK0Wqw7waJAF3XXlb/F1wINa1wWRKlZDFq5OAnEO4XekaXdOpgrFfdBGJH+h5JXxVLR
         GziA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777674114; x=1778278914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        b=ZHd7XygzDp1+bgpyWWstsNSnzgN6A1YDrvqFBMoy6WgTGyMnmYazVRVPJtbxC8vn9T
         5rNBfMGbYsd/9p9gqxkzT5iL82Nhaoou/IOl/YSZVZbM4Qy1Ler2R4MyufI/9osHe2By
         IIj9OcO2N70WgtpGUepjHj55uy67gMHUQY8Qxloi1RGDC1mn9WhCaAbtpcbgYudS+sGI
         hqC38rJ/ghaVd6FJu4ZPxxi7iIhwbXfvh+virH1w65yL36SdYPKAlViRgChAwMHQCH83
         mwh5sQq56kIFmFVqTGgYM4KOW4sjrHgjvmx5wn0AlDvo9tji4+Hqz6fYBGO/n7ZSjQY0
         NxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777674114; x=1778278914;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtXXiVGCKhisCk8aLdkBNg++qq/ezEnbK3PGbPzPAeg=;
        b=RFUhndiFIrWLNYkmfnt5AKGSGQ0UbESi9X085nHpyefVDkSOsKKkDU9uWZhBVFvKnJ
         yBaQE4ig475k1aydRg1HB9RHbQu0/FKuE/Job4lDUSAjs+NncE8Kjpka2WtLxEE7rKwb
         rUDgGrGrVuhEaIU0IQZbQVd4UFGZNROlW1xcdafUwjErs8MJt+HYGfRoAchouEEVFZVq
         9xrB+pKnE2ZIqCI/SJcRFCyBAnbdbGxdWd65Nfxm6vVi1rBxHAh79SR+cP+TvrVeZvtt
         sobKRDvZY+2ne+9Y5JEgCKw3rG9vEdnNvmuOeKm+u8s21lH7WZ/1aFQKGYsYEwP3zXBq
         PiCA==
X-Forwarded-Encrypted: i=1; AFNElJ/iHWWUVQvipFK9tL7O/q16QbHhLTS5eWrWzG//xS+oHZvXDfNDy5oW1/IRP9aFGdYYoZH4JLJ38n0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgwmqJperHNn84byOVMArhSjyCTrUfscJxELey66KjFwICwGwa
	vUsNXiFW4Izyn1lEUit2TdoTN/d3kpKRFd/QuMpfJbarLBgs5FyMjAb9uHM2CF6+bA9nk4iN3Mp
	77rTAF7hGSWVkMLV8wKriMOPNSSishpJua/PoRy9F
X-Gm-Gg: AeBDietnbmD1g6AsGJnLPETGQcpt4lcy5NSFRQ4YbLw1O8znrhfGr55g3SOWA5ujwpa
	Ib8ahA4GlNrS0Xv5pWWceaKYr0H3XYVcNlfT2coaniKXPWTYNeG+BSGrlAEm+qhRSHHjDrLOaF6
	xsaXfu42M/sZ8YvHdENM/9RexMR/MPilbrhleWHXkIyRNbWzo5IxfgK7qw6hcL2dgQpPWmlgI+5
	RrH1CwXtHkTtyjVtElbVw9KoNNPR3VDIc4JMtxa0P63Rb7Dc/ixTZ0cV3PK77wmNcqq6IILmKfd
	DrNELAgD5WAKh/UzXMOMZu+O37RxK66QH9eU6Rlpkcl3kcP0goZaie2KuNUmFKTm/T8vLAuJNDG
	SnptDV5X2nULTbew=
X-Received: by 2002:a05:6122:1789:b0:56f:1c32:bd07 with SMTP id
 71dfb90a1353d-5750c6b46damr742606e0c.2.1777674113098; Fri, 01 May 2026
 15:21:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 15:21:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 15:21:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgHRpvsEjtr1A_Qz3d4oMEaffTxESavrZ73Jtt6OobCwhA@mail.gmail.com>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <x7n77snnvvukofo3slopl74c5tmlb2t2un5qy5fq6eb3d2xt7e@6a6tixg5mdfc> <CAEvNRgHRpvsEjtr1A_Qz3d4oMEaffTxESavrZ73Jtt6OobCwhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 1 May 2026 15:21:52 -0700
X-Gm-Features: AVHnY4I-FL7ow2VQuDyStuaACgF9aoh7fvjduqjprjOyhgxszANTKzDwmZOdoKM
Message-ID: <CAEvNRgHZJ3RONKBXqWWLu2f4G7FhAvsYY0iMowmHu7v-O+g=kA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 00/53] guest_memfd: In-place conversion support
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	Jacob Xu <jacobhxu@google.com>, Darwin Guo <darwinguo@google.com>
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
>
> TLDR:
>
> + PRESERVE == guarantee that the process of setting memory attributes
>   doesn't change memory contents.
>     + implementation == do nothing in most cases, except -EOPNOTSUPP for
>       to-shared on TDX, since unmapping is a required part of setting
>       memory attributes to private, and a TDX side effect of unmapping
>       is zeroing memory,

-EOPNOTSUPP will only be for TDX, not SNP.

> + ZERO == guarantee that the process of setting memory attributes zeroes
>   memory contents.
>     + implementation == memset(zero) in most cases. For TDX, a future
>       optimization exists, where memset() can be skipped for pages that
>       were mapped in Secure EPTs before conversion
> + UNSPECIFIED == no guarantees
>     + implementation == guest_memfd does nothing explicitly about memory
>       contents. The implementation is pretty much the same as PRESERVE
>       except guest_memfd won't take into account vendor-specific side
>       effects of the process of conversion. Except for the test vehicle
>       KVM_X86_SW_PROTECTED_VMS, where memory is scrambled.
>

Found another use case internally for pre-finalize, SNP, to-shared,
PRESERVE, which works with the above smaller scope.

During SNP_LAUNCH_UPDATE, when inserting a CPUID page, the firmware will
check that the CPUID values would not lead to an insecure guest
state. SNP_LAUNCH_UPDATE will fail with an error and the page remains
shared in the RMP table.

Here's the proposed flow in the userspace VMM:

1. Load CPUID in shared guest_memfd memory
2. SET_MEMORY_ATTRIBUTES(PRIVATE, PRESERVE)
3. SNP_LAUNCH_UPDATE => get error since CPUID was insecure
4. SET_MEMORY_ATTRIBUTES(SHARED, PRESERVE)
5. Read shared guest_memfd memory, error if VMM disagrees
6. SET_MEMORY_ATTRIBUTES(PRIVATE, PRESERVE)
7. SNP_LAUNCH_UPDATE => successful, since CPUID is now corrected

Does that seem ok?

>>>
>>> [...snip...]
>>>
