Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC22DECA8
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761594693; cv=none; b=Jnr0Js8Egnh2bC67qR2bX5iQtZa+9aWaSN7qlLwMZxhlBxWZpRwtdDrsPOd20cSv58dQLNgzpyeUvUgSF4lM2mT7y/fW0/VevRdZEWTfoN2wCKFk6DilcYurIgg+IDPhD1IrDNH90Q8qGZS95OUIeswObHx3IjLoPzat8nQXP0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761594693; c=relaxed/simple;
	bh=LUw2mZCfH1yOBKTSy9rxXAh/jPqUNSJVBaTxVdNrEJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyFjc8ZKMLVQv58fRLQq6o80hJwHTaZmDLWibQuowsrYUe79ewl1Hjrx/Fp9Wor1u+EKVDadIRzgOPAhwTPDDYE6vIgpZy8eYrrn54e6JKKm7yI/CdHNMDnIY0W4GGqXChrHd7DQNZFKfAICGnr+k/fEv56GBa7U/YFbScJcL1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v1dlgCdz; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v1dlgCdz"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ecfafb92bcso14901cf.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 12:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761594690; x=1762199490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUw2mZCfH1yOBKTSy9rxXAh/jPqUNSJVBaTxVdNrEJg=;
        b=v1dlgCdzKU2VKZ0tcQYZU9PtfJ+TzPScfLGl+vxfqtwwDx0Fz+gyS9RMoEkK5uhdHK
         IrQDFjyE1qTvzqKbCEq0gE0exVZVi+yT5xqrRJglNH+CmQy3pcG9S+6eJ2TOZsm/zeIh
         XVg4KCVTqjx1cpxfvOgqZt38KgeyUYrobhQZ3Dy4ti+iYalFFqeezm1IsXOd1p3Lq1A5
         KAZ3xncqNFuv2fvLLofC16hE0gxVIdegvos6BuV5yYi5cD0r7t2KWIgM5bXT9yFueV3N
         3EP5N8TBda13BOaWSSA/3htFfO8sq5GMcprsQ2b/3rZ+7IZgbSi+GbFAIukNi1k0mYUJ
         7AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761594690; x=1762199490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUw2mZCfH1yOBKTSy9rxXAh/jPqUNSJVBaTxVdNrEJg=;
        b=friCRmbK5nr0smM6etOnPfTSBS90hzixPrsUxdiREIvETYSVvJzhPZmhEOCuO/hkEC
         0vs0YGUISEZ91biypdXm31pR3yRlv+uWhM0HBn0xrLfGwNgmiF1bksB/nlfsIz4vATuE
         75joyJ3rlMBcMLg9CY3P/xStIr+jeL2KC8gl7N+xOA2dAeLpGM8mEnskYVgoI5PfH6NK
         bhYd3QyyowYtccu5pLz0lNmkmdxaw7GCzSpB0mVXuvmD2ZAPV2SzdnHfgacQ8UzGfvLQ
         jvaORizdBXeubnGmPzTx/FBjtrF/Ph5IdzXTrl7WWjex6KcpOeGXnZ36PtdjvkDFqqRR
         2S3w==
X-Forwarded-Encrypted: i=1; AJvYcCVs2FgbtgdMX4O6fHoqGDcPd4nlYor6KE5TOwJ1fd5wkLrJSD6Aw8CGjskdoNTJXpWBinUyODqQkAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOznietnFEUFeodIzq3ArB1UZPXZwrKY5A5cxCser7R/O9W+By
	UkSTKwAyUNjMgH1iv52r90qPmDFgZ9YA9EHJTQJYHRwLb3EqGnmWD87Ydel71iuDbu9g8+oyk7T
	gReDE+pOkPaiJsMrfEGiJeIkc7oZZUSZIpkKVyzpp
X-Gm-Gg: ASbGncsXMFKTVHMTI3vPGwz0ehYQB5/OKCp31w7r2KlI12h6pKPqMDLcITokc8Y9SGn
	U8EsnWJBhJHA1PbDnBWIWQAprmVPFlcXWb+FwENkuVkG5on0TZNuc+zlvKHDdoDilwPXPBVGpGp
	OnCmZGZ89TPztRYW/h3dA2GM941Z0qfr8FTNpgstcap6T/VmarPBHczpjrlw++RbZmyQBWY3akh
	0Y23IIDqnv7Girdi2Xnji0SsobBtW0UD67eilqA/yaISv8ZHMTq0QNuxQ+WUPQwpy5b8A==
X-Google-Smtp-Source: AGHT+IEmicxEYEPLgQn38b6v1mJfTIvyLMT/qtHkmyMNLHlEBQmcYJx6gF8JYoLZrM0kAWrtv1hez5d7WlrSFzFFVW4=
X-Received: by 2002:ac8:7fcb:0:b0:4e8:b04a:82e3 with SMTP id
 d75a77b69052e-4ed08f1af35mr1416621cf.10.1761594690047; Mon, 27 Oct 2025
 12:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026203611.1608903-1-surenb@google.com> <aP8XMZ_DfJEvrNxL@infradead.org>
In-Reply-To: <aP8XMZ_DfJEvrNxL@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 27 Oct 2025 12:51:17 -0700
X-Gm-Features: AWmQ_blGO7QUW6nBgXPDBNUnzq3Ln5ah_SLow5ox4iXfcHmzA4G72ZsuhQ4Fq80
Message-ID: <CAJuCfpH1Nmnvmg--T2nYQ4r25pgJhDEo=2-GAXMjWaFU5vH7LQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Guaranteed CMA
To: Christoph Hellwig <hch@infradead.org>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, alexandru.elisei@arm.com, 
	peterx@redhat.com, sj@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, willy@infradead.org, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, hannes@cmpxchg.org, zhengqi.arch@bytedance.com, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, minchan@kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2025 at 11:54=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> Hi Sure,
>
> jsut as last time please don't build empires with abstractions that
> don't have a single user, and instead directly wire up your CMA variant.
> Which actually allows to much more easily review both this submission
> and any future MM changes touching it.

Hi Christoph,
I'm guessing you missed my reply to your comment in the previous
submission: https://lore.kernel.org/all/CAJuCfpFs5aKv8E96YC_pasNjH6=3DeukTu=
S2X8f=3DnBGiiuE0Nwhg@mail.gmail.com/
Please check it out and follow up here or on the original thread.
Thanks,
Suren.


>
