Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2C43A2550
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517378; cv=pass; b=Z6JonFJDt09KMORjHsNuqjZkoT0eanhhlfORZUo7MYpEdEvtJCpxU9+ZD1Z7VrU3psS1jBcLBu5fpSn6eGa/Lshm7GZvKkUolzPWgLbA47VgjhI/s1vBvO6CZ4Cv93O4GniBVkhgcJUCBZAJkq3eg6DRwXofcCaNJTvale9qNu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517378; c=relaxed/simple;
	bh=5UXz52IyptNhzUMFPSnoxyMNWSpG1/iGAkBQWmQCJm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1rw3LkMdwgZb131ooJoTpCgGj34T7UIH6Tk4AHOyNnzuGOUtujwBIbrEptXrWHr/UlW+yFUKwN/msiMSFzy2C47D9aTDi4sOOJFUd9ifQQwATIPnT1UyTP7BBxJ/vsW2jSOY0biFv4a2OQLW9M12FiplHc3NvufnVTCzD+yul4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmbRRXAk; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmbRRXAk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490a76757e5so32208355e9.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780517375; cv=none;
        d=google.com; s=arc-20240605;
        b=D6C1xt2DJAxITsvz2cpz5pGp9tEgE55IlUVCCjwriC2DDBEiyzGM0NYttJllEBvF+1
         Gb/FzBC/s63n5zEwcpr97vSWgXxtCpFI7k85de2NUSmKHE8xWEDncA82ESzX8fhxPpd3
         Gq0rgoJlFhB/DRgfd7hZuw3P1l30CVrLxdVjEtt/GZkkLPyD8XpRj4K2cuYqwH9si5YO
         n83rOhmqSQNpS7a+gUv8gUkAasX2RsGU38q1k9dWomqaLOxVe5KEHFx25s5UXJTdLByT
         T1hShkkBk1fQ95u3qCN6hxxSABeFGtbpg4B+f+eXwfykL36LRIudxJV4L+4pa9P+hAh+
         tC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5UXz52IyptNhzUMFPSnoxyMNWSpG1/iGAkBQWmQCJm4=;
        fh=h9NrSvOYEw+bK82I+TYo3XoZCxJRvKjFHGtp5ZjZDT4=;
        b=DtPmmVriSZPixVyt7jFcD9YpXchfaRxSn+n7mT2VbCN9mRRAuPpa3qfRbk5K2KBZaI
         yG3rd+hA2+u9Nv1/vmm2lEtaobcSesHJq6ZZxWIBq4VxK3C3jIdJGF3Wflfi3td2h7ZU
         X2QNmqPb31HpcAYv+f9PO9mWN5IxUbAAnCjx9nOoIdYC0PbTXLIXu2yxq7oPWyV87vCw
         41dNGqvlZSJ0LwEW3h0u4CQY7iZM/GjdS74iEuk9LOd9WAFes0uq3+rmgd2BeoTZ3Xxo
         kHoPY34gb9BOItXk+/QB8fDALan9ZAEHCpoWRB5P4L4U08RP6ney+z4RcU4BhIYiobEj
         SRtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780517375; x=1781122175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UXz52IyptNhzUMFPSnoxyMNWSpG1/iGAkBQWmQCJm4=;
        b=LmbRRXAkLTpoAGa8VXIvvPfH001QiN4fuiLeThJg7k63qQA0y7PWwUQxbOA1ZFnQ0Y
         7IH32jFtvRb9nM2W2Qp3ZEQLw2FFmyCrp69D3XBwt9l2Sdm/dm8Mj94V+KIZVgSh+x8z
         Yz3eUr/73iqamvTzMT9kWTqV+c1IOYKzLgeFdwMZWdq7Xp+l6+M2Shx8LJsa848eQtkj
         JFEQ7s+kw9CzXqZpwqs2qca4M/8arA6dLRRGES5ZjB1XAPdEoZ3GyaGL4JwtazRPVwNb
         Fc6DLLASWeEBDCbpZZ3OinB8Rnno8So4+VIyilrmODAPX3n7I8tO2ALCBgh513wY5otu
         bDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780517375; x=1781122175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UXz52IyptNhzUMFPSnoxyMNWSpG1/iGAkBQWmQCJm4=;
        b=VJtQWIx962yb9JVyRLc3E3Gb7JZVKf+Bg9CWknCgphMk9Fx3jzt/M5nQOOcwwwXzZ7
         dq7USf+8WVDq//J8+/mbg2k1pZaUROY1I62/0dMGCmty1sORgm5hqyicQczKLOfnhD0s
         /GaZ+CYj9EvCXNH5dBT6o13ylSC6ti3U/iz8exdVrUG/hnPrwvskQuhWx1F4Iy2UUMWS
         LGUSaEL4KQ3RwD9ovxWIrPt8Ed+sJwLbCXlnrIgG3VrSz/Q0EmY6ZoSSQO06yoZ7gvJE
         LAbXwfZ5G3yi2H6ZnJ+iikX8/edO4B8Z+/Xe0v1ycKGHVYjyQjie8tsnA0eeeq0kpbat
         ElEw==
