Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C73E0254
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278948; cv=pass; b=t4O7IPcgW+/OOBG8QUNedLkUpUFudT262idYCOfJutA2h84PdBuRt4lP/DCQbGdc5zlpJ4TZI1zv1BdjNtV5ptPoKh+rz/onH0xG13hh3QDBxpVK+xL/LfIHmZLigTSxHE5XOGfVZoOm7L0j1wZfSyodeFre0wV+ewYbB/bM3rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278948; c=relaxed/simple;
	bh=oRXMjiqgwTC/r0B+cekSleDJHDasn8/cI7Xt0wnhyII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVCpmgrqa6XDDRJJiJ2f05lT2aa2n31HJF9qU2IQu4OV50NLkk/IAsBThSOfvk0dpJIScAVNS3ENtmNVlYwMR6OXPpdvp9bvbEq0+swLse/fqUcBIn0DRwNBvQHIeueB3o8a0b9W9PmgjAb+TxpCDCJ5OA12MUsqx1U2MJM58cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fRAG8tmh; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fRAG8tmh"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50d864c23bdso8811cf.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 05:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779278945; cv=none;
        d=google.com; s=arc-20240605;
        b=NV5pL7kTgGIMZ8y+aBYWsESiNf3aXrJMXhM9VsuxHlp/lMEiMIYkCeYzS5BFRbJzPr
         nBje2lSJdkwkRu1ucG8NPmBXcXewNKDhY1tmdH9Qj8YcxerNMVLQWHpmG2SKT+Os3HgU
         DYLvwiONARArebPk9mZ/vM9Y0Y3HukVjFu04M4iOCeoBX7kZ0FhEWWYvLCHTyEJ1PD+W
         j9ige0lgfGGh787mXJ8IMlcbIwqChNuRcrZcfSVyeG4xeWSkxTqscOpegUj+i/F9Ugf3
         SLhSI6FriTKDgBYtNO1j4JsGeSsYyotXzMDSv7P0L0UuCW4y2vP41eMFCIIaUb6IB9Hf
         sbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dQto/QC4w3qzIENzIqyf+q0L9QCeoBT0563P64KzKcU=;
        fh=fXSMCa6ez0PtUtvmwzaSXB7nDCz5zYCy5IpDO99RZpY=;
        b=LMd1P6Ibkun4qhO+tSbdKPUttroeO4uvQL1zq1MUJBdu1qRBPEgc7rolkEuzadSltg
         II0UisD/JYAxJ+x3JYJYvmul+oesc6HakyUeOniC0SJhhSBf4FoTwvC/fPhjzIsvGUYL
         PKiCahsev+lu3WYcFh4eJddyhu1aa84AOiDrcCO0r4X0UamZzixXcci/T4KgjmJs8lw2
         3BF+cn8Nn5MHg7uUfFYtsBqn8cbUWMZfV7xrWMBO+As87/odWBh0K0aofFH1K2VzCn6r
         tel8x0ZKlnKMvMu0Rb5eHNs5++beKv6DNnLtooPVhrzvISZVGPFVdM/yC1d53cd+AkjQ
         vdyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779278945; x=1779883745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dQto/QC4w3qzIENzIqyf+q0L9QCeoBT0563P64KzKcU=;
        b=fRAG8tmhKkfISt+dIB6Fox70UsF5t8RFCD5Q9uJhBQn01prx8QzGOo0FXXgvAsd6rD
         ZFb99dxixzRiG438sJ/27dt7ANn8TrDZw1EQ7aVjLnG8cSeW+Rwd75nPHEnefXuSqFzo
         oLZDypFNL6iCOmSPZsWALJZrRys2Sq9+K9E3r4Q+WLfbgsa1r/e8ZHaWfX471eEtPZri
         oE9X1+0wyN4Fy3N24OWLPO3Tb1iNnnmbUZVIQHSwj5oDo1gIVkSjx9nXfB5UTby8l6Gd
         z7XlPWWLy3wCKoy3YhiuP1h/mSnnoG9nJmqOAQVIGSBhyHUMi8qaT/In27qroVsBBpMY
         e0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278945; x=1779883745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQto/QC4w3qzIENzIqyf+q0L9QCeoBT0563P64KzKcU=;
        b=cA2jYs4CHBIvrxsycQt67VGaq/HSpHLwnTYsETDh0thWe+rd3ZBMFtjdxm1guhmsb8
         HAeztBLxNdYsUrzG49l8YxBowYw6htonTqhFmyHSh7YH8/gRWPPO+h1CgEwF3ETIRcTU
         Fymlg/Lar1ElwLdwiYcWJH+m1LtsQkEomsef1Xxxq8XqGTHW9wCJ4ADKRFp8aJYaNwFC
         zTKC/T5oOn/Nfa0DuLtnCJWlxRL3rTElHYoI3S1q0Dio0qhSEK42vLNAl1W/ICzwMJGZ
         Vt5cSd472faoEheh+0hdFpdplJYZd9XgCodKgQohZagdmYINb7oUbQEz+bfhettpNGjM
         WNXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WpKU600Rs2Ukj3nkOW13ihAouGOfAr36kJ4GKNr7OzVTiyTqYzT5qSAum4Du0ihuReBzGAoV6fug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxes5123bF6YL+KafZhP+eAy22pynNeO7Hp/0JghDWeu9vMUR2H
	k/jPdPKbIbVOVzV4jUeSpyfgpXFKo6CkQ+uSd6FfVg3MhVum7td+lyGrGlOmp4Np6PugWBD+S7h
	kB3vvbpFHXS7kKOXoDHOoAN0a0ov6aaEIHkm1Vv9F
