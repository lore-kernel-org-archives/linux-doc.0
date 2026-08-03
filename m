Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D93AEF2E
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747156; cv=pass; b=dbnQ9SjRjt9lyfUhdBIfpx/rgGTgGZLZyLJaGG7HMVShjirp1pKMn/cIrNgp51MhIlbK1tGLDRJr1HUavhY8f/K14XLAZm5p4alULRN7fO3b41ym4VOS+eeyc6eMX3jjR9rVgMgy+HPLQ39hYG5RpAGWcjYgoGosJnpqIf2IikE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747156; c=relaxed/simple;
	bh=gqu0R7zR0Hsq4p6SL2JusMkem4aahjhzej3fzwamL0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQQLPx9An7F1FFm/ncbumtuOOUmK7VCeO3orcNVkQTVsukECwTBZi/+ZxLz8cU1EZW3+dWCWPOKmIN2r4Wn+FvKbNIl+9RGHuaKwFQ1vtk4/gX9SXKZka+Lhdvn35kM2Nqj35o4MPSeO3V2Vx+fQV6Hi3sDwO06SO87VdTKbNiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXMHjZVx; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXMHjZVx"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso3676127a12.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 01:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785747151; cv=none;
        d=google.com; s=arc-20260327;
        b=JRk1+VO4ndIf3hVTJ7zs3Ji9W9beQ7xZ7AJVlBbbMUdlaNUJDTHqB6iQBRXj5MIuay
         YVCE30w9/mdt0Bm4fG0Y6TIHAJbjYT1NWAysytDldmecUBFCkrCfI2zUt9y6m/s/oDDo
         Yt0nMPdYtmivCd9giMxl1ho2aV411OaBIR/ftsUgKrGBD0HJxD1iXex2y6i4sD/xtiwG
         M3unYH8mS1mIoGdJzuiFe8aewTFd56GY4+3q4OqPsraOhgWNQbNzmOfztd3DyhrqTPee
         KxiTZh1+nN0a5rM5bU/vz83F27KvWD3hMTE2iugK2myTLByWGgleIOlbfwVHtBUXeQEy
         Mwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gqu0R7zR0Hsq4p6SL2JusMkem4aahjhzej3fzwamL0U=;
        fh=tJrK2gA0zBGMWRp7xuTjGjJA5W0myZXKZh/64KnsbUQ=;
        b=RVmRexHaHFJasbXRmNLmy7x7SCcJaC4gFq1yjTLTrhJvmS9vvXs+SnfHkArPVLHv22
         JrEgoflJVKbTidfNcopBcQWLFD4/joRgn0OgyY5CtxkQ7vIOXi2lpmtrBv+3M/jKHxzA
         L+1mzV5EOI3TXjda19AgTPztuYa9zQidI83LIEHV50Sd4iFwulgm0bQ4tw9GywEFJ1q2
         viKhBGZ/rP5i+bU0lCdle0Xr89ljuF4m0mSMe4cEzTZh1c0goCR6G3UC+ogqPThcbedb
         TvP0HeZw06MJk+ISP6q0YjpdeJ+6Th39BdHyHAyJesb1xwf8C/QXBZQvd2r5WPKM8GUP
         RPrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785747151; x=1786351951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gqu0R7zR0Hsq4p6SL2JusMkem4aahjhzej3fzwamL0U=;
        b=WXMHjZVx+Q1iPDarw8QxQV37pjni1PoKZsf4p6ReCQTYGgoV4bAjcQYddwaCRuGnPJ
         kAmt1LJzK6WxgKmTsqOuXnt4PVMRaR7JN36jqZ2wYjzozl5udlxgSuQXB+DFdNg92s6u
         N1pAg0I8MNGpu+MTRwLYD1qL2K+u76YOxJWsvm6IgHiac0k1ORj1+I6LYnjTkYR2efeX
         USKXE+rJIGo4rWEtnV7LMHQg2+Kn503QCZNjSGDjjdNL0Hq3RAEGEuMGK1CI9eG/hJxE
         3uB8bZDss/BlcqrxjCrfillNeVfLSXfaQW+TWQbGkqUiSatQ+R5u5YXm/oMsxcutZe90
         VEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747151; x=1786351951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqu0R7zR0Hsq4p6SL2JusMkem4aahjhzej3fzwamL0U=;
        b=KS9YptKtG0gd61xiA6qh5ma1td2SYnzhNuqisZqsnzHQsHik5et9A7sTzPXnorHQxU
         nEzt6Httr3PT6r4Xd542hySsuY4G9Cat6sl5qOmjaSYEqhPnwtSb6zfJNRO3CAhUN3ma
         PVFTWBDm+lN8y6Lh/IPZ7Nn5K2DwRrCXU0bRXA6szjOYfbmZLaq1fziCQ7kdWV7KYLEy
         sRmqE1AbRWuqFbgxEzznejHUDjkwnHUcki4nNJkKGOk2SOwDxvvgNGtUg31M8gVzTDyU
         Yd/Bh9Z5E9wLPQ1IsWf6D6lba5Y8uqASNjl881PUJ1NdnfxkgjdWW74E4piT5RBpRUI6
         T/PA==
