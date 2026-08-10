Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DC342125D
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 18:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387443; cv=pass; b=KkTod89AT3RqktJzHETaCj0LA+TmnLWRpHb1HAScFIeNRCD5BmOaJGomIdT48BpWpwSYWC55uxSSWcGHZrDbxNyWFCliZTpm7Bfh255p1JxuBkxJ0fZfCg5oSGgfwgbYNvpVq+EYjfPEV5f7tDeG/tgrlR2by6hx0akYBvNxYKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387443; c=relaxed/simple;
	bh=C3672GsGsY2/UL7vfkutsQ4ku3Q5wCtnn5EwQZops84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNdspwkN9+CYmFGjl53TiaoYy8EuhWuTfpQnpmTegg/4bRyoVBfCQqYtCv+o06kLG33uE5F8xcWF4RkEFVHjYdj7FAZZBo8lO/M/IT2Szl9MtvNYQ6/NcYbe3nfXdlurgC9kEG/5ei+795yAXcFTY0RbI71T2s8YlvZYh1ghI9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbGH2IXY; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbGH2IXY"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so217388566b.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 11:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786387440; cv=none;
        d=google.com; s=arc-20260327;
        b=psoA20FVqrTmA2fC+wlHsC863y6fJe0kBP+nH/IEm3jTBvONBmopYj1rygyI03zI3H
         qMA7XpeuKKREe+tPZ3g5ooRDhr88qrWqWoRbOoFonIK275EaN+7U1rsBZPV0YaytmZxP
         opjHdTyK36IsgpKkgG2zM3AkTdFMY6RwVa1QQ5/cP5im75vd27KNFVebGnURgooJ7cO2
         FDJNxOMXlYfo+uU/LV5iMMsscfuat1U4ycT9V4RL5pv2B2jLr5ahBXQHnQgxOyB1cdrA
         urMthYdCvhroM4rAJIKhFsf+95q3Dph6wiv8uLAdTfCo5fJAGqI/Dd2bcIvX/d1yusOu
         Mpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YX4TRaBIx6sKxn+7PkuMnvBBIHo6U81xdDIXbs86H4E=;
        fh=JoNAIeLGtqWfPmtx3LX6q8g1ehCQsZnH1AL9xM62MDM=;
        b=lXZwiqjiMIJc4qDWh++3yFecxrJIghPxPeyGuXzfXG0RUbxtj68q9Xz771+1dpyp9g
         TPRK/9aFRYCjoCwLYmKUObyeVViItJPCmn/s7nJbvvrcjGiEa8DFsGdMf31TSw7FY+7d
         FjQyCNl9tm4jzzwYan72ETLrTuzfOIWFDuXQ93/l3SyvqCBQsZcMYNMgvjyTEbKJ5EXs
         brXciRJiYBY6qIj6NHq3Eam0MbZzhhlPRN6vcYEB1/uF45iXApv5PEU+8u7XM+L/cHHC
         9f4BP5wRG1KUtaUOh+ZHi6/Hi+CG7KQCSUv3vp0BIwdh5RopysMple+U2TlhQ1nOEZlD
         a0SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387440; x=1786992240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YX4TRaBIx6sKxn+7PkuMnvBBIHo6U81xdDIXbs86H4E=;
        b=LbGH2IXYqYTzx943KYvvZJeGgQwqow6Wk7jRpVqrv163Gjm7R56bxZ38E8rQ76ylMy
         0y+HSOGJw9FSzD2Lh68Dmyn2qlDfxsS/czi6Xte7nZDrPoFchJWHM0yy/X3hDJGuGDGB
         uOxcBs4DscZ5KMlUnyq3tGOA6AWSIW4hjiy7IYqje2+lYd93fLKpu94uF15E+KtJjrPf
         T4UAsddTrIouHhvScYlgtzSLcCtHRzK6UjxEYfX1R9YkB+6dXZAjLPzX3vBJhYvbKAjd
         z+36Avwe78XuXlio1CMs1HR1/ovRScyS6J4M1n2Kzvb6lkGJhjKh1g4/jSW8iN11HDTf
         FxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387440; x=1786992240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX4TRaBIx6sKxn+7PkuMnvBBIHo6U81xdDIXbs86H4E=;
        b=LfGe8ZhfH9pZIZFmTFIOonyfCg1xA3pkKu8T88bg27lA3CUGaO1Zjh9GNKLSreq3hQ
         3OdA6KZGyv64md3UXkoMlnRqLDw8y3S/TIaUIornNyPrlb9yTM4Obx5qLfmPzFBzSSIp
         NB4t07SHLWTnTHM4eW1iatuie8HQfPe6LlNBkdep8s7nEmWL3TPsIGQIlytRj6Zrv743
         4Cdq9iZco0PUXcvp3yQ4xHqMeqcFM4YfQUe3O0o1pfjwlkub1YV3fGK+yhLMDQPF9Ohv
         TuFYmXOIAJQwqxFwXEm4wt0QEIIvB1nQKV4MOnpVMMTwK1xQcQbWA8FTn5+lrvWZ6u/w
         1fsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVjArAgqmDMYDBAmMItF9yra7XyJLGWJVpH/3X5Ca4zHD0aKzTXGH7FZWxNd9GBw+e9OHuD6CCrqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++VlwVfk2v3+07W4loot02LnWEuQopJ9i9F4mRJHSM4A2ssjd
	MBItL3whmP4mSDqQt1at0ArQizXtp+Opp6dBvtChYf4AXccvUhcFb9oznBwkyJHXvMJjBclpnZF
	isrB/6nNglxK04KeJ2ca1Mc8PiuRo9oI=
