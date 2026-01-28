Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2513B322B79
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620029; cv=pass; b=GsdMTQz/r7z5AnEBrGUJad5TMD6zO5EC0A65iFX2Sg/h61CZjzTYQU+ofvmjtvDT4HZxpIuZ2cHwtVttM9/1LnybzOMwGV80xhG8bQnUykXNYxh4sEHTLoHXV/CC1C4fSKU5TPcpN8dLOvFBARd7YIRxYw9suA3+ucdN/TuC+Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620029; c=relaxed/simple;
	bh=gWij/TH8QPr+IwLvH0/2/fUh1RCAU2KJ3dVcD1USFIU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uY7gw4oGKQQhScaSIqvcHTJnkbRLE8mDiy9DEOZMJVAGN2fyjjeMsMnB46Lgglu0rlgeVSyhNtg/12IHeqsVTqt14gLVdWoXkuqjkjeVFZkgJUZBa+BHv6CkbKv+BHtlAmg4rtg0zktXeC7NDoFi9+TGHA1Yp7LeBAf6D1aYGB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JS6heE0f; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JS6heE0f"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56373f07265so35221e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 09:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769620026; cv=none;
        d=google.com; s=arc-20240605;
        b=CPrh4uMLHrZPmevtOsTDrDGh6i9/GSdwKlUy8sut8gKXKD3K5TGkIo7tY+nC2rPyIC
         xTvPP4t8Zo9Wn+LKmJrvgvg2IZCmE6FCoCXL3uOgwVCG9kK3mJf4uMCbykg33SpH7bdo
         Ub26vNBTdvLnm8eATjAA+h9ZYB+nK+/T1frRE0v7yvZqgLf2Ud9djO0zVBrDkpYF8DXq
         23csq8FUB4tJmB/LH/phj1vTh5me4oupL8B3xrfokC1tlSjw9ijPO6HZR86kY/bVGjYz
         7Di5c1+npSXGn+yTIt09hCeDDgIE4VlQMDHV0tnN3NYhcgXPHa2+ladOWE6XRaQuWwMi
         Kd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=hQ2ByvmYGALpHjwu0udZOzYr4BMUegwRg7Tc5bSaMn8=;
        fh=v12ApOGwj+uUHCNOwOEyHqS3dkVvJGmYEeJOfwmdhYM=;
        b=KCNQ1EvJsppeTbqupUIhsqGN3QdHV/jifDrOaHPaD2Ymbahs9w7H5mJXBSqfkLeaHR
         pZjC0C5x9RRuVN5H25rACta+4NSlTP9xXGkiTVp6uM9H6lE7QfbK7OpGE7oqB2y3ww6E
         nw7q44BChrYKBeUYAjucvUigfuc6FtuMXX80HMMoljYmuxslXvxpJZ0n2uaDkqhVRMIY
         8zehVmwcwvE5CNBeg9Ko+8IHhS+RE48p1qa3EiUI0WecTKqjFMsFLFDS572Y4RIb2u6U
         5Py1DNtFep/H9V5SNwPRCyjEo4rD4MSsOgID/DOHAP2VkTkGQivanhsAiV693sliO3yb
         PwTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769620026; x=1770224826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ2ByvmYGALpHjwu0udZOzYr4BMUegwRg7Tc5bSaMn8=;
        b=JS6heE0f4DJMjmBufL78cbbgFc3tXStJhNFZSB7w4D9RdPaRft+59kETp8NXqy5eUt
         yyFGbrPcnCIu3T8hdoXRzuOcfjZkVPjeFrWbcvcFDog9qna8n7ZOYof0xtFYSrPFoTXn
         E57qAMjQVF/kXr6sC18641QtVgsvERg7ITeS7cJEoCvRUbyfuyONLK5OEtiU/w5Z4/ji
         q5HHLFaqIXmT7ti9vqgri4WtDeIor8DY1O1Vb2NJ8rLb8RYbfhTAo1n4Y3g8gDMxQ1m3
         BU/xtpMdz0FfsuubtAJHCoPo+wFYo5VJ/FUR8l0E+RAot+qNqZKUOUEZni16PEhrbaYS
         EcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620026; x=1770224826;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQ2ByvmYGALpHjwu0udZOzYr4BMUegwRg7Tc5bSaMn8=;
        b=WNo64R/OOHZX0BEqjAIgx6rqKkALlM8kIAl3ObfaRXRy6xdYy+gXDG9S0bccSbwpDU
         IOOL9w7I8557FhuRhjTGSdlyRNT+HjQbnQOyTzwHdqnARC6dhE52HfH6Vm1VmzbSPxxg
         ErfJ4VGPuiYUakDbBZYGR1PTUiQNTU15Vw3TVnIYlofVUOKgRafJJeb2P1sD1GK/UzHD
         nY8JjhXq3fQHTm2/6ZJdozgDyFPvy+IJl52hFFR7qHSykffCG11hPSBu04dgG4tqDJ7+
         J2qBWEblJZQsAyYACefW9+kkjTJyxFLE0hgQjwFNo19XZz2LN3G4EVCAdsrYg5wLdhN4
         EkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjvSj5u6UkGQVoRJPwjcoq4lwrmuHcAy63NU/661/1DheyelPRtf7J3AGi7Y4KylUefxVD/uJ9Bxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3j/cIY/ghh8FPQpNK3lkhnWTYwID8ZVQMMzYCQ0Q0TjG5KyJz
	EOr1Q7tUF/IJy0gpJidrA/4SDUzfrQEmtJ4q1u+Ppx4TyB5mh8D/ZNYFGGUgrNUB0KUBkSFs4u1
	+2M3vQhKiY5CuAY7azaSKHXYW/YjezuFMxJO0yQAG
