Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793234096;
	b=j8yhYfdANmdKFBkYKhwGDdVbSh6kXDoKHEkrNHjiPn2A6QX2tn5JOnk2l4l0mrzkKQJ5
	 lbGE1iUHJZUfPLu7aBSZQpaYnbD6BoyGHdZDormAYQ1cH67pLjwL4ER21OlJ49q+xZwok
	 K7+fnXxjKySP6cir8UFxM9BQn6JSRp1+aK3tGRjH1XJbZY2equN3PgS9ga1zLj/00qhCC
	 hOwwuuaBIn2xOnUWjwDgjX0im9g84VHt/gnqXu6lwLusu4fsViMe3IFf7AW88vxyXjcKI
	 BwUiC5eScgjDawrIuTaXySlQRuKLLNxcq3XJDGC2wual1GCXszMcvKCI6cOnaQzN+vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793234096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D5QSZtmmBwsZEse/gnhOiul6mMk02INnjVORNY8/ULQ=;
	b=gPIu+YO4oq7eJ9OhH5Re/+SPpnKM/WeoCdezDTdE+/kr+vTEneS1yDXF0orHrc7IW2qG
	 B+fTCiT4B2UL2VoKg8/sURAZNZyRjJ0ZbDiXQBaDGpBs+d7h+E21uwpBF9cHU4LGHM698
	 t8Ik4wCxRIO/fWzR2p+6/YrdvN8whI84rrtMdJHkRhMHSop4VbOLEwT+JgnwOM/4q3abf
	 AUM7debNLAfmD3/AUJll7L/4qyXWISR/oRb33lBY4mCfHJsn86PdNETLZH+QIt1ZgEp9m
	 AYqQVS6FnZ6W2wpyjvOfssDUT2ZGpe5rHJvDVxIZWmrEScjc8MAkzNfGsAJodwmEZgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="LTuOScZ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF2606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 00:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFCF2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LTuOScZ/
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so5405a12.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 17:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793234094; cv=none;
        d=google.com; s=arc-20260327;
        b=pOmCFL3PyOWGBJ9xUAtYcu+WOKPti/SxZJ5OZHgcIemgvjM3rWZUgSMVtr7yeypq2s
         IDovXx4hCe7KTo6hcHf1KdNbWbejFI00gvcQ0K+LO4gxkCqCHNsXytcpDbQcQ9WZdVWR
         eVoK/UWmNQ/7VjXSwUNfwyoQTF3QWf8+zyg7ezyPPudq10Io8XkC3oyXs0P4q54PzEp2
         HzEts98aak62L4hlzOYOz69F3AOzWHE7r2xLHYtNsRCJk3OZb7H8wgfX+T9S4SBhgKRi
         z0tdk/7diWfHD0jBdjoZIRoA2Nl05S2w5PKMtjL9xMJV4H6pZ5aApSP/MEi1oA8uXMQa
         agQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5QSZtmmBwsZEse/gnhOiul6mMk02INnjVORNY8/ULQ=;
        fh=NkvgN5TmTCObMZw3JLSFeiOP7bHBgWrW0s42Ts851gk=;
        b=jzLA6jm0TayMkNjANWuLV8TcX2aQHmAzI7Go/vJuNoN9TlZsQGdOSyf1+1XVeWa+BL
         HLysJBz3N1MKdMdtd9IOE2aG98IVbxTEw0OJYZY648JQXRgJkJEI69xPSSW3GZOnAALS
         VRdxP5I7TycH4Yf5lJ6He6QGbeOwkBTh/T254t4tVXBRYItpbLww7bU2IIvjrAzT/78h
         6F913eBYFgQiFK5fi8e6W0O39HlpqvS3skaWyEt6M0CrNOgoFYxWge+uZNr/ch+8ai/U
         1kY6+qZhxoShiEyEYAeGGUINceW7MV9q/e0puc6WBrrK428dMD0yQSiApmnL7gHFXyVe
         DhPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793234094; x=1793838894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5QSZtmmBwsZEse/gnhOiul6mMk02INnjVORNY8/ULQ=;
        b=LTuOScZ/rCyXq7B5fLImJnjGGPTOLIzzasDSv/Z2p6PqPJmRziQoJ1O7d3oaCjTkUu
         B+UHp0mCDOqLT7ySUAsfMBcv688Sc68emao2JjBm3Syd9L14UCbTocBopLtZNwXltSci
         HcqWledHcX8p09HWoTLVR80kTnAZQcRSkhylRdoAza5tG0xqU7TwwmGevDAUcWKSh11Y
         9YDiNIWspFnhubbtnWM7EBU3tZ0dBU7xUESfQOxDhxTvEfuHr9LkhNSpQYZ8XJy+yUO/
         teru1PJg3c97n+a1D2DSbuwNmLncH5DCw5M9qjOf/bmJLehvizG/8LO6jXR8ahHWR1Rh
         erKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793234094; x=1793838894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5QSZtmmBwsZEse/gnhOiul6mMk02INnjVORNY8/ULQ=;
        b=yr1Y9LMC+92MZnN5n8Zhf6nelPcJCICTR84IOSttq/Kq/X93B35LMCLcWDkUrI1kPC
         YsTAqX1ZAJHeOaYfnQ9fhOw7ah6Zfq19DKv12xkA6uZrRbIorGk0FiZhf7sD9N5k5FzY
         UDxJXtXAYquYl6BH3TE+FLTxbQVirn+Tp51+7WSshpEekJLFw/fKKbWhvAvE+dXITZX5
         W+bBKldK7A1vQcAZDKjAgw7Jr5wU3YLWA3/sFkwkoJQnD2kB+jA6cHlyh7qj4HCKeY+6
         0ZT53MvDmpor+lAA4v/oJxRhS8TDok32JDHfEO57DQh60RCT6gp/GxWKXVQxPVEDIv2G
         hLrA==
