Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD830170C
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764585582; cv=none; b=W3i/xIZ4CXyKTXzofx080FCz3b+jMxymzEaD8asWxGWdrZXHpM6UlTshtj5742SMhfmTCTXHYB6ce0hLVEOPMqkSVFTL9ZYnTadjJ9gDQf9FB46MbBE1y4Cpwwv02irY9c8o+75QbVkj/2x0dOZloRJgS3lp4O40Yb5cRg+nHwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764585582; c=relaxed/simple;
	bh=dAnZLIPdLqLpTLTzKhJulb0XVeInpHTs9msuLFFaS0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k53KGgDtu8/qLZVs81epBhd/vYrWsAbfkQIi+KxLyDP0sV/PmSb4SECYbPcgDNqdTCUabk3qiMBrvW9zi/VjlEa4TUgLRTqnZZWZo3KsN+1jVafu/xuvRifPi8tF4npzOA4TO642/DCX4YdNWGpNPs5loPzRzuzmtUGxHrfy1AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lyq8Ep1W; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lyq8Ep1W"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b28f983333so378404185a.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 02:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585580; x=1765190380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVqlfvbnB6Jt+dwL/fKo+5bkZHEMBBaEcT6SxFkp7bE=;
        b=Lyq8Ep1WC0qAmEAGx4zO9G9tTxpWKEHR8bU3VZ3RT3cvK+sijtu2zcVkQZD7hbiQJm
         x3x4pouX/yR9dJ3qyZTWONKWuc1N9WVaSlcb0tu2J7M9eb29W9IaHA7IhspM9wI6+ULM
         EbxNGUujq+05O46c2UIxI89KrBQ0j62CpidQgl/40VMYEsQCQCXoJivWWApHbYgZFoHu
         S/yBwRuRNV+8AMtC2qIdojMRk0YFn2HdNYxOZh/AP+nbfJd+Vnuo+KsA1cvu4GGRulJO
         ezanGnP/z+kRm7rtRnBsc92jrM7G5PVLNPPSVkYhYq3t4LvJ3J2J/CAMMTE0aYbZbyqx
         QYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585580; x=1765190380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVqlfvbnB6Jt+dwL/fKo+5bkZHEMBBaEcT6SxFkp7bE=;
        b=lBF4Efw0Fqr4Vb41tdzNbGyqpomoC8i52W5InLyYd1t7DjDViTh/c/Ba9AZOukYhNi
         SRU18M2M7b+LImSJMwubiLffxEeM46VjlUQuDaFwBtQRF4LyUR51FiyEbB93gvH1COu2
         nFGoxDYoIV6SGRBoIAWNYfpKjBlB1/i6qwNbxikdYcU46P32joeQsjY6FCs5dX2v0lIW
         gqfVoZ+MZkOmFC66PIyJqIC/5NLbb9sz07axwEllhNVhDfeYtU/FBvuFCkDt/8A9Za3y
         ev/fFC6GBTR8uhMLSyx1uPQ1IlR2rKFjSG+51PdMneIrkvbuO/B0zYtDauWKVgW3p64y
         /3EA==
X-Forwarded-Encrypted: i=1; AJvYcCXCYFUw+WWNo7qryeDrDpOTpd2EG12ZsjEO9yKrw+1bw+F24B+bWKhxrMBAsIh/u/vhrWT/utWX1E8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLVifzhszdvQzYp/55dkJ1rGVwLiIrqT0u+ssDPRaxlirN5xR
	pCH7jOlv7pXysMh34B/YQeZriBE7a4hVnZjw6QrTAMX2URoeXrHiJ3e9p5lFdR6iZaPRUA3RA5Y
	Hr47LBqIuBEn6z8iQ/I+m+Dtjfx+Hw6s=
X-Gm-Gg: ASbGnctL70UNSW7SWe/m3Ek3RO9se2MegzTxb0A2s1JfJuQAMko/TofPhgTb4eajPUJ
	fM5e77w+vodPRR5gEMkmSjwwrZnBIdZ4eL8dRZEvJhsJyaCaqJ9N48GFLeUzIdBaAnOsJGyk32I
	7Jr9/WPyncolT0eqeRo/ys9RpEfimz0IQDPiurXmZ1B79cKTktJ9AVSKRYStQUcODVXAU/jqPNh
	cUdFlfcH0LUi0GKEebCzhIKfAS54IefnXTzI7ifwLC2koC6cYQaCbrFwqs79jQsM5v5BQ==
