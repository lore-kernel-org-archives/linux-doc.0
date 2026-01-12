Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A61029E11A
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 23:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261259; cv=none; b=NKNDVN4+F3qgVue8L31nwuksYXT6IJGoQQnKtudBMa/443F/0WAYEd4v9T/W7Bu18jjIFkul26aIp2Uf4/ylHroTeNhAbyhaq7VcZ+UyTm45DLuNBjrG0Uw9OYRh4OyD5SRM97qltG1xcpma6Luzu9E+uGb1eV4BNQr5aU12ir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261259; c=relaxed/simple;
	bh=AUWLVB42LRP3Zrefwivb6vdVAhUxvr7KXl/fEwzONGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvwV5on7OLeVlD0JDMa6LjydA8QCSpNQoDilmH7/q3/fzFJVFKCTXSwos2cZpzZV7aRyIJZujNPL3dDUZRjd4Vt7afzZXVrdJiRdGPLgJEp4rylnbUqulq3FsbCfJ0D32sjFJvBtSUaSNsuNYSuwkXXWbIU1Hu4biqd6ilNBq5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=pjMhlaYP; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="pjMhlaYP"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8908f5ed4aeso55795296d6.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 15:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1768261256; x=1768866056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMPIlr+0naNU5kMo2DwX+nChgxcRBVo8GV+FHyiHDrM=;
        b=pjMhlaYPyxVVaBwbmKoshuhidOVjixLdPdFvDYawO1J7Xs2m13FfOZ1I17yIuFhUJy
         WUT2j2HgcuQu0Oj7ylWEeDQ1lino9psab+M9wXypwGuesRYHHzFs0FtBYd88OgMwNVgS
         t5GeYt5lr3CiPDJLTt9219egn8uw1UmceGEQvJnehROkpt1zkMm1W09BdtKyU6pbyTKY
         iuLPomhI7uNwIAalTLEw4mqS7ViG7fimbNsP12w2DNXdziX6KrNagP7luJnubuhUM8Vh
         qRSo0n9CKY8PigVwWmMYOwY9VY/3Qygua1hb+/2OiTyxG1+kDDIHVLOJ5HN48drlEhRq
         jnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768261256; x=1768866056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMPIlr+0naNU5kMo2DwX+nChgxcRBVo8GV+FHyiHDrM=;
        b=pd0GoG4cKQQsGofUZpj5E4Jg0usKWwyONzAgZsesjDrIWyGbAWV49cnRn+w2xGa1It
         9u+AGLQDrkSQWbbpAdzVjwr45vgbLpJmLM6ip2GbiGniaw+RY2UF8EZbPtHIwUMPKy8r
         MxWfsa3VP2tKzmVLmvlQju07BBZGLJI/NNxVrzYk6vmBmVWSim1uaZq+KKMwWQNC+f0p
         5GreDhltMsGD55PM4DqaOsmDpv3qDFX9cO1rHXQpDHYx0gNKPjsyb4S4NSgFA7dQuMKe
         vmL2uDIUuM9LumwLHasffnpSmIHoimdYDtLffTlZVWVdZAE00jPQu0Og4EEV0bm4MgaX
         GCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLP3V3jnrLLxOoPLzXQJjo4XVJ4GZtdqPCpojgRv6Zx8kU/YIV15rXkpDPEBozo5uS4avRzBAzDR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qmBZDDMK+0AEl81Nx1Ybluqo6bvb1oYlGrEEXO0/jI/lgstR
	R34iV2McnNx8FKYoujMqKWM2pIOajVqce9A6+S79baN1LiPlyE9WXukbETvegqKROQE=
X-Gm-Gg: AY/fxX6zHZmdvSTttdZWDt/4VPgaH2Gvq1ioG79cq7inMdyMFcD3Cd5JLNe8jBKg923
	EfupvLoyp+v94OFgpjt2cznRbLET8plNO/OYDcwcWcZn3lievKE5mYpNWy+/7Vkc39hvIyJADUD
	Gs/J+2OHRFIqN0/MuJbwR40IYuoLfeQlZDHS9BzMGOymfrvFRz0ErWIyrETyoObhZyZVfjkf6xZ
	JfbFvFrka3uUSzomFP+DFptznBuf+/aEbIyvtCLbvVfbcU28AXzNSBgYwovGAwYqgl2HE5TvREo
	pIjahgC0lnU2X/4ERItSfWxcYJ240tX2EZ2qIlottztME2lhUzV3hUDt4JcRZEclLyS0pD9pC+p
	VYseREYu5127c6Lo+pdm2aqjJikMecvXFcNxm1GmDiXlN/eZitPTsvrpvRyEbnugKisg5qrMlVc
	dGXBoMboLrNh2dV+giaYxh9FKC16Nh7qKh92EwVuBzS5850/q4uiILbKXbYzm2V24krn0FWw==
