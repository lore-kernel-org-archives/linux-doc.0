Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9531B2199;
	Tue, 14 Jan 2025 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736874502; cv=none; b=M9SuCZnv2IXclwT0BDvOyxZlrMMzNmWubC9qUm3F0Bbe0sXUFEOmhoZspLxZXB849LS0aAS1WOOoOL2O2NODHQG5wdKU0FUKPwO2dPM95gOCg0zNlqOUTV2ydJfFuK+gaDx1zK7d4VTeJYTNz/BYagOuFmFsDhm8jJdOEdpTHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736874502; c=relaxed/simple;
	bh=LMhMfkyTEiFGmMWRRkp7CYVMhXn2nDs4gyfcnzr1lIE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dtSRqXWh4t6TB+Mn6pEQLrxc0t7Ila3Gt0mVbmoM5eVBygmX677QmGuyO+zf+s3P0EO/eTmCr6NsKWeKwsRpoZzDCVlO5yc7GxjMTZoo/Wf4JK2oWip7w4jpnL2cWcxSnSWh7uH9Y87HKSMCJGSr9gTm7wR2BBIEPLSL1qdi1Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=O9IPTBk3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="O9IPTBk3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 15E4C404ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736874494; bh=TheP5OXpEuVq5CYXSnUQL4AqksvtX10feRdXO4anIbo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O9IPTBk3PSvevoAFeGGIXGZe31G1tb/mKp6SZ+KhVW2aH5yL7frLfNob+PWATWTLT
	 7YlPRhxOeBeQ8/nn53iaoLZxYVnQ5oTiX3yXmp+853CH398xLjUzKUFUmRslU9HRS3
	 Q0+PaoZdbCeZU28ZRFKbEbFoocp5PUtvYXFccKRjk3y9Z+DCXdQEp131hyoCVKR3Vz
	 V8j7nKe/RPm0V1myNpkk+NYm5G5b106j0Et1QVEvQeborIuBGYHfIe98a5Bu9CO/Mm
	 F/004XOm/uRF4iGdEZrOhYL3uhRz1nT4y40Y4WjzQ2gmqy0R2oIb9aOEITfmLrV53L
	 huwdcXAG/2i3w==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 15E4C404ED;
	Tue, 14 Jan 2025 17:08:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: Add timer_migration to kernel.rst
In-Reply-To: <20250114140301.141147-1-pauld@redhat.com>
References: <20250114140301.141147-1-pauld@redhat.com>
Date: Tue, 14 Jan 2025 10:08:13 -0700
Message-ID: <877c6x9vcy.fsf@trenco.lwn.net>
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
> index b2b36d0c3094..e03691e2cf4a 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1544,6 +1544,13 @@ constant ``FUTEX_TID_MASK`` (0x3fffffff).
>  If a value outside of this range is written to ``threads-max`` an
>  ``EINVAL`` error occurs.
>  
> +timer_migration
> +===============
> +
> +When set, attempt to migrate timers away from idle cpus to allow them to remain
> +in low power states longer.
> +
> +Default is set.

When set to *what*?  It will always be set to *some* value, right?  So
we should really say what the specific values mean.

Thanks,

jon
