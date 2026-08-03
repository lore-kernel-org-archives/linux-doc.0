Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4C2D3733
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784410; cv=pass; b=LkSXxjEme59yQO+UWEorVfjCNZp0LCRzbz8zzmH4dRhp/u6btOu1lEpxz7z7uqQWmI6xM9ui5lhJEzBoYDvwrW3VgtOBmq+wOV1rIkv97RwnzGr3Rl/xbhICjDq03auiO/SPV4Atgo4/Ki3LQ8PIDj0c9BcJCND2cP4FEWhPNoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784410; c=relaxed/simple;
	bh=nI0onuaG9wyqD8FHCDj8ZAQu5ZB6RKn93+hY53Lv48Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhShXYaIlbtriaOUtAqvLBj7Uobq5IjDLBNSokFJswadO6JSFKeNf4O+gemnmXlmHsNFAUzE3p0lHEgt7wdVjUyqJsn6C/JkWToyApotHpf1vjFTKwseEKo0E66oBr9gN+jKk6MwWoCrH4VsL9weHXp8ANA/dodqzaLVdUnHMHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A+8rchtB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oNVJwcBa; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A+8rchtB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oNVJwcBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785784407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nI0onuaG9wyqD8FHCDj8ZAQu5ZB6RKn93+hY53Lv48Q=;
	b=A+8rchtBGM15aCo72LPrHU8TufKlR54dqeKDVxcyabSNhoAwE/CDU2O2Lrzx0moJyYDz3t
	urkbRTFJ9gAETHLWbGrpc4zFF0lhRVLlBZ7wpH2cUhowLT1Ru/Os/PtJbsJEsxP7SfNAQB
	0MroqA1HRKhF6LYHAgPSJjDdGHa0mag=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-bz6PpkMxNh6yq1RwO6K-Fg-1; Mon, 03 Aug 2026 15:13:26 -0400
X-MC-Unique: bz6PpkMxNh6yq1RwO6K-Fg-1
X-Mimecast-MFC-AGG-ID: bz6PpkMxNh6yq1RwO6K-Fg_1785784405
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-39f27a480d1so8553231fa.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 12:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785784405; cv=none;
        d=google.com; s=arc-20260327;
        b=j1Arm9XvW0kdFN490eqhYhYp0ZwbJxWt5gVsfYSnt4MO8QqsTYLLVuAHLHlDSQebP+
         FLJssMTLwV5pNSKtdztc9fr1u9ZmB9KlPoRMpLs/TCmMXp2o9uJoLX3kwEMOVJAfWqtK
         F1VO2L6J4L6aO+Av/CEU8C8tbvv6bXRsxjY+0onZNsIG0GrfqQwAa3v/5Cqfeyyz+vrx
         qk1F42jGMm/rhiJmjMAQYAXWTNvEhvTgXAnwYhqMtcO7YKaWQsHlc3kV3o0NJIwy78Oy
         c1oetfpUWAEkqJc6g8WQW5Zm3bZy5Bc12v2hPxhBomK1ppvhqItM+oMtmrd4ze9A92z7
         2jfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nI0onuaG9wyqD8FHCDj8ZAQu5ZB6RKn93+hY53Lv48Q=;
        fh=J+Au3j5KpD+RWfhZgHc56gzRKlt1WA5T2Buv4ZpJWic=;
        b=sVM9LA4SZRLbobqzWgTPRuuY0bKEq5A2yvnkVb4OcBbm/6xMVX3WHCFyL9JvRBMVCQ
         xnEIdEMsu+CaUeMMeEqaWh8xTuT5pkP5bTUsg33qvRIj7wE5jVNjtlSWniRzvwkL2iXC
         4cK8GATbvDv34QWW/eRyx/ngiqfDOQb+E1cg6nRZq3Wjcx9LSP4MKTIVibOYX2iibPmo
         2wppn9ZL1kJMT7+Avppwh/2XJQR4dMxIRYLRm3k8h5dAVZpuy3BctxIKg8DNwmFAhCfP
         38F6JAgKCQ1PDPZmg0cvUQ7TFsgnpnjqlwilwZPbjk7v71XYifglSqHNuCrtnJ1oS332
         aSdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785784405; x=1786389205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nI0onuaG9wyqD8FHCDj8ZAQu5ZB6RKn93+hY53Lv48Q=;
        b=oNVJwcBaZB/hpWhQZ/MmWgYNTKEdRLIzqvnXQc/U78/Bumpe0RpZOlCOvBaTgfjTu0
         moaoprU/lJEfj2NOvkfnxj2DQUrYt2hwx67Xyn9Oogm6/tWeahKs7B8QiNo2pgXgjMW0
         wO7cIMyr+n8sLLreUqQqR4a2buzKLO3SaUpGFJAM8K1NrPfV5EJ6BibCTUotUlm6wMcG
         2picpP3nWTfQw5m8R9J9bDZH03CLDIIrMUJKfTwOiJX+Vxbb9QgtzCjFJ1gKeHJXeSY+
         liF61nGz8vIuzOsoH/lHVA6K3caUT94N2f5kzjH0qZ3ybWBJg/OPYeZsyRY4Zrtnv83a
         YT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784405; x=1786389205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nI0onuaG9wyqD8FHCDj8ZAQu5ZB6RKn93+hY53Lv48Q=;
        b=S+Ox876oFe+NY74UZ64DJg/Zpat9GfWA7qd4Z/oVjLBmSX15BcZ14ScHX0+xJnMdgP
         MPAKMxsBCjkmaKkEAR9rcSTWfjqinOk+b5fhu2bQCVoPNoIzw4xuyUrBg3XnA6k6Wise
         Pa06FZh5Q9mUYGFznkF0n8o7FP5IIjNjApu47MEwsp++0scSPgREtz5yMQ6BQWHHfFJe
         Fypoi5KH+hUK399uJ5uZwfiRKOwjbth7COuUf/Gi0KYSbvPI0SKDVDfcrvh6qsl2ZxCT
         apOzBmEbHQYmG9yfcNzh8njEBkUdwz3dffn4Ub2BoxN+bBbcfSfmwWw5o9QI9/Eka4su
         vxgg==
