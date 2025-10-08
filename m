Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF732BE7A3
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 04:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759896640; cv=none; b=VzCn2IhOCWjXM6ADKQHdoB7MOsnlyIXD1x7eeHjSO4y3rUyYaZBjWooydx0gBOYdTpRxM+CujJtOFgXD6XIIfVG8YLrZOMw+ZdVqvqtVqYch5NxmUOzK6dGs2VX5Zo4rVbIYwcXMSKn00BiG/ObJA95jEQNgleTEeCrGY72UU8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759896640; c=relaxed/simple;
	bh=k4kMP+g5RiEZcnhoRkeve+Z9tYSilH0RKGWoeHvR8Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnqHXKCjKYceVYMgUG6endi+KJVoDxAw+mo4VTZDRp9fl1EgdUB+b5bNinuYbLdZrA+d0ckxEgx6i+Ysn7LF1Uqvmbxfh5aUYdHErkMe38DQN+SdsR3Ansafc/0tOgpi3BuLSuyrsz2NrcbxAvATeEL3kzOBuv75HNVYTWpMgnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfuGdehp; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfuGdehp"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so1882754f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 21:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759896637; x=1760501437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4kMP+g5RiEZcnhoRkeve+Z9tYSilH0RKGWoeHvR8Vo=;
        b=AfuGdehpws8psHDrxjZiAT5/r9OcqLXrTk4VEW5ru2d0xrcL45TSgJoiWjkR+6MJ5g
         haxSIicFpoCjIqdLfDaTA4kduBhaltToSSUFgw4AgBQC/C+bjahqW1DrFpWmPFSJqu67
         qxoXepTbQAbnaQS+7vxJeGBaIqieixnJrHbWLiodTFypiJSXz6UhbbQTJZhOkTTG5b6T
         I8uLUVICXLqsr6GLNB9bRt6EIhZNHnxBEDss5QFfHTi3mNKFyqh7FMBuhxkmfZSbwQS3
         Bd8KruVFfgqGT28dD6DFBFy6ZPvqCT0iUuP96KHuzblKZfzL4MGwAuu6/orGSr0voCdL
         TopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759896637; x=1760501437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4kMP+g5RiEZcnhoRkeve+Z9tYSilH0RKGWoeHvR8Vo=;
        b=Ws3w+6BEriY/iFUDTE6gqD+PvWkkfA447EIRAUj5H7lTDzyv8l5S+gjdXvhJjUPhrk
         NymMQSsPLbNndWzMbIVVQiXTWkcC22D/WuCBPvhFnJubS05k8McmGmVL/v/2GMdtv+/H
         Ju3tDyYtyCh5+pdD8GTLW0M4Ef0Z7LDhDz1OK+Wz5YtThcxfozmw7ZgCJJjIVFLMW6ko
         bhW9O9IfERbwtPaBoYRnbEBpNXDr/QRgb7TKZUrEWvnJcmanR3Gpic9a4xdYV6avXrVk
         alwfugTihbUG6zBl0bUY8hduzrho2XupQCOMmRDbVqVJ7htcvvXQRpHaNzwKZNn5nq++
         aGrA==
X-Forwarded-Encrypted: i=1; AJvYcCVCdOcLPmKpeR8fKbo3d6pjHAVXScwmbWNqxIPndx3yLJ1e4oBDKMqzHSNwtBa/A/9x7/0/6TLmTqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/O7uCbk03s0LLbWH++rmx6iwwJpSaOxdhjO0GKkJIY68iStd
	isvTBmTCLVhSc0RmKjf670QjR8Li455kPYDh5tTKZAK14Bwcvt0X9WxRffEvGruHXhexVWMYmum
	kdFxT8DSUZ+vcZlqW/ZpPqFDiMjzNk/8=
