Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E2E2DB60
	for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZigrrUym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3C8C433C9
	for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 23:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702596180;
	bh=1/u39glqJuuCFGGeFe99yJG58ZnMFafYYR4VOOatUWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZigrrUymbeTlt6AU1HRAXv7jMBpQWvb1gcpRzKPyaqWPjtK/ZukvpuBH0tx//B5V2
	 xGGdRQq/UJU8pCYSjQoBtOUnm8yqaYPlQXHninxh7G38lN+ORxGkmOh6VW3p49RE3/
	 cl9wP/hiz8FsCssjpPtCCdBH7MJn3dTY9y6b52jMNrTjoegH+YCJK4rjX+uVmCB0xK
	 Rvaz8t6iqG+VJA3+L+mriVnrX6buOTQvFQzX6IDvHQYR4oqdliZaR0avGpxBLl00YM
	 ua6J+41beCJ7f57ICKjAZgzd6hVo1NS/8bLApsuDaH1Fcz/RMtrS9q2L5Z4ntkx45M
	 K3AXSTSUzFe9w==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso61784276.3
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 15:23:00 -0800 (PST)
X-Gm-Message-State: AOJu0YzIDlm+epvgro5MYCMthCgm9ybbFHVUmQhdiiLRiK5K4Oc4Onyo
	XQD9smFjzfLT5YRmHcuBYV/FCYzPIslJUnDhk0q7DQ==
X-Google-Smtp-Source: AGHT+IFZlx16ggQq+ydLOHu7s4g2zI/Zc35QmBgqhM1l+1UkieDfhMFciuUnV5cvJW0sVNZt4OTPYu0mFukgLsviFzU=
X-Received: by 2002:a05:6808:1310:b0:3b8:b063:9b56 with SMTP id
 y16-20020a056808131000b003b8b0639b56mr11308602oiv.72.1702596158708; Thu, 14
 Dec 2023 15:22:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAF8kJuPEKWbr_1a-OzqrYKSPmuty==KhC2vbTPAmm9xcJHo4cg@mail.gmail.com>
 <CAKEwX=Oj0Rur8i9Oo7y2Py7svx-g11sEj3GKQfMVL62x=4hvdA@mail.gmail.com>
 <CAF8kJuNpnqTM5x1QmQ7h-FaRWVnHBdNGvGvB3txohSOmZhYA-Q@mail.gmail.com>
 <20231209034229.GA1001962@cmpxchg.org> <ZXeTb_ACou7TEVsa@google.com>
 <20231214171137.GA261942@cmpxchg.org> <CAOUHufbvafDiURT9qBjKPpRSNwc60S-bDg2yMH_m4bNSWQcV4g@mail.gmail.com>
 <CA+PVUaR9EtUMke-K8mM0gmJXdOm9equ1JHqBjZ0T5V0tiHVc8Q@mail.gmail.com>
In-Reply-To: <CA+PVUaR9EtUMke-K8mM0gmJXdOm9equ1JHqBjZ0T5V0tiHVc8Q@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Thu, 14 Dec 2023 15:22:27 -0800
X-Gmail-Original-Message-ID: <CAF8kJuMLDOaP6-Xyz-+hzLbDuYW7gfG9jA06j6t5v7XX2rPOdw@mail.gmail.com>
Message-ID: <CAF8kJuMLDOaP6-Xyz-+hzLbDuYW7gfG9jA06j6t5v7XX2rPOdw@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Fabian Deutsch <fdeutsch@redhat.com>
Cc: Yu Zhao <yuzhao@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, 
	tj@kernel.org, lizefan.x@bytedance.com, cerasuolodomenico@gmail.com, 
	yosryahmed@google.com, sjenning@redhat.com, ddstreet@ieee.org, 
	vitaly.wool@konsulko.com, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeelb@google.com, muchun.song@linux.dev, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, david@ixit.cz, Kairui Song <kasong@tencent.com>, 
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabian,

On Thu, Dec 14, 2023 at 10:00=E2=80=AFAM Fabian Deutsch <fdeutsch@redhat.co=
m> wrote:

> Yep - for container use-cases.
>
> Now a few thoughts in this direction:
> - With swap per cgroup you loose the big "statistical" benefit of having =
swap on a node level. well, it depends on the size of the cgroup (i.e. syst=
em.slice is quite large).

Just to clarify, the "node" you mean the "node" in kubernetes sense,
which is the whole machine. In the Linux kernel MM context, the node
often refers to the NUMA memory node, that is not what you mean here,
right?

> - With todays node level swap, and setting memory.swap.max=3D0 for all cg=
roups allows you toachieve a similar behavior (only opt-in cgroups will get=
 swap).
> - the above approach however will still have a shared swap backend for al=
l cgroups.

Yes, the "memory.swap.tires" idea is trying to allow cgroups to select
a subset of the swap backend in a specific order. It is still in the
early stage of discussion. If you have any suggestion or feedback in
that direction, I am looking forward to hearing that.

Chris
