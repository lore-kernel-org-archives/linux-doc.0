Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8390F51EE0E
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910779; cv=pass; b=DnaZ9EI5xrAHVSnoDM3dmYjIHNmKEOkKDlRKxj55WgOYxfTcy2wcuL+ybqBJtRwPeNzvVSNhQgRrIGo/AH2MCAUieON06k8/BIoBIst2iIcrDXOiVN557B1HCs2g0Eai7NkeAwvYbwK/ohS8xz/4wWwPX0hOcvu9llhMN3Ywygo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910779; c=relaxed/simple;
	bh=Irc52p7IpU94MjhUuTv/4weSSBLioQxa3X0dPTYCCpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngJM3oaApXhNCPSNI5d6QNFs+tmRtZyYFV2/khrBOT6EXq1FeGyrVGNchNz6lE40RuilwepP7DAYGw0kTa4ZeOHW7M0WIfhAEg4l6Bz2iyp+MzSYy4KKXxyTTq6+E7qjs1PnRh5pqm3RMjxqCwdzWe5ZSy1hHghI5cI1aSK3WfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpOXiEQ2; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpOXiEQ2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c34bff61551so386289066b.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 09:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910776; cv=none;
        d=google.com; s=arc-20260327;
        b=gKjK9R3GJEHL8w83yksjevSNodO0HMPuH4xg7aGUTNs6VHjBrf+xwi2LTWXG9q2cuG
         r8PWMatVYSzeil2KVOnMGCfkxb2lgxAwUMinGXm11hCZkSq2Ic7TC9wYqItMX24b3b4p
         WHCtra2TI0F1IVwA6Ldu807BOnW94VDORg/bx70HpgIvzOj340Yzc6lTwfB/LoaYqzg2
         xw2/7c0Ls7fPHCI+4VV648UMQBqyo+v7d2sPhSOTtuBaErHU1PyN/14Qp7ZPk6rt+FAL
         p2USIiA7twkNwWU/8eqEEyt/Esbo9GD0XFyVIOqp9p2rzqbGA4UGtlrcuWihJ8G4Kc62
         1q4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Irc52p7IpU94MjhUuTv/4weSSBLioQxa3X0dPTYCCpw=;
        fh=GsLFKxqOLM1Nxt2cqCNHr10GzFaoJTa/kKcnCV1PmIo=;
        b=gobj2c0MqB4ZL3FvySHsP8xGZzqGAv8dq43L8lo01H4RjDpNm1cB7OwjBM6USlRuzA
         qo+bB+eJHXxYPAOp8frQCW/Gn36CSh4jm/fp26aVdnCsaEBSgTRO11g4A+zrDyNhumb3
         ufo78SIqX9XfxbyvM1fkK1R6hJFx53qvJy8k1OlyAj73P1K/jt662zrWRcJWrPNKkuNQ
         LmwCAbtFaCdjAFs7tKAgiQU8+FCGD/sSqHCqI+5koc6NSeS5wcUO0Syp4bKxLh/4cFrh
         JIodrDIoHuSrLLBioFJPH5Ly8D+kcpE+iJracBOYDPILRuo/68zIkEYWqFrQgnooRkyi
         0Nvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791910776; x=1792515576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Irc52p7IpU94MjhUuTv/4weSSBLioQxa3X0dPTYCCpw=;
        b=EpOXiEQ2SPQ6ZYYS52bSNKUx9gytoN2jhpEeJXfbT14FmKBNspqqzphM0++IIjSFFi
         tj2gzp6usgLn0QMPxtm1jfEG11DNn9aiUjDZ3pJYl3NmGZvPQ77rhTH/iostTGbD2/gB
         7KUxKMaCmJzVnW3Vr5/inj8DWr6sk5Pakw7Smk3lFXcvr1rLx/g6ZW/ViOTX1LrB9zoJ
         fsKkqVjdG8zYiGuYzeQo7KIpXSAYQbozbikn6G1G0zEzlWUnXoYG/QYUeOD6XJk4IoVf
         wBuxjgbYBwHk/wtgEKXIdE0CzYxI5cBz6mgybhU/XYNw8MxT2++D5PxvHRY3oE6rVocE
         tEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910776; x=1792515576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Irc52p7IpU94MjhUuTv/4weSSBLioQxa3X0dPTYCCpw=;
        b=IIHJzWMz9pvcLY2oC5Z9EXXfvoPBLjzly4S4XtktRkLGlg4eW8pPY9CbzM1P2Xj2dW
         1Gk7lnm0DFg3fkyCtjpMuCGjOhh0RDemI22wVLL2u/eev7s5BD7Zx6QfyE5PFAQvI7K+
         4mQwmDTNsh4gONt+w0+dyz67+0Zm2Y9gF0TyEbxvAlzdBv5TJFoeqZInaEBR4tcAdfcS
         i3IFLJwlzaPELxyniPtTuAOXH2Juf1g4xdouDEXjHrf85ra6fZB+T4desuInWa2iDgiP
         dHqmdI/ZXanfcEq75lStJhbmIeoX6WN2TUxllQwZubwk+qbxb4mcXV7m1mCYKyGvm4Vv
         m5Sg==
