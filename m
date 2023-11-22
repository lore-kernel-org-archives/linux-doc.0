Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C94D13D
	for <linux-doc@vger.kernel.org>; Wed, 22 Nov 2023 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBIaALKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C33C433CC
	for <linux-doc@vger.kernel.org>; Wed, 22 Nov 2023 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700665322;
	bh=ITSc+8CASPasYP6znHkBBoTMN83PkY3DBR4mulSAaMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gBIaALKo5PKhE+ei/4YB8j0v//Nut7Yo9/Wz+qI0bB8bnKEnDq51Vl8xudFniLYxk
	 cEo+HrMxP8EbqJfSxdPdMJf9JWagxHRoOqYJr+h8NUjcoOAs0K2BG6sDcwEvu5O5TC
	 nQyXK3dLDMVuHy4r/nPFkmNUWq4WFRpW1QSJakrNEjsk7WBQYO1MbBPitv3O2Q/htj
	 U7pFOF6jA9wtUhfPi2uO9osF2vykKje3lxcKEaR0xGViSz93XVPaXHEPH7Sps2floJ
	 1jGiZlhxw5bz7lM4AqJTNpXj2WWT/qG/aIB9XwVXuvQYOQtNGTPO2xawPj9XUjOLgg
	 ZLLu6CzRSkSGw==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-677fb277b7cso25723636d6.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Nov 2023 07:02:02 -0800 (PST)
X-Gm-Message-State: AOJu0YyHyKpOj/jFUosxuTgQA8bEcz2sweajqV8JNBuiDrXRNV2v2PNG
	e320nsJgYkmJIwTQYg0imNBVfwYRTdiAPBy6f7hWQQ==
X-Google-Smtp-Source: AGHT+IFy5n023alBBXB1iA8ZpwW7jnBHcI3sDn8m69jiAiT2qvEEZDnxtwU2dwZoa/Mc5NTf+3/xDdhG38NTgZSqkoY=
X-Received: by 2002:a17:902:8c8c:b0:1ca:e491:f525 with SMTP id
 t12-20020a1709028c8c00b001cae491f525mr2640784plo.31.1700665299383; Wed, 22
 Nov 2023 07:01:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115172344.4155593-1-nphamcs@gmail.com> <CAF8kJuN-4UE0skVHvjUzpGefavkLULMonjgkXUZSBVJrcGFXCA@mail.gmail.com>
 <CAJD7tkZ1U+YuvoBAnrXFxQDiQV2hXdbMG-gbzu64R8GLAtNAPA@mail.gmail.com>
 <CAF8kJuPTNwQM413UdeQTkMQ8HkJFyF4OWVrxJSf7uWbege0CXQ@mail.gmail.com>
 <CAKEwX=O5M-vZE5YhYQ5_CbCmXovS1XECO4ROXKWo06K880M1Mg@mail.gmail.com>
 <CAF8kJuOD6zq2VPcVdoZGvkzYX8iXn1akuYhNDJx-LUdS+Sx3GA@mail.gmail.com>
 <CAKEwX=NdFjemcmf27PVpgHpVHWQEo19KfApepWJBRYeyVCWvCw@mail.gmail.com>
 <CAF8kJuOCyd5r0LQ3m8fQp0GtxxNUKSmwURJH6V9aApefvX8xCA@mail.gmail.com>
 <ZVrHXJLxvs4_CUxc@google.com> <CAKEwX=MR6a-u87p=Oqm+zvwB_1zhrsM_n2=xW1kJz0_AoVwkPA@mail.gmail.com>
 <CAF8kJuNFQn_e29YEPy-G29FR2RnrPzZNWR07VuadOTNask_Rig@mail.gmail.com> <CAKEwX=NpKqjApRKk2Qp9Hp63xSjRwD-DEu9yX4BvbMd86x2b1g@mail.gmail.com>
In-Reply-To: <CAKEwX=NpKqjApRKk2Qp9Hp63xSjRwD-DEu9yX4BvbMd86x2b1g@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Wed, 22 Nov 2023 07:01:28 -0800
X-Gmail-Original-Message-ID: <CAF8kJuMp_BNauZzOuqXNiViuY2JH=JKWid2-_BwQjDTWptoryg@mail.gmail.com>
Message-ID: <CAF8kJuMp_BNauZzOuqXNiViuY2JH=JKWid2-_BwQjDTWptoryg@mail.gmail.com>
Subject: Re: [PATCH v5] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, 
	lizefan.x@bytedance.com, Johannes Weiner <hannes@cmpxchg.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Hugh Dickins <hughd@google.com>, corbet@lwn.net, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz, 
	Minchan Kim <minchan@google.com>, Kairui Song <kasong@tencent.com>, 
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 5:19=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:

> > "all": zswap + swapfile
> > "zswap": zswap only
> > "no_zswap": swapfile only.
> > "none": no swap.
> >
> > All keyword names are open to suggestions.
>
> SGTM! There might be some functionality duplication between
> memory.swap.tiers =3D no_zswap and memory.zswap.max =3D 0, but
> otherwise this seems reasonable to me.
>
> no_zswap sounds a bit awkward, but I can't come up with a better
> name.

I sleep on it a bit. I  should apply my own suggestion of using the
positive words rather than negative one to myself.
I actually define it as a non RAM base swap device. How about "disk"?
It will include SSD and HDD disk.

The current 4 combination will be:

"all": zswap + disk swap file
"zswap": zswap only
"disk": disk only (including SSD and HDD)
"none": no swap for you.

Chris
