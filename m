Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553636605D
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772060044; cv=pass; b=imS0kevB71gB3kBM/gjZH3yz6fvWwSQMa21Mbw6tmovTb7dZfq8ohv6e6z+Dd+e0osT8thq2bKQ2KQnLEZN4e5jRDuBqkPZefEodi+s85W/Lh2l9FI3cKZ0gPn9cz4p8Y8YMIPTr53BtacH98iiXUr75TKNZtQXiIk4WZa+6b48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772060044; c=relaxed/simple;
	bh=AA8Dha/bfnPZLgD3DchzKVXjebkJkUtPW4e/jFBhSi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lji0K6q1CM/JGypynhPeopC8R1yj1RemYRRWY66anfRhQp/44063ZYR8xSSQ+RIfRc/gKOPqqGweKSprOIALAXo3UgDSthMovWwPzOaIimgNHF4pCzfsy2/fLddKK79JXTJaq9cFc+666ztXe93DAVWP4iYyGfIppK8D1a2u9BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ad1lyq7t; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ad1lyq7t"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ada9e4ea32so15065ad.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 14:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772060042; cv=none;
        d=google.com; s=arc-20240605;
        b=DaglylB8P0ha+emefxOdd+U2jTYKSMtvvB+mWpp1xJLT0rCs5RGGMnD0O6tuVw3oTf
         G1vn0eTkXLA20DilDWHahStWUOHmCm/R6dYOSwtIcGK94JTFjZWLqtwX6mXhKKKQdUn3
         M+3o9MjIh5YrMHClw197E0Il1GnhlRDPS4ojSXfnQa8OQfmB9Rk2YgG9Z8qYG41tHV8n
         z/Bl1WDWxK6Y1rBYpwaer7hO4CRgGhUnCRDe8bLqnRTD9dII6l6iD5K+dGxlfTAhXEJh
         AZeaDZG0BJvPVpOhNee07hz+W+h8dLH1NRP1sSvLyKA69InWb2+yxmg28P/BL4pcaxM1
         vZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4HuRDvA6p5zItbneJew7P4gaYb7aavWFbfaGOQjNc2g=;
        fh=n+2cQmkYZw9jsabaQVZyn8QSBvja0P+AnYcqpUk3aoY=;
        b=fz+YCC0NpUMG/tgQIIB+5Stx4jB/64cinBN+/QdGMKagccu+DeI5tbPxjAn2V8I1pD
         C9LEZt8vteAjcfM+TmoFzEixQ7IdG6k8jydg0it9fQc7bS9eBhSlTKJ8K5kgltOknKGk
         GITZjtRKriWVyNrlvfsZLj5wsAd/7JiO+fviKaA4OxAWpGOOubjrXtNgtoI5PbjEQNtU
         28z4UIhiDmlc2q3h2rq+l2baGT1H6TLgYjZhPlN/T3oXuK0Fv+RIBhnRQJOngmZc9FlI
         fto7eTiqJqEjOF1o0UU6UeeOk6eDgKHs+Z5dnP6Rhr5ejUQl+Y/lTGL7wG49jOTcdph6
         sh0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772060042; x=1772664842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HuRDvA6p5zItbneJew7P4gaYb7aavWFbfaGOQjNc2g=;
        b=Ad1lyq7tHRJvYjGqgI53C/sVIsbHOI5KG9HGj1KFHlj9xPBe9g/q66joirRqE1RYA8
         bxlr8hmZD/dvBaD7eIaieclRNk/Em38lbIPT5VYToeACdbitTwq/gA/G3o4WfHX5BXoj
         2x3STKjaK80cDPcpFyDFdOSpHxpiIlRv9YTz3ciAj1HEzd/P13ux4V8wTLryBk0b1HOi
         69tD1sE8N8fuwlQN3u8mRTS7UiQ03CbrITzl3uYy7dzju8Cf8Mr858Y1ALllQA/oDGFe
         ePZIjbR6qmO8hgGPgIucqMz9DYpbxZ2KlacO96RqtrLQvXKwP9tpFyA3POtxb18487Zy
         oMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060042; x=1772664842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4HuRDvA6p5zItbneJew7P4gaYb7aavWFbfaGOQjNc2g=;
        b=IT0By9Wfk0DdYyuPeF7uVtAHn0+1dwUp7FmhoRLX0Oq6k/ITBLwdsCfCQ/itEcGys/
         fcIkUpNIOKblYC+0mpoZcLARDkbWrLTbL+p5I5/a4tV/vd/TljAyvRewYO4foeGZgQQr
         PMYZA9KWgFCbydU/RguNjaKGc4xtO34RoazJmwSzKlkjZYqXuySsI22pZBk0glo+lr5h
         m+6N++QlnT/EVYEkoLW5V6oG4apX6WcyLoPBPubI5QMohGOoazmuLuwP5doMdkMisHZx
         k1gbyhfnvjlhiEREXFc354Wl2Z+rg3BsKuSGGuKXDLtugqCQfEPQTTQVlxUuqL2O9+jA
         XO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7na4YM88uOfCMFd2T0ACkJKoh6egBywecQOkWcdAh4eO8kpFBLd4/RqIlBnTAskQZrfSBcjpUPAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97SpL4J1WDst8guJD7WTEqRLIwIjzFZ8ZAHSYNY9jwsKyL/ia
	+d8JNtHN+7lOys84gX/70FtDHT9qj2hv7EwBlsfxAXZG8osassPd39SKW6xmuqr3wdjCkCXYpB+
	cN6sf5xJ5+AV9tyCgczkq7G4/MLT6uLxVA97+rC0o
