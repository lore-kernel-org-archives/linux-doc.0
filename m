Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767D354AF3
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768431313; cv=none; b=OHiYZJj8azvdw2tKVKDp7ymqIQxKYHBWfXR6DaH7qDO4PuQ6Q/NR9ipNnQ9s/6L8XFYQVn+K03GK5nzlmDPX+RBs5N/23+IoPj9nhm8MSEx2Idebuo2nnzJw3QRUau3O35jqGDNvgUaeCYOP7m7vDEkD9V+882YlbQHYxm5Dtvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768431313; c=relaxed/simple;
	bh=V1py82AjhxEE3vmI27KtbVxIIIMpzO9ROtiUPz6KBIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeqnAR/a8QBmiY/HpU1Fz6kI6xNq862DUBmFUziLPR/JOIL/2Y1TuO0alFqY+Bk1bLfn+CJE8rQEVUAGvuHiYcryaowe14yBSh+K8kglwBVZT+HCAWTPi1lnbDrYDB/JdNO8sTMD1QCELzjCiblnul7w8TMDGd5IpCtsdrjjsmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ULLpnZ13; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ULLpnZ13"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64472ea7d18so175052d50.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 14:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768431308; x=1769036108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3aA2X7iGQsnnel6fRLVe4SLr2+v2d/5zouhV3Vlqcs=;
        b=ULLpnZ13u0uAWoBNOyx2pQX7xk573XQRxshqnkDODrBfdlOGHdBLeiGjQUMMJ7e0MT
         yaxOaIMTKucIcX4OfsR6gfN1eFNdXT1pWQSb1rBy3+hTxxs8BpHH9ujUcKvWGon++zOc
         frasvVhgblBEFDQvNS4s+VdZbgKRWfLOdyvLVXZKdXMyjGooin++rQelFJ+Ai0cyIWdj
         3nXmWjRLOcdLlDhMrPX1xyFazfSpsNB1YbCdAwXXgzGP0dxA0Aj6b1/FYPc28C0wygDL
         gFBm5ONEJLhsh0on5iB1eim+lHgZygUTwvX5PlvB8Fv7BYrr1aiO4p1zyYFyQKfiKHOu
         f66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768431308; x=1769036108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R3aA2X7iGQsnnel6fRLVe4SLr2+v2d/5zouhV3Vlqcs=;
        b=UBlKk1M1shFYS/gPNcP1qWCMHfO+2ArT2TjBa6MEwmJxWjStjLLSEjBL0QIWJgsHEh
         whLNGr2aFp4ZwpC2tDKMNVmqnnE0YY9a84yZW1tVMw4r7TFH+o2YLUhp2s1F0PG0vWwl
         /qKTbBeImSva3eDq8WxZ9IOloHjTdaz5fHwD4FVS5Um6ZKYwtAkjhs5kZzBakzaGCTH9
         j5W05t++xv2rzh+tnsupfKsNv1U3HTjWYOYhHPHI08lSS6JTFUzQknpAGPk+Nv5U6+m/
         FAYK7+Qi22ogaK4Haxc3C7Jt+eEbVQf/mBVlY3yPBm2mvkIlO5DzVtsD7AU2Bf9wQh5B
         gZTA==
X-Forwarded-Encrypted: i=1; AJvYcCUCSY5R20Vc13N1WkmzKtbwb6NWGMZ/8T2rkfXmsnDFm7C1SsKWSc4yx+7y6VX+vNz0qGmjw2gT/sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVppkNPpB8xlo/yvuX/q/jQGnARZaVxpr9Bfu7SljtyldfSPyv
	WKXI6N04C2e2w8qN1kh32akaEyWqHgzKb8Hg33LnCIcZLopAZh1u8TCp2hHUOYEOHSazQyzugE4
	tLQVxirEYBObUoALM0LYypOMnw8ahFtDo8onSsqTHdQ==
X-Gm-Gg: AY/fxX4POuZZjP+eQ8MTd6McE3n+CGQmrdEjsbx4j02AQO7y3DMoEcdH0u0lnSv807c
	sVMSjPz/Hhyxyu/aoYP2h/Qbwg5Bxlkthj1IB3TSUU+lfSPhZdg54rUk7tQpG469G4hjzMMujTK
	nk+FTBkXiSCQeJ/ZNMwX53n95weLqPqjTgg2VLi2DS3+voofU5BXhyPOxDhPsMg+KygRpWOPd+U
	VTAVL2awD1B3nwkj5s0j9Q57+IcejPsYGtf62rDg+dx1NbWrS33NOpmJ5nOBnmRgubCPYWDwq0A
	elYntV59/HH+68ofs0g0rCnrMoF6n0ft78zWrg==
X-Received: by 2002:a05:690e:b8d:b0:644:77bb:5705 with SMTP id
 956f58d0204a3-64903b55ebbmr2982962d50.77.1768431307959; Wed, 14 Jan 2026
 14:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com> <20260113075339-GYA25466@gentoo.org>
 <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com> <20260114-evergreen-gluten-b1c8558e7684@spud>
In-Reply-To: <20260114-evergreen-gluten-b1c8558e7684@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 06:54:57 +0800
X-Gm-Features: AZwV_Qhkxzj_Y9cwaD4tSP0GMlfoxTMZyhjGCrw4ED-TcUztP4RUDmlAh8THzag
Message-ID: <CAH1PCMZAEwO4Vg=TdZ9SR1uwm3OOw_y79iCRC+E+SZiVRNtp+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:42=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Jan 14, 2026 at 10:33:34AM +0800, Guodong Xu wrote:
> > Hi, Conor, Yixun
> >
> > On Tue, Jan 13, 2026 at 3:53=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> > >
> > > Hi Guodong,
> > >
> > >
> > > On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> > > > "b" is ratified (Apr/2024) much later than its components zba/zbb/z=
bs
> > > > (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> > > > checking rule is now enforced, which requires that when zba, zbb, a=
nd zbs
> > > > are all specified, "b" must be added as well. Failing to do this wi=
ll
> > > > cause dtbs_check schema check warnings.
> > > >
> > > > According to uabi.rst, as a single-letter extension, "b" should be =
added
> > > > after "c" in canonical order.
> > > >
> > > > Update existing devicetree files to conform to this rule. Line bala=
ncing
> > > > is performed where needed to improve readability.
> > > >
> > > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > > ---
> > > >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
> > > >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--=
------------
> > > >  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
> > > >  3 files changed, 147 insertions(+), 146 deletions(-)
> > > please have separated patch for different SoCs, so they can go via
> >
> > Understand your concern.
> >
> > > their own SoC tree.. thanks
> >
> > Conor, is it possible to take this as one patch instead?
> >
> > It fixes the same dtbs_check warnings from riscv/extensions.yaml across=
 three
> > SoCs. Keeping them together maintains readability and clear tracking, I=
MHO.
> >
> > Happy to split if needed, but wanted to check first.
>
> I'd rather you split it, sorry.

Sure, will do.
Thank you both.

BR
Guodong Xu
