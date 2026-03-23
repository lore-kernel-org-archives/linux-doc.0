Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215683E316E
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298840; cv=pass; b=gB1oNxjV/AMhPdmZhaukAYZHBiOLNszNFhPDpqsj6kn+pddGIHkWQpq2fD/osdVVG/xVPADrQsQVh4EdmJvJYylb0O7WvO9iZuL8QqDM0hGghaBgp3RAwX5lzXI0tVPd2mR/dsBTwxFBCRYoalMr9PuCAveTkeqkrXfMbcNuMxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298840; c=relaxed/simple;
	bh=ng8E7qGgSHJkqBGRw/Py1ZjqtkBoNDU8zfEyX/fQOz4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rezbojhmSv81BLI1FmeEbvt0T7DAazv2Y1YIuQuuu9U4kw88Y6V3wWo963UTFbEzbaMVKMALH8So0eHTq1cBWV7X8J/EJ3Tf40NOKMpzlIAbbjbHgVr/D6pTDUH9WRY6M/2sySLB4Xdf8uUitph1JPidsrzw9nmTRJT81JziHw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E1Qx3iXY; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E1Qx3iXY"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso289644241.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 13:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774298837; cv=none;
        d=google.com; s=arc-20240605;
        b=ifrrztAP+O0Y++r8XpClTIHc3f/1xc8AaXB9MRRZpU6lMvx/WTTo5JdOX1Bew+hWtT
         dPRZKBVp9WpklhJx5Zn8Q5hNDybbAqPVN+GNifPW2JZpl1xxEMC9ajlHzuuPbjXkkKlb
         nL4JmESzv3rcNwEmQ0UVLGB45cPGApIwV8oGVWzJYfqkR9CreWbFWfcPXQS6zTghSPN/
         WHHohSI/6W6wfSkymKFi2iPvKDoUhvzzJfAGtps2q+K3aXtY8y92Stl51N69J1hkvW+f
         uUJ4/ppXt3tWgCgM1MvZn46h/ylVZq7lVOMkoz399pv2K0JEHbM6xYSSKRll80A6slly
         HSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=yac1rrBqJSF3O+e4IwcngZ2ptSQxNGOfPE9KG9sOce8=;
        fh=TQxWhmD4eDYdHvkeEsxoQcuRJmThFUQJrlRjtAk8wKA=;
        b=fAdzzlO/zMkyjbfWzeN8nc9+5memGV1hJ1pWr4RItopHB0mtewAie4zBm69S6CkC8G
         /y3YxWPteAHu+np7cPW2SOe1a3+EI35MHXIXpY+ymq0FHY3G37gLlH1Q1II2Mxj0nu48
         2yAeRAStL5iHEbCv6Xd97w8QI01E8MT+yOjNih95y2m1Rg4NMlW1DHqVbpk7fiaHJarM
         CGYelhzK/OSl9o3D93XGpE9lNZCbLQX18f9rOU+HoRxbPRENWjAjCu+omsTrGzRy2old
         H+XkJh2BLmTUUE5/U9YVY8pbhd/v+j0oeeL8UyqoAFzqjxigb9NCKseqTUgqSBursBFE
         iQBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774298837; x=1774903637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yac1rrBqJSF3O+e4IwcngZ2ptSQxNGOfPE9KG9sOce8=;
        b=E1Qx3iXYbuupJnhq0qmrXOl7xt+HGwZNfjstgxkLHfdyrCo56F2W1QOU+bkULeFtnS
         mZauXctACK+epA2LTP0W/PJM5VIH0WgdMtO5ECotn7uX8U9322NLx89gBnpVxEtqTPkT
         gNORVJmcQgMN7jMlaRWbTr5b2UutJroR2HV64bR2inaJgq4H4ZOOFRsAsV1zO9tX0N9T
         ryaOxYjm8R4VaU87SJuclOeIz9mU75ow6GpAn4wrEG81ftM6GfQNsn0JrX7tSYEvvF3l
         UZWkVEwCPpk26oroiFl1EZbcHqw2YV8uEVKl+PSDW2bHEEJNL7fvUL/LGywspaPKJb6t
         k5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774298837; x=1774903637;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yac1rrBqJSF3O+e4IwcngZ2ptSQxNGOfPE9KG9sOce8=;
        b=RmPD7MGZFg0jPwunt0biJX5+NYjg2vLNL14+cFu7ZAyXVWMscDmjipS5LKM4GCL3+s
         RqXzomCMzkyXmuBZziGxDdP6GbT6AfNyzYwjzlRFuZ9+ngvZMrlIeHQC6Bh0/Fdyvcd/
         oRt0UJQy92i/LNloagXko/pEpR0+F8HDdgw4QqWQSpO5dF1URS4EuJQrUFjFsUAPgKlr
         KM4mRNi9ht2h21y+y00OoIOyugwwNRJijctYqFEHuWTzSyT4rdCu0PiDvmo74HeN7rEa
         mkoKQo4uFJxVm75f1mDta4ZxNK5ylsA0nSMuUUOYhhYW3/ct00HKeud4taO1pNsX6ael
         8jbA==
