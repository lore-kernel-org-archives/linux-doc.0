Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793222573;
	b=lXeWr8rMsx3v2ogg6cLems5nL+wL7P9dlHls97M8HhIyU0uUrUlssDuFvsRxY/qfKifd
	 hFDjmI9qB7kmHNAuBqejsCSQ1lEq27oXK+xLNbTeVVKaZSHpFEkMPGcDqhWuYvqHxBP5X
	 /cFAlFjP9dTSdLiKEum0ClNvTexY5DOUjW2cZt1GlyTKZRTKiq7AqMn4nc8sQOhkfRrnA
	 w5C3RNpONYuRGw2tDB6/O7iAIMACmJdvTMPSRiN4mfum61vFM9nuji4nMzjFjCTU4oMlh
	 gxuwJcKijN/qnPYPzU2AHYNBOUYDgpw3yiV/5geoVsANUeqG5CxlnKJlX13j9oiGV2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=H9OWahcyc0RtO0+EeUD26bkvPuyjvUzZOmtjTnKMJz4=;
	b=LXmJeW/0fU25WTby6P/ys3eLJ02haPrmxeuOWdhRufp7323Ryv8gYDwK9i0zV4PHA3YQ
	 A1UdC46CA+MoCICrihoNpQ+lIWynmfn9bKW79xBv9HjS56tnU/mXZbvQ/FIrtYq8e2aXV
	 j8BtkBbhHX8NSQRLEFV6UxUgKpRiE7tPxn5dLTejtiMgT5+ZoFJgS70HO0Axwn4Pxpqbo
	 O7rZkPhT9Po2raJdzaOnT6QfTaKDx2L/t+tm1CSFXt2V0DooRMmVcD63HIBExt7tGrndo
	 YZjyLM2O5fzqQQ5SyDlvF15MVS9HO4eYNFe1c9TQ1nqi2MN0DlZPjFvJl5+0AWU6JlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BdNpiMdS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA7D606A31A
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 21:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BdNpiMdS
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso21855e9.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 14:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793222571; cv=none;
        d=google.com; s=arc-20260327;
        b=CTT/GeoZy/JrVZ2wF/iYa9Qy53K3E+Itp2XNCIlj+fDW5CD7Wb3LByxEQKv1N/ZbWB
         DDuI+q9BX38dQpe3o8XD3eth/3ax7STa+mVNhJJGLEa1tgdfyXXQ/3pxngaeNo1K1/7B
         Fj41umsVtTav1lQ7U6+ObksULotgIzrtiCZaOpDrZi3qKswExg2IxHF0hMG+5F3YZOVR
         zazd7Q+f4lQSiPBcAoQxZsOLnCHoe+sfAZtdEUIsGE0FoJ6bwhFmo1gzt3w06wYzI5jO
         5nJk6mV3eLCqJ7YRf102oxU35QWYFZDyyyHHAolG/1kTI8FONNL8Hj0TFGZ3+XWzVOw0
         ze3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H9OWahcyc0RtO0+EeUD26bkvPuyjvUzZOmtjTnKMJz4=;
        fh=k8l5HPyrhWlQM5/DcFO4s8Ai9jN5Kog4t0L8uMSnk5g=;
        b=HzVnDsdG91Kqa2WyfnHqVmLp06wrBsRe2WrtswAU6Lo5X1tmvVZIEKpI+k2V73SCh9
         0MK14OOyyVCmz8CevoU3tW1hXOTdizrgXXyov7HszxWom6erPmPjNqtlm1UmDgvw6l5+
         Ubg5ueEw6mdmYM1xrNa/tsBqnPYOCUlIT4q5SwSBK8bJgnC2t/a/KHCd6x4rWl91ptJE
         Q0F7KYd3GrBEK5AbIZpHLyyUPmI+d8q0vh2sYqEg5P574uLeDxoPHz9PQqtb6GjSkJ+9
         zBdWRoH7esrvYlhnvP8YpvOHZWVdsdTdEi0/Y0rkZ9EtzRrUWywz8lXO8Zt6xVCA2nsS
         T8bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793222571; x=1793827371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9OWahcyc0RtO0+EeUD26bkvPuyjvUzZOmtjTnKMJz4=;
        b=BdNpiMdSCff2liQ8tiUGDfLBx2qXWrVA+PVPjmF/gUh6+AQ6ARYk6zGtN2RDjM12Kj
         tIv1KztstgoyrA910VMkmt94SokmjkeDp9gLkyXR3FzhenIwJ1SHYMhws0/gUOjjPw3h
         rr9YslNsq0hPwRxAUKG5HBPou5uZcM7MfwBEPWRgIdx//15NmzTabuUB2/D72zSoAbOS
         QMKlP9MDnNezExJwNAH04+y+MtLnvBXEqrNDrYRdMB3OXs0rQWcK7IRGecI5nxAwgPwg
         fKPLd9qt6W+jsh4IbfXjTdfrH0SuaHTq4UdkBUwRWZ0No43M3RMCwxJpHoAmsmReBPZ4
         B9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222571; x=1793827371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9OWahcyc0RtO0+EeUD26bkvPuyjvUzZOmtjTnKMJz4=;
        b=EUpVB/9Q+DpTzrpx/eHq8U1bocXJzkgtnstqkHCjTwlxWrFx4QPQXns1ngiJOmYezy
         Dx/dD23+Mnevk2mCsL8wI9xITm2Ww9ZYOLiKu+C4esplILBhbd0+1DpAS59jnWWtP1N4
         6FWOwI8IRaaDkK06rS2w9YvZggpyohwR4yMQfiTtm3E96neUJ0oX8R5nf/3EHahXfQnF
         gV0XL9omO9KA3rdmZEgXgt0ktJZoFlJNpBjNTgd0/9sPcgu4XD5KF0hae/XaSH3KsnRy
         6Na0RrgZTTQvX3i93HWYUIn4L6WtphD8z9OA8M42bEd9mW5dnJvTEtWvLTMFBsjzaL2d
         yu/A==
