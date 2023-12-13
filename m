Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B668642
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 00:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1lTHNBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88086C433CA
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702427381;
	bh=T/CmYAMX8vCFXjdnC4Q6viaedqv85SFFc1KRj8TomIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U1lTHNBdDCfrLirRcsts086ScjN1mNZC14kBqKyHiQXz4nHbRfm98yMpDs2BYwQXl
	 H2lhZRl4aHyHtzHVucT/E9ac6ebDMkjlj1ujGyvu1++E24zdw4dvxGqifgDA5oyzIc
	 lIE43m+l2r1w3Utr+k0iH65TBtCqL+nq/VFf4taNt+l6X/YWh0oTwqzsn2ntOkuwLV
	 OEFIi//KCt+3q1mUXF8gzw9L1/ja03+4AVSUmpSr78Vse4CcBYNnqFh0pLmC5MlwXm
	 sL5VFIIdhVAmzDKqJALB5E7wt4FRUXV0z8pNFPYT7TnCxOaLDXiLzI9hngjCKu/WC1
	 xMicTkuENRaEQ==
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b9fd22bb1aso2665276b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 16:29:41 -0800 (PST)
X-Gm-Message-State: AOJu0Yyc3x4Vr6JeShQ46poCxbs+B5/5vycIdcUrwdmvD+i+8UsJGyn1
	RwAcLms3jEr2aHX96TxTOj1fRmSG62atWns1EYN/Vw==
X-Google-Smtp-Source: AGHT+IHhKw+F52efRkHsVLmg7lTUhGeCsoBO3yLahHcCawGpwe2Hdh9DkMSCDNnH5zXB9NvA+lZSX9uYML1rHZWNnfE=
X-Received: by 2002:a17:90b:3a8e:b0:285:adb0:de3e with SMTP id
 om14-20020a17090b3a8e00b00285adb0de3emr5846234pjb.34.1702427359763; Tue, 12
 Dec 2023 16:29:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAF8kJuPEKWbr_1a-OzqrYKSPmuty==KhC2vbTPAmm9xcJHo4cg@mail.gmail.com>
 <CAKEwX=Oj0Rur8i9Oo7y2Py7svx-g11sEj3GKQfMVL62x=4hvdA@mail.gmail.com>
 <CAF8kJuNpnqTM5x1QmQ7h-FaRWVnHBdNGvGvB3txohSOmZhYA-Q@mail.gmail.com>
 <20231209034229.GA1001962@cmpxchg.org> <CAKEwX=OPQE3eTsfqwQa-bq3NE5YcqnkKfud84+FV4HF-Q_wcTg@mail.gmail.com>
In-Reply-To: <CAKEwX=OPQE3eTsfqwQa-bq3NE5YcqnkKfud84+FV4HF-Q_wcTg@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 12 Dec 2023 16:29:08 -0800
X-Gmail-Original-Message-ID: <CAF8kJuO4-yQY9DkKm+1dvqA+QzPyCtCStoLJ4MEVNwbrBQRTLw@mail.gmail.com>
Message-ID: <CAF8kJuO4-yQY9DkKm+1dvqA+QzPyCtCStoLJ4MEVNwbrBQRTLw@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org, tj@kernel.org, 
	lizefan.x@bytedance.com, cerasuolodomenico@gmail.com, yosryahmed@google.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, david@ixit.cz, Kairui Song <kasong@tencent.com>, 
	Minchan Kim <minchan@google.com>, Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 1:36=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:

> > Even if such a file were to show up, I'm not convinced it should even
> > include zswap as one of the tiers. Zswap isn't a regular swap backend,
> > it doesn't show up in /proc/swaps, it can't be a second tier, the way
> > it interacts with its backend file is very different than how two
> > swapfiles of different priorities interact with each other, it's
> > already controllable with memory.zswap.max, etc.
>
> This is honestly the thing I was originally most iffy about :) zswap
> is architecturally and semantically separate from other swap options.
> It gets really confusing to lump it as part of the swap tiers.

The writeback option is about interacting with other swap backends. So
technically it is not zswap alone. writeback =3D 0 will disable SSD swap
as well.
I am not against merging the write back. I just want to make sure 1)
better alternatives can be developed 2) zswap.writeback can obsolete
if a better alternative is available.

>
> >
> > I'm open to discussing usecases and proposals for more fine-grained
> > per-cgroup backend control. We've had discussions about per-cgroup
> > swapfiles in the past. Cgroup parameters for swapon are another
> > thought. There are several options and many considerations. The
> > memory.swap.tiers idea is the newest, has probably had the least
> > amount of discussion among them, and looks the least convincing to me.
>
> Definitely. zswap.writeback is a really concrete feature, with
> immediate use-case, whereas swap.tiers seem a bit nebulous to me now,
> the more we discuss it. I'm not against the inclusion of something
> along its line though, and I'm definitely not trying to limit the use
> case of other folks - I'd be happy to contribute my engineering hours
> towards the discussion of the multi-tier swapping design (both
> internal implementation and and public interface), as well as actual
> code, when that design is fully fleshed out :)

Great to hear that. I think the discussion so far shows the
alternative usage cases of the swap backend/tires is real.

>
> >
> > Let's work out the requirements first.
> >
> > The "conflict" with memory.zswap.writeback is a red herring - it's no
> > more of a conflict than setting memory.swap.tiers to "zswap" or "all"
> > and then setting memory.zswap.max or memory.swap.max to 0.
>
> Yup.

Care to elaborate it more? I don't understand the conflict part. I do
ask Johannes in my previous email for clarification.
One is the superset of the other. I don't consider that as a conflict.
If we can have both to choose from, obviously I would pick the one
that is more general and flexible.

Chris
