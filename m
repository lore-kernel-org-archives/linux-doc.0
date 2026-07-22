Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4427C41A4FD
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735879; cv=none; b=ZnWRSyLx15L/GNQ37o1wwzTRo9LyoY2iVd9I5bPEv7/fRROp5ethbMVMjTakgrqwidvo1jflkQ04LpmPl9g0+CfwSLsZhqwX8N66SsH+aeDQq8EYJGLCyF7HZJXyRh14bmJUuSrPsPwN51Q/qO1+Y0flbCGyjp4MQIdabM4nYqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735879; c=relaxed/simple;
	bh=aIEOv2flmNayD4pzgskT4ddLajBqKuMAg5IRCIutKgE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I3gpaw6YKWr8iDNkyzuRLj5cBbDHZFC3E4JBu45EtsGHV6XJnmXw7wsX8XwBuiniHSt3QJRjrlrTdCBTfdmobDMUpCfMJYI0DumiHW56mi9QSVSV4APucLlCUPNGCO6CTm1exdrcIORhlcbl+8/H8nE1gpxxFpFpeSSL0CSMjFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FpRg1EIH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FpRg1EIH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E35DA408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784735875; bh=EdEXwjmRp8CBzOm6kmankVHhmrLkGeWlAY2QkH7/Ml8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FpRg1EIHC/a1zOTk3jLQg9ckPRn7BkJUNdlQEZsFtdTwM/rrS8FM+Ecawuk7vCdf/
	 Bo5T7MWGyDoGGmNPEoxZrtz94EPm4LR37ysn4Ly6dqHqy4IXYzsRSk+33Erm/gr9tl
	 lKfV0N7n3rLfBY1sUSNEGE5F/5Qqdh+iNriAmx+lGj15znc44tLaIeqA01O5O+/AgM
	 4zJeC5qlLL7ajQ/MQ2R18doOd+y3edfv/pBWJXvQpyq4vXZ5CSJLAc1318Td/wYdxm
	 MkrA0f5PCnKdregPRxLUwry710QE+YWJr1gXU0E9VbvJx92EXyS6nxfQgvaeF5KzYm
	 8PKdoqNlD4s1w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E35DA408B4;
	Wed, 22 Jul 2026 15:57:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Doehyun Baek <doehyunbaek@gmail.com>, linux-doc@vger.kernel.org
Cc: federico.vaga@vaga.pv.it, skhan@linuxfoundation.org, Doehyun Baek
 <doehyunbaek@gmail.com>
Subject: Re: [PATCH v3] Docs/translations/it_IT: sync changes.rst requirements
In-Reply-To: <20260708114212.1769512-1-doehyunbaek@gmail.com>
References: <20260707092613.1373425-1-doehyunbaek@gmail.com>
 <20260708114212.1769512-1-doehyunbaek@gmail.com>
Date: Wed, 22 Jul 2026 09:57:54 -0600
Message-ID: <8733xbdnjx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Doehyun Baek <doehyunbaek@gmail.com> writes:

> The Italian current requirements text had fallen behind the English
> Documentation/process/changes.rst version.
>
> Sync the current requirements table and add the missing ver_linux note.
> Also update directly related text for pahole, Python and GNU AWK, add the
> Rust/bindgen source links, and remove the stale cpio source entry.
>
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> ---
> Note: this version focuses on keeping the "Current Minimal Requirements"
> section and directly related requirements text in sync with the English file.
> If a full-file sync is preferred, I can do that instead.
>
> Changes in v3:
> - Sync the full current requirements table with the English version.
> - Update directly related requirements text for pahole, Python and GNU AWK.
> - Add Rust/bindgen source links and remove the stale cpio source entry.
>
> Changes in v2:
> - Rebase on current docs-next.
>
>  .../translations/it_IT/process/changes.rst    | 112 +++++++++++-------
>  1 file changed, 70 insertions(+), 42 deletions(-)

This generates the following build error:

> /stuff/k/git/kernel/Documentation/translations/it_IT/process/changes.rst:72:
> ERROR: Malformed table.  Bottom border or header rule does not match
> top border.

Please do not send documentation patches without having actually tested
the docs build.

jon
