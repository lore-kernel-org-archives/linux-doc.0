Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8FE37BE72
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793171; cv=none; b=EEDdCSpaAvSDnVQDXMrIiIR/q5RxDI2hU3m9zSn7bRfRMgRn+wicAjqmlvB2U6UZies9QCSFcS76AT9ldJ3KQdIlx7VppiDR9U4zakYKYOVwH5RieEOupFC94bcE+9KpKVXn3e5ovdCPwiClC+kJaohTekNSNbK+Fn4whGu3aU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793171; c=relaxed/simple;
	bh=QTgxfCWbbU/qNW8ahWTcUMz4dk6m52Vfyr6TTsGlTXQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lUdP04J0rnJt/KuRMdHtjY47qH7vZXS/siA7UNMw9dQRLdsi4I4TKp3z2fREmDdKJDzjE3JAcufmBdTvd0LnoLEIv517rq6hHdEBfNSaaDbClBQLIpWy/bjLX4Shs17nDB2UJou4mfO3MhHjNAytBdX1BHNyeulXoFIbYQ2N6cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ec6Brd5u; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ec6Brd5u"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4B45408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788793162; bh=+gi/EhUfP1aYUG2SSiGIlRkZya4BawhuE6V7ocBdy5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ec6Brd5uEWTny8I/keEc4u0J+gsxpNjcwCqgXxUNZ4ZYbnQM2KC+rDRVdfDOICEm8
	 inAWlI1y2gNmBC+o9/Ei/EK9D9SNk1+f20AWoDmjIqqXhsaevRIua2UVLKsc4Hldrp
	 FAKwXT95HXehPLmgH5Kc6wWR7fl8sDPF9tH+tSLLg9P2VP2y52YeLnQABynXKeFD2O
	 4FAX5gHI8IxVp7MaKmKi6TBqF/OXkJHcjZzmP2kmIg2bhGphslnQZGHuKsA9CzOgLO
	 yv9daYJKL+4o/Ei1UUnz1/daXZFfwNOKusmR0n1oCO7cg6gtRep+TF74PNv8GJ8xk+
	 p7ZH+I/wTPYRg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B4B45408FF;
	Mon,  7 Sep 2026 14:59:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Benson Leung
 <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, chrome-platform@lists.linux.dev, =?utf-8?Q?Iv?=
 =?utf-8?Q?=C3=A1n?= Ezequiel
 Rodriguez <ivanrwcm25@gmail.com>, linux-doc@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Enric
 Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] docs: ioctl-number: Point the 0xEC row at
 cros_ec_chardev.h
In-Reply-To: <20260905102754.43160-1-kmehltretter@gmail.com>
References: <20260905102754.43160-1-kmehltretter@gmail.com>
Date: Mon, 07 Sep 2026 08:59:21 -0600
Message-ID: <87bja9xg3a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> The 0xEC entry points at drivers/platform/chrome/cros_ec_dev.h, which
> commit 5e0115581bbc ("cros_ec: Move cros_ec_dev module to drivers/mfd")
> moved; the ioctl numbers now live in
> include/linux/platform_data/cros_ec_chardev.h.
>
> Point the row at that file.
>
> Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 2fc53093752d..32c0d08e92e4 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -399,7 +399,7 @@ Code  Seq#    Include File                                             Comments
>  0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
>                                                                         <mailto:aherrman@de.ibm.com>
>  0xE5  00-3F  linux/fuse.h
> -0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
> +0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     ChromeOS EC driver
>  0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry

Applied, thanks.

jon
