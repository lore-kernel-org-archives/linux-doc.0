Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4482BDC13
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777820835; cv=none; b=Sahz+bVdW2lRerAInQ1VU9klBENltkihUMxmHr5DPnaMJO46w27ccbSIg3c+8s0CZoWFIGjMx3qZoTRUsyoV+QEgEDIyCFI3H8TOv1JpCRzWufaHJfMBg38FK0QeWujSLQlM6DyKHDaFyTVhz+nQdcunD6VAT8XuzbRxEOUZA6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777820835; c=relaxed/simple;
	bh=5uW4ZJSgpIOGW4q56yU7dBOVfhqRcO6lJOpx2qGWIUw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B0MKnAkG+RmQj0jVCER3gJfcN0oP8xfSBzTSQhognS2lDT/rWWYxMO61a7kx/gT5uzpiipFu4rO8tKlSpXE0hqY2SsgocXhM8qqrQXQIPHDaSW2V6F6yeBbooXt69xzk9IJ31+2c+EGz6Cs+IkPXCiQQJDZOYxW7sr69uwqtTtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cMHKPiCE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cMHKPiCE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F07E441084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777820834; bh=6z+M2m2MxAj6SxCGicBZW17oGuFWfkStgD8Mnh4k2KY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cMHKPiCEp9izQIwICxrEwLrO2esZ9DyNlr6abPT0Sv4AzObLuhjXD62UzvyXRlwyj
	 nJfHuMxJeib9VbMibjOePwc3J5nQ7kSefkpCdbjAAd6QNH2/XEbLRxSds0+9bmWfjD
	 RVzRH2Za/g5G51+DagFn67neH0r18y27ksyAlShGIFYu7cPTg1uQ24DansAkaH5Umb
	 3WdHeNqOuC7zOh8iCOmCFgOe0PWW6Lq3KfebaD4fEaNzK5jat7ArqeVOuE3upPhaDO
	 AXHAr4HFExe/2JWaX9LfrxmIRcTJ9N3fym1yNFpt2GGp5EMYGkCVGd/0hrjAqvwXhV
	 dLJRoVJmzcbhQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F07E441084;
	Sun,  3 May 2026 15:07:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs/pt_BR: process: link maintainer-kvm-x86 in
 maintainer-handbooks
In-Reply-To: <20260428180208.175472-1-danielmaraboo@gmail.com>
References: <20260428180208.175472-1-danielmaraboo@gmail.com>
Date: Sun, 03 May 2026 09:07:11 -0600
Message-ID: <87jytkcz1c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> The Portuguese translation of maintainer-kvm-x86.rst exists in the
> directory, but it was not listed in the toctree of
> maintainer-handbooks.rst.
>
> Add the missing entry to ensure the document is properly indexed and
> reachable through the main maintainer handbook page.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  .../translations/pt_BR/process/maintainer-handbooks.rst          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/translations/pt_BR/process/maintainer-handbook=
s.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> index ba36df8ee..bf7a38147 100644
> --- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> @@ -16,3 +16,4 @@ Conte=C3=BAdos:
>     maintainer-netdev
>     maintainer-soc
>     maintainer-soc-clean-dts
> +   maintainer-kvm-x86

Weird, I wonder why it doesn't warn about this...?  In any
case...applied, thanks.

jon
