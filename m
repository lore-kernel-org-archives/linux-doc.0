Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D71CAA6E
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 02:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747621500; cv=none; b=L3Q+OMTw6kLkW2harlUgZGTyvlb/q2Edgl+OwIgSbZwiyNTVKsEq+z8YsaRtTADgZBjUD6CzVRf6R1r9C5LSDeMxRAsoMoZ8kPTg54uXxOFicSLAmv1CkL/0h9xaYuqxKeKM/9NMFI6q31vm1aTpkZOw1kqRayHlmfFtHQ7M7Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747621500; c=relaxed/simple;
	bh=F7HGraiKV0mF2w5Qamd6RAnQdl94gERga2deOiTZdRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuxQOSW8AcIf0chp5U3aEHMSN2BhVBnE+F00/CZ5i7pHM1aOgZ5+Dh/9aRhcDQ6dh0PBNjrxG4IG2ccMpcYQ+kQRsP4eDsLsDwuSgMb3MjsDNSbA6n9FJVAXb3v3lLDUy9NVWvA1u4ohxknpNyWNEy5u2kevtHm8FKCH7L8fDTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho/G3Uf4; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho/G3Uf4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb39c45b4eso557154266b.1
        for <linux-doc@vger.kernel.org>; Sun, 18 May 2025 19:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747621496; x=1748226296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7HGraiKV0mF2w5Qamd6RAnQdl94gERga2deOiTZdRE=;
        b=ho/G3Uf4NV+u/st7YHDy5/tgy/bTATi37vfXEYvc/Fv72TcGqY/sKw+FnSRd3C6jV8
         G3O+i8CvQdVncU35uxrnUOatCpfaduekGRSTaV71PP6FWMYcVMnn7kKVlmEnU37w34h4
         L6iy9TfyE4ssPoUwz2VHLJ0M86SEP+/E2rpTEycRSrLqYm7AEviEVq9d9zAQO51MF1L/
         wETQYFhuJzwNceznY7lkxB8IcLgStYYKiWR5tK4SM4yEAUA16QboOyQYfCg1EWR913vg
         fVm82Nd3t3a3wVzPsvLL2yW+EUGAYs4ylP68+IIcf2fUepNezUiaJem698GImJOI8gUq
         DZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747621496; x=1748226296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7HGraiKV0mF2w5Qamd6RAnQdl94gERga2deOiTZdRE=;
        b=vZZ/1OoA9UUeTIrwgHCQMe5QlcRDTqlU/mltWyK6u6Ow/wHRYIuZsXDSNnTOtJ/YRh
         k5GZz3nJwWxXRIrtaGwsCi5VcRTIAM6xIzwonxJG2F34h8pc8j004FB2vh2PUxarePwu
         Q9P9zc9qm9bFslHNnM0fZinJHa2HFIHJa+nbIGrl+uBigF1fgriii53pcOHqLhZTbf3b
         TQUI7Y0yoELjLHvuOZWObdykkMtoEJyrnl3vg0o6mG7ZD5UEDnnvjTFhtFBxSTgroZ8/
         oHwoMEUNN5WxL+LbmrkwpJT+p91SrSMd7GpDf/XEkNGcrNdQFAgzHAesq8HmNzcy9/49
         tG8w==
X-Forwarded-Encrypted: i=1; AJvYcCUnbCeJ3eHnegEHoH3BqXhLur/9lIbDPD48FCwc+YnEtdDZ4mWwD+Bhcv7vBUGPAO3TYPm+nXf2ies=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd7bsdsvlOT4BR465/o37t/VvNby1frTDReezjF9dhf4O/qESh
	MTKgtpN0C2vmz1+qLrMmuVd3qTGvQyWYcmWApX6gqvlzjinsf3tShyxw3faH2GgZhvEft0zfAXi
	twG6CpyKNJoUG1YK5d4i5vcNbHcALR9w=
X-Gm-Gg: ASbGncvjGELfKhgG4AWH0E8bRVgU8gk7sNrhBE9kc0uOMfO0236PkV+KPh1oPr6hGlR
	QeijnWCjJkvnxFuuOmCLqFXABrJWnvOSpIDHjrAKg/40uZeE85WlqoWXcodB1y3i7jteKDQ1CnK
	S4drEgAZO6K8lKUZ3uRamACF2BWDFtseAA
X-Google-Smtp-Source: AGHT+IFJfVGkESUqblOSRmzdJO+rvgq/miFLrld4r20pD/RshgydmTRA+HZ1m3Zc9HBZFNEUupn0/U+ojqSfZbgTXUE=
X-Received: by 2002:a17:907:7f20:b0:ac7:805f:9056 with SMTP id
 a640c23a62f3a-ad52d518183mr1040886366b.32.1747621496419; Sun, 18 May 2025
 19:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202505160627.WtzIIpL6-lkp@intel.com> <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
In-Reply-To: <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Date: Mon, 19 May 2025 10:24:20 +0800
X-Gm-Features: AX0GCFsh3W4Dxs7R_bRftXTDUXVSKjWZElATVMc2GXugQQeZuHfJDCqSKpBhlKA
Message-ID: <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning: Documentation/translations/zh_CN/how-to.rst
 references a file that doesn't exist: Documentation/xxx/xxx.rst
To: Yanteng Si <si.yanteng@linux.dev>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org, 
	Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yanteng Si <si.yanteng@linux.dev> =E4=BA=8E2025=E5=B9=B45=E6=9C=8816=E6=97=
=A5=E5=91=A8=E4=BA=94 18:02=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi robot,
>
> =E5=9C=A8 5/16/25 7:04 AM, kernel test robot =E5=86=99=E9=81=93:
> > Warning: Documentation/translations/zh_CN/how-to.rst references a file =
that doesn't exist: Documentation/xxx/xxx.rst
>
> I didn't reproduce this warning locally. It seems to be a difference
>
> between different versions of Sphinx.
>
> Could you please provide your Sphinx version?


I can't reproduce it too. My sphinx tools version is 7.2.6.
And it looks like a incorrect warnning.

Alex
