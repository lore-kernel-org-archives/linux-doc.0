Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3866F29C327
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 21:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774300528; cv=pass; b=qnfs95k+MheMF1x1UMc18pxkLc/iS1afRwGibio//uVJAsaW+xlteMaT8+OqIKzl1hp7+iqDlOg0YdrCLngsXQCrgI3HYDViRQJD8z0EkmjkNCQIQHSFBw3MlpsaifwOBIVGgQidh9w/x4bi+le7N0uG1mbMJkH6W7C6uJzqiLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774300528; c=relaxed/simple;
	bh=SND86V77+KDMJcamkZKPvEg9WAFvOkbzniGBXqw9BCs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffGl9BrOims/9vuNP5RTChC5VF0+MxywVYIGZeodtAG59j+/qili/hLiFf7zAeUM2Nq9K6J59NLrnw7HZsIxUlQBUdY/6Fw7Qu70Y6KnAlkJ06PiVDFS4a1V+tEDhlWX/nrRTJ08P/LFgXpmTqH1dXGbgtSn26nHMJeZwrBBy24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e5BleEw1; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e5BleEw1"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso301865241.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 14:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774300526; cv=none;
        d=google.com; s=arc-20240605;
        b=RGlY6llmWeiFnqa/IyQ/MEJAbFRGwCPm2JVo/8ZLuikOnCZrkiTZ4MZz2Ouse/23FC
         XWCvYpcFJV8d2HTfTa1owtBV4ftv5hN9RTnLkY2uFWVvVZIdAVpvSWocdt5YskW2ain2
         UDf9Uz3DJ9mtxktCaS7nhpSwKg85uoB3wjYFIutBh2cB7m0WUhordRkyjYdo/CPByh0N
         aJXaLocyyOx1qsIN+DlZpe18UQkg2KTpnKtuw0QEN4XmL2d0oQ0yh7lhp5FWqnEAwx+n
         g/KbW7YwzPV0xRHyOwm9ytex16alLVY+XjFl9/RdF6AxXMmZcyDE9Yg4g1weeGdyyI5z
         taJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=eOYudi6RRVXGeHCIabojBlAXxTWtuPC09s4XfPfEePE=;
        fh=5LZgDiSOrhIVbn5OUbnowqztOMMvyHRm9YTRviUyMr4=;
        b=j5X1rqPixvDbmwh0KsVB7/Ybx92jdjAO4kD+TwIaFnPsPI1YDdyQZPeNWhAw+nx/yP
         Yfox1EOykp98KKVfkVJ2QiBn/BKGaelGmiAtRGv4toflRwiqWAvPuQQV7F83s7tglau7
         kF+OJ/EfN/+Pvx0wJQuUxfsO2uIcw3/jspmxobAVUDk/noD2+Ca/xv6o9m6wc/viUJx3
         m5jSbP0TNONEQV7MA4C9M7/Z4D1blkCLiPgvyk3nO+wrqQXHFTRB7Abj5z6LjbuVSii+
         D28r0+ergNuQ4WyxRNI8+5A9NyX0ZAhyQ9s1DzPyAG5+uZV7KkcBJMaBg2p51yGSV/cq
         f0SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774300526; x=1774905326; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOYudi6RRVXGeHCIabojBlAXxTWtuPC09s4XfPfEePE=;
        b=e5BleEw1glLMBlDV2mvho8od6v7OE1TjBT7o7AcHJnucjQrQWcUYXIdXiPs2ytNyEc
         XG1vRRvI/IsGhJsmEcWSE+GO0sHOq3Mo9ISsD2XiWpQsYKBdEzG2HBv04x1LqbftNuNC
         B+/mmBGPP4fJ2rSUFr6QFtBDSuY6kC8pOlVTU/qay6AxjoYIuXPhs8hPFgE9sUEj4Jmw
         goya+iq/Ov9bBOgINMsbxo53m4vaJ41fFTGsgblNYf+BnVNC6l4EBVFo3cDqpVHiYGsP
         NxvgITmNr8giRkhx6NNHj6OxvwI0watCuxzo79rMpSbmKYZHwNg+n8GplWuw0P+bZy2O
         MdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774300526; x=1774905326;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOYudi6RRVXGeHCIabojBlAXxTWtuPC09s4XfPfEePE=;
        b=Zzvg8aVTa1GbCIPGw+SARLYI8J5m8VZHUAjZJa8XDiFYZCBBdC7mMGPZJHjWmQFgN9
         al3DKLmI2R+bwojTG831UA8+6Lc1JaR90k+u1nlAxVdE2KpuzYhOTp9UG3fnUV2DfFci
         AGwrRA4KVTvYB3gy9nvr4UVvNznWtxRkB1ABMYdh/PTxHF7jGh2lmKIumyjYUyJGIdaw
         24Dz8pd+oobml1w4IrtMhq7l63IKMQvrogJ+j+XSwpjR8PpghrwqRJlnvsfVWDXwPgWu
         q94eVSUHxrnfg5VWgV7OcNugzPhJUWc8hb4RfvTefDyfe5nI/Fz++t71HJQSSM6G+5bz
         M/0g==
