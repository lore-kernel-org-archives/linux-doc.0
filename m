Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795184413;
	b=1jZNW9rI8gMEANSW0WJRB/klwTNmYhJ9retEqMNO/7g5pLRmo2qbRwLy5cNBfqsrnoM+
	 w9Dej7Wr5cTVkFP8CObnFG2wB4l8yoLYhhdUoTOmQ8F6eV2ZHfMrMrookhYIHsZsCLEXY
	 EAfMK1HECZH8/CI9nwY8uDCZH2EotDOfQ96myVqgW0AiOs5yom/ApugGe3El4JYy6ZvIS
	 MGzqE5efEBXkqbYe8281e94W1Wp8RBo14a9gyvahHJtkg3yGkx9mQZiYFnTJJJneh93yQ
	 sd7ci6/s0G3r4tkqNshdHEubWwi4bUJV/eUoMfi1iV9fsseRE+BNO13Ra1ETo9Ox4gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
	b=2uThslcCqxDWAdLxhM7BMNM1Nqy23hyCesLSuDnS+qAYjljfJJ3MFyf8Q2+OxkEkstxv
	 OjyC7KLJ50aEZ/4bhhQFxztRXcLhPioVGfplUYg6oVsdE9vnbARuvW4o9POoVuI7tmTUn
	 LE4DsW8CV3KJ/YxENd6vLf4NiW66MCD96jIkXYPq2fLPPw49A66F63pODgBG0fzmdN7JQ
	 mR3ih6JgPQ9XSsRTfdinB0Qo5YjCV5/rKS4C+1Vc7/BvSwo2iguRla34a+PChvmeQJGHD
	 QBlZ9O052Y3sa9jKwRQuE3RjtBeJLLb9G9hqkOJRirFtTQJ0uWQQVqQIGK2xiiswHBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aPrxrTV3;
	arc=fail smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E35606A32C
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 14:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E35606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aPrxrTV3
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-54492d8a988so289001cf.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 06:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184412; cv=none;
        d=google.com; s=arc-20260327;
        b=Ju+7bRk/cOCRMTVYnoszdJkvxz+E0WhdzOmjyeAxKCykR7HKIyr3g5GwXag+YuDBzs
         +40jUSMRZwxL4jMMZHrqrj4UFkg8CoN1Ug7+oMGnGggpR2i+LwoIcdF9sFHnYASEDFL4
         6zcWv9T89c22dbrWbUvqUrzT2HF1Eu89gVOno8moHumC5fCyMpwlnQ8QzQycx35n0DnF
         L/oDzMsmGvsMxC2LvqW2Yr5ghJy0qj4GvZ9wzvIIwUZJu8DRlt5xlm3kbrMCSDz6C21g
         CqjUZgx5SBnQX2XFc34pj/lHRgsg1Ec6hzThfGI17DCVRmgENxCIh3KtHZcHLXy6LNWe
         bDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        fh=8Dbig0hYUtMdqgT0tBl8Fh35ihILMiXhT9fX7zX375k=;
        b=Hxdde3/Rx7DwaWzSggYf4yJ/NDFiK/gu90WT7+9lkxuRFrlsJHPL5pK7dOYKyZe1j/
         86SfMRAaqVgGeVNOWR4bkcz51Hdar7Pi6EUuwCi+zrp9l0Xk9W0AZn6DPFdCI+4iNcG2
         xqAdzGyMBd2quVfFTv+k5QBGbWxgI8WnaWjH+vMzyTXptV35aPtDSvMOvQQ4K1Z2oWit
         8x8hMyNSRi69as9ai0ROp+OCBfsgAH0f3mUVvV//3jrb8uQZSnNTbKwciX+Qxy4G+hob
         7kSg+JmXXY/bs0cL1b2hZX0hnkVFztLscK+wtPlSPaWSKLu0Ofr/W0wO1dxOnaPi6ze3
         Z8Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795184412; x=1795789212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        b=aPrxrTV3tjNKVZRe0o/QZnrHtJ88Cq0pnVQFh7mHgAvBJzDrEJpUWOT7AK49X/t9t1
         p7Vunzt0X2Jci5rymoMAfsIElmpqm511Q1t7p8xn1jTunsDcwP+6GaXxEB2IFTgFyMZ9
         0iof2il/XdRNNVwakcxSw0onlzvNI9i3hcQnJoO5i5GHUKuFzFtrzC3+IMt6INHHgjGk
         xqTd0Wgb4Ec0WCLoQA1db0uoMdVOIYDq9ySwBT+7Mn0wwGKDTjTrt/aa7XbbUc+3QID5
         2e3M416nZRs+/ass9ys+Ro5LBwyHkmnva3YwUsJ7NnD60k9CYZmdfaxSg5dN/4GGjxa8
         eNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184412; x=1795789212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        b=r6Q23mH3+J2yjBoqVC3JbjtEftlG9QKrw5evqLJOv/y7NKEN4+uiDl+MjGtDbNyccp
         FQqNrOSMhUd/14Kzhsw7TcX4AGXbVjYAHdlycleOu+/CTutoaTai95488SWggibjbohe
         6c9E6we3mUJClvAeVrxva40607ihuXnnnXPHikL5q6bVf+TcTcj1eGjgjKmC+AJL58GJ
         6SZin4ghYDYyUYeOEc54CzhHN88+uin8Kxb17BtpwOtXSynAWdLU1AOoCZNXccmDvQvm
         XxkZgFgpul4tmjFl6a6iVKQPjSuSTdFx32c4XRn1GZKNK/Q75mH+pu/RcunRY1D+agC/
         XQcg==
