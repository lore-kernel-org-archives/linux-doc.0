Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446829;
	b=QheM2w+IF99MZB+KEY22kxYrjoiaV/KUgjV/FxzPovLaOdKZfUwpbgrh4sDmUC6quxjQ
	 kf5+JZP/2sA8YvjhAt9Npw2DiuX04GF/iZu3iFpAyN+Vwup1AuGiogtxK7B/D4G5VKnhC
	 pWtQxANdrfa/RjJZw34/f1ejhQo9Ig70GsUR58PLNuDUpuehXkmDZTmLpaKo2mdLw/bDI
	 tw6cseQn054DieEcpwPpkhVi05RKubvi+RwDZXcYZ8S4/XoIGG1lpowq6q+3t1GrG557z
	 6t1M9yxuM7lZJMH6mubJGoHZl3/TSfbcw7Hh72QOn8ohb8E73cHKPukpMBhjeasfKOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=Pf+orCI2rLpYXGk3dzBIrPS1HgJeZ6wmt3S+jICR+IQ=;
	b=wNR1TvJhkZCqqvVK7SQdWQfCdwkIomkGrq/1vW3VxE27vJeaTWrUJ/fJk8soYaWCCQIG
	 5ckd0U0cvWpwFm9JYuJZP3yIyyft57wM8oQKI9CSrKZ13BY+OhyClIMOkD5LsCWdk+CuD
	 hYBfMbSYyv8up1Eki6qbxzSAFQRsXOcBPqeqPWjEzgu0m5yejPt1Ld0eBlBYPt7CBu7Ab
	 Quwf6NY0cHclguoDA96F2LYPSeFYDLXUpyPQPJ3SrCwRh6kVL5CgmlgrRUbqkhZfq4SCT
	 Iv1YSuRRQVE4RHwHwvb0ugyqwwgnqLCqlyFkinjncbkHJ3DzC323jKQQkXRBqXRHDfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQYBxejX;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AF5606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 01:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81AF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQYBxejX
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so149004eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 17:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446827; x=1795051627; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pf+orCI2rLpYXGk3dzBIrPS1HgJeZ6wmt3S+jICR+IQ=;
        b=GQYBxejXqj9xKMkrNLYSftKDOeRVn8MGo5YIk9XbbwLV71haYO1pTPDykyrDQahJKY
         eIJle8vCmyIM6oge/Xx+H83+68zv1DZREQv7gig7L2mUgi+X6oJziPYhi8v4w2u3QhlU
         9OeztHu/Txto49TDjRv+dj9WM9QfqNFpnFfr7W4zzNvykjeNaXJrf3uZDzyPDZyUYX3X
         2YDn37cpmNmoVs8FtOZO4LXESBQoYq09d8LOuKbMKZGWgM4cjwfW96JRcHWHi4hxjgDF
         iNZIc16V5k28cumvno3px7yJ+UHHJ5A8+p05RTuKlIe0bK0zn7V1cHhzVNc8VcDWyu4e
         srfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446827; x=1795051627;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pf+orCI2rLpYXGk3dzBIrPS1HgJeZ6wmt3S+jICR+IQ=;
        b=A0LfY3BWH6KeykgrqjGLTf2sVMjInj9NzgPbPQstNiBG40+zrN4F84/fYBDIm7bAdi
         ZA0VyRAmK7fBmWxbCpFqFSPQkvqJkCLLcKQJCt0j07QXJac1VipX9qLRTYiweJrHKuKA
         p2fd/9wNhAhtHr1QLjs/mP8zsidopzqgjBejgsCOywQI4PBJhUMsnBY1GBy63WiB2T5R
         bJzmeYnYK+odtl/L3etu/Igcinc6KC7i01WS+soLsuaEFCvkTWR4Vsy1U21RRtAJGGum
         gklWviuNhPGFsEu0HVNQaadd2DJ5yFJluJrlqhcznBrj9DR7vPOXz2lRsKywa8tvOrU7
         UVCg==
X-Forwarded-Encrypted: i=1; AL+hErG11PZHsPgECA6HxrKp6zNesUw4ZsWrKtr20CSd2DZm316yQbTEDEf3+6si+45Cd+AbZ7QCbT7JypM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TLfFqImMwG5iSWT5mEgN/MwE9Ao/F6jC0wTFKDAyU/FVIqXi3
	/ZbrNV2TtcIw6DtTUhTFk1vh06WjDWRSUAs/amfJigGEk2FphsFLGKiZ
