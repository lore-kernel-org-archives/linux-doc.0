Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879717557
	for <linux-doc@vger.kernel.org>; Sat, 15 Jun 2024 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718442731; cv=none; b=Y6u+OK6R4WKh6qdGyX42+Bgr9UdMkTt+OkRyIxMcDGYCrAdMDu9IHak2Ij/VOFfditZuhOAtbsG88tB0yItIG/9fp5jpFVJq7U3htulkprLql7FnKzl3nMaKBtKpcOVL7aiaDziKJniAnCY0CxOCRabuQ1oubLYrFjP+Svbw7qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718442731; c=relaxed/simple;
	bh=xEiFJhPyYjf6FQgQvuPA2INd03+uNiOinVlFyxfzEvY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=jjhH8mlCkn8hsZDanIZA65xN8GDC1k+VxdBmsDoAj0b+4EnSd7Roui+jgrDBhp/4vpacFGOPlVRc3rnIFmmtSUsmhPy1C6Ap58P5doCFTvxymLNkUIukBZFzst/3O9hvnRjpC5byWp3WNDY/vyu0YWczF67N+SkQEMcuY+yBvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qYVBi3Pn; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qYVBi3Pn"
X-Envelope-To: cuiyudong123@126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718442726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TT9jjEGuAmMYzwwdjc641UTlzSr9yKhMXCvAQ30rp5Y=;
	b=qYVBi3Pnf4JqktZXrJH4xvdSEOZQbO0nnBwfjMdodkU0QlFXBFamMg0Bp90R+1BNIT9FdF
	BIUzw5Ff4xm6sWC5aND21Hyq3adxF4jasamUuoijpExYppSW6AdXnw3cH5QChpv2QNaWpM
	zDtvUTM/QpwF6ZOG5HD1NDJEUvAjx+k=
X-Envelope-To: siyanteng@loongson.cn
X-Envelope-To: corbet@lwn.net
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: cuiyudong@kylinos.cn
X-Envelope-To: alexs@kernel.org
X-Envelope-To: dzm91@hust.edu.cn
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 15 Jun 2024 09:12:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: si.yanteng@linux.dev
Message-ID: <108742f67ec2cb7e34e2fc3476e959f544d54c2a@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v3] docs/zh_CN: Add userspace-api/mseal Chinese
 translation
To: cuiyudong123@126.com, siyanteng@loongson.cn, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, "Yudong Cui" <cuiyudong@kylinos.cn>,
 alexs@kernel.org, dzm91@hust.edu.cn
In-Reply-To: <20240614062633.1294-1-cuiyudong123@126.com>
References: <20240614062633.1294-1-cuiyudong123@126.com>
X-Migadu-Flow: FLOW_OUT

2024=E5=B9=B46=E6=9C=8814=E6=97=A5 14:26, cuiyudong123@126.com =E5=86=99=
=E5=88=B0:

Hi Yudong

>=20
>=20From: Yudong Cui <cuiyudong@kylinos.cn>
>=20
>=20 Translate the following documents into Chinese:
>=20
>=20 - userspace-api/mseal.rst
Let's add a tag so the script can detect it. just like:

    docs/zh_CN: Add driver-api phy translation
=20=20=20=20
=20   Translate driver-api/phy.rst into Chinese.
=20=20=20=20
=20   commit d02aa181ee59 ("phy: Add devm_of_phy_optional_get() helper")

you can run git log .../mseal.rst, then copy the first commite
message as my format.

>=20
>=20Signed-off-by: Yudong Cui <cuiyudong@kylinos.cn>
>=20
>=20---
>=20
>=20V1 -> V2: Resolved compilation warnings and optimized the translation=
 of documentation
>=20
>=20V2 -> V3: Fix code formatting errors
>=20
>=20---
>=20
>=20---
>=20
>=20 .../zh_CN/userspace-api/index.rst | 1 +
>=20
>=20 .../zh_CN/userspace-api/mseal.rst | 186 ++++++++++++++++++
>=20
>=20 2 files changed, 187 insertions(+)
>=20
>=20 create mode 100644 Documentation/translations/zh_CN/userspace-api/ms=
eal.rst
>=20
>=20diff --git a/Documentation/translations/zh_CN/userspace-api/index.rst=
 b/Documentation/translations/zh_CN/userspace-api/index.rst
>=20
>=20index 5b14721c8264..b7da307ec6bb 100644
>=20
>=20--- a/Documentation/translations/zh_CN/userspace-api/index.rst
>=20
>=20+++ b/Documentation/translations/zh_CN/userspace-api/index.rst
>=20
>=20@@ -27,6 +27,7 @@ Linux =E5=86=85=E6=A0=B8=E7=94=A8=E6=88=B7=E7=A9=BA=
=E9=97=B4API=E6=8C=87=E5=8D=97
>=20
>=20 ebpf/index
>=20
>=20 sysfs-platform_profile
>=20
>=20 futex2
>=20
>=20+ mseal
>=20
>=20=20
>=20
>  TODOList:
>=20
>=20=20
>=20
> diff --git a/Documentation/translations/zh_CN/userspace-api/mseal.rst b=
/Documentation/translations/zh_CN/userspace-api/mseal.rst
>=20
>=20new file mode 100644
>=20
>=20index 000000000000..598bb5f1562c
>=20
>=20--- /dev/null
>=20
>=20+++ b/Documentation/translations/zh_CN/userspace-api/mseal.rst
>=20
>=20@@ -0,0 +1,185 @@
>=20
>=20+.. SPDX-License-Identifier: GPL-2.0
>=20
>=20+.. include:: ../disclaimer-zh_CN.rst
>=20
>=20+
>=20
>=20+:Original: Documentation/userspace-api/mseal.rst
>=20
>=20+
>=20
>=20+:=E7=BF=BB=E8=AF=91:
>=20
>=20+
>=20
>=20+ =E5=B4=94=E7=8E=89=E6=A0=8B cuiyudong <cuiyudong@kylinos.cn>
>=20
>=20+
>=20
>=20+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20+mseal =E7=AE=80=E4=BB=8B
>=20
>=20+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20+
>=20
>=20+:=E4=BD=9C=E8=80=85: Jeff Xu <jeffxu@chromium.org>
>=20
>=20+
>=20
>=20+=E7=8E=B0=E4=BB=A3cpu=E6=94=AF=E6=8C=81=E8=AF=B8=E5=A6=82RW=E5=92=8C=
NX=E4=BD=8D=E7=9A=84=E5=86=85=E5=AD=98=E6=9D=83=E9=99=90=E3=80=82=E8=BF=
=99=E4=B8=AA=E5=86=85=E5=AD=98=E6=9D=83=E9=99=90=E7=89=B9=E6=80=A7=E6=8F=
=90=E9=AB=98=E4=BA=86=E5=86=85=E5=AD=98=E6=8D=9F=E5=9D=8Fbug=E7=9A=84=E5=
=AE=89=E5=85=A8=E6=80=A7=E3=80=82
how about =E8=BF=99=E4=B8=AA=E5=86=85=E5=AD=98=E6=9D=83=E9=99=90=E7=89=B9=
=E6=80=A7=E6=8F=90=E9=AB=98=E4=BA=86=E5=86=85=E5=AD=98=E6=8D=9F=E5=9D=8F(=
memory corruption)bug=E7=9A=84=E5=AE=89=E5=85=A8=E6=80=A7?

