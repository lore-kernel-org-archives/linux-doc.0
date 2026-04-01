Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F738C400
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052321; cv=pass; b=k8rvrZ09QndHMj/8ychflinlJ/fk/SjdXkltCKwjiR+Z+5FE5zAD8gjYUI5Jtlky07DdzfjDhU1oCOugy4tebpOobACy86tnM2zzBwKmNYC0BPdCi2toQ/KURzMFlniaWkFsSiPK2zLBlFiQdOb1Ftu2nBt3VxjEihRmqf6+w7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052321; c=relaxed/simple;
	bh=3T7GMoC0fS9mqAo2YBiLIAD1sZxRlz6N0Q1xMegEdoc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNRi2s1MThFx5PIrDq5yy1WiWwqIml+/prphLIxLNl3zlywgVGYP7NnTW6FapEV5lp9RloDrlPVPN1El9lyksyIENCS8BuemcsYL1L40P8FWThv4HWZAebsqAO98+OuGfq/UmhZISljp/+QbAVO/Th08X5DLGuLkJt+hnt0/IXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EYLQj4Dh; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EYLQj4Dh"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56ce5c899fcso2171002e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 07:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775052318; cv=none;
        d=google.com; s=arc-20240605;
        b=XKH78XbozIdZf2g65mjPKOlaiTNI1OspnU2NlRfkkxQcQ/GPZeSN82UybByY4sxYAL
         Nxy0pTfddWJVGP3ZhIvgIoajcFVXaLf5sh58uuKpPiMWiUWer2PVxeJjQ42m9XgeUAhy
         K7mwTAFGgBCrRp/NfEcvqty2Gl1opzhO+sXVGUSZQam3EO7jQ5iLYHVyt5qo1H2Qv0fS
         X6ZAiaYw3RFL3IrzY/o1EN9PU0E/jM1UTyN3gH77FXYSoSM6Qouv6aH1Ehqw5UGDupjH
         GKboATsEbqVqrpq59Ow4o7SbL30aDBay8x5MzsVCmAy0epgvXsEUMH9OycApCPMdHMpY
         5oFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=cok0tTO+M9AY7GrL3ZPCAkrKaBzewD/gpEZeNzSpUo4=;
        fh=frOgx393RqDQE/F+/+Laho5s7h8x0n2ygqouSfHtSLE=;
        b=D4ZfqgsXKfpeI8tdpG2yjvQBjzRHbWIR9USKIJQMDYC1tiMH1r9nFc5xwHuDuQFDR0
         0mTOCt9OveiCEkfg5iBEOvVYHMgaEa09UFhwbzqdSbKpl58wNH3hc5iOJYPp9sZe/IxN
         WFbu/YauHq9L5IXz7yAbedddlRxse/Ai4npKuFu7GL7AZ1aoJwB8C47ev73W2qMrqysB
         N5tFgj/Txxw0lWyKmyjeGvxxRdEqobZBPjKb2cqsqm4HCOzH8At/OZPbIKVflvwldetB
         LYvfZ3Ah9t9phwFNdohvFfDxqjci/Pvo93b3lXwzhbClLhHFCFUsJsf9ILK+4JfLsq6n
         Lg4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775052318; x=1775657118; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cok0tTO+M9AY7GrL3ZPCAkrKaBzewD/gpEZeNzSpUo4=;
        b=EYLQj4Dhny63Ff/pV2FGIcuXjBIBXXubDiwrYFSWrrKaXz6kiuUMYDaa1XNmmVHiG4
         7sOApBTxaJrj9nLFd/hCCXL8NuGA3gDNQE7QAdzzNba+qKrFZLh8L0zBAv8QOB53PHnV
         yJUS8oKR0jjomFrVwZtutMBSNKQjMtS1F+pmKYchoYexsK+eTadQzUIKmp3t7ZrzKN6W
         R9RyG3CUQ+u5TJHJjZ/P8qBciP/CLYzR9yVKj5hFZNSdN9ll8Kzwn3ob3Ayhoqn9LtoI
         RdS3DoDXeem3TKxNoTwEjoQ4OKjez1g/8weDLG2wog+O/cnXrIkXiAO+Ofi4u2GXFgCX
         iHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052318; x=1775657118;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cok0tTO+M9AY7GrL3ZPCAkrKaBzewD/gpEZeNzSpUo4=;
        b=YeuzcmykDthne50ZKSLJezp+IFMSDS6eTrsSEhXM00PCmE+wrdMqVV12GHIQ1GcgTu
         38F7BVeSJN4l7GUd912VfH9UddcOezthKiySuKF9pkvUNKBEWa1MnPM1cK+zpWDewOgR
         ciYtbIAFunPf/o4aYAxNCN/88uT9Vbp/i7PI4+AiODdoR3ZYkQul56Oqci672jpmjRKz
         J4A0ygvzgSO/3G2bgRgEzXiO2g0M6l2qM34iMMOi8dmXaclSmQrMUDuyjVs/97tJFLUl
         wTrYupUm/o8Tj3QscV+v+BoBP4G3uHKuDq5vEHkWVnBEbz48mSJkA1WfIvSRrSdf6SEo
         oZRA==
