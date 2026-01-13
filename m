Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A61831AA92;
	Tue, 13 Jan 2026 20:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337198; cv=none; b=tr1DwM4x02B2oRdlV8uz8amPbuqvkmi++kshRSn51GrJI49151BZQrOebS9fLWb4zRVw9cjVw5nsaHe8Djc9QRO7i41lXf52t4nO9S1m0zhSmGHrRpcPG+6HvlulMD779IW/fdMqQfiHbwl9JO+W/ttI75hAzTKFZKg8L2dxuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337198; c=relaxed/simple;
	bh=uxkgWU5Y8o5D/73Ei2m1AVkVvcda03B+PQ/HqZLjVa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=otQFv1PSJh3r03SyvS0A8CJ53qcsSxrgIkqFtr03/AqZtBRcgCM9n/7En3Zcjar+yuM4YcGaNuYJ8nvNwEsc1ggIpOWiMVD+UWcHrsiT6Z33LPyH9YUkETrmAYfKkIQV9fqaGYbCLdLq/1AGriBAh7JxfBHZuyWKbbe7yjg0hnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=G8n53bkR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="G8n53bkR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A9E2040C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768337196; bh=TORMkhm5v6M3hoTA2FMyjkUxYpsDOBdeWmaZjoELisU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G8n53bkRqA97gEXeKOkJYCSS2ap0ThU3NNeZTgVCW/Qp6VFAMeLNS/zD6I4EDChvo
	 hCrlhOv+8Oz4fj0vGspQlpsmO0hgSZWpKtf5cJPaAkv2MrrCvgh7Wk1Kd6SsO6BuU0
	 CEcssvBctUeaMcblt4DVZGX32oGTFGehwc7FNAS2eThZYu2IupoizPCLhZS6zhN2Jy
	 29E+ZnHTtkph4ry51yX2nLA2Fd9aL4jqwcwdFV0KxVdSXksRPI8IB8zzMDdQSoXPUJ
	 1/7XcQCfPrh/WNTu0isklBDQQgbU7NbGWDGiVcP2Dh714FdMAr749m6+5KCP/1StX/
	 nMAkTNwQ4pXqw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A9E2040C7C;
	Tue, 13 Jan 2026 20:46:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH RFC] docs: add python module documentation
In-Reply-To: <e1c3feccfc2728e1fa0ec3230be1e3c26bb92dfd.1768324835.git.mchehab+huawei@kernel.org>
References: <e1c3feccfc2728e1fa0ec3230be1e3c26bb92dfd.1768324835.git.mchehab+huawei@kernel.org>
Date: Tue, 13 Jan 2026 13:46:35 -0700
Message-ID: <87wm1lw89g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> While checking/improving docstrings inside kernel-doc, I noticed
> that some changes there aren't Sphinx-compatible. Also, there are
> several functions and some classes that miss documentation.
>
> Being responsible for doing some documentation work, I felt blamed
> on not having a good documentation of our own dog food :-)
>
> So, I'm adding kdoc documentation to the Kernel documentation. The basic
> change is just a couple of extra lines at conf.py, plus a few *.rst files
> pointing to the files we want to document:

At a first glance, this looks like a worthy task.

I've never really played with autodoc.  Sure you don't want to fix up
kernel-doc to read Python code too? :)  Seriously, though, I worry that
it could end up cluttering the code with a bunch of sphinxstuff, but the
only way to really see is to try it.

Thanks,

jon
