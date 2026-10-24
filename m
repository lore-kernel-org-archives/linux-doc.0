Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792857048;
	b=d+OQeUxIrM5Uz/hHBbO7hhTLQ0rFLvcKAs0VTtQ8Mqs7fSDIFPYnz6PIc0tx4VhcNwcv
	 IlID576LVcbMXyb5DfiZynE7IZk9IYxoIyGeftfRRyC/v9G+LT+O+KiyZyS/hhb+SrQlp
	 yeqbLSwFzvRtFhhvVrYZJKszkR5RGecknzC3QcR4VMsOusUuzA4oIYSZpMxJR3PwCGd6h
	 RMC8dcoiNAsFiGn1ybjzXMaL911nWPUIC7QypIUUotN76O6K+ucwUjF3FZC/7zXisf2ez
	 5LIJf3Dl/A0n1FcixwJndAWyWBT6SNghBGS3DkWvBSAKO547jmfp3kwz+pTa8eepFPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792857048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oFWGrkgth1iIJh7Anrwf3nuRUssZtgX5R4ZSgIf/0Qw=;
	b=a3ItoMp3heBhul1O3pna0vQQryC7f0NJaqMv30iQ7YCx6FcV9/o/QZ6bTwWo8+eGGutY
	 fUN8A80lFrvwX7cor1K6g62eYlk6eTwdlevIYX1YZjau3E7cAMBE+LK2M/8jC0fBLduQb
	 Ngp4BXgWrZ99e8tZgCTSb6vdPRLBuM6XjJOj4B7AYZ6JUsYzI0J3teP941eVrlECAT8f6
	 kq9LyQtTRyThyBA5ShFTGy4HX34TT+Yz+JpD55qxAb10Wqk3T5e/Gmmh31YQTEHcEtmrZ
	 z72HMJ8DKOmCCOraRqD0F1ThXlo9TvOKr2HQs+xMLg/sctCsUU2ntHAHjl72jKQ7kkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vox89apY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97C606A31F
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 15:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C97C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vox89apY
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1864036a12.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 08:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792857046; cv=none;
        d=google.com; s=arc-20260327;
        b=efuYnYfEiyGDfVuKBl0YeO1ACfi6s6AY4saNbf0U760yshZrIDgRkhLE0BfYt9psdc
         k6vd76DS8U/xGYqc8vfZvQfIV6uFJc2ap0ls5sjpT0ktnMEhsNAyyJ7WYG/pGkF6AkXk
         CTl77BOFlVKcNeBIqE4DDVf7coNPVA3eVZIzecfnXAa9Is+v0f2rlAlsWtL/N0tYc+e/
         6WeX4EEPAOGYefJkyyCnZ4QzXR9N9YdwMso1vgkFQpmQGxxoYqV6GYZkp0e4DhHL8Bbq
         UgzsLPE4kEgpOiWUAlv2yoVz02pwxDidQl+kvXZkRwN7exjXxFAbXOLrlS9ufGAZQ4sU
         qEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oFWGrkgth1iIJh7Anrwf3nuRUssZtgX5R4ZSgIf/0Qw=;
        fh=4Y+s0Z2iTWQnFvcLe3XmSlWIKk6btDbyW/ZhWHuT+oA=;
        b=Xlt7g1+J82uu/uKauza6XrEJZ91kh94JOPM+C0DtKoRj0++LXa54DQcYJHQ3211Tf1
         MAVR+cc4rJTS6WO6aN7ShMfoal8tLZfDCLbsQqEJtd1IQPpQAmynIL/bqv/5tsy8ap93
         T2nDH7ApM3dEZ0ZgqYv9r/wNit5LoyOOrWlxjsIq+uMGBZ3fx6hMx47wiCICBveXh2pl
         Jc9EtOz8V8AmxBqdrzyJHJRsda6RSqMkog0PmQYwH8RVDb0wLVnY9joo4cEdafD4T64n
         dofJ2Grei5eYLpTTMRUZ+wjSmf/PPOr27YAHigYAR3pGniBtv43Bip/f3i7LRB3KAYr4
         Gj0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792857046; x=1793461846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oFWGrkgth1iIJh7Anrwf3nuRUssZtgX5R4ZSgIf/0Qw=;
        b=Vox89apYKkxzNP74T2aNak5u22twqgjwpHPx+TqfYVI0UJWK006HQLjZkZctsylKGW
         OdyR809srohJ5Y3qGxuK2W8T/C2JGVFF353PRQN8LnBXRXizIFOonARk9qtHVMvZAL5Y
         907gpDI0XshwymoUI4HpatxHpTmFpZFhnzlNOtKKaW8hh6T5743QXiv+E2sAh2Shrv6C
         lov+NAcVRKcR1cDfGudqJQcrkBkoELFFnrj/qGBSSCxAicpRfuMbh9dHP6x881FjA0rg
         5IQcjVKVNaHZPgBEDGmaSbyODaFxyys81Djm4kb1xFPSiNjkAE2s+VWYDsJ1qyCJ4wCe
         E1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792857046; x=1793461846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFWGrkgth1iIJh7Anrwf3nuRUssZtgX5R4ZSgIf/0Qw=;
        b=iW5KC5XCS63o13LblnWLA777Z47e1sAndasRBeRQOX0MPleUc1G9jCN0wnoUFbt0jL
         Ze2RYnNxKVXSfCWgf+MuQWXyCpAxHVaJNkNDLClODaW4hzcnqkDO+5luXg1JqUqamTmp
         Yzxo6hjU9p5wnGYUpr4xtiWwTatpdH9ocUdJT7R4BviaGlst2/YTIZmJtFD9Hm3mdn46
         xv6C/joCiF2LXbNdct9YvXk6XcWmNkPUiJ83pmwF5SrZtQas3NIIDX8C9RNh4a8ue7r/
         gN56oB5C+7nuKZ6V0ttpOp/46A4PZsQiohG2v4f5guhRu7mJZlPSBwziIVEFZLdFMWxY
         R0uw==
