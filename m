Received: from va-1-20.ptr.blmpb.com (va-1-20.ptr.blmpb.com [209.127.230.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675762376E4
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566182; cv=none; b=Uodi7kEpgioyB87h49t1ypwjBlRlHW2Sznb/k45q92TAAaNNchp5edWpSzmgBpzHmD3BDAXan6qfpa9J5Sn0dVk23Biw5lcB9vmmdbDhBa1TQ99zU7pYzHTJ634nLHGdrF9XQASicGSI/4CELLMyXprN4pE/zhnZpnmcydHyzcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566182; c=relaxed/simple;
	bh=lmxU0x4SsCaxIhTxz6mKmKFWIYAl9VeX72ZqL2YE+Q4=;
	h=Content-Type:Date:To:Cc:From:Mime-Version:Message-Id:Subject:
	 References:In-Reply-To; b=NewxJGG+HsTzBXT3S+cKxkIO2YzkCx5m9T40WMmND4nUQ6A6D4xsOClqHvFo9WWo4Vc2HtcLQYPQ4g8Vefs3aBLMDe/y6bhDczU0dPH+t/H4JevXCUWlWNqjUSx4OfhlnvH5C4cFMvljZoRkHYU49iOD2ufi16N76LimPvbo3Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com; spf=pass smtp.mailfrom=leap-io.com; dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b=IHbdwdCO; arc=none smtp.client-ip=209.127.230.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b="IHbdwdCO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=leap-io-com.20200927.dkim.feishu.cn; t=1752566128;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=lmxU0x4SsCaxIhTxz6mKmKFWIYAl9VeX72ZqL2YE+Q4=;
 b=IHbdwdCOFSQhR9gimdxo0ia67Bw2wL290mpx82dYZiR4H7xTG4DJuxgdliu3/JBDpvtBO+
 D1e32u2bET2LEQUxJzViXZhPhzEH+FFsiJNNvLKWGbWwkdMaXV29iZUR0KT+vqp7k2FXG+
 h8/ea9SbWdyPUXrTE6vsIETx/jM7QIjiBB1wfJ17X90BKEf+MV4AWMXdWYjodA2Iu1fHM0
 K9V3nrMi/77PIDca70QPpQwMWrJEVgnMe6I3T5ydE3/F2NqnnoheXxdYe3oTJXIBaSQmYk
 b6i1djvuW1Z26EwVUhFqiegw/fqC58Oo+6AZB4P8OTTcF/ixKz3X7NQdDAU/QA==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 15:55:25 +0800
To: "Yanteng Si" <si.yanteng@linux.dev>
Cc: <alexs@kernel.org>, <dzm91@hust.edu.cn>, <corbet@lwn.net>, 
	<linux-doc@vger.kernel.org>
From: =?utf-8?q?=E9=83=9D=E6=A0=8B=E6=A0=8B?= <doubled@leap-io.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <220d7401030e8c57cb19a90642e0e0ae27071c38.0a51afcb.d213.457e.b065.caa6a3ef7cc3@feishu.cn>
Subject: Re: [PATCH 0/7] docs/zh_CN: add chinese translation for scsi
References: <20250708024139.848025-1-doubled@leap-io.com>
	<54ecbf0f-43aa-48d3-a9f4-cdb5a91df43f@linux.dev>
In-Reply-To: <54ecbf0f-43aa-48d3-a9f4-cdb5a91df43f@linux.dev>
X-Lms-Return-Path: <lba+16876096e+c0556d+vger.kernel.org+doubled@leap-io.com>


> From: "Yanteng Si"<si.yanteng@linux.dev>
> Date:=C2=A0 Wed, Jul 9, 2025, 09:32
> Subject:=C2=A0 Re: [PATCH 0/7] docs/zh_CN: add chinese translation for sc=
si
> To: "haodongdong"<doubled@leap-io.com>, <alexs@kernel.org>
> Cc: <dzm91@hust.edu.cn>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>
> =E5=9C=A8 7/8/25 10:41 AM, haodongdong =E5=86=99=E9=81=93:

> > This patch set adds Chinese translations for the SCSI documentation.

> >

> > haodongdong (7):

> > =C2=A0 =C2=A0docs/zh_CN: update subsystem-apis.rst translation

> > =C2=A0 =C2=A0docs/zh_CN: add scsi.rst translation

> > =C2=A0 =C2=A0docs/zh_CN: add link_power_management_policy.rst translati=
on

> > =C2=A0 =C2=A0docs/zh_CN: add scsi-parameters.rst translation

> > =C2=A0 =C2=A0docs/zh_CN: add scsi_mid_low_api.rst translation

> > =C2=A0 =C2=A0docs/zh_CN: add scsi_eh.rst translation

> > =C2=A0 =C2=A0docs/zh_CN: add sd-parameters.rst translation

>=C2=A0
> Your patch set is not in a thread, and it should have been v2. Please fix=
 these issues in v3.

Thanks for the feedback!
I will fix the threading issue in v3 by using `--thread=3Dshallow`.

>=C2=A0
>=C2=A0
> Thanks,

>=C2=A0
> Yanteng
>=C2=A0

Best regards, =C2=A0
Dongdong Hao
