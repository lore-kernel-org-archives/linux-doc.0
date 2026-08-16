Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865C3E49C7
	for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 23:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786921339; cv=pass; b=KIZEOnXNA3ZO0x9s45bXEYt3VIaY1BAOmeshNFZOZ4JgLTnuSBfgVXqumbJuwbGsWGaG0nZQbY7BXrBixWTQ7+el6eXamlWMYhiQv7i69JSp3Jt+iTDx1Y0fU/gd/PdFQ/MKtm7CHG9UN8X1DGIooESirppCCJ2RuSkCBvfAq58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786921339; c=relaxed/simple;
	bh=TfZcEuGOfr1J68VSYUvGJF5oR+xbrzPMOaOCm+qrrgM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZhBU3R2BBBUgxt2p5r3PqZs/Nqm3GwnqzUGhC+ENND3hxSAg+zo21bqo6aerkp0Y3wJ3sQwM8aXEcMaG6LYl5MSUrBJLvPXvABQ0VBH4ftv2HyDSGu9hggqurA4nl0wL7olsR5WIb7k8wSObaqpE0YbZiagvKRdcgm0dSoKlFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nBuIbwah; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nBuIbwah"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2228654a91.1
        for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 16:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786921338; cv=none;
        d=google.com; s=arc-20260327;
        b=myDF3uSVfqFvPOaS0TJi0XesjUhA6uMETH+4SvH4uD6FVd9XA6e+r+AzUJPTjDHKd9
         VEPoOufZnVzPOJn8rLEe6Mn9Ad7sP8Mqb8VXj151lKyDqEGMvQCwLJjfDlgBBmL145v/
         9KTtsb3sIPPuhssBHhrHad6pzpj+N08TJ4dVBQY/fFgAOddlDEjs31zxmAZt0pFcuufF
         m55OmMRwbydR+4dAOaIhGXvTM2XJezvrHAjdQnkAFGyZ7GZm2a9k7RUgxUP5I29yCUVt
         R6XbbI0l8/V0CJINC9MMol8wvov8OnIoTN2qXTvfmTt3ehFByrlKn+gBAOC29ujndl4v
         Qguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        fh=72rDe180IrBf+cOflOvOFmEokk98DBQs403W2hkt/G4=;
        b=gdS8URc+4vUsf//Dg2ToFNBUQ2GLenauVXfoke7Obbj+hFoxqASzal/lSlWnzIo3FT
         8TRFtnFx2VOS6aE0B59Qa3djyB0iJ4zuyxMi8S/xN9fBBQCOtLqrgM+qEMGGP2aJggHf
         8R9v1pe09e86+VAZua3ni5+00j/D4r/KgHf+TjjuvWlwFmBm/ge6u3mJvvFwkaM8cqYg
         k6mckakNT0tc7+yTIaEspeAP//HubT7EgF8SxUQtMj79bFGYMU4jHPIxwoOe239x93v6
         dprt7c9RufHNAZVFnspX1dr/knyCeAU/3RcD8XYjN+/xZd5GDKU6pvATzdPwPBygU4UM
         3OYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786921338; x=1787526138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        b=nBuIbwahTDk+YN/O6xtX38CC9NT1+mhcKHwDCSJWa4cUFpiAiCiECz8EZtYRqgGr1d
         4KCb92ZcJbRgyBMdE2fzPjjNsosPYKzH77W6rA7f79C1c3thYUJ787LVMvT8QdwFBKbt
         DXwi1TD84u/bsYwIt5li/8rpskNoaBPl3H/HHvhRfwycri1o6Qk68XYWSIHKEs3LWkMY
         SKtSRs1/7SvRKgd0aKtIM97RBwhWiLgyFr2MIstcJLVP6nCHeco0Is3LF3S1VWnWdFio
         xxAtmKuc/sw7WMPEr2xvXKPPorBjZJA+Hs2chq6IjAdW4HwUM7QsKP0tfoD7lXC6HfHk
         GSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786921338; x=1787526138;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        b=YY+9CJyjAegn+X0lulWS8lhRolq0HGh+wqGbRkLHd0ENp54p0ORhynV8B5dV0NMrZi
         a8LmJhNRWFdnMlLQiXfiRriUzV9YmMP5LbgUZGMKwQ6wN4Q8Zc6oPlgNEXKHCzt34Jz2
         Zr2ZmgojprO7qU7crXpjFNkPBskdXtji17Jb9vx4RQUlhTJ9uU/Q0XNQyHjlbE5GF9mp
         q7K0iktIakSbjHafiEshZladZAdrTjMhVuVZSjrLsTtiuqRD5rgprlhadBZZiI5h2MFB
         SclH9qPPeUNxhqM0rUBiG+yMBUIX6gUESdIVLClwB/8lSN5oErl+YZf1fp2MxahVVC50
         wAiA==
