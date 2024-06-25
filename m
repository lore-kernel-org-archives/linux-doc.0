Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ECC45030
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 02:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719284089; cv=none; b=AN65U8S8J/IyEBf1ldHm+g+gbUi2r3C41GMAB+Um/a9DzznuT1iyWaotHUwQx4IK0mC5H7l4SzuIb8HH+Hm6cIVG5gaOMEsbQJ023LG07WTlE1lLuL2wjp8TwruJBeYDDzjV15XTy7FxwmflZ6fVMv1b4cSNhF5Jrf35AzS8qGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719284089; c=relaxed/simple;
	bh=//sJY374UU2pK5k5DdFZ0phlpWalf5XW5fAL7mo8u/4=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=QcdVL3i+uKx3PwFciu4RFPftl9un2sHcr5M/M6Mm6STLYlRGT6cly0QZL+HnE1lxCI1/2KvTDHzJVeo9pZmTLWXG9e2/5Vbzb9haOAVtX1eJwaa2Ae2lyzmXUfhoqMjR6dPJnxIe5vYRJCWGRVB5CMQ4+no8+SzEs4fgOD/FbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HxLdGFzm; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HxLdGFzm"
X-Envelope-To: mudongliangabcd@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1719284083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuunuuZNvCwElDxdo7Em9MBQ8XJm+N1cHUO/seztRvY=;
	b=HxLdGFzmwAap969knR8RnR+vRFPprt0D7NSA3y16IMbyOePUCzNmVXBXLzOTxW+QkBucLo
	2Ywszep+X3s/VXYlSUDjW+4VPM2sxWe3mSWEslVzzvOfLnNLeddwPqekcMs8+pyEd4PKh+
	TMW+78AbXo69/gvNbfH8i12C93r1F5E=
X-Envelope-To: siyanteng@loongson.cn
X-Envelope-To: corbet@lwn.net
X-Envelope-To: alexs@kernel.org
X-Envelope-To: dzm91@hust.edu.cn
X-Envelope-To: linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Jun 2024 02:54:41 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: si.yanteng@linux.dev
Message-ID: <ac5c53bfc5303a1bce3c730bb3b444b777b06161@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] docs/zh_CN: Add driver-api phy translation
To: "Dongliang Mu" <mudongliangabcd@gmail.com>, "Yanteng Si"
 <siyanteng@loongson.cn>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
 linux-doc@vger.kernel.org
In-Reply-To: <CAD-N9QXsziu63DE7MBJAEJNRR1UW9ZhCTxMayOeEJsn-CVZhSQ@mail.gmail.com>
References: <20240618134242.379715-1-siyanteng@loongson.cn>
 <CAD-N9QXsziu63DE7MBJAEJNRR1UW9ZhCTxMayOeEJsn-CVZhSQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

2024=E5=B9=B46=E6=9C=8818=E6=97=A5 22:32, "Dongliang Mu" <mudongliangabcd=
@gmail.com> =E5=86=99=E5=88=B0:



>=20
>=20On Tue, Jun 18, 2024 at 10:13 PM Yanteng Si <siyanteng@loongson.cn> w=
rote:
>=20
>=20>=20
>=20> Translate driver-api/phy.rst into Chinese.
> >=20
>=20>  commit d02aa181ee59 ("phy: Add devm_of_phy_optional_get() helper")
> >=20
>=20>  Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> >=20
>=20>  ---
> >=20
>=20>  .../translations/zh_CN/driver-api/index.rst | 2 +-
> >=20
>=20>  .../zh_CN/driver-api/phy/index.rst | 21 ++
> >=20
>=20>  .../translations/zh_CN/driver-api/phy/phy.rst | 213 ++++++++++++++=
++++
> >=20
>=20>  3 files changed, 235 insertions(+), 1 deletion(-)
> >=20
>=20>  create mode 100644 Documentation/translations/zh_CN/driver-api/phy=
/index.rst
> >=20
>=20>  create mode 100644 Documentation/translations/zh_CN/driver-api/phy=
/phy.rst
> >=20
>=20>  diff --git a/Documentation/translations/zh_CN/driver-api/index.rst=
 b/Documentation/translations/zh_CN/driver-api/index.rst
