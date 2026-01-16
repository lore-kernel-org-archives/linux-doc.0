Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B561F92E
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 18:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768589144; cv=pass; b=QOUl5+ZJk0XfQ966ODqXttcOV8JJcUZIFAKiwzCRx4cmjzgkuVnp1YT0PyPTS042KcDda6Ejy2dMTfCPoNQsESPETT84Q3aN5FSu8K9KpBpxHb7BQh1x3K1Zt8yXCXAEx1Xe8IyPa2vKE5Ntw2bQGifPk2x+Or4wKi9B+FKn6Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768589144; c=relaxed/simple;
	bh=hMmiW8zfRsv2dvkHvXYKEE/1e1KgEYzpKKHi4QV047o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXfyF9L3sSSl+aW4GTaxxKSpOYoUpdDJnZDwQiFI3hE2s0DdFrDyqIei54f/U20Jh5a/zTrs2ROfwcxaPh/LrpvCn+GGte18x0ZdgW6FsQRt0n3zclaiLtN0gPuA/3FV/bpMq+AlVQ6Hh2Sd72JUZ/J1oPGs1E+laj1uM5CdHKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0dKO9GNo; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0dKO9GNo"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5014acad6f2so30331cf.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 10:45:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768589142; cv=none;
        d=google.com; s=arc-20240605;
        b=hfdsrEO2CIW2OXOO45sAatCxf++EVp7RnXMDGaLCyUfscgbKmOoic0sfJy9b/DH9yq
         qll2kwfgJngNCJ3QsPoT+TMG8Z7Pdg5g3YBCXVIZBmb09B6kQJEX6jfhBUELEcVc591Z
         JX0hB5xbMr+dk32uastwNaee4s1q0782O2hg0+BgR9M62N/yVyi1HhOVuQy5rLK0gQuw
         VHWTMkjh44VHrhUBTNRP8w/QEx4GuoAkwl8fHVGnwzp9kpejwGLI+eFw1WWvD17jxePQ
         B2srcOsKT2YtN/ho/d2vnC8zCxL6LnH9chEd9DkIz8bPRqQW4eTIMw7PwDk0yzRaseCS
         zQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N6bLqjwmicKmcvJcfCMzcrC4HuJd8fUxKurXeY12ItM=;
        fh=5AXCT+DoGMoBe45NhNBuVCheXtdH9Pi3EKNoutFo2yg=;
        b=k56BQecVkG28Ss1x3EeTi5tV+l5TcuHXHu8VrxWk4q/MzSjXRTmlyhH2RFrVlygqnh
         D7ktQgcCMlcRlOF1ze7ysz6N6aE4r300TI1gI7AuCQE/6l0wEOnf0D7cqaTZfAB2gfNj
         V3PeY+OfCQCt42wJcwGNOgXiFPoj96z3reGcmpLJBg4uuwcDTHs3apjY4H5gl/KcZ1p2
         J4R1Xhpjol30C2fUYbL6hb2l5Of7Secg7KmjmnruJ4n8+gGnpumadtbR+Ng7j/satbPy
         4YIfrA6BwCiwvLyGhIOXHnIVmaphHN9fQr5xw1UBqbIxvBI8ySuxaM8R4AVwc1BBLQxO
         34gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768589142; x=1769193942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6bLqjwmicKmcvJcfCMzcrC4HuJd8fUxKurXeY12ItM=;
        b=0dKO9GNosxJwKOhDFPCxbI1v6KtQqJGOSN15jyPdKJGAgNWorYyaWau1wdmq5CQF4o
         u1E6tQcfqxZct3D7nKj+gOBXqZTFHI6fpNh1G6s3AmjTSeg8rszn4vbKk1CV43zM6khn
         rA8ql4i0FkaFE2oe87/t+s+wStgHZczBN1LRDDJwQMqGnGRVWQr5GGmqZDPFX2OAofhg
         Xgoo2pWfBjGkKFXkyyIakCYZHW5AG8dDetCYrpR9cqJtuNpTPfvk8X5sfp+FZwQMhCRI
         X6/j8yWWoE8T+IUIBwrkYxgWdj9NbsjHMKL8wXKaLPQiVqhd6qscNd6kulc0pG/jJu5E
         zmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768589142; x=1769193942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6bLqjwmicKmcvJcfCMzcrC4HuJd8fUxKurXeY12ItM=;
        b=dyaKBqsr99fxc87lcI4/GsbCFiNK4LHrdntAlnGZWnOPhRCcQAP2ZjeBoLzkQCu0Er
         TYTpvRMBkh6ANobugI+YxlVdHavMtmUDrZgCaVSz950o0xEcR3nZqB9ah+Wwd0ieNMsK
         ikDeRKX9TGcNaZMIMFIqxkp81JCjo1RgZISYVy/F03Y7YiGAlogXPbRa3BzR5w68GGRu
         IYp+yQMi/rsVjvYT2UBNpOhBvhQdP0voDpzAUMsniT1xNGVsGMaGu+620FjoGLPy34jK
         xd7kfukTteady9xUvOSJWThzrCiNgVKdoEsNJ+lgV1HIlPHPkRHGmtnEWpgM/pA12M3L
         K27g==