When the term first appears, remind the reader of the English version
of the term.

I don't know much about it, but looking at the explanation behind it,
 it seems to mean =E2=80=9C=E6=8F=90=E9=AB=98memory corruption bugs=E7=9A=
=84=E9=97=A8=E6=A7=9B=E2=80=9D.
>=20
>=20+=E6=94=BB=E5=87=BB=E8=80=85=E4=B8=8D=E8=83=BD=E5=8F=AA=E6=98=AF=E5=
=86=99=E5=85=A5=E4=BB=BB=E6=84=8F=E5=86=85=E5=AD=98=E5=B9=B6=E5=B0=86=E4=
=BB=A3=E7=A0=81=E6=8C=87=E5=90=91=E5=AE=83=EF=BC=8C=E5=86=85=E5=AD=98=E5=
=BF=85=E9=A1=BB=E7=94=A8X=E4=BD=8D=E6=A0=87=E8=AE=B0=EF=BC=8C=E5=90=A6=E5=
=88=99=E4=BC=9A=E5=8F=91=E7=94=9F=E5=BC=82=E5=B8=B8=E3=80=82
how about =E5=9B=A0=E4=B8=BA=E5=86=85=E5=AD=98=E5=BF=85=E9=A1=BB=E7=94=A8=
X=E4=BD=8D=E6=A0=87=E8=AE=B0=EF=BC=9F

Hmm, If I understand correctly, How about=EF=BC=9A

=E7=8E=B0=E4=BB=A3 CPU =E6=94=AF=E6=8C=81 RW =E5=92=8C NX =E4=BD=8D=E7=AD=
=89=E5=86=85=E5=AD=98=E6=9D=83=E9=99=90=E3=80=82=E5=86=85=E5=AD=98=E6=9D=
=83=E9=99=90=E5=8A=9F=E8=83=BD=E6=8F=90=E9=AB=98=E4=BA=86=E5=AF=B9=E5=86=
=85=E5=AD=98=E6=8D=9F=E5=9D=8F=E9=94=99=E8=AF=AF=E7=9A=84=E5=AE=89=E5=85=
=A8=E6=80=A7=EF=BC=8C
=E5=8D=B3=E6=94=BB=E5=87=BB=E8=80=85=E4=B8=8D=E8=83=BD=E7=9B=B4=E6=8E=A5=
=E5=86=99=E5=85=A5=E4=BB=BB=E6=84=8F=E5=86=85=E5=AD=98=E5=B9=B6=E5=B0=86=
=E4=BB=A3=E7=A0=81=E6=8C=87=E5=90=91=E8=AF=A5=E5=86=85=E5=AD=98=EF=BC=8C=
=E5=86=85=E5=AD=98=E5=BF=85=E9=A1=BB=E7=94=A8 X =E4=BD=8D=E6=A0=87=E8=AE=
=B0=EF=BC=8C=E5=90=A6=E5=88=99=E4=BC=9A=E5=8F=91=E7=94=9F
=E5=BC=82=E5=B8=B8=E3=80=82

>=20
>=20+
>=20
>=20+=E5=86=85=E5=AD=98=E5=B0=81=E8=A3=85=E8=BF=98=E9=A2=9D=E5=A4=96=E4=
=BF=9D=E6=8A=A4=E4=BA=86=E6=98=A0=E5=B0=84=E6=9C=AC=E8=BA=AB=E4=B8=8D=E8=
=A2=AB=E4=BF=AE=E6=94=B9=E3=80=82=E8=BF=99=E5=AF=B9=E4=BA=8E=E7=BC=93=E8=
=A7=A3=E5=86=85=E5=AD=98=E6=8D=9F=E5=9D=8F=E9=97=AE=E9=A2=98=E5=BE=88=E6=
=9C=89=E7=94=A8=EF=BC=8C
>=20
>=20+=E5=9C=A8=E8=BF=99=E4=BA=9B=E9=97=AE=E9=A2=98=E4=B8=AD=EF=BC=8C=E4=
=B8=80=E4=B8=AA=E6=8D=9F=E5=9D=8F=E7=9A=84=E6=8C=87=E9=92=88=E8=A2=AB=E4=
=BC=A0=E9=80=92=E7=BB=99=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E7=B3=BB=E7=
=BB=9F=E3=80=82=E4=BE=8B=E5=A6=82=EF=BC=8C
Let's keep each line the same length.
>=20
>=20+=E8=BF=99=E6=A0=B7=E7=9A=84=E6=94=BB=E5=87=BB=E8=80=85=E5=8E=9F=E8=
=AF=AD=E5=8F=AF=E4=BB=A5=E7=A0=B4=E5=9D=8F=E6=8E=A7=E5=88=B6=E6=B5=81=E5=
=AE=8C=E6=95=B4=E6=80=A7=E4=BF=9D=E8=AF=81=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=
=BA=94=E8=AF=A5=E8=A2=AB=E4=BF=A1=E4=BB=BB=E7=9A=84=E5=8F=AA=E8=AF=BB=E5=
=86=85=E5=AD=98=E5=8F=AF=E8=83=BD=E5=8F=98=E5=BE=97=E5=8F=AF=E5=86=99=EF=
=BC=8C
>=20
>=20+=E6=88=96=E8=80=85 .text =E9=A1=B5=E9=9D=A2=E5=8F=AF=E8=83=BD=E4=BC=
=9A=E8=A2=AB=E9=87=8D=E6=96=B0=E6=98=A0=E5=B0=84=E3=80=82=E8=BF=90=E8=A1=
=8C=E6=97=B6=E5=8A=A0=E8=BD=BD=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=A5=E8=87=
=AA=E5=8A=A8=E5=BA=94=E7=94=A8=E5=86=85=E5=AD=98=E5=AF=86=E5=B0=81=E6=9D=
=A5
>=20
>=20+=E5=AF=86=E5=B0=81.text=E5=92=8C.rodata=E9=A1=B5=E9=9D=A2=EF=BC=8C=
=E5=B9=B6=E4=B8=94=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=A5=
=E5=9C=A8=E8=BF=90=E8=A1=8C=E6=97=B6=E9=A2=9D=E5=A4=96=E5=AF=86=E5=B0=81=
=E5=AE=89=E5=85=A8=E5=85=B3=E9=94=AE=E6=95=B0=E6=8D=AE=E3=80=82
>=20
>=20+
>=20
>=20+=E7=B1=BB=E4=BC=BC=E7=9A=84=E7=89=B9=E6=80=A7=E5=B7=B2=E7=BB=8F=E5=
=AD=98=E5=9C=A8=E4=BA=8EXNU=E5=86=85=E6=A0=B8=E4=B8=AD
how about XNU =E5=86=85=E6=A0=B8=E4=B8=AD=E5=B7=B2=E7=BB=8F=E5=AD=98=E5=
=9C=A8=E7=B1=BB=E4=BC=BC=E7=9A=84=E5=8A=9F=E8=83=BD?