X-Forwarded-Encrypted: i=1; AJvYcCXbmMeYC49259MXf0+z0f7wO6h0VBZoIoDsyMGD3cnTZd5UUWE1lmvLZ1UCuWtBhfw4EXzMEHbkugs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOlbcrX4YWemNk1yxvzp1hWwCqn16ci895+KQNb+OpE6SnwAa
	Wd/XCnLQz5SRDa87Z+2MX4cOYkoRDrDx5GE//0IMMXEK3kCTxTYye/QryMMlWEWDNAEpkCej4Al
	ccVNlQHO2o61k5DqFtrvr83QM8rlJ49fdNBrEiUvi
X-Gm-Gg: ATEYQzywaE39AmGF3Le0BPTe1p4LenG1LxWW3SR+lfTq15R03OTXFtdwx/45PWRu2Ov
	s8WkN/9ZmcpYzFjI75/RbqvbS4vnBa3IbVwB/mm1vz8XBdW+uuimBaimaGcmahXYme4uGZC4Jvu
	yMot+OS3NmjKU2LHLatXjvycxRQDJ/3MRLerB51paTTJPR/UR61Z7/dNZac3ZES3L3bvYaZ7QVE
	a2+yrymQv3aXyeXRsuEzCh9pD63vjM0DM8Y6Bl21JZBWEK7WzAW2b4W76xqnR8FgVSqnpd+YNRS
	mFYaqUo6+R6847GFXrYEunGTMSH9b7LBI2JN7w==
X-Received: by 2002:a05:6122:ca1:b0:56a:ef89:34fc with SMTP id
 71dfb90a1353d-56d8a81bd48mr1423992e0c.6.1775052317094; Wed, 01 Apr 2026
 07:05:17 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Apr 2026 07:05:16 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Apr 2026 07:05:16 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260326-gmem-inplace-conversion-v4-7-e202fe950ffd@google.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com> <20260326-gmem-inplace-conversion-v4-7-e202fe950ffd@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 1 Apr 2026 07:05:16 -0700
X-Gm-Features: AQROBzB8ZjEkM1kRtGYPSYrf1SL2xnDWxbzougnTteAKEFNAbNZQz2YVpzx5v1o
Message-ID: <CAEvNRgF+FjJ1EWSR_rzD1=N040ZitiRrM2O3N0Kj5yN5rT3h+Q@mail.gmail.com>
Subject: Re: [PATCH RFC v4 07/44] KVM: guest_memfd: Only prepare folios for
 private pages
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
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
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> All-shared guest_memfd used to be only supported for non-CoCo VMs where
> preparation doesn't apply. INIT_SHARED is about to be supported for
> non-CoCo VMs in a later patch in this series.
>
> In addition, KVM_SET_MEMORY_ATTRIBUTES2 is about to be supported in
> guest_memfd in a later patch in this series.
>
> This means that the kvm fault handler may now call kvm_gmem_get_pfn() on a
> shared folio for a CoCo VM where preparation applies.
>
> Add a check to make sure that preparation is only performed for private
> folios.
>
> Preparation will be undone on freeing (see kvm_gmem_free_folio()) and on
> conversion to shared.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  virt/kvm/guest_memfd.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b6ffa8734175d..d414ebfcb4c19 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -900,6 +900,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  		     int *max_order)
>  {
>  	pgoff_t index = kvm_gmem_get_index(slot, gfn);
> +	struct inode *inode;
>  	struct folio *folio;
>  	int r = 0;
>
> @@ -907,7 +908,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	if (!file)
>  		return -EFAULT;
>
> -	filemap_invalidate_lock_shared(file_inode(file)->i_mapping);
> +	inode = file_inode(file);
> +	filemap_invalidate_lock_shared(inode->i_mapping);
>
>  	folio = __kvm_gmem_get_pfn(file, slot, index, pfn, max_order);
>  	if (IS_ERR(folio)) {
> @@ -920,7 +922,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  		folio_mark_uptodate(folio);
>  	}
>
> -	r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
> +	if (kvm_gmem_is_private_mem(inode, index))
> +		r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);

Michael, I might have misunderstood you at the last guest_memfd call:
sev_gmem_prepare() doesn't prepare a page for being a shared page,
right? Does this work? That prepare is only called to "make private"?

>
>  	folio_unlock(folio);
>
> @@ -930,7 +933,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  		folio_put(folio);
>
>  out:
> -	filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
> +	filemap_invalidate_unlock_shared(inode->i_mapping);
>  	return r;
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>
> --
> 2.53.0.1018.g2bb0e51243-goog
