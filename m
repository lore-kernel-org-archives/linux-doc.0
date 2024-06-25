Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2182C1581E0
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719319593; cv=none; b=Yd4WDQAHk17QLlYJqixJBArZqoG5uxmpHloXfaf+UzYLzIllUwr8itP22GULCdImqFOgkJpLjg5N65ONHn9Gsqaq6Tl8+oYfNVe881EWESY0XNMSwFzrZjGWr0wSqQpFUYiaQcBtZZ/Oj0FKNpJScdNlKtqoAaCgbvJy6Pu9MfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719319593; c=relaxed/simple;
	bh=aCMKWFh4xxVYa5tU04pDD2tCGPX/CvFFSfM+66MsvbM=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=bRiWytTEsnRdAoCIHop+lzfI5bFQvtQ1FI0cGSSJulRObAhyJ65VOFHckXT6bNCBqFJVceTKHNIMFI5zl7e0eBkik0AEqBsy0YS+yaEdBO6pO9FINUCn9BRQdSZqeBGRVRSqrSziJwCKZJbiUjSqSpQRBLT8X6psNTpRT4hY7qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b46SSsMe; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b46SSsMe"
X-Envelope-To: mudongliangabcd@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1719319587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRUgS/gXMmEKnBidq5m4sGK0boAW8/zcD9OcIzFrXMs=;
	b=b46SSsMecjB25zltQhrj31PAYs2r4+WJMEeSgB5gxCK5Yvqf20SfVsQs4SqnE1/AXjvPeL
	Sy0WvqYjqnjnZOS3c9V3U2clBTl+qYQ0IpgcwPQQudCsbpP7vIYz7F9dwonlHiKnFlU9fo
	fPIsNZddooOPsQAr2E+y1t7+gNAETMM=
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
Date: Tue, 25 Jun 2024 12:46:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: si.yanteng@linux.dev
Message-ID: <41de756a66e3b8564287d0d9ee267af0eee48f2e@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2] docs/zh_CN: Add driver-api phy translation
To: "Dongliang Mu" <mudongliangabcd@gmail.com>, "Yanteng Si"
 <siyanteng@loongson.cn>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
 linux-doc@vger.kernel.org
In-Reply-To: <CAD-N9QWkd0Q+evmKs=NRRg01w2yd9kYRS=nD_7=2_xYGTPLrPw@mail.gmail.com>
References: <20240625032352.3290797-1-siyanteng@loongson.cn>
 <CAD-N9QWkd0Q+evmKs=NRRg01w2yd9kYRS=nD_7=2_xYGTPLrPw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

2024=E5=B9=B46=E6=9C=8825=E6=97=A5 13:59, "Dongliang Mu" <mudongliangabcd=
@gmail.com> =E5=86=99=E5=88=B0:



>=20
>=20On Tue, Jun 25, 2024 at 11:24 AM Yanteng Si <siyanteng@loongson.cn> w=
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
>=20>  v2:
> >=20
>=20>  Modified some sentences in accordance with Dongliang's comments.
> >=20
>=20>  .../translations/zh_CN/driver-api/index.rst | 2 +-
> >=20
>=20>  .../zh_CN/driver-api/phy/index.rst | 20 ++
> >=20
>=20>  .../translations/zh_CN/driver-api/phy/phy.rst | 213 ++++++++++++++=
++++
> >=20
>=20>  3 files changed, 234 insertions(+), 1 deletion(-)
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
>=20>  +PHY =E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=A5=E4=BD=
=BF=E7=94=A8=E4=B8=8A=E8=BF=B0=E4=B8=A4=E4=B8=AA API =E4=B9=8B=E4=B8=80=
=EF=BC=8C=E9=80=9A=E8=BF=87=E4=BC=A0=E9=80=92=E8=AE=BE=E5=A4=87=E6=8C=87=
=E9=92=88=E5=92=8C phy_ops
> >=20
>=20>  +=E6=9D=A5=E5=88=9B=E5=BB=BA PHY=E3=80=82
> >=20
>=20>  +
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
=EF=BC=8CPHY provider=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=
=A5=E5=9C=A8=E5=88=9B=E5=BB=BA
> >=20
>=20
>  The Chinese translation of dereference should be =E2=80=9C=E8=A7=A3=E5=
=BC=95=E7=94=A8=E2=80=9D, a terminology.
>=20
>=20>=20
>=20> +PHY =E5=90=8E=E4=BD=BF=E7=94=A8 phy_set_drvdata()=EF=BC=8C=E5=B9=
=B6=E5=9C=A8 phy_ops =E4=B8=AD=E4=BD=BF=E7=94=A8 phy_get_drvdata()
> >=20
>=20>  +=E6=9D=A5=E5=8F=96=E5=9B=9E=E7=A7=81=E6=9C=89=E6=95=B0=E6=8D=AE=
=E3=80=82
> >=20
>=20
> I prefer not to translate "in phy_ops". The delivered content from
>=20
>=20this sentence should be:
>=20
>=20PHY provider=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E4=BD=BF=E7=94=A8phy=
_set_drvdata=E8=AE=BE=E7=BD=AE=E7=A7=81=E6=9C=89=E6=95=B0=E6=8D=AE=EF=BC=
=8C=E4=BD=BF=E7=94=A8phy_get_drvdata=E8=8E=B7=E5=8F=96=E7=A7=81=E6=9C=89=
=E6=95=B0=E6=8D=AE=E3=80=82
>=20
>=20=E6=84=9F=E8=A7=89=E5=8F=AF=E4=BB=A5=E8=BF=9B=E8=A1=8C=E6=84=8F=E8=AF=
=91=E3=80=82
OK.
=E5=9C=A8 phy_ops =E4=B8=AD=EF=BC=8CPHY provider=E9=A9=B1=E5=8A=A8=E7=A8=
=8B=E5=BA=8F=E5=9C=A8=E5=88=9B=E5=BB=BA PHY =E5=90=8E=E4=BD=BF=E7=94=A8 p=
hy_set_drvdata()
=E8=AE=BE=E7=BD=AE=E7=A7=81=E6=9C=89=E6=95=B0=E6=8D=AE=EF=BC=8C=E4=BD=BF=
=E7=94=A8 phy_get_drvdata() =E8=8E=B7=E5=8F=96=E7=A7=81=E6=9C=89=E6=95=B0=
=E6=8D=AE=E3=80=82
>=20

>=20>=20
>=20>  +
> >=20
>=20>  +=E9=94=80=E6=AF=81 PHY
> >=20
>=20>  +=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
>=20>  +
> >=20
>=20>  +=E5=8D=B8=E8=BD=BD=E5=88=9B=E5=BB=BA PHY =E7=9A=84=E9=A9=B1=E5=8A=
=A8=E7=A8=8B=E5=BA=8F=E6=97=B6=EF=BC=8C=E5=AE=83=E5=BA=94=E8=AF=A5=E4=BD=
=BF=E7=94=A8=E4=BB=A5=E4=B8=8B 2 =E4=B8=AA API =E4=B9=8B=E4=B8=80=E9=94=
=80=E6=AF=81=E5=85=B6=E5=88=9B=E5=BB=BA=E7=9A=84
> >=20
>=20
> =E5=BD=93=E5=88=9B=E5=BB=BA PHY =E7=9A=84=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=
=BA=8F=E8=A2=AB=E5=8D=B8=E8=BD=BD=E6=97=B6=EF=BC=8C=E5=AE=83=E5=BA=94=E8=
=AF=A5=E4=BD=BF=E7=94=A8=E4=BB=A5=E4=B8=8B 2 =E4=B8=AA API =E4=B9=8B=E4=
=B8=80=E9=94=80=E6=AF=81=E5=85=B6=E5=88=9B=E5=BB=BA=E7=9A=84
>=20
>=20=E8=BF=99=E4=B8=AA=E2=80=9C=E5=AE=83=E2=80=9D =E5=BA=94=E8=AF=A5=E6=
=8C=87=E7=9A=84=E6=98=AF=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=EF=BC=8C=E6=
=89=80=E4=BB=A5=E6=8D=A2=E6=88=90=E5=80=92=E8=A3=85=E4=BC=9A=E5=A5=BD=E4=
=B8=80=E4=BA=9B=E3=80=82
OK.
>=20
>=20Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>


Thanks for your review.


Thanks,
Yanteng
