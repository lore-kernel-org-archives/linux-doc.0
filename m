Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1B3B6BFD
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 23:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786405295; cv=pass; b=jzAJEvMGdqt8yjhVMcY+qJ97TX1QuYnyF76Qj4EvIMqthGvMRzZXd8L+L1LhYJsCSDNZdN3EU0hgWy2A3EtUw090Gz1CHMf8RkarXOKSURorUKn2iA8NGnJg3iMz66NcYT5TiYEnpIw6iiNxetATJwr1l3mMC64X59/Z9+8klUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786405295; c=relaxed/simple;
	bh=Q7a7K8y6K91AYZoCZj24dpjtc+/Iv04y0vXjPDlyobw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhKQPYjaPZaXcYL4Ky5F1VIrmUtqzXllXmEgE5NE3hlvhouDXRyp+2Ozg2DL16Wijhx9VDsJTTNiPoBuowutEisPnpxVdeDUYtZe0KEHGD46LPq9hMCJ2yWqDtLNJPoKdNqlCdcVz0TofnIRa0DUjagBFlUa3nEcvtgXRS+wzS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FEKKeL8B; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FEKKeL8B"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2677602a91.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 16:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786405293; cv=none;
        d=google.com; s=arc-20260327;
        b=GdCkKN4lrGvc4oivaLs7w21NbITP2atRfEu9PnsolzuVW2u2fdH9QaIFRZWpIyrOSE
         OdabLzE74JyfKBqj4E1lniZfzd7wpOvLwPRMyYIPmHWYuYNypTrijDNChdszOdx9MEYb
         BXPZV4yxKl9P5xSFsmHL7XyH789DJ9V4lnAzTjQYL22v5fUq9mYV0P+WivA3ThmBolh0
         ALjTgWIDQnT+UM6t3+i2d/8D/YUMMrqRj5QMLEcnzEOttotibMzigSoUiYd6HSUhfHzm
         8JoLMQF/Kk3kwEbzDXaHnse+64hTnYySK5zxqqt+zjtsvmJVEOZkYxqOZyRO3/rtQz7e
         HYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        fh=2iNJyQ8PGTtXxM+SQsWrmEWRRcLrlQ3LRUJVLi5TbhU=;
        b=rsn0jalRuX6BobgCuZeyWl4ArM9FsXParcX5hinAfg3xNb6a6TKNkPMfhcqfn7hshX
         XQToow0DC+cSJv7TSNDRVsNt9w6LDYqvtJdjY+j8nVeTXup7oWnl0Qu+56vpVDReIRFV
         bloD7/ETohE0T6KHeh3drPiRRbAvvZZ4RjUJIohpx7RJh65i4nCG2Vv+UbpP1PeHwulP
         kBErg0mhIHOZ1ye2ehSxZBU2kUgFUtRfM3m+HbUMpvDTu+luahDnMkb3Q8OPoPwEeD20
         GmNnKRLgUjtCgsCPWL1ozY37BWEgysORUulf8phspYN27OXDmgXkbmW4I8tyjVO9+nR8
         5dOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786405293; x=1787010093; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        b=FEKKeL8BDcu2yxx33NUPSkerBgXdr7tsQFyUtlfDzXvHr22vsNjJFdIcM3SPGSlBbM
         avOM1r8hcMlxihNLXugYUed0t5o1M6x5TG3mwLB1m3Cawm1DU8c9wT4nLSdSzQE/S9lm
         XhYxZ030b7Ipap4HED0csiigjrqr0EwPAjD3JUGcqvq+cYAgDH0PMdJ0+v5X4NjIrXRO
         GFJzI1oBz91TRne2fQEcytITj3ceQXBtPZi5vnKQa5zGqRsx1S5YZTQwEFhRQhEO4mrf
         90ml2wgFG7Po8SiUi9kvpWtG7fbBRnOlDEIX0+eNeBGLdpD1LgyF8xt+6urTpwBQptDI
         jM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786405293; x=1787010093;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        b=SkjBuUrEIjugwuutoHaQFgaZph4DVm13SZuCyQr1N0RegrVO0VTuER9aVbACRhBMvE
         jByVqRy9G3Vfz8/PmBSrZ30p8Sq3FuyZLUe96zsmnt5CMEzedeDVDu6kUZrbBTkq1CcE
         mf5mLP8Sdq5Y7U7yaZVzbKCCkU6IDuFtVtaByLgK+Lx6LfBIjY4JBapHKGw+qv2Nd/s2
         Nqw9WClnqWnL8PT84mlIQBnqo82fhJFdo5/LJFI3TBXFS33sQid8zNZhOaHT/J1UI3mS
         OJjWFnagb3UkdkoHwWa9TK24byeWua/ExVnyYysIRVJEAma483Zact+70xcyzn1G0CsP
         zwiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpt2IP2wmDaTUIQNzFnGuhh0tf12mbV31ysNnVXJaPgQGTp6ofeNS2fePbQbOUniaGcl69Stx1NSW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0zI0O3/CjnBKiM0KiMH2FIMwqUat3bmY803g9b4+mePJPPok
	mWqVgYLc1W+N+RtMkwjiVPUmAT/E9OKipM5Tip6uGh1Y1jEHuygBRNch1DDXt734ykuCG1wuAOl
	KcIUh62AEFWvGoef+9F5k6SJC7f7qLPUTCFl1fuy4
