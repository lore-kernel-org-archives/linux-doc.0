Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBD725F7B9
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022326; cv=none; b=EfBZn3ZEYdJ5A1ZdBImtU+HFs+3IZyDxCSS8vqcX8/j7aHd5XHBufhQ1yfwAIPgLcrgO1eIcebml4JrG5F2E8/XVUrHfCzOO4avnqVkmjWxCztp90EDAHqrMVQ4gaWZkwLXSFmseTwcrYLRC/aWTqfF7ysjFQnlOpaic7+H+ORQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022326; c=relaxed/simple;
	bh=oMJaxft5rJD88DQRIAes/XrKfxlofogVTPOtzn/qlQI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z2PdyWLaSc5SesFczoTLID/PHAwSE5f31KV72kzqONm0HNo4IN5bRP9KR9Sl6xNc2v//q8ucAsaM8xH4Oq/xsQ9XSmdSHsWRmx0rH48lI8iuIjAXJZx4q+pYNCIglVvirMPmdLXOHqsLYoZ8w1BIoJpE0iTEBdhCqb6gDO1EIjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XQfC/3Wo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XQfC/3Wo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0200B41ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746021953; bh=gAIyEpOFgQMo1NuxFvk+j5GWkqaNHtD7s982210IsMM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XQfC/3WoJcCAN7MTR/OpLpUQkPhzuPcEWhi5GH6PeceEGmCr+RQJrfxeJkLM+sezU
	 LUhBwonNMNQa6lvG++SW7jGanEzZf2hQJi1DW+m4WGo24ElcjodfJMR7ZEYtgcE+XX
	 SCX0JAsEbRGKk++YGAbwZXuBwr7BeaQDDlntYPxKl/RxDOTFXgeSqT4/5rRTm6Y5kh
	 tc1CgO0Ys0l7o8jYcsR70r69I8Si4m5RMS2V/pJj4K+nC1Me1iHkaY7SWgwEayI9xr
	 xoNgMlbyba4scfymE7dbHh5efkeYotM0cZxgt0jr4tF/sSPk8MB0XIKsFL7meVBbQO
	 +h2e2dmj7+2BQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0200B41ACE;
	Wed, 30 Apr 2025 14:05:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ming Wen <mwen@ambarella.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li
 <longli@ambarella.com>, Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen
 <zychen@ambarella.com>, Rongrong Cao <rrcao@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
In-Reply-To: <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References: <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
Date: Wed, 30 Apr 2025 08:05:51 -0600
Message-ID: <87bjsdlp6o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ming Wen <mwen@ambarella.com> writes:

>> It is required to go with Sphinx 2.4.4, which is much lower than the
>> version(8.1.3) of ubuntu 22.04 and 24.04.
> [Ming] To build the sphinx doc for Kernel 5.15 or 6.1, it is required to go with Sphinx 2.4.4.

We recommended that version back then, mostly because the newer versions
were slower, but it is absolutely not required.

I just did the build for 6.134 using Sphinx 7.3.7.  It emits a bunch of
deprecation warnings, but otherwise works.

There are various fixes in mainline for some of those warnings; somebody
could certainly pick them out and ask for stable backports.  I can put
that onto my list of things to do, but won't get there in the next few
days.

Thanks,

jon
