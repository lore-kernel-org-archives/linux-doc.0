Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C72E7389
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209096; cv=none; b=oyHdF+mHyOAr4uWWUX+x4arh7DZ9h2dWokKxPqvpPxnH3kH1zmGaacLO/S4qpuwRTdRh2dwJSI+A5xSjUx60ndh5+UanBXYQJ9t5AlD93GPS6KPr4yK66sdsyIQvIgKc07a0jE8Vti2Vcn8xouQ0kp6yC0c1UfjNuHdiPQ54ykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209096; c=relaxed/simple;
	bh=TnsjqGVMy/o7/73ZblaawdVp51vxiDriet5x9twbGHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nmhg6SbVZR4SGs77fMsNPmynsvnUiGPxUiKxRohZC3JF6jdb5Mp6Bv8KDJPKG1PiUhxPN4zz+fJ5ARjMSm6SGHkJ/6Nlcu0N/aasLMQHqzhKS+8HPtwOpDyCwJIkqg5bJU7Fy7LkZ1p7ccThc/W2tfRpfLXUUkUvwMjwl6RJR88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
X-QQ-mid: zesmtpsz4t1782209072td460398f
X-QQ-Originating-IP: 5pRCUX0xcsQdCpXcpoiTW49RjCb/+tXNl7cg+l2k7kc=
Received: from anka-vmware20-1.localnet ( [124.161.135.51])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Jun 2026 18:04:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17518718631674380426
From: Siwei Chen <businiaoanka@anka1.top>
To: linux-doc@vger.kernel.org, Dongliang Mu <dzm91@hust.edu.cn>
Cc: si.yanteng@linux.dev, wy@wyuan.org
Subject: Re: Issue cloning kernel-doc-zh from HUST mirror
Date: Tue, 23 Jun 2026 18:04:30 +0800
Message-ID: <0DDD646ED5E875C8+6652897.DvuYhMxLoT@anka-vmware20-1>
In-Reply-To: <b03f244b-46b8-47e8-b7f5-d98d714ae15c@hust.edu.cn>
References:
 <4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1>
 <b03f244b-46b8-47e8-b7f5-d98d714ae15c@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:anka1.top:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N4ZILu3POr3OkP1f+LPr7gHrGJ+RHEtqWIMOY+CyDDpqh3wDMY2nKZpW
	6UVn5VxBXQZ95gCKGGTFRfPdbzd6Pq1XcD8rDDY0emEuYrOJwSV54eEIK16qRRrhH9lhOy2
	LcCXzT+eH149NPmptI/e+s3a9BS7DYIXUK85Woyrqkgbmpjq/GVom8vscyG3vbej6xBlgC/
	RqDbR90jcUEr3KO4Hb8eKSwaPGxUXUf8QMjq9RbOy3KfTLrOWtpmu0RFAIjjqSKnLjaEXg/
	+phMX7+Tq0fZvW3/PCTXHLhddqtovQW+Lb4JKdrseVUtPge0D2Zs9yFuM2xb3S442YJ/lAy
	2ylS4HL0ffjOgY6a7lW/neC/KfRi1v2Eg/fd4SZwc8KTMXon4V+TVE2pOyWB2VKaV8o9N3v
	PytqkAbsx0TU73vVgcww51wjSX9wU8ottGvzY5sbU29Q1oR9eoljNA1JVgzRDfhdG7+9agc
	ySvQyzsCKyxgf3bMLjPHVfDsJ135sDY7Z1n4D4iyElGr2xXN9RJRbrxmKwP6LEUyovdN2T+
	xQoXs17YFQtihE90HzRHP7+orQWNjK9b3v8/hicVn4u1u2ddXYdTncxKIKMXPxVu+Vhu/3u
	1gryjkxcd/bTJ04ir/Jx2w+PzDATXkwLHzvJBi7WGKhCRoXiKS5iQurWkpRxDtEXF2khhvr
	ZzTzTPTF6YOi42jhHodsK3fh/veK5h05/26/kUyksNN9Y0ebemSysRU7TIpPemS5TI/cJg/
	TzTCRL5x3XlpgOfGj4E2rqMwoUckt5fgqykUu7qtuNDNnguF65fQ5Z+47XakPaFBtE1fEkF
	22jFtTEMyiwnBqEFhs0Tz18F3ncuigq32iVtuEOuholN+b/528brOaOOtnieweFtxpB/QYu
	gWqZBK7csu7RLJ2ZhDzsr55n9BoNtyZcpqugXpUH9EwfbywtobBxTuku1Yydkg5HLUu1qGZ
	AROcjq3bFqgKTyqvVLpdB0gdisQmRyKNcW07tTqiTYEZWBISUhCN/SD2CPUOBGclGpAXYDB
	mepENwO5IF31jxCaAV1vHOq7X80uBjO9930dF8eUihGQPlxano
X-QQ-XMRINFO: NS+P29fieYNw3bEfiaoomnzdGyg47OgdBg==
X-QQ-RECHKSPAM: 0

=E5=9C=A8 2026=E5=B9=B46=E6=9C=8823=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C =E4=
=B8=AD=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 16:51:20=EF=BC=8CDongli=
ang Mu =E5=86=99=E9=81=93=EF=BC=9A
> Hello Siwei,
>=20
> The long answer is as follows:
>=20
> The curl 52 Empty reply from server error is not a Git or Ubuntu
> compatibility issue. It happens because the kernel-doc-zh repository is
> extremely large, and the HUST mirror server closes the HTTPS connection
> early due to timeout or proxy limits.
>=20
> You can try the following commands:
>=20
>=20
>       1. Shallow clone first (most reliable)
>=20
>=20
>=20
>       git clone --depth 1
>       https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux
>=20
>=20
>=20
>       Then fetch full history:
>=20
>=20
>=20
>       git fetch --unshallow
>=20
> If still failing, increase Git buffer like:
>=20
> git config --global http.postBuffer 1073741824
>=20
>=20
>=20
>       Finally, I will contact maintainers of HUST mirror site and try
>       some attempts to resolve this issue.
>=20
> Dongliang Mu
>=20

Hello, Dongliang

Thank you for the detailed explanation and suggestions.

I will try the shallow clone approach and the other workarounds you mention=
ed.

I also appreciate your willingness to contact the HUST mirror maintainers a=
nd=20
investigate the issue further.

Thanks again for your help.

Best regards,
Siwei Chen


