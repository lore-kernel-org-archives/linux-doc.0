Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45971146D53
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 01:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784338098; cv=none; b=Z2yEQdFs+yygIhxOoMPIwWUZx7NMYSRC0chvqrDTVXJTUvpbtBk/qC0yuVqB53iAw15EkgOyICsXHvypk8oDkr9QejXZSlmJX94Hg5JRKwp4ycsiUATUGWYRriXHahJP+K7v+kZCY9bjvoXrZ+pF5w7+cIzLNSQk6U6S363dj3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784338098; c=relaxed/simple;
	bh=HvYPdvWjsO/r1Msr9Pxoi0r6L4hod+ciGgvBNrkbdYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdJz1n7fBEMUDsZqqvAAkJc6glyi/MYFiUlnd7Ikxz5Q9j+E6aHcabHYr5Vk3oQ7rWG0NqD2Fgn7Pux8iLqp22YFJc7eGpIXawFnvrPkzzb/EiNdeSgUXEkFPd4ti+/2XA19t02zkxboWWXbLbT5h8FgNV6aBbIRwkx60xXWtTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuuuKNHd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuuuKNHd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AEE1F00A3E
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 01:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784338096;
	bh=2f5ZC7wkqIcBsou0hQoWM0u7Okid0V2TGkFRJo/KT/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IuuuKNHdML+K81nPVVvf7awSkBgHaAJbm84qcEb7NiiilCrrwnbk67uk/gyvU+vxB
	 AiET0vEocZkohsKEna/JTEOKZRzThk+zARZBWp/bt7L59LwTC5u/9lRy49t4TMOm0A
	 3+iAxnPDdsUjVa7/oRBFE10qSE1UiMBuMSoJ5eIWFe7I37FmfJqbMQAE8ADUFOPloH
	 WzY1wLocmsv7KAb5QHE4/bSNfkS+L0sVC9F6GK4Iyj2OSIS9Q2xp1BKMmDf8w61yNH
	 6ikzna2M0HR0vu3KAd5XxE3zZMrAgZy29frwpCQRyxVJnMJWMiSV6/eHU7SoT84onH
	 oLTw3liuI7fTQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso1024976266b.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 18:28:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrm53Tu9J/oyJqAcvD87U4jvoB++SqWfBA7dghWoRsff4A47fNb5oPA/9RNYKBkYM8E2V/4Yytk0+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJK7EACeGNnkgAlupKNbRLdh6KuamGyR3McEZZFvQ07ZuIzl2t
	kAIJRRwXmcFN7tJEussQJSvB5U/7sNSQowmzZPflAMkdGuaHUsRTYq1aYc6QuyC3A4fGvBXfwQQ
	Mwp7T8F+ozZU82ZFiPqsFhQJnLid8ScM=
X-Received: by 2002:a17:907:7b82:b0:c16:5f28:4575 with SMTP id
 a640c23a62f3a-c16b4766327mr215549666b.31.1784338095758; Fri, 17 Jul 2026
 18:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com> <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
In-Reply-To: <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 17 Jul 2026 18:28:04 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOrXqsEaCEJUUAxbAhhN_OQb8ejogeUa6k8hX_JV8hxxw@mail.gmail.com>
X-Gm-Features: AUfX_mwqUoHjaL258a9ZUOa4FhW0ym2bwIwrlW369zxtsJv7jS3V44hb-9YhN5Q
Message-ID: <CAO9r8zOrXqsEaCEJUUAxbAhhN_OQb8ejogeUa6k8hX_JV8hxxw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mm/zswap: Fixes and improves the zswap global shrinker
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 6:18=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 17 Jul 2026 16:51:49 +0800 Hao Jia <jiahao.kernel@gmail.com> wrot=
e:
>
> > This series fixes and improves the zswap global shrinker (shrink_worker=
()):
> > Patch 1: Fix missing global shrinker when memory cgroup is disabled.
> > Patch 2: Extend shrink_memcg() to support batch writeback and update it=
s
> >          return value semantics, thereby improving the writeback effici=
ency
> >          in the shrink_worker() path.
>
> Thanks.
>
> [1/2] is a cc:stable fix so it isn't really appropriate to combine this
> with [2/2] which doesn't fix any bugs.  Because the two patches may
> take different paths into mainline, with different timings.  But that's
> OK, I can deal with the splitup if needed.

Thank you!

>
> The [1/2] changelog lacks a description of how the flaw impacts users.
> Please describe this fully and maintain that info within the
> changelogging.  This info helps -stable maintainers and others
> understand why we're proposing a backport and helps myself and others
> with timing decisions.

The first line in the changelog should be sufficient imo: "Zswap
writeback on hitting the pool limit is broken when memory cgroup is
disabled"