X-Gm-Gg: AZuq6aK3tq+CMKJTtOQt9aEaW7L7C/J7fQ3yDpPPl7TazkZavN2uz/RjcTS+x6lE+Ec
	S3LS4wAUBmRfUCrwFYZ2MU7QMJtKL/iPNN+k9TRd6nxGGlAMQfIfcNJXFNnwfLhfbW2uUs9Wwq2
	Oh4Y2Ld0FskrFn/BrV5/MtbEkKDZvsRIltVgnLi3Qi/Jl8sGhQa1P3vC3igJ8gJcSCeSCTyu6+8
	Oy/V6t/uSKtQwTAIJoonpy59qjDVNiEfU2bAhdu+yeVTGhDIsYSP6XGFMEPka5AvUqQRBojagJs
	fZG/fVSxHvnP/9/1QhhHbtmct+1tlg1N87Rx
X-Received: by 2002:a05:6122:ca5:b0:54a:992c:815e with SMTP id
 71dfb90a1353d-56679502f80mr1751301e0c.8.1769620025275; Wed, 28 Jan 2026
 09:07:05 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 09:07:04 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 09:07:04 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ab3f297e-44d5-4f42-aa17-f2e7c135580e@linux.intel.com>
References: <cover.1760731772.git.ackerleytng@google.com> <638600e19c6e23959bad60cf61582f387dff6445.1760731772.git.ackerleytng@google.com>
 <ab3f297e-44d5-4f42-aa17-f2e7c135580e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Jan 2026 09:07:04 -0800
X-Gm-Features: AZwV_QhaOE_wJlLL_hX7tpT0otF_GVqIj23tN-vGGdhqYGAPjKuSGPxvod54AXo
Message-ID: <CAEvNRgEo2UZ63uv0F7Pv8VfeJipyu82b=Rgiz2gnttdRu9aEPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/37] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: cgroups@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, akpm@linux-foundation.org, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chenhuacai@kernel.org, corbet@lwn.net, dave.hansen@intel.com, 
	dave.hansen@linux.intel.com, david@redhat.com, dmatlack@google.com, 
	erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, haibo1.xu@intel.com, 
	hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com, hughd@google.com, 
	ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, 
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, qperret@google.com, 
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org, seanjc@google.com, 
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 10/18/2025 4:11 AM, Ackerley Tng wrote:
> [...]
>>
>> +static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 fl=
ags)
>> +{
>> +	struct gmem_inode *gi =3D GMEM_I(inode);
>> +	MA_STATE(mas, &gi->attributes, 0, (size >> PAGE_SHIFT) - 1);
>> +	u64 attrs;
>> +	int r;
>> +
>> +	inode->i_op =3D &kvm_gmem_iops;
>> +	inode->i_mapping->a_ops =3D &kvm_gmem_aops;
>> +	inode->i_mode |=3D S_IFREG;
>> +	inode->i_size =3D size;
>> +	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
>> +	mapping_set_inaccessible(inode->i_mapping);
>> +	/* Unmovable mappings are supposed to be marked unevictable as well. *=
/
> AS_UNMOVABLE has been removed and got merged into AS_INACCESSIBLE, not su=
re if
> it's better to use "Inaccessible" instead of "Unmovable"
>

Thanks, will update comment as follows:

	/*
	 * guest_memfd memory is not migratable or swappable - set
         * inaccessible to gate off both.
	 */
	mapping_set_inaccessible(inode->i_mapping);
	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));

