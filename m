Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617752BE7A3
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 04:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759898364; cv=none; b=ZVEkOGB61v6ddOSAtFiKCeVFpRxpJomM10h24owoQfxRhQZp5AToYqPPKAwQJDgT86yIAS8dhSvusquqCXdaJbO2wQEjYCuReph75TbdNSL+p1Pvt+tAlPpnA1Ie2DP8HLhhET2RopIupZyAw9keT5+tEw2/3aJavYmBaziTzhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759898364; c=relaxed/simple;
	bh=Rm3GhlyZsgjNHwG8nD1ukkMMPB/ILNmwuDjzy2VbVTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtIPHuowPCOst0U17mJ9vNDVZLkF4YMxZ3Wo+aQVFMGFEYSzYH+OMj1sEvUFI6BSECgEnsUoXU/6PzQlwsQB7fowfx1g6JJIYmmYFIGA/WZh/Gc/5Ga/gNgXwAi7ZOY4rV6MWdE5F0sKJ7k6abucSDajgHSg2MhzoWyqlw42OMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDrxZhd7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDrxZhd7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so3250065f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 21:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759898360; x=1760503160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm3GhlyZsgjNHwG8nD1ukkMMPB/ILNmwuDjzy2VbVTE=;
        b=LDrxZhd7ewlwU/7+v5hH+trhWFZ8PO/eFe9ge/Rl5Sr5PokQ8ZJ7O0447Q7tC0w3cv
         Jjqh1csIA1Mlyz+FZrTzUtw22/GqPLFrGdpzzk3SDhnii9rnROLSDNfI/5ZxCJdGGfq6
         olA6gnmJ1Qjk1D9Yv+hnk8y1sEnOqmjYN9aifckndFmU/Q+varK2nW9n6a1Rgp2LZjp/
         6soVStwb7WMj95C/B2/gTZBGQHTccZnvb236ciIBBUaF8+5Dcl/K7RHZTD+qtChK6np9
         0752Rs96/JIyR1arQHkPv6UuBOZCa8KkJSzDYZRBnVaU+o/Vz88AaOOzuVCqIR3r0TTF
         tZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898360; x=1760503160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm3GhlyZsgjNHwG8nD1ukkMMPB/ILNmwuDjzy2VbVTE=;
        b=YhtklQHi7IERRRrnlpxH3kpexYoMu1n0AKNc1ON+0BWxKo0QbBXnOMbCl9O1AnSir2
         HyHP7LNCs+EyntKoeV0zwPVpDwsr6YxU9RSED8LCs/E7WFUhieMtOrTsuc3w+ffN9Fd4
         NkRSW1BHpw0SENNBANPh7U/1kIDX2KeNlvcBiiQo1B0VFmrDJkzxbfAZ7pVSKPdipdQ8
         5c/kggSdU4WtkgQHjma74gGpCjzHN6EPamIztBX4u1zEefthIiJsVKFb8V4LN8XtvtyZ
         fi9mAYxbcWOPzM2xZzciC5oOxYdw+BYN1L5YIi6RcgLUa6Jf7IfyM/iwgv48PWBfhN+S
         0yGA==
X-Forwarded-Encrypted: i=1; AJvYcCUkb15MYjnPpSbbJyW2zOV107dYt/balmTYUghWLGwm94sG8v59K1JfpK4hyySJsjF7Q07kQPjSyBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEPhQ4OMgVGUEo5aHr18DL/OOUUll5ujDfrwrvQYONfJfXImBq
	7oiXhKDmzlucAEB5fChDQQIba+QHsAGae43kaZo7MoMXMCZKtbCcXzhPWwsyO3f5qopDiU7A5mB
	wt4155zcOV6MceKKFlD1PnPoNjir/hCM=
X-Gm-Gg: ASbGncsjr09nDruY/uBCcsvr2m4kFpdQtXQkuK11Sjo7k+o/PlZcW3N3z79okYnXrAH
	rPwEdVKwJPir667UWwoR7qiifgiHfAQ6AiZOspqKqH40rsIg4s49r2vB7EWOGV7/1kEkRaTb69/
	/zgpMTSXyf5VwPA2jmKAvHTaI9ykOD1VeTwCRrg74sZZxuiGCpWn2rso4UuEIJ9D8rg+B6Gegf6
	U/1n/I4mtr5X4BKfPniQvVqA7wkkf/O2n7zQl58vZPbcbIbWkxUd9Nv74iAfVCL
