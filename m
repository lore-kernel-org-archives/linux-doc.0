Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53114442B31
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787814; cv=none; b=e8qKaz0/k2vLcEn3+kn+LplujSaNHM7+GgpDKonRhcYaOzuvGhL0qI25DekqnbPonj9/3eFjOxCUu+GZ/a2W6NijwhVaAyAZsoXNHvit9unmAmNhRYEe84WnpQwpVKbdxsUKH02AqS7dwvUEEKEDqwJ4gs3WPAiAhKqXkjryJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787814; c=relaxed/simple;
	bh=nrP6+r3rMiu5lYO3pHK91F2f4v/cxIthsPnTxps0b0U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sXsOMOH3NvM1CUAffaaJ3IHi6onra1lJrpmB0O/j+LnQFTOAEaToYFi1SKBP0T/L/S3m85j4m1u4hwjfvH08/hhvGORiH24fJhYXqdoHPJyIq5fEs3FssEJocI6ug+bbN3iSCZadItJ8QchSlypbnCHBFhUOaWdePI5KdTlT390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GoOhE+Gj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GoOhE+Gj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6AE4E408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785787812; bh=nHVKdH2fWAYe3JUKTXZItYnZQNTzypOFCklIo/dqR74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GoOhE+GjN1ZJv6Cc2dNZxEd6PaBKXdRMMGZ8u79ZQJAXvMj4achCJNf3z8Owq+baO
	 AEVCcCLlKW6+cXLgzzuXRQ8bn8yAHawEY/cd9VA1rs/EuyOIl3df0/4mdbZNxE+kzt
	 mlmQhZwD5b45Gx6V+KSped4+GVPICaiHIEYiRacjbhLtCGJHRZzLw1gpS0m7rZCV56
	 LbwkjXmPzQIFmyYF9ScWVOXE4yjkGs0sMnqouieLdEloALjQKOcHUpOiK+2C1qPDS+
	 hOSQNNIu8ZzXdrsXH6txFEQuzCqPI6/lNaqcxm2Bn5bgqyh6Q/+1m2inLxY6FIz9Qp
	 EuO9ClQEnoIIg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6AE4E408D2;
	Mon,  3 Aug 2026 20:10:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Fabio Pereira da Silva <silvapfabio@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: pt_BR: process: Translate CVE documentation
In-Reply-To: <20260709131213.1216-1-silvapfabio@gmail.com>
References: <20260709131213.1216-1-silvapfabio@gmail.com>
Date: Mon, 03 Aug 2026 14:10:11 -0600
Message-ID: <87fr0vvucc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fabio Pereira da Silva <silvapfabio@gmail.com> writes:

> Translate Documentation/process/cve.rst into Brazilian Portuguese and
> link it from the pt_BR documentation index.

The handling of this patch was significantly delayed because you did not
copy the maintainer (me).  Please review
Documentation/process/submitting-patches.rst for information on the
proper way to submit kernel patches.

> Changes in v2:
> - replace "conhecimento especializado" with "conhecimento t=C3=A9cnico"
> - change "atribu=C3=ADdo contra o kernel Linux" to "atribu=C3=ADdo ao ker=
nel Linux"
> - reduce repetition in the applicability paragraph
> - replace "=C3=A1rvore de fontes" with "=C3=A1rvore de c=C3=B3digos-fonte"
> - replace "grandes n=C3=BAmeros" with "grandes quantidades"
> - remove the repeated "qualquer" wording in the same paragraph

This information does not belong in the changelog.  Put it after the
"---" line so the maintainer does not have to edit it out.

> Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../translations/pt_BR/process/cve.rst        | 125 ++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/cve.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 76936710b06e..dcc238a5ecfe 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst

[...]

> +podemos deixar de perceber algumas corre=C3=A7=C3=B5es; portanto, presum=
a que algumas altera=C3=A7=C3=B5es
> +sem um CVE atribu=C3=ADdo podem ser relevantes para adotar.
> \ No newline at end of file

That last line is a red flag, you should not send patches with errors
like that.

Applied.

jon