> >=20
>=20>  index 92ff1b7fc3d3..4050a2fb51c6 100644
> >=20
>=20>  --- a/Documentation/translations/zh_CN/driver-api/index.rst
> >=20
>=20>  +++ b/Documentation/translations/zh_CN/driver-api/index.rst
> >=20
>=20>  @@ -23,6 +23,7 @@ Linux=E9=A9=B1=E5=8A=A8=E5=AE=9E=E7=8E=B0=E8=80=
=85=E7=9A=84API=E6=8C=87=E5=8D=97
> >=20
>=20>  gpio/index
> >=20
>=20>  io_ordering
> >=20
>=20>  + phy/index
> >=20
>=20>  Todolist:
> >=20
>=20>  @@ -103,7 +104,6 @@ Todolist:
> >=20
>=20>  * parport-lowlevel
> >=20
>=20>  * pps
> >=20
>=20>  * ptp
> >=20
>=20>  -* phy/index
> >=20
>=20>  * pwm
> >=20
>=20>  * pldmfw/index
> >=20
>=20>  * rfkill
> >=20
>=20>  diff --git a/Documentation/translations/zh_CN/driver-api/phy/index=
.rst b/Documentation/translations/zh_CN/driver-api/phy/index.rst
> >=20
>=20>  new file mode 100644
> >=20
>=20>  index 000000000000..ba3f570e894f
> >=20
>=20>  --- /dev/null
> >=20
>=20>  +++ b/Documentation/translations/zh_CN/driver-api/phy/index.rst
> >=20
>=20>  @@ -0,0 +1,21 @@
> >=20
>=20>  +.. SPDX-License-Identifier: GPL-2.0
> >=20
>=20>  +
> >=20
>=20>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
>=20>  +PHY =E5=85=AC=E5=85=B1=E6=A1=86=E6=9E=B6
> >=20
>=20>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
>=20
> =E8=BF=99=E9=87=8C=E6=98=AF=E4=B8=8D=E6=98=AF=E7=BF=BB=E8=AF=91=E4=B8=
=BA PHY=E9=80=9A=E7=94=A8=E6=A1=86=E6=9E=B6=E6=9B=B4=E5=A5=BD=E4=BA=9B=EF=
=BC=9F
OK.
>=20
>=20>=20
>=20> +
> >=20
>=20>  +.. toctree::
> >=20
>=20>  +
> >=20
>=20>  + phy
> >=20
>=20>  +
> >=20
>=20>  +Todolist:
> >=20
>=20>  +
> >=20
>=20>  +* samsung-usb2
> >=20
>=20>  +
> >=20
>=20>  +.. only:: subproject and html
> >=20
>=20>  +
> >=20
>=20>  + Indices
> >=20
>=20>  + =3D=3D=3D=3D=3D=3D=3D
> >=20
>=20>  +
> >=20
>=20>  + * :ref:`genindex`
> >=20
>=20>  +
> >=20
>=20>  diff --git a/Documentation/translations/zh_CN/driver-api/phy/phy.r=
st b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
> >=20
>=20>  new file mode 100644
> >=20
>=20>  index 000000000000..ed13b53182c4
> >=20
>=20>  --- /dev/null
> >=20
>=20>  +++ b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
> >=20
>=20>  @@ -0,0 +1,213 @@
> >=20
>=20>  +.. SPDX-License-Identifier: GPL-2.0
> >=20
>=20>  +.. include:: ../../disclaimer-zh_CN.rst
> >=20
>=20>  +
> >=20
>=20>  +:Original: Documentation/driver-api/phy/phy.rst
> >=20
>=20>  +
> >=20
>=20>  +:=E7=BF=BB=E8=AF=91:
> >=20
>=20>  +
> >=20
>=20>  + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> >=20
>=20>  +
> >=20
>=20>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
>=20>  +PHY=E5=AD=90=E7=B3=BB=E7=BB=9F
> >=20
>=20>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
>=20>  +
> >=20
>=20>  +:=E4=BD=9C=E8=80=85: Kishon Vijay Abraham I <kishon@ti.com>
> >=20
>=20>  +
> >=20
>=20>  +=E6=9C=AC=E6=96=87=E6=A1=A3=E8=A7=A3=E9=87=8A=E4=BA=86 PHY =E7=9A=
=84=E5=85=AC=E5=85=B1=E6=A1=86=E6=9E=B6=E5=92=8C=E6=8F=90=E4=BE=9B=E7=9A=
=84api=EF=BC=8C=E4=BB=A5=E5=8F=8A=E5=A6=82=E4=BD=95=E4=BD=BF=E7=94=A8=E3=
=80=82
> >=20
>=20
> ditto
>=20
>=20=E5=90=8C=E6=97=B6=EF=BC=8C=E5=BB=BA=E8=AE=AE API =E9=83=BD=E7=94=A8=
=E5=A4=A7=E5=86=99=EF=BC=8C=E5=85=A8=E6=96=87=E4=BF=9D=E6=8C=81=E4=B8=80=
=E8=87=B4=E3=80=82
>=20
>=20how-to-use =E5=BB=BA=E8=AE=AE=E7=BF=BB=E8=AF=91=E4=B8=BA =E2=80=9C=E4=
=BD=BF=E7=94=A8=E6=96=B9=E6=B3=95=E2=80=9D=EF=BC=8C=E5=90=A6=E5=88=99=E4=
=B8=8D=E5=A4=AA=E9=80=9A=E9=A1=BA=E3=80=82
OK.
>=20
>=20>=20
>=20> +
> >=20
>=20>  +=E7=AE=80=E4=BB=8B
> >=20
>=20>  +=3D=3D=3D=3D
> >=20
>=20>  +
> >=20
>=20>  +*PHY* =E6=98=AF=E7=89=A9=E7=90=86=E5=B1=82=E7=9A=84=E7=BC=A9=E5=
=86=99=EF=BC=8C=E5=AE=83=E8=A2=AB=E7=94=A8=E6=9D=A5=E6=8A=8A=E8=AE=BE=E5=
=A4=87=E8=BF=9E=E6=8E=A5=E5=88=B0=E4=B8=80=E4=B8=AA=E7=89=A9=E7=90=86=E5=
=AA=92=E4=BB=8B=EF=BC=8C=E4=BE=8B=E5=A6=82USB=E6=8E=A7=E5=88=B6=E5=99=A8
> >=20
>=20>  +=E6=9C=89=E4=B8=80=E4=B8=AA=E6=8F=90=E4=BE=9B=E5=BA=8F=E5=88=97=
=E5=8C=96=E3=80=81=E5=8F=8D=E5=BA=8F=E5=88=97=E5=8C=96=E3=80=81=E7=BC=96=
=E7=A0=81=E3=80=81=E8=A7=A3=E7=A0=81=E5=92=8C=E8=B4=9F=E8=B4=A3=E8=8E=B7=
=E5=8F=96=E6=89=80=E9=9C=80=E7=9A=84=E6=95=B0=E6=8D=AE=E4=BC=A0=E8=BE=93=
=E9=80=9F=E7=8E=87=E7=9A=84 PHY=E3=80=82
> >=20
>=20>  +=E6=B3=A8=E6=84=8F=EF=BC=8C=E6=9C=89=E4=BA=9BUSB=E6=8E=A7=E5=88=
=B6=E5=99=A8=E5=86=85=E5=B5=8C=E4=BA=86 PHY =E7=9A=84=E5=8A=9F=E8=83=BD=
=EF=BC=8C=E5=85=B6=E5=AE=83=E7=9A=84=E5=88=99=E4=BD=BF=E7=94=A8=E4=BA=86=
=E4=B8=80=E4=B8=AA=E5=A4=96=E7=BD=AE=E7=9A=84PHY=EF=BC=8C=E6=AD=A4=E5=A4=
=96
> >=20
>=20>  +=E4=BD=BF=E7=94=A8 PHY =E7=9A=84=E8=AE=BE=E5=A4=87=E8=BF=98=E6=9C=
=89=E6=97=A0=E7=BA=BF=E7=BD=91=E3=80=81=E4=BB=A5=E5=A4=AA=E7=BD=91=E3=80=
=81SATA=E7=AD=89=EF=BC=88=E6=8E=A7=E5=88=B6=E5=99=A8=EF=BC=89=E3=80=82
> >=20
>=20>  +
> >=20
>=20>  +=E5=88=9B=E5=BB=BA=E8=BF=99=E4=B8=AA=E6=A1=86=E6=9E=B6=E7=9A=84=
=E7=9B=AE=E7=9A=84=E6=98=AF=E5=B0=86=E9=81=8D=E5=B8=83 Linux =E5=86=85=E6=
=A0=B8=E7=9A=84 PHY =E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E8=9E=8D=E5=85=
=A5=E5=88=B0 drivers/phy=EF=BC=8C
> >=20
>=20>  +=E4=BB=A5=E5=A2=9E=E5=8A=A0=E4=BB=A3=E7=A0=81=E5=A4=8D=E7=94=A8=
=E6=80=A7=EF=BC=8C=E8=BF=9B=E8=80=8C=E6=8F=90=E9=AB=98=E4=BB=A3=E7=A0=81=
=E7=9A=84=E5=8F=AF=E7=BB=B4=E6=8A=A4=E6=80=A7=E3=80=82
> >=20
>=20
> "=E5=A4=8D=E7=94=A8=E6=80=A7" -> "=E5=8F=AF=E5=A4=8D=E7=94=A8=E6=80=A7"
ok.
=E4=BB=A5=E5=A2=9E=E5=8A=A0=E4=BB=A3=E7=A0=81=E7=9A=84=E5=8F=AF=E5=A4=8D=
=E7=94=A8=E6=80=A7,
>=20
>=20>=20
>=20> +
> >=20
>=20>  +=E8=AF=A5=E6=A1=86=E6=9E=B6=E4=BB=85=E9=80=82=E7=94=A8=E4=BA=8E=
=E4=BD=BF=E7=94=A8=E5=A4=96=E9=83=A8 PHY=EF=BC=88PHY =E5=8A=9F=E8=83=BD=
=E6=9C=AA=E5=B5=8C=E5=85=A5=E6=8E=A7=E5=88=B6=E5=99=A8=E5=86=85=EF=BC=89=
=E7=9A=84=E8=AE=BE=E5=A4=87=E3=80=82
> >=20
>=20>  +
> >=20
>=20>  +=E6=B3=A8=E5=86=8C/=E6=B3=A8=E9=94=80PHY provider
> >=20
>=20>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
>=20>  +
> >=20
>=20>  +PHY provider=E6=98=AF=E6=8C=87=E5=AE=9E=E7=8E=B0=E4=B8=80=E4=B8=
=AA=E6=88=96=E5=A4=9A=E4=B8=AA PHY =E5=AE=9E=E4=BE=8B=E7=9A=84=E5=AE=9E=
=E4=BD=93=E3=80=82=E5=AF=B9=E4=BA=8E PHY provider =E4=BB=85
> >=20
>=20>  +=E5=AE=9E=E7=8E=B0=E5=8D=95=E4=B8=AA PHY =E5=AE=9E=E4=BE=8B=E7=9A=
=84=E7=AE=80=E5=8D=95=E6=83=85=E5=86=B5=EF=BC=8C=E6=A1=86=E6=9E=B6=E5=9C=
=A8 of_phy_simple_xlate =E4=B8=AD=E6=8F=90=E4=BE=9B=E5=85=B6=E8=87=AA=E5=
=B7=B1
> >=20
>=20>  +=E7=9A=84 of_xlate =E5=AE=9E=E7=8E=B0=E3=80=82=E5=A6=82=E6=9E=9C =
PHY provider =E5=AE=9E=E7=8E=B0=E5=A4=9A=E4=B8=AA=E5=AE=9E=E4=BE=8B=EF=BC=
=8C=E5=88=99=E5=BA=94=E6=8F=90=E4=BE=9B=E5=85=B6=E8=87=AA=E5=B7=B1=E7=9A=
=84
> >=20
>=20>  +of_xlate =E5=AE=9E=E7=8E=B0=E3=80=82of_xlate =E4=BB=85=E7=94=A8=
=E4=BA=8E dt =E5=90=AF=E5=8A=A8=E6=83=85=E5=86=B5=E3=80=82
> >=20
>=20>  +
> >=20
>=20>  +::
> >=20
>=20>  +
> >=20
>=20>  + #define of_phy_provider_register(dev, xlate) \
> >=20
>=20>  + __of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
> >=20
>=20>  +
> >=20
>=20>  + #define devm_of_phy_provider_register(dev, xlate) \
> >=20
>=20>  + __devm_of_phy_provider_register((dev), NULL, THIS_MODULE,
> >=20
>=20>  + (xlate))
> >=20
>=20>  +
> >=20
>=20>  +of_phy_provider_register =E5=92=8C devm_of_phy_provider_register =
=E5=AE=8F
> >=20
>=20>  +=E5=8F=AF=E7=94=A8=E4=BA=8E=E6=B3=A8=E5=86=8C phy_provider=EF=BC=
=8C=E5=AE=83=E4=BB=A5 device =E5=92=8C of_xlate =E4=BD=9C=E4=B8=BA=E5=8F=
=82=E6=95=B0=E3=80=82=E5=AF=B9=E4=BA=8E dt
> >=20
>=20>  +=E5=90=AF=E5=8A=A8=E6=83=85=E5=86=B5=EF=BC=8C=E6=89=80=E6=9C=89 P=
HY provider =E9=83=BD=E5=BA=94=E4=BD=BF=E7=94=A8=E4=B8=8A=E8=BF=B0=E4=B8=
=A4=E4=B8=AA=E5=AE=8F=E4=B9=8B=E4=B8=80=E6=9D=A5=E6=B3=A8=E5=86=8C PHY pr=
ovider=E3=80=82
> >=20
>=20>  +
> >=20
>=20>  +=E4=B8=8E PHY provider =E5=85=B3=E8=81=94=E7=9A=84=E8=AE=BE=E5=A4=
=87=E6=A0=91=E8=8A=82=E7=82=B9=E9=80=9A=E5=B8=B8=E5=8C=85=E5=90=AB=E4=B8=
=80=E7=BB=84=E5=AD=90=E8=8A=82=E7=82=B9=EF=BC=8C=E6=AF=8F=E4=B8=AA=E5=AD=
=90=E8=8A=82=E7=82=B9=E4=BB=A3=E8=A1=A8=E4=B8=80=E4=B8=AA
> >=20
>=20>  +PHY=E3=80=82=E6=9F=90=E4=BA=9B=E7=BB=91=E5=AE=9A=E5=8F=AF=E8=83=
=BD=E4=BC=9A=E4=B8=BA=E4=BA=86=E4=B8=8A=E4=B8=8B=E6=96=87=E5=92=8C=E5=8F=
=AF=E6=89=A9=E5=B1=95=E6=80=A7=E5=B0=86=E5=AD=90=E8=8A=82=E7=82=B9=E5=B5=
=8C=E5=A5=97=E5=9C=A8=E7=89=B9=E5=88=AB=E7=9A=84=E5=B1=82=E7=BA=A7=E4=B8=
=AD=EF=BC=8C=E5=9C=A8=E8=BF=99=E7=A7=8D
> >=20
>=20>  +=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E5=8F=AF=E4=BB=A5=E4=BD=BF=
=E7=94=A8=E4=BD=8E=E7=BA=A7=E5=88=AB=E7=9A=84 of_phy_provider_register_fu=
ll() =E5=92=8C
> >=20
>=20>  +devm_of_phy_provider_register_full() =E5=AE=8F=E6=9D=A5=E8=A6=86=
=E7=9B=96=E5=8C=85=E5=90=AB=E5=AD=90=E8=8A=82=E7=82=B9=E7=9A=84=E8=8A=82=
=E7=82=B9=E3=80=82
> >=20
>=20>  +
> >=20
>=20>  +::
> >=20
>=20>  +
> >=20
>=20>  + #define of_phy_provider_register_full(dev, children, xlate) \
> >=20
>=20>  + __of_phy_provider_register(dev, children, THIS_MODULE, xlate)
> >=20
>=20>  +
> >=20
>=20>  + #define devm_of_phy_provider_register_full(dev, children, xlate)=
 \