>> +	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>> +
>> +	gi->flags =3D flags;
>> +
>> +	mt_set_external_lock(&gi->attributes,
>> +			     &inode->i_mapping->invalidate_lock);
>> +
>> +	/*
>> +	 * Store default attributes for the entire gmem instance. Ensuring eve=
ry
>> +	 * index is represented in the maple tree at all times simplifies the
>> +	 * conversion and merging logic.
>> +	 */
>> +	attrs =3D gi->flags & GUEST_MEMFD_FLAG_INIT_SHARED ? 0 : KVM_MEMORY_AT=
TRIBUTE_PRIVATE;
>> +
>> +	/*
>> +	 * Acquire the invalidation lock purely to make lockdep happy. There
>> +	 * should be no races at this time since the inode hasn't yet been ful=
ly
>> +	 * created.
>> +	 */
>> +	filemap_invalidate_lock(inode->i_mapping);
>> +	r =3D mas_store_gfp(&mas, xa_mk_value(attrs), GFP_KERNEL);
>> +	filemap_invalidate_unlock(inode->i_mapping);
>> +
>> +	return r;
>> +}
>> +
> [...]
>> @@ -925,13 +986,39 @@ static struct inode *kvm_gmem_alloc_inode(struct s=
uper_block *sb)
>>
>>   	mpol_shared_policy_init(&gi->policy, NULL);
>>
>> +	/*
>> +	 * Memory attributes are protected the filemap invalidation lock, but
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 protected by

Thanks!

>> +	 * the lock structure isn't available at this time.  Immediately mark
>> +	 * maple tree as using external locking so that accessing the tree
>> +	 * before its fully initialized results in NULL pointer dereferences
>> +	 * and not more subtle bugs.
>> +	 */
>> +	mt_init_flags(&gi->attributes, MT_FLAGS_LOCK_EXTERN);
>> +
>>   	gi->flags =3D 0;
>>   	return &gi->vfs_inode;
>>   }
>>
>>   static void kvm_gmem_destroy_inode(struct inode *inode)
>>   {
>> -	mpol_free_shared_policy(&GMEM_I(inode)->policy);
>> +	struct gmem_inode *gi =3D GMEM_I(inode);
>> +
>> +	mpol_free_shared_policy(&gi->policy);
>> +
>> +	/*
>> +	 * Note!  Checking for an empty tree is functionally necessary to avoi=
d
>> +	 * explosions if the tree hasn't been initialized, i.e. if the inode i=
s
>
> It makes sense to skip __mt_destroy() when mtree is empty.
> But what explosions it could trigger if mtree is empty?
> It seems __mt_destroy() can handle the case if the external lock is not s=
et.
>
>

Hope this updated comment clarify the explosion:

	/*
	 * Note!  Checking for an empty tree is functionally necessary
	 * to avoid explosions if the tree hasn't been fully
	 * initialized, i.e. if the inode is being destroyed before
	 * guest_memfd can set the external lock, lockdep would find
	 * that the tree's internal ma_lock was not held.
	 */

>> +	 * being destroyed before guest_memfd can set the external lock.
>> +	 */
>> +	if (!mtree_empty(&gi->attributes)) {
>> +		/*
>> +		 * Acquire the invalidation lock purely to make lockdep happy,
>> +		 * the inode is unreachable at this point.
>> +		 */
>> +		filemap_invalidate_lock(inode->i_mapping);
>> +		__mt_destroy(&gi->attributes);
>> +		filemap_invalidate_unlock(inode->i_mapping);
>> +	}
>>   }
>>
>>   static void kvm_gmem_free_inode(struct inode *inode)
>> --
>> 2.51.0.858.gf9c4a03a3a-goog
