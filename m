Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B728539903B;
	Mon,  9 Mar 2026 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065416; cv=none; b=eBVtNK0xsOKAJkIK7x6n1M6YhTs2Ph8y3Ydrf2Qdn/qquywkEYPkurWaq+bJgC8NIZPp3VUZCXquVIL8Aj7E20m2kAc0MmpMoPN/ecRwxHPuSJQFeZFPyQHSJchgCcmvaqys70zlsxPTH392vUImSEt66lQoRxInuY+WNcbMWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065416; c=relaxed/simple;
	bh=Sl/elZgfIKb5XNDP5DkR1xycGcRNMwkvaXY7wg/7+Bc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gjn9WX6ikNtqGNeZuu/s3wt0EimOrh2C+0mFVFDnA5qH+aTnW7g/rGBP8X5BBso9+BSTpvnZwfxZiAHt/3HnQf/WMo+M8+dm6dmXRggn3HADTFiqbY0VOJvtmT6AQv2OIifHBC11eKzr1BnuLSe94tYsFaILPPSzEnhMXGJudZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lm71oT2U; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lm71oT2U"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 92D6340429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773065407; bh=D9/uTcdlMENaUsnh5zjBKG3b8mkuUAgLvaUqEAQn0rM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lm71oT2UQES3LP8AY/C/n/grRnvuK4cvA9lnl0vRM3kblCwZIMPPvCmmoXxPdPsGu
	 iPGgd61vUY9TABVLk85e6QyV2PgX+gOOhKMwcHQmF3PWreW4K2V7arPOcNq8DqANoW
	 ecMJNvuAHAEATKnJaRnaUPrZq/Mx2NXFAlYXWH2J+xs0XjFLeohZVFDBIVaOPfhg5/
	 EFQrce1otH4HcpMQDPo0iVpmoLgpWj41Bndzh73oaGskMqEcguNWLFwCA/koIKAEaJ
	 uN6b/RrnBukeZ95XyekZfzPvQZSeMHYARR2tLwjWfeK+P/FtnLhqWJ3fmdo64Bb28B
	 kuXvXlsTAhUow==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 92D6340429;
	Mon,  9 Mar 2026 14:10:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haoyang LIU <tttturtleruss@gmail.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Haoyang LIU <tttturtleruss@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/docs/checktransupdate.py: use metadata to lookup
 origin path
In-Reply-To: <20260309095832.41209-1-tttturtleruss@gmail.com>
References: <20260309095832.41209-1-tttturtleruss@gmail.com>
Date: Mon, 09 Mar 2026 08:10:06 -0600
Message-ID: <87pl5dxfep.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Haoyang LIU <tttturtleruss@gmail.com> writes:

> The get_origin_path() function assumes that translation files have the
> same relative path as their origin files, just with "translations/{locale}"
> inserted after "Documentation/". However, this assumption is incorrect
> for several translation files where the origin path differs. For example:
> translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
> -> process/debugging/gdb-kernel-debugging.rst

Honestly, rather than trying to work around such things, I think it
would be far better to fix the places where the translated structure
differs from the original.  Those differences can only lead to
confusion, and I've been trying to avoid creating any more of them.

Thanks,

jon