X-Forwarded-Encrypted: i=1; AJvYcCW0TuHvZqMOXKpbkbthdvZnsSDsc6EQiePcDbPqzmkZ6WBB43k6Q6ckO2dNT1Dav84XSeSRO47kHp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDruttyD/xGTN2iB19sQSHdLF3afEXM9jcaH5DO/vC0RlZc3lc
	XfmvNC+oowNmZNB3DkvyP2y2o6TkcyBOScfj/SGVTVuBqzaJPKhAwXJWICHRhOnJQPfUGPORqSo
	gx0fktIZEfXjEc+ZK+OBodY6IcoVRDlZ4+4V2rvRf
X-Gm-Gg: AY/fxX5TJY4jaoTb62wR6qv0D0uGRg0KhEyY3qCFU0XjpP6hRDtfUyvuDaJECxX9Lwe
	e6Gbry71ct7g0Xz908sdEDyN/POEtsb9yh1WrqWQjKkGWsnd54rEPJA/MT7pcmQpBUbbd2tIAKZ
	XQ6XG0uZ576R3Db15vUXBp7d/7K+IqP8KBuXFbrn+icor4xYld5wiw+51Rxh6tm8eEDdQKyvcXe
	AnFWwFN2jQIOWQRlo9jdXYQYe3aFNoV6emQGKbH7pOvN6xoBcHnpo00L6UdbArAt5MOBg==
X-Received: by 2002:ac8:5a08:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-502af8fc780mr566291cf.0.1768589139933; Fri, 16 Jan 2026
 10:45:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpEQZMVCz0WUQ9SOP6TBKxaT3ajpHi24Aqdd73RCsmi8rg@mail.gmail.com>
 <20260116021835.71770-1-sj@kernel.org> <CAJuCfpFevUwXxwOrpH3+VOibjJw0rBw3=QL-nqeKreNEky7_Gg@mail.gmail.com>
In-Reply-To: <CAJuCfpFevUwXxwOrpH3+VOibjJw0rBw3=QL-nqeKreNEky7_Gg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 16 Jan 2026 10:45:28 -0800
X-Gm-Features: AZwV_QhozlK7uakvTFIi3gMT5z1ESm9uu7kKs6NCK1JEMKW6K3c69hS_mesSIW4
Message-ID: <CAJuCfpGS_Kw7O1tTWAVs_6dHMPjewh9NLSB2TNRTKXTcwbq0xw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Docs/mm/allocation-profiling: describe sysctrl
 limitations in debug mode
To: SeongJae Park <sj@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	kent.overstreet@linux.dev, corbet@lwn.net, ranxiaokai627@163.com, 
	ran.xiaokai@zte.com.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 10:30=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Thu, Jan 15, 2026 at 6:18=E2=80=AFPM SeongJae Park <sj@kernel.org> wro=
te:
> >
> > On Thu, 15 Jan 2026 09:05:25 -0800 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> >
> > > On Wed, Jan 14, 2026 at 9:57=E2=80=AFPM Matthew Wilcox <willy@infrade=
ad.org> wrote:
> > > >
> > > > On Wed, Jan 14, 2026 at 09:45:57PM -0800, Suren Baghdasaryan wrote:
> > > > > +  warnings produces by allocations made while profiling is disab=
led and freed
> > > >
> > > > "produced"
> > >
> > > Thanks! I'll wait for a day and if there are no other objections, I
> > > will post a fixed version.
> >
> > Assuming Matthiew's good finding will be fixed,
> >
> > Acked-by: SeongJae Park <sj@kernel.org>
>
> Thanks!
>
> >
> > Fwiw, the typo is also on the .../sysctl/vm.rst part.
>
> Correct, I'll fix in both places.

v2 is posted at
https://lore.kernel.org/all/20260116184423.2708363-1-surenb@google.com/

>
> > And from the finding, I
> > was wondering if it is better to put the description only one of two do=
cuments
> > rather than having the duplication, and further if the 'Usage:' part of
> > allocation-profiling.rst is better to be moved to
> > 'Documentation/admin-guide/mm/'.  But I ended up thinking those are too=
 trivial
> > and small things.
>
> Yes, I didn't want to complicate reader's life by adding a reference
> for a couple of sentences.
>
> >
> >
> > Thanks,
> > SJ