X-Forwarded-Encrypted: i=1; AHgh+RqrDy0JatzNG3jEDM3F3+YJEMw0hjcmD0ew62Ee3ESb6NvVvlSdDLL1dtUksNsJlHgK+HqI7qOhYC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnjdggm2tgQ1v3EDCZp4rx8KgqjmKbuYRFa1uXNbPZh+3rfky
	6ioWOu22z/codEcqQsCUZVVhbLqx02s74qhPOgsfF05T1BLv5rgUdXjqR+Sf3L4PjVnkgH9yi/u
	igO8k9n7moMUp5aipSXnfk2y+KHD8Oks=
X-Gm-Gg: AR+sD119XL9yFU8vKrYqcNuM2hURfjE6ufGqwN8BlJbFz+3HM5XAwM3FpN55k7sGjdn
	vgQByLNK3kSeR3yzs85DJs85M1uhY8BpxkLS7xdTlEjM0tz4zOiwasAAvVW9s7cQgUB67ijor46
	WSHOpsIAHKU0RbcZaX1qGE4BczSXOs4ImPBXrL2H1HbfiNLZzLZBLhXrerIJhCRWoClzAZddE/v
	7j3vAOUBv8r/zOLFS3PsIpYcckE54rljnnDkfaNOYtz9ynG/hPQafrozhkznl12IKBcarP2cFoq
	YxtdVcEHaqGd54+D7D8CxPJC8SvJt2a5naMoUDg2ZWWELQ==
X-Received: by 2002:a17:906:6296:b0:c15:b67b:523e with SMTP id
 a640c23a62f3a-c1fe7ef886dmr753138466b.19.1785747151231; Mon, 03 Aug 2026
 01:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803022730.75731-1-john@jagalactic.com> <0100019fc572ca94-ec363dd7-3a77-484b-b4b7-f2503a0931a6-000000@email.amazonses.com>
In-Reply-To: <0100019fc572ca94-ec363dd7-3a77-484b-b4b7-f2503a0931a6-000000@email.amazonses.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 3 Aug 2026 10:52:19 +0200
X-Gm-Features: AUfX_myBTyPHpMQ4dIR86ct8epUOnbu5tszSaYGQfG-jc8Xn7HqO1PF8uWIUaCE
Message-ID: <CAOQ4uxhpkP7FsjaqqVO2aDSKCJ9yc3WKms6dncqnDuwGxqthng@mail.gmail.com>
Subject: Re: [PATCH V12 00/12] famfs: the Fabric-Attached Memory File System (standalone)
To: John Groves <john@jagalactic.com>
Cc: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ira Weiny <iweiny@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Haren Myneni <haren@linux.ibm.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Gabriel Whigham <gabewhigham@gmail.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 4:27=E2=80=AFAM John Groves <john@jagalactic.com> wr=
ote:
>
> From: John Groves <john@groves.net>
>
> This patch series introduces famfs as a standalone file system, as a pivo=
t
> back from fuse/libfuse, for which the porting effort took close to a year=
, but
> then the review effort started with almost a yearlong delay, and then got
> messy :D [3].
>
> However, after years of maintaining famfs in both forms (standalone and f=
use -
> the famfs user space works with both) I think famfs makes more sense as a
> standalone file system - and some influential maintainers have privately
> expressed that opinion to me.