> >=20
>=20>  + __devm_of_phy_provider_register_full(dev, children,
> >=20
>=20>  + THIS_MODULE, xlate)
> >=20
>=20>  +
> >=20
>=20>  + void devm_of_phy_provider_unregister(struct device *dev,
> >=20
>=20>  + struct phy_provider *phy_provider);
> >=20
>=20>  + void of_phy_provider_unregister(struct phy_provider *phy_provide=
r);
> >=20
>=20>  +
> >=20
>=20>  +devm_of_phy_provider_unregister =E5=92=8C of_phy_provider_unregis=
ter
> >=20
>=20>  +=E5=8F=AF=E4=BB=A5=E8=A2=AB=E7=94=A8=E6=9D=A5=E6=B3=A8=E9=94=80PH=
Y.
> >=20
>=20>  +
> >=20
>=20>  +=E5=88=9B=E5=BB=BAPHY
> >=20
>=20>  +=3D=3D=3D=3D=3D=3D=3D
> >=20
>=20>  +
> >=20
>=20>  +PHY =E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E5=BA=94=E5=88=9B=E5=BB=
=BA PHY=EF=BC=8C=E4=BB=A5=E4=BE=BF=E5=85=B6=E4=BB=96=E5=A4=96=E5=9B=B4=EF=
=BC=88=E8=8A=AF=E7=89=87=EF=BC=89=E6=8E=A7=E5=88=B6=E5=99=A8=E8=83=BD=E5=
=A4=9F=E4=BD=BF=E7=94=A8=E5=AE=83=E3=80=82PHY =E6=A1=86=E6=9E=B6
> >=20
>=20>  +=E6=8F=90=E4=BE=9B=E4=BA=86 2 =E4=B8=AA API =E6=9D=A5=E5=88=9B=E5=
=BB=BA PHY=E3=80=82
> >=20
>=20>  +
> >=20
>=20>  +::
> >=20
>=20>  +
> >=20
>=20>  + struct phy *phy_create(struct device *dev, struct device_node *n=
ode,
> >=20
>=20>  + const struct phy_ops *ops);
> >=20
>=20>  + struct phy *devm_phy_create(struct device *dev,
> >=20
>=20>  + struct device_node *node,
> >=20
>=20>  + const struct phy_ops *ops);
> >=20
>=20>  +
> >=20
>=20>  +PHY =E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=A5=E4=BD=
=BF=E7=94=A8=E4=B8=8A=E8=BF=B0=E4=B8=A4=E4=B8=AA API =E4=B9=8B=E4=B8=80=
=EF=BC=8C=E9=80=9A=E8=BF=87=E4=BC=A0=E9=80=92=E8=AE=BE=E5=A4=87=E6=8C=87=
=E9=92=88=E5=92=8C phy ops
> >=20
>=20>  +=E6=9D=A5=E5=88=9B=E5=BB=BA PHY=E3=80=82
> >=20
>=20
> From the context, I think "phy ops" should be "phy_ops".
OK.

