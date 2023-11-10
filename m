Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057D3C6B8
	for <linux-doc@vger.kernel.org>; Fri, 10 Nov 2023 23:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+6ZEw7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F14C433C9
	for <linux-doc@vger.kernel.org>; Fri, 10 Nov 2023 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699657829;
	bh=qzpNyLMC3A64xmdVeHWaXH90W9sIZeMAIAR6Er2pCF4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X+6ZEw7JBjd0OzZPiLQB+5xMfmHJJz065UqZqxan9LWs0O3w/wuaOwZnf9CXhLuBS
	 fji8SyNRoxJxiEpg+e2MazsUc9tYOTHvzeuwWJBOnU5TbVmfcNuIhpJjj90KEmvW68
	 MSL0FQ1llmBgaWnT4M7qQDfU02vd2+b++eQANB0Q5dmPXBR02gTXWYr7G/A3BsQvVo
	 A/gTTF0mMX6n6fHS4RhRW/WUnSx7h+qPNn4ze+krlkvXA3UsaWnrU76nGShUkhZUrh
	 z+coD4B4MMYjDWiG02W123scPEN4bo0LDaNLVy4sTu4d4BAXQTDqigT3DpKAMcQ/Pa
	 MXMr0iWVkII6A==
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cc68c1fac2so22624935ad.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Nov 2023 15:10:29 -0800 (PST)
X-Gm-Message-State: AOJu0Yy7gfYqTuYNGEL9C/ahc12EVeca3H2GjWJZ9+gQxmauoG2QHc9Q
	xIOsbXvwnHb1t+JErGcxqrqSrahh1hiwa5C3GSHY1w==
X-Google-Smtp-Source: AGHT+IHT0Ga3k2HwehobvQ094KpaDzUHoTF0BQnVAyg9rq61jKUTEPBaI8omUev0xwQiA7zEScehe6jVq87qUxqw8NI=
X-Received: by 2002:a17:90b:4f8a:b0:27f:df1a:caab with SMTP id
 qe10-20020a17090b4f8a00b0027fdf1acaabmr552651pjb.21.1699657808503; Fri, 10
 Nov 2023 15:10:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106231158.380730-1-nphamcs@gmail.com>
In-Reply-To: <20231106231158.380730-1-nphamcs@gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 10 Nov 2023 15:09:56 -0800
X-Gmail-Original-Message-ID: <CAF8kJuPXBLpG2d4sje6ntrA+U-AnLzu3sNpJK02YxNcg04YNng@mail.gmail.com>
Message-ID: <CAF8kJuPXBLpG2d4sje6ntrA+U-AnLzu3sNpJK02YxNcg04YNng@mail.gmail.com>
Subject: Re: [PATCH v4] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, lizefan.x@bytedance.com, 
	Johannes Weiner <hannes@cmpxchg.org>, Domenico Cerasuolo <cerasuolodomenico@gmail.com>, 
	Yosry Ahmed <yosryahmed@google.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, mhocko@kernel.org, 
	roman.gushchin@linux.dev, Shakeel Butt <shakeelb@google.com>, muchun.song@linux.dev, 
	Hugh Dickins <hughd@google.com>, corbet@lwn.net, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nhat,

Acked-by: Chris Li <chrisl@kernel.org>

On Mon, Nov 6, 2023 at 3:12=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -219,6 +219,12 @@ struct mem_cgroup {

 #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
        unsigned long zswap_max;
+
+       /*
+        * Prevent pages from this memcg from being written back from zswap=
 to
+        * swap, and from being swapped out on zswap store failures.
+        */
+       bool zswap_writeback;
 #endif

I notice the bool is between two integers.
mem_cgroup structure has a few bool sprinkle in different locations.
Arrange them together might save a few padding bytes. We can also
consider using bit fields.
It is a very minor point, the condition also exists before your change.

>  #endif /* _LINUX_ZSWAP_H */
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index e43b5aba8efc..9cb3ea912cbe 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5545,6 +5545,11 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *p=
arent_css)
>         WRITE_ONCE(memcg->soft_limit, PAGE_COUNTER_MAX);
>  #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
>         memcg->zswap_max =3D PAGE_COUNTER_MAX;
> +
> +       if (parent)
> +               WRITE_ONCE(memcg->zswap_writeback, READ_ONCE(parent->zswa=
p_writeback));
> +       else
> +               WRITE_ONCE(memcg->zswap_writeback, true);

You can combine this two WRITE_ONCE to one

bool writeback =3D !parent ||   READ_ONCE(parent->zswap_writeback);
WRITE_ONCE(memcg->zswap_writeback, writeback);

Chris
