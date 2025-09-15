Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803422EAD14
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757949955; cv=none; b=ZpkYQCBW9yqrXe8LI6wov9rGwnSF/A8caAjQpu8mzH0Ri4PLGOhli/W29B1QiaZnMFaLNILH+UMZo81IsQt0SW4nFPNkY6CxHbOCzZwTDVeJVRxXjuAJoRGoduno7ootlYYmhg/sZh8qH2jKlQN5uI7XqCgrimyOiq9jcMi9f5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757949955; c=relaxed/simple;
	bh=bT79mZWoVpCNSPqKjzxE1zifFi0RNZXBKcyX9tuKui8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcsIafP7IBbUtlLC8wgFDRRWiZGBYtoXdwk4vlh9aBqKCMEq+KfE4xAH/Ui0rQmv2tUrEpWkKfvC3ZP9CV3bBF1YWeDlrl7cwnVD8Gt42ds02ZCWnqhEpx4gGF/+ZFZGK6Lkfsn3x7z1Bz6qZw3PIR9h8sDnrnnBvovwKBHj/OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhG8h3aj; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhG8h3aj"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b5e35453acso54698331cf.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757949952; x=1758554752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twOjmxypi8F5/wktXXyH6UWMyBziK0bLBGe5jYGqXDA=;
        b=AhG8h3ajwT2Xhbx16fjiOfnh9ZjxkUA4BhjUFNQmzLUHq+utrE90Ynyf6Lo2cTeAGN
         qannMeOFKPqKKw0cEl2OWUmD+oklX+N9uPMMbSEkOa3RHLI574R6/jjpuLfXxMQ2sxjk
         LYCyW2HB+WFlovYXe5M3OWZFJ+KrpW9gqELLSaLOhCaOSocZQ+Fcr0zOd+NMuwruDxsz
         VBzRT32aBHlqatiG58kLex/3NbNAmkkdyuOVpMdwJGBUyIMFlGXtn8G6tCAkcNN9FmDs
         IshfONhVTrEvoo0jplLT2SQidvgGR7hKY7gWzAvMjr6f7LzyuINDnPZVnWH1+l6Df+uo
         baRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757949952; x=1758554752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twOjmxypi8F5/wktXXyH6UWMyBziK0bLBGe5jYGqXDA=;
        b=AHAQyqxvFkzWWd6Nv2BI4FxGsw1AJx/XEkZ3EvfCGqb9WVd8MbXtujzh1RWfXf+UrT
         XW6h/2iX6RFiTXfidb0WEI92PQQwH7FkarQtjo7KXMImhlYonkyjBZq4sft91eJBvFOY
         JLqXdwVraKbilntNLj7Ps4Yhac03UPBlF/Gfm/FWPSLhPyjfxmc2up82VIwXxIzJxQ4d
         Phh4Bl4Am9cxcBNv3GbrluxR3B0R3n/ajADyDM9MFXDxyiRS4YuCoqyIwgBGA0V11q/e
         9Py3DmWuznNClfc5YSEgQbY0QaRF8snK99AIZjq7uIJsLOgK5T5gfamCMYHJhoa+nVxi
         X2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUx+A6nuZUaH7PU3cPeEaYn3x/ABtWUajN7+1igCxTZPTBP1IP61Bzltl/LAvYQp/y/iP3AKLQ6YwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhWopIltwdzCI4VRKj/ooF4jPEMapc8xh45c+eizmfV+7Rzfcl
	xClmzymVw1W+ChAcusBFK1ECxdr0WgqzqH7DPm0w3bGWscIpVrKWB2rxlPPAc992s9PHqRItAzT
	y6R5g6loQA0CUyznrXai+YlvLoZ4SqEc=
X-Gm-Gg: ASbGnct2NaKDNBOe/y/mDAHpIupNGKXyH6heyG5yEo86Tu4L17tYGovh9pAsXuCsolm
	qJ+hxWQHLN3HPZHz/DuMqkkQycS0FrlQ4bRfLOTiBS702KOlZ593iyFKJJPzWs9Bf9O+0fjRO65
	t2BCSbQSu2YEe7OVb8MHW+4EufQt6ukCiA4qLMvgQcA6Nl+KhGq4LsX8/YLm1jQv4/B93m7kOe2
	yPs1MQfmQQTvws4EHqS2Kp4C1ur083XetRImQX5st0Rt2IxGo0=
