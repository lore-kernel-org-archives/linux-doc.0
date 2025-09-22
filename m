Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F22D6E69
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552929; cv=none; b=RL4IFTowaih/1MW5Jv8PkRPkGnL1NHSCc8wOViSjh87LUOyDe58q1+YdhSD/mICu2wjaKKg/K9jA5/1VakEfAaFDlKMDE+pgzbrgLFA5MyCr0xrxzHMOtZNbBlXpGAMnODZ+WM7ulRb0yi5ExbRyM+Vw1ANa1IEJbl3ZG+Cf31c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552929; c=relaxed/simple;
	bh=TvVveR+eoaL9wv+8XBbQic5VEQu2ToLre/5kbgHOc30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7ppRViD2QCCnOAh1ORSGVUWB7kodBUVhIObD9RtshXhi4Hg5XGyEBjD/3ggKTBsbRHBbfDFwhKI5f82JbWmpZXkxXP0X4KuvkJQxrJMKmTwAguyy3Mihb1QoJapsh0Lo5Y4lkBLrgJ8HuTjKDxOryOVsLkHZgDDRHKj34tbnYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=D6phggC7; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="D6phggC7"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ca7a71adcbso9188501cf.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1758552927; x=1759157727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvVveR+eoaL9wv+8XBbQic5VEQu2ToLre/5kbgHOc30=;
        b=D6phggC75WT2Fe3DKiGdsn21CO4wh6ZCJgmbJXXaXQzGSycVC3nWY/7BcPwC75GYJr
         l7jcIhtFXYUfeyVpFRUYGt/Gq20k55t6C9kAmV/kHC3bFJOp6Hei2rXr9vGgECuCxfvC
         zYcEGmixn8wp8Jj2SM5yPbc/x6GAOcwN0tgvzXXU1OvWHFqtanYssKdUHt9wGInm6JTu
         88EURAfdEY7wvWm8TA7nksLsohle4MUeOqTfEbLuX0TA3wx8Olo3tHwVnbMne+6EQ9N4
         hoQp6WvvLNq+Pit3VOK9GvSAfE25HSQSLO0XrDOSN9hd5RN9nw1Nvcnbs9cwPVzs31wl
         v11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552927; x=1759157727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvVveR+eoaL9wv+8XBbQic5VEQu2ToLre/5kbgHOc30=;
        b=ARVtnakh7fy87anUzuD9faLQYTBKgH4NhMulDIYaMyC4XHzlBOeXzmdDIGYZO83rwt
         LjLawDmXDRW0abOA92mLgDETL2wd+EashoZbnMqQcBz0giDip2aSdJd+SA+qG+kxyF/T
         SWpHa3bBGbr6Rzw3akCK7K0nc46mqyhnp5p8nCkt3k3/+s0sdp+M/kuUlMdsgkNbv8/y
         6CSreLqhUaZndNhiP/96rHUNwNsdevcv5m5JYAaTa9CTMwwZ3Xhv9XKTEkrM11ZCoRcA
         h9ZDsklNgqUePsmYJo+Cr6Mrf/d9z0x924ObGhLlw6lYgUvOQUJwd8e3QdLn2wvChW2P
         38og==
X-Forwarded-Encrypted: i=1; AJvYcCX9+7DO1CBqwJM4DsxkWeVWEkSill/0TuWrmwj9tSWeVLNJ4dAY1NBCKyTpnu1X+/VRcSm9frZyMtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6M1il1ysLBnUs46tDvPBIjvXz1O89tvZJqTLWSme29KJvjupA
	KRIPrzfaZb+erYjXksZfEfFk/n7iXoeCtapYQcQ3tmdSX9tdZZmh7iSos0BYK1Bch5LJu7Q/iTL
	1NGPN6aTJBA7Nj3rKV9ym6KIaH8+kmPAKRq512fZFDg==
X-Gm-Gg: ASbGncvnPLKj7jxDsaLqwQfE9VN4H4R5nkQ8iQC0ZMBXbg8Mw74jFSJwetKi2HmlpWd
	NRjPix4AkocwBzylUVsH7LIsCguuBjWlSKqVSVUVi1UH6iVIctwVX9G8H34F1B98IBSWDnxYuy1
	+NqtjJ4r/4uBHTmARvaL0iixuosaBi2B4XDzvJXYzBUbpMhuFgpORmEj2+CgPRhzzfYkjBBCDue
	iGwjwA22UW/lb0=
X-Google-Smtp-Source: AGHT+IH/maFhVZagCabAuRpSyzOdLh5RhCtxYHTL9INMkCpwFUrFYMQXEcKIhCuCFYP9Ni4pPChjhYdVr/+VltB6kGE=
X-Received: by 2002:ac8:5f0c:0:b0:4cb:713b:6f08 with SMTP id
 d75a77b69052e-4cb713b74cbmr35760601cf.34.1758552927041; Mon, 22 Sep 2025
 07:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-10-pasha.tatashin@soleen.com> <aLK3trXYYYIUaV4Q@kernel.org>
In-Reply-To: <aLK3trXYYYIUaV4Q@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 22 Sep 2025 10:54:47 -0400
X-Gm-Features: AS18NWDwJiLL1FUZIWpx1NLSWLJKu-G0z1HFpnmPi4SdOFce-N6qgysbpZBTW0s
Message-ID: <CA+CK2bAC_X2ONEaT7XYVwjB=fdN897JnmVnt5f+UELbuKR+-0g@mail.gmail.com>
Subject: Re: [PATCH v3 09/30] liveupdate: kho: move to kernel/liveupdate
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 4:35=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, Aug 07, 2025 at 01:44:15AM +0000, Pasha Tatashin wrote:
> > Move KHO to kernel/liveupdate/ in preparation of placing all Live Updat=
e
> > core kernel related files to the same place.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> >
> > ---
> > diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
> > new file mode 100644
> > index 000000000000..72cf7a8e6739
> > --- /dev/null
> > +++ b/kernel/liveupdate/Makefile
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Makefile for the linux kernel.
>
> Nit: this line does not provide much, let's drop it

Done.

Thank you,
Pasha
