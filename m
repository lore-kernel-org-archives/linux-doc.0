Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452F929A2
	for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2024 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731734497; cv=none; b=rsjPT3UKl66k3bPzTBKVS8RKY4Qi84Hid4Q5zSBQosACv8UjzSoUVd9R3gSMVHHFNEFNDMRJPJetbglSuhoR680f7bvPyXv2Z3MmMirwlgLTrHD5z9G4FYLGWqQ11WMLWV6bX4rvQssMYJDCuCWbNiKjTE2D0IRA/4QdoeENKmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731734497; c=relaxed/simple;
	bh=3qKIl9AclIsfVDwnro/fNVLDhkMANDCQt5wWJJe5lHE=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=aD+DpTRh2/nH/kXYaDPbFrBo7iE8V2ZpjM6Sha2hsVOs5suBnraDeQzsvLa269pDrt5zRbD3VFcLU4tS8ZqoT8cmmhZMg3Fbh2AiXKer25qWQDiey/+BSDKvDRKarR6eN4j9m6ozu2MSOo8F1p25aI8n1VOfXrPaEwDeop17L5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Kxa9YvhQ; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kxa9YvhQ"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241116052132epoutp021aa7ad4589a5c99e9797a1fbab63494e~IW1hr31SF0482904829epoutp02k
	for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2024 05:21:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241116052132epoutp021aa7ad4589a5c99e9797a1fbab63494e~IW1hr31SF0482904829epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731734492;
	bh=3qKIl9AclIsfVDwnro/fNVLDhkMANDCQt5wWJJe5lHE=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=Kxa9YvhQgt/E5xKMr2d+I8ban3Z1pfcU+O7CtknYiwfCOL9shbg4NLWebeX1gWx50
	 W64UYTj6Iw1tKfOVw0aUdYUzait3HERkeQK+SJZha+ZghWU+qmf2qxzY5/GdiWHObL
	 +aeucki6xxPmkmetlblqN8hUAG+JQWIazfNCRPH0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20241116052131epcas1p3062855162d089110d96bfdd0ba170bb5~IW1g8rJut2289722897epcas1p3D;
	Sat, 16 Nov 2024 05:21:31 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.233]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Xr2LL2Fktz4x9Q3; Sat, 16 Nov
	2024 05:21:30 +0000 (GMT)