X-Google-Smtp-Source: AGHT+IG0lj4OHOWbpCyzpHkhetLcDU4pJdQ9spR9svWGOUH3xKPwb7pLVnXSJvywltfC7gPj6m2GvwN33sLw0OSiuQ8=
X-Received: by 2002:a05:622a:a19:b0:4b7:9f68:52d6 with SMTP id
 d75a77b69052e-4b79f686bfbmr58374191cf.9.1757949952122; Mon, 15 Sep 2025
 08:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915015807.101505-1-sj@kernel.org> <20250915150851.1508878-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20250915150851.1508878-1-joshua.hahnjy@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 15 Sep 2025 08:25:40 -0700
X-Gm-Features: Ac12FXzQhzLPiwahg8l4GbB3zTsY9ipEubXDL1xh87e6emG51matFCCQ0FbehiY
Message-ID: <CAJnrk1ZHdt-sj4n2VigW6u6bnd-gX47WpUfaHDxqN1BH4JGUXw@mail.gmail.com>
Subject: Re: [PATCH 0/6] mm/damon: misc fixups and improvements for 6.18
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, damon@lists.linux.dev, 
	kernel-team@meta.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 8:08=E2=80=AFAM Joshua Hahn <joshua.hahnjy@gmail.co=
m> wrote:
>
> On Sun, 14 Sep 2025 18:58:01 -0700 SeongJae Park <sj@kernel.org> wrote:
>
> > Misc fixes and improvements for DAMON that are not critical and
> > therefore aims to be merged into Linux 6.18-rc1.
> >
> > The first patch improves DAMON's age counting for nr_accesses zero
> > to/from non-zero changes.
> >
> > The second patch fixes an initial DAMOS apply interval delay issue that
> > is not realistic but still could happen on an odd setup.
> >
> > The third patch fixes wrongly written code that doesn't cause any real
> > problem but could make code review confusing.
> >
> > The fourth and the fifth patches update DAMON community meetup
> > description and DAMON user-space tool example command for DAMOS usage,
> > respectively.
> >
> > Finally, the sixth patch updates MAINTAINERS section name for DAMON to
> > just DAMON.
>
> Hi SJ,
>
> I was unable to find this sixth patch on the mailing list. Maybe it got d=
ropped
> somewhere? : -)

I'm seeing it show up for me, this is the link I'm looking at
https://lore.kernel.org/all/20250915015807.101505-7-sj@kernel.org/

>
> > Changes from RFC
> > (https://lore.kernel.org/20250909034353.7064-1-sj@kernel.org)
> > - The RFC was only for the first patch
> > - Rebase and wordsmith the first patch
> > - Add a few misc fixes and improvements for 6.18 to the series
> >
> > SeongJae Park (6):
> >   mm/damon/core: reset age if nr_accesses changes between non-zero and
> >     zero
> >   mm/damon/core: set effective quota on first charge window
> >   mm/damon/lru_sort: use param_ctx correctly
> >   Docs/mm/damon/maintainer-profile: update community meetup for
> >     reservation requirements
> >   Docs/admin-guide/mm/damon/start: add --target_pid to DAMOS example
> >     command
> >   MAINTAINERS: rename DAMON section
> >
> >  Documentation/admin-guide/mm/damon/start.rst  |  2 +-
> >  Documentation/mm/damon/maintainer-profile.rst | 17 ++++++-----------
> >  MAINTAINERS                                   |  2 +-
> >  mm/damon/core.c                               |  7 ++++++-
> >  mm/damon/lru_sort.c                           |  2 +-
> >  5 files changed, 15 insertions(+), 15 deletions(-)
> >
> >
> > base-commit: d245e17d619ea0336d50b0a6c914f5701d1b0e53
> > --
> > 2.39.5
>
> Sent using hkml (https://github.com/sjp38/hackermail)