X-Gm-Gg: AYBFou1fuwzisLQwGvGac/4xPaqgs7CSY8ZQJR9iiWG4avjX4cMjebuwVtfFyq0RC0H
	rbZfR46MoEnSy+vS//HMRuvBy3ZwxjLQ+Wua22jWhQQnV0+u4ehQOmDJhapC5FlVejF83JO/V6C
	FTInQ1m8KC0Od1h02O8ZIjoE/Rf5zZwgEkO/HO8VjZhEJ6RiWqAWjqaRJH0HUsoWGLiU1KVu6FS
	6CN46/6j2fPU6z+n2VZCu5BDsBUfb/fyellHkhovyA8K5KYYTe9kq1u1pmL+veQiERO7qDE4/tH
	bsJltphvn6vhxpD9sMCW4YyRlOR0LhmrFSg4A1/4tslPbJY5j73TPm2WSOnHkJW8KrNPYcYORUW
	LgdAVhz3LR/EdbbV2OVjW8S8RlvVPRcfbA7zOVbGcEqdrySiVD9PUkHx9Kqe7g3D+W+BE7Lrex9
	j6/lN2JRtkHABCr7mRljimnNVnEXaV0P1m/4A60bHXHUv3LOdDhvaLTLi8jITL9off0TfB7255s
	Yqv5USYLrVqLyiWMDDVmj5zo32l7ep37xkyZNFu4geSlOyiA2q1vbrS89oZea2H1EuzdzR2oGyJ
	9xBI58ju34LQfl3gOVJtRZu6MiIw0gWhT+duIy5LiIZ6kyo0dvA6OVciEbKCz1pzcSM=
X-Received: by 2002:a05:701b:42c7:20b0:1b2:5884:a039 with SMTP id a92af1059eb24-1b3c0151554mr6228487c88.0.1794446827180;
        Wed, 11 Nov 2026 17:27:07 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm24887181c88.11.2026.11.11.17.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:27:06 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Nhat Pham <nphamcs@gmail.com>
In-Reply-To: <a7b1d671-18b0-44e8-b112-ab66893b3bf4@infradead.org>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <a7b1d671-18b0-44e8-b112-ab66893b3bf4@infradead.org>
Date: Thu, 12 Nov 2026 09:26:55 +0800
Message-Id: <179444681565.2553194.6533752746321637708.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-11 16:26 -0800, Randy Dunlap wrote:
> 
> 
> On 11/11/26 4:41 AM, Xueyuan Chen wrote:
> > CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> > counters are updated regardless of this option.
> > 
> > Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> > stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> > debugfs is unavailable.
> > 
> > Remove the Kconfig entry and replace the existing CONFIG_ZSMALLOC_STAT
> > settings with CONFIG_DEBUG_FS=y. Update the English and Chinese
> > documentation to match, and clarify the pool name in the debugfs path.
> > 
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks!
> Thanks.
> 
> > ---
> > Drop CONFIG_ZSMALLOC_STAT instead of making the counters conditional. The
> > option only controls the debugfs interface, while the class counters are
> > updated unconditionally. Removing it simplifies the code.
> > 
> > Following Nhat's suggestion, remove CONFIG_ZSMALLOC_STAT and rely on
> > the existing debugfs API stubs when CONFIG_DEBUG_FS=n.
> > ---
> > Changes in v3:
> > - Squash the three patches into one (Nhat, Sergey).
> > - Add Nhat's Reviewed-by.
> > - Update the documentation wording.
> > - Link to v2: https://patch.msgid.link/20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com
> > 
> > Changes in v2:
> > - Drop CONFIG_ZSMALLOC_STAT instead of making the counters conditional.
> > - Update configuration files and documentation.
> > - Link to v1: https://patch.msgid.link/20261106-zsmalloc_stat-v1-1-b574f4714adf@gmail.com
> > ---
> >  Documentation/mm/zsmalloc.rst                    |  4 +--
> >  Documentation/translations/zh_CN/mm/zsmalloc.rst |  2 +-
> >  arch/s390/configs/debug_defconfig                |  2 +-
> >  arch/s390/configs/defconfig                      |  2 +-
> >  drivers/gpu/drm/ci/arm.config                    |  2 +-
> >  drivers/gpu/drm/ci/arm64.config                  |  2 +-
> >  drivers/gpu/drm/ci/x86_64.config                 |  2 +-
> >  mm/Kconfig                                       |  9 -------
> >  mm/zsmalloc.c                                    | 33 ++----------------------
> >  9 files changed, 10 insertions(+), 48 deletions(-)
> 
> 
> -- 
> ~Randy
> 
> 


