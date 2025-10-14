Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D782A3064B8
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760473712; cv=none; b=iFUaUcArKx/gOrHaqr+a0VAH0Lh/xQQ6szSGK3k1m42ewc2dIDWRRnYp2rTWQWj4PWqpjiEaZfMjV6kJBiKizOnPyH2ZhHIKcpbGpA9FHiN5PI6wqxAOjWh4ktNyxsAtJvrlwMtF0igg5Zdu+ygxSKVzIVQaP2XBJfrIt+OWt4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760473712; c=relaxed/simple;
	bh=pBzO/qxwMFiuodUwjnNSTjmJpn49BdXukWovp6AjsAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKs3HYr551ywJoK0kunqm15YMYzSOW169hHCfn9L8M0axE2AA9s8rYx2X3OKDmmGCUWJ6ussQr/EsXQ/bEDJN/uw8fg/6xihuGHG74lT1FYBBQNOxJHdAKHf5rIzhvLTw0qT5p6kWHwG0t0D+Ih+NBFNd6AP3pXANDAd2eTgvgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZec+Lnf; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZec+Lnf"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8582a34639aso443584385a.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760473710; x=1761078510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBzO/qxwMFiuodUwjnNSTjmJpn49BdXukWovp6AjsAo=;
        b=SZec+LnfhPz18Vi5m+gG9zrYDgtkpFRQKx6Y4HSghIuULM03IFrGd7tqDNUTMkVi/f
         ThNROxpJI+djccxpcfeaa2KoNNlPNHkPV1EuaodW4CnaPlOsJMLeDASTkPGLlBMhVcee
         9xR7rFShtvoJN0e/kL+yaOe+iTLSy7DCMCFk6fh29n/t2h725kDengT0zXg2aO+HWe5q
         +uhzK2GcgHj7eQWzuLI6tToQuJmQolrxqxcN9lZgEFhhVKHXUJlIMh6NzxBBF1+iTRlx
         yahBsrs+mB65jysDUXWAZc9PiGANCyHBKcPFJIQXMpYFr2+Zc7QlEsHvMNNnVGkZcj9v
         jK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760473710; x=1761078510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBzO/qxwMFiuodUwjnNSTjmJpn49BdXukWovp6AjsAo=;
        b=fwN3UbYbFdSyEAPp6eiOqPunyaHwLzQnOwa9nXV+OZb24d3NuEi2bDAX40LJ4OniyA
         ZXVUaJSVtIx8+SnyADqWjn8v7j6AoaZwqRc2yTyBM2MWuueNtvFz3Rv+3xR/SF6OYC+A
         XTaPlOS6TKXVaNhl1ZEuPpGHzpwV/Ru4LBJFk4sr/DGEOCAmlXk+ONheUz5PunTJOiB7
         rApSprw36zSDTL6Ssix3+RFiA8gXCFFKrBVJQkN4ut6ikku2MekZWK1K1Pm+rL9/7f6s
         LnbMGZvwAKd3yW7AWnHMDSl8AiBM44sA76vlmRdmdiHnwkJBA4aGxN/+T3g6Jd9xHpbT
         zF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGJU8Y5xxF3PMSD+kqC94ah5meINpbbPJKQUXVpRPPG/+twl2zdvXo/5gTDO8Hp4CcTenKHUMvAoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoAC26FMdx6Mqb1EeG6peqbKK2ZJufo9fFGjFk6GDUMl2H8FJF
	xL9IdJEg0nFcKdXd5iFRefXGQROxDRibmj6ToI3y7azgl5APmjZWr2JGHUbZGXJeCDI2gaL8PPo
	lMZUTr2soEaVkLl2/HZ4SiQgnqS4HMKs=
X-Gm-Gg: ASbGncvlCjub3IiRLtopyKk/AVVtrdErZfInIdKbsbqWdj5rqV29VNffOBbaX2np9/r
	X1A4xArsJnc5BX/hHmoMEa6EBgtg2o890JPy/VggqyuyY1HedHuljhrv2POmlJFVcdtVYwRP/0g
	djnYzYyvZrLoGy+a5jUWZNdyfELDYigPrJ0XoH62WWHRTvnSIGxsU0bih30MVxLF+WiF90nZJVf
	Mqf9TwaiYZzXEw6ukgjcNY2sE5noHlXJhOIVvkFKdQxk8InaurE524N0w==
X-Google-Smtp-Source: AGHT+IEHWtgmhT2p78ndsLqREi02CoamLTiJ6OeM8OKrYE6vz8/hYR3ehoD9cuCKSfGARp+UWdPDUVymrBOFs0luCz4=
X-Received: by 2002:a05:620a:7010:b0:85b:cd94:71ff with SMTP id
 af79cd13be357-88356517355mr3325050085a.48.1760473709638; Tue, 14 Oct 2025
 13:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013101636.69220-1-21cnbao@gmail.com> <aO11jqD6jgNs5h8K@casper.infradead.org>
 <CAGsJ_4x9=Be2Prbjia8-p97zAsoqjsPHkZOfXwz74Z_T=RjKAA@mail.gmail.com>
 <CANn89iJpNqZJwA0qKMNB41gKDrWBCaS+CashB9=v1omhJncGBw@mail.gmail.com>
 <CAGsJ_4xGSrfori6RvC9qYEgRhVe3bJKYfgUM6fZ0bX3cjfe74Q@mail.gmail.com>
 <CANn89iKSW-kk-h-B0f1oijwYiCWYOAO0jDrf+Z+fbOfAMJMUbA@mail.gmail.com>
 <CAGsJ_4wJHpD10ECtWJtEWHkEyP67sNxHeivkWoA5k5++BCfccA@mail.gmail.com> <pow5zt7dmo2wiydophoap6ntaycyjt2yrszo3ue7mg2hgnzcmv@oi3epbtyoufn>
In-Reply-To: <pow5zt7dmo2wiydophoap6ntaycyjt2yrszo3ue7mg2hgnzcmv@oi3epbtyoufn>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 15 Oct 2025 04:28:17 +0800
X-Gm-Features: AS18NWCDtdWGykNnr10kVKpaN-UFlp7dIYD7B4uot-LSzZLpylUZVkd3ymutVWU
Message-ID: <CAGsJ_4w-=MNAKyNk6hvAYMbi_tdiehM4dFtz3x0-V-0kCh83PQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Eric Dumazet <edumazet@google.com>, Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, Jonathan Corbet <corbet@lwn.net>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Huacai Zhou <zhouhuacai@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 10:38=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.d=
ev> wrote:

> >
> > It might be worth exploring these settings further, but I can=E2=80=99t=
 quite see
> > their connection to high-order allocations,
>
> I don't think there is a connection between them. Is there a reason you
> are expecting a connection/relation between them?

Eric replied to my email about frequent high-order allocation requests,
suggesting that I might be missing some proper configurations for these
settings[1]. So I=E2=80=99m trying to understand whether these configuratio=
ns affect
the frequency of high-order allocations.

[1] https://lore.kernel.org/linux-mm/pow5zt7dmo2wiydophoap6ntaycyjt2yrszo3u=
e7mg2hgnzcmv@oi3epbtyoufn/T/#m9b94a1c60452551496738e4e15235329f860d1f9

Thanks
Barry
