Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD09E548557
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997199; cv=none; b=GspikfMmnh5dh1A5v9rTZlGyO3Vo9+2OVi35jXhtqUyi50thqxmF1WAMhnl7pEYUWsN7PeY5fDt94qf7/5plmyEhA69VGHAdgvfwVwZv8Z7KwE/oT4EBbS95Vld7MYqtxfZMB9u+oFOQUj4dCcbboSKhu02rkj6EboUBmBTSweM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997199; c=relaxed/simple;
	bh=zx5uqaOpXjVx6checB1qXIv+yr4JTgjMSfqqBLDYbi4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EUlZjEosh1RETkrSh7xwrJMcH9m9HrKJJbFupwu09EinbBG9yD2m6M9b8fWFYYtArYb5E0HosBPVktmluBtWbAWDOPafQPsVzXxwkM7q10CcjeoX8FjirBi4fSB465mHitQMEwPySTQ9jUdlJAUpCixFfgWOtlcEUFPaJE859oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cDC2mb3Q; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cDC2mb3Q"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C91E2408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791997196; bh=ducWgl8t5YTdVPH0AVTzo2zU1j3LwoaeHRRiYQM/8mc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cDC2mb3QJysizydSN0AoQlmakFRAS48SnWW1hFCQ4xnKISZBLnL84sE9+Y7tmerFk
	 3hfxLeVZP2XIavdHaz0afO/FKJD0UvlFZyU778uPLMLNfAfxAlNzRB6d8WOBS8r09m
	 Dt2tSfvgy0tdXDaDkQFEZMGS+7snlYsuJ5pJhrKay0kIhx+8l+rcCm76hBXGPbqXvA
	 3asMSNcvA4qg+6Qn8DSvPQ6aALTPIxBc19TDF575R68lMLtNRoD+ZUrr6unRvAG21O
	 P+/88BAMzsOKQRi201GWucS86Z8SSDlPfJyFd8OYqb1PrfyyE5K51/1l5nNb/YrHg2
	 NxMPfndzKIwHQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C91E2408FF;
	Wed, 14 Oct 2026 16:59:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Igor Giamoniano <igorgphotoarte@gmail.com>, danielmaraboo@gmail.com
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: process: translate userspace debugging
 guide
In-Reply-To: <20261012234410.13880-1-igorgphotoarte@gmail.com>
References: <20261012234410.13880-1-igorgphotoarte@gmail.com>
Date: Wed, 14 Oct 2026 10:59:55 -0600
Message-ID: <87jynkw73o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Igor Giamoniano <igorgphotoarte@gmail.com> writes:

> Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
> ---
> Changes in v3:
> - Point the "conselhos gerais" :doc: reference to the translated index
>   (relative <index>) instead of the English /process/debugging/index
>   (Daniel Pereira)
>
> Changes in v2:
> - Fix the title: "espa=C3=A7o usu=C3=A1rio" -> "espa=C3=A7o de usu=C3=A1r=
io" (Daniel Pereira)
> - Reword the ftrace bullet to read more naturally in Brazilian Portuguese
> - Keep "crash dump" untranslated as a technical term (2 occurrences)
> - Reword the Perfetto description
>
> The v2 rewording changes come from a review by Lucas Ramalho.
>
>  .../pt_BR/process/debugging/index.rst         |  10 +-
>  .../debugging/userspace_debugging_guide.rst   | 297 ++++++++++++++++++
>  2 files changed, 304 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/translations/pt_BR/process/debugging/us=
erspace_debugging_guide.rst

Please resubmit with an actual changelog text and we should be able to
get this applied after the merge window.

Thanks,

jon
