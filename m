Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871133803EE
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107073; cv=pass; b=lJyMKMqNBskCMsRk0VZvOj3taJELZdnR6m3StZRFqcJi5nLXNtqbS0saZ+hP+pzWNk7CiR4ges9VFon+knPxnl1JwialwwmIl9NW+NyLJXRcT71rywvIKL9W0Vo8PZEGlf7P/xJCFNdoVKnsoqeJsTaMS/JiP3Uxpf+W2O46d0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107073; c=relaxed/simple;
	bh=Rur9bSt0hgAR6phZOgAdh5Lfm4ayEbdbSjuSfNntYfo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfSQZd7JfK2+XUjpu9Jx/iwBU5iS62sqIbkF+83t2WdYmTImnkuZ8WMIrOw+/k0aSuDFdiS6a5yMjtyrUTfeyeahuLoIBd9gl8Ix2/dF7+Mx90KNLI5wBxljU+smrX2SyqCQjwR8ON6t9V2O45b+zE1yxGQ9r7QOWhB1WaQyddI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZBxrDUj6; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZBxrDUj6"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56373f07265so947537e0c.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 10:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769107060; cv=none;
        d=google.com; s=arc-20240605;
        b=ZuuHHi/E3yK+g4o2cyjxBWoElP8B469ywJBWLRjdt2Xd21+SJANGDRsfUCc6IfH8WF
         Fz4oPs6AMAF7Ees5uTbSryW1BtqYLn8MSYckjGv29S+fD2ujrs8QUWoHXq0cjMRbNAbB
         ap19ZjMEW2gt4obG/A5baldGp/6bju70+zEOCBn9bZFcCQ1GdGVE3FLY5+RFxlwK4XrI
         5wG/J4LneFI6n4fX09WC8STHHzMv6yx0/rUmrZ85oYkqCQKxV2oskBd+bbtkCSp6qU7K
         HGOqWEUIz34Acd96ErfoXcBHr4ouyZmacZR1U3CkOVFhA/akxW5HPURAn4HpIpj/AVyw
         Gd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        fh=2LyDkUHZ6gwxWMcVnkX4MDvdMZo/gMNDLzWqjrotOCk=;
        b=EvUKssE9zID1MZhjtBOCBhMomAn9Fecr9O81m1EwMxEph0MGFOLSimu2QotqQy8CNI
         lFGQZLqQ04K8qLuGh9qY2/hhPNRhkxGVXgitYLYjNWv97ZB3pIGPK89gSAZ45czK+1yx
         VS/r5vIwkRPGGbR2hZPwgaug35qSkIpUhXi0MX8CzMJ+lE1zOLeoFcTFt10/rPzs94QK
         CCOmDBp7N7QHmYphuDyvWwf8yLHnL65/KXZk78HBscHkipQEVxTbEfuhRniKhADtbQgs
         EQsa4hQuams2F1kFE4JWRrZuItu6sshcn4ntf66mWgF1PjqjLziRkOeJgU+etlhbGk4Q
         fK7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769107060; x=1769711860; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        b=ZBxrDUj6XU8chCUcosQXzxoc8jHXW28xJfsvTpvtEoe7//9Son5UklMtp0A+xBBZdL
         x/95HwSF3yME8SspZHDrDXHPtHSjgu9YEfNgXtx+nXal8SxdqHR6h0t3b14h4p+HwgC1
         f69NTPci8eFSfWtB6gMoEGhYWqaWy7zrcvJXgAqcEyr8D0kZqo/xRC0mcBqcfwJMYNL8
         u1wrIhUkN275xtcU4IkwYctOANgYm5Jkis5gzbPVI1jKXXwCqYCaDHeIOyYm+oardRsT
         Bw5aU72zMnqxkkxgP5wJb9P6dlbFFjjk1U2pH/qLkJ9T89uq2wO1o5OzXfEZDzDnvANA
         B+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107060; x=1769711860;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        b=Gvge0u6h95C2WjoIidIdV0qXwhrB8zVAoabWStxrzYNDWJOVu9B3GZ4jXV2HkL14/d
         7lrUTmRncUaYfArMewQoSmvj0Wn8PlXEQK8bwWtZiSFltibW87O7yndn4zSxI0r+QL22
         xxUy5RjtzlgERdOzo9AAep1T0ExlwyBlfRmaRIMDgGJMThPeoUwPe/E7TXAlPSfTi8B3
         4taTCX/i1jFcUXGDX4E1YPk/mI86EQofcV14nhKYL4JL9eau1qJgDz6K7LBoEyaP7SNt
         MU+m0Pa+XQ01QKLhvJVaMkOsN0+FBe7YM2lEzNbzIJhHS8XbMELaj7lT7kYgiFH6b1GO
         JT7w==
X-Forwarded-Encrypted: i=1; AJvYcCUUEq91ip61zeyyL7ZHtdRvJ+dsHbvsi1HQtNmLi/kiOMH75HhuxSBYhZBhMu/f+nihSBPSNtxaGro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9fTcZXrh4jNwEmO4DpIi1j+qAQ7vf0uwprnCLVs/xCHAvBop3
	m7uNBaCOdLnhOT4338rBr/VMOBl8izHcLzsPbVDZutszBCppFmQoPfM1uHJ7oXMXz7U8YWFjlDp
	KQhPuNlEKFbI/Xusw3gtuOEoAUPzF1MVi1GlGKEga