>=20
>=20>=20
>=20> +
> >=20
>=20>  +phy_ops =E6=98=AF=E4=B8=80=E7=BB=84=E7=94=A8=E4=BA=8E=E6=89=A7=E8=
=A1=8C PHY =E6=93=8D=E4=BD=9C=EF=BC=88=E4=BE=8B=E5=A6=82 init=E3=80=81exi=
t=E3=80=81power_on =E5=92=8C
> >=20
>=20>  +power_off=EF=BC=89=E7=9A=84=E5=87=BD=E6=95=B0=E6=8C=87=E9=92=88=
=E3=80=82
> >=20
>=20>  +
> >=20
>=20>  +=E4=B8=BA=E4=BA=86=E5=8F=96=E6=B6=88=E5=BC=95=E7=94=A8=E7=A7=81=
=E6=9C=89=E6=95=B0=E6=8D=AE=EF=BC=88=E5=9C=A8 phy_ops =E4=B8=AD=EF=BC=89=
=EF=BC=8Cphy provider=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=
=A5=E5=9C=A8=E5=88=9B=E5=BB=BA
> >=20
>=20
> =E6=AD=A4=E5=A4=84=E5=BA=94=E8=AF=A5=E4=BD=BF=E7=94=A8PHY=E4=BF=9D=E6=
=8C=81=E5=85=A8=E6=96=87=E4=B8=80=E8=87=B4=E3=80=82
OK.


Thanks,
Yanteng
