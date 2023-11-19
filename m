Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A7F63C9
	for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 09:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsVABxE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43682C433C8
	for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 09:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700386799;
	bh=1H3PX+IaX0IE7nBiCSB6MDB9bd00MwQRqkdTv+DsTGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EsVABxE2QSPuRPNXxVij+eCubZJ1e9E8x6eoWSICw8lVVHk51CxTe33X253WZayO3
	 uPat6h/TJWc2aesdU+wb7C0FsVWC4jlU+UdjjVdgz9P1WwHdz8+3xrGN7tXfhy3jat
	 RPFf54/wrVsq69zdWfehqN4Vu+DEHn4p5qXs3tB0gcUmlWHiQoZT53qx28TjixvqFo
	 sA/9y5MECtRaDHYBlWbhykHZ28c8IewO/X1VUw1jpDf8Q2CVfrkCv9H0KisOY3BD3Q
	 TgBrK4mHwcHY9cXW5z2qMZhbGSrMiSm4+6wK1ojfsY7smBdG/+CanVixK2nqnA1IFo
	 LxfrWbggjXR/w==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1eb39505ba4so2177871fac.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 01:39:59 -0800 (PST)
X-Gm-Message-State: AOJu0YxMJkakwD9F9CH6rzpLNTNzbC/hOnUs8+Y7p8hJk9S9aiOx0D/u
	z7IrBtiK2wouX+UpPm5eF7MBPQtR6xeecr3/jkhMGQ==
X-Google-Smtp-Source: AGHT+IG7ALAXFRt0rSRdXIIOwPxSiyJfQXJRU2wOroVNeGeY/g6Ptf7fNUnIyT383O0M8tozXwhmekS00d5nM2Nnbic=
X-Received: by 2002:a05:6a20:1612:b0:187:cf88:1a34 with SMTP id
 l18-20020a056a20161200b00187cf881a34mr5758611pzj.8.1700386778223; Sun, 19 Nov
 2023 01:39:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115172344.4155593-1-nphamcs@gmail.com> <CAF8kJuN-4UE0skVHvjUzpGefavkLULMonjgkXUZSBVJrcGFXCA@mail.gmail.com>
 <CAJD7tkZ1U+YuvoBAnrXFxQDiQV2hXdbMG-gbzu64R8GLAtNAPA@mail.gmail.com>
 <CAF8kJuPTNwQM413UdeQTkMQ8HkJFyF4OWVrxJSf7uWbege0CXQ@mail.gmail.com> <CAKEwX=O5M-vZE5YhYQ5_CbCmXovS1XECO4ROXKWo06K880M1Mg@mail.gmail.com>
In-Reply-To: <CAKEwX=O5M-vZE5YhYQ5_CbCmXovS1XECO4ROXKWo06K880M1Mg@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 19 Nov 2023 01:39:26 -0800
X-Gmail-Original-Message-ID: <CAF8kJuOD6zq2VPcVdoZGvkzYX8iXn1akuYhNDJx-LUdS+Sx3GA@mail.gmail.com>
Message-ID: <CAF8kJuOD6zq2VPcVdoZGvkzYX8iXn1akuYhNDJx-LUdS+Sx3GA@mail.gmail.com>
Subject: Re: [PATCH v5] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, 
	lizefan.x@bytedance.com, Johannes Weiner <hannes@cmpxchg.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, mhocko@kernel.org, 
	roman.gushchin@linux.dev, Shakeel Butt <shakeelb@google.com>, muchun.song@linux.dev, 
	Hugh Dickins <hughd@google.com>, corbet@lwn.net, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 11:23=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> Hmm how about this - in the future, we support the following
> options:
>
> 1. zswap.writeback =3D=3D 1: no limitation to zswap writeback.
> All backing swap devices (sorted by priorities?) are fair game.
>
> 2. zswap.writeback =3D=3D 0: disable all forms of zswap writeback.
>
> 3. zswap.writeback =3D=3D <tiers description>:  attempt to write to each
> tier, one at a time.

We can merge the zswap.writeback as it is for now to unblock you.

For the future. I think we should remove zswap.writeback completely.

Instead we have:

swap.tiers =3D=3D <swap_tier_list_name>
swap.tiers =3D=3D "all" all available swap tiers. "zswap + swap file".
This is the default.
swap.tiers =3D=3D "zswap" zswap only, no other swap file. Internally set
zswap.writeback =3D 0
swap.tiers =3D=3D "foo" foo is a list of swap devices it can use. You can
define your town custom swap tier list in
swap.tiers =3D=3D "none" or "disabled" Not allowed to swap.

"all", "zswap", "none" are reserved keywords.
"foo", "bar" etc are custom lists of swap tiers. User define custom
tier list in sys/kernel/mm/swap/tiers:
ssd:zswap,/dev/nvme01p4
hdd:/dev/sda4,/dev/sdb4

That would define two custom tiers. "ssd" can use zswap then /dev/nvme01p4.
The exact name of the "swap.tiers" and tiers name are open to suggestions.

>
> The first two are basically what we have for this patch.
> The last one will be added in a future patch.
>
> This is from the userspace perspective. Internally, we can modify
> memcg->writeback to be a pointer or a struct instead of this bool.
> (as you suggested).

Internally I would suggest memcg->swaptiers, the write back name is
somewhat confusing. As your patch indicated. It has two situation:
1. shrinking from zpool to real swapfile. The write back is appropriate her=
e.
 2. zswap store failed (compression ratio too low, out of memory etc).
The write back is confusing here. It is more like writing through or
skip.

>
> This way, the API remains intact and backward compatible
> (and FWIW, I think there are still a lot of values in having simple
> options for the users who have simple memory hierarchies).

swap.tiers can be simple. For example, you can modify your patch to
"swap.tires =3D=3D zswap" to
set zswap.writeback bool to 0 for now. Most of your patch is still re-usabl=
e.

I think we should discuss if we want to keep zswap.writeback in the
future because that would be some code undeletable and functionally
overlap with swap.tiers

Chris