X-Gm-Gg: AZuq6aLUpntU+8tx5uOO0MXMNlBQt9Q2Har4DXwh2j3LZFT12jtAZqnQrXyaVHhFatf
	NeqGwnxjpe2u4fKBax0estusHmdZW6pCuxgZsVaAx+KS5LO7riF8bTHXjqu1UUVibBBcsv5BW0U
	u1YSVsCvKAJs+/K7icznxZsfVjEQc/vxth3FDW/rXZZ+fis4rss9Bi87FgefvEc394y+XMs5d+o
	Tlbyg2kFeLEkRnhabqmXPvYdwyQCuId9OjtOcX2+oIaDvflnFX4Qx4Re0gE51U1VFElG7Eda5RZ
	Vs3A5IsWfqcKDC0D9V7OQkp5
X-Received: by 2002:a05:6122:1799:b0:54a:992c:815e with SMTP id
 71dfb90a1353d-5663eaa47acmr191602e0c.8.1769107059228; Thu, 22 Jan 2026
 10:37:39 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 10:37:38 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 10:37:37 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <294bca75-2f3e-46db-bb24-7c471a779cc1@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <e619ded526a2f9a4cec4f74383cef31519624935.camel@intel.com> <294bca75-2f3e-46db-bb24-7c471a779cc1@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 10:37:37 -0800
X-Gm-Features: AZwV_QhFeXvGMv5345sr6hAOQL-xKTYrLyTeQaptQlhk8j2vfvA1j50rf6t-uyU
Message-ID: <CAEvNRgEvd9tSwrkaYrQyibO2DP99vgVj6_zr=jBH5+zMnJwYbA@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: kalyazin@amazon.com, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "david@kernel.org" <david@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"jgross@suse.com" <jgross@suse.com>, "surenb@google.com" <surenb@google.com>, 
	"riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"peterx@redhat.com" <peterx@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, 
	"thuth@redhat.com" <thuth@redhat.com>, "maz@kernel.org" <maz@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "ast@kernel.org" <ast@kernel.org>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "Annapurve, Vishal" <vannapurve@google.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, 
	"pjw@kernel.org" <pjw@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"willy@infradead.org" <willy@infradead.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jmattson@google.com" <jmattson@google.com>, 
	"luto@kernel.org" <luto@kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, 
	"mhocko@suse.com" <mhocko@suse.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"hpa@zytor.com" <hpa@zytor.com>, "song@kernel.org" <song@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "jthoughton@google.com" <jthoughton@google.com>, 
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "eddyz87@gmail.com" <eddyz87@gmail.com>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"shuah@kernel.org" <shuah@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, 
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, 
	"xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	"corbet@lwn.net" <corbet@lwn.net>, "jannh@google.com" <jannh@google.com>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Nikita Kalyazin <kalyazin@amazon.com> writes:

> On 16/01/2026 00:00, Edgecombe, Rick P wrote:
>> On Wed, 2026-01-14 at 13:46 +0000, Kalyazin, Nikita wrote:
>>> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
>>> +{
>>> +     /*
>>> +      * Direct map restoration cannot fail, as the only error condition
>>> +      * for direct map manipulation is failure to allocate page tables
>>> +      * when splitting huge pages, but this split would have already
>>> +      * happened in folio_zap_direct_map() in kvm_gmem_folio_zap_direct_map().

Do you know if folio_restore_direct_map() will also end up merging page
table entries to a higher level?

>>> +      * Thus folio_restore_direct_map() here only updates prot bits.
>>> +      */
>>> +     if (kvm_gmem_folio_no_direct_map(folio)) {
>>> +             WARN_ON_ONCE(folio_restore_direct_map(folio));
>>> +             folio->private = (void *)((u64)folio->private & ~KVM_GMEM_FOLIO_NO_DIRECT_MAP);
>>> +     }
>>> +}
>>> +
>>
>> Does this assume the folio would not have been split after it was zapped? As in,
>> if it was zapped at 2MB granularity (no 4KB direct map split required) but then
>> restored at 4KB (split required)? Or it gets merged somehow before this?

I agree with the rest of the discussion that this will probably land
before huge page support, so I will have to figure out the intersection
of the two later.

>
> AFAIK it can't be zapped at 2MB granularity as the zapping code will
> inevitably cause splitting because guest_memfd faults occur at the base
> page granularity as of now.

Here's what I'm thinking for now:

[HugeTLB, no conversions]
With initial HugeTLB support (no conversions), host userspace
guest_memfd faults will be:

+ For guest_memfd with PUD-sized pages
    + At PUD level or PTE level
+ For guest_memfd with PMD-sized pages
    + At PMD level or PTE level

Since this guest_memfd doesn't support conversions, the folio is never
split/merged, so the direct map is restored at whatever level it was
zapped. I think this works out well.

[HugeTLB + conversions]
For a guest_memfd with HugeTLB support and conversions, host userspace
guest_memfd faults will always be at PTE level, so the direct map will
be split and the faulted pages have the direct map zapped in 4K chunks
as they are faulted.

On conversion back to private, put those back into the direct map
(putting aside whether to merge the direct map PTEs for now).


Unfortunately there's no unmapping callback for guest_memfd to use, so
perhaps the principle should be to put the folios back into the direct
map ASAP - at unmapping if guest_memfd is doing the unmapping, otherwise
at freeing time?
