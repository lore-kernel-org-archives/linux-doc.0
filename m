Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0691EB36
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QHm9LaFO"
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E11F7
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 12:59:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so94758281fa.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 12:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697659161; x=1698263961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zmqcE2MrSI+P6n0BrJLpbbDNn5j/j93ikaoJl73i9c=;
        b=QHm9LaFOQhR8fbtxcBgw49NK1lUN7rkIh7niXsHxORelHLL35/MeQgW/+PD7sNl0f4
         F3mkDESpT/keIC7WGq+17h4h5ZFR798o9FNyufDgAyZTt0qSNV5oLyBMptYsllsKTzA6
         +FYUmb+qqQ1GB2KaiD1fHpjC1cZqmGuY+/3rYU30eL+0Y1UbzqDHc6v4A6owGD3fyl8i
         2WsNXVl9a6Y79CdSRSR21GfYVTfP7gWYyKqQDasBQtYPnjmGv/UqWicHKD8Th0pNqQiD
         CYNcfV2gRnpDYLxadGXfn0s1KYn8POJ0Knt3BNGSn5pu14zqbhc4mttH7m/Jp4CkLlak
         cPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697659161; x=1698263961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zmqcE2MrSI+P6n0BrJLpbbDNn5j/j93ikaoJl73i9c=;
        b=P07i1I6IC85+kEQV25hcjvNuQeBgTIthp7jvTOex9DIrvE90Z2ZJoGbf16L8tbSzT9
         OEQHoo6KsHZ2P7JekBrg3dTjkNwreX74YdoSAqw3RML6GEvyo5MqtQ0EEgT1UbOqOfjM
         AdD9HJlJYpCQR4LL+PC1AVHVenEiAqEbAgFRmApwaGy9qBNbUsoxAArABrakbdGoHBIy
         dOk0T1nWRH2TaMNeJQXiXIWvS9seVux0OQq5JKBwA4YEg+KDG1lc05uCp79eki0pzicF
         dUQKeJgc0I3nMVfWy5ZVHgCm/w5wQUNWgeT3YeRIb2m3ub67J/BHl+jWRBRz7U8H6xA3
         j5PA==
X-Gm-Message-State: AOJu0YyNwzZzEIW3ZSk5W8TUTHM7OMayTot5rbcbzhX8JXeS5vwtmCVJ
	wdLK7QlknRwy3ICThxQhMeTLfWkAnOZdYH7t4dxr4A==
X-Google-Smtp-Source: AGHT+IEaVYBfwkN+IG2AsUcOdDMYCvY+mbTLP2xTDnPsvcfD3qYh5slUhYzSqQhpt1osYqaB3agSYj1p7yvRbhV0uBI=
X-Received: by 2002:ac2:53ad:0:b0:503:55c:7999 with SMTP id
 j13-20020ac253ad000000b00503055c7999mr23973lfh.34.1697659160478; Wed, 18 Oct
 2023 12:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009025726.5982-1-link@vivo.com> <CAOUHufaX35Y6MfwKj_XUWXJwdC=9M=g1gXpQpQghBZ2fXrkEAw@mail.gmail.com>
In-Reply-To: <CAOUHufaX35Y6MfwKj_XUWXJwdC=9M=g1gXpQpQghBZ2fXrkEAw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Oct 2023 12:59:07 -0700
Message-ID: <CABdmKX0xevnJfcgsDEWsfX9J5T2x0EV7x-p4ommq_Deg98WwYA@mail.gmail.com>
Subject: Re: [PATCH 0/3 RESEND] Per memcg lru_gen node stat
To: Yu Zhao <yuzhao@google.com>
Cc: Huan Yang <link@vivo.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
	"T.J. Alumbaugh" <talumbau@google.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Suren Baghdasaryan <surenb@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 9:34=E2=80=AFAM Yu Zhao <yuzhao@google.com> wrote:
>
> On Sun, Oct 8, 2023 at 8:57=E2=80=AFPM Huan Yang <link@vivo.com> wrote:
> >
> > On original global lru_gen node in debugfs, it can all show each memcg'=
s
> > lru gen info in "lru_gen" or "lru_gen_full", and can type cmd into lru_=
gen.
> > But which show info contains all memcg's info, and cmd need to
> > know memcg's id.
> >
> > This patchset add lru_gen node in per memcg, with this node, we can
> > get lru_gen info in each memcg.
> > Also, we can type cmd to control each memcg's lru_gen seq, but, this no=
de
> > don't support multi cmd, single memcg just process one cmd once time.
>
> Adding TJ from the Android team. (The other TJ you CC'ed is from the
> ChromeOS team.)
>
> This series introduced a new ABI, which has to be maintained forever.
> How exactly would it be used in *production*?
>
> Android doesn't officially support memcgs. So I want to understand the
> real-world use cases first.

Not sure how Android came up but I'm happy to chat. We want to turn on
memcg v2 for Android but I'm currently working through perf impacts
before that happens. Android can't use debugfs in production, but I
think we'd prefer to use memory.reclaim for eviction anyway because it
respects memcg limits and reclaims from slab.

So maybe it's possible to add just aging functionality specific to
MGLRU? It'd be nice to know how you're going to use the aging, or why
you want this version of eviction instead of what memory.reclaim does.