>=20
>=20+VM_FLAGS_PERMANENT =E6=A0=87=E5=BF=97 [1] =E5=92=8C OpenBSD =E4=B8=
=8A=E7=9A=84=E5=8F=AF=E5=8F=98=E7=B3=BB=E7=BB=9F=E8=B0=83=E7=94=A8 [2]=E3=
=80=82
>=20
>=20+
>=20
>=20+=E7=94=A8=E6=88=B7 API
>=20
>=20+=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20+mseal()
>=20
>=20+-----------
Let's drop unnecessary "-".

>=20
>=20+The mseal() =E7=B3=BB=E7=BB=9F=E8=B0=83=E7=94=A8=E5=85=B7=E6=9C=89=
=E4=BB=A5=E4=B8=8B=E7=AD=BE=E5=90=8D:
>=20
>=20+
>=20
>=20+``int mseal(void addr, size_t len, unsigned long flags)``
>=20
>=20+
>=20
>=20+**addr/len**: =E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=E5=9C=B0=E5=9D=80=
=E8=8C=83=E5=9B=B4=E3=80=82
>=20
>=20+
>=20
>=20+=E7=94=B1 ``addr``/``len`` =E8=AE=BE=E7=BD=AE=E7=9A=84=E5=9C=B0=E5=
=9D=80=E8=8C=83=E5=9B=B4=E5=BF=85=E9=A1=BB=E6=BB=A1=E8=B6=B3:
>=20
>=20+ - =E8=B5=B7=E5=A7=8B=E5=9C=B0=E5=9D=80=E5=BF=85=E9=A1=BB=E5=9C=A8=
=E5=B7=B2=E5=88=86=E9=85=8D=E7=9A=84VMA=E4=B8=AD=E3=80=82
>=20
>=20+ - =E8=B5=B7=E5=A7=8B=E5=9C=B0=E5=9D=80=E5=BF=85=E9=A1=BB=E4=B8=8E=
=E9=A1=B5=E9=9D=A2=E5=AF=B9=E9=BD=90=E3=80=82
>=20
>=20+ - =E7=BB=93=E6=9D=9F=E5=9C=B0=E5=9D=80 (``addr`` + ``len``) =E5=BF=
=85=E9=A1=BB=E5=9C=A8=E5=B7=B2=E5=88=86=E9=85=8D=E7=9A=84VMA=E4=B8=AD=E3=
=80=82
>=20
>=20+ - =E8=B5=B7=E5=A7=8B=E5=9C=B0=E5=9D=80=E5=92=8C=E7=BB=93=E6=9D=9F=
=E5=9C=B0=E5=9D=80=E4=B9=8B=E9=97=B4=E6=B2=A1=E6=9C=89=E9=97=B4=E9=9A=99 =
(=E6=9C=AA=E5=88=86=E9=85=8D=E7=9A=84=E5=86=85=E5=AD=98) =E3=80=82
>=20
>=20+
>=20
>=20+=E8=BF=99=E4=B8=AA ``len`` =E5=B0=86=E7=94=B1=E5=86=85=E6=A0=B8=E9=
=9A=90=E5=BC=8F=E5=9C=B0=E8=BF=9B=E8=A1=8C=E5=88=86=E9=A1=B5=E5=AF=B9=E9=
=BD=90=E3=80=82
>=20
>=20+
>=20
>=20+**flags**: =E4=BF=9D=E7=95=99=E4=BE=9B=E5=B0=86=E6=9D=A5=E4=BD=BF=E7=
=94=A8=E3=80=82
>=20
>=20+
>=20
>=20+**=E8=BF=94=E5=9B=9E=E5=80=BC**:
>=20
>=20+
>=20
>=20+- ``0``: =E6=88=90=E5=8A=9F=E3=80=82
>=20
>=20+
>=20
>=20+- ``-EINVAL``:
>=20
>=20+ - =E6=97=A0=E6=95=88=E7=9A=84=E8=BE=93=E5=85=A5 ``flags``=E3=80=82
>=20
>=20+ - =E8=B5=B7=E5=A7=8B=E5=9C=B0=E5=9D=80 (``addr``) =E6=9C=AA=E5=AF=
=B9=E9=BD=90=E9=A1=B5=E3=80=82
>=20
>=20+ - =E5=9C=B0=E5=9D=80=E8=8C=83=E5=9B=B4 (``addr`` + ``len``) =E6=BA=
=A2=E5=87=BA=E3=80=82
>=20
>=20+
>=20
>=20+- ``-ENOMEM``:
>=20
>=20+ - =E8=B5=B7=E5=A7=8B=E5=9C=B0=E5=9D=80 (``addr``) =E6=9C=AA=E5=88=
=86=E9=85=8D=E3=80=82
>=20
>=20+ - =E7=BB=93=E6=9D=9F=E5=9C=B0=E5=9D=80 (``addr`` + ``len``) =E6=9C=
=AA=E5=88=86=E9=85=8D=E3=80=82
>=20
>=20+ - =E4=B8=80=E4=B8=AA=E9=97=B4=E9=9A=99 (unallocated memory) =E8=B5=
=B7=E5=A7=8B=E5=9C=B0=E5=9D=80=E5=92=8C=E7=BB=93=E6=9D=9F=E5=9C=B0=E5=9D=
=80=E4=B9=8B=E9=97=B4=E3=80=82
>=20
>=20+
>=20
>=20+- ``-EPERM``:
>=20
>=20+ - =E5=86=85=E5=AD=98=E5=AF=86=E5=B0=81=E4=BB=85=E5=9C=A864=E4=BD=8D=
CPU=E4=B8=8A=E6=94=AF=E6=8C=81=EF=BC=8C32=E4=BD=8D=E4=B8=8D=E5=8F=97=E6=
=94=AF=E6=8C=81=E3=80=82
>=20
>=20+
>=20
>=20+- =E5=AF=B9=E4=BA=8E=E4=B8=8A=E8=BF=B0=E9=94=99=E8=AF=AF=E6=83=85=E5=
=86=B5=EF=BC=8C=E7=94=A8=E6=88=B7=E5=8F=AF=E4=BB=A5=E6=9C=9F=E6=9C=9B=E7=
=BB=99=E5=AE=9A=E7=9A=84=E5=86=85=E5=AD=98=E8=8C=83=E5=9B=B4=E4=B8=BA=E6=
=9C=AA=E4=BF=AE=E6=94=B9=EF=BC=8C=E5=8D=B3=E6=B2=A1=E6=9C=89=E9=83=A8=E5=
=88=86=E6=9B=B4=E6=96=B0=E3=80=82
=E7=94=A8=E6=88=B7=E5=8F=AF=E4=BB=A5=E5=81=87=E8=AE=BE=E7=BB=99=E5=AE=9A=
=E7=9A=84=E5=86=85=E5=AD=98=E8=8C=83=E5=9B=B4=E4=B8=BA=E6=9C=AA=E4=BF=AE=
=E6=94=B9
or
=E7=94=A8=E6=88=B7=E5=8F=AF=E4=BB=A5=E9=BB=98=E8=AE=A4=E7=BB=99=E5=AE=9A=
=E7=9A=84=E5=86=85=E5=AD=98=E8=8C=83=E5=9B=B4=E4=B8=BA=E6=9C=AA=E4=BF=AE=
=E6=94=B9


