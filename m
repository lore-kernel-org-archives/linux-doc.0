Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39B29BDB8
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759938507; cv=none; b=SfdJJ0F9+lPJe8UqxNChnPwx8MQXAj48uze0gaOY75yVkUPcXCH3oPt/wq5nrxm6SvDSuq+hgy+p1tvvYqC5TBEyiHVdpHOzE9nHWgHddQXY1r3E4Loal/q8n8QX3ds/XCF+xt6c2Unye2NPszwlN2zeUkBdyXoK2JcGGr+akEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759938507; c=relaxed/simple;
	bh=2LGlFA5NwtyOxfaDrKcUAZJIjkhQzJAUzFr0Gk/nflE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOpN0S/VJDuWU321R81LMAI7fHheRrahyAH7OfRlW/4M4829Y8H8Tumo7aAB0mjZ0Gcfmpeg1O+/pKGQPGqIXMWr7ZIbYbv1srW1cs+gnrfACYAZkxCf6eWXP3w/Y/4C51exz+mPdL/T+lK2TxydNX0pmM+bf/8rFMpbVJB85mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjEQDZ0e; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjEQDZ0e"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-90926724bceso652213739f.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759938504; x=1760543304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jnz0wfzGjq/RWuaaZQleG175ixspg2bx6DBLy2dhJEw=;
        b=NjEQDZ0e+OjvIUJHDRJM8zmfiSQou+zCsZhFrnHNymWHaO9R3AAaUawpvmsElBIic8
         BEYrsmgKe6E0WdmwUDCqLsWBrQhlADzPcTrROf0bBSX+aWogmvmArCOZbqWFGJeXrO6Y
         7r9dyCjYb5PFpyajmlklxCBM6RrFP44wcb8MgAG81oijFE++n+QVYPquZPlRHsbvjF6b
         qQtwtPaRqIPd+996wRbTSSxObylYCnnO/2445hrBTEytMUGMyQ/GTMkpD6OxACJY4Xlf
         ferb6lR/TukJWJ6TS0w+Fk6k1AzmLCEE9asIAWaulMcYDyP1tcqTeug0NB4b16B0OIg8
         w4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938504; x=1760543304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jnz0wfzGjq/RWuaaZQleG175ixspg2bx6DBLy2dhJEw=;
        b=IBC2Oy4K+qMYSRnU/ZKbe8aVBzXIKj84CxR+N6X5dYsMIN4ziMp/lcv6hwgEkAW0cm
         po950jFPp+DOHaxvdu5J7c0M+ixbuKf3qy4Zei8amQhZXhiHekgSf0YxoZoX1IjHo74h
         t4IzChLNQdgzUgnPc/RmoXDK6p69+AN/cZk6GLxr7SWThDakKKML/aESzmK6AyYWNJna
         CF+/jSbm1FgRIVe1uGrMnP7L+04EYUY++RBUFDxATvYoarBrS3Prd4ba3xFpdEFiZRJK
         9axLM7vYBMUMDgoeKz21zdXS+i7XBWqEHriBTyezLCutSiatEqR2E3YnbDoDfn7FKgy/
         AfOw==
X-Forwarded-Encrypted: i=1; AJvYcCVr2Xd1b+IS5+ZKQ7KB7LFUjUmew5bdn19YirDtfP9CzPL900JlObtpP1edryDK3y1pc9DfJWMH68o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUqVZ0HRLdGfZL/uGLXP4WwJi2ibhKBYWK5LnMLSjSl18hoiob
	SNBv2ezDwumCMtIiBtoQ68MdrP6+n5k3A/xS+HOrd7qGcJ7jaXYb/eUfDePcr9vTuUJ0mUSf9cj
	2vKgN6co9MIlbgNHGqkanppGM6Hh+YJw=
X-Gm-Gg: ASbGnctD5u3XBJtJ1kN+nVXlktQAZomNyA/wInB8Hi99Bu2TMOxouzl0uR4X85CUxlm
	og0eaHOjt/rgTgRM3hSWdZ46tJWuhZZfd9o/teRtXRiS1ucN3zgY2FYpo1Qxjxu3uQENXh0m9AJ
	52m+SxTGLyhd4tHcMDgyzQU6H906uGebpYKSKW2Rz0lqgBEpBJqqUC2G/kFHGmQ01RzxwmAv64x
	4S2X8tz2yqAe9ydZ/2aDROwPfHJ
X-Google-Smtp-Source: AGHT+IEkR8j835l36xMLsRghzDg6ytuUIEPKbr6li+EEc40XA820BGG77XOwW3X2r8mrb0/M/8veOVpZAajhmXsAn5Y=
X-Received: by 2002:a05:6602:340d:b0:8d3:6ac1:4dd3 with SMTP id
 ca18e2360f4ac-93bd18b16bdmr434509839f.6.1759938504211; Wed, 08 Oct 2025
 08:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003203851.43128-1-sj@kernel.org> <20251003203851.43128-5-sj@kernel.org>
In-Reply-To: <20251003203851.43128-5-sj@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 8 Oct 2025 08:48:13 -0700
X-Gm-Features: AS18NWC5GQ_ulUnl9tKx3ywuwAWkm3a_xsU1pqdxQwVuJQmPm7aLfdyq0B3aGXQ
Message-ID: <CAKEwX=M1JiHzgLVvROjfd2Pz7E6c4DCgzn85aWHPS+6qKMeS1w@mail.gmail.com>
Subject: Re: [PATCH 4/4] Docs/admin-guide/mm/zswap: s/red-black tree/xarray/
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, David Hildenbrand <david@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, kernel-team@meta.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 1:38=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote:
>
> The change from commit 796c2c23e14e ("zswap: replace RB tree with
> xarray") is not reflected on the document.  Update the document.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  Documentation/admin-guide/mm/zswap.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin=
-guide/mm/zswap.rst
> index 283d77217c6f..2464425c783d 100644
> --- a/Documentation/admin-guide/mm/zswap.rst
> +++ b/Documentation/admin-guide/mm/zswap.rst
> @@ -59,11 +59,11 @@ returned by the allocation routine and that handle mu=
st be mapped before being
>  accessed.  The compressed memory pool grows on demand and shrinks as com=
pressed
>  pages are freed.  The pool is not preallocated.
>
> -When a swap page is passed from swapout to zswap, zswap maintains a mapp=
ing
> -of the swap entry, a combination of the swap type and swap offset, to th=
e
> -zsmalloc handle that references that compressed swap page.  This mapping=
 is
> -achieved with a red-black tree per swap type.  The swap offset is the se=
arch
> -key for the tree nodes.
> +When a swap page is passed from swapout to zswap, zswap maintains a mapp=
ing of
> +the swap entry, a combination of the swap type and swap offset, to the z=
smalloc
> +handle that references that compressed swap page.  This mapping is achie=
ved
> +with an xarray per swap type.  The swap offset is the search key for the=
 xarray
> +nodes.
>

Acked-by: Nhat Pham <nphamcs@gmail.com>
