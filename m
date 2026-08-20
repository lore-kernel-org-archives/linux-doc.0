Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43CD2459E1;
	Thu, 20 Aug 2026 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787268182; cv=none; b=dq3yHfUrMazqPy+BVw4h8Q+Xlkay4n25iPotdnkCTWJNla6M/2fnB5LUcW5DL780e8DnA+iUBQanhQgOX9UksVLlxY01qVByOtYVeiBcsMJs/CA1IN0Hi2k9Nj7rPdOWQ8r9unp8NlwSGO4l+s9RIPwt+XQq2rmV1ewOPkYH93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787268182; c=relaxed/simple;
	bh=4w7oJg87iQ8r/V9DTp8iy8gk7GuQfYQ48EI2+F7QiYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NOnoweZ4KP0pMcU4IFDsD+pfWFWL+88egINJCnOH2dxeGuYrJ0+SyxVcehHNlvnnL0RMWSO6iq4cqroHO8/TMFu3j+2AkFssvOvNBs4ZCDCUvJU3+WkA6awrJO3nJFku0VVC3+NH+ZITyH05V1t+0MebHeKzs13Dkcm9bQKlqBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oHKXgn+P; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oHKXgn+P"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 67C51408BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787268174; bh=mExptx/eUOTmXb9AUHbqcE4Gt9C/8kvL5GjYmB3tNkE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oHKXgn+PeHLh80GShoX3zsGbq98wHZ5U7STzgfqGQVbNr2aoM2WgTQ7ivapA28oV/
	 caXdZulXtAvdJB5GjhpysNvRRVnaQ9K7aZurmLQTERnu038p7RzAHmaiBNLdlc+EzO
	 RM1LhqWYeiEj26LNyqicojnK6UesFmC9DYu1ZqkuYJIVrVKrxiMy6YN66vZO+mDKwX
	 MmqxOE2j6q0QUyXcuarVdPpFzgqDLQidwEXKCJ+/xOmWobJTFYmRbEx6SNhSf5KHW/
	 oR5/zaRHWBD7SXmoG2KOxC8n6ZuGiE2f/XnHHiknMQDUc0Zs/Hc0KzfYqj5BwJcjQq
	 C1aSV+dWb7RlA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 67C51408BB;
	Thu, 20 Aug 2026 23:22:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas Adryell
 Ramalho <lucasadramalho@gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate
 stable-api-nonsense.rst
In-Reply-To: <20260820-ptbr-stable-api-nonsense-v1-1-0341f55fec2d@gmail.com>
References: <20260820-ptbr-stable-api-nonsense-v1-1-0341f55fec2d@gmail.com>
Date: Thu, 20 Aug 2026 17:22:53 -0600
Message-ID: <87bjaw4bsi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Lucas Adryell Ramalho <lucasadramalho@gmail.com> writes:

> Translate Documentation/process/stable-api-nonsense.rst into Brazilian
> Portuguese.
>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  Documentation/translations/pt_BR/process/index.rst |   1 +
>  .../pt_BR/process/stable-api-nonsense.rst          | 218 +++++++++++++++=
++++++
>  2 files changed, 219 insertions(+)

Thanks for working to improve our documentation, but:

> diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documen=
tation/translations/pt_BR/process/index.rst
> index eda2a3fc5..1fb2f325f 100644
> --- a/Documentation/translations/pt_BR/process/index.rst
> +++ b/Documentation/translations/pt_BR/process/index.rst
> @@ -58,6 +58,7 @@ Estas s=C3=A3o as regras pelas quais tentamos viver na =
comunidade do kernel
>     Interpreta=C3=A7=C3=A3o do C=C3=B3digo de Conduta do Kernel Linux <co=
de-of-conduct-interpretation>
>     Modelos de Maturidade para Contribui=C3=A7=C3=A3o no Kernel Linux <co=
ntribution-maturity-model.rst>
>     Declara=C3=A7=C3=A3o sobre Drivers do Kernel <kernel-driver-statement>
> +   A interface de drivers do kernel Linux <stable-api-nonsense>
>     Estilo de gerenciamento do kernel Linux <management-style>
>     Conclave (Continuidade do projeto) <conclave>
>=20=20
> diff --git a/Documentation/translations/pt_BR/process/stable-api-nonsense=
.rst b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
> new file mode 100644
> index 000000000..dd3dc3e8a
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
> @@ -0,0 +1,218 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _stable_api_nonsense:

This will generate a build error, so you have not actually built the
docs before preparing your patch.  Please do that before resubmitting.

If you need to preserve this label, you need to make it unique; that is
generally done by prepending the translation language, so:

  .. _pt_stable_api_nonsense:

That said, this label is unneeded, it is an example of the top-of-file
label pattern that I have been trying to stomp out for years.  So just
remove it.

Finally, did you do the translation yourself, or with the help of a
generative system?  In the latter case, please see
Documentation/process/coding-assistants.rst for the disclosure
requirements.

Thanks,

jon
