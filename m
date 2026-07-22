Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187DB35837C
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736622; cv=none; b=tzMcV3lno1g5dD9Qcr/rnPzhjG7IPzcqwOhEqRi/AfIxeR1JPbjORDLnjq57iD7bLk66TsKr0iYIT6OQw4RUaIkJdIXzsCQVmRE4ysRWqgwTUqXpyk1LdV7kqxDWJp4119jPSZx9nl28mMfCbtR1V2WoBuzVA8yjx6jrJidEs6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736622; c=relaxed/simple;
	bh=3ObwcOXXvxvP3pfPgUsQOuHkuIig+0fELGGKJMJ4ilQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H9UGTCs97qEhWMMwKaL3Z8Xez0JwhhlNQxRm10LO4R4mEeAdBmOiN+ZEx9KatfO/1xz7AkUnMJOaIloa25PBFfCuKoPYJkWmo011PLhTHJu0Qg3Ew+dF/nlBZ4S6b3uYi92lOv59x6CclQvSEYp21XVVq2eRuraYZWAONuZ597o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Vtk2RYol; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Vtk2RYol"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 240F4408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784736620; bh=2wVs0zTxLwiMFuqHNK4D9PHHvK7a4yQ1OOtik6/z5jo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vtk2RYol6mjjQubXPD+Y2dtEg6V3YotyvVC5/+O8QL5bUCYUtfFkBTf6XBGa3Nf6o
	 q1sTuxPmW5q9WntWvBqhl09eundNay39ZeNNta/5H65YuNhNXFkq2FEZE5nhLgePZu
	 K73lXGDuXbxW+CUS7btzcCuzq7rld1O3gzdhNv8oOha95esjrcR+4RL/fWWDkOuE5d
	 bA/8ar0Uxiimo3IfzsAOY0suRqHZ31KPVXpjQK76Et8lux+j7nlxMaKlm9FD4AHa4F
	 by4spZp+OUjeJRa5mqcLz0HFLdIp2DxYRn5mXVY+6QDjBlq9PA2mH+f5kjJybrYWoS
	 fvlZLGh5vMiCQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 240F4408B4;
	Wed, 22 Jul 2026 16:10:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?=C3=81lysson?= Gleyson da Silva
 <alyssongleyson.dev@gmail.com>,
 danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org, =?utf-8?Q?=C3=81lysson?= Gleyson da Silva
 <alyssongleyson.dev@gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: process: Translate the security-bugs.rst
In-Reply-To: <20260717014310.23809-1-alyssongleyson.dev@gmail.com>
References: <20260717014310.23809-1-alyssongleyson.dev@gmail.com>
Date: Wed, 22 Jul 2026 10:10:19 -0600
Message-ID: <87tsprc8es.fsf@trenco.lwn.net>
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

I applied this and fixed the usual index.rst conflicts, only to get:

> Documentation/translations/pt_BR/process/security-bugs.rst:282: WARNING: =
unknown document: '../process/submitting-patches' [ref.doc]
> Documentation/translations/pt_BR/process/security-bugs.rst:360: WARNING: =
unknown document: '../process/cve' [ref.doc]

The patch has been backed out.

Please, make sure your changes build properly before sending them.

jon
