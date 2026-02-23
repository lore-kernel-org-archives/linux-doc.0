Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001633507D
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868599; cv=pass; b=mGUl7V1zxzCY5ZjU0yBe/Khb/xvvKf1wq9MaW65pnL8EVUCcWjPoUWTypaXDIcDT5LIi1KjFR75rLRHvffbFMkGljWc5V7kz7bv9xj7ChCE6MtMvVxD7pGxqMKzsRKy/XuqX6iK7NQwcYC4UzMr+jMvp+eCTBjdo20uz1Oh0OPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868599; c=relaxed/simple;
	bh=UpLPt/oB8+XkGfOx/1ojVQnuH+pIsA+hVmjvI/oayfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Na5ceKi6jip5eWXorqfnTXSqMfRpFa1shVQuXowdYucNEZeIxFJ7k7qzZKH/uU/diRb9+/EM8Uo9jS4ztBT0rNCZwgzEp7hkJDjeAiS5b5oR/jC+3RHqy0JuwvmtYPs9qK68KnVWa2esAXNtdOgz/0s7tDr0v0wS0W/ctRwP07I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oU7sspAc; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oU7sspAc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aad8123335so1255ad.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 09:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771868597; cv=none;
        d=google.com; s=arc-20240605;
        b=ejzI9OHzshdzqZvTskHgVxxLdeXV+6uAFQCM7a9avMpPCmd+DE++pHpS+BqCvvM2zW
         BTzdxWGa43pTLfCC/Fmnfj0E8s7qQiY0nVKP/BPbpubaSI7q7mn2pwPl2Kb7/RWA0VtE
         Md5mzHjZvaGq/TPMWKNqsr1r+pCsYHbn4OWFzQxGXQMtitJmdheOUGlrtIsv8yh6VI8A
         7LcDFqdoR5uYKkXmJFJO+qUc3gKxDz85XG/ngBDmqTtP8kGX/JNqJua7g+MBW1YF5h36
         kmx+VKMJfczkD1YspTvgAmUJ+y6bNDGYtLR8V0pmUyPfoembxFMAfFvGNvzwSkdOW3V5
         ypPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nchrh37I6wEN3HEejFjQWq3au44qPr6w+TKeLWlYsk4=;
        fh=1OLxdiacRYzff3zHSng3w2hPciAqMjzvQhy0CuJxLu0=;
        b=OnPsfnQo7BdTJlw+s0ZIN2Ob+3o6e8EixGlGhG0GZMbzhRFqEdlGknSVXwBbIZdOi7
         j0rKot3alguinDDtqSLpu7R5mtFRJXUXwIXp/JaiHE4IQYTjHdRS2NnqvAfXfscJSZ8T
         ztzv1hG1pgJqIMBIDVrjx0fVNz9Cx/+kfb9iSo7Amv8mI17Nm3C2qM2UTRdNZOaolbRP
         wMJwtnflTc78kJjHBwBif5ri4hMzoWPXv3pyaalP4ixlrcTepr9+QDMNjErSdKvc8CKX
         1JaqgLU+BMcHbr5012Cry/g+zZgMfX5j5TuwlHthAEEJWkowTisKkMQ79MGm3in5h8pb
         +UtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771868597; x=1772473397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nchrh37I6wEN3HEejFjQWq3au44qPr6w+TKeLWlYsk4=;
        b=oU7sspAck7q1pvjMGUrZdRlERrBobRxNJZi7LJnBFhNdpx9agMPji5/xUBYW4d2l3G
         y8ChJcUXkTNRJ05LIgpEu6cfBV8JR+97GPv13w9qGcGRqOZRAFYyev9KjgJuTr6wZyU6
         R3dyG+01wu5S7a8El8Oe7Qne4SgBYkouMVQBHAbrhE+YN2awOrs+ddt++ETLt2GQPfCS
         Ejzab//HHSv4+qWbpoBvRqQt4Aw3Jz46JGjWRuaS+2RFUBKWtvJEU3kPsn/Lwz0kxDsb
         SchTAE7RrRB13iT/f4ZDiHE/N+97RVPggzCERjexkBQGZqaDephNN7lf92jHxMSi3PZd
         5RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868597; x=1772473397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nchrh37I6wEN3HEejFjQWq3au44qPr6w+TKeLWlYsk4=;
        b=V7Bkp6O1B/zzG6Z49xqWoQM4t2GIN8OMWZHc5L0MjZuN8qJUEgLmOvWrVNSxreZACk
         trZmXAispw4fwRryoGuTeT1rB+axNEUh6EzIWjloUOalXZcKsrkWJ31yZBW6/Ce8IX24
         vbH82tIYXfxc2CN59RJ9/s0OzmLMr1oUenv2HozCJYMVWWOmNU8HvR+v5NJbmwZJaaoE
         MOo65QwhQxk3dldT19+Ev67R9lnMTCuQkxTU3Uw64Msk69OL3kwTFkO7RvP+c6faQVLc
         ypbjnaBAdsuBiXssOvAHAT6FTSaqP+8yo2DzrDULF3yKeBeM+GoRSx6dqNdzGHmcYHpH
         L9MA==
