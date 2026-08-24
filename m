Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE921ABB1;
	Mon, 24 Aug 2026 04:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787544663; cv=none; b=HX92Gc122U2PN4Mm2Tz+cpSAUKkwWcsFCMju+BfUZkm9heR/gQr13/AbJWLtMSoBUjgmLfNxHGtcT4I9/6YuR+DmxNdULtm5znbrH7S0BfN9/7nn/HJjl+qT5fBU35AwE2xh0U6IwhdMs/E3UVnQV3KdahNhsf9ea6tc78A9CDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787544663; c=relaxed/simple;
	bh=Omu7oyZhbrfZiey2up9CFD8hKsYHDXhGsgzzvKuoWEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QaBXBkKnAUWONGEpT7z0xsUbWG0xPblfwo68NA9sGwZo+/0nc4uhko8EQsnhcpUT5ADDX/lLtWXkH+ixrA+uoCBR+iaN2wl6h7UG8a9ZJTcqL2B+Zu0gTpMfV+QhfmnkAGFy4TIOce4F0H7XRdOAb1Gv6MNA/DYc9+v4O/u0+zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b=nsxNDpC/; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b="nsxNDpC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=anka1.top;
	s=fpjh2607; t=1787544611;
	bh=Omu7oyZhbrfZiey2up9CFD8hKsYHDXhGsgzzvKuoWEU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nsxNDpC/E/zTXg7/qQxgVqozvuxdi3xkMZJkwSiVCTIg4cr/KzSzxId6R0a5voS2D
	 zegkjr2+XtBC7Hl11kGinaGzHV3ogaOSfIr7+VaKcCzLDzQVJBPbGGnHJ9GRktToVA
	 1qIF96s+OeKoY5sr+s/pDKIWn08W8kNOMeQx7gyw=
X-QQ-mid: esmtpgz13t1787544609taa39c93a
X-QQ-Originating-IP: JKGFWMpIv8IX3P2u/wIW1d7j4J6rJKjfkdraci7GOK0=
Received: from anka-20eya00ycd.localnet ( [182.139.166.197])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Aug 2026 12:10:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5037479700794361139
From: Siwei Chen <businiaoanka@anka1.top>
To: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 skhan@linuxfoundation.org, Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org
Subject:
 Re: [PATCH v4 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese translation
Date: Mon, 24 Aug 2026 12:10:07 +0800
Message-ID: <4C2C4668DE2CE21B+5160696.31r3eYUQgx@anka-20eya00ycd>
In-Reply-To: <b45c6389-a048-4a94-8649-ab0c5a80fac2@hust.edu.cn>
References:
 <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-6-anka@stu.cdut.edu.cn>
 <b45c6389-a048-4a94-8649-ab0c5a80fac2@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:anka1.top:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MeFNLUIt+GJ0NfgNFsoU5p5aRgGTpqEiZhXDwCunLDiLd+IzfWG6onYd
	cb332g8+ip2az+xhC+PTFv28ura6DWQB+i5Sdu6EiV0duA56rJQ2SO3BgbCK7ZjOFAMi/Lu
	InJp9WrKcO4ZsdFBmS07ylHNrnlGjy8V3hHxewF9FUxkubEg1OXqSFEPwPQOyBlPJgPjGlB
	7xxoWf+PqpDJ79yFk1OR3HIh+rlI91D+OZfmuKCMXNL/7AQdFrTQU/Sz4xly1VOLrOv+OS2
	HsbW9dPu7WjkP53UqEyoEzslcKbKwLsJxyv1wZq7UtnXVlzYtonc8RWHWr4nmZ9Qe2vszSC
	gLf6TpbCRML/gsiB/eH+X0uECJgZpsTyZbu3Q1gTGEG0muNXS8iOMRUuybvO23eRz5zaa8u
	VZ6pzvwDnfdnDkm+XQRmNfgm9sZPXz6+qIzeaDqRU6sluu+6fMpovbVdsmql+5+FDYKWyG/
	Nq6kiKYW1aslq/soENYUgrgHY3V4xMs6VY1kyf4rFe+v+Fsq5PQ9FR2pIGrpIJzuj9xe4He
	XsV4YxX4Mc6zjr55oCO5uM2enAT7dCu1/irSFloTX9JG+VhpSxeRYSu5sAUt8dbXpIZtg2V
	fWs3Z1N6/X3m7Yl1MlN2k00EGVpQOkIOqigxJssgE8oqhl6TmQTb/nM96IP8hcMZbJlQpED
	IYtVRBF2CVMfwGepHWHw6OetIM6yahbbEaA2+nCUu9XV2/QUeTcSk/x3KUH5dKYEgn7s5l3
	9yWvko5126iBzDCLcdVqNF6oSuNKszvWDkqYvHHugnc1t6TuRdwqS3IEzAO+gu+t1+ve8oR
	x08lPBXqmSgvsfjrfAad/S4bKBK/94HRgZZKHpflg+mTG8oxnu3nni3vuaQRVTA8NWy5rlk
	2moOZlaHhRzEEfEc2LZsiOBRZVKBIW7Qvxaw9e7tYBvXgtJV7iJP0AidigjIlaCank+gHU+
	sTVnw17Cp0tmuJyDz7EfjJE2oMkQXIkzxsQ+k5R5iYvt2EioWiWNB45XH1X2IpdJaI75PLF
	qhPCPXuBjCZBW6msDVY/SiVAJsUh8=
X-QQ-XMRINFO: OD9hHCdaPRBwPcJAcl0JQpXfx3yufe/C8w==
X-QQ-RECHKSPAM: 0

=E5=9C=A8 2026=E5=B9=B48=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 =E4=
=B8=AD=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 21:29:06=EF=BC=8CDongli=
ang Mu =E5=86=99=E9=81=93=EF=BC=9A
> On 8/17/26 10:13 AM, Siwei Chen wrote:
> > From: Siwei Chen <businiaoanka@anka1.top>
> >=20
> > Translate .../networking/secid.rst into Chinese.
> >=20
> > Update the translation through commit de1fd4a7b0f2
> > ("docs: networking: convert secid.txt to ReST")
>=20
> Two small issues in this patch:
>=20
> 1. revise the commit title: SeLinux -> SELinux. You may miss one of my
> email -
> https://lore.kernel.org/all/e98bd534-4496-433f-9847-2c5040ecd315@hust.edu=
=2Ecn
> /
>=20
> 2. I observed one small inconsistency: flowi structure and flow
> structure. After searching, the flow structure may refer to flowi,
> flowi4, flowi6, or simple typo, no matter what it is, let us translate
> it into "flowi =E7=BB=93=E6=9E=84=E4=BD=93"
>=20
> Dongliang Mu
>=20

Thank you for your review. I will make correction in v5 patch.



