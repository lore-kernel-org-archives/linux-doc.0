Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F4368975
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775850293; cv=pass; b=AGXX+u9Q9xljj32o1D61EtSG2+KLBrWCCSC1HfnrLJlABldGMli56ng101jVwuAx9FNUzturUv3HKacsAljx5TKRXc2aDRWMjnT/vHuY/rX0s1MbCpSmCLaf7D5LNBDtUkO8eb3S3A00nI4poaBK8f9OJq5QsknGze61UIUZHg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775850293; c=relaxed/simple;
	bh=FNAI03nk/4gAmnUEUdqnX++d1yEbPhddX0iMENhQHCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bh2deeMCSCNPKFhk6hftSRaqSZ+XQYhXrZfuMiUVxhiJhrEZZidZFmECr4hTRWoa2z3lA9uQjP330+iFhndE6/WnsLM1besxZAiYc3NaQWj53mmzBm05KUcgLc5bGo/vBLW+z75CGTWnTCJ+RUbRc9N0iFP2K64lC56B5LNTS2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdM8y7mR; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdM8y7mR"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d03db7f87so1560635f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 12:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775850289; cv=none;
        d=google.com; s=arc-20240605;
        b=PEQArzLhfyoUIluozslQopmVr90N8X6vyxuPuwRruuNWNoPPthvqdAcZU7gesRY97I
         3fGs826X2BuqOhEgkNQEaGEKVgLXZ10/wRasPf8y5ubVwG4YuSV7O2MbP46+o8vKpjJK
         9DVtnVV824MxXFXLscX0YucZMCe++xn0vf0WkXoF+lmPA7uwb8Nfm1DhcRdqBsnRt8M8
         vqj+zet96u2cJTYfg4S5TgQWbVhd3fVkw8NNq6QNUO/RHh31qZWbw7zizU0zTUirC2V5
         vM57G9C42dezXmIETLYf2GhLg9cSWkhZNEiUE+9dOZUVGzrFtHNWmd1Dr3Cp1nBUcPSz
         Buxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YA+Vo+BLpjEum5uJOjv2yu6kV+TyvNZtWpStQlX6OBg=;
        fh=8uvMvECNk3lTKUjiIkJ69KA8/6aJgs1SKMlGXX5Htwg=;
        b=fkC7QQSQdVMqN+54yfEE0qFbuCZDvKr36mbNRCWjL2pkV/rO5eL2Ejiwy0bqHNnGDa
         wGRFdKA83yGZoeJSvFTOY7q+cAi++vrtwZRTMQk4J4VPmQ9FK7iU2UTzMpsI4Bw6Xt3T
         Rkxo7NwygXWawPdvpeHotg5HDUNhjcqy3D61hpHuqvOPo6K9xEAFAWsTEc2QNTZE7mer
         iuvfj6f6YZx2gsLSInozuCDkS/XL8Q7Qd8V1T12ZPVjNHZuW8u41dMPJ8sZ2XGLvvhzg
         pWlmhwqw9OK9eGOEBUSrAYZJEefhJ0r+haxGeZEM5bfBpBSR51fVDjBQ6x8BVCR/tA8L
         f6bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775850289; x=1776455089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YA+Vo+BLpjEum5uJOjv2yu6kV+TyvNZtWpStQlX6OBg=;
        b=qdM8y7mR8wf+OsQNKiH6V2nzbg8vCn/qENYf/6exutGnafdJ7gOEn7h4Uq9RgqjzEB
         WkzYHrdXtqb2loPFz/UToN7P9FEzORLO7oKwp9txHWzeO96RFd2+XQRAZOr7plRH2L7C
         tK0ojr7V7GoJRLePD3pnHbTUHcl3iH/25/lMnzvB0yvfZws9srC5JzzSkYkk+EBfHe6c
         +9056WXY3TciY8mFZssTgA/06zdP2iEHSz7a/aTFEZdsExHWNlDovCXJt6biE88wQB71
         jxAhpq3B9p8kZCH9ItnJhrF33I1RiNxUPD+UtyAFI066LaMu/sjNngfvgmgr2gCGs9Tc
         AUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775850289; x=1776455089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YA+Vo+BLpjEum5uJOjv2yu6kV+TyvNZtWpStQlX6OBg=;
        b=fi2mhw+tK+S9pjrt34wxpa180wRM6yOqfCUvDk5JnPciWjkuj/BkHS1TejQJyXaBSj
         fXUhwaAUNR5R2lPnp0W/L4rYzJHaNCQUTW3tiT6HkKOHzUj/a6qSsLrWHarNyVn+MDv3
         K7UTPVD2UXqCOB7MmyNHIBPqzp9X64/ey6Tx0slK0nxitnJNT2F4jHcRH2BuBIiZ8yVd
         z5efuaRTHDYus9Pda0N6gfL0pnF9DgcFYgp2p6SuPrvOij0Ib2QLBAX7uyYdhV9w8RPy
         AIEPvntu8vGEGPCbNN9T2W3eRrPNLbl6cM/UqrHwtYUzjn78S2KQB/i4zO6bqERXsR6e
         AE2w==