>=20
>=20+
>=20
>=20+- =E5=8F=AF=E8=83=BD=E8=BF=98=E6=9C=89=E5=85=B6=E4=BB=96=E6=9C=AA=E5=
=9C=A8=E6=AD=A4=E5=A4=84=E5=88=97=E5=87=BA=E7=9A=84=E5=86=85=E9=83=A8=E9=
=94=99=E8=AF=AF/=E6=83=85=E5=86=B5=EF=BC=8C=E4=BE=8B=E5=A6=82=EF=BC=8C
>=20
>=20+ =E5=9C=A8=E5=90=88=E5=B9=B6/=E6=8B=86=E5=88=86VMA=EF=BC=88=E8=99=9A=
=E6=8B=9F=E5=86=85=E5=AD=98=E5=8C=BA=E5=9F=9F=EF=BC=89=E6=97=B6=E5=8F=91=
=E7=94=9F=E9=94=99=E8=AF=AF=EF=BC=8C=E6=88=96=E8=80=85
>=20
>=20+ =E8=BF=9B=E7=A8=8B=E8=BE=BE=E5=88=B0=E4=BA=86=E6=94=AF=E6=8C=81=E7=
=9A=84=E6=9C=80=E5=A4=A7VMA=E6=95=B0=E9=87=8F=E3=80=82=E5=9C=A8=E8=BF=99=
=E4=BA=9B=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C
>=20
>=20+ =E7=BB=99=E5=AE=9A=E5=86=85=E5=AD=98=E8=8C=83=E5=9B=B4=E5=8F=AF=E8=
=83=BD=E4=BC=9A=E5=8F=91=E7=94=9F=E9=83=A8=E5=88=86=E6=9B=B4=E6=96=B0=E3=
=80=82=E7=84=B6=E8=80=8C=EF=BC=8C=E8=BF=99=E4=BA=9B=E6=83=85=E5=86=B5=E5=
=BA=94=E8=AF=A5=E5=BE=88=E7=BD=95=E8=A7=81=E3=80=82
>=20
>=20+
>=20
>=20+**=E5=86=85=E5=AD=98=E5=AF=86=E5=B0=81=E5=90=8E=E7=9A=84=E9=98=BB=E5=
=A1=9E=E6=93=8D=E4=BD=9C**:
>=20
>=20+ =E5=8F=96=E6=B6=88=E6=98=A0=E5=B0=84=EF=BC=8C=E7=A7=BB=E5=8A=A8=E5=
=88=B0=E5=8F=A6=E4=B8=80=E4=B8=AA=E4=BD=8D=E7=BD=AE=EF=BC=8C=E5=B9=B6=E7=
=BC=A9=E5=B0=8F=E5=A4=A7=E5=B0=8F=EF=BC=8C=E9=80=9A=E8=BF=87munmap()=E5=
=92=8Cmremap()=EF=BC=8C
>=20
>=20+ =E5=8F=AF=E4=BB=A5=E7=95=99=E4=B8=8B=E4=B8=80=E4=B8=AA=E7=A9=BA=E7=
=99=BD=E7=9A=84=E7=A9=BA=E9=97=B4=EF=BC=8C=E5=9B=A0=E6=AD=A4=E5=8F=AF=E4=
=BB=A5=E7=94=A8=E5=85=B7=E6=9C=89=E4=B8=80=E7=BB=84=E6=96=B0=E5=B1=9E=E6=
=80=A7=E7=9A=84VMA=E6=9B=BF=E6=8D=A2=E3=80=82
=E9=80=9A=E8=BF=87 munmap() =E5=92=8C mremap() =E5=8F=96=E6=B6=88=E6=98=
=A0=E5=B0=84=E3=80=81=E7=A7=BB=E5=8A=A8=E5=88=B0=E5=8F=A6=E4=B8=80=E4=B8=
=AA=E4=BD=8D=E7=BD=AE=E4=BB=A5=E5=8F=8A=E7=BC=A9=E5=B0=8F=E5=A4=A7=E5=B0=
=8F=E5=8F=AF=E4=BB=A5
=E7=95=99=E4=B8=8B=E4=B8=80=E4=B8=AA=E7=A9=BA=E7=99=BD=E7=A9=BA=E9=97=B4=
=EF=BC=8C=E5=9B=A0=E6=AD=A4=E5=8F=AF=E4=BB=A5=E7=94=A8=E5=85=B7=E6=9C=89=
=E4=B8=80=E7=BB=84=E6=96=B0=E5=B1=9E=E6=80=A7=E7=9A=84 VMA =E6=9B=BF=E6=
=8D=A2=E5=AE=83=E3=80=82


