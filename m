Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19EE2F4A0C
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291416; cv=pass; b=E3cKyB24dvMWAPm+1HA4weDVWziCHVaNubYaI03oz/UKS4E6RAYkqrLBV/v/hXDAwwiJ3AX+iQztkUlLWCeC6Mtkh0Gb3TO+KrkApIddQRGyn0EoI52Nn3MeHn8Ay7525NB/bW1LEslaa8LMnTmVGbAYLI1KiVNBzdcKBVn2pLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291416; c=relaxed/simple;
	bh=8iR09lTQ4Edfh1UQkmolcFNIjMuLzSLKVF5JEj/9nwQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkYUhvRKChiCZzaAvBqKA3Ka05geBJgnCZGGvmIbxer6y3qOxbmjfOEuyC108Ha8NlprujmYBPjtt0G6NvGWXBA05ysF/GTuK/yDXr2xphVOAPco3C3UFJASza14Nm2ZPnHuPSwb9T59/r2+muVjDpzXG2Z67q4dhY66k9jVSzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BFE/MqnH; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BFE/MqnH"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so1895964e0c.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 11:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774291413; cv=none;
        d=google.com; s=arc-20240605;
        b=RjC288RGxZm/FlPGnxTMv72ISAgKLhHK5FTQmPAIE6wkhbadbjPmkzKNM5zV4wpgFk
         nH36B04onzARdMLW15ChVTSg6tp8XgNXljZBYudSxjRbx/H8dhZfX1OFlCH0s0TU3XLS
         SC3Ob97akm75yr1HF9fyfCTxFk3D6GnxdXXdTPCYnTjQpOn23W++OTf/eG95iLkaxKi1
         Gt17uCxiFD1ur4PND/MhlPfY1bkmHR6L9f/GiFilR0anLaz1NZS7lkVSe6N9LsICHdd5
         JMXO34TbjhFpgu9zdqGWd0Xd+HfBc1qP5zHHQ/9olsFVvCM8ij/OS7W1QRjPC8P0rk6C
         CP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jJ1uKbr2A9AcnUKDcibCUYQIsuprIaoAVD4N5Jh2tIQ=;
        fh=xIPLwqVA2NRzlQ6/2NQSt4LxSJTQJvdVnUaCgy8PGCk=;
        b=Tk06NaesTzPG98tPkkthSxBgwKe5DLSqownit8B3reyYMG0jUeKEkEP7tmDEAoa3fy
         qih42PREx+sHFRywYiKTUUo2tJcwPAbyAzappqMQxWeVndVxYq1m1vCGf8Y3/vhIlnzW
         CSLC91Lalt/UOIeMQx5/UZzGTr5nusbE8fqxAaHT6hjEWegvT+hIkyr/G3mcb3SIVo/r
         OC2lPQpMToLDdD+qv+ZkuTl6zrqBdQNX0+gVM3wILJoV/NXbzCwUXYNC8fywXHzMCKTP
         fYpVw70xPog84wbeLJ8vJBYSDuL8qXe1CIe4ezuEiEPbOSwqSAiVPEZq+wYybpTKBN8m
         OLaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774291413; x=1774896213; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ1uKbr2A9AcnUKDcibCUYQIsuprIaoAVD4N5Jh2tIQ=;
        b=BFE/MqnHyJEb2bXhOAAC42up0lIIBMrfoEaUX8sgL/fCQ+OsWy9jEUrxjg9bcJmPoy
         fFh8bXLK5ID3vOGVhKEVc7GAF51PL1t9OKV3RWP9X5s8vEosDUsRJlD3uvkHsm8gQJq2
         yLHP8cRadcr3bXcEbThsxn/zkicUhrGIYaE6OdJ72LqX74hGBAw25CKruf7r9f4qNORH
         sjBANVlN4x99JT3IOFRxsfjxUDwhL7j/ysJO/DTg5EQHHCWh0q2njy/Tk2gB0a9h0PTK
         0OzzbUqBAFPI16UIfWf3j6fxHMwr0c5rjIDHEfL9KU6Ipera8Z+VPiV3ARshGnuLrl83
         3Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774291413; x=1774896213;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJ1uKbr2A9AcnUKDcibCUYQIsuprIaoAVD4N5Jh2tIQ=;
        b=I82w5PlUFOHZVxL2oIg6wFlb/cQp3fXn81B2hDbCZoqrzvOxZ+eGBtwQNDpMfr6iy5
         WhEFDRPZLto1VEG0iCYE1FVQXsxmJ186f2Uf5vXGY1pdBIfmfYHYiuE4M+ca3BMIqPsN
         x6Kz+q4plr1w30iVw21e7yscNG41p7Bw4Xc64FAbBjXfoIdBKqGcKYK35JuaT8Zl0Pqi
         aK2Cn8BwZk644RA92+FdPd4PkiIhoIxKRwQ2ctKyVGTa3UBCH75ImCCXk9brqHau8KfB
         i+8GhszkPHVRk5ikdv91d8cDRA4epWTf24bcTj7jpRC/Tx1F6uCKUVUC28vwzVaFfTl2
         pwww==
X-Forwarded-Encrypted: i=1; AJvYcCVQDQSUAEEKzg7rEcl1+PQGt0n9n6WAZfKJ8h5LlDX/De3MjWqyrWIS0p1CTuIfX32xO4cWzbldoik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcl+HA0+oaw7rjxstTj4PyVCAvpPq2qRNvrgfQzKqAQVCVlzkJ
	2E/OncEMRw823qhCHRpmeP0VJ3/Wk8BzWK3+yPToUJNIC1T2vSQrFEDowNXOCKp4P3MTnoyxZKG
	zgK1UM0lEStSVepNSTiitTjrK831Cw4xpauZh3X3m
