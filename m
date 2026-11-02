Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636803;
	b=MKzT883BVxfAmNNIffzINK96VtQMt5dezPObinoN+DQ/08Q38z1EuY7qVINOp+aTocqI
	 AVHgFbSD8Tyiw22xJgFed32Hu/WjA5AQQoapWzl54W5a/69+seIdsCfrnGeGNw/dHeird
	 YCswuG8Z4wRq+vgAO4Yk7Oh8nr0Jhw06IjzDJTYzO9hdhaZe5Nf3rNxWHVJzyxWh9mEbU
	 fAkOUEs67fLHLZFP42ztmfQ3vW1HHyAPR6VqzJO+cP60a+auKoXr3tmDM6cd5IirMmoCA
	 Xs5xSkuxuSJAbvwIITSO6w5eme3tgUO/AxWDZLlAZvPUB9NVD7NPbKA/Tb8QN/V14gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636803;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=728m+jA4u4uC4Aj4zqNRZc2tcvGLYHw1BbuIuphC9X0=;
	b=RCqbbicHhmSAQ/g9tfe39SMYLib0KIS8fEUK2uKWdbG3Dq1SwtaCM3tv23sJJPSAmMh7
	 T7m+MHFVS0HH9YLBvQR9PYzUFSEct7YifH9uBhUdnHqV9CjrZwDCSg2g1qdSj8CJ0Z8T0
	 axCZ4WQ11R3cakvv3T7ymutCEm3QXe7n8xiy1CZDF4MqV0siMlsBFrTN2LZ9Pf2/P/oBz
	 ddCvVF+bwwivPo7SyA26bUzgyr1uJqFFnDMJwvpMB0Pg0J2u6Dx1CIrPDOSSafmCy+MdF
	 3KTAGe13/UR7LmFAXmHm1h1rptxBdS74Poo1pvKPgMPq2AqSzyMdRvmvXf+Tsci5NTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=NTnsssnT;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5946072200
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA5946072200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=NTnsssnT
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2D66340430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793636802; bh=728m+jA4u4uC4Aj4zqNRZc2tcvGLYHw1BbuIuphC9X0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NTnsssnTV5aHbVGliww3GYJYNKMdGEhvf61nYk8ur+fX0J4PmNXp/ErHQOhySkJWj
	 Ma2WBitqKk88vhfVZcgUV/AaQYGSe1Bhlb3h1G9D3aDrqUYROHcSOx0B2K99SI2ECq
	 JV0XzhCPKvxtR098HxeVCvT60awPC/ibpEysBE0Kcp8RvP3lOcG+B1FnxSvL4lQ7Tk
	 34lv9AOTKwwE5cVGPUF7SlnNBhR7vsjeBwWNVeJX6jydkCP3ftC/tMu778zRCJj2Hv
	 KPq6g+79SLYdEcoXOIfYMB0FZvQhrIYQJkmknRpT9QaprMQUkApJNJ7hD1KwdCeoe8
	 V0YFC286DmMaA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2D66340430;
	Mon,  2 Nov 2026 16:26:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-doc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [PATCH v2] Documentation/printk-formats: Remove notes about %pK
In-Reply-To: <20261019083040.Fgpb8Jz8@linutronix.de>
References: <20261019083040.Fgpb8Jz8@linutronix.de>
Date: Mon, 02 Nov 2026 09:26:41 -0700
Message-ID: <878q3bci7y.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:

> The %pK is slowly vanishing from drivers. The %p already prints hashed
> output unless overridden at bootime. It is not obvious for the user which
> output is using %pK and which does not.
>
> Some people pointed out that this documentation encourages people to use
> it so here is the removal. I also update the translation since the block
> looks the same.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>
> I intend to send the admin-guide/sysctl/kernel.rst bits with the removal
> from vsnprintf itself. I am down to 5 drivers (as of next-20261014).
> If you think that this documentation should remain as long as the
> interface is available then I can postpone this.
>
> v1=E2=80=A6v2: https://lore.kernel.org/all/20261015133553.kGn_nU-F@linutr=
onix.de/
>   - Don't remove the whole %p paragraph for the zh_CN translation.
>     Noticed by Andy Shevchenko.
>
>  Documentation/core-api/printk-formats.rst     | 20 -------------------
>  .../zh_CN/core-api/printk-formats.rst         | 15 --------------
>  2 files changed, 35 deletions(-)

Applied, thanks.

jon
