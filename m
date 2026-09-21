Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D849B1F8
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995187; cv=none; b=kInc4bkR6mhIJKOpOxU5RQOb875whJyj46GSZYT8qT82SepO0bbfH54n+mAM5VGZjcQLDdT/3Qg3Fi2ZCF5oMsoN2zOZtwhVO7Xs+ehaoLOXIb+m18YBQNTRvCQ+QENUz7t7D6Xr5tjgigW8q0pqcY80pU8Ku5WdZT0Rouq1mQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995187; c=relaxed/simple;
	bh=qeUCWpsUPbHHM5IIG7RF8FHuHvdD0eOD/zFOkfdQrYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtBzPsqbjeK25M+pLLjorQWryaXsfaN8paisJ1uQaJZvM4EB3yzDBwODcg5VSjCgut/oW59D+UOcdQzpXgjWkTA6Ghbu0MsdZIkWSNBcaNxzn2iKpk72X0mDrbgf2GpBLsQvaTU8akylGL+2/pnzwhAQ+WTlZDvSHMPdX4dns4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fBaQ6FPL; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fBaQ6FPL"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe208so37480306d6.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789995185; x=1790599985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jdk8bFx0tKHj9Yl5yPuBwHegOpkKYh3D6iyI0OsSHvo=;
        b=fBaQ6FPLrsis2sQg/MQTL21JZNv+KF1s2lpMc3WLk8mupnzw7vw3dOXpboNWUd2JFO
         hVYq6Zo7oD/ZxUonGGXzp9Wu0qaH7WG/oBBIWdL3wvePWoqmP7cb2sueyzvAGWVsMJo1
         Yk3gL2Y/cGrjs+LRMGfWMlokO+d9wsLeXqgaHqWv1lw/7INCWA4LAGFQWfLYNq+a0hLs
         r7ivypwfYSZUmLEgsSFlN0gK01xMxN5UT7wC3MqtqpYuAyAPVElLg6rAdSPgQmk/gIi2
         /dj/OsMoF+viZ/XOEzdpDmCRlwbvLcWW65KztY92+OMyp3kTuO12BIKeJXYqulsX7YQT
         GTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995185; x=1790599985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jdk8bFx0tKHj9Yl5yPuBwHegOpkKYh3D6iyI0OsSHvo=;
        b=zxoS12CYxQgsa1uxGq0mvU/YbdpMulVwQBo+DDk+ZqZkY3Jjht2/U75KMYqwGv+KVQ
         PIytRt6END0w9/YdHaKiA/M+ji0QLAtYg9odI40+SUEwKM0v0LmpIX6QOMzt1GCPaR+W
         kUusrDU0Pv9KIBxtqKcsdBM9jfIQ5yi/RRUrvTqY+SSqFe9TuEf2Dp6TrYBvlN6NPSDU
         UDjotoznGXmpcd99Gey42nkSAhYev1YVcmVg3tA4NO0eRSSyYgR1GdeeH/wY3Y/ycGV4
         cXzeEgGMRK6wiedyd/ZVODrloPnUaQX/274HL6GxrGwUIERgVWtpq8TXEr62FGDXpVit
         zXAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlcr9/v8Z+Q/X0SObRHxSxajlBD2cvFYtxK6AWenXwms6ASQadd0Ko/gUCKhAKC7M7t/NNA3tMKCA=@vger.kernel.org
X-Gm-Message-State: AFuF++li4K67oiPBDKulzdGHGIBD2c3Mn2FaPnUjjLCKQaqDMc4bCD7S
	aWjBBf3a/JzHMOQp+aGAoeB5m35KVjd/71u80yFeFCg6KBIkIM2y1VYfaDKAwixevrw=
X-Gm-Gg: AYBFou27Hs5MddL2vJC2XfoL2GESxSlqCDRYz6a48Dm60j7/iPNBoMjWpBy40T50Wu2
	OcVCdq9FSSpPNTguyObHC3VEOA4xCCgoceJcv4xM1yso2T07V/rVdP134WlGDcgbjYl/umerVe4
	4uyzbF6RdaeOzLMT41DhcL2x2RSQqRgfYzch5aOesToHobyPieGq1eYsvxrJnigrRROosruYKQ8
	e6qQOYRI4zScrY78npLUnzqmTaIfa3/89OZ97HdXMOlyP085gcUIRvKwGN3AVNr600z0v0O29bt
	I7ZBrWARLdZHBFtFXslT7mbTQdte03C40be0Q9P6PPcQ1cdVtdvj/UBfKKiN6llrjGWSAUnwlGv
	3PeYwYctNiuFNVxjVjZPNmK+P6SQHNZxZrvRKHHanJKOj3dtHZpXl0i93hljoikt0W6DFtpE0JZ
	6tjNuMhQlKE/aRC9AwrV+yzyQZ2qkGLGjJWPpCG0rd6+EeXJ+Y1RQpcb1wxAy3PHopPYMFHlSuy
	EYIxk6Ul9KVBQIsqubWs8HUMjRJuwk/1BzFeQdQm7s5V5C7/rYD3ik=
X-Received: by 2002:a05:6214:5990:b0:912:517b:20e9 with SMTP id 6a1803df08f44-913fc969610mr4155346d6.49.1789995184825;
        Mon, 21 Sep 2026 05:53:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a6267csm68171296d6.25.2026.09.21.05.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:53:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:53:02 -0400
From: Gregory Price <gourry@gourry.net>
To: Chris Li <chrisl@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Rik van Riel <riel@surriel.com>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Meta kernel team <kernel-team@meta.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arEVDBlfsUYKK004@gourry-fedora-PF4VCD3F>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
 <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F>
 <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>

On Sun, Sep 20, 2026 at 11:43:59PM -1000, Chris Li wrote:
> On Sat, Sep 19, 2026 at 3:53 PM Gregory Price <gourry@gourry.net> wrote:
> 
> Let's start with the real question: on your fleet what is the max % of
> zswap memory compared to total RAM?
> 

You're asking me to predict the future.  Any number I give you today
will be wrong 3 seconds from now.

You can't know the compressibility of memory until after you compress
it, and requiring a user to predict the future by forcing them to limit
the total amount of workload compressibility does not scale with the
number of workloads of variable compressibility of data.

That should tell you that your model of reasoning about this issue is
ill-suited to address the problem.

~Gregory
