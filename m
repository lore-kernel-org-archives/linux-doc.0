Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A89314D06
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291567; cv=pass; b=UwbDZQ/EspKX03Sz6e4qn4A/g3b9jkF1Uf/Ubs5K0QNe1oP81C2uUhDTfxfvQ8k+095dnlBOjxAj1STr5za7xODx8oWImFTjXJ6bBWIDWNm+NEgWZy2nBKZrYU6XRhpayg4KsKH8FJv0gwtYjwoJGee4qzhTlvHZUBu7vAFKjMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291567; c=relaxed/simple;
	bh=s+RmDqI+TsxZ+2VgJOew5FS3wS8MDadFq7MLa6vXhF0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnwPtJ3cQyc7XQOwYtNnx5jWBzioJl55v1AjJJuskEdhRTWn7Dcyr5ZKZ2eDG8lFNfOmEMns/zhtesr11InyPmLjKicc5i/PhF7ofcsRM2ATOZaT/Y6iE8rqpdyCeuDt280V9TNOfxqyh+eGzeP59ye4CSu9EI6076fYyGZ+oK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vPOleV2z; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vPOleV2z"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5fff77ff719so327286137.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 11:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774291564; cv=none;
        d=google.com; s=arc-20240605;
        b=a5/BDacBZZYKyP20GxDAaApJQ+XQ3twqVV/rkWJ1WOyGJcpFgrjKpSf45NbvKzjT0j
         MUMl3Uv8HQ2Er08G6SsOvAjIQbfixI5c/iDW7nxHyXqjW0skLDehOjrVdjI2fGrGWGZ6
         ztW9Cmi0nMx3tiYtatMDN4q9jG90PX42Smzi0wNuV8ImMjDpppo6UZbXIhfyJIuyhLp2
         +9xStQ0qoeWwdfeHxLSo+UA9VUk6NXfbD0mW/NcguLpUbVl+4u5g+FlQzQ9h6m2H0fjv
         /fVE5EispI+XRyTDLLNZ3LJlOCe3eGBINP9En0NUYDTfuk64DWsF/Er3e6ScPOs+4imB
         sRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xr0QXHWwKEApSlK6QljqZmiVGPlsHc0lfppFGa1RJnk=;
        fh=wpiA3Cajz41jroIaY+4rYZ+uu/lNiWwyTSQ4ytXgSaU=;
        b=OdRYJFdt8Im/Vj2QToPbpp+M25hr4yxQJp7zNCejOMNakfE6xfrRx0LbvMkzQjlzv0
         7FuXijfbv5G24lHv1vcnd6leI3xhAw1Kq+dTCgkamBhoIpz2D48eHkc/uCUIG6OSsMaE
         RGkEu5l0vdFO3uLzS2o6f24E3OWdaGa3Nej5yOwl2kN264OKPjmkP+n40fy1yYxtNKBl
         GLWCX54dVivfjot247B1tb9T7U/F7MmEbdkUpFbmMxTmIw+zbPYOkEyoCMS7nj+d/xlY
         /lrnDNWBUHI8ojaGrxprZ29wy4wdsZ2Q3ecItptm9gqj9+wfEnDnjZ0RztlHInSL2mVG
         9ctA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774291564; x=1774896364; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xr0QXHWwKEApSlK6QljqZmiVGPlsHc0lfppFGa1RJnk=;
        b=vPOleV2zGY8OBGxA3efRkv8jcLPxrM4fnjs9NKftkybWve4Vj9ubgZfSzf0yIMxjsH
         q0EbVlrkdVCyqQrJRXNHpSxBYvTFJ/XQaNlYVkOEdeOo1kif9egbkhAnPHIeGiT9jS7O
         6V10B5R4TSHVae04PNPQUiBhB99us/JmvvLnlPZUkf5cHVMCmh8wSdtoMPjYGr/SQsp/
         MDUPEJbGdDimb+Jw6capZeBDBldbucXV84h8vRjUUkMRYry8AS8RaweT+Tz/Z0LqIjYb
         M1Ke+BtIl4404To6EledIl8n42DqmEDSLyxjRdrWckKT/i+UskywAJfK7IfaQrN+9Lp+
         QNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774291564; x=1774896364;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xr0QXHWwKEApSlK6QljqZmiVGPlsHc0lfppFGa1RJnk=;
        b=AQgcUTVt4pmNGlWadCTFpbMyzpiOIl/1u1kAYfxknGJXRS3Zp7ijQRitFtLcRps82I
         6qTKT4lonnb8BSvyyKQBlufTAKwnocPXsTDeGOXLVx2udj8rkde+jns4oFj29jdogvNO
         HoRtKi5R5MUHzB/KPqx6ChHuR80mKOOvdwwyZNG33WsTaQyGE1GK0qKj9IvGt8OZqErd
         as6FVF+Wvm8mia4OR1g1O72SEp9Jz+TFBmaeK5l+wujMfkTRMHJe7IQMctsC46521JZF
         ZOgHrjvUqyn06EcUNCBxS4/58tjTVCJD4hC/cbgGrj0Hhss62KDNctKH5rIU8pAjJf6I
         EgWg==