X-Gm-Gg: AR+sD12kRHnrdh0DehesYM6E2Yc1Fp0h96ZTrncT13cG6B2teh1jwWnqCuIyiuGxj8E
	OJ6plJTNF9dSjpd5kyROFJ5gAUOTgS7mZdIY5KjQlxJOiwn+bX6HN0wf99pBimkpPkPb+x6mwTm
	3lDnDYP0aMKLl5cdB2cD74fpEUUoi0u4liJXM5qkek6HuhApLuGNV34N0zrQTdAGIViIcA9Tuo+
	1q15gfqs9sItXMHAG0itmr7zWi8Ywn2E2NvMgLV14MrlFeHpKmH7fHXTLat2sJFCC4UL0W7W5T1
	vSaXvz8jfka01dX3s1Qlz+ra6/+fBJenVwwNAA2vhfdh9GUAc9akUBAr
X-Received: by 2002:a17:907:1c01:b0:c12:b227:614b with SMTP id
 a640c23a62f3a-c2087558b24mr976428066b.27.1786387439743; Mon, 10 Aug 2026
 11:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803022730.75731-1-john@jagalactic.com> <0100019fc572ca94-ec363dd7-3a77-484b-b4b7-f2503a0931a6-000000@email.amazonses.com>
 <CAOQ4uxhpkP7FsjaqqVO2aDSKCJ9yc3WKms6dncqnDuwGxqthng@mail.gmail.com>
 <anQZdSsJSyoqJkCo@casper.infradead.org> <20260806053409.GL3560084@frogsfrogsfrogs>
In-Reply-To: <20260806053409.GL3560084@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 10 Aug 2026 20:43:48 +0200
X-Gm-Features: AUfX_mzPA_vPx6O-eQdEFVgO0KbHbmWxqFSTIYp2pX0K6A7Tp_f_HeH4HfA_LAw
Message-ID: <CAOQ4uxgP5K6JM-WJfYDAQxN+6aWCNZLjeaocT2KGdxapjq3u-w@mail.gmail.com>
Subject: Re: [PATCH V12 00/12] famfs: the Fabric-Attached Memory File System (standalone)
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, John Groves <john@jagalactic.com>, 
	John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
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

On Thu, Aug 6, 2026 at 7:34=E2=80=AFAM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> On Thu, Aug 06, 2026 at 06:19:49AM +0100, Matthew Wilcox wrote:
> > On Mon, Aug 03, 2026 at 10:52:19AM +0200, Amir Goldstein wrote:
> > > > The most important thing to know about famfs is that it CANNOT be u=
sed as a
> > > > general purpose file system. It is for enabling file-based byte-lev=
el access
> > > > (including direct mmap) to very large (e.g. 100TB) shared/disaggreg=
ated
> > > > memory appliances - which have become available during this long pr=
ocess,
> > > > and which are in need of Linux support.
> > > >
> > > > So famfs cannot be used by anybody who doesn't know why they need i=
t; Making
> > > > famfs standalone means it can't affect users who don't use it. And =
my super-
> > > > mega-corp employer (Micron), as well as other memory companies, nee=
d it.
> > > > We do not intend to abandon it, but imagine if we did: fs/famfs/ sh=
ould be
> > > > removed if the memory companies can't be bothered to maintain it.
> > >
> > > It does not work this way.
> > > When vfs maintainers accept standalone famfs they accept the burden o=
f
> > > maintaining it whenever vfs internal APIs change even if the filesyst=
em was
> > > abandoned by the mega-corps.
> > > That is the code of the push back for adding new filesystems.
> > > Removing the fs and breaking deployed systems is not an option for th=
e vfs
> > > maintainers.
> >
> > Sure it is.  We removed EFS just last month, because we decided that it
> > wasn't worth keeping any more.  Just like we removed Itanium architectu=
re
> > support (and a number of other architectures before that).  We've remov=
ed
> > other filesystems in the past (xiafs, ext, surely a few others).
>
> and freevxfs just this week because the one user/complainer said hch
> could let it die.
>

Guys really, these examples prove what point exactly?
They prove that if all the users are gone we can remove a filesystem
wow, revelation.

This is the reality as I see it:
Famfs is backed by a major corp selling expensive hardware
and championed by John who has proved commitment above and beyond.
So as it stands, famfs is a fair candidate for merging standalone.

And yet, circumstances can and do change over the years.
I need only name your employer as a recent example of
major corp losing interest and axing the maintainers budget to many project=
s.

These things can and do happen and when they happen there is often
little correlation to the number of deployed users who paid many $$$ for th=
e
expensive hardware, which major corp lost interest in maintaining.

If as a community we do not prepare ourselves for this possibility we
would be fools.
In the unlikely event of future famfs abandonment we are left with two tech=
nical
options depending on the choices that we make in the present:

1. The VFS maintainers are left to maintain an abandoned fs whose surface
    area interacting with the code is super/inode/file/vm operations and mo=
re
2. FUSE maintainer is left to maintain an abandoned feature whose surface
    area interacting with the code is substantially smaller - basically, so=
me
    custom logic for DAX fault handling - because the rest is (or can be)
    plain fuse with a dash of fuse passthrough.

No option is categorically better or worse than the other.
The burden just falls on different people and the weight of the burden
depends on how much active development of the API is going on.

We have had many mostly-dead filesystems which did not bother anyone
for a long time, until someone comes along and starts a revolution in the A=
PI,
such as folios, iomap, new mount api, parallel dirops and then we pay the p=
rice,
or the abandoned customers pay the price.

I said enough, probably too much.
I'll be happy with any decision, just as long as we make it continuously
based on correct information.

Thanks,
Amir.
