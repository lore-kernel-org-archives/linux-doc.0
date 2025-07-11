Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237EC2745E
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 01:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752196046; cv=none; b=SONuReHCSnRAVeVSMRytBY0LM16jIAQ3xlN4nO1+XbCNhhJ+pXUZ0GWfWIM9KuN+WtbC7LO9nRsU7XZyA91b0vS3+u3H9OLI6xM1nJImQz5YTOc7rbV5k2TiyH2q52xKrWPA4XSxjU05wo8GnYzhvA76HPzkQAdjHGnA4kY8ot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752196046; c=relaxed/simple;
	bh=YRvwCC2Ha4y1rPhJk146f/loFd2WpTlx2lEwZSYmXVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFnt/1SjnGw+34v6zdYHl4nwHj8Zlb+i4reJHQTSZVB3DTxycQ6WZMFjApFgAbIUO0lF4sOvXPLlsaeCoBmg2Ztk1tPTJSH0OTRjsK+rCoajAhdY5Lb8pSTx+K9t+6s4Iv8z2unCTUL6jZUjrd8Mzig58l61E7etXrw+wssl9n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=QpqmL3Wn; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="QpqmL3Wn"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-313756c602fso242963a91.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 18:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1752196044; x=1752800844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTpOdXsMQLzrcYHow8zySMbXm3VVzD+3w6bdwbkL+9A=;
        b=QpqmL3WnTWY+aaZ+yV4l7EgGxPehD6XOjs6EH7y0GrZjD8yooRqtleAsbpvZyZCkxL
         TiSFp9LXn3bT6TydLbO4DZmGlyWBaTAuFDjILoCkvnCcf5jAIUq9tT3ttuPXfWyzv86E
         Aio6eznbgcs00LgmqLxWEQiqCSXHqMeLyyIo2nR8gqUHmF0PX6j9aDs/y+IXSykxtT7c
         v+Vnl4gQwmib8+qQYbARNwvsZEEt3+OBholzuMUA4katZR5m+/2OB3GISvwxVaMEyyEM
         LtxGVg0DXTuKEpVu9KlJu/go6FGz6BNaIAxE9XOXIcjVjLqT9BfPtPKxwTvx9e45VM1v
         A5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752196044; x=1752800844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTpOdXsMQLzrcYHow8zySMbXm3VVzD+3w6bdwbkL+9A=;
        b=v0e2vGgN+z1GqSfoXUp0ljzRCtYTHnyRr1LkGr5wRCr9+VV8KtaGvnSG3/mZZENxim
         wnyJbowAC1WhVgibHFEhwLYBHJORcNm7t8C9WtcEjdjC+M6PZ8EkcSGvvvwWhI+mEjaB
         2ufcei4r3yFpz3oE7mYMqskkUZa7qEd0QJP7Dts0PCaLYe9UqHfCYCQhtyQXU+lvWh8a
         +cJgy16Wr3EGf+gw2lTcrzu1/cDBfv6DyJxQgbYjtdVKIYtEWK0QgysbGEpB4S6jIw0l
         7QDV9ItnrIIxL/WmLIU7s9xRg2o2Sd1X1gKb8HemYgrHuGHCjbvGQUtsY2SzKFX56Ooe
         nJBw==
X-Forwarded-Encrypted: i=1; AJvYcCX8L3Wc0J634XNC5vm05YsugGmYgtiX9AA6R46BOuUoHRrzgRMvS5dWKUbBxkMaZb6ibDyQfh0qPBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNirsdwJbbcQ80vdwp+5zST+WZG71LaSH9UQUc+02CZC8OOji
	1j3muxE035pph2r2h05WyQW36R4JeDmlbfz0/c6J6CUo4k+B/lDiMGN/ADiDrjjJqq9yEcTR1Qe
	jR79QET7Wr4BsP5Mx4qm6REkQsDOEjFyLygjeK41Vww==
X-Gm-Gg: ASbGncsJP+uCMwuayLIagDKuA1trwBhL6WjOdoFZ6q3BQwEGHehZmqBc+1oY7NUOLNt
	EJLHfjwqHv4/Yx4rxhefqrPxIU8Lp7CBMZjtcJRtW/4XbbxUquM4PJKj2YOhUIac8IJZ8Va1JRV
	KzhVzFyqysikxI3JjCJVNopMvc7tLUlvjENhDIZJgzgGxvQNuf0/tFyws4D+g4wRr6UdyAhtQfh
	Ils7ok=
