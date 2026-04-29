Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A8A32B99F
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486939; cv=pass; b=KLRH+Zwl4c9+OWSNJ8NAf9WAkCeeYogrnjsCWvXeTLfqUfYLeAGlLVuqxGuzowC2Cwrz3/KTERBFKzIMJvFj6O1ihLK/J0qHUwkfZs5F83BfcYAe3cdCaLwTXsv0TJVT2jCkLpltIMWHRcOr2EpQ4XgjOfFMabLqisR9s4HLezU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486939; c=relaxed/simple;
	bh=3OYO2OiYtwBthWhyxo59K+FiM1KtEV3i++46RR5OLxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6ssNOwTrUvkZPIDjz+3toRIuUqZENRMDdAY/cyUHsBmfAJc3h/KofKuOjniJP4BhvpOgDCNPCsmE252efnJTyYH2FQn7fPfogwLQ/htZUiFo1wibz3wBYAVeMkX78FyBL0dJjRi/V5V/BJwFulTX5HY7taEGwUPw32Fd2PYWTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KJVieBw/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZIjULxNL; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KJVieBw/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZIjULxNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777486936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gY7VJIEyO/W3nZC3qbRdfDIZ/AzOw1XW+8RhXie+zvE=;
	b=KJVieBw/5qist8RVzb/PSTWyoI7pq8oA4bnVtkRx5bQ6i8F47LD/RWwjbjFO/vJxsPXWVE
	pgbi8h1vrbvcQhVIvu2JfF0IP6RgPE+73mo4W18EZEn4JWac9O9SCX0LftHIoFZEJVamNM
	+fBJjzQ6ugRu+sayA0F0sxYr4cbONh0=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-JV1kwAZkPWCtki8DMQ5xDA-1; Wed, 29 Apr 2026 14:22:15 -0400
X-MC-Unique: JV1kwAZkPWCtki8DMQ5xDA-1
X-Mimecast-MFC-AGG-ID: JV1kwAZkPWCtki8DMQ5xDA_1777486935
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-658c29291c7so74054d50.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 11:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777486935; cv=none;
        d=google.com; s=arc-20240605;
        b=OD44GX2F96pTRxDKM56dztspOoX9O01fAhL0r5gKI/6tBtkfbMlb5ZhQZBC2SHUiPF
         R1ISm5lXGQLcZ8PflytdlVvaAY99XSP7gnf3b3r4dNoDZvZsBGLUvaI5rpqmZONDv39v
         1kCwkUuvX8wRmAMtAULQiTf5b/RExPybLuFg8LX3q9kkzBocoYPmKLeikMvtxfq9dvrR
         J31QbPRL4PL7gv++6O4GSt5Yb2DA8KhFQpnqgx6u+ER5JM+frmRe1jDzKcKI8QZnoXCd
         kEDSduKXjMStXFptsXyRVDGURosIVrtL0+C6XYX5/1F2LPAod6dIepN5ttwB7PisfM2a
         xjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gY7VJIEyO/W3nZC3qbRdfDIZ/AzOw1XW+8RhXie+zvE=;
        fh=bDmvBtrVkuWQ5zZ40qlup6sPYYZPzijcBLe1NTyC5K4=;
        b=VIaQTm65ku6rUJ4vyWdCvOlx29NceU+mq5ckZfLx4EGk1y6xIAQTELLwzEzzsn0XxL
         uzqs+i/O+kgWoFBGCiDVTPexm8tkojwHetZyjsYbSKj6fmKJj0518GaZpR4rpI4/IvtH
         spmz6YJFr818lXtNTU8UEbbahM0YqrlunyouBr+wWdsXTd9x6VSsDfouXmYXDBMxx5XB
         zfLG8dbqCJcdQ+ovZwThXsDdHCPlGHDdb8BsntTuMIxRPo2t7rTtT/tXNaNsbTKQ5i+y
         0XL592qJNyohV3q7keENZxeF/pjC6MLG73kMcUr/DmbaJy1OjB1Z2Ws5OXrrYgG8Ppjj
         uR4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777486935; x=1778091735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gY7VJIEyO/W3nZC3qbRdfDIZ/AzOw1XW+8RhXie+zvE=;
        b=ZIjULxNLFejOqEDCl10XjggvkP5F8pW4FxKLSp9s1hEmR5gwSCsyiwgKXivz1oZYtY
         K6GoAYbVqI69Taysk1d2HAsMltccV8a04ZyHs+XneUli4+gogWFMnxECzSp5j/BhdmyH
         K4TL1o0OznZFd1CdcBNWGaj3YYohoh9LId3DxkK2K1znOSX9R748l3UbyNQHFQO/ZjLG
         +LGhLB2MhG3Ll+gqlaQuSqeQtlWVGw4OxIds00uC645TI3REZPb7dnJlT+0mdf0Ng2E4
         zJAPkUrZFgjLKNprQZGykWCb3aUD5mWYUtAVWbdEoD+5fxT5ibqUlPThqBU3G9bhwoT/
         W25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777486935; x=1778091735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gY7VJIEyO/W3nZC3qbRdfDIZ/AzOw1XW+8RhXie+zvE=;
        b=YOffb5MgaYFG3M24yjF/L7HilXZHd4yGFQ63sNmURc3GNVkhFr5UXx/dmCiDCys+Oa
         rRAbuFcodKNg6+EqhsUU6QhazSdfb3qTDtOeo0iXBxg3JGIP8W8PKCoqy6S3Qp4auAl0
         K8/+qYQLjZlx8jmEWilVVAE3hXfY42393AZaT5aaaKnpkkvUOCcCZpHVVsQsK2jTb3V8
         OPKrRKF2+V9qgomStJ9DwLhyZ44xmrk1VxDvnQGZzKnNUmHm3iF5ZRol2o3X0toy+iDI
         kc/FtNCsxCjA1YWTySafveMU40U73GvscygD1Ue0/UdXbYTnUWlsxZqkUP6EB4M4FGb5
         yalA==