X-Forwarded-Encrypted: i=1; AJvYcCV21z00A9xAINbM8fcFdDgZa1KLBP3Bu8JCkXZbXcaAceNU17Dos5Hs3ncofDABgFxUNRWbezbzwuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKIN96+bFuBY7sekdF0jadQh/Ykwt3fey/OP8kivuEfrGijQ9C
	B/SMGQSIJxM2vU5LtlJj78EubsI4ZJV84r324C90CH4s79UWPWaceEmsYk/9WDESjMwQyk7aLgz
	ickg7gC3DLyInd2h0mkPOVHdqzHKN3Gw=
X-Gm-Gg: AeBDieuZxQ19mAUQwSGZwfmEo4rmc8pMj9ztLzLQNrRw/x2CDwUJIU5ULH+ppwThWoi
	pDsFhdkCV2A7c2E9YjS3yKokZRPGCJn1xDzRknRRmehvxMw5w0jepntwa30DQcbzbRpsgRJvL4r
	dtGiu6xbt2ELhmbeQNf7L5D6jMIhe5DcBWe8BbZTLU3CY1P2VShT9LWQzYZCr4eQ4KIuboTNMpU
	1lyo0/u7FN9n5tL6X4XGFnA8FLM/sSixDTcio/zhxIAnVrinSHFiXAtgmfoHrFZM6QldvWMmEa7
	HHyGEg==
X-Received: by 2002:a05:6000:26cf:b0:439:b440:b8a2 with SMTP id
 ffacd0b85a97d-43d642b6b7fmr6878443f8f.28.1775850288128; Fri, 10 Apr 2026
 12:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331123702.35052-1-john@jagalactic.com> <0100019d43e5f632-f5862a3e-361c-4b54-a9a6-96c242a8f17a-000000@email.amazonses.com>
 <CAJnrk1ZRTGWjNzkMxS3UkeZMmrpadJDtWKontMx2=d-smXYq=w@mail.gmail.com>
 <adkDq0m5Wt9YhJ8A@groves.net> <38744253-efa3-41c5-a491-b177a4a4c835@bsbernd.com>
 <adlBcwJjLOQDAR65@groves.net>
