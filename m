Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C843438B8
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 19:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847952; cv=none; b=JVzc7BjqSlJTRV4dVjoqdiMEP97G/6q+CFIFA+OiNr78Ky5FQLktB+h8UskabKDTAtWHNijlc34t4JkYMuF0yb1n93tdyfVPC925mOOrHH3EWwFEMdiqRI7Xh561NxxaL1zKYSLE3ZqON5UB0vX4tQ2nAvEP2BpmrPcUP9IVJAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847952; c=relaxed/simple;
	bh=Ognpr9TbzlrUtIfo4aJ5W/QMZXL4fNS+2iXI/pXs8Ls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jbnK//iEl61gPruvS6dzYvOIKwNo4aKIb72DR5gFCZ+61U/5ZdEigtzLW/jSuoDr+rf2FnENzLURAY6Bd6ODMNpS39OcJ4H9aaol8EYw6HWD7AQdlEYmbge1b0MSn2IHQRV4Z5eYfTJm2SYmBwItNVvp0IfhrzF46oQu0/h006s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HXZPoUR+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HXZPoUR+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E63A940E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782847951; bh=Ognpr9TbzlrUtIfo4aJ5W/QMZXL4fNS+2iXI/pXs8Ls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HXZPoUR+zWNhogMX4Z5i4x0j1IEkldT3EZibELjW/u45hEIDty5DfQDGttCGCxYgb
	 kXfvWZodlaJz6yWc/I0LTsADn+1JInckM7hXiK2KZdXcc4WbzlM/tr1+HSHWxYf8Vf
	 Ke6MFXteCiwCyKy4C+y2EV0Zv/JnxlIcSMpWOjTDOzUr0OF/X2ZDyLHKDs6Q+2al/+
	 JtPGDUxtUPx/vLNg31kNkLOGOXYsTlaWQ5aLjeEri9r9TOImyOyNpixYk+hssWJusQ
	 12dANR2dBW9VOU7PlOcdU57xZhmkRxiMFdCqoWQHDJCdIzjzGVMgcoRiZ+QsoO3O6p
	 RFY9iXf8A0jSA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E63A940E27;
	Tue, 30 Jun 2026 19:32:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [RFC] Doc: ABI: add files to MAINTAINERS
In-Reply-To: <3150bd373177ae566256d388ba86d810193f7f14.camel@mailbox.org>
References: <3150bd373177ae566256d388ba86d810193f7f14.camel@mailbox.org>
Date: Tue, 30 Jun 2026 13:32:30 -0600
Message-ID: <878q7vsu29.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Due to my last couple patches to /ABI I bumped in the issue of orphaned files.
> This is my effort to improve this. My plan is to send the mail below per
> subsystem. Can I add the text as is below or should I add a git-patch?
>
> I will add more files but I wanted to clarify this before continuing.

I would just send the maintainer a patch fixing the situation.

jon
