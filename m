Received: from mail-pz2-f11.google.com (mail-pz2-f11.google.com [74.125.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD03F1055
	for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788053600; cv=none; b=GU/XeVNQsxbEzxSs2MIZ1BQ0W6siEWiVq3YIdEErA02iJ19c4VUfWffHPSSI5CmbptMeJKwXZouTxnxe+2iMlAsS0CoRbvJDAppiIs3rkKvfpAep+rwwTK1eyH6yXNHv/OKDFMPOE1wFkZKoWvvns4gI33VIFHCgHvSMmgGunPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788053600; c=relaxed/simple;
	bh=L7IW1tp/lGDKRsN936NmztOL2L700ArRooNqrimHdTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwmMZIyHV9RuBSLndsdC3zxwX8GM3QGWb8Z2wGzMMu5C5sgeYif8uGspfiRBBtIply0tH3x9yAY/SKD8OXOX/jQiPUc/buaeVlCnTLZ2IW4L6UVAxDEJvYx5VrdgbNRG8Zwuj3pUdXE7YsvCeiFflIRuMOB+VsyLSI8vIoEkXck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GssOtfoO; arc=none smtp.client-ip=74.125.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GssOtfoO"
Received: by mail-pz2-f11.google.com with SMTP id 41be03b00d2f7-cc1c2963c92so776413a12.0
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 18:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788053599; x=1788658399; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uemCnbI4NOWffBqE2fLB5b76TLqLWSQp97k3pFWmors=;
        b=GssOtfoOTwxohc69IRbUYnIbUvU/Vqc3OQvX7jvHnq8s3s59j93eyBGrZO12fd8Sf0
         otLF3+AclXlEMQ4sRLGg0IzL3K9DYJ0Mz9CjJLQ2FHJBCtDoeD4a4qyK3WIuqtmOQuD1
         euI9fhMvtXKvGxtOB0z6MX0+fHN4RWaQ7ma/9tzimH/XdHPRLT7GflbCqGqcMalgUu3A
         AHa372xoXjM3ey/k8Gkvny5l7fcwbuP9SCFmB+RvmkHfI+5BF9TSJxLiLUHA4PINFtsY
         Y47LXwBt6IERM/ej0X/WuMYY1613rP2Ljj1lWmfImgHPbOIOMcPGou95uPxpZUHDafuT
         hseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788053599; x=1788658399;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uemCnbI4NOWffBqE2fLB5b76TLqLWSQp97k3pFWmors=;
        b=TEnA+ESWs9pL4PjoRSjnIL61crpAwTnC3T4aRFS5HhuEpcA3Pae08TWKQBJjYsi5Gc
         l6Srf/Xs4x0p1u1Y7m55Gnt32G49ilrzEOP03dMBbLZPjRMBwEzyTTGnswMKQALikXDP
         HJ+4NNOiGVVglFeJO+PKq1ghoAVz5bh9zCnyptMVv7cOr6JLeXPYaBfIVtJ8Qv/zsCPP
         rMhH25Zl0g2T0+Opg5Euaz5OwY+J8ANPj6gvNCHoBmPvJ/xdrvzh1q+eVnGM8651Xd+2
         mklEXV3+jbjurWDsZXZ4YRVlJB8EfZySPPBOgDjBirLUtZnFU6Lk54lT5NGsnshH8kYv
         fEXg==
X-Forwarded-Encrypted: i=1; AHgh+RroHynGIcGL1poiB8s2pY53P7o+UIY/DPN+M9R4MbTnEz1gZRaKKHOyk7s2Js8TKIFDcrDUymiVpTw=@vger.kernel.org
X-Gm-Message-State: AFuF++la4pSSuKiUkJGPh+mkJXaSag0zFSJ+JqxXIiH9bk4sY2gYBQBb
	/zNbIzA0naX9HIkMbkNt5k+opEayLHPDryWKPpQs4WeC2fYRW1i+AiSW
X-Gm-Gg: AR+sD11rS1G2rbKP2DF77DCRxZGtNK7FuI/jFP2x6JvcCjdhTvM0eM7oqMPSX0LNmmx
	TwumdU1/r0HPv2GAcpt2QLsGe/UD11M1VwnUxDDlTc8IfA5pvKzq1N/+esKIm/euci+XDAqRyWm
	ABK6L/Wmv9fZJ5DU5scnj/1p6wLyi9jy4BhWUA1SyyQa7aKLPkpR32pClHrYWekzwVsC+IsozPJ
	sNhpra+C2qDgDE9DTdj7GyaCU0oRUYgJwWDvr45PBNAsyhAqLe3QGOXeboghNc+5kdGosbAeHNy
	Z1C9cLA8qDkyxFxQ9nDt2EHcLU39yRGqMzGNPF0QE0lRzQNPm59OF4suoCzJcqBeP0W/eSLFGhR
	qUrvowDqMwxGE6NYx8p5L651wyDuBHXcHSSv19Psa/RsYSMbx75s8Kv/vNBToPBnx5GDjDZ3IJE
	/K6jtm7NQBYGOAxKd864xGtqOoBk4H7gNUCsfmyWqqg5qkgqBwh4qsUHCpU/iLgAWKLcUzKgJle
	6rVKw9jZsQDDQ==
X-Received: by 2002:a05:6a00:4f8e:b0:857:73e2:9102 with SMTP id d2e1a72fcca58-85773e29356mr13611225b3a.18.1788053598822;
        Sat, 29 Aug 2026 18:33:18 -0700 (PDT)
Received: from hppc-archlinux.localnet ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea798esm1818145b3a.32.2026.08.29.18.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 18:33:18 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Date: Sun, 30 Aug 2026 09:33:12 +0800
Message-ID: <f-IgWNAyTmaoW34tfNxIvg@gmail.com>
In-Reply-To: <apL7ctZhcN5t77Yu@wyuan.org>
References:
 <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
 <apL7ctZhcN5t77Yu@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Saturday, August 29, 2026 11:32:02=E2=80=AFPM China Standard Time Weijie=
 Yuan=20
wrote:
> Hi, it's me again ;-)
>=20
> On Sat, Aug 29, 2026 at 12:15:10PM +0800, Yukai Wu wrote:
> > Update Documentation/arch/riscv/vm-layout.rst translation.
> >=20
> > Update the translation through commit 954260ff5a46
> > ("Revert "RISC-V: mm: Document mmap changes"")
>=20
> Somehow I guess you didn't get the actual meaning behind this "Update xxx
> through commit...".
>=20
> Correct me if I'm wrong. If you write this line in your commit message.
> Then it means if we apply this patch of yours. The Chinese documentation
> of this file should be already _completely_ synchronized.
>=20

I agree. My fault again.

> However, the current translation of this file is missing this part:
>=20
> RISC-V Linux Kernel SV57
> ------------------------
>=20
> ... which is not translated/synchronized in your patch.
>=20
>=20

Didn't see that because I just used the tools/docs/checktransupdate.py scri=
pt,=20
which cannot see the commits before ed843ae947f8 ("docs: move riscv under=20
arch"). That commit just moved the Chinese translation but was treated as a=
n=20
update by the script. And I only looked at the commits reported by the scri=
pt.

> Note that I'm not blaming on you for this. But I feel this is a point
> that a newcomer might find confusing, including me and Chen-Yu a couple
> of weeks ago, if did not read the script.
>=20
> Our current how-to.rst only asks to write this line in the commit
> message but does not explain the results or the actual work behind it.
>=20
> [...]
> 	Update the translation through commit b080e52110ea
> 	("docs: update self-protection __ro_after_init status")
> 	# =E8=AF=B7=E6=89=A7=E8=A1=8C git log --oneline <=E6=82=A8=E7=BF=BB=E8=
=AF=91=E7=9A=84=E8=8B=B1=E6=96=87=E6=96=87=E6=A1=A3=E8=B7=AF=E5=BE=84>=EF=
=BC=8C=E5=B9=B6=E6=9B=BF=E6=8D=A2=E4=B8=8A=E8=BF=B0=E5=86=85=E5=AE=B9
>=20
> 	So when a newcomer comes and just does what this asks, without
> 	considering whether his/her/its translation is completely
> 	synchronized or not, our script would be kind of inaccurate. ?
>=20
> Maybe we can add a description or a hint like:
>=20
> If your current changes make the translation completely in line with the
> English version, then please add this line after your descriptions and
> before a blank line and your sign-off:
>=20
> Update the translation through commit e83c5163316f
> (Initial revision of "git", the information manager from hell)
>=20
> ..then follows a template commit message

Allowing partial updates to the translation?

>=20
>=20
> Any ideas?
>=20
> (Should I cc the original authors of the script?)

CC the authors of the checktransupdate.py script?

>=20
> Thanks.

Best,
Yukai Wu



