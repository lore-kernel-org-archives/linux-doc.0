Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E339659A
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 20:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785444159; cv=pass; b=mHgLJTOgHhshDwbSUjLog7XEAmE20/Dd5Ey2hFcpWvzZUD8k9SOt7/9uMVWvAh8f4EwX37CuAPpAUn7d51sDzV9oZYu3a7SoCkfW2V6TPgvo3RdrgxHG8d/A4E72ro44rTd6m/8dlUA3vSi/oo1DEMbyRdlAVSk7SsFs6ufuIBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785444159; c=relaxed/simple;
	bh=1jiZYsqBtrcmi7eIwfzyaU0PYhHwikLTB018QmEsrns=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bg5dU7zEwEME/OAJ1OhPEeZ/4QsVs/Uo3A6mcDBT8ShLimVsn9vB4Ayej3ltpm7XVC7KXeHzYWpVmt6uAj8FU54fCtPEYMwpN/gTYmNhDBv1t1ZEd4oA+AT6sWN0MG9AeH9velOLi2s8jAqCDPTCNE0WGPpW9Orh8hzrtxZs2os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bAglTDAX; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bAglTDAX"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca12086c06eso195496a12.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 13:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785444154; cv=none;
        d=google.com; s=arc-20260327;
        b=mJPQ3lpedqqdms5DGlFKWe4+69JIPLfwBAWevPhrDJSXJzDue+FA7yXokB3/KqmogO
         pO8CrVODqIV+c/+llAQRVGJ4bcwyJQuVSy7GB62Q5aVL1vKm2O5NtKRv97c2J3rcBzOV
         rSTBvc7//QYahQsiUQabMcbQSo20p0nTpGRgs8HrPcx4Ib56gp5uhwapS8z4Tufhc/vz
         KtsFW4RoAo0O7PoHkQe6XjAm1YA9x2gxoQBa4gApTbJRKAPf4dPekihdK/Kn0NuGLpfm
         Lzqgp66iV91c49FXWRUdJSDZ7+oSZ4hncbmcqxzlsTiEJrudJ31KXgMrXI4ER6RfjT4j
         /raw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=tzyXsfKQYVbe7kXvY8Z4tL4HbFmN3e4/nufnZYtx15c=;
        fh=ImzvIMXX5yyyTIlwXtocCTE1XD6BZDuWtL/YL/xJBno=;
        b=N1mAy5rFZgHYR+6NLfBx2YNrJ0+KmUDgOR6BM6jFn3qfec0QV/9gFpn+DfF0tbMc9j
         bpgJyGNj+qH3raMSPMvVVxB9e5w3a0GAxKdC+NcU1t4qi+OZzHcM8iP9Dpi5HQYU5PnO
         pgKjOMRPbXRgxV0ISMigDmh0Lj2CjwxbIEFGN+BxPxA6cvKoAOuLun1GCakQU3qP3Nwi
         IJH1lirtBOk5Fkvvvov3IJwTwTo7kMw+rUeReoGPR3sX1hCCI6o9bx+esXB+qEAg7y14
         XQB8ZR7iClrIgxxHbAAYVIQAGnUhp+85bnIMMXX5F7VFgADFZJLrvCskcDVvNoAVFcGi
         ArjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785444154; x=1786048954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzyXsfKQYVbe7kXvY8Z4tL4HbFmN3e4/nufnZYtx15c=;
        b=bAglTDAXQTyF1QI2urJYdnQYs8AM7oEMOFaamKRGTXVUqR2kvlhSYLANE+d08MWXvY
         nH3U/5zIqj7sk8JavK1qY4WQyUE4KjKMu75Q7fLdq7yY6w1OJCYfzweSk1qmbMPhKVVZ
         LHeCrmGUtloTLYgTBcXHT8nloWIEDNKayMdM1tsGLGcwG1GPZwqk2ummotj3qcBFilKS
         wN+KGKMX7AoE061dpWKP6L6+2clcbI4cusCuSM8+MtTLGcV/v8ZBH73kROmEwzuuSCOC
         6IA85V8LUtz3zJIhOnqDgluEM/dUgrVv4aKwoABQplbtx6bIy4V3/MK3H8e2FCF9FERc
         YXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785444154; x=1786048954;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzyXsfKQYVbe7kXvY8Z4tL4HbFmN3e4/nufnZYtx15c=;
        b=tYoKYDw2huohB6D9IRjaspVhjG48yMgRgmkYuHFRCUG/RwPaB4yiO/08inkDCF0XCK
         MZw2hNDQ+L2zjKKKhr9Esil7wOwA9XLh4zDN+C+wg8N6DWa7RzanvL+bq+ZhUCPNfYbx
         N40Y+bppIT4rgdADoQf8Uz8RG/7G5fMwTd9mY34JvRhDpKwVGCdrwHFOVckj2MO/9cOL
         uHM6tUWtdMCwyPo1cjsgrXEOrOZyQeSLCEivj4lIm1dpHGChtcyzDRi9BYAciDJeoxrQ
         KLBym9Dv68531j1Hx8//+GKFTgDwyzo2fhFDxdiYnRyMflNMesfVMYtWzpCYgEUl09SA
         AoWA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3aZIz5mDT1+Kim5i9NaR1kx3jkm76FY21ko138Y0SAnGdOdyCWhnzMREJr1z7SdyHZ1PxRxzYLCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRaIkX31ZSJDRTOGr2NkrGJLTm5/FWfNnn8oDmXv87Xab2p5pS
	q/0Y9rvo2KOQHOFb8jolAbKcHEmjzFPPhEjtFNL4T886vrBsRCrKijqZ2hPJWxMZuySqijFNFlz
	jRkhhSOp54lcG8LV/YnAbSZTTyxHhTIB4VSPIBJfZ