X-Forwarded-Encrypted: i=1; AKwUvBy+nFon7jwL+tKeFiWx1aTHfYPgVpyUmfp+84f2obP+iDRfH6QcYqhj7tE7+f6BLcK+1Q8kAjqE1Y4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtck52UTW2yXgJi6UeG1vZIjJtrtXsZJfDuBy8c8n3uxJZCPq8
	ZvAY5r6bJHCEhhcgrZGB6W0bnEjsFQsoDlyHmLFsLTfUmlG2PLHbX/ILil0mt65ynwz7OhS+BI/
	pgzrOixPEAkmQq6T90w/vNOefwPsGehE=
X-Gm-Gg: AYBFou3UusgsMMhJeBBsV4ieb16H/0yOEhftqwrooJqtpGSBGyanZ82MIi6QOhBkqLe
	fCXPqrfjrU35UAjkovSoOaDgJvDCnG5fL70t2Q3s0HxeS449/haYvI4yy+rQa7h3gwIJj/gtZEd
	dsNBjb2jp2HrcGwai96gjMBySiXuJAsvtnXXutjPvYPrYbvY38Pqxu5/Sixm3Ui4qtsu2FSFzye
	P68/KHoLBhgxkWKXw6TKKajWx0/Y2hYTaJuV7na2nWRfGrNlRcPbyRU7RBAXJECi+tOtXt+/YMe
	lwQ6B7G9HjjYRsTvGSwREqvmoK/d3oOzGVRJoaygOJLeK1zV7ROXTpB6N1PT0lDnOzhOGnuGBw/
	zmvjrUxqRrbho
X-Received: by 2002:a17:907:3d0b:b0:c31:7495:e5b with SMTP id
 a640c23a62f3a-c31a9feb26amr1246342766b.10.1791910775410; Tue, 13 Oct 2026
 09:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com> <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
In-Reply-To: <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 14 Oct 2026 00:58:59 +0800
X-Gm-Features: AclHuK-dRyf9eKLDd-E-CAUCwm0MgTdU0FQN2EyVlbP88Wn126rzBlk5l-Sic0w
Message-ID: <CAMgjq7CT2O2VHpwZazugQRopi4grF+T4oOxZznoAGvy93Yjh-A@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 8:19=E2=80=AFPM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 9/22/26 15:38, Chris Li wrote:
> > On Mon, Sep 21, 2026 at 8:56=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> w=
rote:
> >>
> >> On Fri, Sep 18, 2026 at 11:50=E2=80=AFPM Chris Li <chrisl@kernel.org> =
wrote:
> >>> No that time slot is too late for Asia developers. I don't think we
> >>> should use that time slot for swap alignment.
> >>>
> >>> We should find a time slot more friendly to Asia.
> >>
> >> Any time slot would have that kind of problem. We're spread out across
> >> the globe.
> >>
> >> Let's just use a standardized time slot we have for MM alignment sessi=
ons.
> >
> > There are more swap maintainers in Asia than in the US + Europe, at
> > least based on the maintainer file. Please be more inclusive. If the
> > alignment is done without key stakeholders, it miss the point.
> >
> > Sigh, we can't even align on a time slot.
> >
> > In that case, let's keep discussing on the mailing list. At least it
> > is accessible to every one.
>
> Looking at the mailing list, that approach doesn't seem to work.
>
> Finding a time slot that makes US, Europe and Asia happy is ... tricky.
>
> 1 AM is certainly unpleasant.
>
> US vs. Asia is also tricky, but doable.
>
> China 8AM vs. US West Coast 5PM?
>
> China 9AM vs. US West Coast 6PM?

Hi David,

Thanks so much for suggesting this. Sorry for the late response; last
week's travel resulted in a lot of piled-up work for me.

Both slots look fine to me.