X-Google-Smtp-Source: AGHT+IG152UMqrIIRd2Xd90YPDSf5pEnbfvoOgqoYDrpOcF3WJk5ojY35gB4oWHE2yxNeXBAd3hQBEsb+k4GAvmvpHo=
X-Received: by 2002:a17:90b:2711:b0:311:9c9a:58e2 with SMTP id
 98e67ed59e1d1-31c4f563077mr309964a91.7.1752196044222; Thu, 10 Jul 2025
 18:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711002322.1303421-1-cachen@purestorage.com>
 <CALCePG3a6wG+3Nu7-JHha+LMtyRRNF3sXp13sS-=Xv1pvsX09Q@mail.gmail.com> <fhy4rcjrwwmlebgoiwepmga3fovxdvqeylsub6lk3opl2fi2td@ucuwdpu4ua7r>
In-Reply-To: <fhy4rcjrwwmlebgoiwepmga3fovxdvqeylsub6lk3opl2fi2td@ucuwdpu4ua7r>
From: Casey Chen <cachen@purestorage.com>
Date: Thu, 10 Jul 2025 18:07:13 -0700
X-Gm-Features: Ac12FXw6y-q8rSNhM9jBT1X4xydypPX-JJoJktrjXOfl29h8h5Mx4Q3MEQyzFt0
Message-ID: <CALCePG1h8NE010EGpBh8CxhiWqr4-GantEJ4P0Dnck+cnioBiw@mail.gmail.com>
Subject: Re: [PATCH v3] alloc_tag: add per-NUMA node stats
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: akpm@linux-foundation.org, surenb@google.com, corbet@lwn.net, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, vbabka@suse.cz, 
	mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	rientjes@google.com, roman.gushchin@linux.dev, harry.yoo@oracle.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	yzhong@purestorage.com, souravpanda@google.com, 00107082@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 5:54=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Thu, Jul 10, 2025 at 05:42:05PM -0700, Casey Chen wrote:
> > Hi All,
> >
> > Thanks for reviewing my previous patches. I am replying some comments
> > in our previous discussion
> > https://lore.kernel.org/all/CAJuCfpHhSUhxer-6MP3503w6520YLfgBTGp7Q9Qm9k=
gN4TNsfw@mail.gmail.com/T/#u
> >
> > Most people care about the motivations and usages of this feature.
> > Internally, we used to have systems having asymmetric memory to NUMA
> > nodes. Node 0 uses a lot of memory but node 1 is pretty empty.
> > Requests to allocate memory on node 0 always fail. With this patch, we
> > can find the imbalance and optimize the memory usage. Also, David
> > Rientjes and Sourav Panda provide their scenarios in which this patch
> > would be very useful. It is easy to turn on an off so I think it is
> > nice to have, enabling more scenarios in the future.
> >
> > Andrew / Kent,
> > * I agree with Kent on using for_each_possible_cpu rather than
> > for_each_online_cpu, considering CPU online/offline.
> > * When failing to allocate counters for in-kernel alloc_tag, panic()
> > is better than WARN(), eventually the kernel would panic at invalid
> > memory access.
> > * percpu stats would bloat data structures quite a bit.
> >
> > David Wang,
> > I don't really understand what is 'granularity of calling sites'. If
> > NUMA imbalance is found, the calling site could request memory
> > allocation from different nodes. Other factors can affect NUMA
> > balance, those information can be implemented in a different patch.
>
> Let's get this functionality in.
>
> We've already got userspace parsing and consuming /proc/allocinfo, so we
> just need to do it without changing that format.

You mean keep the format without per-NUMA info the same as before ?
My patch v3 changed the header and the alignment of bytes and calls. I
can restore them back.

-       seq_buf_printf(buf, "#     <size>  <calls> <tag info>\n");
+       seq_buf_printf(buf, "<size> <calls> <tag info>\n");

-       seq_buf_printf(out, "%12lli %8llu ", bytes, counter.calls);
+       seq_buf_printf(out, "%-12lli %-8llu ", bytes, counter.calls);