Hi John,

The decision about standalone famfs is left to vfs maintainers.
I am only going to chime in for the fact checks.

Generally speaking, I find your summary of the famfs odyssey very thorough
and mostly accurate, apart from the few bits I will comment on below.

You do bring some valid points that are worth considering, but I would like
the facts to be laid out correctly for the vfs maintainers when approaching=
 to
consider standalone famfs.

>
> The most important thing to know about famfs is that it CANNOT be used as=
 a
> general purpose file system. It is for enabling file-based byte-level acc=
ess
> (including direct mmap) to very large (e.g. 100TB) shared/disaggregated
> memory appliances - which have become available during this long process,
> and which are in need of Linux support.
>
> So famfs cannot be used by anybody who doesn't know why they need it; Mak=
ing
> famfs standalone means it can't affect users who don't use it. And my sup=
er-
> mega-corp employer (Micron), as well as other memory companies, need it.
> We do not intend to abandon it, but imagine if we did: fs/famfs/ should b=
e
> removed if the memory companies can't be bothered to maintain it.

It does not work this way.
When vfs maintainers accept standalone famfs they accept the burden of
maintaining it whenever vfs internal APIs change even if the filesystem was
abandoned by the mega-corps.
That is the code of the push back for adding new filesystems.
Removing the fs and breaking deployed systems is not an option for the vfs
maintainers.

>
> This code base has been in active CI and used globally by early adopters =
and
> testers of disaggregated memory. I believe it is solid.
>
> History (skip if you lived it like I did :D)
>
> Famfs was introduced at LPC 2023 and LSFMM 2024 [1] as a standalone file
> system. The fuse odyssey started at LSFMM 24, but I think it's time to
> bring that to a close. The first fuse/libfuse patches came out in April
> 2025 [2] - adding a substantial amount of complexity to the famfs user sp=
ace,
> and controversial complexity to fuse [3].

This alleged complexity to fuse is attributed to the BPF idea that was shot=
 down
pretty quickly. It is not on the table right now, and representing
fuse maintainers,
I don't think that any of us perceive famfs as adding complexity to fuse.

On the contrary, the sentiment in the review of v11 is that the bits
added to fuse
for famfs are possibly useful for other fuse passthrough use cases.

>
> The fuse community was uncomfortable with the new metadata and fuse messa=
ge
> formats that famfs needs, going so far as to suggest that famfs use a BPF
> program as a vma fault handler [3] to avoid the need to pass famfs file
> metadata via fuse messages - an idea which, to my relief, was definitivel=
y
> shot down at LSFMM 2026 [4].

Again, bringing up the brief BPF design detour is irrelevant to the current
state of affairs and this argument appears over and over in your proposal.

>
> In that session, I was preparing to make the pivot-to-standalone argument=
,
> and there were others in the room who support that - but Miklos stated th=
at
> he was not opposed to merging famfs as it stands [4], leading me to back =
off
> of the standalone pivot at the time.
>
> However, 1) that is not how the recent patch discussions have been going =
[5],
> and 2) I have (not solely on that basis) come to the conclusion that famf=
s
> makes more sense as a standalone entity. In v11 [5] I dropped the
> controversial famfs interleaved extent (exploding fmaps from well under a
> page to megabytes),

It wasn't an ask from fuse maintainers to cripple famfs.
In fact, Miklos has posted a POC patch [7] for striping, which you
did not respond to at all.

