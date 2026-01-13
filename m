Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506D628EA72
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768348446; cv=none; b=jWf6louHkPaL7u26NVFY/jUuX+RboatmrbZ7lSfrCJrod3Jena76gK2+naOxplcnvBcWRIksQ5/fO4BlmCMf19Fy19W8BDnAMwlp20HfZp3KdRLuQjnMF8WMtrRHAYXlbIq6Sfm7coV1Ktw2V+XKag4D5JpfaFQbewjB2L+3C7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768348446; c=relaxed/simple;
	bh=DYaqvnENTg9PlJSR5xq6YpQ66p4ZH0KLT7EdhM3c/Pg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VmU4VAH9B6nBmVgEdrUZ9CZctoHpcCjXD/2+knY3WvYZtgRTtWEnlWkbBo0Q2OpxWFwrFw1NEm3XMI17etHvIZ1wuO+RO19pPJyIQwphA97mG5odEVGHTmFtv/6qtb6pfuarYLKE1mQGmtdrTodJ1YG95nDOXxCybZLv9/rTMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GnoTqzaQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GnoTqzaQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 791C840C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768348444; bh=DYaqvnENTg9PlJSR5xq6YpQ66p4ZH0KLT7EdhM3c/Pg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GnoTqzaQvRxaZ+UipjRCBi8Zg2DiqHaGjg8fR+bKQpjJukzhH1DyYKBtUhzTbxn8y
	 hgwpcoLFe09AcFoqXSRJ/sr34Z4mTFHYx+9gBrPPCVBPvLVftjtas/8uxO087rUp5A
	 FzCNt90wlvaOCLi65WOUbLQ6TQzYEyZ4tHLyUpmzuFvTt0RYoXBuujrCXYrWKdM2ry
	 ttb1h5SZFPrv48n+B/ZrwNmDM1myQKuVRJE/C8il1B9AOML+IJ6mFevh6PWuW/IPib
	 0rHuy/4lLoubR/KzI2CoE0LbYY5xY6mBKahbWxs3yX6lcUCqx43phTPfkzso6f1Hw4
	 5Kh6ltW3FKBlg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 791C840C42;
	Tue, 13 Jan 2026 23:54:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: OOT: some LLM-generated humor over a patch description - Was:
 Re: [PATCH v3 4/4] scripts/kernel-doc: some fixes to kernel-doc comments
In-Reply-To: <20260113233709.28ec384f@foz.lan>
References: <cover.1768324572.git.mchehab+huawei@kernel.org>
 <434e60e7868ef4e001e81e8cfa872dec711ddd34.1768324572.git.mchehab+huawei@kernel.org>
 <87sec9w7ux.fsf@trenco.lwn.net> <20260113224943.3e8b014c@foz.lan>
 <20260113231036.0b10f4a9@foz.lan> <20260113233709.28ec384f@foz.lan>
Date: Tue, 13 Jan 2026 16:54:03 -0700
Message-ID: <87fr89vzl0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> <llm>
> **Buffy=E2=80=99s Tale of the =E2=80=9CKernel=E2=80=91Doc=E2=80=9D Hunt**

I think it's a good thing I'm done for the day ... :)

jon