Let's adjust the order so that the sentences will be easier
to understand.

>=20
>=20+
>=20
>=20+ =E9=80=9A=E8=BF=87mremap()=EF=BC=8C=E5=B0=86=E4=B8=8D=E5=90=8C=E7=
=9A=84VMA=E7=A7=BB=E5=8A=A8=E6=88=96=E6=89=A9=E5=B1=95=E5=88=B0=E5=BD=93=
=E5=89=8D=E4=BD=8D=E7=BD=AE=E3=80=82
>=20
>=20+
>=20
>=20+ =E9=80=9A=E8=BF=87mmap(MAP_FIXED)=E4=BF=AE=E6=94=B9VMA=E3=80=82
>=20
>=20+
>=20
>=20+ =E9=80=9A=E8=BF=87 mremap() =E8=BF=9B=E8=A1=8C=E7=9A=84=E5=A4=A7=E5=
=B0=8F=E6=89=A9=E5=B1=95=E4=BC=BC=E4=B9=8E=E4=B8=8D=E4=BC=9A=E5=AF=B9=E5=
=B7=B2=E5=AF=86=E5=B0=81=E7=9A=84 VMA=EF=BC=88=E8=99=9A=E6=8B=9F=E5=86=85=
=E5=AD=98=E5=8C=BA=E5=9F=9F=EF=BC=89
>=20
>=20+ =E9=80=A0=E6=88=90=E4=BB=BB=E4=BD=95=E7=89=B9=E5=AE=9A=E7=9A=84=E9=
=A3=8E=E9=99=A9=E3=80=82=E5=B0=BD=E7=AE=A1=E5=A6=82=E6=AD=A4=EF=BC=8C=E7=
=94=B1=E4=BA=8E=E4=BD=BF=E7=94=A8=E5=9C=BA=E6=99=AF=E4=B8=8D=E6=98=8E=E7=
=A1=AE=EF=BC=8C=E8=BF=99=E4=B8=80=E7=82=B9=E8=BF=98=E6=98=AF=E8=A2=AB=E5=
=8C=85=E6=8B=AC=E4=BA=86=E8=BF=9B=E6=9D=A5=E3=80=82
>=20
>=20+ =E6=97=A0=E8=AE=BA=E5=A6=82=E4=BD=95=EF=BC=8C=E7=94=A8=E6=88=B7=E9=
=83=BD=E5=8F=AF=E4=BB=A5=E4=BE=9D=E8=B5=96=E5=90=88=E5=B9=B6=E6=93=8D=E4=
=BD=9C=E6=9D=A5=E6=89=A9=E5=B1=95=E5=B7=B2=E5=AF=86=E5=B0=81=E7=9A=84 VMA=
=E3=80=82
>=20
>=20+
>=20
>=20+ mprotect() =E5=92=8C pkey_mprotect()=E3=80=82
>=20
>=20+
>=20
>=20+ =E5=AF=B9=E4=BA=8E=E5=8C=BF=E5=90=8D=E5=86=85=E5=AD=98=E4=B8=80=E4=
=BA=9B=E7=A0=B4=E5=9D=8F=E6=80=A7=E7=9A=84 madvice() =E8=A1=8C=E4=B8=BA (=
=E4=BE=8B=E5=A6=82 MADV_DONTNEED)
>=20
>=20+ =E5=BD=93=E7=94=A8=E6=88=B7=E6=B2=A1=E6=9C=89=E5=AF=B9=E8=BF=99=E5=
=9D=97=E5=86=99=E6=9D=83=E9=99=90=E6=97=B6=E3=80=82=E8=BF=99=E4=BA=9B=E8=
=A1=8C=E4=B8=BA=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E4=B8=A2=E5=BC=83=E9=
=A1=B5=E9=9D=A2=E6=9D=A5=E6=94=B9=E5=8F=98=E5=8C=BA=E5=9F=9F=E5=86=85=E5=
=AE=B9=EF=BC=8C
>=20
>=20+ =E5=AE=9E=E9=99=85=E4=B8=8A=E6=98=AF=E5=8C=BF=E5=90=8D=E5=86=85=E5=
=AD=98=E7=9A=84 memset(0) =E3=80=82
=E5=BD=93=E7=94=A8=E6=88=B7=E6=B2=A1=E6=9C=89=E5=86=85=E5=AD=98=E7=9A=84=
=E5=86=99=E5=85=A5=E6=9D=83=E9=99=90=E6=97=B6=EF=BC=8C=E5=8C=BF=E5=90=8D=
=E5=86=85=E5=AD=98=E4=BC=9A=E5=87=BA=E7=8E=B0=E4=B8=80=E4=BA=9B=E7=A0=B4=
=E5=9D=8F=E6=80=A7=E7=9A=84 madvice()
=E8=A1=8C=E4=B8=BA=EF=BC=88=E4=BE=8B=E5=A6=82 MADV_DONTNEED=EF=BC=89=E3=
=80=82=E8=BF=99=E4=BA=9B=E8=A1=8C=E4=B8=BA=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=
=BF=87=E4=B8=A2=E5=BC=83=E9=A1=B5=E9=9D=A2=E6=9D=A5=E6=9B=B4=E6=94=B9=E5=
=8C=BA=E5=9F=9F=E5=86=85
=E5=AE=B9=EF=BC=8C=E8=BF=99=E5=AE=9E=E9=99=85=E4=B8=8A=E6=98=AF=E5=8C=BF=
=E5=90=8D=E5=86=85=E5=AD=98=E7=9A=84 memset(0)=E3=80=82
>=20
>=20+
>=20
>=20+ =E5=AF=B9=E4=BA=8E=E9=98=BB=E5=A1=9E=E7=9A=84=E6=93=8D=E4=BD=9C=EF=
=BC=8C=E5=86=85=E6=A0=B8=E5=B0=86=E8=BF=94=E5=9B=9E -EPERM =E3=80=82
>=20
>=20+
>=20
>=20+ =E5=AF=B9=E4=BA=8E=E9=98=BB=E5=A1=9E=E6=93=8D=E4=BD=9C=EF=BC=8C=E5=
=8F=AF=E4=BB=A5=E6=9C=9F=E6=9C=9B=E7=BB=99=E5=AE=9A=E7=9A=84=E5=9C=B0=E5=
=9D=80=E4=B8=8D=E4=BC=9A=E8=A2=AB=E4=BF=AE=E6=94=B9=EF=BC=8C
>=20
>=20+ =E5=8D=B3=E4=B8=8D=E4=BC=9A=E5=8F=91=E7=94=9F=E9=83=A8=E5=88=86=E6=
=9B=B4=E6=96=B0=E3=80=82=E8=AF=B7=E6=B3=A8=E6=84=8F=EF=BC=8C=E8=BF=99=E4=
=B8=8E=E7=8E=B0=E6=9C=89=E7=9A=84=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E7=
=B3=BB=E7=BB=9F=E8=B0=83=E7=94=A8=E8=A1=8C=E4=B8=BA=E4=B8=8D=E5=90=8C=EF=
=BC=8C
>=20
>=20+ =E5=90=8E=E8=80=85=E5=9C=A8=E5=8F=91=E7=8E=B0=E9=94=99=E8=AF=AF=E5=
=B9=B6=E8=BF=94=E5=9B=9E=E7=BB=99=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E4=
=B9=8B=E5=89=8D=E4=BC=9A=E8=BF=9B=E8=A1=8C=E9=83=A8=E5=88=86=E6=9B=B4=E6=
=96=B0=E3=80=82=E4=B8=BE=E4=B8=AA=E4=BE=8B=E5=AD=90=E6=9D=A5=E8=AF=B4=EF=
=BC=9A
>=20
>=20+
>=20
>=20+ =E5=81=87=E8=AE=BE=E4=BB=A3=E7=A0=81=E5=BA=8F=E5=88=97=E5=A6=82=E4=
=B8=8B:
>=20
>=20+
>=20
>=20+ - ptr =3D mmap(null, 8192, PROT_NONE);
>=20
>=20+ - munmap(ptr + 4096, 4096);
>=20
>=20+ - ret1 =3D mprotect(ptr, 8192, PROT_READ);
>=20
>=20+ - mseal(ptr, 4096);
>=20
>=20+ - ret2 =3D mprotect(ptr, 8192, PROT_NONE);
>=20
>=20+
>=20
>=20+ ret1 =E5=B0=86=E5=8F=98=E6=88=90 -ENOMEM, ptr=E6=8C=87=E5=90=91=E7=
=9A=84=E9=A1=B5=E6=9B=B4=E6=96=B0=E4=B8=BAPROT_READ=E3=80=82
>=20
>=20+
>=20
>=20+ ret2 =E5=B0=86=E5=8F=98=E6=88=90 -EPERM, =E8=BF=99=E4=B8=AA=E9=A1=
=B5=E9=9D=A2=E4=BB=8D=E7=84=B6=E6=98=AF PROT_READ=E3=80=82
>=20
>=20+
>=20
>=20+**=E6=B3=A8=E6=84=8F**:
>=20
>=20+
>=20
>=20+- mseal() =E4=BB=85=E9=80=82=E7=94=A8=E4=BA=8E64=E4=BD=8DCPU=EF=BC=
=8C=E4=B8=8D=E6=94=AF=E6=8C=8132=E4=BD=8DCPU=E3=80=82
>=20
> +
>=20
>=20+- =E7=94=A8=E6=88=B7=E5=8F=AF=E4=BB=A5=E5=A4=9A=E6=AC=A1=E8=B0=83=E7=
=94=A8 mseal() , =E5=AF=B9=E5=B7=B2=E7=BB=8F=E5=AF=86=E5=B0=81=E7=9A=84=
=E5=86=85=E5=AD=98=E6=89=A7=E8=A1=8C mseal() =E6=98=AF=E4=B8=80=E4=B8=AA=
=E6=97=A0=E6=93=8D=E4=BD=9C=EF=BC=88=E4=B8=8D=E6=8A=A5=E9=94=99=EF=BC=89=
=E3=80=82
>=20
>=20+
>=20
>=20+- =E4=B8=8D=E6=94=AF=E6=8C=81munseal() =E3=80=82
>=20
>=20+
>=20
>=20+=E7=94=A8=E4=BE=8B:
Let's use chinese "=EF=BC=9A"=E3=80=82 ( two =3D=3D)

