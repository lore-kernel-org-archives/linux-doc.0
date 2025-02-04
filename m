Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4369F166F32
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 16:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688192; cv=none; b=apXCLXtMUaq1/Su/OuTqi87cAyeXAw/yOSjiZvBfQtb80A1RCgSbfpxK5qSafbueO1uhy+JAK/SvqHAq4pq9JTPEbSuG7gXyUIctF/8SBmx8Wis4+RbjuePEVLfe30LNSgDaO8Og4MgPStmt4FjXSG1z/92cBCG3VZT/SIOvZ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688192; c=relaxed/simple;
	bh=+RBsntgwfbfnf0QGxZPZXAjq1Wsalg9vYWRVstWifxw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rezHOPvMkPEIEeTxtMHgl43+Mp1apAtC82BrOeaVtrOPZWThxPuYpDPWMDFcOlBNOutg2fImqsEQZP0IDEaLXaku0XqGuNpqpwkkhWSe6pa7eaGfpsZYFxvQOnngBM7vY4V9jhy3S83RW2Q9lUH7P6tiyORfl1xP1VO6NrHEGJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lu0Ony/I; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lu0Ony/I"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 627A9404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738688190; bh=33Lns4kov2LabP/rhFnuRNU6eSsIPbEaZKzln1wh4uw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lu0Ony/IYbSlkewI9m4tO/9OTHAhdCITGlSVHWNiuk2ZGoV0qI+FL6LIql007ljaF
	 82DZn+tD5ruRd0aIu8Ty2m8SglsL5rcKXXYyB1bp9nOfiCE9QRj0Sv8a9czBChSz0d
	 N0MohHrpDmZM5HG4Aa/PIJriUklUFhY4J5Ez38E14/ccZ+5ebrK284nck6onhPo8qj
	 ehLh+c/a05lM6wvzQXkujMU/FKrKn6WMmG0ulzEgf9EHfa5A05jpR2DifhfdwtXmvn
	 8AAZnuXgl2SzHqtNUlkXo2F884YsnlOhTdnv3vKXD/fpYiyUtriosaN81fAg05N7f6
	 IIBK73PWPhThQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 627A9404FA;
	Tue,  4 Feb 2025 16:56:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: zhangwei@cqsoftware.com.cn, alexs@kernel.org, si.yanteng@linux.dev
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Add self-protection index Chinese
 translation
In-Reply-To: <82025758-b993-47aa-a8fe-7ed6cf5a5def@cqsoftware.com.cn>
References: <20250121051234.79066-1-zhangwei@cqsoftware.com.cn>
 <82025758-b993-47aa-a8fe-7ed6cf5a5def@cqsoftware.com.cn>
Date: Tue, 04 Feb 2025 09:56:29 -0700
Message-ID: <87y0ylfy2q.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

zhangwei <zhangwei@cqsoftware.com.cn> writes:

> =E5=9C=A8 2025/1/21 13:12, zhangwei =E5=86=99=E9=81=93:
>> Translate .../security/self-protection.rst into Chinese.
>>
>> Update the translation through commit b080e52110ea
>> ("docs: update self-protection __ro_after_init status")
>>
>> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
>> ---
> Hi, jon
> Please apply Zhao Shuo's patchset first, and then apply mine.
> https://lore.kernel.org/linux-doc/cover.1737603330.git.zhaoshuo@cqsoftwar=
e.com.cn/=20
> <https://lore.kernel.org/linux-doc/cover.1737603330.git.zhaoshuo@cqsoftwa=
re.com.cn/>
>

I did that, but yours still fails to apply.  Can you send me a respin
against docs-next, please?

Thanks,

jon
