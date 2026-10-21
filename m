Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568517;
	b=RlqYRtmE1F0QawQYIKGPnL/5//8jGkoBi21JnizjzLF6ZS8S5O6PA+l0kGfBUzSTw6wE
	 2DTG+HQX26hQO+J+5J0YzgFx0yNVPGZ4/9rT7qghHHbC9rYv3Hor4loY+LwmbN4QkCgwW
	 9bsdoiQaeY+p/br2NiCHOkIOAvwFiQPKqiobYoh/g6mEzSd/wjOvFXL92G5rZ1UeDB81b
	 /6UNzY5MrVoiawVsTCEb7dG4hAbqFYgDgGp+2WA66qiVyH+PKU74koqwghjfolLz/tw0X
	 BYPpjzK08l9gNGmMGtvuHU6P1t6V/+EUtrKgrmUvOybswzuyYnYbgO75T0VVJNhJi/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568517;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q2W6HW6t4FD7GiH02r1fl3fKehEEk60q+ai1/oJoOqY=;
	b=DrvZ7Zrvd7WBKCXYtmBzsDAps21EZC2WOuLIsSm2my46Az6PtReStxf+KNA7rodumOFk
	 XTJkcw3G4+/v/bqhRdj8bj1NYkVN0YQfgvK5E9o5fZTDVg/mKYOEfcmiLEwfTNWqeJlce
	 0eHOu4D7DaEQRI1wnevdc6OBa4xvwlXkyOtQNJRPcgaqGyc001KUQ1s99gDQwpmN8AGA7
	 cc5AiLFoxc4lbGmgQxXCFECl7DIx0gpKPDOu0ZvgV0GDyS/iUJALo5VxSjl/b6kHfjKP+
	 sPQ8xqem3RVG03x5fNvczRQYkyW/BtVO5or5SkTqmsPn12WLziqMX2Bh0FIRUO6EAeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RphtZPQG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F762606A319
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RphtZPQG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04C21F000D2
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 07:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792568516;
	bh=Q2W6HW6t4FD7GiH02r1fl3fKehEEk60q+ai1/oJoOqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RphtZPQGGFF7jJY7ncIgsi9Y/X/XBdAhf1KdUV3TRt0J7Vc+GURhEXJnNd1iU+XPk
	 Tf+DzqhJahQXexjDD3u+x95VdnpPZhUiDmTnBa2LCNLTITfIKhJWUBoJ5xdGz10Gz8
	 WeQSOdDnbLddYngWYqMC6hA+eOFhETDIq80GlSO6sjztsTqLzAmK4CyA/U8xEh5csc
	 GZ4f/lyVfFD/Gz3s7/wXcr3HmxZ62a8/U2Zw3qTzWAUSuB/yRMhG7lm5mtLik/sP43
	 MVutOdpgrFBFAJaZnWEbXBeVz77TYYxcWooBTzFJjaMOl9KSn9HhQCIAeCNKIES4cZ
	 FO5IpW9Tsym1A==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c414e5d282eso39078766b.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 00:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhryFp06LTrv43LlQE8zOZY89Cs5F/J9B6q8aRQAmDXoxSP3LOy3Kfpuz1Bst2jp8bp63LW8rtxnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCoCMcr4ThKUDy3H4NUGPPRYgAvWjBMHSCY6xUtPTIk8grGOKJ
	egiIn75Vg53mYpYj5/E5fxC0wZ7At8qNalRapQBET997EFr5+ZdfvbNnqgQWZPSWJ+qJpdGscdo
	52bz/6wrMXsyWCNuoOD6IQHRWlPt7OWPE4LVC2jkQCg==
X-Received: by 2002:a17:906:dc93:b0:c46:645f:cedc with SMTP id
 a640c23a62f3a-c46799d0f16mr92139766b.46.1792568515652; Wed, 21 Oct 2026
 00:41:55 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
In-Reply-To: <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Wed, 21 Oct 2026 00:41:43 -0700
X-Gmail-Original-Message-ID: <CACePvbVbMPZTrD5y=--XgBS+sa4CHb7e4RFTYCbWfzHzVc3vXA@mail.gmail.com>
X-Gm-Features: AclHuK86lyz-XbdDB6Y-j0ii2s8PEPiP-QfZRMCvGYvdiUTKkHpNlLS-aItO5FE
Message-ID: <CACePvbVbMPZTrD5y=--XgBS+sa4CHb7e4RFTYCbWfzHzVc3vXA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
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

On Mon, Oct 19, 2026 at 5:35=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Oct 19, 2026 at 5:28=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 10/19/26 14:24, Nhat Pham wrote:
> >
> > I'm traveling this week, so it's a bit tricky. I cannot make Thursday m=
orning.
> >
> > On Thursday I'll be traveling back from Cambridge. But hang on.
> >
> > My plan lands on Oct 22, 11:10 PM. I should be home around Friday 1.30a=
m - 2am.
> >
> > I could just naturally join that day.
> >
> > So one day later would work for me.
>
> Would that be too rushed for you? :)
>
> For everyone's convenience, this would be the time slot:
>
> PDT: Thu Oct 22, 5:00 PM

Works for me :-)

> EDT: Thu Oct 22, 8:00 PM
> Europe: Fri Oct 23, 2:00 AM

Ouch, David. If you commit to that, I understand it is very
challenging. Thank you for taking one for the team.

> China: Fri Oct 23, 8:00 AM

Other swap developers: Kairui, Baoquan, YoungJun and Barry, when you
have time, please comment on whether you can make the meeting as well.

I want to clarify one thing: Swap is my hobby not my job. My opinion
represents my personal view as a maintainer, not my employer's. I
consider different users of swap to be my customers. I really wish
some of those impacted customers could join the meeting and speak up
for themselves as well.

Chris
