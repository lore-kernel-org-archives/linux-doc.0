Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99433C197
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450942; cv=none; b=TaZhlZtnbzLzsXWNW6vVaVC7S6TXFBn+baSbhO0AwmV9SNU507LLRjzfL7grAWo6X8zWEq2THbjIa14VZh/jl4ht51xWUvO1ZGMYgTfV8VchnhYWi6DXC+YmuPqn4RJDsCaM9IVhhY1htJLn3WXbc3DjI3o6HwIRylj1gJvQIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450942; c=relaxed/simple;
	bh=K5ULHdjkJWFTrPH0dXx05JrTB8YMHL8lkvPnUG9C6K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9Y3R/Zt6FVCyItWB+kPyOl7J1gc3QvFOeB2JJH2+eJvsTvunsVRIAn+Nsm7idE7flgex1xiBHmFknHp7dpiS1suChjeenEq3ZSOZMyvtZcQhdoEhmAd0SYjGEzVZRlxjK2oeBESv68tDyQRf3F0YJYXSA+1w67BYfbk3ZnrX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fPu9ON0n; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fPu9ON0n"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836d541968so4116405e9.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 03:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772450940; x=1773055740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aYNafgGLMp2zV21P8+oK10uFDyPLpaq2eVinuia9OY=;
        b=fPu9ON0nUm5dN1h5k7pqfLgwgYSZo/2iLpTg/G2dDDoMSeOJZZjjsBeY4DTOJhin9J
         8IlCkplAVuAph1jjwaSMB/W7XfdSm/oWwx4ciXjBBh5uuL0cARIjmCs+vCxlIB8EfCt5
         s6wUZuTq6YpOHeYYoZfZ3tQ1R0fzUvMbmjt2PoQn8QhAYt+mBQA7U7pIFti8bWtBMcI+
         ZJn+/Ode9Z4Q6+1TrUWWWSdJg1ZYjtkc4aqZSqrVOwUi2zr6B7p1XwXfFTrpxdyuQrKt
         QHsoDBcoBP6RJ73zjsGuzf/j+A/TJmvZUWUAT/pAL7Bw3katC9+epBAlQllQYNCEOorz
         1wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450940; x=1773055740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aYNafgGLMp2zV21P8+oK10uFDyPLpaq2eVinuia9OY=;
        b=PYdRZ1BAery5nn96aA70Nk8BkvEM4XHuxR3IVBlRPd9kQvKk+Jc81vt0Whf+8Ohrtc
         5ICADH5i6Bx9RGCFlBhQdarhcKHq4ZFbrirLIY2WJz5qf6pTIYrm+Qzt+5IcxffGR3eH
         0x1da9oQ+aYc4ZyFaYB5P3pCVjC4KtwKw6fvAwFAyuS+C+Mb7zY2y/5rbcQU001zGDoL
         XQ0RmPoQDe2caoY8WY5Iezuhm/7E3rNTLQIdIASZyzhRE4qo2ezWAaNGMXM6z9y3ShPt
         kljw8bxgyD3w88skBDa3Vxi8/1x4eTrjewzfp68IcWigjPgJn7v1Ctp3o+F5j1W6+zZn
         45VA==
X-Forwarded-Encrypted: i=1; AJvYcCXK6t0RbxPtoXA6JWhZCdo6XE2rACtOiXT3rJEW+79y6cpyJYX9KTcxck8uqlZhjLINNr6AhigdSuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyetlslWX4RKegbPdPPFngwJeW/7cDEb3yOBt9N3i3/kikB9Vx3
	qTnPhEg3lPfuUJVSPVaM6kscFuZRVTx7nO2CHj4fDEbeDtINJFUpOeGGq1Bu/I58ADU=
X-Gm-Gg: ATEYQzwrzXqRCHiyJ0w5kHfLghR9R6ymc+KXW7PQB7To1LE6VBQB/2wugbqdYND4qje
	/zFqzBtw2mWh6PUhgGbmWj9fpuzGHkmqmTQwJ2EZfhCFb0k98rkpGD+dQz19dOC808ke5yJMTcE
	skPuL5EuYbpJdYEDX6b5Qsgl024+bm8dw3jpUZ8hOGl/zjXE5nxtLiMpE/tqMWbUCM0jQ+xKw+F
	SlcPzEMr2zoiUcubXDNSgwcd9UMTAru1I/E1MD2gQ/DXNm8jIle/VbVzEkbdkQDI+Ub0zRmXgbf
	kvkOJGr2NFG26/jgwXQUrCF1ZuOPFd3SwalUaosut/uLESyRU1GIGnIZZJa83SQ0tPnTznUnOHG
	U4+YhtehnPxP5hdladP6AlsuZMVjIR/R7Wxaja9EbAWU5uXv+oexr1RKZx4TJh7lz1zZZ3TW907
	lYi/Ib3ixOEbcpokAEn37P8HZTFTLzq1r5ciqxHGi3po3JAR2Le1HKnl5n1A==
