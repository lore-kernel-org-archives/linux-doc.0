Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8047604B
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816350; cv=pass; b=fsSwYY4jfV0B1uVhyYDvICOZ9nYBSyqEKPowTBkWeyKNo4RW126iVii59oyatfFMLd4Z67pvBakrC5UJk3LOFT0s+g3UCsz+Bw/QBHU893byb5+DQZLHDooq9dyw07Ob20kf/hVP6ZdpUtqFZEY58XM0glEYru2T+v8Ok8GlS3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816350; c=relaxed/simple;
	bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMzLHNqmVNejaOTY71fNOF8KIEYESCK9Nxz70qPL98SqkfdV8//955sR74vZRQ2l2Pk3MaLtE7vwUGC5d/8af28UoFR7RQ6cEU/kPhWKfEEvUyoYt92GHw1wkSTP15s7HbifCsVxFyc2uJQQLr58n3G/TvMV+2g3VTCgi55WIHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YV1nIL87; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YV1nIL87"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8623790f8so69935ad.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 07:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816348; cv=none;
        d=google.com; s=arc-20260327;
        b=ETfyJOjY36mzaPDiYffYGjDOdqOP05AuJepNvurU3/o6zYfjHbx4QkXiRwnG1e96Sp
         eHYP+PEzS/ggcsJwD5MKrEl2r9cMjv9mOGU3Hz7BcEVQzIwZqJRlIMagen1g2MQM/+4f
         ZVfNLSeBfXUkLaDzkU9AwSlMORbFjf4IGBj8JNEzObieS6TsTFHKTiyO97vq85IpNg44
         osfdgp3TUTSQacuCEe41jJH6f+HNBAuPvkHhPIwKXQljTM5JYrZmIknOGfngwTe9cT9r
         bm4ntBzJrjhwf4qOKogaSkJ6Xe5mwpZH0HrIzW4xet/+QNK1j0YtdLegNE2IiQxlii6u
         4JVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        fh=l5dumFxwp01C34QEywEZHrZKc5SnmHhjDFgcqmgw2ak=;
        b=G4zFuROgbvojyBg7CpwwJsvmSuBPbvLFmSWEPe2ubj8p3OgTHFtRSDPcJKjn64Wsq0
         zQwUm1fVBCnIXyQ7Exs+dCu4f83b0wqCtdXE8CYoOkUivHIl3B8yGTmF/Puz9cxPG712
         VPWo3KSBQSBs8FAX4X/fbgnHqXXUz7wt5CxkvqyjP0W9hJeMVbhAxzaBsfz1C1VrnG3q
         UOS37Ix5Bi6NUoFz311pmWgBFFtSrKirga5Pk0GrR2t6mqLG1CT9G8EdFuyQbLuFSd72
         8g5b8Ic5wMhCpd5rkeDlPMwT/p2hIq9BIZu44E3LJy0TfLyJ6rYNGcZ04AlR5GFCCYwH
         3t9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791816348; x=1792421148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        b=YV1nIL87WB0chWCYhBsQlibPiR2Py5WxJCJvL+Q/Yj/iYkHJoIQwA+jqaoEgeDy95O
         I8lpKx6a9aV26oUt9964X6lO6Qh5gGXKvrwlNNXZ6YN5QYOIKcGhvmt9Uk5GfcKxuJOv
         HlP84/Wh/E2Wn0088hHSi59Nq3PprGluLDu1x42kYT4i/lu+IJbsd4uARO6IuhCDDvML
         nuvfPeE63qNIdEDFiFUyPkTOPjI/o5knoLpKlJ8lhAXw26T83if+pJPG1hfvJyxduDMY
         34IzoOeYGefrn6tYQTFy158M1z2TdIheroJ67B8rKXzjmaiZPTesi8sjPT3al4ognDFJ
         Pmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816348; x=1792421148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        b=jwWgOubKZgnGyrNvV8uTop2JsNOUNnaqFR0m0TGIvKIBNzeAIzd8y6n0Kcu5xDHeAM
         xhUaQt6e3hhdMRGNnqCqsNXgRkySWjsb0FvCXm46FXhkvR9e4jjbegfsOhdBQy6nUGVW
         erkyuQC6gzQpzMzODhuVogKhz1lZG4WRRx4xQDv01CdYuZksrqrY5trh/tctBl8vFnFN
         9DZ6l/8uZUci/ZA2cEGjvD349HnfXqWwX5PKErxkVuSmxQu3mdlVU+mc5GnHfSDiLiOP
         hUZldMTKDH9Og48q7l/PeC6AcEIdSZh+jP/rMzRf+a21WVRpBGXHk/Up2pGg7unyuUXd
         DOmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxICLipw3p2prJhfaOiKLOA3h8EOTzfAX5Yp1LZeQ1NTgShbtj5bNOhF7FM8jN03m6kB89CpcZYvK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu2EfZc7RouOQQ1jfI040ssNP9dCk+bUPRlLFVngoo3+2pC5CZ
	n8ZeNSkr6v3PMKpjTdSBi3jQkuf/ICnYksNwD1hH/LKo4+YAJHPCxBwzMUaUd2hwRae97ar7J6S
	3YDGWVRyBRpXXTJtGIpvkyRphEEzGzmihh1ZVJ+DN