X-Gm-Gg: ATEYQzxwq654AN+b9jYVlgFinS65SPwttJfRPmvDphb3hNmymNK3Vj6ljYcsp1PIUqX
	RrS5X6Iudes+l8fB2hK2xhxZGbhwYRM3f40vE4OuhbL245TgAWHIx9OpOFwCrsDFcg7oGR6uvB6
	TFysKBmjbJIY4SiB7+PhmK/q+NMAzYrysY4jICqFebgR4OYkghSKWNViWzUa+G32kvqsXN5axHK
	SBVz0GLfOtGKjxZ1+2FTcI8ZsiYoEJ/xUlN9ZRiH0L5SYl56l3S3suNTbwMPXvZ9aFpB+y5UyvA
	ML8KVaiO72lSv0AqDdBhfJMSMAjZIjT/0xUwjw==
X-Received: by 2002:a17:903:8c4:b0:2a8:ffed:4663 with SMTP id
 d9443c01a7336-2adf7738436mr799085ad.12.1772060041893; Wed, 25 Feb 2026
 14:54:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820010415.699353-1-anthony.yznaga@oracle.com>
 <CAC_TJvcaJdEzK8n9BK0qgEXdzjzXtbA_Zk-ybfmG8kjNExVCzw@mail.gmail.com>
 <fqabaahjjlmoc2xh4cwh4ykbqyu3rnzvjw5epxi5wwpmgqth7f@d3mqpjozwmo4>
 <CAC_TJvdRsfzYohiKW=82N8Ofi5V26rX1GS0M8HeaX6CEsgc+PA@mail.gmail.com> <7302e25b-dfcb-4117-85f9-870632999dc3@oracle.com>
In-Reply-To: <7302e25b-dfcb-4117-85f9-870632999dc3@oracle.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 25 Feb 2026 14:53:49 -0800
X-Gm-Features: AaiRm5115WEriTEwyOL6pAVEQGUSdPho0h6nJ0kCy4aKIpi-RiI2rNOQ4qeMtvg
Message-ID: <CAC_TJvc+Ld19MrqQbTLkLXbLe3D8nYNP2DkD0knv+u7mjRC++A@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] Add support for shared PTEs across processes
To: anthony.yznaga@oracle.com, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	andreyknvl@gmail.com, arnd@arndb.de, bp@alien8.de, brauner@kernel.org, 
	bsegall@google.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	david@redhat.com, dietmar.eggemann@arm.com, ebiederm@xmission.com, 
	hpa@zytor.com, jakub.wartak@mailbox.org, jannh@google.com, 
	juri.lelli@redhat.com, khalid@kernel.org, liam.howlett@oracle.com, 
	linyongting@bytedance.com, lorenzo.stoakes@oracle.com, luto@kernel.org, 
	markhemm@googlemail.com, maz@kernel.org, mhiramat@kernel.org, mgorman@suse.de, 
	mhocko@suse.com, mingo@redhat.com, muchun.song@linux.dev, neilb@suse.de, 
	osalvador@suse.de, pcc@google.com, peterz@infradead.org, rostedt@goodmis.org, 
	rppt@kernel.org, shakeel.butt@linux.dev, surenb@google.com, 
	tglx@linutronix.de, vasily.averin@linux.dev, vbabka@suse.cz, 
	vincent.guittot@linaro.org, viro@zeniv.linux.org.uk, vschneid@redhat.com, 
	willy@infradead.org, x86@kernel.org, xhao@linux.alibaba.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, android-mm <android-mm@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Isaac Manjarres <isaacmanjarres@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 11:59=E2=80=AFAM <anthony.yznaga@oracle.com> wrote:
>
>
> On 2/23/26 9:43 AM, Kalesh Singh wrote:
> > On Sat, Feb 21, 2026 at 4:40=E2=80=AFAM Pedro Falcato <pfalcato@suse.de=
> wrote:
> >> On Fri, Feb 20, 2026 at 01:35:58PM -0800, Kalesh Singh wrote:
> >>> On Tue, Aug 19, 2025 at 6:57=E2=80=AFPM Anthony Yznaga
> >>> <anthony.yznaga@oracle.com> wrote:
> >>>> Memory pages shared between processes require page table entries
> >>>> (PTEs) for each process. Each of these PTEs consume some of
> >>>> the memory and as long as the number of mappings being maintained
> >>>> is small enough, this space consumed by page tables is not
> >>>> objectionable. When very few memory pages are shared between
> >>>> processes, the number of PTEs to maintain is mostly constrained by
> >>>> the number of pages of memory on the system. As the number of shared
> >>>> pages and the number of times pages are shared goes up, amount of
> >>>> memory consumed by page tables starts to become significant. This
> >>>> issue does not apply to threads. Any number of threads can share the
> >>>> same pages inside a process while sharing the same PTEs. Extending
> >>>> this same model to sharing pages across processes can eliminate this
> >>>> issue for sharing across processes as well.
> >>>>
> >>>> <snip>
> >>> Hi Anthony,
> >>>
> >>> Thanks for continuing to push this forward, and apologies for joining
> >>> this discussion late. I am likely missing some context from the
> >>> various previous iterations of this feature, but I'd like to throw
> >>> another use case into the mix to be considered around the design of
> >>> the sharing API.
> >>>
> >>> We are exploring a similar optimization for Android to reduce page
> >>> table overhead. In Android, we preload many ELF mappings in the Zygot=
e
> >>> process to help application launch times. Since the Zygote model is
> >>> fork-but-no-exec, all applications inherit these mappings, which can
> >>> result in upwards of 200 MB of redundant page table overhead per
> >>> device.
> >> This can be solved by simply not using the Zygote model :p Or perhaps
> >> MADV_DONTNEED/straight up unmapping libraries you don't need in the ch=
ild's
> >> side.
> > I think that's a separate topic, but that model is used on billions of
> > client devices :) The common runtime for apps and other core system
> > code is preloaded to significantly reduce app startup latencies.
> >
> >>> I believe that managing a pseudo-filesystem (msharefs) and mapping vi=
a
> >>> ioctl during process creation could introduce overhead that impacts
> >>> app startup latency. Ideally, child apps shouldn't be aware of this
> >>> sharing or need to manage the pseudo-filesystem on their end. To
> >>> achieve this "transparent" sharing, I would prefer Khalid's previous
> >>> API from his 2022 RFC [1]. By attaching the shared mm directly to the
> >>> file's address_space and exposing a MAP_SHARED_PT flag, child apps
> >>> could transparently inherit the shared page tables during fork().
> >> So, we've discussed this before. I initially liked this idea a lot mor=
e.
> >> However, there are a couple of problems here:
> >>
> >> 1) mshare (as in the mshare feature) isn't really aiming for transpare=
nt here.
> >> There is e.g a specific need to setup an mshare region, with a few fil=
es/anon
> >> there, and then later mprotect/munmap parts of the region - and have i=
t apply
> >> on every process that has it mapped. This is why we're aiming for diff=
erent
> >> system calls (not ioctls anymore), doing munmap(mshare_reg, 4096) is a=
mbiguous
> >> as to whether you want to unmap the mshare VMA, or a VMA inside the ms=
hare mm.
> > Since we are interested in sharing text here, how does this play with
> > stuff like symbolization for call stacks? I believe this is another
> > reason where we might want to avoid mapping the pseudo mshare file
> > wrapper?
>
> I haven't explored shared text, yet. There may be dragons there.
>
>
> >
> >> 2) Sharing the page table at all (even worse so, Transparently(tm)) is=
 a huge