X-Forwarded-Encrypted: i=1; AJvYcCU2tEQaTo9KauhEO6Njg61caMq6usp87boniWEJUNrnoNuIeFAIZeyJEEcG6hBAFYAsdR12Rz5Ev0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjeM6isbW6p3KaST9df3wd1PiwcK028ecmBt0yGqUFuT3jQG46
	Ecbi2okth+YRrwaDqtU70IHcAfh++xb5yh9CRgEtSzutNLwQTzc99F0YFpV39KYOa9VLKePn34z
	Jkt/0Zt8EDvfQ4Y9qd3U0q4Y5xEG7Z0FddlWE1JyS
X-Gm-Gg: ATEYQzxpiM91SHNjCMgOGkV2CNTO0cKvrl419u33XzdixStzKXA8/2DSuZ4rZvGApUp
	U6azHHbi7uSpqyTu9Ynn+0+X/CQbJHfCuvNBUVR/XBVsWyd4gnPyqWQ53nkDxxT1puiE6WcpVFv
	7fbwuPZ/ZGMSdlWTTi93NTr3d5JAAPuK/v6kcZ8WV1xj4UQZaEsZwj5ou4s+4+zs3Wt6vRWkbFt
	1rfM0AvFr4zA8d5uOE9GcjBp1ana59vwnOowtp1HGlpg/H5UThKgX0KFOJGvGe4lA6p3B/vPJsn
	H3J3TFfNB5WXLdF3BBuOHSTn32HBBUuARLruPo4GaQK8SPI6XqIWPjptvMI7qvHpyZ2aMQ==
X-Received: by 2002:a05:6102:4a86:b0:5ef:ac78:3c77 with SMTP id
 ada2fe7eead31-602aecd2a05mr6404753137.18.1774298836454; Mon, 23 Mar 2026
 13:47:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 13:47:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 13:47:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <50bfaeb5-551e-403f-bd00-a7d8b6bbf6e2@kernel.org>
References: <20260317141031.514-1-kalyazin@amazon.com> <20260317141031.514-11-kalyazin@amazon.com>
 <50bfaeb5-551e-403f-bd00-a7d8b6bbf6e2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 13:47:15 -0700
X-Gm-Features: AQROBzB7NM0e-Hubu0XRJL2ihJNatUocmuhRQlqLx8a7dgTL41taW0scozymRvQ
Message-ID: <CAEvNRgEXp6busURR20cazeG2DQWdU5=ZaJv21OcSq+mhVKwJ4g@mail.gmail.com>
Subject: Re: [PATCH v11 10/16] KVM: guest_memfd: Add flag to remove from
 direct map
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
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
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
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

"David Hildenbrand (Arm)" <david@kernel.org> writes:

>
> [...snip...]
>
>> +static int kvm_gmem_folio_zap_direct_map(struct folio *folio)
>> +{
>> +	u64 gmem_flags = GMEM_I(folio_inode(folio))->flags;
>> +	int r = 0;
>> +
>> +	if (kvm_gmem_folio_no_direct_map(folio) || !(gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP))
>
> The function is only called when
>
> 	kvm_gmem_no_direct_map(folio_inode(folio))
>
> Does it really make sense to check for GUEST_MEMFD_FLAG_NO_DIRECT_MAP again?
>

Good point that GUEST_MEMFD_FLAG_NO_DIRECT_MAP was already checked in
the caller. I think we can drop this second check.

> If, at all, it should be a warning if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is
> not set?
>
> Further, kvm_gmem_folio_zap_direct_map() uses the folio lock to
> synchronize, right? Might be worth pointing that out somehow (e.g.,
> lockdep check if possible).
>
>> +		goto out;
>> +
>> +	r = folio_zap_direct_map(folio);
>> +	if (!r)
>> +		folio->private = (void *)((u64)folio->private | KVM_GMEM_FOLIO_NO_DIRECT_MAP);
>> +
>> +out:
>> +	return r;
>> +}
>> +
>> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
>> +{
>
> kvm_gmem_folio_zap_direct_map() is allowed to be called on folios that
> already have the directmap remove, kvm_gmem_folio_restore_direct_map()
> cannot be called if the directmap was already restored.
>

This inconsistency was probably introduced by my comments [1] (sorry!)

I think the inconsistency here is mostly because
kvm_gmem_folio_zap_direct_map() is called from two places but restore is
only called from one place :P

[1] https://lore.kernel.org/all/CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com/

> Should we make that more consistent?
>
>
> Hoping Sean can find some time to review
>
> --
> Cheers,
>
> David
