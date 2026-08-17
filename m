Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065634B049B;
	Mon, 17 Aug 2026 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786929109; cv=none; b=E+bZsdIL7hycNSmt1PcGnCVFp2SJTWBp9Y+tDrzQtGJELMfaq+8wc+rp/OqVVaLfN9KLZQCA1RmLrX7Ccv4+0ViQih789YHVWrAwP7/KSLf11D295J7Sl0IGvWoAE8fLMBIRtpBSLNYYR4v2ZsJDws41LcPXWP9L3UfYH0xDfyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786929109; c=relaxed/simple;
	bh=ryy6QSPygN1w4Y3Y2aGYJKkbkYmDDTADOLmjDbbilm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OMzPluvUesYt3f0xmONCig5hrO5QuXdTk1dRniIWhEuaqh+rYtvvXucNJz81Xb8xNxtd0r9gU0evPQSE7IqkpA++c18IXysEIZXkgqrpWTryBt2IPoRYQgyx8C3CIHwfDmtpiu/XOFVqi68rnDVOfLCXgXlWgwkIQca95twKLOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b=s8PLLyil; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b="s8PLLyil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=anka1.top;
	s=fpjh2607; t=1786929059;
	bh=NuPasqQOkFmznF3FAZUzzq02R+umP7Beu4l0GiAaqSM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=s8PLLyilOJ9Y33JKI90lm5w5IYdCcz6m+1sAIrqx06nyZE+o0MTmdl4xKzo4ZRb2R
	 Y4oSr96y7xgpPcwS+eBWjoIAi3ofQ9TzA4M/GNZWH1Mpzp/mfJ7fxeZ1cJ/l6e5Lmv
	 lX2yIPkViZ+FzKDaWfNnxtV7fseukzjGwxTP8sjg=
X-QQ-mid: esmtpsz17t1786929057ted6cc589
X-QQ-Originating-IP: WZi8o6ppZFQbQYVyFpiEwFZyuqpG6GbHn+OIZizUcXc=
Received: from anka-20eya00ycd.localnet ( [182.139.166.85])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 17 Aug 2026 09:10:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10172548954044152815
From: Siwei Chen <businiaoanka@anka1.top>
To: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 skhan@linuxfoundation.org, Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org
Subject:
 Re: [PATCH v3 0/5] docs/zh_CN: Add Chinese translations for five networking
 documents
Date: Mon, 17 Aug 2026 09:10:52 +0800
Message-ID: <379027B83813F552+12954951.O9o76ZdvQC@anka-20eya00ycd>
In-Reply-To: <463fc2dd-4d79-434d-b138-f4baea93bc40@hust.edu.cn>
References:
 <20260811071200.54062-1-anka@stu.cdut.edu.cn>
 <463fc2dd-4d79-434d-b138-f4baea93bc40@hust.edu.cn>
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
X-QQ-XMAILINFO: NUTz4BkILuKLb6kOKvEZbvROjaQQlQKFNgkv8GF5XSwFMkRgu4j0F6m/
	YlAseTgfKCjJo3lykHiQDOGqTo29Bf1gOx4ANtfE6pyps8ULZX8qbkQcN2lrbWBzk0SZqvt
	YwkA9MTOX4HkcZcRQ7XBQDNWO6VENBYKOxiB2cH2IBj6pxDSq/7THBcVv+mXVBCLulyfjBS
	xFDrRfj6HcmrTeh61ajND3ZellKKr6g7CpUxjviCyni8pDbUagpF+v+4mGci8NAzCUN/aUx
	DpZVXOT2zSsha1jxwFy+p1i5FC1YB6++9QTj4IiL2tubpeHo5ck2QNy8DqwDgzG6SyBVJDO
	nDL4+LdDW5Jphgdhkz0o2dOSM9JzAjTASoH1TSVmQhxcfmTe2xlpKtLeyTiRXsveetY4Fdv
	NslWbsbdNayTNKeE82AEIt1Scy3ktVULa6ORscwJ5uG574GtkdMWkQKHMHAtwGVnbW7F9MX
	bNQGzlfMksjWuaYEGxTOC0ubwrvkiEjrCocTs/AB2Jvd8OIr1K69EfnDw236seXXuaVRgNZ
	rVnyqvbvPj2pcTmv4K6ZY+NwBt6fc4BO29HcJWD8cw6Qqv8zfnkDMPfL8zVEtc5V/d81mC1
	gbDtAAza+0+mFmbZHIOWxISEqJCVgxQ+NHin55tzlfXnSeSvU3siYSArqaA+kudjUzPOy4V
	cUoRzYjQs3ICUOUbT/q3DeNdmMyhA8HuiSiLp/c9pugraIW/JWO+Rqzr86vVmetlJkQjBXq
	v9rmxHyr4F14bIm9DCm+JsJMsOumjWgF1Juv0/L/bgiz1YSGBKURwXTyy2wPuaVUmhCkAvZ
	Mgul7KvpzytZaqPizVO3veLMxjPSveBP4t0GyzRerDypYbVEnzSo5dSdiemp+r6zo9mRPvR
	p7kMEcAb+sUBQLXUND38HoE0/yqc4CXlOtg1jGzlKMrsusIr1n5G9MYx8YHgVG1+a23YArI
	pCNz+nZBveyZWPSC5ONt6dIiNaAMzmp8V2QGAMiR3gf02pQ==
X-QQ-XMRINFO: NI4Ajvh11aEjMcdZLWux7YEoJQGtlH95XA==
X-QQ-RECHKSPAM: 0

=E5=9C=A8 2026=E5=B9=B48=E6=9C=8816=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 =E4=
=B8=AD=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 17:41:33=EF=BC=8CDongli=
ang Mu =E5=86=99=E9=81=93=EF=BC=9A
> On 8/11/26 3:11 PM, Siwei Chen wrote:
> > From: Siwei Chen <businiaoanka@anka1.top>
> >=20
> > This series adds Simplified Chinese translations for five documents
> >=20
> > under Documentation/networking/:
> >    - team.rst: Team devices driven from userspace via libteam
> >    - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
> >    - driver.rst: Softnet driver issues (probing, close/stop,
> >   =20
> >      transmit path guidelines, and extack error reporting)
> >   =20
> >    - ipv6.rst: ipv6 module parameters (disable, autoconf,
> >   =20
> >      disable_ipv6)
> >   =20
> >    - secid.rst: LSM/SELinux secid usage in the flowi structure
>=20
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>=20
> Please remember to two small minor issues.
>=20

Thank you for the review. I'll fix the issues in v4.