> >> pain. TLB shootdown becomes much harder, and rmap as-is isn't suited t=
o deal
> >> with this case. The way things are going with mshare, the container mm=
 will
> >> have one single entry in rmap, and then actually doing the shootdown i=
s a
> >> huuuuge pain (which, fwiw, will probably need a per-mshare TLB workaro=
und),
> >> because you need to find out and shoot down _every_ mm that has these =
tables
> > I agree the TLB shootdowns would be a pain. Perhaps, if there was a
> > concept of a shared ASID/PCID in the hardware, that would make things
> > less so ...
>
> That would certainly help. sparc64 has a secondary context, but that
> doesn't do us any good here. :-)
>
>
> >
> >> mapped. And then, naturally, since you're sharing page tables, doing A=
/D bit
> >> collection on these becomes extremely useless - and that will naturall=
y pose
> >> problems to the reclaim process if you abuse it.
> > I think in the use case I described, it would mostly be sharing
> > MAP_PRIVATE stuff, and the access bit should still apply for global
> > reclaim. However, I agree it becomes difficult to reason especially if
> > you throw memcgs into the mix.
>
> mshare won't support mapping objects in it with MAP_PRIVATE. Sharing
> PTEs to memory that can be COW'd is problematic. If it's something that
> can be adapted to use MAP_SHARED then maybe things can work.

I can see how mapping .text and .rodata as MAP_SHARED could
technically work, assuming the sharing process strictly mseals them to
guarantee they remain immutable. However, RELRO (.data.rel.ro) is a
different story. It must initially be mapped MAP_PRIVATE and writable
so that the dynamic linker can resolve relocations. Because these
modified pages cannot be written back to the backing file, they become
private anonymous pages.

If there was a way to allow an initially RW MAP_PRIVATE mapping to
resolve its relocations, be write-protected, mseal'd, and then have
its page tables shared, that would solve the RELRO issue. In the
Android Zygote model, this works perfectly because relocations resolve
before forking, meaning the resolutions are identical for all
children.

But how would we express this in the msharefs model? Transitioning a
post-CoW MAP_PRIVATE VMA into a shared page table structure seems
fundamentally at odds with a strictly MAP_SHARED file-backed
pseudo-filesystem approach.

>
> As for memcgs, the current idea is to have an owner associated with an
> mshare region. Currently this is the process that creates the region.
> Mappings in an mshare region will be evaluated against the mem cgroup
> the owner is a part of.

I'd also like to think a bit about what happens to other standard
memory metrics. Should accounting that actively walks the page tables
(like /proc/pid/smaps) still work correctly and see the mappings?

What happens with the counter-based metrics tied directly to the
mm_struct rss stats?

Since msharefs manages its own detached mm_struct, should we include
those RSS counts across all sharing processes when reporting in
/proc/*/status? Or will we need to introduce a new UAPI to
independently expose and understand the RSS of each msharefs
mm_struct?

Thanks,
Kalesh

>
> Thanks,
> Anthony
>
>
> >
> > Thanks,
> > Kalesh
> >
> >> 3) other misc problems that make it hard to work transparently (VMA al=
ignment,
> >> levels which you may or may not want to share, you need to revisit mos=
t page
> >> table walkers in the kernel to get a completely transparent feature, e=
tc)
> >>
> >>> Regarding David's and Matthew's discussion on VMA-modifying functions=
,
> >>> I would lean towards the standard VMA manipulating APIs should be
> >>> preferred over custom ioctls to preserve transparency for user-space.
> >>> Perhaps whether or not these modifications persist across all sharing
> >>> processes needs to be configurable? It seems that for database
> >>> workloads, having the updates reflected everywhere would be the
> >>> desired behavior. In the use case described for Android, we don't wan=
t
> >>> apps to be able to modify these shared ELF mappings. To handle this,
> >>> it's likely we would do something like mseal() the VMAs in the dynami=
c
> >>> loader before forking.
> >> mshare_mseal!
> >>
> >>> Perhaps we could decouple the core sharing logic from the sharing API
> >>> itself? Since the sharing interface seems one of  the main areas wher=
e
> >>> we don't have a good consensus yet, perhaps we could land the core
> >>> sharing logic first. Keeping the core infrastructure generic would
> >> I think the core infrastructure is relatively generic (at least the
> >> small core mm modifications to get this to even work) already, but
> >> perhaps Anthony can comment on that.
> >>
> >> --
> >> Pedro
