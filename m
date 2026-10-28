Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793146510;
	b=EBwCRmWvTZ8Dv7xw7PS6n5FfJvaQ4QsNUnVrFr0Yw2pxR519bvNBDQCZ97jcpcoZLbAx
	 aZiWbWF8C1af9OZ8QqnFwlFFCJzd9KOn978Cfc6goiNufDVC1H1lH5fSZJUWAafcUK+Pn
	 kf6/ssnv8FJX+i0WPU5uYwyVmJaURmUCJhkW5FngzUyS3dQ5P4Dzm80BC/lDyhW/VvEDO
	 xWZcyccrwu+3W03xaeSmuA0iRqOcOb/yNMBoEYyCDo/FbUqL7aPUAOq1Ueq4a2DXYBJyc
	 d09hzW+k0XcFM22piLd07764Vjvjk4P/48Dj6VK4tkkshHD9hAtOhMnxs2+H7MTFwWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793146510;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bEXoySqE1E7wtC8saJF9swA1PomhW/MnVMsJoDe3ky0=;
	b=g2Pt5vTP27K93FhWTMrD6UrW9sSuo2hA9t+a3HYtsU1tlCi6wwBpfaL/IG3LQ2vR2hKd
	 4BpNBruraJSraQyU4YyDzIQ34T2MTQtCD6lJmvqhfEN/+PxAK54piWlCL5sDImGMWavKn
	 YB2YDGEcoronNEl3nyih9qFTSrysW7mQme4tYWvI2tUuf9cNeL79QCqgxP57pXjCzTMkR
	 jPS3fKl1io4m64rSGO3RfBUFnqeyKBEn+8QTmPG0bE5BvjrPYPSe0y1ZxjS1EfDjMJjCc
	 +VP89/qUplTSbEZZTepBNHklPc68UQ4ImjLWSbhRj6ujNxKVLbGA6i1mqVr3kB+87xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GveICGRb;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868D7606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 00:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868D7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GveICGRb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=bEXoySqE1E7wtC8saJF9swA1PomhW/MnVMsJoDe3ky0=; b=GveICGRbR0uuGVF/FQBfg/an3K
	UXNXNwtzLwtiU792ZHYSY2DcOJVWx4xsPxiOTs+0tOoQZpMiBHci8j3w8mZWVVoNFF64JmfvELZzX
	4FnlZEo65EN/I0Ai9I17w/4R4OLJ25/SMVd2JgsdGvBIpKormZu3xygWJTbznihHFV9wJv8gIYfJ0
	r77sH2457eHJ30V+J9rfij4s4OCLQrjop0/ebSDb0PXnOeZl3xjco9DfLxpt7U/mEbA24ikTRTxiz
	qSmY0XtBWsdZZuBPjk7SsodekQqta9CNOOno7stgTpuDqco4HHlIAxslOvy3oFDDd5/xqsDMgGzvP
	F3Iyfgow==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLrJs-00000005ylQ-47dM;
	Wed, 28 Oct 2026 00:15:09 +0000
Message-ID: <87270a2f-de18-4174-95d7-6ab4e18f2d1b@infradead.org>
Date: Tue, 27 Oct 2026 17:15:08 -0700
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] Documentation: make admin guide version-neutral
To: f1rul4yx <vargasgomezderequenadiego@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org
References: <924f3b3c-a5e4-4686-abf8-0d4e23183a2e@infradead.org>
 <20261027222216.71715-1-vargasgomezderequenadiego@gmail.com>
 <20261027222216.71715-2-vargasgomezderequenadiego@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261027222216.71715-2-vargasgomezderequenadiego@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/27/26 3:22 PM, f1rul4yx wrote:
> Replace references to the 6.x series with version-neutral wording.
> Clarify that normal stable patches apply to the base release and that
> incremental stable patches are also available.
> 
> This change was prepared with AI assistance (OpenCode), which helped
> identify the outdated references and draft replacement text. The htmldocs
> build completed successfully on a separate test machine; checkpatch.pl and
> git diff --check pass.
> 
> Signed-off-by: f1rul4yx <vargasgomezderequenadiego@gmail.com>

I'll let Jon clarify regarding the S-o-b: line, but it may
need some improvement. Documentation/process/submitting-patches.rst
says:

then you just add a line saying::

	Signed-off-by: Random J Developer <random@developer.example.org>

using a known identity (sorry, no anonymous contributions.)

> ---
>  Documentation/admin-guide/README.rst | 41 ++++++++++++++--------------
>  1 file changed, 20 insertions(+), 21 deletions(-)

This README is quite out of date, but this is an improvement.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