X-Google-Smtp-Source: AGHT+IFzyx3JnI+bFcbUp+3l5iKXvAuxuT7zO7857F9qVshwDcYCVr5Df5mi4k65Skb1cKr5CB/URA==
X-Received: by 2002:a05:6214:5901:b0:880:4690:3bb8 with SMTP id 6a1803df08f44-8908420e7dcmr284078116d6.18.1768261256343;
        Mon, 12 Jan 2026 15:40:56 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e8cfasm146393266d6.21.2026.01.12.15.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 15:40:54 -0800 (PST)
Date: Mon, 12 Jan 2026 18:40:21 -0500
From: Gregory Price <gourry@gourry.net>
To: Balbir Singh <balbirs@nvidia.com>
Cc: dan.j.williams@intel.com, Yury Norov <ynorov@nvidia.com>,
	linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com, longman@redhat.com, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, corbet@lwn.net,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, jackmanb@google.com, ziy@nvidia.com,
	david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, rientjes@google.com,
	shakeel.butt@linux.dev, chrisl@kernel.org, kasong@tencent.com,
	shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com,
	baohua@kernel.org, yosry.ahmed@linux.dev, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev, osalvador@suse.de,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
	cl@gentwo.org, harry.yoo@oracle.com, zhengqi.arch@bytedance.com
Subject: Re: [RFC PATCH v3 0/8] mm,numa: N_PRIVATE node isolation for
 device-managed memory
Message-ID: <aWWGZVsY84D7YNu1@gourry-fedora-PF4VCD3F>
References: <20260108203755.1163107-1-gourry@gourry.net>
 <6604d787-1744-4acf-80c0-e428fee1677e@nvidia.com>
 <aWUHAboKw28XepWr@gourry-fedora-PF4VCD3F>
 <aWUs8Fx2CG07F81e@yury>
 <696566a1e228d_2071810076@dwillia2-mobl4.notmuch>
 <e635e534-5aa6-485a-bd5c-7a0bc69f14f2@nvidia.com>
 <696571507b075_20718100d4@dwillia2-mobl4.notmuch>
 <966ce77a-c055-4ab8-9c40-d02de7b67895@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <966ce77a-c055-4ab8-9c40-d02de7b67895@nvidia.com>

On Tue, Jan 13, 2026 at 09:54:32AM +1100, Balbir Singh wrote:
> On 1/13/26 08:10, dan.j.williams@intel.com wrote:
> > Balbir Singh wrote:
> > [..]
> >>> I agree with Gregory the name does not matter as much as the
> >>> documentation explaining what the name means. I am ok if others do not
> >>> sign onto the rationale for why not include _MEMORY, but lets capture
> >>> something that tries to clarify that this is a unique node state that
> >>> can have "all of the above" memory types relative to the existing
> >>> _MEMORY states.
> >>>
> >>
> >> To me, N_ is a common prefix, we do have N_HIGH_MEMORY, N_NORMAL_MEMORY.
> >> N_PRIVATE does not tell me if it's CPU or memory related.
> > 
> > True that confusion about whether N_PRIVATE can apply to CPUs is there.
> > How about split the difference and call this:
> > 
> >     N_MEM_PRIVATE
> > 
> > To make it both distinct from _MEMORY and _HIGH_MEMORY which describe
> > ZONE limitations and distinct from N_CPU.
> 
> I'd be open to that name, how about N_MEMORY_PRIVATE? So then N_MEMORY
> becomes (N_MEMORY_PUBLIC by default)
>

N_MEMORY_PUBLIC is forcing everyone else to change for the sake a new
feature, better to keep it N_MEM[ORY]_PRIVATE if anything

~Gregory