X-Google-Smtp-Source: AGHT+IHVEHG1C3LKLnJ8DwT6l1r997HA+wzMKAexilSB8QteathZvj8Spsg01noOe1OnIJsIlqfqCOjIexAD1RZW1Rs=
X-Received: by 2002:a05:6000:26ca:b0:400:1bbb:d279 with SMTP id
 ffacd0b85a97d-4266e7d44f1mr925348f8f.39.1759898360484; Tue, 07 Oct 2025
 21:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930055826.9810-1-laoar.shao@gmail.com> <20250930055826.9810-4-laoar.shao@gmail.com>
 <CAADnVQJtrJZOCWZKH498GBA8M0mYVztApk54mOEejs8Wr3nSiw@mail.gmail.com>
 <CALOAHbATDURsi265PGQ7022vC9QsKUxxyiDUL9wLKGgVpaxJUw@mail.gmail.com>
 <CAADnVQ+S590wKn0rdaDAHk=txQenXn6KyfhSZ3ks6vJA3nKrNg@mail.gmail.com>
 <CALOAHbBcU1m=2siwZn10MWYyNt15Y=3HwSGi7+t-YPWf0n=VRg@mail.gmail.com>
 <CAADnVQKzW0wuN3NfgCSqQKVqAVRdKVEYMyJg+SpH0ENKH6fnMA@mail.gmail.com> <CALOAHbBzS2RunZzEk8-rkU60M8jKEJ8FwiPgZqNeoXDy++L5hA@mail.gmail.com>
In-Reply-To: <CALOAHbBzS2RunZzEk8-rkU60M8jKEJ8FwiPgZqNeoXDy++L5hA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 7 Oct 2025 21:39:08 -0700
X-Gm-Features: AS18NWC8ZPttD2mQYRSD8-3WnTYDsNM_I1o2QCoCf1odJXXOlkBQmZekv5Q9hPQ
Message-ID: <CAADnVQKLbc4iZDGWbbhqwr8hKhAZhyLjiZuuz_RBd2f9LH45rQ@mail.gmail.com>
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

On Tue, Oct 7, 2025 at 9:25=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com> w=
rote:
>
> On Wed, Oct 8, 2025 at 12:10=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Tue, Oct 7, 2025 at 8:51=E2=80=AFPM Yafang Shao <laoar.shao@gmail.co=
m> wrote:
> > >
> > > On Wed, Oct 8, 2025 at 11:25=E2=80=AFAM Alexei Starovoitov
> > > <alexei.starovoitov@gmail.com> wrote:
> > > >
> > > > On Tue, Oct 7, 2025 at 1:47=E2=80=AFAM Yafang Shao <laoar.shao@gmai=
l.com> wrote:
> > > > > has shown that multiple attachments often introduce conflicts. Th=
is is
> > > > > precisely why system administrators prefer to manage BPF programs=
 with
> > > > > a single manager=E2=80=94to avoid undefined behaviors from compet=
ing programs.
> > > >
> > > > I don't believe this a single bit.
> > >
> > > You should spend some time seeing how users are actually applying BPF
> > > in practice. Some information for you :
> > >
> > > https://github.com/bpfman/bpfman
> > > https://github.com/DataDog/ebpf-manager
> > > https://github.com/ccfos/huatuo
> >
> > By seeing the above you learned the wrong lesson.
> > These orchestrators and many others were created because
> > we made mistakes in the kernel by not scoping the progs enough.
> > XDP is a prime example. It allows one program per netdev.
> > This was a massive mistake which we're still trying to fix.
>
> Since we don't use XDP in production, I can't comment on it. However,
> for our multi-attachable cgroup BPF programs, a key issue arises: if a
> program has permission to attach to one cgroup, it can attach to any
> cgroup. While scoping enables attachment to individual cgroups, it
> does not enforce isolation. This means we must still check for
> conflicts between programs, which begs the question: what is the
> functional purpose of this scoping mechanism?

cgroup mprog was added to remove the need for an orchestrator.

> My position is that the only valid scope for bpf-thp is at the level
> of specific THP modes like madvise and always. This patch correctly
> implements that precise design.

I'm done with this thread.

Nacked-by: Alexei Starovoitov <ast@kernel.org>