In-Reply-To: <adlBcwJjLOQDAR65@groves.net>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 10 Apr 2026 12:44:35 -0700
X-Gm-Features: AQROBzARHDFbLCramX7y6XHbmzYw4l9YPeopkOWAW_WNkYoeqE-JB9tvnAmSS9c
Message-ID: <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
To: John Groves <John@groves.net>
Cc: Bernd Schubert <bernd@bsbernd.com>, John Groves <john@jagalactic.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, djbw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 11:38=E2=80=AFAM John Groves <John@groves.net> wrot=
e:
>
> On 26/04/10 05:24PM, Bernd Schubert wrote:
> >
> >
> > On 4/10/26 16:46, John Groves wrote:
> > > On 26/04/06 10:43AM, Joanne Koong wrote:
> > >> On Tue, Mar 31, 2026 at 5:37=E2=80=AFAM John Groves <john@jagalactic=
.com> wrote:
> > >>>
> > >>> From: John Groves <john@groves.net>
> > >>>
> > >>> NOTE: this series depends on the famfs dax series in Ira's for-7.1/=
dax-famfs
> > >>> branch [0]
> > >>>
> > >>> Description:
> > >>>
> > >>> This patch series introduces famfs into the fuse file system framew=
ork.
> > >>> Famfs depends on the bundled dax patch set.
> > >>>
> > >>> The famfs user space code can be found at [1].
> > >>>
> > >>> John Groves (10):
> > >>>   famfs_fuse: Update macro s/FUSE_IS_DAX/FUSE_IS_VIRTIO_DAX/
> > >>>   famfs_fuse: Basic fuse kernel ABI enablement for famfs
> > >>>   famfs_fuse: Plumb the GET_FMAP message/response
> > >>>   famfs_fuse: Create files with famfs fmaps
> > >>>   famfs_fuse: GET_DAXDEV message and daxdev_table
> > >>>   famfs_fuse: Plumb dax iomap and fuse read/write/mmap
> > >>>   famfs_fuse: Add holder_operations for dax notify_failure()
> > >>>   famfs_fuse: Add DAX address_space_operations with noop_dirty_foli=
o
> > >>>   famfs_fuse: Add famfs fmap metadata documentation
> > >>>   famfs_fuse: Add documentation
> > >>>
> > >>>  Documentation/filesystems/famfs.rst |  142 ++++
> > >>>  Documentation/filesystems/index.rst |    1 +
> > >>>  MAINTAINERS                         |   10 +
> > >>>  fs/fuse/Kconfig                     |   13 +
> > >>>  fs/fuse/Makefile                    |    1 +
> > >>>  fs/fuse/dir.c                       |    2 +-
> > >>>  fs/fuse/famfs.c                     | 1180 +++++++++++++++++++++++=
++++
> > >>>  fs/fuse/famfs_kfmap.h               |  167 ++++
> > >>>  fs/fuse/file.c                      |   45 +-
> > >>>  fs/fuse/fuse_i.h                    |  116 ++-
> > >>>  fs/fuse/inode.c                     |   35 +-
> > >>>  fs/fuse/iomode.c                    |    2 +-
> > >>>  fs/namei.c                          |    1 +
> > >>>  include/uapi/linux/fuse.h           |   88 ++
> > >>>  14 files changed, 1790 insertions(+), 13 deletions(-)
> > >>>  create mode 100644 Documentation/filesystems/famfs.rst
> > >>>  create mode 100644 fs/fuse/famfs.c
> > >>>  create mode 100644 fs/fuse/famfs_kfmap.h
> > >>>
> > >>>
> > >>> base-commit: 2ae624d5a555d47a735fb3f4d850402859a4db77
> > >>> --
> > >>> 2.53.0
> > >>>
> > >>
> > >> Hi John,
> > >>
> > >> I=E2=80=99m curious to hear your thoughts on whether you think it ma=
kes sense
> > >> for the famfs-specific logic in this series to be moved to a bpf
> > >> program that goes through a generic fuse iomap dax layer.
> > >>
> > >> Based on [1], this gives feature-parity with the famfs logic in this
> > >> series. In my opinion, having famfs go through a generic fuse iomap
> > >> dax layer makes the fuse kernel code more extensible for future
> > >> servers that will also want to use dax iomap, and keeps the fuse cod=
e
> > >> cleaner by not having famfs-specific logic hardcoded in and having t=
o
> > >> introduce new fuse uapis for something famfs-specific. In my
> > >> understanding of it, fuse is meant to be generic and it feels like
> > >> adding server-specific logic goes against that design philosophy and
> > >> sets a precedent for other servers wanting similar special-casing in
> > >> the future. I'd like to explore whether the bpf and generic fuse iom=
ap
> > >> dax layer approach can preserve that philosophy while still giving
> > >> famfs the flexibility it needs.
> > >>
> > >> I think moving the famfs logic to bpf benefits famfs as well:
> > >> - Instead of needing to issue a FUSE_GET_FMAP request after a file i=
s
> > >> opened, the server can directly populate the metadata map from
> > >> userspace with the mapping info when it processes the FUSE_OPEN
> > >> request, which gets rid of the roundtrip cost
> > >> - The server can dynamically update the metadata / bpf maps during
> > >> runtime from userspace if any mapping info needs to change
> > >> - Future code changes / updates for famfs are all server-side and ca=
n
> > >> be deployed immediately instead of needing to go through the upstrea=
m
> > >> kernel mailing list process
> > >> - Famfs updates / new releases can ship independently of kernel rele=
ases
> > >>
> > >> I'd appreciate the chance to discuss tradeoffs or if you'd rather
> > >> discuss this at the fuse BoF at lsf, that sounds great too.
> > >>
> > >> Thanks,
> > >> Joanne
> > >>
> > >
> > > Hi Joanne,
> > >
> > > I'm definitely up for discussing it, and talking before LSFMM would b=
e
> > > good because then I'd have some time to think about before we discuss
> > > at LSFMM.
> > >
> > > I have not had a chance to really study this, in part since I've neve=
r even
> > > written a "hello world" BPF program.
> > >
> > > I'll ping off-list about times to talk.
> > >
> > > However...
> > >
> > > I would object vehemently to this sort of re-write prior to going ups=
tream,
> > > as would users and vendors who need famfs now that the memory product=
s it
> > > enables have started to ship.
> > >
> > > This work started over 3 years ago, initial patches over 2 years ago,
> > > community decision that it should go into fuse 2 years ago, first fus=
e
> > > patches a year ago.
> > >
> > > This implementation is pretty much exactly in line with expectation-s=
etting
> > > starting two years ago. Famfs is a complicated orchestration between =
dax,
> > > fuse, ndctl (for daxctl), libfuse and the extensive famfs user space.=
 Famfs
