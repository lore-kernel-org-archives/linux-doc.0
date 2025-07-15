Received: from sg-3-20.ptr.tlmpb.com (sg-3-20.ptr.tlmpb.com [101.45.255.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AC726FDBF
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566416; cv=none; b=kbz49tPYo/y+3VbaJK1w4sAjfEzRfCm9MY39dRNrHzBkuhG0iCbo8bsb4tqqylr4YWGonLG+o9DjDiRs/n4HtOP6eRWCzXs/O63ZzjpjUBVBvUkac1vG+i2U9oOBV8+9ix+L5Ui0aGRIcP4t7fK9ic76v3sR3DtKApeto4K2GmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566416; c=relaxed/simple;
	bh=kqKUlrrJtg+1gDQ0M0tYYhsNpEFPk456O+/cu9n/SZw=;
	h=References:In-Reply-To:Date:To:Subject:Mime-Version:Message-Id:Cc:
	 From:Content-Type; b=di7A5vuW9OjpfZPKTgQ2cEuMFcz68gFdouX/MpCxDlJmXMuPIEbIL7qrpmZ82drc4ecUL11TbyIdkzfFsMbROzoxPq6dlPZvq5eenUMydnVEVNFxD8c9FBBwmPVwLkE9nxBBaROcSsUbsus8K8abHRgtFudfc1p+NKMFZQeI2k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com; spf=pass smtp.mailfrom=leap-io.com; dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b=C/Wq8owO; arc=none smtp.client-ip=101.45.255.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b="C/Wq8owO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=leap-io-com.20200927.dkim.feishu.cn; t=1752566401;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kqKUlrrJtg+1gDQ0M0tYYhsNpEFPk456O+/cu9n/SZw=;
 b=C/Wq8owOoIDKEN3c3rUYtP5/az4XiMgxOW+AtlxBZX1PffvUqCN8zW3mAjZANoX9Y9t/CN
 DM3dd8KSolOqexzI2O5RQCNKBln/aCw+eM/YkS9/6tcHFiuK5Tj4aqXBiRJK4BiKP9o5CI
 5eHv26bIuHEW3KGC0ACV6iR4dpMQrG9PVtDsUa5XnMno9kvrMDQs6zYelKAm+0GmxFBWsP
 f9hdXd7cAcmGgin9hAkRfgK1M0Pt0lEYUs3Zfg7JGtmAWglWg4ETWoLXwZNfodJa1cn8TA
 mYXebkc9dMKlD4xRt5MxPFjGoFMQR+3V54bTbUtCMu90dmWjnXLWdEmnzwuZzA==
References: <20250708024139.848025-2-doubled@leap-io.com>
	<1bb11814-4def-43ae-8ea8-64bcd05aa3c4@linux.dev>
In-Reply-To: <1bb11814-4def-43ae-8ea8-64bcd05aa3c4@linux.dev>
X-Lms-Return-Path: <lba+168760a7f+be6f00+vger.kernel.org+doubled@leap-io.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Jul 2025 15:59:58 +0800
To: "Yanteng Si" <si.yanteng@linux.dev>
Subject: Re: [PATCH 1/7] docs/zh_CN: update subsystem-apis.rst translation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-Id: <220d7401030e8c57cb19a90642e0e0ae27071c38.be4b25b8.5972.44c4.9dbe.8ddf91dc65e9@feishu.cn>
Cc: <alexs@kernel.org>, <dzm91@hust.edu.cn>, <corbet@lwn.net>, 
	<linux-doc@vger.kernel.org>
From: =?utf-8?q?=E9=83=9D=E6=A0=8B=E6=A0=8B?= <doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8


> From: "Yanteng Si"<si.yanteng@linux.dev>
> Date:=C2=A0 Wed, Jul 9, 2025, 09:34
> Subject:=C2=A0 Re: [PATCH 1/7] docs/zh_CN: update subsystem-apis.rst tran=
slation
> To: "haodongdong"<doubled@leap-io.com>, <alexs@kernel.org>
> Cc: <dzm91@hust.edu.cn>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>
> =E5=9C=A8 7/8/25 10:41 AM, haodongdong =E5=86=99=E9=81=93:

> > Remove scsi/index from TODOList

> >

> > Signed-off-by: haodongdong <doubled@leap-io.com>

> > ---

> > =C2=A0 Documentation/translations/zh_CN/subsystem-apis.rst | 2 +-

> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)

> >

> > diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Docu=
mentation/translations/zh_CN/subsystem-apis.rst

> > index 8b646c1010be..0f121f9b0f70 100644

> > --- a/Documentation/translations/zh_CN/subsystem-apis.rst

> > +++ b/Documentation/translations/zh_CN/subsystem-apis.rst

> > @@ -71,12 +71,12 @@ TODOList:

> > =C2=A0 =C2=A0 =C2=A0:maxdepth: 1

> > =C2=A0=C2=A0

> > =C2=A0 =C2=A0 =C2=A0filesystems/index

> > + =C2=A0 scsi/index

> > =C2=A0=C2=A0

> > =C2=A0 TODOList:

> > =C2=A0=C2=A0

> > =C2=A0 * block/index

> > =C2=A0 * cdrom/index

> > -* scsi/index

> > =C2=A0 * target/index

> > =C2=A0=C2=A0

> > =C2=A0 **Fixme**: =E8=BF=99=E9=87=8C=E8=BF=98=E9=9C=80=E8=A6=81=E6=9B=
=B4=E5=A4=9A=E7=9A=84=E5=88=86=E7=B1=BB=E7=BB=84=E7=BB=87=E5=B7=A5=E4=BD=9C=
=E3=80=82

>=C2=A0
> This patch should not be split in this way and should include at least on=
e rst file.

Thanks for your feedback!
I understand the issue. In v3, I will fix the that.

>=C2=A0
> Thanks,

>=C2=A0
> Yanteng
>=C2=A0


Best regards, =C2=A0
Dongdong Hao