X-Forwarded-Encrypted: i=1; AKwUvBy6VE6mU0xuFM8kq799VNcxeBhUQg51n6jXUn5rqPymA1SF5yOdBpv72VN28WxvLszViE40vraEluc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKhYsKl+B2MCPT7poYjrqqxPKh0CIi9ASX8pfvTZjtHELhemZi
	w7t9bwFKQG0dweE1z5aJOAbUNpPVaEZZgXEPa06EoQl73PH1MwdWj2uELOS0/bTHICKM2L52rlq
	kAA7MeuI7ITiqgE4YChS+GdudDcTGGgw=
X-Gm-Gg: AYBFou3j2RN/2rtn6pGHbyOP54T9+dYRpHyLYnVet21rsFbCHymg1m9rsx8FVIA2UEf
	jjNWZS3lNeU4giYrmoc+tBtEzZGJLt7yAxwyg71Xixk6pTnX+GiGR8GNpHglaq9N/iU1tcuJroB
	CAOXj8aAhi8kkGo8+K4r5W1xjs/X5R/E2xJAx1M8UCK7+ttcC8Hxo8xpbVZl5/cNOTh7dcAFCBJ
	US0zR+nZSbNei3W7/5rzlH6jh6YvZz9o23DtxPmt1VzGyTN9OI41LIR2WNwlpMwuzo6coqOKeFP
	cwwHW30n1aQm/xBYGaXij13mvqSJ1yveFFLTdtBO/IOKYYr86zcLX15/Gg439qJGiJK58UmAg0o
	RV1SQibrTV1gtlEIHN4CdCS6ZSgff08y6hZW/lVGqJdLsbs1I3OeMSBKdiS36JdWjtaP2gOAoS+
	r2lR/jaDtqlxOZCH4=
X-Received: by 2002:a17:907:3f1e:b0:c41:26b8:c49c with SMTP id
 a640c23a62f3a-c46bdd97c19mr234177866b.10.1792857046023; Sat, 24 Oct 2026
 08:50:46 -0700 (PDT)
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
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com> <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
In-Reply-To: <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 24 Oct 2026 23:50:09 +0800
X-Gm-Features: AclHuK8EdrvPlNQOkv86BcPqxKsSvjXgFWnjUR3jEYoufbz3bHhkuKrZQsexIF0
Message-ID: <CAMgjq7CN7qTes+OXvCfsgPOnbtyY7YPytTEP3zZJTBxrGZ5JnA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Rik van Riel <riel@surriel.com>
Cc: Nhat Pham <nphamcs@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
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

On Sat, Oct 24, 2026 at 4:03=E2=80=AFAM Rik van Riel <riel@surriel.com> wro=
te:
>
> On Fri, 2026-10-23 at 10:24 -0700, Nhat Pham wrote:
> >
> > * Swapoff: this was brought up as a request, but we ran out of time
> > before we could discuss the motivations and use cases behind them.
> > Folks interested, could you explain as a follow-up?
>
> This is one that I really don't understand.
>
> In my mind, we have vswap sitting as kind
> of a swap VFS between the rest of the system
> and the swap devices:
>
> +-------+     +------------+
> | vswap |-----| swap cache |
> +---+---+     +------------+
>     |
>     +----------+-----------+
>     |          |           |
> +---+---+  +---+---+   +---+---+
> | swap  |  | zswap |   | zram  |
> | file  |  |       |   |       |
> +-------+  +-------+   +-------+
>
> When a page is unmapped from userspace by the
> reclaim code, it goes into the swap cache.
>
> The vswap layer then decides where to store it
> at eviction time. This is configurable by userspace.
>
> If the zswap pool is shrunk, the vswap layer knows
> where to put the data next. There is no need to
> change page table entries to indicate that the
> data was moved from zswap to a swap file.
>
> If we decide to disable one of the backing swap
> devices, the vswap layer can just move the data
> into the swap cache, and the page reclaim code
> can evict it into a different backing store, if
> needed.

And in this case we want to disable vswap itself.

> Using vswap as a swap VFS would also allow us to
> get rid of the page table and tmpfs scanning
> code we have in swapoff today.
>
> In that model, I really do not understand what
> "swapoff vswap" means.

...

> What exactly do people want to accomplish here?

One thing is, to prevent page fault (minor), not sure if everyone is
aware, but a page fault itself is sometimes slower than swap IO /
compression (especially for compressed swap backend).

There are suggestions to use MADV from userspace, which is not really
maintainable when you have thousands of different, opaque and dynamic
workload, and that is very common for cloud providers.

I also hope there is a way to release swap metadata completely too.
e.g. for fs, you at least have umount, and can rmmod the fs itself
afterwards. We also have many ways to bypass the page cache. In cases
where a virtual layer is just a burden, we want raw physical swap, and
the ability to swap off that too.
