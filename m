Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECAB2853FC
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 16:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550615; cv=none; b=RX+sIKK75zFz9ZKNogIm2OzcEtyhUhjCoxsTR6jICphNbf/RhycY0720FRR1zDIMC4D3OEM3P7Bnxtfr2FQNZFbUg9HpFzla87NvuT4jonAnQYfMNsnV3Ul2uN892IbtaKB7GV1uPvnRaUuM4cpQAEnHtXRYOO1ddHBCMnYL1UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550615; c=relaxed/simple;
	bh=UPskQvYkrxUpUKSU6eggRkM0kZhs49ZXn1vsmfjc6oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gB182gToaAVomh2HXBOiWsxX+eLdNrNSkNY2BI+GL0T7coRwk6hQ5hh8wDQ0X3Cq2/pwZ705hzqy1dP8PeQcTQfOgr8R08rc9e6N3aH9CEMo/QgHdMwoClAVi91Cnj/tcQY87oJkpbPKfPrPVlcLr+bxnhYZ3KgvCj5HpoeybNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=W8FvXYTp; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="W8FvXYTp"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c3b863b8eso2036603a34.2
        for <linux-doc@vger.kernel.org>; Tue, 06 May 2025 09:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746550612; x=1747155412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q5nunoDVPugDexOGX8IwjfNJm1uYPE1x3M/IebA2LI=;
        b=W8FvXYTpaOdggLlNg6ugRATIcg3HPhSBk0x8h03zrrgVrkY5l0IlWovhzqzVyW5QwQ
         3biJroK3DYBTiXYFHujl7H8iIf6LpKAiOKzj3i1TfQ+xtn2BpKar0ia+E1CAtN9dZYU6
         foSzLfvLy9+cQMz/VTbOQhg/WX1iL3PDiUG30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550612; x=1747155412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Q5nunoDVPugDexOGX8IwjfNJm1uYPE1x3M/IebA2LI=;
        b=UnOuUQln5XscW5iJwgd7FF2thXLnWD3VvQ4lW3RKjEoEHs7nYWbPi9PeeOtWLrgQFx
         WSJmD1Bh80y5G8BjC5q5u1DDZFCNqLstd0QZvGO5ACyGKfhcaw/6/KdGXcTa2RvH/W3a
         eo+O7G1D4i6LvjXaKjxZQuGYKZc64kI/rJtxpVjnfcJtXmbTpu8GhB9Hm12yUx/PVi+z
         XaxgY+4SCfVrrWMxUs5+hKFUUQrQdq8KKnAfaOH8PL2oJ0iQteO2nfv3T+RbK+6nIb1X
         oIYr6UmBVxadIwQLS53k/vo6BWJcoFQ88M9J1L7ezUVOsfYDK6l6orDWX84zB3SlFOzD
         soFg==
X-Forwarded-Encrypted: i=1; AJvYcCU+NGJH3FPxI2++1nhGKXJOrmCbtvaSeXOVLS3589lvd93TPk8cu23OaD82//TmZAqIP91z4X1uJGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx27FlgVIDS8+sq7xe4JSatN6opM/J8nIeT9FeMyJviif3jSXg1
	hjZIaymXUgaD0ooZmN+jU9ZHbB2NePn7oQqZjywm+dMjztZO19p/57nW1SfeNiTy1aujemLL7Mn
	QikKpK6hVHeDTfglngF69DguW+JbyGbIyZNf25R212WExrElP
X-Gm-Gg: ASbGnctXU8qTZTSOPKNV3Uk8WRB0pl6dM/xaabus1rLeM0YtlD1gsqAlK+hubKhlx5R
	FjfMyChF8fwtA17Ucu8RoI9bzcNQcSaQwFUarWXXuX5SvgUZMCrFnrTeAbKDkbwIVYA7rkH18gG
	3InfO0TRhEV/GP1wAB7Bg=
X-Google-Smtp-Source: AGHT+IGJjJepn0gOwuwpfhMDAKJN4TqWIaIZ7UsEzwpTg1tX++SC/L4yjFUv3kDEAUslSG6hvBlXPYOAhZxrMKo+VF4=
X-Received: by 2002:ac8:7e96:0:b0:476:77ba:f7 with SMTP id d75a77b69052e-48e012633afmr162547871cf.34.1746550601068;
 Tue, 06 May 2025 09:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421013346.32530-1-john@groves.net> <20250421013346.32530-14-john@groves.net>
 <nedxmpb7fnovsgbp2nu6y3cpvduop775jw6leywmmervdrenbn@kp6xy2sm4gxr>
 <20250424143848.GN25700@frogsfrogsfrogs> <5rwwzsya6f7dkf4de2uje2b3f6fxewrcl4nv5ba6jh6chk36f3@ushxiwxojisf>
 <20250428190010.GB1035866@frogsfrogsfrogs>
In-Reply-To: <20250428190010.GB1035866@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 6 May 2025 18:56:29 +0200
X-Gm-Features: ATxdqUFT-fIsXKRHea9-EZCmnVWun07IHA8kCr4QDmzIP2kON1JGlU4dzmYDGDc
Message-ID: <CAJfpegtR28rH1VA-442kS_ZCjbHf-WDD+w_FgrAkWDBxvzmN_g@mail.gmail.com>
Subject: Re: [RFC PATCH 13/19] famfs_fuse: Create files with famfs fmaps
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <John@groves.net>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Luis Henriques <luis@igalia.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Petr Vorel <pvorel@suse.cz>, Brian Foster <bfoster@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>, 0@groves.net
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 21:00, Darrick J. Wong <djwong@kernel.org> wrote:

> <nod> I don't know what Miklos' opinion is about having multiple
> fusecmds that do similar things -- on the one hand keeping yours and my
> efforts separate explodes the amount of userspace abi that everyone must
> maintain, but on the other hand it then doesn't couple our projects
> together, which might be a good thing if it turns out that our domain
> models are /really/ actually quite different.

Sharing the interface at least would definitely be worthwhile, as
there does not seem to be a great deal of difference between the
generic one and the famfs specific one.  Only implementing part of the
functionality that the generic one provides would be fine.

> (Especially because I suspect that interleaving is the norm for memory,
> whereas we try to avoid that for disk filesystems.)

So interleaved extents are just like normal ones except they repeat,
right?  What about adding a special "repeat last N extent
descriptions" type of extent?

> > But the current implementation does not contemplate partially cached fmaps.
> >
> > Adding notification could address revoking them post-haste (is that why
> > you're thinking about notifications? And if not can you elaborate on what
> > you're after there?).
>
> Yeah, invalidating the mapping cache at random places.  If, say, you
> implement a clustered filesystem with iomap, the metadata server could
> inform the fuse server on the local node that a certain range of inode X
> has been written to, at which point you need to revoke any local leases,
> invalidate the pagecache, and invalidate the iomapping cache to force
> the client to requery the server.
>
> Or if your fuse server wants to implement its own weird operations (e.g.
> XFS EXCHANGE-RANGE) this would make that possible without needing to
> add a bunch of code to fs/fuse/ for the benefit of a single fuse driver.

Wouldn't existing invalidation framework be sufficient?

Thanks,
Miklos