X-Forwarded-Encrypted: i=1; AL+hErHDvTiWWfSzuCZvG0Wx60TyDbr7jUKD291lF+PG49AFlIbR6yW8CLlkXgHnguACKcsQnJjVc8+RqJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VNy7wd2D3gRfNyQ5dpI4TlilBI4Ow1/o5gULovZO0WMrbSVNl
	iKYfWm9TDL7esCqgNnRbnpK4vJ4kuUDsnQGu/PapXpjFRty01pqOPe0HMHmyc260SMFD4E5HMUc
	mtxd6EKmqcrOCoJOiRNQRjMS2DAcmafPi6RvtRIId
X-Gm-Gg: AYBFou12mp6n5QcScog2qHtsxREo13dRh/TgCaiT+rvLzlDuiHcW2MduuwDTUlZParQ
	nQizlRF1SSUuhbF5yE39RgcOO3dKTEFpPAGhEVDLYQYc2JVhfe4SI9bbGC+/qcqO7/W9FB7UShG
	NIrHq47la93jHlyLM8wrGSwfT//u7g4X/ge1fvptkDvGkBtyrq/p2UuNZPwc0pjFHrhJ2EbOy5T
	ayffO3WACrCEyCbcTS9Qia7GYyDLaAHU3BA2iMfZyEu+kDRAF8DY0jNtKzE9ZmFem5zwY7pC1QL
	dMEUbPVtMNhhcPDGGQ4M8UtjTlH9Vxidc1RXU8b8PwPEXZ0srf94gezlvm8ng0E7tMlod6YfMx4
	/d/72d/IkNBC5l6SY8eFEqllV7HolMX//+fp6/A==
X-Received: by 2002:a05:622a:8c8:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55d7a37902amr16973301cf.12.1795184411359; Fri, 20 Nov 2026
 06:20:11 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109182533.3594984-1-lrizzo@google.com> <20261120010655.467825-1-lrizzo@google.com>
 <20261120135013.GO3115493@ziepe.ca>
In-Reply-To: <20261120135013.GO3115493@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 20 Nov 2026 15:19:34 +0100
X-Gm-Features: Aa3M54r79-wonm4abHk_49DjjJPxLMhPkMzG33LcM6yDH6fwirGgzaIY398cqTc
Message-ID: <CAMOZA0LmZ9PFzxLcc1SuS8piFyZu6P=vX_qR2jy-3QRUoNCUKA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Christoph Hellwig <hch@lst.de>, Dragos Tatulea <dtatulea@nvidia.com>, Naman Gulati <namangulati@google.com>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, iommu@lists.linux.dev, 
	netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> > This is v3 of the RFC previously posted as DMA_PMD [0], now renamed PIS=
A
> > ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> > Documentation/core-api/pisa.rst (patch 25/25), which has the details.
>
> I thought the conclusion was to just do this stuff in netdev pagepool,
> now you come with an enormous AI series spread across the entire
> kernel?

There were surely comments claiming nothing outside net/ cares or needs thi=
s.

I respectfully disagree, witness is the fact that e.g. there was already an
io_uring proposal which is smaller, but does not address applications
that want to use the standard disk I/O paths (libaio, buffer cache etc)

Nothing has changed from the initial series in terms of size, use cases or
subsystems involved. Large files are placed where they should,
the series covers the same three use cases (disk, network, CoCo), and
touches three parts which it has to touch: mm (most of it; it is a
memory allocator
extension after all), dma (it hooks into map and unmap, not a large change)
and net (the pagepool change is a couple of lines; the tx path needs to
touch more places because the current stack assumes all paths have
the same I/O requirements).

For CoCo, there are very fine grained controls so the bounce buffers
can be enabled only when they don't pose a risk, which in turn
depends on the threat model.

Specifically, for network tx buffers or disk writes, the user-to-kernel cop=
y
is basically a bounce buffer provided it is used correctly and not leaked
elsewhere (which is the design; of course the implementation
needs to be verified and possibly fixed so that it matches the design).

cheers
luigi

> > - Needs bounce buffers: in Confidential Computing VMs, PISA allocators
> >   pre-decrypt 2MB pages in place, avoiding swiotlb bounce-buffer copies=
.
>
> It seems this was ignored too. We want the bounce buffers in CC. They
> serve a security purpose. You cannot loose control of the shared
> memory buffers have have them leak into SKBs, user mappings and so
> on. It is not secure.
>
> I don't see how any of this is valuable or necessary for CC,
> especially when we really don't even expect to have an vIOMMU for CC
> very often..
>
> Jason