X-Forwarded-Encrypted: i=1; AFNElJ++GQZNMUWpvEetiuUfoJjEth+a+nLNP53s5O/yO7yvU7mcZPG9kwHjWIMHy7znWdqP4lGyoCu79jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyugNmhzjVBuc55e6juSO0lRxCXtEvXEI73lVdAMP7ah8sZYWNx
	7ikYs4zjj+ZEiKA9oqtijnz3FKocAjqZgYorvCUOtEy7zCMLGbmoAWxavg5BwiybG6drSZDoitr
	/3dMcLpvr6XDNpyWXbaXQXbvAK/MqPNw=
X-Gm-Gg: Acq92OFSowCR8tyJH5FvNHJIhvf/VWqVx053sOcW32TPKs47UffhE2+1ZxdZYPPZX2a
	K9ituh3lQ2+rNQmO5pY2quRL4SD5EjoIftzQrgFVIULcA9IBj71X3Ra9/pu+3y9qZOAhHh/Fvmf
	qtz1VdzvFiryjts/NaSohy9GcuEm0EvNgJXHRngFylXZmv6y9v2LFm+zlnuNmUhPg7DZ5wI75TO
	pjYpL/3zs7C2excgSA4f7bhXh/ZLMBgAe812rN/pqMLIIwGg0FDO5S/t5skAWZtwJxMe4YN774c
	zwrCUIRRw6eFnPgpcC2k+ZtnpO7BAQkFnAZP24xJikjkfcjXOQ==
X-Received: by 2002:a05:600c:4fcc:b0:490:59cc:999f with SMTP id
 5b1f17b1804b1-490b5ea1016mr84902405e9.4.1780517375148; Wed, 03 Jun 2026
 13:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528212955.1912856-1-nphamcs@gmail.com> <ah-A2gQ0GPgerXop@google.com>
 <CAKEwX=MWX9KkSFAoN4xEMg3b+gZUN9=yd7rirAWG5NOBf26eAg@mail.gmail.com>
 <aiB2sHqxcBAJrTkP@google.com> <CAKEwX=P95D7wNpWhEAXQpeNPM6eQa2mEZE8Srzfpct=-=Q40tg@mail.gmail.com>
 <CAO9r8zP+PkgRzXJcFv+3i2pKFQdLt78Ax1s1DY0qNaiUo7ySqA@mail.gmail.com>
In-Reply-To: <CAO9r8zP+PkgRzXJcFv+3i2pKFQdLt78Ax1s1DY0qNaiUo7ySqA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 3 Jun 2026 13:09:23 -0700
X-Gm-Features: AVHnY4JWxeOICXM6CH91NR0yRjpkfQjVY9j65WnUJqukjOXglYl_lhKm7GRZ5q4
Message-ID: <CAKEwX=M7zH=+83xeOnZcrHKt4jCo6hCB3qVLqWpfLquMcRbyUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] mm, swap: Virtual Swap Space (Swap Table Edition)
To: Yosry Ahmed <yosry@kernel.org>
Cc: kasong@tencent.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	apopple@nvidia.com, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, bhe@redhat.com, byungchul@sk.com, 
	cgroups@vger.kernel.org, chengming.zhou@linux.dev, chrisl@kernel.org, 
	corbet@lwn.net, david@kernel.org, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jannh@google.com, 
	joshua.hahnjy@gmail.com, lance.yang@linux.dev, lenb@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, matthew.brost@intel.com, 
	mhocko@suse.com, muchun.song@linux.dev, npache@redhat.com, pavel@kernel.org, 
	peterx@redhat.com, peterz@infradead.org, pfalcato@suse.de, rafael@kernel.org, 
	rakie.kim@sk.com, roman.gushchin@linux.dev, rppt@kernel.org, 
	ryan.roberts@arm.com, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	surenb@google.com, tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com, haowenchao22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 12:35=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> > > > > All that being said, perhaps I am too out of touch with the code =