> and there is still a push for adding an intermediate
> virtual backing dev layer that famfs does not need and can't really live
> with. I could go on...

I would really like to hear more about "can't really live with"
because Miklos' patch looks to me like a logic equivalent to standalone
famfs interleaved extent, just a different UAPI, using the abstraction
of virtual backing dev...

>
> My argument
>
> Can we make famfs work in fuse? Yes, if we can agree some things that hav=
e
> been quite challenging to agree on. Should we? I think not.
>
> I think famfs adds complexity to fuse that will not likely see constructi=
ve
> re-use.

As I wrote, this claim is questionable - it does not match the view of
some of the
fuse maintainers.

> And I think fuse makes famfs worse - significantly more complex, less
> adaptable to change, and less performant. And famfs files are memory - ac=
cess
> needs to run at memory speeds! In short the risks out-weigh the benefits.

There are definitely pros and cons, but if there was a measurable performan=
ce
impact we would not have been having this discussion at all.

AFAIK, the performance impact was with the briefly discussed BPF solution
or worse IOMAP upcalls, so those ideas were dropped immediately.

It is very clear to us that page fault performance is critical to famfs.
I fail to see how Miklos' patch for striping [7] adds significant performan=
ce
overhead to page fault and seeing no comment from you on this patch
I am guessing that you never tried to apply it or to measure performance im=
pact.
Am I right?

Look, IMO, your main argument for standalone famfs should be that famfs is
simple and would be easy for vfs maintainers to maintain in the future
in the unlikely
case that it is abandoned.

The way I see it, the main caveat with famfs-fuse is that it takes a toll o=
n
you (a considerable toll) to meet the requirements, but to be fair,
Miklos already
wrote a pretty decent POC and you were offered help from fuse developers
with the remaining parts.

However, the claims about performance overhead and complicating fuse -
I find those inaccurate.

Thanks,
Amir.

>
> About this patch series
>
> I've called it V12 for recent continuity; there was a V1 and a V2 standal=
one
> in 2024, and then V1-V11 were fuse (call this selective consistency).
>
> Famfs depends on the 'fsdev' dax mode which landed in 7.1 - it will only =
run
> with an fsdev-mode (aka famfs-mode) daxdev as its backing device(s).
>
> Patch 01 is a fix to the fsdev driver that is needed by the rest of the
> series.
>
> Famfs Overview
>
> Famfs exposes sharable disaggregated memory as a file system. Famfs consu=
mes
> shared memory from [usually shared memory] dax devices, and provides
> memory-mappable files that map directly to the memory - no page cache
> involvement. Famfs differs from conventional file systems in fs-dax mode,
> in that it handles in-memory metadata in a sharable way (which begins wit=
h
> never caching dirty shared metadata). So a famfs file system can be mount=
ed
> from multiple nodes, provided they have access to the memory.
>
> The key performance requirement is that famfs must resolve mapping
> faults with minimal overhead. This is achieved by fully caching the
> file-to-devdax metadata for all active files.
>
> Famfs remains the first fs-dax file system that is backed by devdax
> rather than pmem in fs-dax mode (hence the need for the new dax mode).
>
> The famfs user space can be found at [6]
>
> [1] https://lwn.net/Articles/983105/ (Famfs at LSFMM 2024)
> [2] https://lwn.net/Articles/1020170/ (Famfs at LSFMM 2025, with patch li=
nk)
> [3] https://lwn.net/Articles/1068686/ (LWN coverage of the patch thread)
> [4] https://lwn.net/Articles/1082687/ (Famfs at LSFMM 2026)
> [5] https://lore.kernel.org/linux-fsdevel/0100019f7d9fbe81-6cb16662-2522-=
47ea-a152-fab0ee3d9b35-000000@email.amazonses.com/#b
> [6] https://famfs.org
[7] https://lore.kernel.org/fuse-devel/20260601152327.2069787-1-mszeredi@re=
dhat.com/
