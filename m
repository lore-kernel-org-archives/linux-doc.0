Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383D36BCD6
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882081; cv=none; b=qqOkPGP/n3FhSXaJJi6o1K3To0HOVSIsxbwmRHZagoNFKw29vsH0d48sGofri4maItG9OdqXelUtM7CLufvJe9ufMd31CFE58bKwRT1cTwJ3xVRJPbm5Zq4jkiCm7bIOvxH7iFNH3HsL9g80XpLeFN9HR00lVZPuqcv7QtiyeXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882081; c=relaxed/simple;
	bh=pEcbpemlzyrcXVDHNDxFz6DAL1qPNZggXAXRxYNW6O8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YoLyeZp1Z5uMQY8ohwbmjUSDGTj0QworKTWT9s554YG8DhuVIYySDONSZxYk7LEOKXp20TDUbL8uKJVNA+fB8oIiAb11kgeWuKa0x2IX4TzaeXYEk8ffHxQEU/CBYxVFAJ23xlomYjG/DAWXTQkaduvxL3822bx2P4EzV9+U898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eZjCcRce; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eZjCcRce"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C4E8E40423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771882080; bh=bgfwjqft95CCXN7HXkATYWH+RyEA+LJuZ/cQ3zaTlVA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eZjCcRceR8g1q2b/i9Md5IrerBzvQbGARTcWdqG1H2AW29XyiGulMY1Iy5T9kbhfT
	 +R1PKr6YMjm1752g1gQCf5FrRLULc3KBMisBAESVmr+cbyl5/LBTMZpndp/lqQycHI
	 IcfXLVvuWTltnc0r/cZpJM9RjmfN5Dv7NpNlEVpe0NztTJwfVZ3WpMoY0+IpvGkBtU
	 i0Mi3b2Ycm8KoNkkRCFaOamrHH/5y0B1tVa8vDwvDJKNC1nQstGRxEyiOOU8d+eqyx
	 ggTOQpL1YObLbDkmhWsp/X+xKYhKydpFH4/fFZbSMGUN78Eudp3YVgli8xDaO0CxA7
	 CntqvK8lPhW4A==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C4E8E40423;
	Mon, 23 Feb 2026 21:27:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: translate process/changes.rst
In-Reply-To: <20260209184343.15191-1-danielmaraboo@gmail.com>
References: <20260209184343.15191-1-danielmaraboo@gmail.com>
Date: Mon, 23 Feb 2026 14:27:58 -0700
Message-ID: <87zf4z40bl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the Documentation/process/changes.rst file into Portuguese.
> This document provides the list of minimum software requirements
> necessary to compile and run the Linux kernel.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>

OK, this one needs a couple of fixes before I can apply it.  One is that
the lines are way long.  Remember that we want the plain-text
documentation to be readable, so please keep to the 80-column limit
there.

The other one is here:

> +Por favor, consulte :ref:`sphinx_install` em :ref:`Documentation/doc-guide/sphinx.rst` <sphinxdoc> para detalhes
> +sobre os requisitos do Sphinx.

That creates a build warning:

> Documentation/translations/pt_BR/process/changes.rst:366: WARNING: undefined label: 'documentation/doc-guide/sphinx.rst' [ref.ref]

Don't use :ref: here, just say "Documentation/doc-guide/sphinx.rst' and
the right thing will happen.

Yes, it looks like the original is wrong here too; I'll take care of
that.

Thanks,

jon