X-Google-Smtp-Source: AGHT+IG74z3lES06shc6Abrf2jDP6OsXw1j4gHSocVERkFq+qiAhZ6poKfIcf1RE4S08qMyz8qmfiB3xfZ6p/IR252U=
X-Received: by 2002:ac8:7c53:0:b0:4e8:a850:e7db with SMTP id
 d75a77b69052e-4efbdad7f96mr396585221cf.71.1764585579826; Mon, 01 Dec 2025
 02:39:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org> <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
 <86c62472b5874ea2833587f1847958df@honor.com> <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
 <66c62243a510421db938235a99a242bf@honor.com> <CAGsJ_4x0aVkDf-AhhGbBLU=LCxYFqYoFL0ovij-vFEQeJ46jYQ@mail.gmail.com>
 <dc8ce4f329d74a24bde62c93818df44a@honor.com>
In-Reply-To: <dc8ce4f329d74a24bde62c93818df44a@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 1 Dec 2025 18:39:28 +0800
X-Gm-Features: AWmQ_bl8cG_eW-1XhcPjhfAlyIHR_s3L1DahRCe_je2wzBXNhrB7Ynb2hmqyutM
Message-ID: <CAGsJ_4w16G+AngPu48SEy1H+ZuE1AQngiY=cSfEs9V6=OUKX_Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
To: wangzicheng <wangzicheng@honor.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, 
	"david@redhat.com" <david@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "mhocko@kernel.org" <mhocko@kernel.org>, 
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "weixugc@google.com" <weixugc@google.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, 
	"surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wangtao <tao.wangtao@honor.com>, 
	wangzhen 00021541 <wangzhen5@honor.com>, zhongjinji 00025326 <zhongjinji@honor.com>, 
	Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zicheng,

On Mon, Dec 1, 2025 at 5:55=E2=80=AFPM wangzicheng <wangzicheng@honor.com> =
wrote:
>
> Hi Barry,
>
> Thank you for the comment, actually we do know the cgroup file.
>
> What we really need is to *proactive aging 2~3 gens* before proactive rec=
laim.
> (especially after cold launches when no anon pages in the oldest gens)
>
> The proactive aging also helps distribute the anon and file pages evenly =
in
> MGLRU gens. And reclaiming won't fall into file caches.

I=E2=80=99m not quite sure what you mean by =E2=80=9Creclaiming won=E2=80=
=99t fall into file caches.=E2=80=9D

I assume you mean you configured a high swappiness for MGLRU proactive
reclamation, so when both anon and file have four generations,
`get_type_to_scan()` effectively always returns anon?

>
> > Also note that memcg already has an interface for proactive reclamation=
,
> > so I=E2=80=99m not certain whether your patchset can coexist with it or=
 extend
> > it to meet your requirements=E2=80=94which seems quite impossible to me
> >
> > memory.reclaim
> >         A write-only nested-keyed file which exists for all cgroups.
> >
> >         This is a simple interface to trigger memory reclaim in the
> >         target cgroup.
> >
> >         Example::
> >
> >           echo "1G" > memory.reclaim
> >
> >         Please note that the kernel can over or under reclaim from
> >         the target cgroup. If less bytes are reclaimed than the
> >         specified amount, -EAGAIN is returned.
> >
> This remind me that adding a `memor.aging` under memcg directories
> rather than adding new procfs files is also a great option.

I still don=E2=80=99t understand why. Aging is something MGLRU itself shoul=
d
handle; components outside MGLRU, such as cgroup v2, do not need to be
aware of this concept at all. Exposing it will likely lead to another
immediate NAK.

In short, aging should remain within MGLRU=E2=80=99s internal scope.

But it seems you do want some policy control for your proactive
reclamation, such as always reclaiming anon pages or reclaiming them
more aggressively than file pages. I assume Zhongkun=E2=80=99s patch [1] we
mentioned earlier should provide support for that, correct?

As a workaround, you can set `swappiness=3Dmax` for `memory.reclaim` before
we internally improve the handling of the aging issue. In short,
=E2=80=9Cproactive aging=E2=80=9D and similar mechanisms should be handled =
automatically
and internally within the scope of the MGLRU code.

[1] https://lore.kernel.org/linux-mm/cover.1744169302.git.hezhongkun.hzk@by=
tedance.com/

Thanks
Barry
