Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31149365A;
	Mon, 24 Aug 2026 04:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787544446; cv=none; b=jxOYq+Z9Job8EiUoIl8F7bTr1kQq5CVlmDTc5FbIQmIlhj3m/vEY0c+eLOECDE6DVb9yusanV79tTl2RfDzJZ3zrR8WCcb/5AOsMusIYBYTdOLoksI6R59/TuRRCt6sdjnoOhQZ8QTZ9ZBKgmDMYKmyD4oWOQXsmiN0uf7B8Fs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787544446; c=relaxed/simple;
	bh=Gv41JgaxCoqAYa9+L64uldVDsrVuLj9LGjHdd4FbzUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qyoO6orU9OlT/wYfyIpnTmv9B86VdUR6lKfq3ytB30XGk8bMqnp7LSo4OzqQ/w59maMQANaDyh2oNPLIf+c6O4w3X9bNAHaaGbfo0A5QzokoJ+uX0E4imfj8Rp4nlpxh89TyhZ3TU/3aOiUvVkOgJqtKG+vH7TCCoPziO4WFSAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b=KvwO1QOb; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b="KvwO1QOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=anka1.top;
	s=fpjh2607; t=1787544407;
	bh=X0fKo1+NEB9aCzoPtb5nEALVLymv3kBKLMy5z9jZ8VQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KvwO1QObWPiDk38qzYHAJkWMRwoWziKMeEuhcFA7TS2utyiLd2uNIGMUesYr7Lp1f
	 u458rBxjujo/b8Eh79Mlzh8X9J8PrLoUW0gxrXxbiF74RVctV7WFVEXGvgsxCXwoyl
	 IKtcQvnBM9L1qwb9vaxt6xu+Ln0PBBRijuAH743Y=
X-QQ-mid: esmtpsz21t1787544405tbe0c9bf2
X-QQ-Originating-IP: h7oE2B9m/ZykeiA3+OMz/OkGH9vfhDYoooXMzV6gY2g=
Received: from anka-20eya00ycd.localnet ( [182.139.166.197])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Aug 2026 12:06:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13735736887863140643
From: =?UTF-8?B?5LiN5q276bifQW5rYQ==?= <businiaoanka@anka1.top>
To: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 skhan@linuxfoundation.org, Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org
Subject:
 Re: [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
Date: Mon, 24 Aug 2026 12:06:42 +0800
Message-ID: <1BF8CF1BBFF9C472+12992012.O9o76ZdvQC@anka-20eya00ycd>
In-Reply-To: <7724c093-cb99-490d-b632-1381e16962ff@hust.edu.cn>
References:
 <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-3-anka@stu.cdut.edu.cn>
 <7724c093-cb99-490d-b632-1381e16962ff@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:anka1.top:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OAVDFi9GVPS7/n0ZBRaFYAgHbETUsMrQjG+swwbOXOSkYeW9idORRm6q
	i5b4zHOUp6flIKE3xiv73AZXJAwdYpadV7434y5iYclZHeZhkwycG3GV6+vnaY+0d7WPE23
	Yg6/ftbusMglI6QvmiEF9DVvdbf7bFH2OEbJ/leuI3knEguHoQxgttqHrbvq9DkXhcD3quu
	vzaMkGdUCHiPfM/yttNOwA3wa2Y8g2KN0hEQdV0B0KjRaU4/POZy+mPjbEO02vGi2uY4bEl
	bld9B/i/RDSGF4fw0fGNqbTiun6sAXhT/DnS3jMa52v8u2O6Pr9wW9wIKo+kK4Y7wSS+K+5
	m0F50FwMNVGmSASKiTE+K2JUk1p6AuYnZ67L9F4ui/cp1QV54jRaUG57snnEDeNy9cpH3uP
	Us/EO6aAPzhH29xM7TBqm/fDLtdOSxFR74Dd1WmgiwhYAi7xpGiTAKXqktU+V56fsGoiadO
	6rCEiHnqlszMv5TLHtQKwVX/VAPmBUytYvMp3CzRbPGrkRh5lX6MnR9hr3Gd1WuRORmUTjO
	6Nc9NlzparadhlvUKlTEnGd8yyDGo9w6nxviR2XkonEjM85uYdtpbbtgJz1RX+FRrZQ71tp
	4PP/YNEZvRCPXPlxkBiVr+Xl42vf/xSv7PVDPnRIhE6MuwZPRwbmrgAqEg/iYljtkIDb4Mj
	3s7CeuFuBK6IpYwnyHSl2Xb9ZY3nfM82n1/1ZJ4B+i5rrowLXzPHp1cCFlCsWYXW+49RqgA
	G9+OeYiZMu/jaK+c+breDAZ0QTWJc6EBjISenmnOvrg9UbfWxVOl83mB1DPERpMhSFSOzre
	BmxydqAAcZt4Z9Lf0U8OiYyCfOO7OCjdh2QjWULepujdKHuGbw7le5ofrA/Ozf2FT3eNnus
	kOeZcDdthp20gGys851av/mMazBULYZQDYn8gP+xhrW7A2StCF/jbeicWdtj+E1aceQQoKU
	QHdqyIYTW9pHGhmP1ApEZswns7f2wdIvFXXejZaGnBipU4B91GCjYX/cM
X-QQ-XMRINFO: MPJ6Tf5t3I/y2fSkY172hffA6h6sH/836w==
X-QQ-RECHKSPAM: 0

=E5=9C=A8 2026=E5=B9=B48=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 =E4=
=B8=AD=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 21:34:59=EF=BC=8CDongli=
ang Mu =E5=86=99=E9=81=93=EF=BC=9A
> > diff --git a/Documentation/translations/zh_CN/networking/sriov.rst
> > b/Documentation/translations/zh_CN/networking/sriov.rst new file mode
> > 100644
> > index 000000000000..bf37e68f0534
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/networking/sriov.rst
> > @@ -0,0 +1,31 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/networking/sriov.rst
> > +
> > +:=E7=BF=BB=E8=AF=91:
> > +
> > +	=E9=99=88=E6=80=9D=E4=B8=BA Siwei Chen <businiaoanka@anka1.top>
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=E7=BD=91=E5=8D=A1 SR-IOV API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +=E5=BC=BA=E7=83=88=E5=BB=BA=E8=AE=AE=E7=8E=B0=E4=BB=A3=E7=BD=91=E5=8D=
=A1=E4=B8=93=E6=B3=A8=E4=BA=8E=E5=AE=9E=E7=8E=B0 ``switchdev`` =E6=A8=A1=E5=
=9E=8B=EF=BC=88=E5=8F=82=E8=A7=81 :ref:`switchdev`=EF=BC=89
>=20
> The compilation complains this switchdev reference. This documentation
> has no translation in the same directory:
>=20
>    Documentation/translations/zh_CN/networking/sriov.rst:15:
>    WARNING: undefined label: 'switchdev' [ref.ref]
>=20
> Dongliang Mu
>=20

I'm sorry for this. I will use direct link instead of `:ref:` to fix it.