X-Forwarded-Encrypted: i=1; AKwUvBzVjKkdpbDGqpa6yNlYQoGnr0W5j5aeHsjUUvk1fN54d0iSJW9vC3I5nMvPlAz3vhBtPl8TLc7JtFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsuEkmKa3E+U5TwGEkCsqlaOOJspKNpAig84FLB/k5Xdkyd6OL
	hr70pq0FZBWVeRGV6uKlAcIcuK6yEe2XPLdbMsaqLV9cEvj6gRa3/Lh1TgmMgFvE1MSHJw/0Tsd
	cE1pMrONFFyZQHfnd34V3B5qhJ9CHmvMZ9mhAOKtg
X-Gm-Gg: AYBFou2TP1W2LU17xkc2znmuwH+9yBZKqenC9Fy9zy/Ij02aQELq9nfPI7ZUQuMpeA0
	YnDANfyldFtXrZYoLlZ3wDqub6r5fM79YHl/3slW8Qe7OtBbE+dshpDOYozs1uqvbSOewujsTW6
	MPbQ4hi/JS5uGUxzIcxKAs1227ySTfP8dPHUA0vVrawf15Bl6dFCFf1g4YjpnkJQpOvQHjdV3O+
	0k2vRKZVtlICwsUhFSjPUPu9wz59+pN0x9eUWEJxR+kgaklYh7QxxhIo9n2O8Gg9WFiu1cOwKJA
	6ins4HvTYrusaQj6wZluoKZatkW8QLbmLwryvVo8FFo0D18V5O6viSDyJULVIt0UY1fSH8+BHsw
	9BYt4oL8C1M+dwurfJcyBLbB2N1mC4Y4L+UeZZ+ALC8AvvGRbdw9yn4IE7SRykGlvZlJaCaSba/
	zVvUMhWHwUMLS+mgh+haFUVdg=
X-Received: by 2002:a05:600c:26c8:b0:4a3:5de0:19ec with SMTP id
 5b1f17b1804b1-4aab692b046mr61845e9.9.1793222571076; Wed, 28 Oct 2026 14:22:51
 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-3-tjmercier@google.com> <auHMXBwnwuRwHLmo@KASONG-MC4> <CAGsJ_4zuGRjH+=1JxH4BYEC-vJumKjkhXPse0jW_nKEzQXXVmg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zuGRjH+=1JxH4BYEC-vJumKjkhXPse0jW_nKEzQXXVmg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 28 Oct 2026 14:22:38 -0700