X-Forwarded-Encrypted: i=1; AJvYcCUc40sgmqIhsMV7ph4FBMQ76FQohsE5ns8FFUBb+mIB5I6CiVushH1bvEhdltDQAXMQ/lLz6F4btEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTcf+w2hz4Qss+nbDFw6D6Mtkr/M6b1tBCpD9C+M/AyxHZ/lOq
	fji1xH4xyU6Tqb7BDQ+NSnjLZNH1KlFiNmrkZZ4SDPiC3iDTu9CIOkY75hVwFTGDfJxfuL09Dvq
	pYBBOKzj3AKJkTELWhGZMVE0FizDf+iyi6NFcHb6D
X-Gm-Gg: ATEYQzxtezGZTtlVxcF0VxPQss4k4XHyiArVMmHkr+v+g1ZRwJgngwrPhmKNopbANce
	IPXEzov6Uhi9xO0OVMeyIWj9vM+oXhfIPtd/JpU67K4IGA+YcZtbGvZMFIw3wPr3ppfc3KfXo38
	h4hhHn7fFPmDLmZCqWcVwjXXYVWO5lmr1u9fpMHgtX9s+WPRZ48wVwemY3k4DcFk1aAhljoimoc
	Zmum88CfQvD61RgCcUQLBuv0mUSluXZtcj/nHJYK/aOPEtVZ30PkVTGwX4CCYC1oOc9fHV/8GiZ
	koerLr478ZQmAZIT073dEkZrLZeasYEyIIyXyNEnCwVTJ7J9k+mqs9TxxUCYP6hBfVghkA==
X-Received: by 2002:a05:6102:c86:b0:602:8894:b770 with SMTP id
 ada2fe7eead31-602aead01admr6510052137.4.1774300525553; Mon, 23 Mar 2026
 14:15:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 14:15:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 14:15:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260317141031.514-11-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com> <20260317141031.514-11-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 14:15:24 -0700
X-Gm-Features: AQROBzCF2PwLv08LGPIvZtVRv2cQA-zzDMITL8yo-SXZFcfoxiXCsTVqhJQCkhk
Message-ID: <CAEvNRgGb95C3uRxPy2_Uj7SmTW45hNNdJxi5RR209s5KYcHgBw@mail.gmail.com>
Subject: Re: [PATCH v11 10/16] KVM: guest_memfd: Add flag to remove from
 direct map
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, 
	"prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, 
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, 
	"gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, 
	"jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, 
	"osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org" <pavel@kernel.org>, 
	"rafael@kernel.org" <rafael@kernel.org>, "vannapurve@google.com" <vannapurve@google.com>, 
	"jackmanb@google.com" <jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, 
	"Itazuri, Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
Content-Type: text/plain; charset="UTF-8"

"Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:

>
> [...snip...]
>
>  static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>  {
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	struct folio *folio;
>  	vm_fault_t ret = VM_FAULT_LOCKED;
> +	int err;
>
>  	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
>  		return VM_FAULT_SIGBUS;
> @@ -418,6 +454,14 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>  		folio_mark_uptodate(folio);
>  	}
>
> +	if (kvm_gmem_no_direct_map(folio_inode(folio))) {
> +		err = kvm_gmem_folio_zap_direct_map(folio);
> +		if (err) {
> +			ret = vmf_error(err);
> +			goto out_folio;
> +		}
> +	}
> +
>  	vmf->page = folio_file_page(folio, vmf->pgoff);
>

Sashiko pointed out that kvm_gmem_populate() might try and write to
direct-map-removed folios, but I think that's handled because populate
will first try and GUP folios, which is already blocked for
direct-map-removed folios.

>  out_folio:
> @@ -528,6 +572,9 @@ static void kvm_gmem_free_folio(struct folio *folio)
>  	kvm_pfn_t pfn = page_to_pfn(page);
>  	int order = folio_order(folio);
>
> +	if (kvm_gmem_folio_no_direct_map(folio))
> +		kvm_gmem_folio_restore_direct_map(folio);
> +
>  	kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
>  }
>

Sashiko says to invalidate then restore direct map, I think in this case
it doesn't matter since if the folio needed invalidation, it must be
private, and the host shouldn't be writing to the private pages anyway.

One benefit of retaining this order (restore, invalidate) is that it
opens the invalidate hook to possibly do something regarding memory
contents?

Or perhaps we should just take the suggestion (invalidate, restore) and
align that invalidate should not touch memory contents.

> @@ -591,6 +638,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>  	/* Unmovable mappings are supposed to be marked unevictable as well. */
>  	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>
> +	if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)
> +		mapping_set_no_direct_map(inode->i_mapping);
> +
>  	GMEM_I(inode)->flags = flags;
>
>  	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
> @@ -803,13 +853,22 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	}
>
>  	r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
> +	if (r)
> +		goto out_unlock;
>
> +	if (kvm_gmem_no_direct_map(folio_inode(folio))) {
> +		r = kvm_gmem_folio_zap_direct_map(folio);
> +		if (r)
> +			goto out_unlock;
> +	}
> +
>
> [...snip...]
>

Preparing a folio used to involve zeroing, but that has since been
refactored out, so I believe zapping can come before preparing.

Similar to the above point on invalidation: perhaps we should take the
suggestion to zap then prepare

+ And align that preparation should not touch memory contents
+ Avoid needing to undo the preparation on zapping failure (.free_folio
  is not called on folio_put(), it is only called folio on removal from
  filemap).
