Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685690;
	b=MPoiZU8OCQkNrp7wiTp02VVt66pnrX1kZaI5BrLOs49o3rrp6KFaUAkpaJWnmTaaBbG/
	 wyr8OppkQ4IMUQo2G/JkbqpN+DE0QEzWIeleJ/pdXcclYLteCKVyrhjq2oJsasEGUcGzl
	 gLyljQMp4u++K0rT0MkVqzUHYPrih0SAOvCMbcXUKgd0ydDcNOIz/bR2cVlxVZ9EVO21c
	 HzyGBGjCldACio5U0SPE4uOh1P07yl6u6RrzB5GqwLY94x0JfQbm/qpVpwS+r2qxjToUk
	 QAMeCckrC3OMV2/Wj3rM9qd0id96YefDFdnMvf5xti2uEckwvqE9o8SdMUUp8RSH66A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685690;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=798WsAKUfZT+Dcarrs4RdClLqojIxVDY2hpeKgDCVn8=;
	b=JcV40GB2E9zs/MMQymsSr690iTVXHg/ghA5XqtBDse0cp6PF2G13tVvpVZpg8gkX7byL
	 Iqhr+RhrlVpcf9cHaqDFqCy14fa4OCt2qZogXUWKL0L0k0kSr/Q1SQ+4J1EaZX21S1pNY
	 w7zet5iXnNZYzk2DtmkbgVBQeiWJdaMWEn4xRw/1tWfzY2SxwSegsdopQ5fd6z00ihQt6
	 3+QfX8JDido+e0gRUgvn2NUYVWPIAXX23gJqhlG4g1w6ZAWN5NdFkuxvEqpMUlaPjryfF
	 AS4+9Jo7Hl/zB7JkqYq8hIqsZshwgSmGZhw6xHXWYUp6UEZuIYycpXOGtbppZQUbtpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=conKmQE8;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8DC606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 16:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A8DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=conKmQE8
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8D13D408DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792685689; bh=798WsAKUfZT+Dcarrs4RdClLqojIxVDY2hpeKgDCVn8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=conKmQE8H9clTSXtfAXn6YcVYe3Om+CDP/dTijXivLAA5/N4x9sDF04x4wmR+iMVT
	 ycYXWO1B6gNvNuPwLtfjDGbhPs2zoChH55Fl7x02eK1F7N6R6zkNHJl8KxxMyppD30
	 hOKzJxCc/w4IWQYaIACUByk8MDZdy5AWBtXkkn9pA/eB8wQBBpQJcmBQi+QjxzcBbX
	 O5qeCn3xf1VW0fSW089dcZe7vz2zZxkJ3XFBSp6URAQDLcej0eqcwkA765qIjq+3d3
	 JQeX1+P7rknF87j0K7tneEjqOrQC3xAAvVYI9SRuMQICLyNpAW8D1PLy7OR03cJYUE
	 mn79XTPVuTKOg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8D13D408DA;
	Thu, 22 Oct 2026 16:14:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/10] docs/translations/pt_BR: admin-guide: add
 multiple translations
In-Reply-To: <20261015113121.4550-1-danielmaraboo@gmail.com>
References: <20261015113121.4550-1-danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 10:14:48 -0600
Message-ID: <87ik2t1zlz.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This series adds Portuguese (pt_BR) translations for several documents
> in Documentation/admin-guide/, continuing the effort to expand the
> Brazilian Portuguese documentation in the Linux kernel:
>
> - features.rst
> - sysfs-rules.rst
> - sysctl/index.rst
> - cputopology.rst
> - hw-vuln/index.rst
> - LSM/index.rst
> - perf-security.rst
> - bootconfig.rst
> - kernel-parameters.rst
> - efi-stub.rst
>
> All documents were translated following the original documentation
> closely and keeping formatting, Sphinx directives and code blocks
> intact. The admin-guide/index.rst was updated alongside each translation,
> moving translated documents from Todolist into appropriate toctrees.
> All patches have been validated with checkpatch.pl and verified with
> 'make htmldocs' (no new warnings).

I have applied the series, thanks.

jon