X-Gm-Gg: ATEYQzwAobQqwGyzrKT+OlTU92AmD3xKenYGyLYHF/hjC23gujfDL3iocTerJocFRfW
	IwRYisUHr1NdC2gHhoBd3qoKyIzMbvptN4/4I4ByLEjViZj33CSKEpTURJJCV97mZrsjf1MAKrH
	tEw3gphzoKd/o7fW+7R4Iy8z+YSEvzDWbHTUNN17MBiISmqBgNwwHZHZLCQG0XN+XTcRn5ce90+
	OPJSIpV04ht42Zdmy8MtDitmAkpVmwzhrAEt5lVyJA2+SMOJ6FTLjl+NauztTZbhLZK9lHSrtzA
	QBbFnQZ8WU3HENMNnUh5u8twLoNajUPEDTtmIANsbigC+srYEtQ5zbMG6nmG1R86rRm33g==
X-Received: by 2002:a05:6122:3c54:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56cde344094mr6273796e0c.6.1774291412097; Mon, 23 Mar 2026
 11:43:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 11:43:31 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 11:43:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260317141031.514-3-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com> <20260317141031.514-3-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 11:43:31 -0700
X-Gm-Features: AQROBzAKG1Xpk4hVDWY3sqqSXNvIKws3qrAExzeSImrnNlU_ii0wYSbiIV_SQDw
Message-ID: <CAEvNRgEFBexkZCjOMFHJRQFHOpiUezD2jbfDVFrGhYXODdpMjg@mail.gmail.com>
Subject: Re: [PATCH v11 02/16] set_memory: add folio_{zap,restore}_direct_map helpers
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
> Let's provide folio_{zap,restore}_direct_map helpers as preparation for
> supporting removal of the direct map for guest_memfd folios.
> In folio_zap_direct_map(), flush TLB to make sure the data is not
> accessible.
>
> The new helpers need to be accessible to KVM on architectures that
> support guest_memfd (x86 and arm64).
>
> Direct map removal gives guest_memfd the same protection that
> memfd_secret does, such as hardening against Spectre-like attacks
> through in-kernel gadgets.
>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  include/linux/set_memory.h | 13 ++++++++++++
>  mm/memory.c                | 42 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index 1a2563f525fc..24caea2931f9 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -41,6 +41,15 @@ static inline int set_direct_map_valid_noflush(const void *addr,
>  	return 0;
>  }
>
> +static inline int folio_zap_direct_map(struct folio *folio)
> +{
> +	return 0;
> +}
> +
> +static inline void folio_restore_direct_map(struct folio *folio)
> +{
> +}
> +
>  static inline bool kernel_page_present(struct page *page)
>  {
>  	return true;
> @@ -57,6 +66,10 @@ static inline bool can_set_direct_map(void)
>  }
>  #define can_set_direct_map can_set_direct_map
>  #endif
> +
> +int folio_zap_direct_map(struct folio *folio);
> +void folio_restore_direct_map(struct folio *folio);
> +
>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>
>  #ifdef CONFIG_X86_64
> diff --git a/mm/memory.c b/mm/memory.c
> index 07778814b4a8..cab6bb237fc0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -78,6 +78,7 @@
>  #include <linux/sched/sysctl.h>
>  #include <linux/pgalloc.h>
>  #include <linux/uaccess.h>
> +#include <linux/set_memory.h>
>
>  #include <trace/events/kmem.h>
>
> @@ -7478,3 +7479,44 @@ void vma_pgtable_walk_end(struct vm_area_struct *vma)
>  	if (is_vm_hugetlb_page(vma))
>  		hugetlb_vma_unlock_read(vma);
>  }
> +
> +#ifdef CONFIG_ARCH_HAS_SET_DIRECT_MAP
> +/**
> + * folio_zap_direct_map - remove a folio from the kernel direct map
> + * @folio: folio to remove from the direct map
> + *
> + * Removes the folio from the kernel direct map and flushes the TLB.  This may
> + * require splitting huge pages in the direct map, which can fail due to memory
> + * allocation.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int folio_zap_direct_map(struct folio *folio)
> +{
> +	const void *addr = folio_address(folio);
> +	int ret;
> +
> +	ret = set_direct_map_valid_noflush(addr, folio_nr_pages(folio), false);
> +	flush_tlb_kernel_range((unsigned long)addr,
> +			       (unsigned long)addr + folio_size(folio));
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(folio_zap_direct_map, "kvm");
> +
> +/**
> + * folio_restore_direct_map - restore the kernel direct map entry for a folio
> + * @folio: folio whose direct map entry is to be restored
> + *
> + * This may only be called after a prior successful folio_zap_direct_map() on
> + * the same folio.  Because the zap will have already split any huge pages in
> + * the direct map, restoration here only updates protection bits and cannot
> + * fail.
> + */
> +void folio_restore_direct_map(struct folio *folio)
> +{
> +	WARN_ON_ONCE(set_direct_map_valid_noflush(folio_address(folio),
> +						  folio_nr_pages(folio), true));
> +}
> +EXPORT_SYMBOL_FOR_MODULES(folio_restore_direct_map, "kvm");
> +#endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> --
> 2.50.1

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

I also took a look at Sashiko's [1] comments and I think that the
highmem folio issues should be the responsibility of the caller to
check.

[1] https://sashiko.dev/#/patchset/20260317141031.514-1-kalyazin%40amazon.com
