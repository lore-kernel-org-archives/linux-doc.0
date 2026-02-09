Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5151A2545
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 17:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770659789; cv=none; b=X+O4ttfDJdy/jKi9lWCDRXutKh94TgDroJQ/OZz8HXxuJ03EXgJven5aMxBiYhCqqW/uom2wN9oJ31tLUm0MgPW2CzhWhk2ivoN+T6YFGvjPOnOKRw0pvqnvWEEySA955yj6GUjD74s8y5RT7yrLRG/1JTw/rFH/tFUb912Gpg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770659789; c=relaxed/simple;
	bh=TD8DyCHki/aYWk+Qb2uLt/xGGo5x+p3/WOxkKGlua9E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f1Vnu/byeERZsY1leqkSEAkWLjV9fJYWEBAwMr3a/1rA7G38nUjbGueeRfHYf+YbgDeyVC5uCwODHDJI03LHRBOcblI6jsZc0gtoOpgMhNUnU2Pm40W3boJzRZxON1FW4wAc4IFKhQim08rrbLwptM8xsv7Cv8/iYQ0qX6vOCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JR0DJERI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JR0DJERI"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B3DE840C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770659788; bh=8LN5cyoj6qcEKjnMylGcauwf/5TNjK+xBKXz8nY/WHE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JR0DJERI00Hk3qvyq3INh5mmS7r8NxchJ8qzzX0xBce+cQUkPwtte9kUv+UQbuV47
	 OT7+PEaJi6PIHvHEoVhAVrlPr/P7CfWqGesA7qh0SZUN73ZKDPhQZFxlnfcxiTOJ/m
	 l3ziWKjqjt7nUnjr5dlipmJxflWNRPMYiL39lXY7LTnzPjJmbCus/RPVTgf2MpaCYI
	 A9wsZp0WQbI4j+mDFVC7pRkhrJwGcl0uLuCQSKVJatZESqGDispmrziEV72Vuus991
	 7c++5LWDn2HbzQ3iQbGcwlUtQMrQ5OyfjC+aF+kLhpfaRmzmjZsHI7ZELjsOyhKoGA
	 wtB+vh3r98Vqg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B3DE840C3E;
	Mon,  9 Feb 2026 17:56:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: translate process/changes.rst
In-Reply-To: <20260209172621.11330-1-danielmaraboo@gmail.com>
References: <20260209172621.11330-1-danielmaraboo@gmail.com>
Date: Mon, 09 Feb 2026 10:56:27 -0700
Message-ID: <87seb994xg.fsf@trenco.lwn.net>
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
> ---
> Note: This patch depends on the previous work:
> "[PATCH v5] docs: pt_BR: Add initial Portuguese translation"
> if the pt_BR translation directory is not yet present in the tree.
>
>  Documentation/translations/index.rst          |   4 +-
>  Documentation/translations/pt_BR/index.rst    |   5 +-
>  .../translations/pt_BR/process/changes.rst    | 540 ++++++++++++++++++
>  .../translations/pt_BR/process/howto.rst      |   2 +-
>  4 files changed, 546 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/translations/pt_BR/process/changes.rst
>
> diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
> index b6d24f6f1..03b146e24 100644
> --- a/Documentation/translations/index.rst
> +++ b/Documentation/translations/index.rst
> @@ -28,9 +28,9 @@ Translation's purpose is to ease reading and understanding in languages other
>  than English. Its aim is to help people who do not understand English or have
>  doubts about its interpretation. Additionally, some people prefer to read
>  documentation in their native language, but please bear in mind that the
> -*only* official documentation is the English one: :ref:`linux_doc`.
> +*only* official documentation is the English one: :doc:`../index`.

This seems like an entirely unrelated change; why are you doing this?

Thanks,

jon
