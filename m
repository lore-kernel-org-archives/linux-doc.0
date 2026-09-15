Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FC14CE68B
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499631; cv=none; b=aqKI9yCax2IfIwcauTmJGcnVM7pNvPJdYFXbJtnpdCrxLWOJS3LqByTorEBv04cvwAND5I7ND2W1etzSsXhTJXK+tGJDFJS4n/6tVOd19gCitfgCv7yOQe1hmGcj+xOzg63bAnuVzB550fZgICZyfAYXSHcGQB1uNrjj497uC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499631; c=relaxed/simple;
	bh=t5YJ1sDgzuoM+DGuuN8wlIzdGBaNnWksLsBYP1Xtg4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dr+49zmXtuX29qgmhhnCSZ/PXzIMY9RGEIEIuIilhSCNOpo64bZBDPjMxhfFnW32JzuthUtFBnKlL9pcgg6bUbQJW7BPyno3CqplhbbwFlbH58RHBQ/kA3D3ChLZKeCmB5GiR5MqgU8TMsPnwgJml+6hikVYj3sytwHk1FW2+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=h6oXDSt+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="h6oXDSt+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 20E064090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789499629; bh=YErddnMmXnkB22ERf4oNVXnlZiEU+hLbNL1csghHbhE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h6oXDSt+z3j9XzwYRZEcwiCoiKCYyXsoDiwdtyA6bT0iYe9F+rVQ7ke3Bmg7Wd1Oy
	 oz2BDWS84nkpLze1UZXShJ/bJzuzqzSruYp6wILQuIM539mN9gRpj0hDqPZ7v1Iqy5
	 BFWB9dP++O/Gnoeiqu0QPf2uA/RTD6QgqZHfKOgRE6vltwA77StHoAojsGLIviwoU+
	 6OTgNMzwRk8A/5b/CafZ9qOFB1pLAJt/+HBiEu1mOAL/67dd+l0aLG+sxYbsPk4Aev
	 M8p98ZmzCRTrVF2MpXmfqpdIfeYXtLCjqDlyLvDEgKdDPmKO/a5u1/NUduNc+SNlTI
	 p7rVaTNGxUo1Q==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 20E064090B;
	Tue, 15 Sep 2026 19:13:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH 0/4] docs: pt_BR: process: Add remaining core process
 translations
In-Reply-To: <20260909124905.6156-1-danielmaraboo@gmail.com>
References: <20260909124905.6156-1-danielmaraboo@gmail.com>
Date: Tue, 15 Sep 2026 13:13:48 -0600
Message-ID: <87se3a8h03.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This patch series introduces new Portuguese (pt_BR) translations for core=
 kernel process documentation files.
>
> Changes included in this series:
> - New translations for coding-style.rst, kernel-enforcement-statement.rst=
, maintainer-tip.rst, and submitting-patches.rst.
> - Meticulous alignment of all section underlines in coding-style.rst to m=
atch the title lengths precisely, preventing Sphinx compilation warnings.
> - Thorough localization of internal cross-references across these documen=
ts. We applied the `pt_BR_` prefix to anchors such as `pt_BR_describe_chang=
es`, `pt_BR_backtraces`, `pt_BR_resend_reminders`, `pt_BR_split_changes`, `=
pt_BR_the_canonical_patch_format`, `pt_BR_interleaved_replies`, and `pt_BR_=
maintainer-tip-coding-style`. This prevents "duplicate label" warnings duri=
ng global Sphinx builds.
> - Cleaned up orphan labels (`tagging_people` and `explicit_in_reply_to`) =
that were completely unused internally to streamline the documentation.
> - Improved readability of translated technical terms (e.g., using "coment=
=C3=A1rios no fim da linha" instead of literal "coment=C3=A1rios de cauda").
>
> The entire series has been validated with checkpatch.pl and successfully =
passes `make htmldocs` without syntax errors or broken internal cross-refer=
ences.

For future reference, please try to keep the cover-letter text within 80
columns as well.

> Daniel Pereira (4):
>   docs: pt_BR: translate coding-style.rst
>   docs: pt_BR: translate kernel-enforcement-statement.rst
>   docs: pt_BR: translate maintainer-tip.rst
>   docs: pt_BR: translate submitting-patches.rst
>
>  .../translations/pt_BR/process/2.Process.rst  |    2 +-
>  .../pt_BR/process/coding-style.rst            | 1318 +++++++++++++++++
>  .../translations/pt_BR/process/index.rst      |    4 +
>  .../process/kernel-enforcement-statement.rst  |  163 ++
>  .../pt_BR/process/maintainer-kvm-x86.rst      |    6 +-
>  .../pt_BR/process/maintainer-tip.rst          |  847 +++++++++++
>  .../pt_BR/process/submitting-patches.rst      |  961 ++++++++++++
>  7 files changed, 3297 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/pt_BR/process/coding-style=
.rst
>  create mode 100644 Documentation/translations/pt_BR/process/kernel-enfor=
cement-statement.rst
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-t=
ip.rst
>  create mode 100644 Documentation/translations/pt_BR/process/submitting-p=
atches.rst

Series applied, thanks.

jon