>=20
>=20+=3D=3D=3D=3D=3D
>=20
>=20+- glibc:
>=20
>=20+ =E5=9C=A8=E5=8A=A0=E8=BD=BD ELF =E5=8F=AF=E6=89=A7=E8=A1=8C=E6=96=
=87=E4=BB=B6=E6=97=B6=EF=BC=8C=E5=8A=A8=E6=80=81=E9=93=BE=E6=8E=A5=E5=99=
=A8=E5=8F=AF=E4=BB=A5=E5=AF=B9=E9=9D=9E=E5=8F=AF=E5=86=99=E5=86=85=E5=AD=
=98=E6=AE=B5=E5=BA=94=E7=94=A8=E5=AF=86=E5=B0=81=E6=93=8D=E4=BD=9C=E3=80=
=82
>=20
>=20+
>=20
>=20+- Chrome =E6=B5=8F=E8=A7=88=E5=99=A8: =E4=BF=9D=E6=8A=A4=E9=83=A8=E5=
=88=86=E5=AF=B9=E5=AE=89=E5=85=A8=E6=95=8F=E6=84=9F=E7=9A=84=E6=95=B0=E6=
=8D=AE=E7=BB=93=E6=9E=84=E3=80=82
>=20
>=20+
>=20
>=20+=E5=85=B3=E4=BA=8E=E5=93=AA=E4=BA=9B=E5=86=85=E5=AD=98=E5=BA=94=E8=
=AF=A5=E8=A2=AB=E5=AF=86=E5=B0=81=E7=9A=84=E6=B3=A8=E6=84=8F=E4=BA=8B=E9=
=A1=B9:
>=20
>=20+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20+
>=20
>=20+=E9=87=8D=E8=A6=81=E7=9A=84=E6=98=AF=E8=A6=81=E6=B3=A8=E6=84=8F=EF=
=BC=8C=E5=AF=86=E5=B0=81=E4=BC=9A=E6=94=B9=E5=8F=98=E6=98=A0=E5=B0=84=E7=
=9A=84=E7=94=9F=E5=91=BD=E5=91=A8=E6=9C=9F=EF=BC=8C=E5=8D=B3=E5=B7=B2=E5=
=AF=86=E5=B0=81=E7=9A=84=E6=98=A0=E5=B0=84=E5=9C=A8=E8=BF=9B=E7=A8=8B=E7=
=BB=88=E6=AD=A2
>=20
>=20+=E6=88=96=E6=89=A7=E8=A1=8C exec =E7=B3=BB=E7=BB=9F=E8=B0=83=E7=94=
=A8=E4=B9=8B=E5=89=8D=E4=B8=8D=E4=BC=9A=E8=A2=AB=E5=8F=96=E6=B6=88=E6=98=
=A0=E5=B0=84=E3=80=82=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=
=A5=E4=BB=8E=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E5=AF=B9=E4=BB=BB=E4=BD=
=95=E8=99=9A=E6=8B=9F
>=20
>=20+=E5=86=85=E5=AD=98=E5=8C=BA=E5=9F=9F=E5=BA=94=E7=94=A8=E5=AF=86=E5=
=B0=81=EF=BC=8C=E4=BD=86=E5=9C=A8=E5=BA=94=E7=94=A8=E5=AF=86=E5=B0=81=E4=
=B9=8B=E5=89=8D=EF=BC=8C=E5=BD=BB=E5=BA=95=E5=88=86=E6=9E=90=E6=98=A0=E5=
=B0=84=E7=9A=84=E7=94=9F=E5=91=BD=E5=91=A8=E6=9C=9F=E6=98=AF=E8=87=B3=E5=
=85=B3=E9=87=8D=E8=A6=81=E7=9A=84=E3=80=82
>=20
>=20+
>=20
>=20+=E4=BE=8B=E5=A6=82:
>=20
>=20+
>=20
>=20+- aio/shm
>=20
>=20+
>=20
>=20+ aio/shm =E5=8F=AF=E4=BB=A5=E4=BB=A3=E8=A1=A8=E7=94=A8=E6=88=B7=E7=
=A9=BA=E9=97=B4=E8=B0=83=E7=94=A8 mmap()/munmap() , =E4=BE=8B=E5=A6=82 ks=
ys_shmdt() =E5=9C=A8shm.c=E4=B8=AD=E3=80=82
>=20
>=20+ =E8=BF=99=E4=BA=9B=E6=98=A0=E5=B0=84=E7=9A=84=E7=94=9F=E5=91=BD=E5=
=91=A8=E6=9C=9F=E5=B9=B6=E4=B8=8D=E4=B8=8E=E8=BF=9B=E7=A8=8B=E7=9A=84=E7=
=94=9F=E5=91=BD=E5=91=A8=E6=9C=9F=E7=BB=91=E5=AE=9A=E3=80=82=E5=A6=82=E6=
=9E=9C=E8=BF=99=E4=BA=9B=E5=86=85=E5=AD=98=E5=8C=BA=E5=9F=9F=E4=BB=8E=E7=
=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E8=A2=AB=E5=AF=86=E5=B0=81=EF=BC=8C
>=20
>=20+ =E9=82=A3=E4=B9=88 munmap() =E5=B0=86=E5=A4=B1=E8=B4=A5=EF=BC=8C=E5=
=AF=BC=E8=87=B4=E5=9C=A8=E8=BF=9B=E7=A8=8B=E7=9A=84=E7=94=9F=E5=91=BD=E5=
=91=A8=E6=9C=9F=E5=86=85 VMA=EF=BC=88=E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=
=E5=8C=BA=E5=9F=9F=EF=BC=89=E5=9C=B0=E5=9D=80=E7=A9=BA=E9=97=B4=E4=B8=AD
>=20
>=20+ =E5=87=BA=E7=8E=B0=E6=B3=84=E6=BC=8F=E3=80=82
>=20
>=20+- Brk (heap)
>=20
>=20+
>=20
>=20+ =E7=9B=AE=E5=89=8D=EF=BC=8C=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E7=
=9A=84=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=
=BF=87=E8=B0=83=E7=94=A8 malloc() =E5=92=8C mseal() =E6=9D=A5=E5=AF=86=E5=
=B0=81=E5=A0=86=EF=BC=88heap=EF=BC=89=E7=9A=84
>=20
>=20+ =E9=83=A8=E5=88=86=E5=86=85=E5=AD=98=E3=80=82=E8=AE=A9=E6=88=91=E4=
=BB=AC=E5=81=87=E8=AE=BE=E4=BB=A5=E4=B8=8B=E6=9D=A5=E8=87=AA=E7=94=A8=E6=
=88=B7=E7=A9=BA=E9=97=B4=E7=9A=84=E8=B0=83=E7=94=A8:
>=20
>=20+
>=20
>=20+ - ptr =3D malloc(size);
>=20
>=20+ - mprotect(ptr, size, RO);
>=20
>=20+ - mseal(ptr, size);
>=20
>=20+ - free(ptr);
>=20
>=20+
>=20
>=20+ =E6=8A=80=E6=9C=AF=E4=B8=8A=EF=BC=8C=E5=9C=A8 mseal() =E8=A2=AB=E6=
=B7=BB=E5=8A=A0=E4=B9=8B=E5=89=8D=EF=BC=8C=E7=94=A8=E6=88=B7=E5=8F=AF=E4=
=BB=A5=E9=80=9A=E8=BF=87=E8=B0=83=E7=94=A8 mprotect(RO)
=E4=BB=8E=E6=8A=80=E6=9C=AF=E4=B8=8A=E8=AE=B2