X-AuditID: b6c32a36-dc3fb70000018336-df-67382bda43bd
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	6D.A7.33590.ADB28376; Sat, 16 Nov 2024 14:21:30 +0900 (KST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: RE: Re: [PATCH] Documentation: extcon: add documentation for Extcon
 subsystem
Reply-To: myungjoo.ham@samsung.com
Sender: MyungJoo Ham <myungjoo.ham@samsung.com>
From: MyungJoo Ham <myungjoo.ham@samsung.com>
To: anish kumar <yesanishhere@gmail.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, "corbet@lwn.net" <corbet@lwn.net>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <CABCoZhANKY5wjc=NqAd64Fhmdjx1k-x=zVkU+ySRDRvK0Gj2iw@mail.gmail.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241116052130epcms1p4f503dac1338c96ff33f8e5d7d58d6389@epcms1p4>
Date: Sat, 16 Nov 2024 14:21:30 +0900
X-CMS-MailID: 20241116052130epcms1p4f503dac1338c96ff33f8e5d7d58d6389
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7bCmru4tbYt0g81f+S2eHGhntLj+5Tmr
	xcK2JSwWl3fNYbOYt28zmwOrx85Zd9k9FvdNZvXo27KK0ePzJrkAlqhsm4zUxJTUIoXUvOT8
	lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygvUoKZYk5pUChgMTiYiV9O5ui
	/NKSVIWM/OISW6XUgpScAtMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Iy2GQeYC96yVzx9Ppu1
	gXEjexcjB4eEgInE568GXYxcHEICOxglZs++ygQS5xUQlPi7Q7iLkZNDWCBCovHmYlYQW0hA
	SaLh5j5miLi+RMeDbYwgNpuArsTWDXdZQGwRgWKJ/d17weqZBWokdkz4DlYjIcArMaP9KQuE
	LS2xfflWsDinQKDE3ZbNrBBxUYmbq9+yw9jvj82H6hWRaL13lhnCFpR48HM3VFxSou/OXiaQ
	+yUEtjFK7Dgyhw3C2c8oMeVhG9QkfYkzc0+ygdi8Ar4SE/vmgW1jEVCV2Lv7AhtEjYvEhjVd
	7BBXa0ssW/iaGRQQzAKaEut36UOE+STefe1hhXlmx7wnTBC2msSh3UugVslInJ6+EOpQD4mH
	bxtYIIF7ilFi554mtgmM8rMQ4TsLybZZCNsWMDKvYhRLLSjOTU8tNiwwgsdocn7uJkZwutMy
	28E46e0HvUOMTByMhxglOJiVRHgvuZqnC/GmJFZWpRblxxeV5qQWH2I0BfpzIrOUaHI+MOHm
	lcQbmlgamJgZGZtYGJoZKonznrlSliokkJ5YkpqdmlqQWgTTx8TBKdXA5FCSdKZuTqX4DfvY
	rEwf/hMOM1pknGZkt1fc/mwr8vRVo4uNV9djgzcvdujkMz04p6aywOvZHOf3VY99UtiOFc3g
	zze7wmQwo3Pm3SWLjvy5abjq6A7hcu09PYFmZcfnrXgfpn9yk6m3v7sr40N7ns+XSn80tN67
	sZnF7KHfrAPcv9O8w5tzTl6+KKvTn7Z4Tplluf+JDfKTfuTeZjDbnnJeyiSTJVvNvHXC/S2r
	RLZum+c1zVGZxalPtcTuls8L03KpyC1n9Pn3JLyqKY7om7pRlnPWwbr//ybfOLTxolb69uWx
	v8VPsfRMy1E6/WZDhJ2Y46ay2EsCDx4dE70Z+PPlJSuX6R92RYmkbHywVImlOCPRUIu5qDgR
	ACbgHIsABAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241108043735epcas1p39b2350911bd630f58be192c1680acd5c
References: <CABCoZhANKY5wjc=NqAd64Fhmdjx1k-x=zVkU+ySRDRvK0Gj2iw@mail.gmail.com>
	<20241103025436.69196-1-yesanishhere@gmail.com>
	<CGME20241108043735epcas1p39b2350911bd630f58be192c1680acd5c@epcms1p4>

>Hello Myungjoo/Chanwoo,
>
>Wondering if you have any comments?

Nope. It looks good to me.

Acked-by: MyungJoo Ham <myungjoo.ham=40samsung.com>

>
>On Sat, Nov 2, 2024 at 7:54=E2=80=AFPM=20anish=20kumar=20<yesanishhere=40g=
mail.com>=20wrote:=0D=0A>>=0D=0A>>=20The=20Extcon=20(External=20Connector)=
=20subsystem=20driver=20lacked=20proper=0D=0A>>=20documentation.=20This=20c=
ommit=20adds=20comprehensive=20documentation=0D=0A>>=20explaining=20the=20p=
urpose,=20key=20components,=20and=20usage=20of=20the=20Extcon=0D=0A>>=20fra=
mework.=0D=0A>>=0D=0A>>=20The=20new=20documentation=20includes:=0D=0A>>=20-=
=20An=20overview=20of=20the=20Extcon=20subsystem=0D=0A>>=20-=20Descriptions=
=20of=20key=20structures=0D=0A>>=20-=20Explanations=20of=20core=20functions=
=0D=0A>>=20-=20Information=20on=20the=20sysfs=20interface=0D=0A>>=20-=20A=
=20usage=20example=20for=20driver=20developers=0D=0A>>=0D=0A>>=20Signed-off=
-by:=20anish=20kumar=20<yesanishhere=40gmail.com>=0D=0A>>=20---=0D=0A