X-Forwarded-Encrypted: i=1; AKwUvByj9h41rQsspFgP0buMEZnzv5qLUkxZJtbFbHqdcQb/HwRQMOhXZy8t7dC7nyQ+PpG1PhXctBuyppo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgQB5Otof80NQAWmJDzf5KPy12yFAboax/HTWhWgaCibQ4k9kP
	7ul0lCG4KQz9BjHV1SY0RaCNJK0FRuOnxF9WAxTR3Nv6VPe+0U5L0byCQFsIHSGyl0zdCYyCZPW
	CmzCVpdYvUuQmwP8+9Q0UENz9kbkKgFI4gfMPOBok
X-Gm-Gg: AYBFou3x5Bq+W5dsQDD2CIKs/uuTa+PaYz6tyw5Wlu7kg9ZOcw/H7fvMGWiLlDMTic2
	Wdj8Asz2WmzlLxkoRnAZwH8d0YHgdJmiVUm2x07Gl9bhdJh9tyWcCm515AF4IJdXMCOzv2g4mpl
	Fbf1IUpwYbnjpyOjj76MytRrI+Q/DxqcE/k7IEUdGvXMbuyjpSzmPxb4P+zFzaPq/uAlPFd0Wz0
	UimB9/MCZ75U8jdkwvmQixpIYj8QSiCDNjNlcAiAPg9jk71OO88P1gZfeDoUwoeNG5TXgBHCa8l
	jdqC9v5PcC3znxdMXm2D3YT9Y5MLBdIbL68/ronFmv4cXEdvLEEVvaCQjOpmrqK7SUHQrP/j+6u
	x9pMAkaNG9Ew9Xyrp4y5jZL0PAQxmZj1zqMg=
X-Received: by 2002:a05:6402:305b:20b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b4b38e71bamr17357a12.9.1793234093746; Wed, 28 Oct 2026
 17:34:53 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
 <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net> <atYJA7nIu_RwpoCC@gremlin>
 <auIIxSorX0bhZNZc@gremlin> <auIPRjj2t0BcYlOa@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auIPRjj2t0BcYlOa@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 28 Oct 2026 17:34:38 -0700