X-Gm-Features: AclHuK-BDrgLvfZN_Z6mj4D7H_QyFDZWiVpmhu9KpmL6zRb0X5M1HcHjt7g6ziM
Message-ID: <CABdmKX1PvZjnJkqD48_Pb64Je_oZVO3F-oaxMsBYzHmY-GjbDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/mglru: stop rotating offlined memcgs to the old generation
To: Barry Song <baohua@kernel.org>
Cc: Kairui Song <ryncsn@gmail.com>, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 1:57=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Wed, Oct 28, 2026 at 6:43=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > On Tue, Oct 27, 2026 at 06:06:06PM +0800, T.J. Mercier wrote:
> > > lru_gen_offline_memcg() moves an offlining memcg to the head of the o=
ld
> > > generation of the memcg LRU (MEMCG_LRU_OLD), so that global reclaim
> > > visits it first and evicts the folios it left behind.
> > >
> > > Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> > > dying memory cgroup for LRU folios"), those folios are reparented to =
the
> > > parent before lru_gen_offline_memcg() runs, and nothing can be added
> > > back to the offlined memcg's lruvec afterwards. Putting an empty
> > > offlined memcg at the head of the old generation no longer serves any
> > > purpose and only delays reclaim from the memcgs that still have memor=
y
> > > due to additional shrink_many() iteration.
> > >
> > > Remove lru_gen_offline_memcg(), so that an offlined memcg is rotated
> > > like any other memcg below the reclaimable size threshold until
> > > lru_gen_release_memcg() takes it off the memcg LRU. MEMCG_LRU_OLD has=
 no
> > > other user, so remove the op and update the memcg LRU comment as well=
.
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > ---
> > >  Documentation/mm/multigen_lru.rst |  4 +---
> > >  include/linux/mmzone.h            | 14 +++-----------
> > >  mm/memcontrol.c                   |  1 -
> > >  mm/vmscan.c                       | 20 +-------------------
> > >  4 files changed, 5 insertions(+), 34 deletions(-)
> > >
> >
> > ...
> >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 636152d8c94d..45a2c1021f4f 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -4538,7 +4538,6 @@ bool lru_gen_look_around(struct page_vma_mapped=
_walk *pvmw, unsigned int nr)
> > >  enum {
> > >       MEMCG_LRU_NOP,
> > >       MEMCG_LRU_TAIL,
> > > -     MEMCG_LRU_OLD,
> > >       MEMCG_LRU_YOUNG,
> > >  };
> >
> > I think there could be other usage of this LRU_OLD macro, but indeed
> > offline is the only user currently, removing it is cleaner.
>
> I'm imagining an Android use case where, after LMKD or similar
> userspace killers implemented by various OEMs kill an application,
> we may want to prioritize reclaiming its memory by making it more
> likely to be scanned and reclaimed, while the killed application's
> memcg still exists - not offlined.

I think it's an idea worth investigating. I had a similar idea which
is proactive instead of depending on reclaim hints. The code is behind
a currently inactive flag - it runs memory.reclaim on an application
cgroup before offlining it (so no zombie or reparenting), but I
haven't had time to properly test it yet.
https://cs.android.com/android/platform/superproject/+/android-latest-relea=
se:system/core/libprocessgroup/include_platform/processgroup/processgroup_p=
latform.h;drc=3D2ed7b05ab42dd67391ad2819b0ee399d89128ead;l=3D33-34

> Similarly, a foreground application might benefit from a lower
> chance of being scanned and reclaimed. This suggests that Android
> background-to-foreground transitions, or LMKD itself, could
> potentially leverage the reordering of memcg LRUs.

We are planning to use memory.low/min for foreground protection.

> But anyway, this is not a reason to keep
> MEMCG_LRU_OLD for now.
>
> >
> > And everything looks good to me, thanks!
> >
> > Reviewed-by: Kairui Song <kasong@tencent.com>
>
> +1
>
> Reviewed-by: Barry Song <baohua@kernel.org>

Thanks!
