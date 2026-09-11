Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79733395AD8
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143659; cv=pass; b=Q5TDZN9d+PGuW5hUdx97s6bBnhRPaLMtiKAa0l/0m0POCwi9Riehp5lWlwOrbEkenK55X7qQjC4zzVhswDbJmczCDIqLlrDU9CgaM9fAqGaG+zW7ZqOpdDXIoKJ/AHLthkTmOCrMhPyDSlCQk/Psk0L8DrRdX6m49dT6Mphx8Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143659; c=relaxed/simple;
	bh=D+30lDlcgxH+NCGTyCWjhWPMaOa6aoqrueHB2CoYy+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zurdnyl3AmHHQ8Are8Au5zrG7WA2e8dMEd+gaMr2A0S4rHzh7BdwAmTnfSYq/vfeKE7h6YfgfMgBv9+FXov8WL4WxSgLrZzTyOePX1G6J0uWc068AvI+zoe/fE3nj9wfXoyWEFPcooVI6tXZh6iXFAtIV4DWHySX9dWjm2QHezc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWMLKD1v; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWMLKD1v"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2938116fefso212100566b.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 09:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789143656; cv=none;
        d=google.com; s=arc-20260327;
        b=FWdMRV/4uXs2yFWT2JJaw5lAJTMtfFMiubWNp2Bundukc/Pv0NUI5K4sojghBMQAIu
         Em5wYPlR2q6OKuPCmLq+eb3ByciuYJq6VA04ftFGl3cbAARkFlpOU6wk7Ixj9C26vfSQ
         VP4VvdQ4bSmN8SiIqJA+GixsL9d3uXxdT8t099Ro3KxRftrI+q42ge38qlegQMMeCdzY
         zMg6XKdM+qo2vwFYYiQ70L/z3+VL0C0+PdkkfecnKiKBS4XYjtO+P4fhLqJnj2KgG3VI
         HS5E2/HVSN3fc+QNRC5Nimu2m98K8+E00RlYh2epuG6z8WN/i7kmfTo1p557gvb93YCo
         6BRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+30lDlcgxH+NCGTyCWjhWPMaOa6aoqrueHB2CoYy+g=;
        fh=BIAxAnvesJciLuGv/jL5oFGAzoJ4JNSdI0MWAsN6x88=;
        b=fmJpJwcDBvWkOzv9rTJpTX68E4FYp2UWDsrN3QuRdlnd1C6ZMkMrbn1WkLxHANKCHn
         T0D1Sjq6rmzUelcrMKWvlK8HQsomi/6pUYV5V+9haATbeOjud7OkLNzFntRHxiJaI0zs
         elkCgtMQzyn6TIjnOPUY6HehxUWScqor8bNqOGKOCimnVwLXKzsuPPeunYvPPtpHp6pX
         2Is6XXHVLbOwT5My6C7caaf2HyJ5Y/NupPPTbpQdD3JXPCZFPPb9UHRKOKKPIaS/cqyi
         rK//dCnV1K23gX2zA4iUgEVftBeN4547fV84xeZFwL6bWlH7+Vv0adAH4t6trVDC80mx
         pDdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789143656; x=1789748456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+30lDlcgxH+NCGTyCWjhWPMaOa6aoqrueHB2CoYy+g=;
        b=rWMLKD1vCNa1MSkFM9EAcQ/BzM+sRbFwc1QFC0icP30QjihsMH0RPDp/Ee9/4AnQCq
         Sz4S5mfJJS5km9J08lAOM1vrcGIF6tT/lgJ67qGjYxn5u1OkG4TLBXEAZ8eSoD75imsC
         gHeBZ2StBFaHXq0OHOxC6g7Vv84EHRP6O6Wue1JB7+bNeesfXPelLRRSnkJEVOBWGHwF
         MVXKZlhKYFm9eS6I/+RUaSuhrPXKJSuw+AtJqcpxehV08+bP74jRNSTRy1bcNDOQjBKi
         l7MtxA98vwEcjXb9FdY1d6bJx4zoTkqehPMIfu3+m/iYWAKlsHJ9JiAYV00k21t5aqh4
         3uaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143656; x=1789748456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+30lDlcgxH+NCGTyCWjhWPMaOa6aoqrueHB2CoYy+g=;
        b=Ip0VW4IBvpBKDSljf+2qeYGlwYhfAKrri6rzJV2s69i1hgpW4iv5+S4euG7vtwOLvL
         9tXnB72rZd3B2DI+xD+IOhYTXgLFj+YoyJq8/UuRFfnBPECkyb8ZwvpSf5spgQWRYjfZ
         DQE45FJhkKbCIoWjqKu0Mc2UeUgN70cyIQMEZMCe77vtDzRNBxMjWb2JLRVhm8sAzvft
         SLzfb8L89ifRcF++RS7+iRI+gG7fUboKC65MS4WE0SEYif9dNJBr4dgvjJSI58ExpXm4
         yQLAl2ysoQ2YpTdmTLU9tfJ/tEKTRX61mWUiPncL+Af2EK0fDf1S/3m2rJtxOpmiYScB
         Thnw==