X-Gm-Gg: AR+sD13hzTCaDtqFBajDSzBR4hHQjGKz1tVBRXIJVqv5NwZRrmdwN8p1unlb0u7uVgx
	0dW98zzHA2PI/23mZx3Iu78YRr4q//ZZ/SNQfaSu8zfZyMDB6fmnLtfDJ4ZqgB0VdLrFuApPW+2
	W18e4pHgK3dackLPESySxN7ya0+ID6hs2Sl7Az4u3CK9KR1OAoHqAw7h0hH+ta1AO6WY2FGB7kh
	VLPXGV3ayCCTzejWL+c8Mad6cUvCXxgzX/XTL+I3IzwwZ1aDuDSWC4WM/ytAiLNaHXAoqbhGKZt
	ovAzDnWAyyZKsHXNnz5A2zScI4ZoZnUXyjJflv7eaQkX+h4Ki3zf9aAlzCfTfMeFxseRkN4B4D3
	0hor7lXh9hVhdHnfdoFwYeVQrwKYgJncXK14=
X-Received: by 2002:a17:90a:d88d:b0:36b:bec8:94c5 with SMTP id
 98e67ed59e1d1-38f9bd790e8mr3699903a91.10.1785444153113; Thu, 30 Jul 2026
 13:42:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:42:32 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:42:32 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <60d19013-d6d7-4eec-827a-2622e22cec98@intel.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-7-35f9aec2aed2@google.com> <60d19013-d6d7-4eec-827a-2622e22cec98@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 13:42:32 -0700
X-Gm-Features: AUfX_mz2wy3LvLLQqF5XvT23FybAB1M_PJOCVj4Bbwu3P1vsWolBi1Qny-gSolY
Message-ID: <CAEvNRgF0SxmoMtqq69tUih54A9K7j_wcMFRrq=r9w6TnAGAUQQ@mail.gmail.com>
Subject: Re: [PATCH v9 07/41] KVM: guest_memfd: Wire up core private/shared
 attribute interfaces
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 33c9830190e2e..89cf922232920 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -893,6 +893,27 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>>
>>   #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
>> +static bool kvm_range_is_private(struct file *file, pgoff_t index,
>> +				 size_t nr_pages, struct kvm *kvm, gfn_t gfn)
>> +{
>> +	struct inode *inode = file_inode(file);
>> +	pgoff_t last = index + nr_pages - 1;
>> +	struct maple_tree *mt;
>> +	void *entry;
>> +
>> +	if (!gmem_in_place_conversion)
>> +		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +
>> +	mt = &GMEM_I(inode)->attributes;
>> +	mt_for_each(mt, entry, index, last) {
>> +		if (kvm_gmem_interpret_entry(inode, entry) !=
>> +		    KVM_MEMORY_ATTRIBUTE_PRIVATE)
>> +			return false;
>> +	}
>> +	return true;
>> +}
>>
>>   static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>>   				struct file *file, gfn_t gfn, struct page *src_page,
>> @@ -913,9 +934,7 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>>
>>   	folio_unlock(folio);
>>
>> -	if (!kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + 1,
>> -						KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> -						KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
>> +	if (!kvm_range_is_private(file, index, 1, kvm, gfn)) {
>
> It's checking if a single gfn is private.
>

But with huge page support we'd need to check a range of gfns... I guess
there's the argument of not keeping complexity for the future, but in
this case it's undoing functionality for this series and probably adding
it back later.

> We can just use kvm_mem_is_private()? And it seems can be a separate patch.
>

Do you mean that this refactoring could be a separate patch? I could
refactor out kvm_range_is_private() in a separate patch, then put in the
mt_for_each() check in this patch together as part of all the rest of
the "wiring".

I considered that but it seemed like the refactoring was too small to
separate out into another patch when the mt_for_each() part is going to
be in this patch anyway.

Or, I could add an earlier patch to first replace the call to
kvm_range_has_vm_memory_attributes() with a call to check just 1 gfn,
then this wiring patch would be simpler.

Let me know what y'all think is best. Thanks!

>>   		ret = -EINVAL;
>>   		goto out_put_folio;
>>   	}
