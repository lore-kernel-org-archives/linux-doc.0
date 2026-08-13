Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA3D48A8C5
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634714; cv=none; b=YQvq98IaVX8mCTkK7qG4lSkIpPE3B3URRFzDZtp8YeI27IrKxyNJDUrA0tvAsU/J5r83oezsEBe81VYgNJCagZagFHDw1eAuvPJ/wMXkUTN3IM7HEZ/O72uCOb9GvvXwkGhjzhln0UC4zvJGKJXu1tNwQsF+p44uxlnyf89Sxj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634714; c=relaxed/simple;
	bh=131LzxrJdR4vZbgRYXa2xZw+weamyZRXIT5gEcstZ10=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WlOz8ENcYY975PiJMBnQBMCSbf/orT5tQnUeyhl0Ht653SsdPDLTQG4pqu75H7ogRu+BG9fP+Flm5AZZmgkdmq084Y3FjqC6MGm248oXrzk02VXCyXoJ5HrDq5CT5va1uB09xFEsHd3Yk+Li7sg+9FWcllCNGPVDVnD7Ap/Qr2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nCkmXrZ9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nCkmXrZ9"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0609F408D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786634712; bh=WR+KrVo7jJb/mUB8+aRayO+z/F2gxZl7xZWtoi//a5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nCkmXrZ96bKXDKsLH/lZzMtZFt+y/+ifuqWH4nz33e7WuMfp610RjyIQQ9mw2LZEi
	 qnCO5YYCzn1bm6qIvA4V/g6UBap3kPV8qBuuW1hZ3M4StUumQ8L3A/uTOj5rLQPiZ1
	 11mEbNDIcCiZLq8RGVjAUmVTnWownC/FFLiEfDiyH4BI3P8gVXwU7665F3YPBTrZYa
	 qKHHCpXM2znZw/Saw6bayFie95RDG+KK7pz240VxGGZdpgqz7/m8xhHqYOYp1OtH0z
	 K1tTiaz2nE9UFwPc9r2Hwj7LxujFocu8mKMsAn7JKr4UXS7c73X8W9TbukKxiZap0F
	 dmbVyui3gAf8g==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0609F408D9;
	Thu, 13 Aug 2026 15:25:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Reorganize process/index.rst to follow
 english structure
In-Reply-To: <20260813134741.11025-1-danielmaraboo@gmail.com>
References: <20260813134741.11025-1-danielmaraboo@gmail.com>
Date: Thu, 13 Aug 2026 09:25:11 -0600
Message-ID: <87ldaahwko.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> The main index.rst file for the pt_BR translation was grouping all
> translated process documents directly in its toctree, which frequently
> caused patch collisions among contributors.
>
> Following Jonathan Corbet's suggestion, this patch introduces a new
> pt_BR/process/index.rst that mirrors the subsection structure of the
> English Documentation/process/index.rst. The translated documents are
> now organized into their respective categories, rather than a single
> flat list.
>
> The root pt_BR/index.rst now simply references process/index.
>
> This matches the upstream categorization and significantly reduces
> merge conflicts for future pt_BR translations.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |  27 +----
>  .../translations/pt_BR/process/index.rst      | 104 ++++++++++++++++++
>  2 files changed, 105 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/translations/pt_BR/process/index.rst

OK, this is what I wanted to see.  One complaint:

[...]

> diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
> new file mode 100644
> index 000000000..5cecc0300
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/index.rst
> @@ -0,0 +1,104 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. raw:: latex
> +
> +	\renewcommand\thesection*
> +	\renewcommand\thesubsection*
> +
> +.. _process_index_pt_BR:

I continue my hopeless quest of trying to convince people not to add
these useless top-of-file labels; all they do is add clutter to the
text.

I have gone ahead and applied the patch so that people working on
translations have the new base to work on for 7.4.  But I took out that
label.

(I have doubts about the LaTeX boilerplate too, but left it there).

Thanks,

jon