X-Gm-Gg: Acq92OHtoXc7OTYIUAUK72XUbYB3WuA6lPet+2LeSQEndIM4gElijJxvHhD9wm2JOJ9
	y36CR8/V6CAa+h7EUNe+i6RSbjzGTz75B1ynJ6gge7d0GNW6dfsfjiGIN9Uew0urP94Xi1gegfy
	f4ayd+O0qme/ghELuWD3fPh62S5FuVLs8K+/xBOWqlnC7lVcGh/wXDZv8XzBCrtG6OS7SWmZBd6
	0R7faOJ4QSfS7svTbjoXdEXrbfRsxHdqbs6NIFOx0FRRKLJlJ1UuLhsuZUPffXvzupV96pMldgp
	VYimxyMr+dOZd9tp2pQ=
X-Received: by 2002:a05:622a:8c5:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-5167937f1fcmr45990921cf.6.1779278944775; Wed, 20 May 2026
 05:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 13:08:26 +0100
X-Gm-Features: AVHnY4Kn_wj-UY2TQuxJGnGGFJjYyy0y_byFgvzUVgqLd3Jhr51sOjcVOWq6VeM
Message-ID: <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Implement kvm_gmem_get_memory_attributes() for guest_memfd to allow the KVM
> core and architecture code to query per-GFN memory attributes.
>
> kvm_gmem_get_memory_attributes() finds the memory slot for a given GFN and
> queries the guest_memfd file's to determine if the page is marked as
> private.
>
> If vm_memory_attributes is not enabled, there is no shared/private tracking
> at the VM level. Install the guest_memfd implementation as long as
> guest_memfd is enabled to give guest_memfd a chance to respond on
> attributes.
>
> guest_memfd should look up attributes regardless of whether this memslot is
> gmem-only since attributes are now tracked by gmem regardless of whether
> mmap() is enabled.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  include/linux/kvm_host.h |  2 ++
>  virt/kvm/guest_memfd.c   | 31 +++++++++++++++++++++++++++++++
>  virt/kvm/kvm_main.c      |  3 +++
>  3 files changed, 36 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c5ba2cb34e45c..28a54298d27db 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2557,6 +2557,8 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>                                          struct kvm_gfn_range *range);
>  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn);
> +
>  #ifdef CONFIG_KVM_GUEST_MEMFD
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 5011d38820d0d..f055e058a3f28 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -509,6 +509,37 @@ static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
>         return 0;
>  }
>
> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> +{
> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> +       struct inode *inode;
> +
> +       /*
> +        * If this gfn has no associated memslot, there's no chance of the gfn
> +        * being backed by private memory, since guest_memfd must be used for
> +        * private memory, and guest_memfd must be associated with some memslot.
> +        */
> +       if (!slot)
> +               return 0;
> +
> +       CLASS(gmem_get_file, file)(slot);
> +       if (!file)
> +               return 0;
> +
> +       inode = file_inode(file);
> +
> +       /*
> +        * Rely on the maple tree's internal RCU lock to ensure a
> +        * stable result. This result can become stale as soon as the
> +        * lock is dropped, so the caller _must_ still protect
> +        * consumption of private vs. shared by checking
> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> +        * against ongoing attribute updates.
> +        */
> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
> +}

Doesn't this imply that all consumers of kvm_mem_is_private() should
validate the result using mmu_lock and the invalidation sequence?
sev_handle_rmp_fault() calls kvm_mem_is_private() without holding
mmu_lock and without any retry mechanism. Is that a problem?

Cheers,
/fuad


> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_memory_attributes);
> +
>  static struct file_operations kvm_gmem_fops = {
>         .mmap           = kvm_gmem_mmap,
>         .open           = generic_file_open,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ee26f1d9b5fda..4139e903f756a 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2653,6 +2653,9 @@ static void kvm_init_memory_attributes(void)
>         if (vm_memory_attributes)
>                 static_call_update(__kvm_get_memory_attributes,
>                                    kvm_get_vm_memory_attributes);
> +       else if (IS_ENABLED(CONFIG_KVM_GUEST_MEMFD))
> +               static_call_update(__kvm_get_memory_attributes,
> +                                  kvm_gmem_get_memory_attributes);
>         else
>                 static_call_update(__kvm_get_memory_attributes,
>                                    (void *)__static_call_return0);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
