Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3C45BE3
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 00:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780532093; cv=none; b=jyKs+IeaiiQEWH16fNams9jLfgNYR3hvAQJZwJ2dnDAVfii9n7gexPwDJTo/ocqyct+bV0gtwfTQontL+Ml3R6FO8djA9s0QlDrMa6DAkRI0ZZzDAa/oIJPQveyPkU9/yUPMhX1hgakMZHimkawBR/KWKBhHiUzkaGT3PKi4nAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780532093; c=relaxed/simple;
	bh=n4YC7t4GlSKsGsaODNCP0HjzaOKMmCDpq3XlidjCdvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZcxjMdPJNGT/CG4JIXz8T/By1jVbPA4rUhLuj6EotaqhBGhRe7beYDYk2xAE/MvfKaZh3iJGFu+HJ54iZa9LdNxbPZjuZTiw+9cR/5zd/hP3jaD0ISSVB3R6E28QOmbtqNs6Fi1J13+7Pge778qZq4SV5RbLgzkxCtWIya6tzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GogIS8WD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GogIS8WD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E1D1F00A05
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 00:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780532091;
	bh=n4YC7t4GlSKsGsaODNCP0HjzaOKMmCDpq3XlidjCdvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GogIS8WD2PzsR8if7BjsUpZWNxHr0bw8VZoLPMUXHCAnE+Dlo2DAqxu5JqaRHKVQN
	 r6suCVGiluHrbzba01BoLLVlJA7aGnW5ft+6hl6+xUDWbYEop9UAblYXFYYrTFYVSm
	 G5HrvOBO6R+rPucdnSELB8x5QnRcrPZyAVeB+Sr8Q8oW/tpnKSa1Xc8cuJhgZ/fqjk
	 64W6l9Y3EmnKGn1dGfrHLUYS4OlEn9EU7fS/ZjSC/0EfZQnxUxsOTQ31M8OPzHDtJj
	 wogwflS/LVG24wWn6w6tsw9ahuAnt2Zcn9wEPi+zAZndAYVPmS0xZ1BqIRyhTvDZSx
	 Fkwx7YaCqHIJQ==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-91564c3a968so13615785a.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 17:14:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/FWhlEzBMJGtfg/FbPZJ9YFhCrrliv0b8CHWjk7l2lWkd0GbXASELfs2uJocQltV93At/M/+Pcei8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOjx5guIEdzC/lCu1n6R4P1WTHyNsV9wWHLbKimrluICqH9drK
	Ff2FPrFCAUT03IHlp7t3iwU+wlyYrIod533C0O+WiqSXk1roKGJXcotL8cIQEAGnhvhZf6GXO7t
	UFcigrVVxR3WW4M/f1WSSiG8mmI12HUQ=
X-Received: by 2002:a05:620a:2994:b0:915:8e2b:e5de with SMTP id
 af79cd13be357-9159ae6c1bcmr267493985a.7.1780532090478; Wed, 03 Jun 2026
 17:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
 <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-1-ce0219e100d9@gmail.com>
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-1-ce0219e100d9@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 4 Jun 2026 08:14:39 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w-TxtJN=k9zQLYnRkMArTG8R4TVDoOCpjizi-uiASz3Q@mail.gmail.com>
X-Gm-Features: AVHnY4JapO8_ekxXZ1OEskQ-uXsmOhCdlaQcXY6K-wiwXSYgC-VpzegHnhchd5w
Message-ID: <CAGsJ_4w-TxtJN=k9zQLYnRkMArTG8R4TVDoOCpjizi-uiASz3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] mm/swap: colocate page-cluster sysctl with swap readahead
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 9:05=E2=80=AFPM Jianyue Wu <wujianyue000@gmail.com> =
wrote:
>
> page_cluster and the vm.page-cluster sysctl are only used by swap-in
> readahead in swap_state.c. Move them out of swap.c together with
> swap_readahead_setup(), and make page_cluster static to that file.
>
> Rename swap_setup() while moving it as well. The helper is internal to
> MM and now only sets up swap readahead defaults and its sysctl hook, so
> the more specific name matches its reduced scope.
>
> swap_setup() previously lived in mm/swap.c, which is built
> unconditionally, so the vm.page-cluster sysctl was registered also on
> CONFIG_SWAP=3Dn kernels. swap_readahead_setup() is now a no-op stub when
> CONFIG_SWAP is disabled, so vm.page-cluster is no longer registered
> there. The knob only tunes swap-in readahead and had no effect without
> swap.
>
> Suggested-by: Baoquan He <bhe@redhat.com>
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
