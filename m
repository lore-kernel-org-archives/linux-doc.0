Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AFC2FBE;
	Mon, 10 Aug 2026 01:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786324584; cv=none; b=Au5ofTdY+SyCVJil+T56Wr58KPJYv//PkP0oxcV6OZ3RtsNKdH8CGgepVa1a+ijYUeDMSmjEzpwV6oGK1yLHADy8eivmu9YZKcWbvw0OIPZkee+UFh6ljFuq9k6FoWDxlbROTT+0bC74FLpZ7P7P/8kYVc+bla3DekJBMDEOgB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786324584; c=relaxed/simple;
	bh=rbrRi11I6qOw1JS5/3NzaYjbAQN4/Vletf+9Nj4kEEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkXuD2jAwS9OrI0kC9sn8Gn+1RCvUFi93fRKHmrnOH4M1eOJl/F1EvTICPn0fpSzDS9ikqPKGKF321vuMzR2lLOz9vHgSWRMkTBiFSB20CdQ2rHDYqyYo8che6c8nzeP/LXFal3m7/GRZcrHVfyF6DMQgRyiw4645V4q/MHZye0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b=DlzkyVid; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b="DlzkyVid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=anka1.top;
	s=fpjh2607; t=1786324535;
	bh=yEaVS6nQ0XEVBRDx4COLJ87oqZq91YA83wSOhmu55jU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=DlzkyVidBVm8adNj1sn9nb1DsR6PGYeOKTsmTcAqWom/pYqlOBXtNZ9csFt7XsEIv
	 Ndj1mulpk84bCR7SLVngRg3a9Yrw1WQMHZJQ7Wp77njyLozmM9RFR+bF7tMT3eMCxw
	 QaWBXU7K10Jxi2XEzjcrj4VDLecMsvrvcvhrqYuI=
X-QQ-mid: esmtpsz17t1786324533tbee50e23
X-QQ-Originating-IP: jU1vNZFjPZYqQkMSo4LSpZ+fv/ctLGNV3a6/oN0ufPQ=
Received: from anka-20eya00ycd.localnet ( [110.188.67.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 09:15:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10038015587027930732
From: Siwei Chen <businiaoanka@anka1.top>
To: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net,
 skhan@linuxfoundation.org, Siwei Chen <anka@stu.cdut.edu.cn>
Cc: wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 0/5] docs/zh_CN: Add Chinese translations for five networking
 documents
Date: Mon, 10 Aug 2026 09:15:30 +0800
Message-ID: <E0A8AEC487870DFA+12952253.O9o76ZdvQC@anka-20eya00ycd>
In-Reply-To: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
References: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
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
X-QQ-XMAILINFO: N/36BtZsN8Hh1RFcSblB8L4j3/5XnZAL80u48pUnfPvBvC+E7gU4AhKQ
	BUAhyporjSXwDKT6FAuFNbrg2lUn0CsQOCeDKPvpBPN+NBeTeo5YvgvIuDUndfajLERXONm
	yrThaZAnFJnIlfsQYr6hSdPVbtNmeZpGAJfDbsOhQGBMZ5vrAhUf15HE2hO1Za0bXTGQbjQ
	CAVe4FGtZEkIk9hEG9xmhatlstCSzDHGNIEH7W3xphA6F037W6qSGj+CTPwsejphDqajrKa
	RBwjij5Bef9yjUxbGzRicayLY52m2Yy6UyyTNy0zykmHFXN3cUR9XS5ywK8LSvapq/qhmyc
	1eFtRgwrKNb7EVXtuIDfLRy1obJw0rxiXzr4pt18vxe+29qmn5L8jsCo0mdZVTT6Bcu9tpP
	mPN5kLfvvFXQq2eZ+Ozv/Cik3HJgBULFHbqAs8vZpvrHiBDakQIxYOiPuCUMok5hkNOQDKI
	bdKP06lVYCK1eacHwYEs+P+U5q7HITiFH/Q0khHIg+wO74RPsHtYjTbqKWVtrNho55GnZwj
	ZxMXFaNbKSRzv2pbhKHifhnL2ed8nAcwJMCnApgHMxGZfM+B3Jmc7OCNR8VoB1hMtW1IWAM
	jq5MbTAFv/8djEsEtoR94dQVd0YvxbL3tNgyjtJ3sA7/241Dy4bjg83dpc/VIbcm5tANj0N
	1A9+yN0OPeso1oc0TTgwTtxQfMGkvk08ZZ1Sxzm1t2/wsDAsuouCMOWfGNplwaiuiYT04sm
	LJSGe4vM9LoMmK5zymW9mmS1DHSnrLx6W3Pz3vupIRo5RiNmjjbSu1hPs6rVnhRKY72dVXN
	tqTBgdTYXEws01bF02STDJMGk1fGgVN7n/gN0JBT7eIKMkCvG3rbBsP1gbka0BUcM3fLvVk
	QaUL86l6rM2w+ssYbpeGY1XhriQxUxAxJW4ElcesYCYynyE10Yss+H31KAd6dCpJ1gaWhUs
	zk0PFoP3EjlNU6NB6MTU2gaJRiFc7bA9LatkarvG1Wk1lPRFOB6deTZ5oHbDp3zQkPhiBTW
	/2cvRJLQ==
X-QQ-XMRINFO: Nq+8W0+stu50/hJ9IaixOkx9NRI1cPreIg==
X-QQ-RECHKSPAM: 0

=E5=9C=A8 2026=E5=B9=B47=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 =E4=
=B8=AD=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 15:35:31=EF=BC=8CSiwei =
Chen =E5=86=99=E9=81=93=EF=BC=9A
> From: Siwei Chen <businiaoanka@anka1.top>
>=20
> This series adds Simplified Chinese translations for five documents
> under Documentation/networking/:
>=20
>   - team.rst: Team devices driven from userspace via libteam
>   - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
>   - driver.rst: Softnet driver issues (probing, close/stop,
>     transmit path guidelines, and extack error reporting)
>   - ipv6.rst: ipv6 module parameters (disable, autoconf,
>     disable_ipv6)
>   - secid.rst: LSM/SELinux secid usage in the flowi structure
>=20
> Changes in v2:
>   - Add translated documents to corresponding index file.
>   - Link to v1:
> https://lore.kernel.org/linux-doc/54B9FF7CF7DE776B+6294277.lOV4Wx5bFT@ank=
a-> 20eya00ycd/T/#t
>=20

Ping