> > > has a fairly small kernel footprint, but its user space is much large=
r.
> > > This could set it back a year if we re-write now.


Hi John,

Thanks for your email. I totally understand where you're coming from -
having already spent a year reworking your initial patches to go
through fuse, the last thing needed is another change. Bernd brought
up the question of whether after merging this series in, it could then
be converted to bpf. If this is an option on the table, I'd say we
should just merge your series now and do any conversions later, but I
don't think this is possible. As I understand it, the policy is that
all kernel releases must be backwards-compatible, which means once
this series lands, the famfs code will live within fuse permanently.

I definitely do not want to see famfs set back by yet another year.
With the bpf approach, I don't think it requires another rewrite. I'm
not sure if you had the chance to look at my email from February [1],
but it contains the prototype code for the generic fuse iomap dax
layer with your famfs logic in this series moved to bpf. I think it's
pretty technically straightforward as it uses the famfs code logic
you've already written in this series and just moves it to bpf.

Overall, my intention with bringing this up is just to make sure we're
at least aware of this alternative before anything is merged and
permanent. If Miklos and you think we should land this series, then
I'm on board with that.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/CAJnrk1YMqDKA5gDZasrxGjJtfdbhmjxX=
5uhUv=3DOSPyA=3DG5EE+Q@mail.gmail.com/

> > >
> > > Two things are true at once: I think this is a serious idea worth
> > > considering, and I think it's too late to make this sort of change be=
fore
> > > going upstream. Products need this enablement, and quite a long proce=
ss has
> > > run in order to make it available in a timely fashion (which means so=
on
> > > now). I hope we can avoid making the perfect the enemy of the good.
> > >
> > > I believe the risk of merging famfs soon is quite low, because famfs =
will
> > > not affect anybody who doesn't use it. I hope we can run this discuss=
ion and
> > > analysis in parallel with merging the current implementation of famfs=
 soon.
> >
> >
> > Hi John,
> >
> > one question, assuming most of these things can be done with eBPF, woul=
d
> > you convert to eBPF after the merge?
>
> Hi Bernd,
>
> Stipulating that I've never even written 'hello world' with BPF, if it's
> a nicer solution with no downsides we would migrate there. I don't know
> enough yet to put a time frame on it, but I'll certainly understand more
> by LSFMM. Will you be there?
>
> I'm hoping for a call with Joanne and Darrick in the next few days to get
> better educated on it.
>
> >
> > (I also need to find the time to review at least all of your libfuse
> > changes, I feel guilty that still haven't done it.).
> >
> >
> > Thanks,
> > Bernd
>
> The libfuse changes are pretty small now. Two new messages - GET_FMAP and
> GET_DAXDEV - plus a few more bits and bobs. If a future BPF migration too=
k
> place, there is a chance that those message numbers could be retired and
> reused in the future.
>
> Watch this space...
>
> Thanks,
> John
>