X-Forwarded-Encrypted: i=1; AKwUvBxbaxjR1NtEZ/4AX7VGaL4ymWmE8rlo43+Qw+kHKD26SQystOvwKDC3raW9hWC4TMUTj5Y9wtRaato=@vger.kernel.org
X-Gm-Message-State: AFuF++kL7jjFWWjWTxDuJF/aShFqi+036JcgD6gStP6Q9rCnqGEa/iYJ
	ItlCanFw/BNyQ7DDurjqfFN9lPwZksuBLH7YmA4o0eTzwWxEH/752D8/mm1emM91cpREJw2nTzX
	v3BPCHnrE6GCQzBeoQPhlEsYyVOyV9tU=
X-Gm-Gg: AYBFou0IcFlLJLcUHiG4IK+ot3SNZQpOgP7+avQSGAfRYpHFXYeSihQ45YuZcuX984S
	LbklSD8MPCYkfTBoueIaucnT5/ksqAowclDz6U/DdKHlNdOE5cpw3C3SSm3UD5OGkp3T2itQUr9
	pbbmEeoqQxal96DU/0QY2qxtURxL4WTcJyM29JWUfsFeZBqimrxMOacFHKAty8Ho6L1Bw4s9E2b
	QbzOBq0Pp4573BqPpDcdmY42dvte1PSWC3zbAKPcCDIFVt0qhTw6kfmpic6soonOmebuKc44s/C
	8Ow9gW/4vCm7y2fvGNF7XIr4NtOMOpm7P7mvO3SHxMgJS2F52sRPNtMIQ+pevIv0JjLHhZcGusG
	MBrpYJuO6GpJ4
X-Received: by 2002:a17:906:c141:b0:c29:5151:16b8 with SMTP id
 a640c23a62f3a-c2966534d19mr204979866b.2.1789143655518; Fri, 11 Sep 2026
 09:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
In-Reply-To: <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 00:20:18 +0800
X-Gm-Features: AcwNN1Wybf6FDfg7sUWRjBvgNHNibYe2e1PczxS_TZMQQ3Wr5_VcCDK8f6zS35M
Message-ID: <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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

On Fri, Sep 11, 2026 at 12:23=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Thu, Sep 10, 2026 at 3:57=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 9/8/26 18:45, Nhat Pham wrote:
> > > On Mon, Sep 7, 2026 at 4:30=E2=80=AFAM David Hildenbrand (Arm) <david=
@kernel.org> wrote:
> > >>
> > >> On 9/4/26 23:14, Nhat Pham wrote:
> > >>
> > >> Hi,
> > >>
> > >>> To Kairui, Johannes, Yosry, Chris, David, Andrew, and other (z)swap=
 folks -
> > >>> I need some help here.
> > >>
> > >> I'll mostly ignore swap-related stuff because (a) -EBUSY and (b) we =
have quite
> > >> some swap experts around :)
> > >>
> > >> Reading below, I do wonder if the swap subsystem needs some more coo=
rdination
> > >> and collaboration?
> > >>
> > >> For example, maybe having bi-weekly/monthly meetings to get everybod=
y aligned
> > >> and uptodate could be something reasonable?
> > >>
> > >> This approach has proven fairly helpful in areas where (1) multiple =
companies
> > >> are involved (2) many concurrent development is happening, and (3) p=
eople have
> > >> different priorities and requirements.
> > >>
> > >> Is there already something like that to organize development? Should=
 we get
> > >> started with that?
> > >
> > > Hi David!
> >
> > Hi!
> >
> > >
> > > Thank you for your suggestions :) More collaboration and communicatio=
n
> > > is definitely needed here. Conference is a good place for this, but
> > > it's not something we can do very frequently, and many folks could no=
t
> > > attend (visa issues, etc.).
> >
> > Right, and conferences usually don't have the capacity to squeeze too m=
any
> > swap-related topics in, so it would have to be side discussions or BOFs=
.
> >
> > >
> > > A bi-weekly/monthly series of meetings sound very appealing. Swap
> > > contributors are very spread out (China, NorAm, Europe, etc.), so
> > > coordination will be tricky, but let us figure out something.
> >
> > Yes, that's an issue. I'd suggest swap maintainers take care of that if=
 they
> > agree. I could try as well, but it's rather tricky right now on my end =
...
> >
> > As an alternative, we could also use on/two/ ... slots in the bi-weekly=
 MM
> > alignment session to talk about swap. (I'd be happy to learn more about=
 all this
> > as well)
>
> That's awesome! Thanks for the offer David - I think MM alignment is at 9=
AM
> PDT Wednesday, usually right? That works for me of course, but Baoquan
> and Kairui (and other swap folks) - would this time be convenient for
> you?
>

Thanks for setting this up!

Is 9AM PDT fixed, or can it be adjusted? 9AM PDT is midnight for the
UTC+8 folks.

The time is still fine for me, though, I tend to stay up quite late
anyway ;) so that time works fine on my end if the slot is fixed.

Is there a calendar invite or something, please send me one, I'm happy
to do a swap sync discussion there.
