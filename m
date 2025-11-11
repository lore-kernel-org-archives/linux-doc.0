Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CC12D3A9E
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762842462; cv=none; b=ZFVjDe9N48GApx9w7esFxy/6z5JMrLsrPlx1hPtL3X3E+bjg6OXpWQ9K3/ikR2wtEuPFA03/NV3MAIor0m13d69tmns4xBLxJUqHMCxH7XlR24LXvYYBrIT6PjtoGdzK48U1e4faahtL1VLdQpWpyeQDUjIURypAuSo1hvj8OMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762842462; c=relaxed/simple;
	bh=89750Oqu/BHAULCo/u4k/dwdc+TJgBdi3kwqH7WW9JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kmuLiLuTTNZNdFv3e/k/spUEWL1cW6ldA+7xQ1iLDkT4wN8ygiLcXIEH3h0+JLpPHXHG5Zr4m06TArpb13ezSFr3XXkqysudK3roKNLw4/JouGmqjzjDGUUGULU+TV4mGWQPzlxYi2YVcLgRI2sOFsVLgCmzfA2RE3T/BxRIGaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=GdJyNN46; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="GdJyNN46"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1838179b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 22:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1762842460; x=1763447260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89750Oqu/BHAULCo/u4k/dwdc+TJgBdi3kwqH7WW9JE=;
        b=GdJyNN46yLS3b1G+msP90X37DCoOmpaIXITKAdfe2Wc/tmb9yxRG1a3IFybkmtc1Fs
         NWvJT5mg7aCURM9KiMMFcgpvoaJDlYuHSM2FAAY2Ehh9M1Y9VK9577s0NKfeQsdeeypR
         mHEt9SsHqQPxA294PcPAjAduH5P9eCe3DLr0fi/W3yjcGkwYA9fGv+9Uv5Q8cGuFptRB
         GX/KuT/unYj/jp+ugjhaQ3ff82srJeJTVZArMTV/RawhUfBCp0E9j4e6T7gC9ppnLsgl
         mppvkVMWY+9xWYNwRI8VJoPhiyx+d6kwYCR8WEa7DfOO5QdC7cb3ANm85HVO/3V+NT+L
         ZaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762842460; x=1763447260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=89750Oqu/BHAULCo/u4k/dwdc+TJgBdi3kwqH7WW9JE=;
        b=jv3CjTXmlEdLZQL8B84PoK+ROyA/d5RQQt655z60maHtpqXUqYDJJO+VJr8+D2LsDW
         r6W/iB8TsCk9EBAowhdl9xcf6Ntna7ckSe2qBBMLNPqO8DcxgoabNPJ1J1niN38vCfg2
         p+ZDD+21l3dz/RLoOKZwbCV5Iu+9JqawJy6EadyGECumkKu1y93ORIFAvR8Zpn+T6Ys9
         L8xKaeil1o5buSFarRkDvvvdim+UMS0n6gGVdHxXWgEN0uEJB3JEuWy0UikbHzWoaUTi
         Ex7rNwqCytX9yXsmuGZ8LhmZs3i+lHGkUeyX2nLjpdXIUjRASIQAfZumxx8gxXHzXnWR
         JDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDw2YLt59KldaZAR34Z6vyv/bJFOz5FvyrEgcPGlRIK8GIopLgK77w6rlNr1ftQgWly2VoM0aEY64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRHeGkxG12GYg0xZr4dJiwLoPTCxZV6dI5Sjnx7Id7TZVmPl0q
	6sdLUqhrIcB9eoTwPbrxYV053DBvgj6YYK+M54jMOKas7h9T2zQLTySwuv+nHceVdqE=
X-Gm-Gg: ASbGncuaHqhXCKLvQeWa7sUALfC8m++OXoS4mUAD21rT8kAuRNW1YgxkQe19m2Uyrk6
	/U+O+8yUxPgUOIKmfR8AmjEUXtE4lYO7lVcstEeGw2qHFbLd28iHFwW131BVl8jo56U45fRHbY7
	xnUkK8gGM4Raolra274L/dEHNDbnX0v3A67bboe0om6HA0bpXUYNAF+kDKFlLDKSDJzUx5Os7mp
	h9o6e2jdxojB1gOYc9T9dMMCjA0ReaRDbvarLMR0h3LY7O3+FJEvL+4LMKHcatNdottT1LdmGAf
	EH3oOcb4SxgJW/rf+F7en+OC/R3wUpZYGgrLCIbZKYPmMxNTRwYSEkQ/VGvlH617fKEEDLgCeW6
	16BaTFqzuYsD22VoMGi9AB4DtmroSr7y/nHaTFi5Vrkp7fpXQVswHtBDVTKNtVxfd9C7+bmWkDg
	EfffVwvDs707T5WNetCwZrLVVF
X-Google-Smtp-Source: AGHT+IHvv3nGqmj6KV33XK0cWeJgSfI0JoC5d0X073m/gYYS8JMWAEkjk7xwepmEOfVYPNtHkdK8iw==
X-Received: by 2002:a17:90b:3c09:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-3436cbf60c3mr13213813a91.22.1762842460272;
        Mon, 10 Nov 2025 22:27:40 -0800 (PST)
Received: from .shopee.com ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c6951633sm14267754b3a.0.2025.11.10.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:27:39 -0800 (PST)
From: Leon Huang Fu <leon.huangfu@shopee.com>
To: tj@kernel.org
Cc: akpm@linux-foundation.org,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	jack@suse.cz,
	joel.granados@kernel.org,
	kyle.meyer@hpe.com,
	lance.yang@linux.dev,
	laoar.shao@gmail.com,
	leon.huangfu@shopee.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mclapinski@google.com,
	mhocko@kernel.org,
	mkoutny@suse.com,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for on-demand stats flushing
Date: Tue, 11 Nov 2025 14:27:30 +0800
Message-ID: <20251111062732.72880-1-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <aRINDrnnI1HVvU1p@slm.duckdns.org>
References: <aRINDrnnI1HVvU1p@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 11, 2025 at 12:04 AM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,

Hi Tejun,

>
> On Mon, Nov 10, 2025 at 02:50:11PM +0100, Michal Koutnı wrote:
> > All in all, I'd like to have more backing data on insufficiency of (all
> > the) rstat optimizations before opening explicit flushes like this
> > (especially when it's meant to be exposed by BPF already).
>
> +1. If the current behavior introduces errors too significant to ignore, I'd
> much rather see it fixed from the implementation side rather than exposing
> internal operation details like this.
>

I haven't observed any significant errors with the current behavior.

That said, I agree that we should focus on improving the flushing
implementation to enhance stats accuracy on high-core-count systems.
I'll review both the synchronous and asynchronous flushing paths to see
where we can tighten things up.

Thanks,
Leon