X-Forwarded-Encrypted: i=1; AJvYcCWArJK/BWtFkSFyO3SH0Nsl5xiS8H1sobkeAvqcj9qS7neFHl0VQJTEzS9F5GxnSRazRlOJYjTQsGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyocVqNgjfP9A5rFD8UcsvjLf8qqhJ2q7yDGwCCymjkW3oEgMnt
	bNtE0l6mjTXn7mZjk7VX2fVIvzn7lbpADYa3d+MjoUANdvyp9yOtg4nCueSjBaxaw4iV3pvG4ns
	ljwWaBP/4nhIyZdW22ZoR6RBDT7Or7nPSXoYbyWvy
X-Gm-Gg: ATEYQzyJ1w2CDAKThRFupXnXFtE5ldwf/IQ9lE5q04ZjDYbp19b7ALdq++bUboox98w
	/ljCmf+Mnzykh5nQwH1yXeWCqTG65Y/4RlbtE1+kqBaGoby9DEggzuraoryj0BKDiRHg7JvApSQ
	CImP0Tm5pwC0eqsLle/yR+nNTKQ4wD/CcuESDeJGed6rFxo+kr22/GCyFU8mlcA9ZPexSr2/PhU
	xOifa+88coQpbtcmOOKULlh5/cLQx8vYOd8Csqor/YXjYe8pxNJuJ2Cfi5PXk2WUzHNY5AY+sgU
	rhoP2s6aKsD9poA9A3wJ8jFTfqZJbdbO08p5LQ2ySCkod5bkSq+EJKQEK07Qzi4CfWXKcQ==
X-Received: by 2002:a05:6102:1610:b0:5ef:8ae:85a5 with SMTP id
 ada2fe7eead31-602aeb231f5mr7205779137.16.1774291563158; Mon, 23 Mar 2026
 11:46:03 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 11:46:02 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 11:46:02 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260317141031.514-4-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com> <20260317141031.514-4-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 11:46:02 -0700
X-Gm-Features: AQROBzCRQmL2CFh0hL8G9T_h4E5mqLNycY6Q5fv3k8u-7tLVQqZDWt6l_fOQ864
Message-ID: <CAEvNRgEBdi49ZkfGo0xmM+J1yzKOzfT2ThAXEN=S0j7vC7Fu3w@mail.gmail.com>
Subject: Re: [PATCH v11 03/16] mm/secretmem: make use of folio_{zap,restore}_direct_map
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

> From: Nikita Kalyazin <kalyazin@amazon.com>
>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  mm/secretmem.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index fd29b33c6764..27b176af8fc4 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -53,7 +53,6 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	pgoff_t offset = vmf->pgoff;
>  	gfp_t gfp = vmf->gfp_mask;
> -	unsigned long addr;
>  	struct folio *folio;
>  	vm_fault_t ret;
>  	int err;
> @@ -72,7 +71,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  			goto out;
>  		}
>
> -		err = set_direct_map_invalid_noflush(folio_address(folio));
> +		err = folio_zap_direct_map(folio);
>  		if (err) {
>  			folio_put(folio);
>  			ret = vmf_error(err);
> @@ -87,7 +86,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  			 * already happened when we marked the page invalid
>  			 * which guarantees that this call won't fail
>  			 */
> -			set_direct_map_default_noflush(folio_address(folio));
> +			folio_restore_direct_map(folio);
>  			folio_put(folio);
>  			if (err == -EEXIST)
>  				goto retry;
> @@ -95,9 +94,6 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  			ret = vmf_error(err);
>  			goto out;
>  		}
> -
> -		addr = (unsigned long)folio_address(folio);
> -		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  	}
>
>  	vmf->page = folio_file_page(folio, vmf->pgoff);
> --
> 2.50.1

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
