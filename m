Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB806139CFF;
	Thu, 16 Jan 2025 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051505; cv=none; b=rBTFvZg8Ev5olRp+5+21udBc+/Q+pjrRX7V2gcuvST2Qpe7zoQ++deJ9tBR1Dl3Pbdzs0A7AZbDnPEBVGVrl1ozro+EINJmbk/pmcrP6Pg9BfHxsExjGKEL+FyhXQH37GznqecRVfZQUG1YgQRNaEixULe/S/2C8vY8J/Gk00nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051505; c=relaxed/simple;
	bh=36mSOMMXnehWka4csq9B2MkRKuZqb8l9eaKyfBROMcE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qeo2YygL1KZqhESccOHz89cdAQYBRdxTeasYKwnWXaJ73IDTOM9TNXuWA6WAODgmfo46MNSVxipuhSoozNVxBLSB93mGGtKrUR+WFSgu2RMjChYQk6z0FZRLy9choEe+cksct0tOExY44EkfeZwAuBnC2sFl8g41FU/1Zy7bNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Et1fi1hN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Et1fi1hN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 16249404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737051503; bh=J1Ei2keOWRCLbp3byjt3HSVTIMZgq4JtjfOT3523mzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Et1fi1hNAB/Ghx4iRXOv++8HGjeqdJNPclFYWn2USTDURCnE35xE9fsoyqceyo7RO
	 7OwyaQelHND785S7Jge7ULwTsuku+k7GHdEt856q0MB9jRZFVkJUg6ou/X+D20AHHC
	 Y8aP7Lb0Q3gprek/V762lD0nVpow7BsLGbs0liSGuyvtQSiryxVAYzLIdvv8KIII97
	 XVAumgPid4htiHhkrWooYZyTDJhnDG+0o5P3d4Y9BMKxXz79fHj3IgS/0AuWVEoRlv
	 B2ROuYK7SS0hE3Hfn0jwKCAn6dihwEuZgfkTbRt2LHKeT+Ms9YDfxf2uXzwPkmx58D
	 nEbE9mfOv/vHw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 16249404F0;
	Thu, 16 Jan 2025 18:18:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/sysctl: Add timer_migration to kernel.rst
In-Reply-To: <20250114190525.169022-1-pauld@redhat.com>
References: <20250114190525.169022-1-pauld@redhat.com>
Date: Thu, 16 Jan 2025 11:18:22 -0700
Message-ID: <87msfqzkpd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Phil Auld <pauld@redhat.com> writes:

> There is no mention of timer_migration in the docs. Add
> a short description.
>
> Signed-off-by: Phil Auld <pauld@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index b2b36d0c3094..7c759797501d 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1544,6 +1544,13 @@ constant ``FUTEX_TID_MASK`` (0x3fffffff).
>  If a value outside of this range is written to ``threads-max`` an
>  ``EINVAL`` error occurs.
>  
> +timer_migration
> +===============
> +
> +When set to a non-zero value, attempt to migrate timers away from idle cpus to
> +allow them to remain in low power states longer.
> +
> +Default is set (1).

Applied, thanks.

jon
