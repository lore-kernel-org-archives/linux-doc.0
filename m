Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCAB800
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 22:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741819500; cv=none; b=Zp5atTHZlby+V5FubNqRyAWBGU8bb4tz9RTQ/VpOtuImxG3A6fShf0wblf9ImoSEfgKR/95aogELR78vxFLHjALr0eAhwzid9okKgx99AoigewFPrEnSaPXCA5uAFZEk0PbRlJJ8YVIBVYet8hfFD7HRO7HBthSIbE1mlffHLvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741819500; c=relaxed/simple;
	bh=MqozBttRHOS0lnDPM2v+AMA4+poEBNpZVQLihzIE4oA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t3do8BOF8SWVEfyaerDOxPP5PbWWQYhgT5qXgb8kb+w/LihgIyL/wRPUtETJ5QGlC3dpLow3t/pMXUzexQakso7gI+oeaDCo58GvItoIr2vqyk2tUoMioVTLJFl522MPYmUFtSCL6wOA0nKo91fxNtQAaY2KMOUV8bNtfzr+PYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=S5tLYT+j; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="S5tLYT+j"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7E1C741065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1741819497; bh=hWZXAjskbvyDqoemH/1New80Viz3RW0wefigirB0eec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=S5tLYT+jVwWpl5f/MnBf8cUsjKkj9gJqhfax7+hzNkRXpm/1x1fI1+e/yE/SR+NCz
	 KtKeqfp86icRuqD9srVUVJOZhoP1R2GlDmkd+qcc7Mz7mW9GGxs+YBlAWPlMjVwJud
	 2C5UQihUP0Xm2yGby2uMJpQJyioPKz0pudMM9o5DWv9UaTmD9WQMaRtSDixN4/TdFY
	 qWFUO+b4dKVnkngGDRuwpTr1ziOR+9EBLpFmMwgIuUR4nsVG+7cHCRWONgaqMzOtQE
	 5E50YEcDedcsdLS67pt8eqQjNQmek87vqhDIzXUOnHt3ccrSK6Wwjzt8FGfskEY64v
	 mfrjsDFl5ps2Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7E1C741065;
	Wed, 12 Mar 2025 22:44:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Hu
 Haowen <2023002089@link.tyut.edu.cn>, Federico Vaga
 <federico.vaga@vaga.pv.it>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 Avadhut Naik <avadhut.naik@amd.com>
Subject: Re: [PATCH] docs/.../submit-checklist: Use
 Documentation/admin-guide/abi.rst for cross-ref of README
In-Reply-To: <20250304075734.56660-1-akiyks@gmail.com>
References: <20250304075734.56660-1-akiyks@gmail.com>
Date: Wed, 12 Mar 2025 16:44:56 -0600
Message-ID: <87bju5lvh3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Commit fb12098d8ee4 ("docs: submit-checklist: Allow creating
> cross-references for ABI README") assumes that the path of
> "Documentation/ABI/README" would be converted to a cross-ref to
> the README.
>
> However, as the README is included by the "kernel-abi" directive
> at Documentation/admin-guide/abi.rst, the expected conversion
> does not happen.
>
> Instead, use the path where the "kernel-abi" directive exists for
> the conversion to work.  Restore the original path of README in
> inline-literal form as an additional note for readers of the .rst
> file.
>
> Apply the same changes for translations.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Fixes: fb12098d8ee4 ("docs: submit-checklist: Allow creating cross-references for ABI README")
> Fixes: eb0c714120ba ("docs: translations: Allow creating cross-references for ABI README")
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <si.yanteng@linux.dev>
> Cc: Dongliang Mu <dzm91@hust.edu.cn>
> Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
> Cc: Avadhut Naik <avadhut.naik@amd.com>

Applied, thanks.

jon
