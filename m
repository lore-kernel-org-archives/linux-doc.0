Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E716937DEBF
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053790; cv=none; b=NL+DFyc5NN9x/4umk6Fcc13tHkB/Qzuo9yPfENdiYpkhp2I35x0yt2+IG1jqhOMe0CnJn4y4/h8jKc8o9doBQS+aR8tnhgw+AR3J3k7BJmi9ehF5WWw+6gudo+uxhaq6flJRDM6e1o+oHIVP9qzRs18QaNAj17QA6IXcRfbg5Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053790; c=relaxed/simple;
	bh=PyjkNbVcb4EyQO5jbfeFY28WR/Yx3AQcbQMyVRYQUpY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u2dAwRqj6RFqDfrJGx5404a/th4yGn31M79nOTZJ9QEPNpVDETieIWy+rN2ks+dTKqKY1+fffQ/qdILfCnM/P8MfVAvHFzpZ33rDs3nqGgQgaQN0iBvfwMeO9LMSJzE6lBTgGQ5yGtNTtCFyJWqpGKAEdsS7jlMANkXoXUStGo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=X0m8hs08; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="X0m8hs08"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1348B408FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789053777; bh=MDiCzHL9oCF6XhSUvJ9b4q+2G7HxN9uQz2tEOmzhYDA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X0m8hs08x0WILUNUfLF+bJ5EQxrk4ROfx8Zx3D/6NH4W5ECjR9pZRMzjjp3Yo56fU
	 j1LSTIi97tbWuNb2Ojd1QHH5/nBvp+VFp6ON2x+pu7I04AiLdQBS29YmpLbG92Tx7k
	 qSXUbzgGYQQYKGAe1pyfloCq2q8xAVm3A9OQcz13b3YeN+fLOWhfYBYIe3CJ9RO+or
	 2ROk0JPRqJY6OKFSdp5+hpcH3gzaLjd2lmkwfErNyFLgAJikjO4EfUggXr7m+zmBI2
	 h4V4GRbEQeEIolDzuRYejqL+GnzinC7e6bc5bR5T5MUk4CbQ3St5la00qZN6Wsd+yu
	 6Wf9PG7bliy+g==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1348B408FE;
	Thu, 10 Sep 2026 15:22:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Fabio Pereira da Silva <silvapfabio@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate
 stable-kernel-rules.rst
In-Reply-To: <20260910151204.1248-1-silvapfabio@gmail.com>
References: <20260910151204.1248-1-silvapfabio@gmail.com>
Date: Thu, 10 Sep 2026 09:22:56 -0600
Message-ID: <87v78di10v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fabio Pereira da Silva <silvapfabio@gmail.com> writes:

> Translate stable-kernel-rules.rst into Brazilian Portuguese and add it
>
> to the pt_BR process documentation index.
>
> Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 71eb024fbec8..fb3c5a951ceb 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -73,6 +73,7 @@ kernel e sobre como ver seu trabalho integrado.
>     Requisitos m=C3=ADnimos <process/changes>
>     CVEs <process/cve>
>     Lista de verifica=C3=A7=C3=A3o para patches <process/submit-checklist>
> +   Tudo sobre lan=C3=A7amentos -stable <process/stable-kernel-rules>
>     Interface de drivers do kernel Linux <process/stable-api-nonsense>
>     Conclave (Continuidade do projeto) <process/conclave>
>     Manuais dos mantenedores <process/maintainer-handbooks>
> diff --git a/Documentation/translations/pt_BR/process/stable-kernel-rules=
.rst b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
> new file mode 100644
> index 000000000000..6050bfb1c543
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
> @@ -0,0 +1,249 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _stable_kernel_rules:

This will cause a docs build error, showing that you have not built the
documentation with your changes.  Please always do that.

In this case, the useless top-of-file label can simply be removed.

Also, are you using an LLM for these translations?  If so, please
document that usage as described in
Documentation/process/coding-assistants.rst.

Thanks,

jon