X-Received: by 2002:a05:600c:1989:b0:46e:43f0:6181 with SMTP id 5b1f17b1804b1-483c9bfbdd5mr117360665e9.7.1772450939437;
        Mon, 02 Mar 2026 03:28:59 -0800 (PST)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm210891065e9.2.2026.03.02.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:28:59 -0800 (PST)
Message-ID: <5097ff66-b727-4eac-b845-3bd08d1a0ead@suse.com>
Date: Mon, 2 Mar 2026 12:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/6] KVM: guest_memfd: Directly allocate folios
 with filemap_alloc_folio()
Content-Language: en-US
To: Ackerley Tng <ackerleytng@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 seanjc@google.com, rientjes@google.com, rick.p.edgecombe@intel.com,
 yan.y.zhao@intel.com, fvdl@google.com, jthoughton@google.com,
 vannapurve@google.com, shivankg@amd.com, michael.roth@amd.com,
 pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com,
 tabba@google.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260225-gmem-st-blocks-v2-0-87d7098119a9@google.com>
 <20260225-gmem-st-blocks-v2-2-87d7098119a9@google.com>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260225-gmem-st-blocks-v2-2-87d7098119a9@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/26 08:20, Ackerley Tng wrote:
> __filemap_get_folio_mpol() is parametrized by a bunch of GFP flags, which

                                                           FGP?

> adds complexity for the reader. Since guest_memfd doesn't meaningfully use
> any of the other FGP flags, undo that complexity by directly calling
> filemap_alloc_folio().
> 
> Directly calling filemap_alloc_folio() also allows the order of 0 to be
> explicitly specified, which is the only order guest_memfd supports. This is
> easier to understand, and removes the chance of anything else being able to
> unintentionally influence allocated folio size.

Isn't it determined by FGF_GET_ORDER() so when you pass FGP_LOCK | FGP_CREAT
and no order, it's straigtforward the order will be 0?

But if this helps with patch 4, ok.

> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  virt/kvm/guest_memfd.c | 51 +++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 2df27b6443115..2488d7b8f2b0d 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -107,6 +107,39 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	return __kvm_gmem_prepare_folio(kvm, slot, index, folio);
>  }
>  
> +static struct folio *__kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
> +{
> +	/* TODO: Support huge pages. */
> +	struct mempolicy *policy;
> +	struct folio *folio;
> +	gfp_t gfp;
> +	int ret;
> +
> +	/*
> +	 * Fast-path: See if folio is already present in mapping to avoid
> +	 * policy_lookup.
> +	 */
> +	folio = filemap_lock_folio(inode->i_mapping, index);
> +	if (!IS_ERR(folio))
> +		return folio;
> +
> +	gfp = mapping_gfp_mask(inode->i_mapping);
> +
> +	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
> +	folio = filemap_alloc_folio(gfp, 0, policy);
> +	mpol_cond_put(policy);
> +	if (!folio)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = filemap_add_folio(inode->i_mapping, folio, index, gfp);
> +	if (ret) {
> +		folio_put(folio);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return folio;
> +}
> +
>  /*
>   * Returns a locked folio on success.  The caller is responsible for
>   * setting the up-to-date flag before the memory is mapped into the guest.
> @@ -118,23 +151,11 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>   */
>  static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>  {
> -	/* TODO: Support huge pages. */
> -	struct mempolicy *policy;
>  	struct folio *folio;
>  
> -	/*
> -	 * Fast-path: See if folio is already present in mapping to avoid
> -	 * policy_lookup.
> -	 */
> -	folio = filemap_lock_folio(inode->i_mapping, index);
> -	if (!IS_ERR(folio))
> -		return folio;
> -
> -	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
> -	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
> -					 FGP_LOCK | FGP_CREAT,
> -					 mapping_gfp_mask(inode->i_mapping), policy);
> -	mpol_cond_put(policy);
> +	do {
> +		folio = __kvm_gmem_get_folio(inode, index);
> +	} while (PTR_ERR(folio) == -EEXIST);
>  
>  	/*
>  	 * External interfaces like kvm_gmem_get_pfn() support dealing
> 