X-Gm-Features: AclHuK9v-C5aWQDQlkF49lUxmcEnZFv5OCriejxPhNjzEUORWR_RPAcdszPg35Y
Message-ID: <CAJuCfpFVv-t08YGMPR3YHCyiOK4HY-YjMk5rB6tdBa=mq2MvKQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
To: Pedro Falcato <pfalcato@suse.de>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Daehyeon Ko <4ncienth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:06=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Wed, Oct 28, 2026 at 03:04:07PM +0000, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Oct 19, 2026 at 01:19:45PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Mon, Oct 19, 2026 at 10:53:27AM +0100, Pedro Falcato wrote:
> > > > On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wro=
te:
> > > > I'm concerned by the possible latency when doing this to many VMAs.=
 Do you
> > > > have any numbers?
> > >
> > > No, somebody schloppened a patch for a real issue and I haven't the t=
ime to do
> > > even the things I need to do let alone 'here's a new task' stuff :)
> > >
> > > However, this is a simple write to every VMA, done at the point the m=
map write
> > > lock is held with all VMA write locks dropped.
> > >
> > > It was implemented such that:
> > >
> > > * No VMA write lock is taken on the VMAs.
> > > * VMA read locks can proceed.
> > >
> > > I.e. it amounts to a loop over VMAs and a write to a field.
> > >
> > > I don't think you could possibly do more to reduce latency here, and =
you
> > > absolutely have to update this field across the board.
> > >
> > > Under any realistic workloads this will occur at worst ~days interval=
s, often
> > > far longer, and likely you will see quite some gaps between separate =
processes
> > > experiencing it.
> > >
> > > There's also an upper bound of vm.max_map_count per-process, so it ca=
n't explode
> > > into something truly insane.
> > >
> > > Most processes don't have that many VMAs, other than certain steam ga=
mes :) so
> > > it's hard to imagine there really would be that much latency here.
> > >
> > > And the latency is occurring on one thread, which is performing an mm=
ap unlock,
> > > so nobody sane will put that on a hot path.
> >
> > Sorry, I forgot about this and didn't get numbers to back this.
> >
> > I had an LLM go get numbers on this, all in ms on my threadripper (but =
numbers
> > should scale similarly) with fork() + munmap() all VMAs for comparison:
> >
> > (all ms)
> >
> >       VMAs      reset    reset     fork()     munmap()
> >                 (warm)   (cold)    (cold)     all VMAs
> >   --------    -------  -------    -------    ---------
> >      1,000      0.006    0.041       0.33         0.43
> >     10,000      0.072    0.36        2.1          4.2
> >     65,500      0.61     2.4        14.1         33.5 (default)
> >    262,144      5.3      9.6        60          168
> >  1,048,000     34.7     39.2       237          691
> >  4,194,304    162      163         954         2810
> >
> > It happens on a random VMA write lock release, so there could be tail
> > latency, but it'd be tail latency on the scale of ~weeks for normal
> > workloads, and (assuming max map count reached at default limit) a ~2ms
> > latency for an operation such as mprotect(), madvise(), mmap() or munma=
p()
> > which shouldn't be placed in any situation where the latency of that ca=
ll
> > matters.
> >
> > One call in 2^31 is the
> > 99.99999995th percentile, far beyond any latency target anyone measures=
.
> >
> > The amortised time per write-lock cycle is ~18 picoseconds (0.018 ns).
>
> Thanks, this addresses my concerns :)

Sorry for missing this fix before (due to my vacation) and only now
finding it. From a quick look it seems correct but I'll spend some
more time reviewing and testing it.
Thanks Lorenzo for the fix! I completely overlooked this overflow
side-effect. And thanks to Liam for flagging it!

>
> >
> > Interestingly, the runner observed khugepaged-induced mmap lock stalls =
of
> > ~100ms, far far more regularly, which seriously exceeds any of these
> > numbers, about which I assume we haven't had too much complaint.
>
> Wow, that's horrible.
>
> --
> Pedro
