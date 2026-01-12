Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C8355051
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225932; cv=none; b=fXK2ibHuO3zzrUfIMhssg1MEgmIQHpuT+9HFRTJeQQlZk1kx6hX04kkkj4YA1zLiZE+3XTt0RTxh4YcA5+B9zFNbVUA+4AXT59lCTKthPCDbBcaM+KVL6AueD0ncWbplXVh6X4SC2q6aFDBPVEL8iINzF/pkqrsc5ZUs6O52UXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225932; c=relaxed/simple;
	bh=G0pB1izSWIHKlqwgLnp52ARGAf6YcydCe74TliA+Lmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnMq83hzhM/pu/KVDtaAJ6Kct0rmXTXdtHkox9OHz/cpNx8cfj40LowYQJ3IWEMnK1Rn1OdIwqpC7RR+g1AvxljGuhoVUDOufJWzVUjRiX1qe/y+Iz76D+lPXuLDnSO1qWQyuJXT0lIrShvAycfBkfOQbCLWN9hgB9UR4xtukLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dw/nzJc6; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dw/nzJc6"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ffc0ddefc4so69622001cf.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768225929; x=1768830729; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OhCKPm7VYMhHUNH30pLlSTekzRTr8ph+K4EroJm99dI=;
        b=dw/nzJc6vYbf9qyD4Ncfc6Q+SWiqVgGEcqKfRBywsoW4MLgj4vZaws5/k5Co/qv3a6
         WV7hK3gARC4jW+u2wXP42kNTwe2qCzuPyr7ufF5OfKZ3LspSh6czNptnrDrQe7dafEVZ
         Bo9WUxGi4JN+t4Z3uAOkJfHg5OuuGJA0tZUYe9azxcTBoyX8BMCMW6rYFEQG4brClyml
         TGe2Qw0lHNNA6nq/cFCGgYXUn459JYNS+4ycIxAP3ti857y6APwBg2FVm2QeyIRtTnLX
         i80jRWGiDQuXX28tQm+PO0f2nYKUnUUpDULZDo0NVAE8LdjNsXyBbmvW4CNQ8FZxDUIB
         TI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225929; x=1768830729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhCKPm7VYMhHUNH30pLlSTekzRTr8ph+K4EroJm99dI=;
        b=JEJc92hyJ2wvhn6MCaSHWENB0/v/YkyLgR2ZF8Ta4c1/Pl4mezDo4WBUYPGN8by7BZ
         72yGGkz4cv+jVkB0Gqj846kLqiiUpWe9dT8ekIaXlSIa3rHXqmXczH9d2BfZWgttOJNL
         97VRwrbGz4wsNpVkjxLJiwnpETZaaLoiryDp68AzhQU1k3pTqDBSDTpllClsJUJ+Gh4h
         YBlgVjRyAXxkGAb8FkAihczeqpV+R6dR/C4ZajBCD3bxAcwz6mchVksQV/4QJgZPVbQZ
         7AGWztGawfXBUFnBHrRJ8slXgCi/yLKdO1dSbfbON0AVeFbVZyW+ucyzWTsfaUgpcLBg
         0xXg==
X-Forwarded-Encrypted: i=1; AJvYcCVr1dtGY16+B9Kyh62kHWtXRBhiDjyDJtmit3dF1LTiQc3cKoHHIvz0Z9NuihuhTJV43D+lp0yzM0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe1TIfLTS0WmpMN4Fr5MRFHVQbqVd0A4BX77kYFFch1aNCGf2u
	jVxSPqWRDNMeiRpKQuNNcMmc6aJqcErZJ+z4ZDeoofzjBH9bXhqqJ1Y9ewJvnnPFEk8=
X-Gm-Gg: AY/fxX49eSRSjw8nTQLMw/QwyzxJDEny7OfNJgGpjjU+r6huA7iOkGeX8oc70kzP7oF
	XxaFxMWjZQCVXvm/I8GIGwHEQhBerPLB64UVnM4sS1yqR2KAjubK/mKUVBiNCXgEfFyKwpz4sGW
	kEeVs/7Jphmn0ikDn0E3a8IsIsW4c8A/13meN0eQTF7JXxZDLXBtERzta0cWLJKkuOyPzm4MA3y
	y+rlNkZN72WkxW48p0kXM6oNbxapMGRCTXgIH78i+k7C73AFQ45ffPLLUNnVyq5PVozRyRc6bac
	EruRGH6vlSs3wiaC5jmspSrGUkc04LGdhbho8xg6fAkEsf2AGa3KayuHZq72oiYwwW21T3fcdJG
	3EtzfHiCj5E4N0S1gMIKRdJonxD1YHL4xzeEtaGDXA8Z7moc3dWGhi2m0uTqTaNCfsJHDjPEFpl
	CW8CAS02VC2dhqqSDVFZHbUt37DsmupqxrCiF/oLfgnXLhmpwQuYeBwhFSjXpx19BKVk4=
X-Google-Smtp-Source: AGHT+IHqj1rZAaLOtZCDsdzXVUTGgkS4VFYt/v/ed+Pf3/EF8sQyP07+6+eSH3qW3iq/2/72eoUoYQ==
X-Received: by 2002:ac8:7f88:0:b0:4eb:a1cb:7c with SMTP id d75a77b69052e-4ffb49c7d54mr248147041cf.64.1768225929518;
        Mon, 12 Jan 2026 05:52:09 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e20bcsm137210676d6.15.2026.01.12.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:52:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfIL2-00000003Q6R-221D;
	Mon, 12 Jan 2026 09:52:08 -0400
Date: Mon, 12 Jan 2026 09:52:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	baolu.lu@linux.intel.com, rdunlap@infradead.org,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <20260112135208.GD745888@ziepe.ca>
References: <20260109171805.901995-1-smostafa@google.com>
 <20260109171805.901995-4-smostafa@google.com>
 <20260109195111.GQ545276@ziepe.ca>
 <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
 <20260112133256.GB745888@ziepe.ca>
 <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>

On Mon, Jan 12, 2026 at 01:43:41PM +0000, Mostafa Saleh wrote:
> But I don’t see why not. from the documentation:
> /**
>  * pfn_valid - check if there is a valid memory map entry for a PFN
>  * @pfn: the page frame number to check
>  *
>  * Check if there is a valid memory map entry aka struct page for the @pfn.
>  * Note, that availability of the memory map entry does not imply that
>  * there is actual usable memory at that @pfn. The struct page may
>  * represent a hole or an unusable page frame.
> …
> 
> That means that struct page exists, which is all what we need here.

A struct page that has never been initialize shouldn't ever be read. I
don't know how that relates to page_ext, but are you really sure that
is all you need?

> I can see many places have the same pattern in the kernel already, for example:
> - vfio_iommu_type1.c, is_invalid_reserved_pfn() which does the same
> check which can include MMIO and then get the page struct.

This whole flow is nonsensical and wrong though, I wouldn't point to
it as something reliable.

> - kvm_main.c: in __kvm_vcpu_map(), it distinguishes MMIO from memory
> and then accesses the page struct.

That's sure looks sketchy to me.. Eg if CONFIG_WANT_PAGE_VIRTUAL is
set and you try to feed a MMIO through through that kmap() it will
explode.

KVM can argue that it doesn't work with CONFIG_WANT_PAGE_VIRTUAL but
iommu cannot.

So, again, IDK, we are trying not to use pfn_valid() in the DMA code.

Jason