X-Gm-Gg: AYBFou1GZq9g2+fKFFIse/GJiHmyAnCvQqPCcVyHfGIWVNbRMCWnvK5sfyIIX9tSws+
	G1UlGSkFkXftwLI9oVp8yobuUBpbMVh35EVW+WXJ7GgmGkjruRbHzpmhQktnIb1/a4UejYqhNAJ
	PdeNDnOlKB2btPB42q44SoXLeS6tp0C6qD9pha85+4NZk6S67V09IcKuCJsfMHDUCNRvzWhkVDI
	qRk50fLwLjhhcfA6zMkAm18bUJssnA5sUJzQbgT7xATeRp3iHsY8v/3hVv1wD+iYRZqewtgaZti
	aK1yBtWvhiaKzqvAsgye1HPFxf/nL8ZvnOHL3xH37w6l/v0tJH6uGnGl
X-Received: by 2002:a17:902:ebc6:b0:2e2:d665:6ad8 with SMTP id
 d9443c01a7336-2e87bc2190fmr6225715ad.4.1791816347416; Mon, 12 Oct 2026
 07:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
In-Reply-To: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Mon, 12 Oct 2026 16:45:11 +0200
X-Gm-Features: AclHuK-i8fHHmdGq1sG19E58z4J25P_7xaX9lSE-RrDdVmPDw1ep2a8coGIVdbw
Message-ID: <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/3/26 23:22, Luigi Rizzo wrote:
> > Here is a subsystem called DMA_PMD on which I would like feedback on
> > architecture, possible enhancements, or kernel components that could be
> > reused to avoid duplication.
>
> Here is a feedback to a subsystem called DMA_PMD ;)
>
> Why is basing this on PMDs (and embedding it in the name) the right appro=
ach?
>
> On architctures with large PMDs (512 MiB on arm64 with 64k), would we rea=
lly
> want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) that=
 might
> possibly also have TLB benefits (cont-pte)?

I had to call it something... an earlier prototype used the name IOMMU_2M,
but I didn't want to suggest that the design was limited to 2M (it is not).

Aside from the name, the _current_ prototype restricts to 2M allocations,
exactly because too large units are expensive and wasteful.

In the code, decoupling the allocation size from the PMD size is trivial.

To enjoy the reduced IOTLB pressure the architecture needs to support
IOMMU leaves with the correct size. Looks like ARM supports a
"Contiguous" hint, but I am not sure how to tell if the hint is honored
(ie the IOTLB actually uses one entry for the full contiguous range)
other than measuring.

cheers
luigi