X-Forwarded-Encrypted: i=1; AJvYcCVO+VZ9Q61MJqCsD6YuxGo5zhaft3cUzZ2OfCRezdhjy8n7kDp3FNQPmlFxatsuZqtkAeTZZS5D4KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPsJYGyt5gJJNrzj2hEnNpUPHmMZ+9MrbJ4fVA9XGeBq9J45Eg
	zrpkrjYn8q/53T2QJKX8U/Xc8Ac8NjADaVggYFL9T4+2vpIMdgkEG10eKtKoRws3GDmuILl+zE4
	NqICePCv9YiEpM1yDr2KVMjuMER27rBDm0pBkURjG
X-Gm-Gg: ATEYQzxiGYk8GtcWmhwDlE6mrBed0LIJBc10+t0Myn5tDnPJ5sgIfJUsHi/XySs36ns
	42VrbAqaqxjt2rjqCg2M39HHP9dBFYcKwoQZwbG8+Ko049Hwhj0fo4vld7Tr3GGAKNgc9hIsBta
	Ir/piIomxGSEZVcgBbT9KWY/4ptlHsX6oLcQRJO4E2EFNdU57YKehjSFZf81NgIXXsZr7tWPLCC
	nCfwGUToeHa0NRTVaWigmD0JXC5gcewdTjUJxMvkcHazgmAvdI2r64IXdwE1l0LoXTb8EB58vNq
	YQffNeEgtBGOh7hO50BHOaU1VppjdQQ1iwc=
X-Received: by 2002:a17:903:1746:b0:2a3:cd98:f07 with SMTP id
 d9443c01a7336-2ad75ce8893mr2648175ad.3.1771868596848; Mon, 23 Feb 2026
 09:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820010415.699353-1-anthony.yznaga@oracle.com>
 <CAC_TJvcaJdEzK8n9BK0qgEXdzjzXtbA_Zk-ybfmG8kjNExVCzw@mail.gmail.com> <fqabaahjjlmoc2xh4cwh4ykbqyu3rnzvjw5epxi5wwpmgqth7f@d3mqpjozwmo4>
In-Reply-To: <fqabaahjjlmoc2xh4cwh4ykbqyu3rnzvjw5epxi5wwpmgqth7f@d3mqpjozwmo4>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Mon, 23 Feb 2026 09:43:03 -0800
X-Gm-Features: AaiRm50m9UYvsRrMNZGeDJldRqqXCjwlRuVa1vgsK31xKBtD7H4yIH2DN8vqIDQ
Message-ID: <CAC_TJvdRsfzYohiKW=82N8Ofi5V26rX1GS0M8HeaX6CEsgc+PA@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] Add support for shared PTEs across processes
To: Pedro Falcato <pfalcato@suse.de>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, andreyknvl@gmail.com, arnd@arndb.de, bp@alien8.de, 
	brauner@kernel.org, bsegall@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@redhat.com, dietmar.eggemann@arm.com, 
	ebiederm@xmission.com, hpa@zytor.com, jakub.wartak@mailbox.org, 
	jannh@google.com, juri.lelli@redhat.com, khalid@kernel.org, 
	liam.howlett@oracle.com, linyongting@bytedance.com, 
	lorenzo.stoakes@oracle.com, luto@kernel.org, markhemm@googlemail.com, 
	maz@kernel.org, mhiramat@kernel.org, mgorman@suse.de, mhocko@suse.com, 
	mingo@redhat.com, muchun.song@linux.dev, neilb@suse.de, osalvador@suse.de, 
	pcc@google.com, peterz@infradead.org, rostedt@goodmis.org, rppt@kernel.org, 
	shakeel.butt@linux.dev, surenb@google.com, tglx@linutronix.de, 
	vasily.averin@linux.dev, vbabka@suse.cz, vincent.guittot@linaro.org, 
	viro@zeniv.linux.org.uk, vschneid@redhat.com, willy@infradead.org, 
	x86@kernel.org, xhao@linux.alibaba.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 4:40=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Fri, Feb 20, 2026 at 01:35:58PM -0800, Kalesh Singh wrote:
> > On Tue, Aug 19, 2025 at 6:57=E2=80=AFPM Anthony Yznaga
> > <anthony.yznaga@oracle.com> wrote:
> > >
> > > Memory pages shared between processes require page table entries
> > > (PTEs) for each process. Each of these PTEs consume some of
> > > the memory and as long as the number of mappings being maintained
> > > is small enough, this space consumed by page tables is not
> > > objectionable. When very few memory pages are shared between
> > > processes, the number of PTEs to maintain is mostly constrained by
> > > the number of pages of memory on the system. As the number of shared
> > > pages and the number of times pages are shared goes up, amount of
> > > memory consumed by page tables starts to become significant. This
> > > issue does not apply to threads. Any number of threads can share the
> > > same pages inside a process while sharing the same PTEs. Extending
> > > this same model to sharing pages across processes can eliminate this
> > > issue for sharing across processes as well.
> > >
> > > <snip>
> > Hi Anthony,
> >
> > Thanks for continuing to push this forward, and apologies for joining
> > this discussion late. I am likely missing some context from the
> > various previous iterations of this feature, but I'd like to throw
> > another use case into the mix to be considered around the design of
> > the sharing API.
> >
> > We are exploring a similar optimization for Android to reduce page
> > table overhead. In Android, we preload many ELF mappings in the Zygote
> > process to help application launch times. Since the Zygote model is
> > fork-but-no-exec, all applications inherit these mappings, which can
> > result in upwards of 200 MB of redundant page table overhead per
> > device.
>
> This can be solved by simply not using the Zygote model :p Or perhaps
> MADV_DONTNEED/straight up unmapping libraries you don't need in the child=
's
> side.

I think that's a separate topic, but that model is used on billions of
client devices :) The common runtime for apps and other core system
code is preloaded to significantly reduce app startup latencies.

>
> >
> > I believe that managing a pseudo-filesystem (msharefs) and mapping via
> > ioctl during process creation could introduce overhead that impacts
> > app startup latency. Ideally, child apps shouldn't be aware of this
> > sharing or need to manage the pseudo-filesystem on their end. To
> > achieve this "transparent" sharing, I would prefer Khalid's previous
> > API from his 2022 RFC [1]. By attaching the shared mm directly to the
> > file's address_space and exposing a MAP_SHARED_PT flag, child apps
> > could transparently inherit the shared page tables during fork().
>
> So, we've discussed this before. I initially liked this idea a lot more.
> However, there are a couple of problems here:
>
> 1) mshare (as in the mshare feature) isn't really aiming for transparent =
here.
> There is e.g a specific need to setup an mshare region, with a few files/=
anon
> there, and then later mprotect/munmap parts of the region - and have it a=
pply
> on every process that has it mapped. This is why we're aiming for differe=
nt
> system calls (not ioctls anymore), doing munmap(mshare_reg, 4096) is ambi=
guous
> as to whether you want to unmap the mshare VMA, or a VMA inside the mshar=
e mm.

Since we are interested in sharing text here, how does this play with
stuff like symbolization for call stacks? I believe this is another
reason where we might want to avoid mapping the pseudo mshare file
wrapper?

>
> 2) Sharing the page table at all (even worse so, Transparently(tm)) is a =
huge
> pain. TLB shootdown becomes much harder, and rmap as-is isn't suited to d=
eal
> with this case. The way things are going with mshare, the container mm wi=
ll
> have one single entry in rmap, and then actually doing the shootdown is a
> huuuuge pain (which, fwiw, will probably need a per-mshare TLB workaround=
),
> because you need to find out and shoot down _every_ mm that has these tab=
les

I agree the TLB shootdowns would be a pain. Perhaps, if there was a
concept of a shared ASID/PCID in the hardware, that would make things
less so ...

> mapped. And then, naturally, since you're sharing page tables, doing A/D =
bit
> collection on these becomes extremely useless - and that will naturally p=
ose
> problems to the reclaim process if you abuse it.

I think in the use case I described, it would mostly be sharing
MAP_PRIVATE stuff, and the access bit should still apply for global
reclaim. However, I agree it becomes difficult to reason especially if
you throw memcgs into the mix.

Thanks,
Kalesh

>
> 3) other misc problems that make it hard to work transparently (VMA align=
ment,
> levels which you may or may not want to share, you need to revisit most p=
age
> table walkers in the kernel to get a completely transparent feature, etc)
>
> >
> > Regarding David's and Matthew's discussion on VMA-modifying functions,
> > I would lean towards the standard VMA manipulating APIs should be
> > preferred over custom ioctls to preserve transparency for user-space.
> > Perhaps whether or not these modifications persist across all sharing
> > processes needs to be configurable? It seems that for database
> > workloads, having the updates reflected everywhere would be the
> > desired behavior. In the use case described for Android, we don't want
> > apps to be able to modify these shared ELF mappings. To handle this,
> > it's likely we would do something like mseal() the VMAs in the dynamic
> > loader before forking.
>
> mshare_mseal!
>
> >
> > Perhaps we could decouple the core sharing logic from the sharing API
> > itself? Since the sharing interface seems one of  the main areas where
> > we don't have a good consensus yet, perhaps we could land the core
> > sharing logic first. Keeping the core infrastructure generic would
>
> I think the core infrastructure is relatively generic (at least the
> small core mm modifications to get this to even work) already, but
> perhaps Anthony can comment on that.
>
> --
> Pedro