X-Forwarded-Encrypted: i=1; AHgh+RqT1pc+5F2YA/MIjc5p+PlA21k1x28LERjkw8+UhjgpyDUJ9uRgwRe26sIgihUmNJxMG5I1zgsm/KM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG1+U3OyO7n1lP4Wf4QpXZC1R72GSxedwRdflho9U6cEA5BtBM
	xso1nQ3Tq2WBERTIE7bAkCeE9AbvQKc4Dz7YbIeRm/mOx60xbtXe1LnPuDWhVZ3Av0x1YMD+U8Y
	EQ85xGYbeZPr6IRUKABYSQTu5cQfJnRv/mor9tVq+
X-Gm-Gg: AR+sD12EBjwEGQaKWrNadTVfBIOpj1z/azhu7QvCObWI0HuDWnnmb6H8ETZAFt+pTPN
	+4cZzzyRXlMwMFo6PALU+8GFJ40/PQeupkwrKKRGR2YKWvg6lvpsSDUuuVu6Z1JM+NjLTGoIuY7
	kSQcylv50lAAEWR4pFf7tVVzheJr2BVH5HefyXkJFUgGWw1eBWrQ9jjFqLJsIAUGiNV7cI2FuSC
	docRDmeqkZ58ZGXkfcE1H91KA429VSffREzIj9YB2Yas8UD4xc/ltIkg6h/naVvE9KaCDKyvQJU
	B0xU42G7rgZTG0sxka02eKgOKxPNAjl6mMhU2v2xo0LsJPHqd/sUizllbCbN2xZiHJleiluHZEN
	zfg==
X-Received: by 2002:a17:90a:e7c8:b0:38d:adae:4866 with SMTP id
 98e67ed59e1d1-3933bd2066dmr20117316a91.21.1786921336732; Sun, 16 Aug 2026
 16:02:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 16:02:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 16:02:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <beecf36b-b0eb-4691-918f-fd39f46d5d8f@linux.intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-15-2fc18ee6d3ba@google.com> <beecf36b-b0eb-4691-918f-fd39f46d5d8f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 16:02:15 -0700
X-Gm-Features: AcwNN1Va1JdlpRRtXfl-rgaiOwbgkg6rBN2xjp1zNZlzVot1c-IWzDKRKQ6t494
Message-ID: <CAEvNRgGtnQfhCkrWah3jNeivbHCQqRSQEXs=uqJhBmS+GVntrA@mail.gmail.com>
Subject: Re: [PATCH v10 15/41] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

>
> [...snip...]
>
>> +static bool __folio_safe_for_conversion(struct folio *folio,
>> +					enum lru_cache_drained *drained)
>> +{
>> +	const int filemap_get_folios_refcount = 1;
>> +
>
> Nit:
> After adding the helper, the use of filemap_get_folios_refcount seems
> less obvious. It introduces unnecessary tight coupling with the caller,
> though it has only one caller currently.
>
> Is it better to pass the value as extra_refs, similar to what
> lru_cache_drain_for_folio() does?
>
>

David also suggested [1] something similar, please see
https://lore.kernel.org/all/4c638fc5-5a74-43d0-b5bf-d7ef893cb994@kernel.org/,

Please add on to that thread if you disagree with the suggestions!

>> +	if (folio_maybe_dma_pinned(folio) || folio_mapped(folio))
>> +		return false;
>> +
>> +	lru_cache_drain_for_folio(folio, filemap_get_folios_refcount,
>> +				  drained);
>> +
>> +	return folio_ref_count(folio) ==
>> +	       folio_nr_pages(folio) + filemap_get_folios_refcount;
>> +}
>> +
>>
>> [...snip...]
>>