>=20
>=20+ =E6=9D=A5=E6=94=B9=E5=8F=98=E5=A0=86=E7=9A=84=E4=BF=9D=E6=8A=A4=E5=
=B1=9E=E6=80=A7=E3=80=82=E5=8F=AA=E8=A6=81=E7=94=A8=E6=88=B7=E5=9C=A8=E8=
=B0=83=E7=94=A8 free() =E4=B9=8B=E5=89=8D=E5=B0=86=E4=BF=9D=E6=8A=A4=E5=
=B1=9E=E6=80=A7=E6=94=B9=E5=9B=9E RW=EF=BC=88=E8=AF=BB=E5=86=99=EF=BC=89=
=EF=BC=8C
>=20
>=20+ =E8=BF=99=E5=9D=97=E5=86=85=E5=AD=98=E8=8C=83=E5=9B=B4=E5=B0=B1=E5=
=8F=AF=E4=BB=A5=E8=A2=AB=E9=87=8D=E7=94=A8=E3=80=82
>=20
>=20+
>=20
>=20+ =E7=84=B6=E8=80=8C=EF=BC=8C=E5=BC=95=E5=85=A5 mseal() =E4=B9=8B=E5=
=90=8E=EF=BC=8C=E5=A0=86=E7=9A=84=E9=83=A8=E5=88=86=E5=86=85=E5=AD=98=E5=
=B0=86=E8=A2=AB=E5=AF=86=E5=B0=81=EF=BC=8C=E7=94=A8=E6=88=B7=E4=BB=8D=E7=
=84=B6=E5=8F=AF=E4=BB=A5=E9=87=8A=E6=94=BE=E8=BF=99=E9=83=A8=E5=88=86=E5=
=86=85=E5=AD=98=EF=BC=8C
>=20
>=20+ =E4=BD=86=E5=86=85=E5=AD=98=E5=B0=86=E4=BF=9D=E6=8C=81=E4=B8=BA RO=
=EF=BC=88=E5=8F=AA=E8=AF=BB=EF=BC=89=E3=80=82=E5=A6=82=E6=9E=9C=E5=A0=86=
=E7=AE=A1=E7=90=86=E5=99=A8=E9=87=8D=E6=96=B0=E4=BD=BF=E7=94=A8=E8=BF=99=
=E4=B8=AA=E5=9C=B0=E5=9D=80=E6=9D=A5=E5=88=86=E9=85=8D=E5=8F=A6=E4=B8=80=
=E5=9D=97=E5=86=85=E5=AD=98=EF=BC=8C
>=20
>=20+ =E8=BF=9B=E7=A8=8B=E5=8F=AF=E8=83=BD=E5=9C=A8=E4=B8=8D=E4=B9=85=E5=
=90=8E=E5=B4=A9=E6=BA=83=E3=80=82=E5=9B=A0=E6=AD=A4=EF=BC=8C=E4=B8=8D=E8=
=A6=81=E5=AF=B9=E4=BB=BB=E4=BD=95=E5=8F=AF=E8=83=BD=E4=BC=9A=E8=A2=AB=E5=
=9B=9E=E6=94=B6=E7=9A=84=E5=86=85=E5=AD=98=E5=BA=94=E7=94=A8=E5=AF=86=E5=
=B0=81=EF=BC=8C
>=20
>=20+ =E8=BF=99=E6=98=AF=E9=9D=9E=E5=B8=B8=E9=87=8D=E8=A6=81=E7=9A=84=E3=
=80=82
>=20
>=20+
>=20
>=20+ =E6=AD=A4=E5=A4=96=EF=BC=8C=E5=8D=B3=E4=BD=BF=E5=BA=94=E7=94=A8=E7=
=A8=8B=E5=BA=8F=E4=BB=8E=E6=9C=AA=E5=AF=B9=E6=8C=87=E9=92=88 ptr =E8=B0=
=83=E7=94=A8 free()=EF=BC=8C=E5=A0=86=E7=AE=A1=E7=90=86=E5=99=A8=E4=B9=9F=
=E5=8F=AF=E8=83=BD=E4=BC=9A
>=20
>=20+ =E8=B0=83=E7=94=A8 brk =E7=B3=BB=E7=BB=9F=E8=B0=83=E7=94=A8=E6=9D=
=A5=E7=BC=A9=E5=B0=8F=E5=A0=86=E7=9A=84=E5=A4=A7=E5=B0=8F=E3=80=82=E5=9C=
=A8=E5=86=85=E6=A0=B8=E4=B8=AD=EF=BC=8Cbrk =E7=BC=A9=E5=B0=8F=E6=93=8D=E4=
=BD=9C=E4=BC=9A=E8=B0=83=E7=94=A8 munmap()=E3=80=82
>=20
> + =E5=9B=A0=E6=AD=A4=EF=BC=8C=E6=A0=B9=E6=8D=AE ptr =E7=9A=84=E4=BD=8D=
=E7=BD=AE=EF=BC=8Cbrk =E7=BC=A9=E5=B0=8F=E6=93=8D=E4=BD=9C=E7=9A=84=E7=BB=
=93=E6=9E=9C=E6=98=AF=E4=B8=8D=E7=A1=AE=E5=AE=9A=E7=9A=84=E3=80=82
>=20
>=20+
>=20
>=20+=E5=85=B6=E4=BB=96=E8=AF=B4=E6=98=8E:
>=20
>=20+=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20+=E6=AD=A3=E5=A6=82 Jann Horn =E5=9C=A8 [3] =E4=B8=AD=E6=8C=87=E5=87=
=BA=E7=9A=84=E9=82=A3=E6=A0=B7,
>=20
>=20+=E4=BB=8D=E7=84=B6=E6=9C=89=E5=87=A0=E7=A7=8D=E6=96=B9=E6=B3=95=E5=
=8F=AF=E4=BB=A5=E5=86=99=E5=85=A5 RO=EF=BC=88=E5=8F=AA=E8=AF=BB=EF=BC=89=
=E5=86=85=E5=AD=98=EF=BC=8C=E8=BF=99=E5=9C=A8=E6=9F=90=E7=A7=8D=E7=A8=8B=
=E5=BA=A6=E4=B8=8A=E6=98=AF=E8=AE=BE=E8=AE=A1=E4=B8=8A=E7=9A=84=E8=80=83=
=E8=99=91=E3=80=82
how about =E8=BF=99=E5=9C=A8=E6=9F=90=E7=A7=8D=E7=A8=8B=E5=BA=A6=E4=B8=8A=
=E6=98=AF=E8=AE=BE=E8=AE=A1=E4=BD=BF=E7=84=B6?

>=20




Let's=20adjust the order of sentences in the future, so that
the reading will be more smooth and the reviewer's life
will be easier.


BTW,

At this stage, Chinese is maintained in doc tree, so you
need to --to corbet@lwn.net

And also --cc alexs@kernel.org  dzm91@hust.edu.cn



Thanks,
Yanteng