X-Gm-Gg: AR+sD10IDMuP7f9bhCBP1mCOSnUkfBog1QpMosZffWjODCsGjkqx4u+FLBjhZQLSJHy
	RHaw71XRog17tjKHZPDuinlkGn8Yz8efWQXxsQD14/pLl6yFJQ42YzkjVp4O+OFx2Ca5m0m9Vgd
	0iMlfq00eZMTLWjoeFcWOFx6dCmL9qaAKFWKGCTq0XMT7MDThFGFr5MDTkh44oE4h7q3LSSbl7U
	IlYeRsU7Qvu3hpmsGkX6WSSupDUsBkaQUHAvTxQMdHGcFNfXYr0i414y1ovLcfFkY7xdD183Se2
	KuZWmmQyEY6lde0svkJS9yL2ui7pkCMYssdMLLABelos49Lb7Fx/p6GMHgYrbxS3frWyXWwm5CR
	GvHif0V+74H1SD15LtbpBOnZoWPSkkUH5Iak=
X-Received: by 2002:a17:90b:268f:b0:38d:c74d:29c5 with SMTP id
 98e67ed59e1d1-392cca64db7mr5320468a91.19.1786405292124; Mon, 10 Aug 2026
 16:41:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 16:41:31 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 16:41:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <dd9ebd52-7171-4353-8c83-9363019d55b8@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-16-2fc18ee6d3ba@google.com> <dd9ebd52-7171-4353-8c83-9363019d55b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 16:41:31 -0700
X-Gm-Features: AUfX_mw6OlaGLLkL3HyJwIpviYhrAvoZYVarJDuu-bVxocdCtMCbumdkufhLAM8
Message-ID: <CAEvNRgGSK9tO_-TvQvXoMwVwGygh5WjjBUOY-zLOA5yP2DwS1g@mail.gmail.com>
Subject: Re: [PATCH v10 16/41] KVM: guest_memfd: Zero page while getting pfn
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Move the folio initialization logic from kvm_gmem_get_pfn() into
>> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
>> kvm_gmem_populate().
>>
>> With in-place conversion, the existing data in a guest_memfd page can be
>> populated into guest memory through platform-specific ioctls.
>>
>> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
>> might contain uninitialized host memory, which would leak to the guest if
>> the populate completes.
>>
>> guest_memfd pages are zeroed at most once in the page's entire lifetime
>> with guest_memfd, and that is tracked using the uptodate flag.
>>
>> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
>> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
>> can get a page, write to the page and then set page uptodate without
>> zeroing.
>>
>> This aligns with the concept of zeroing before first use - the other place
>> where zeroing happens is in kvm_gmem_fault_user_mapping().
>>
>> Don't mark the page uptodate again after populating, since the page would
>> already be marked uptodate before the post_populate() call.
>
> The downside is that __kvm_gmem_populate() will now zero+write. I assume we
> don't care about possible performance impacts?
>

Would we rather zero in kvm_gmem_populate() only if !uptodate &&
gmem_in_place_conversion && src_addr == 0? That could work too.

Previously, without in-place conversion, populate never reads memory
from guest_memfd so there was no danger of leaking uninitialized memory.

> Worth spelling that out.
>
>>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Tested-by: Shivank Garg <shivankg@amd.com>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  virt/kvm/guest_memfd.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 030af0855f8b0..41950c8105b5d 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1079,6 +1079,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>>  		return ERR_PTR(-EHWPOISON);
>>  	}
>>
>> +	if (!folio_test_uptodate(folio)) {
>> +		clear_highpage(folio_page(folio, 0));
>> +		folio_mark_uptodate(folio);
>> +	}
>> +
>>  	*pfn = folio_file_pfn(folio, index);
>>  	if (max_order)
>>  		*max_order = 0;
>> @@ -1108,11 +1113,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  		goto out;
>>  	}
>>
>> -	if (!folio_test_uptodate(folio)) {
>> -		clear_highpage(folio_page(folio, 0));
>> -		folio_mark_uptodate(folio);
>> -	}
>> -
>>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>>  	if (kvm_gmem_is_private_mem(file_inode(file), index))
>>  		r = kvm_arch_gmem_make_private(kvm, gfn, *pfn,
>> @@ -1159,8 +1159,6 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	}
>>
>>  	ret = post_populate(kvm, gfn, pfn, src_page, opaque);
>> -	if (!ret)
>> -		folio_mark_uptodate(folio);
>
> In case post-populate failed, do we want to re-zero the pages?
>

I believe we can't re-zero the pages. When SNP fails to populate it
could be because SNP didn't like the CPUIDs userspace set up, and after
the error userspace is expected to check what SNP likes, then
retry.

IIUC zeroing will destroy the message SNP wanted to leave for userspace.

Michael should be able to explain more here :)

Btw Michael may I also get your reviews on this series?

> --
> Cheers,
>
> David