X-Gm-Gg: ASbGncv21RjkjTzA4xe1m0dxc7iwLPIwwd4Dzl5rpMTvF96Kgd3jiFegU1n6Jmwu+GT
	NeASKYYBix+PjCEXi/OKo3H+m0tWbsEriT5qX/DHxc9mlGmmcg8kdze+N66C/UvbsDUoMRtLuiP
	qSKJeiesscQXqMKC2OKnMbpUFTryWp/fEpJ8l1i1mU8555LUVMM6r8YAa2eyAAdNqSGlp6vrsmM
	UabLyMg0tPoDi5WbBXHOhAras+xjWeOM5HNHdIuQnzl9UtS8FyPCAmbrfJHcxU1vHsZd4KfFaw=
X-Google-Smtp-Source: AGHT+IEbTF1Padja2a5VYTPxu9e01sfQgU7xUDhedDQcSi45ZcqbFc2By50SOlGmeATDd+z0rHt0ZHSn8owfVsEk02s=
X-Received: by 2002:a5d:588b:0:b0:425:7f10:ada7 with SMTP id
 ffacd0b85a97d-42667458124mr907732f8f.20.1759896636654; Tue, 07 Oct 2025
 21:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930055826.9810-1-laoar.shao@gmail.com> <20250930055826.9810-4-laoar.shao@gmail.com>
 <CAADnVQJtrJZOCWZKH498GBA8M0mYVztApk54mOEejs8Wr3nSiw@mail.gmail.com>
 <CALOAHbATDURsi265PGQ7022vC9QsKUxxyiDUL9wLKGgVpaxJUw@mail.gmail.com>
 <CAADnVQ+S590wKn0rdaDAHk=txQenXn6KyfhSZ3ks6vJA3nKrNg@mail.gmail.com> <CALOAHbBcU1m=2siwZn10MWYyNt15Y=3HwSGi7+t-YPWf0n=VRg@mail.gmail.com>
In-Reply-To: <CALOAHbBcU1m=2siwZn10MWYyNt15Y=3HwSGi7+t-YPWf0n=VRg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 7 Oct 2025 21:10:25 -0700
X-Gm-Features: AS18NWAHpHX-o2MgG3uRPCIrdO8_WsGJ2z7_dnabrBdSIRdjp2sl6QIslommR8o
Message-ID: <CAADnVQKzW0wuN3NfgCSqQKVqAVRdKVEYMyJg+SpH0ENKH6fnMA@mail.gmail.com>
Subject: Re: [PATCH v9 mm-new 03/11] mm: thp: add support for BPF based THP
 order selection
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Liam Howlett <Liam.Howlett@oracle.com>, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, Johannes Weiner <hannes@cmpxchg.org>, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, Matthew Wilcox <willy@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	David Rientjes <rientjes@google.com>, Jonathan Corbet <corbet@lwn.net>, 21cnbao@gmail.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, lance.yang@linux.dev, 
	Randy Dunlap <rdunlap@infradead.org>, bpf <bpf@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 8:51=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com> w=
rote:
>
> On Wed, Oct 8, 2025 at 11:25=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Tue, Oct 7, 2025 at 1:47=E2=80=AFAM Yafang Shao <laoar.shao@gmail.co=
m> wrote:
> > > has shown that multiple attachments often introduce conflicts. This i=
s
> > > precisely why system administrators prefer to manage BPF programs wit=
h
> > > a single manager=E2=80=94to avoid undefined behaviors from competing =
programs.
> >
> > I don't believe this a single bit.
>
> You should spend some time seeing how users are actually applying BPF
> in practice. Some information for you :
>
> https://github.com/bpfman/bpfman
> https://github.com/DataDog/ebpf-manager
> https://github.com/ccfos/huatuo

By seeing the above you learned the wrong lesson.
These orchestrators and many others were created because
we made mistakes in the kernel by not scoping the progs enough.
XDP is a prime example. It allows one program per netdev.
This was a massive mistake which we're still trying to fix.

> > hid-bpf initially went with fmod_ret approach, deleted the whole thing
> > and redesigned it with _scoped_ struct-ops.
>
> I see little value in embedding a bpf_thp_struct_ops into the
> task_struct. The benefits don't appear to justify the added
> complexity.

huh? where did I say that struct-ops should be embedded in task_struct ?
