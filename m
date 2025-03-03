Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1AD1487F4
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045279; cv=none; b=WTA8EmoiCOI7TAEgDq/JyunnD40RzGkCWIuV6mvjmE+Dc4DZVC1IG1AAtBMlWW4OpsMe+1I7RwAOQ5AFiRdVJL3wuwuXX2V1XZtX31TXV65VKK+k1pomqsiTEHRmeSD5B4B+tEX0R9bIwV1NY89Ogx7b1xuiuDdHljyM3Kg1ceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045279; c=relaxed/simple;
	bh=JZ4sTjCbZOvWv270zdLpk0OsTrteaQxJ4JZNgmX0z4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pnh1iHiiVX8ItY/uSEY/WOH9QFJc0xlZo1B6vJCKzFmya6FGuQlaxE8hTxhzeFOFKch7FqZerMTT521kcdNKlDZ+Dr6vzKfeHAi1HHPBAlgRafYbhYx0VzUoNglKpnli4oaeR4IdOZZxLEsciokM0w1IKoAkdZCfkl0v4sbyjRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=joshuarose@gmx.com header.b=LBWcGVHl; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=joshuarose@gmx.com header.b="LBWcGVHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1741045274; x=1741650074; i=joshuarose@gmx.com;
	bh=GEJHw+jjg7lN0wg1SeV+pUjMnTQX+Zvjy7rMFVoFW3c=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LBWcGVHl08RzrlflAKELWl8T/9uAw4RG0lAc+ibgSwM1Qd2s8ydUhHBW87ENsTvE
	 9xUzB5/BTfAjvMBelUqHYPcKnv0FsJggF1j3qIgTsSQ4kcdy8AXSzWSuHFMVZunUc
	 Dl74m1iBUdAtvneeb6BSkzr01yxayCC3SYVHtlPZJNXQJDfAL322VO69HHN+5RQRS
	 lJkWVgvRKS4n1Utqu8peeSz32pEPpuw/DX91fKrcXkli19ALfUfmT6wPHYe3yacPd
	 ETMhCZzwDWa9prsP2FLyRoU+TM94ylYlqDATuSPyrH317imlZpv41qDtdtC1H7WOL
	 B94OoZjp9PavBmlnnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([122.107.8.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MYeR1-1tkab40jJb-00XNS0; Tue, 04
 Mar 2025 00:41:14 +0100
Date: Tue, 4 Mar 2025 10:41:08 +1100
From: Joshua Rose <joshuarose@gmx.com>
To: linux@leemhuis.info
Cc: linux-doc@vger.kernel.org
Subject: Grammar issue(s) in documentation
Message-ID: <Z8Y-FHZ5tYBEMy4j@spinny>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YGA/uLjR6E3YL8mTMS3APiCYC8tCPC/ySKcD3qjnJK5XaTfxJcH
 IGip6NZcMlnNjCzjo/jDnxvhw26MWGT0N7p9mzMEE/FVZbjRzQai8/a4w+zl2mD61K34zHH
 x/hE5/Rz2B5aw0VIykIzToKYfphxWMEyzcCktWi0bdTGRDzhHXc9GyNxdCtweLurDM6fRyy
 K9Iz9btJ29mQesEJVWabw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W+c2BkFrfV8=;W9H4frJx5V4NAGRcMEraasysPOk
 y4B4JQk5xpkh3BFE7OtsAJ5K/1TMvT9zRtrPW+KSNV6h4dI2OiJCKgeVwEP+ba5zZYrR14W5a
 30uzitMi8ooteseBFTtxV1RMJmPZxYkSMX3LhMpUVNaqrd7wkQXkcs4aHvksirUs0OdUZRP2a
 0/NQ54S5lnWlHY9lqepoQGEDhKFu9BSQnBL8MaCM57cyBdZNoT48vRleOhmnvY5+KFV6Sg6bq
 RPQcDayRkD0Fu5B/y0L+02B6iY5dExFhyie8OpBzeuf2pj4J73TMO3zi3pmYVmMEOidzny+Nx
 T+tGFMW826voChPE+SkqojuBb1m1oRLJXd23oXo/MAUff8rRy/rJxhBsm8luwA6m5W0qlyo1c
 0e/KhjujMlpa68Jdv/FTgsrCEl4DFlF57te7TSwl57Fft7tCDv9OermJ+WjFsgderRcJ2km2r
 OL4B4GImUemeUBadPNNlhxENHXhwADaf8zm+v+i54sqkSBQ7lExzJayr485jC8D0Tyo2iEuFM
 J0zPxDCqNGrJ5WLJ1aqVqIQh/KKIup9rKwVT/Y3y3yeIVLWy1IYhJEVks9e5dpTwi2zwn4ilE
 rhDzoUSicwnJD2i4N2e2OjzT8IEcUwL+YIxLNSaPguJcLM5zk/lrvXz79kTlRbr8Oeh57RPgm
 GYf5jxOEFrJ5+bQxVs2GpIeUpMxWxfu/cO0HCsd9a5wbir7cGUuu7Zd9P4iZJgWoEtiTp2OBM
 4qKkmvd+64TsoVMRneqpOcVJc0bzF9g9Lm7rF5t/1E/+nT88y2/lWpogr5U8O06Lqe4p0ImGl
 wpbH9IsoGXrHBgEyUCgaDjGZda7wf0coYIs4aIyvZJPpaOG4GPIwUxNncG6L0UOCN90U5Q10O
 YXJaRKhsNfHkWDlav3VWUX52JvfM2qaB/26mU5lBQInD13U5XcZTaHm0oUlPDeztOtwtHx5ag
 JpG700WvD3am3lx/oCbDCJ/uoEQ2hZmR3gJhdqTpg1svvxF0EKttW5WNp3IJEH/LhUfd4h7BN
 wLPkzlKdQaZGmVNSDyWYWUcQD0flhujSqvN1epe37dFPF0rahjrGoQZ5KwLfZUX+pU0LV1Hz5
 Zc9nL+UTT68RfjJJpeXXGpgzdRJSHfu/nvP1SiUUlAOCvOlkj2k3ln4/iymJihstCR+zwmEer
 p34DictIYa0mz2AhyU5EY11HSE5HkDPd3A+04k5rL2vpIILPvW7HalTeZ3/jwahzdnleTsCHY
 66p+rcIKGnU8OBEeYoaOVgAsFDnys39PPeQMQcTPE3YNFYTklrbb8NLPfhgx1m7x7f6VzqCtf
 CRZjAUlj+pY1woIdyng4Eeq9OnA/ilfYamkJhLTwm/mBPuHMdGeO75UOYnkCFmj2SODR/WbZY
 4Ss19N7pgT5Xml9afd2AOFpvSZMzIIZXt2DkqCWGvkuh/xr8mjOgmSlGhW

Hi all,

I just wanted to briefly point out that as a native English speaker I
found the following text significantly hard to read.

"Do not worry installing your kernel manually and thus bypassing your
distribution=E2=80=99s packaging system will totally mess up your machine:=
 all
parts of your kernel are easy to remove later, as files are stored in
two places only and normally identifiable by the kernel=E2=80=99s release
name."[1]

I found this very hard to read. I would probably re-phrase this as
follows, but I'd be completely open - and in fact encourage - any
suggestions on the rephrasing of the excerpt.

"Do not attempt to circumvent your distribution's packaging system by
installing your kernel manually; this will likely break your machine.
Components of your kernel can be selectively removed later on.  Such
components (files) are stored in two locations, both identifiable
by the kernel's release name."


As an additional note, I'm looking for any recommendations on a good
resource on the maintenance of the Documentation/ directory.


Kind regards,
Joshua Rose

[1]: Documentation/admin-guide/quickly-build-trimmed-linux.rst
