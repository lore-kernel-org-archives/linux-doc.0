Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186F47799D
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436385; cv=none; b=pxD0jKsTca9+svKzCIBIPWHf31iRitofNOCobNxNXLEw46EPD50GpboJUKCWwCKehQf6JbfJHL0nhBI0hS33C+ThBIahhQp+8CsDO0ozRX1kdprSV+L2AlVdxgKd0WhxDomw2q9A+eiDyE8bayv2Vpf08ODDi8xIm9jy6gAojxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436385; c=relaxed/simple;
	bh=RBodIjL1JBfZq6upcz8677pBJYJyS6INGCPErUl86Qw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xbv+DtYxDXJnd8eFs39N4CGQMVnfi9g3erac58N13hSnj8q8FaaoYyTfuwNPk2mfbFLwDlyiKSpzRn+o/estGeqAid2DMpMnn1L/v+QYM2Z8VorWnAF/mUaNTND6WZGG7rTh1XrepmtDu1dydkkm0QH2iM4ENHQ1a6WbIO6HkMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pdHo+P7B; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pdHo+P7B"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D4C4C408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790436383; bh=4Uvk+YlYSZdCaiyjUYlv4EWLegTSO2EicHwANy6Gz5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pdHo+P7BWOMys68XzaiUQVNcSJ3O7rB9eo/gcktjNtmxAZFvD3IBg1kMc3NIq21pI
	 GAU9WYcwxa76GMnuyn/gYLpQCkHxPg9r/NzifXCmFSdo++NnYYXyRNRrzjb8DM3MDR
	 qZKwc7CO+4Sq1KNqGW3Z+Fn5YjkF3fltDnQ/uD5n1C+WgR+ZdqEl1d6UvrMseomTWb
	 eR2+geGFfNm+v+KwWZFh43IKI6XhlAispYRyDFcZ7x+Cucrq/7k2wOHvsAAtIMoRfW
	 P/tncSl81EdaPg8Nsjov5XBJv2h3TFoJ3VSj9KmYp9ZI6VKv2BT3ZL5NIpVtpquPZc
	 FSfV9ASIvtvcA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D4C4C408B3;
	Sat, 26 Sep 2026 15:26:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/5] docs: translations: pt_BR: fix refs and start
 admin-guide
In-Reply-To: <20260916174136.48011-1-danielmaraboo@gmail.com>
References: <20260916174136.48011-1-danielmaraboo@gmail.com>
Date: Sat, 26 Sep 2026 09:26:22 -0600
Message-ID: <87ik3s3ug1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This series has two parts.
>
> Patches 1 and 5 fix cross-references across the existing pt_BR
> translation.  Several documents pointed at the English version of files
> that are already translated, so a reader of the translation was sent
> back to the original.  In code-of-conduct.rst and cve.rst the effect was
> visible in the rendered text, which quoted the English title of the
> referenced document in the middle of a Portuguese sentence.  Nine pt_BR
> anchors were missing and are added here; other translations already
> define their own.  References whose target has no pt_BR translation are
> left pointing at the English document.
>
> Patches 2 to 4 start the admin-guide translation.  The index mirrors the
> section layout of the original and lists the pending documents under a
> Todolist marker, the same way zh_CN tracks its own, so that entries move
> into a toctree as they get translated.  README.rst and devices.rst are
> the first two documents.  For devices.rst the device registry itself is
> pulled in with a literal include of the original devices.txt, keeping
> the numbers in a single place.
>
> The series was built with "make htmldocs" and produces no new warnings;
> in particular there is no undefined label and no broken toctree entry.
> checkpatch is clean apart from the usual "does MAINTAINERS need
> updating?" advisory on the new files, which is already covered by
> F: Documentation/translations/pt_BR/.
>
> Daniel Pereira (5):
>   docs: translations: pt_BR: point refs at the translated documents
>   docs: translations: pt_BR: add admin-guide index
>   docs: translations: pt_BR: translate admin-guide/README.rst
>   docs: translations: pt_BR: translate admin-guide/devices.rst
>   docs: translations: pt_BR: point howto.rst at the translated documents

Series applied, thanks.

jon