X-Forwarded-Encrypted: i=1; AFNElJ+jvIRGAzjjj++p6QN4nrw+j6Xn8swy5dyKffDkbUqd84Tdeng80GR32XIqMi4jxQaRPJb1kdgIeuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwML5UUqYZap8bZBRZTH00/obxvzxL7IMJzgz48ffhhJRJhE3xz
	CB2h0cGKOfZHtKz8+mebOr5xZhTiYWbEjbmWuYreujPQG8Au2yQC0jj3bPjwhMjj6I2m09qyLrX
	sgafh0OLh6M1Vf0NlRYNSJLqxUrBpEBe42e5IpuT4Pcrkn609H2aoFmTEtAdXIJ+s0AkHUif52V
	VortaGe52BEM9qJpoXgPHbjpYaHBpr8x0FZUo3
X-Gm-Gg: AeBDieuw8xldrmpjQAdRlaTLpGv2BNxAC8eQf46hXRLtxnbgwM4uQdoaHTAvqXecp37
	Awo6DKm1OCc0/jQqZG5wT2GuIrTks7NJlmZwjce1sOLI/3WY/p7Sx4/1zUWkisJoHlxOUQeFaVW
	eFod+eAhcdaQba6yjeOgrNHvPae5L7PLPfjRRqwb35p8W4S3Js/asCqKtMr05QvFWcsJXH29D+T
	Kf1kIJ27/2S/FtQhWTAuVnGk+hkZi6V1OZkT0wCrY/4v2xVZTU=
X-Received: by 2002:a05:690e:4808:b0:653:1b1c:1df5 with SMTP id 956f58d0204a3-65bfb618207mr3992047d50.22.1777486934814;
        Wed, 29 Apr 2026 11:22:14 -0700 (PDT)
X-Received: by 2002:a05:690e:4808:b0:653:1b1c:1df5 with SMTP id
 956f58d0204a3-65bfb618207mr3992031d50.22.1777486934364; Wed, 29 Apr 2026
 11:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-1-npache@redhat.com> <20260419185750.260784-10-npache@redhat.com>
 <5564e170-d052-4445-9914-70bfd852d3b1@kernel.org>
In-Reply-To: <5564e170-d052-4445-9914-70bfd852d3b1@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Apr 2026 12:22:21 -0600
X-Gm-Features: AVHnY4L3X4jVTb8LgOcxKjQeysiycYOCHFfdu1rzktXVmJtNDEVN92iFQ6rxy7s
Message-ID: <CAA1CXcAuD0EfrNro0VGupeMQTXMLzutfQAdP942YbQ0AJQA5_g@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 09/13] mm/khugepaged: introduce
 collapse_allowable_orders helper function
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, ljs@kernel.org
Cc: aarcange@redhat.com, akpm@linux-foundation.org, anshuman.khandual@arm.com, 
	apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	byungchul@sk.com, catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, Liam.Howlett@oracle.com, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"

On 4/27/26 2:24 PM, David Hildenbrand (Arm) wrote:
> On 4/19/26 20:57, Nico Pache wrote:
>> Add collapse_allowable_orders() to generalize THP order eligibility. The
>> function determines which THP orders are permitted based on collapse
>> context (khugepaged vs madv_collapse).
>>
>> This consolidates collapse configuration logic and provides a clean
>> interface for future mTHP collapse support where the orders may be
>> different.
>>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>
>
> [...]
>
>>      cc = kmalloc_obj(*cc);
>> diff --git a/mm/vma.c b/mm/vma.c
>> index 377321b48734..c0398fb597b3 100644
>> --- a/mm/vma.c
>> +++ b/mm/vma.c
>> @@ -989,7 +989,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>>              goto abort;
>>
>>      vma_set_flags_mask(vmg->target, sticky_flags);
>> -    khugepaged_enter_vma(vmg->target, vmg->vm_flags);
>> +    khugepaged_enter_vma(vmg->target);
>>      vmg->state = VMA_MERGE_SUCCESS;
>>      return vmg->target;
>>
>> @@ -1110,7 +1110,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
>>       * following VMA if we have VMAs on both sides.
>>       */
>>      if (vmg->target && !vma_expand(vmg)) {
>> -            khugepaged_enter_vma(vmg->target, vmg->vm_flags);
>> +            khugepaged_enter_vma(vmg->target);
>>              vmg->state = VMA_MERGE_SUCCESS;
>>              return vmg->target;
>>      }
>> @@ -2589,7 +2589,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap,
>>       * call covers the non-merge case.
>>       */
>>      if (!vma_is_anonymous(vma))
>> -            khugepaged_enter_vma(vma, map->vm_flags);
>> +            khugepaged_enter_vma(vma);
>>      *vmap = vma;
>
> Are you sure that in all cases, vma->vm_flags already corresponds to
> vmg->vm_flags / map->vm_flags?

I reviewed most of them and nothing stuck out, but I can go over them
again. Lorenzo may also have more insight into this as he is more
familiar and has been working on this stuff.

@lorenzo?

>
>
> That's a change that makes this patch unnecessary hard to follow, in particular,
> because it's not documented in the patch description.

Thats really weird I could have sworn I did update this description...
There was a lot of changes this round, so it was hard to keep track of
everything. Sorry.

>
> If you think the change is fine, you should better move that into a separate
> cleanup patch where you only drop the flags parameter from  khugepaged_enter_vma().

Yeah thats a better idea. Ill separate it out, thank you for the reviews :)

>

