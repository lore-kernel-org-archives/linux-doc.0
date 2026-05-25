Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE833F8BE
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741024; cv=none; b=cxhjX/5yfHGZ49RF8Aav9tCBiu/RIl/CPjgnAFynvw+yWRKQZlmBtB0SeBj5WYT+G6Vju+jwT/yXdTfWa6tRWAVahHGynjC2CWpHHK327lRMnSOzw53nCmTuUYnmssxCxuzNECNDD89DfWJ9jTausvpnlNgeO245GlPl2Y//8Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741024; c=relaxed/simple;
	bh=v4j9bY/kMiAtO2nDdNwx+6gBc1BAFW7j6HFZ+YEgTr0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KOe3r+d6c/35c2Gwu1eIV49kn8KtDFMW/lfpxnw4Bg+Rki66aZIm71ENEZC7HuiESs8vtPg0HArd4iWBwJAiGfxQuB4rk7rcl/80nLSs94VK5Y6C3UaK4iijk6i22H812q/S4F1kkBAcMJK0u/t76eNJxZVwmO4zRjLstKl39b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=A4DMzf+D; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="A4DMzf+D"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0EA7640E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779741023; bh=RI22rL46qxxVBJF6GrglodTaqHnl/WjRmCsdJfrWeCA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=A4DMzf+DiHzv72dIwdZ5lAtAZsC4Sqg5UoNnIwzmn4hCRYV2MIYo4syR6QQqqz2dX
	 EELlgFjA9GUBSatBTAWKrXyUJQHf39woJ2KUdpITIgOPoQOP1L5bbBohaWMNcWUjN3
	 Azsx+j0bMQVNsMgmcZe4o34g1vjaoWnTV1qb4PfnCsjxicR1ljymKNK5JnNjsXlADf
	 GqKYFtV0K0cPZA6Y3GJPaAsaE0UZgvYM2chL5hIY0tbB1gS+xFwbls0SWyChxvifPf
	 YmkLh9iyUbkTxgYI9wiL3de8UkUamcrJaEphTvJmb2SqnLy5m1o8K5NeTUQH21v2x5
	 fYVun51jc0Dig==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0EA7640E36;
	Mon, 25 May 2026 20:30:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: update minimal software requirements in
 changes.rst
In-Reply-To: <20260515182200.654324-1-danielmaraboo@gmail.com>
References: <20260515182200.654324-1-danielmaraboo@gmail.com>
Date: Mon, 25 May 2026 14:30:22 -0600
Message-ID: <87ik8bz0yp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Update the Brazilian Portuguese translation of changes.rst to align with
> the latest English version.
>
> Key changes include:
> - Updated minimum versions for Rust (1.85.0), bindgen (0.71.1), and
>   pahole (1.22).
> - Fixed ReST syntax for internal references (:ref:) and external links.
> - Corrected formatting for tool names and config options using inline
>   code backticks.
> - Synchronized technical descriptions for udev, kmod, and NFS-utils.
>
> v2:
> - Fix alignment in the minimal software requirements table that broke the build.
> - Fix Sphinx footnote syntax.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  .../translations/pt_BR/process/changes.rst    | 56 +++++++++----------
>  1 file changed, 28 insertions(+), 28 deletions(-)

Applied, thanks.

jon