X-Forwarded-Encrypted: i=1; AHgh+RpzPst2oSEHynkawne91zeJhGP8E/hyjekwwxzyaw9HxqJkjIfCGWXmxQOBd2jWxkcwBQh5sOKmQx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/es6jdT9n1x3MFvqhWA8c3twonJ5dAYJGf98b2uN8BgTzl4J7
	MUsuKSRw86w8e+rx8STtuNWvOrlSoKK4sAenyDjf3Ni9V57ClcDpRrxk4qdNwqLOuNFKNTLrGM4
	sgmvkkbm/Dh8BFmFYedt0Ml6nt4H5DPk/xz2M5sXZH1jqyqUBX6dDW2DQjSMis47Yk2yFCdkQpm
	p5hVvMbCgB3bOcLNGJyquJsUSWw+I+pyDkqqMT
X-Gm-Gg: AR+sD11SibrQHVBBw9VMQur1cvE05GTSGtaZAeYJeywonlBvRn2YZKXrZBZcBVAn6Sy
	CnppEdk4xO8guHCOp64L452qNJP52bwEoE+r702SY9IuIe+hKCAno1YpKjZCM0dPuJRqQxBFJjO
	QClXM/2R6xNKtIW2hVAVPIl3k5AreH3We6VaPa6yUU2TDw3yyd9jZhx4w1ig==
X-Received: by 2002:a05:651c:546:b0:39f:6885:ddcc with SMTP id 38308e7fff4ca-39f862f3e40mr21667811fa.24.1785784404778;
        Mon, 03 Aug 2026 12:13:24 -0700 (PDT)
X-Received: by 2002:a05:651c:546:b0:39f:6885:ddcc with SMTP id
 38308e7fff4ca-39f862f3e40mr21667551fa.24.1785784404363; Mon, 03 Aug 2026
 12:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715025941.1571316-1-npache@redhat.com> <20260715025941.1571316-3-npache@redhat.com>
 <ffb091ee-affe-41b2-939c-6437dd9cc13e@kernel.org> <20260730075217.qulyrc5s7olumqzp@master>
 <06b93266-d395-422a-9267-850c59b9f207@kernel.org>
In-Reply-To: <06b93266-d395-422a-9267-850c59b9f207@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Mon, 3 Aug 2026 13:12:57 -0600
X-Gm-Features: AUfX_mzLwaApnVm3544174r0RM6986sec5f6D1TWtNZFeSAY5qkb-whkHEOyvG8
Message-ID: <CAA1CXcA9cgQOvObiE2bECPaAV2=v84b-tDAwLY8UYrRVm1wqOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mm/khugepaged: extract young page check into
 collapse_is_referenced() helper
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 6:16=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 7/30/26 09:52, Wei Yang wrote:
> > On Wed, Jul 29, 2026 at 11:47:00AM +0200, David Hildenbrand (Arm) wrote=
:
> >> On 7/15/26 04:59, Nico Pache wrote:
> >>> This change deduplicates the "is this PTE/folio referenced enough to =
be
> >>> considered for a collapse" condition that was repeated in both
> >>> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it=
 into
> >>> a single inline helper function.
> >>>
> >>> Also move the comment and use it as the function header. While we are=
 at
> >>> it, updated the comment to clarify that a young pte is a recently acc=
essed
> >>> one.
> >>>
> >>> Acked-by: Usama Arif <usama.arif@linux.dev>
> >>> Signed-off-by: Nico Pache <npache@redhat.com>
> >>> ---
> >>
> >> Also, do we really need this (badly named :) ) helper given that there=
 will only
> >> be a single invocation after #5?
> >>
> >
> > Hi, David
> >
> > I see collapse_is_referenced() is invoked by collapse_scan_pmd() and
> > __collapse_huge_page_isolate() after applying the whole series.
> >
> > I didn't see #5 refactor this out. Or I missed something?
>
> Looks like I was daydreaming when skimming #5 :D

Yeah it does get utilized twice :)

Regarding the naming, do you have a better suggestion? I had
collapse_is_young before...

Perhaps pte_is_referenced()? or _is_young()?

Cheers,
-- Nico

>
> --
> Cheers,
>
> David
>

