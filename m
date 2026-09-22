Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C36486439
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089023; cv=none; b=XytJAqAXeyUU1RPF08nJiI8/3C6ZP9uWx3g2/1okXyW3AsK8+w2EjpQcJArBuJSdHalOpdkPFRfxYjtlmRlMPyS2zQyi5Usom2PfRE6s68EOPbbgNd6gNOvin4/VoH8D19tyOVYfbfdf/5pMivzCuLSYB9MFglN9aoQrq4yYIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089023; c=relaxed/simple;
	bh=QPkW4aVoe/0NbA4NwEjKqNu/gW6+hIbN3gcfVZFJ3bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxMBKSuIyVT6z82Kq5S3J5XfArzem+Ntq/Ah3QwJeKqCeSrQcn5Wehj9ohBjKUOcQ8CzptIWO8ypVlFGzTXbjz1wrVoNf9PEhAjhhK6PVJcaplqekAYBlgHtHeAuna0MxxvnpoGhcMAyOYfmuHHbxiRNf140gmeNrMb5WpuNFMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZ3petdS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZ3petdS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B951F0089A
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089021;
	bh=QPkW4aVoe/0NbA4NwEjKqNu/gW6+hIbN3gcfVZFJ3bA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OZ3petdS1ATge4HT06+k2y7RJHAjBFMjVP7z3R/p0Uo+tSKVuUZvsbO3n7LtIlIzu
	 89u4qNvPmfBAKcTOj1SnaeBkm0gOaxU4b4Ut7MzKFb7E+VSoaSBDr5nQR4UlhwxQ++
	 V1P7C69acDsfmnfEmkeAgPQ/XD5zJ7ZTG9IsTMygQ6MrUs/a/JSyDWF+TBSBxR03cn
	 6uq0ogZvfkTgrikMkOePeoSvwP/9Dj7ERNm6fUxGeainRq/aiuoAbBkH3cYTPhEW0a
	 69VVDiWNMqAhSjksvRm4UZxBF+NOCuW8tZpDYE82xkXjO/no7AUZ55K1EW9hYXD9gH
	 T57gXXDljA2eg==
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aac92dbso3594770d50.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 07:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhYiBttofYJzBRdZIa/pYtxG7lmc1O2wHWzAOM4WD0T/7kXSp2sLQmZGBR1p6HIP2RxosKrQtLi+w=@vger.kernel.org
X-Gm-Message-State: AFuF++mWCPTIFmYqUgFaJuxAVbGtx6LQlci7bOlBCkjSsTwIA5oYExSc
	zfRSWJhNJtcT1Re+NYIG/g9It3K31E02G0vBFxh8NxrlBxF9GC2DH4agFSgeopK2GF47syN9wSi
	YROJRUz9b4dpyGfRRtdrSD7G9jcB71Mmwj81sxaWmBg==
X-Received: by 2002:a05:690e:454e:20b0:66f:c1be:a65c with SMTP id
 956f58d0204a3-6717fdcfd37mr3462183d50.78.1790089020967; Tue, 22 Sep 2026
 07:57:00 -0700 (PDT)
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
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com> <arKRdaNEaKvFOtMg@linux.dev>
In-Reply-To: <arKRdaNEaKvFOtMg@linux.dev>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 22 Sep 2026 04:56:48 -1000
X-Gmail-Original-Message-ID: <CACePvbX7aM45SE9H0hg1_uXBt1i4W7Pgk+d33Z2sG5bj8cHudA@mail.gmail.com>
X-Gm-Features: AcwNN1WXZFPYF0mNrLqLpQPBa1zvff82T2VNW1CuKAu09epCVErwfyw7KrXxM2s
Message-ID: <CACePvbX7aM45SE9H0hg1_uXBt1i4W7Pgk+d33Z2sG5bj8cHudA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Kairui Song <ryncsn@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
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

On Tue, Sep 22, 2026 at 4:43=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> People can speak for themselves and suggest other time slots. You do not =
speak
> for anyone but yourself here. At this point this is derailing the convers=
ation.
>

I am expressing my opinion, freedom of speech. As you can see in the
previous discussion, Baoquan wasn't able to join that time slot. He is
a major shareholder in XSwap. I worry that alignment vswap vs xswap
without Baoquan is ineffective. That is my opinion.

Chris