to
> > > > > realize it's simply not possible.
> > > > >
> > > > > Honestly, if the main reason we can't have a single swap table fo=
r vswap
> > > > > is saving 8 bytes on the reverse mapping, it sounds like a weak-i=
sh
> > > > > argument, even if we can't optimize the reverse mapping away. But=
 maybe
> > > > > I am also out of touch with RAM prices :)
> > > >
> > > > In terms of the space overhead I do agree, FWIW :)
> > > >
> > > > I think the other concern is the indirection overhead with going
> > > > through the xarray for every swap operation, hence the per-CPU vswa=
p
> > > > cluster lookup caching idea:
> > > >
> > > > https://lore.kernel.org/all/20260505153854.1612033-23-nphamcs@gmail=
.com/
> > >
> > > Right, but we should already avoid the xarray with the swap table
> > > design, right? We just have one swap table pointing to another
> > > essentially?
> >
> > Hmmm, I don't quite follow your suggestion here.
> >
> > For normal swap devices, we organize the space into clusters, and
> > maintain them in various lists (free, nonfull, full etc.). The only
> > difference with a vswap device is we do not have a free list, and have
> > the clusters themselves dynamically allocated.
> >
> > If we're using vswap, we will incur the xarray overhead. There's no
> > avoiding that if we want a dynamic indirection layer. We can of course
> > revisit this data structure design later.
> >
> > So yes, it will be one swap table (vswap cluster) pointing to another
> > swap table (pswap cluster). But to get to the first swap table, you
> > will have to go through xarray still.
>
> Why the xarray? Don't page tables (and shmem page cache) just point
> directly to the vswap entry the same way they point to swap entries
> today?
>
> *looks at the code*
>
> Oh, it's to find the actual cluster because the vswap file can be
> sparse? Hmm yeah I guess we can revisit the data structure here later,

Less sparsity, and more dynamicity :) It might be dense for all we
know - we just don't really know (or want to figure out) the size
statically.

> but IIRC xarrays aren't particularly good for sparse data. Maybe it's
> usually not sprase in practice.
>
> Maybe a maple tree? :)

Maybe :)

>
> > > > If folks like it, what I can do is have CONFIG_ZSWAP depends on
> > > > CONFIG_VSWAP, removes all the non-vswap logic, and call it a day? :=
)
> > > > Then, on the swap allocation side, if vswap allocation fail and zsw=
ap
> > > > writeback is disabled, we can error out early.
> > >
> > > Hmm maybe we can keep it around for now and do that after vswap
> > > stabilizes? It ultimately depend on how much complexity we maintain b=
y
> > > allowing both.
> > >
> > > I think another problem is 32-bit, technically zswap can be used on
> > > 32-bit now, right? So vswap not supporitng 32-bit is a problem.
> >
> > Ah shoot I forgot about that. Hmmm.
> >
> > It's not impossible to make vswap support 32-bit. I did that for v6
> > after all. It just needs extra fields because we have fewer bits to
> > leverage in pointers etc., complicating the logic a bit. Follow-up
> > work? :)
>
> Yeah we can do that, but it's a blocker for zswap only using vswap.

Yeah we can table that. FWIW, if you enable vswap, then zswap should
go through vswap already. It's just code complexity (hopefully for a
short while).

>
> > > General question (for both zswap and general swap code), would a boot
> > > param make implementation simpler? Right now we seem to key off the s=
wap
> > > device having the "vswap" flag, would it help if it was a runtime
> > > constant?
> >
> > Hmmm, even if it's a runtime constant, both branches still have to be
> > there, no? Does the boot param simplify it somehow?
>
> Maybe it doesn't simplify the code, but if the branching causes
> performance overhead we can use static keys. I guess we can still use
> static keys per-swapfile, but it would be more complicated.
>
> Anyway, not super important now.

Ahhh I see what you mean. Yeah we can optimize this later.
