Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60073F44FB
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883301; cv=none; b=m3Ja4yt5WBbvV8x+Xc22AXDL3C8wUx/gBGrt/nEKh3sFy99/DMYNosoS8xpnh/O0gIp6Cu1pNHhIun0RyLZAtaJFltHaYrGlWpg4Hn0Egzb4eQt0sFcplOqWAvb6NPGE9ljfKJzkM3hkPzoyexbH1/0yIxuvQGkY6MjVbtPdId0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883301; c=relaxed/simple;
	bh=HEI3NInBIsei/EoRNgiy0qpwrOV6JThvbMsnk7Bz8SQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKNXNl6UH0XGAFpQnK5XG7ulnCRdUaHT2znX97KBnxN7J6J93W49QjV2I4l2f7+srr69LWKXO49hBkpWg2dvNacyU86wK/2u3RHD+1KEcywrR4Afes05u6kJUzZ1wkJqRqXJVtRpLUqMABko2bFnniQDZNf+4IFyuZZ+Ca52jUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGuaQzVc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGuaQzVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7209C2BCC9
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 22:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883301;
	bh=HEI3NInBIsei/EoRNgiy0qpwrOV6JThvbMsnk7Bz8SQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YGuaQzVcASV1PRmlOYNzG6eBMtifk2iEA4kgflqnXOQ+z7ySrOBrh+eRvJuCrz2rU
	 6S8xgfcFr6ZQC0E+IeZ4I8+uE+PHLaL5TMBy2JNGNMeZHS/v//LvBokUCzAW4oqkE5
	 fuHGGquz6Iw859CUIW2+G1NuZ/cCoDRDvD+Vdd/vux9OWItbpFAoWpwa8ZfibQ6tO/
	 7guCiYWZu+WzrdGLEdwVvGa1GpWgzVOPwMlYAn4dc0lW75XBl4Sq9NX29CBgDiWHdx
	 I+y99w59EzSqtH2Vey0zx1ujnLNeo1MALsGnTP9YpGs+SdgNbWgkmyg5o69tCehA9h
	 Dat8bMlAzhlIQ==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c7a459105so535822d50.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 15:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8MCX+6m44tpzFU+7zXJpkmHfZKKVIDBHZszZo7RNIS8mWfNgNufBVATGUMNjcpW9sBcB2X9mXYCnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUnRMuyGxp7YmnGrFBhu7FAVLlcmXtSVB3pH694ys1B5DAYD4p
	hrnLnEcqhUfdta8VFhMLuAiIyDsQuUbk4JseekNCKg3kyQn1HiwvOOpsNGZ+Lv8nic/bFz+bpwy
	+2MfAV/8NzJNeFyWm4Pq6BC2X3b80SENTJX8i3HxuGg==
X-Received: by 2002:a05:690e:b46:b0:654:3fca:3515 with SMTP id
 956f58d0204a3-65e0b21fe50mr8034402d50.30.1778883300972; Fri, 15 May 2026
 15:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de> <20260512053625.2950900-7-hch@lst.de>
In-Reply-To: <20260512053625.2950900-7-hch@lst.de>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 15 May 2026 15:14:50 -0700
X-Gmail-Original-Message-ID: <CACePvbVAWsNZ22gzuDEfLiCK3zxb18svrJ+ksuzHnR2eQOyZyA@mail.gmail.com>
X-Gm-Features: AVHnY4JHBmh6X5lXS1qOF4QpMHKR8b6gUc4PeaeujUpSr4VXuziU4ZJkvW_XRo8
Message-ID: <CACePvbVAWsNZ22gzuDEfLiCK3zxb18svrJ+ksuzHnR2eQOyZyA@mail.gmail.com>
Subject: Re: [PATCH 06/12] swap,block: move the block device swapon code into block/fops.c
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	David Sterba <dsterba@suse.com>, "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:37=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Make use of the abstractions we have.  This is a preparation for
> moving more special casing down into block/.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Chris Li <chrisl@kernel.org>

Chris
