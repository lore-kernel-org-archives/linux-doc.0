Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B0305059
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 05:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763359084; cv=none; b=XonnB00gqO1r417y7quBUd+gitaRKODPg7DiCiw0SXsqssiWcvtIBpTUK27dwU72QsIIv6wcqjiinzmGtJb6pnK0679r4URJc3KJYtsU2scKSP0jVe7swDYXrrPDWtonGTc+tCfl/NMbydO7kTplk8C2M57g0HR03hekUkyuuR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763359084; c=relaxed/simple;
	bh=+q4LqD2Kvx8jkQo2nfmTYbeHEY15owippezqEVwV2Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ua+rjKuDngRD93VOvmpA5q4NzxnVzMes6AlaRE98+3k7yzRXFvuZqjRkeFBuNi0vee9ULv7mBL8MaeIKyO+4tlCaKOGnNDPj+oEQBUjYYxlR6+4poTkR5KQF4G7y8d8huHmtrqsxv+BI2PD5TXTrs5jLIYb2SZ6xPVVHSFjr4Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVYYNyhF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVYYNyhF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-298250d7769so25579825ad.0
        for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 21:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763359082; x=1763963882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+q4LqD2Kvx8jkQo2nfmTYbeHEY15owippezqEVwV2Ds=;
        b=UVYYNyhF9XuDBV8Voeu4Tjajs57obsgTRKvR5S/ML1P5UJQftFJv19oIvzOcpBrezR
         YFw5jj2ZeV/SowkFwc3Cv1mCOZdIbNWnlJROJjqY7rxPCqpfer3Kzw4Vbr/ThLFwqs3r
         boK4w1vVZGynVkjRPnZCX0CAPNwfVdE32TqxP0hNtkVLXtfYIc1Q49cBOVipZOI5Algd
         u9sqzb46xUo56Rn8EnrTNqdmVdKizNUykD/CDfc2lzp6rT4fzefhM9FPcypeghasytaA
         2cUA0R4Nr4RykAlsoIBc4tihdXDe+ALYNRbV28aCE0bWKf/dn9Lfp8EbvGmhHi43sCEx
         e9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763359082; x=1763963882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+q4LqD2Kvx8jkQo2nfmTYbeHEY15owippezqEVwV2Ds=;
        b=BcWL70jyFAbPz3pFiwxVP8qItdaS9ETlz0F4Mfu9NpbPIUFD7K2PJQLybFTp6kMvA7
         UMhF1XbQnwTz9Lz6gDzjEN49OuG3HDUHoEo2rwgzV6i6CKKxJ1OvnLYXFNBGMnA36Psb
         ARR8f5MEmvZyC5WowzJ/wgoGE/LB2MfoMFqV0ZF/QoeRtaANCONGsrWwwerNAuPdf1+c
         peevFxker+qc5K4FHV7/vXF+TaMp5M8UkZemX3XDVOctrst4os2HsJJEThzVXns4MP//
         YEv+RRamxNAv617scLKZDiuvXJmJ808YBcPiPi+X3TepLuMj8WAmGe0DctwG40/T/hvU
         efdg==
X-Forwarded-Encrypted: i=1; AJvYcCXdmnYJUkQjfEuhEt5NMQ9+by5rot9gTAKb8YClzMvWv0UK6FJyeV3sE/QcOM3oQe6EbQorqiUjmvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCvpDJBBB2pKPP946YxRsk+MG1BCLenoDOgdWbbPT7c5fF7ONj
	18ta84+2eRPt4tD7/lqIxu3gYc+4P0lmnuJ0acRlLfd22idnhooFaKaPSU1XEnGkkQgxXAJxK/v
	T0W+d1TGtZBmnQ9iUMc/Q5h3Me0fXZLg=
X-Gm-Gg: ASbGnctaGQeqUnRj82MGmTzb84gMytsD9b3ZRFD3jyO0bmdWtFydAXYu70h4gRHt9RN
	MAtj0Am9nKp7zvyJXz+gEMKJZ+pcnGsp8QqV2L+IxKKmGlI0HZi1QhPmwwxY8TP51fTUJdoPlvV
	5vuoC1RSzitqPgC1EbA+sxFFUm8GmwGqpmL365l+bB3KJYkOtcSvZEc83SHv13S/xLS8xv9Hj46
	rUXnH62d7K2XfUqudeIbN/QpJJ6GNSOc4Ie0/fzlIg1a9WLgLBD5TnApEwrJXbpLao/T8pwE0Rl
	E8/+vg==
X-Google-Smtp-Source: AGHT+IFf+SziYRwB4AOk+V/V4rMZUh1qRahloBklIwWej8cNHCooyk92qFv7IuTK9p1nwyJpsVpLsH5QeyOIQgjIq6w=
X-Received: by 2002:a05:701b:2513:b0:11b:ca88:c4f9 with SMTP id
 a92af1059eb24-11bca88c783mr1439206c88.2.1763359082251; Sun, 16 Nov 2025
 21:58:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106015148.54424-1-zhaochenguang@kylinos.cn>
 <7e6096ab-18bd-4438-8fbb-3f530ee9e69f@hust.edu.cn> <CAJy-AmkC_UBtk1VmmVOG-Y_UB4kKAZ9rq+3U6r==A1HVDjt9vw@mail.gmail.com>
 <CAD-N9QUUHmuC=jT+_mVKhMDstrb+9_-g+2zSKD3a9hrCtYnk1Q@mail.gmail.com>
In-Reply-To: <CAD-N9QUUHmuC=jT+_mVKhMDstrb+9_-g+2zSKD3a9hrCtYnk1Q@mail.gmail.com>
From: Alex Shi <seakeel@gmail.com>
Date: Mon, 17 Nov 2025 13:57:23 +0800
X-Gm-Features: AWmQ_bltgnH4WZZaiCxuxEJfMAzZnpDhkZUOTWXZ6x-xgff9t5d9Ld5DWvT9RfA
Message-ID: <CAJy-Am=FXq2yEg05YNuYpd+BU+GSQiHQUmN+o5exCNsSQGrViA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add kbuild timestamp Chinese translation
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Chenguang Zhao <zhaochenguang@kylinos.cn>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dongliang Mu <mudongliangabcd@gmail.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=881=
7=E6=97=A5=E5=91=A8=E4=B8=80 13:54=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Nov 17, 2025 at 1:32=E2=80=AFPM Alex Shi <seakeel@gmail.com> wrot=
e:
> >
> > Applied, Thanks
>
> Hi Alex,
>
> Please revert this patch since I do not give my reviewed-by tag

Oops, Sorry. the patch reverted.

Thanks!
