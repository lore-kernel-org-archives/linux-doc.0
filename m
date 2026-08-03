Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480944334CD
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782715; cv=none; b=Xiq+/KSdZorHdVTWoO6FYyZCn/CrJhbXtqtRAj/AgLEsQ/aNS8iiVpUa+CTgUYZtUu3fnocjkkq74H6BoJCraHvTlgR47xVCvgUDcbSnrCoLS2PQfobS7viP1MhO/KUeCc3YdOvnqNgTYa5TQfpuX2QhfYCcB8dtJAIqhtKQ0+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782715; c=relaxed/simple;
	bh=DHG2VfPKtcFyNzfU439X9WGCCmQFA8Uc7ZLp7q+LAI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g9suv0Y7i7wTSDhBfih5dOxcucV58aH3JjRqS8kA8gDBAk9HH2EFK2s92Sn9bWdjmwM68JJ9vs3+RPj88W0pVioQz5U/YF3AYLh5ZXiWhDqd6YidwVvDwUxRrHIF2j0z8YdcL8GGkj3YmIp5qeKDTVigL3HYKMp05ypuW3VU1W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HjUQDpQQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HjUQDpQQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 74E06408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785782713; bh=HNAoyvt7nlOBtzRdxqKX10EejO6ebjUdra9V+Pj8GuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HjUQDpQQBzY/cz8R124m1Wf+DOWi0Xmqb8ARKZZyiV47wB+X6is+nJBF0KKG6B7kt
	 IsD9I1hHiBiekcvBfWNNrluYGMOwPIdUcWrrn8PzfYMjwCcW9p21nLA0lw3S8B8XcJ
	 243R1P7PztJumUECwa6auzAcQEP8XpeeXEmayVfUB9ZUlY6gpDL0m/IS8BXYgbV4qM
	 zgJSqscxhpMBQ0yu/8USPk+rS9qWWxK6y3l5Tujc1ebBP553uxxSfteyT8hE80z8h1
	 CTbIV4u57Vtn28axYwYY/2eB5hsqJHl3KDSkizESYWBdPaXjoo00GOciSYtrhEILkO
	 4QfcG27sm4dhg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 74E06408B2;
	Mon,  3 Aug 2026 18:45:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?=C3=81lysson?= Gleyson da Silva <alyssongleyson.dev@gmail.com>
Cc: danielmaraboo@gmail.com, linux-doc@vger.kernel.org, =?utf-8?Q?=C3=81ly?=
 =?utf-8?Q?sson?= Gleyson da
 Silva <alyssongleyson.dev@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: process: Translate the security-bugs.rst
In-Reply-To: <20260727204803.35796-1-alyssongleyson.dev@gmail.com>
References: <20260727204803.35796-1-alyssongleyson.dev@gmail.com>
Date: Mon, 03 Aug 2026 12:45:12 -0600
Message-ID: <87tspbxcuf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=C3=81lysson Gleyson da Silva <alyssongleyson.dev@gmail.com> writes:

> Translate the documentation on security bugs into Brazilian Portuguese,
> maintaining consistency with the original formatting rules.
>
> Signed-off-by: =C3=81lysson Gleyson da Silva <alyssongleyson.dev@gmail.co=
m>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/security-bugs.rst           | 370 ++++++++++++++++++
>  2 files changed, 371 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/security-bug=
s.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 7a488f662..796fe9bca 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -78,3 +78,4 @@ kernel e sobre como ver seu trabalho integrado.
>     Processo do subsistema SoC <process/maintainer-soc>
>     Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
>     Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
> +   Falhas de seguran=C3=A7a <process/security-bugs>
> diff --git a/Documentation/translations/pt_BR/process/security-bugs.rst b=
/Documentation/translations/pt_BR/process/security-bugs.rst
> new file mode 100644
> index 000000000..ef7b2d742
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/security-bugs.rst
> @@ -0,0 +1,370 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _pt_BR_securitybugs:

Please do not proliferate useless labels like this one, even if the
original English has them.  I have removed it this time; patch applied,
thanks.

jon
