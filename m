Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDAF36B06A;
	Tue, 18 Nov 2025 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482407; cv=none; b=AGYe4hQHOt1VMG9xWB6nlGui5hs9MiM8lWJorsePoQatzTHkcEJX1vJctGiOzHFy4xJiDAEaBy4W/I40bQpyGF9of8JKlOUhUvYZZFyf2sXV1h4NnDG91no18UB+zjV3xae63CBUclimxqlaJD+CnuAYVcM8nYXB/NF4r9hlszo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482407; c=relaxed/simple;
	bh=fMVg6kUFvZ4hm8pax1Nt92nTVAxARMIsUralFPP6blY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uLFxxkpOZ1bLeL3mWzWgLuyREJt5kK3zh7HC+sCilCjpcymHfZOTxGH5tHHqqvGbTiNJDrz1LwdQ2Duh11he8weqxXHb60Kg8np6BkEXB1h2hH9NHZlBdZE3OdhkigZrzUeIQi5WZw0tbi0klYrYNxIt/JDgQWeGdyDiowXAv4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o9fbipkb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o9fbipkb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 817A840B2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763482398; bh=NI7tUlUigfRRK31FqvYbnOh3Jkj4dLxDjYdExSgPT1k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o9fbipkbpkiOzAHktXAa10diLZDBCdR4mFwcb1o6lisIkrXUiiYMHUyNUlBWzsBVt
	 t47lLpKdyj8zQpSx1E6YH/ScROflNI1fT0IlgGDeM5r8qjwVbk7QeXc8YT70ZPsm7g
	 zDe+xnCcPx+bux0Ma2WHlJImWVgNk92jZlowz7v2LelzrwGqRFUMEE1coj69/pPRoA
	 51lN/qsDNjs0HJGpsIXW4k04jz0p/kLKF5+5yFP3qsT0YDOawbDdzv1F9Hk5sO7Fba
	 2km9+43hlU50rkgFmcnD7MCYO05i9j3IMx1SOhbQDSrRyKOctsODagFk4AZBBoysTa
	 oQKy02TWsGtcw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 817A840B2F;
	Tue, 18 Nov 2025 16:13:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Xie Yuanbin <qq570070308@gmail.com>, akpm@linux-foundation.org,
 bp@alien8.de, peterz@infradead.org, mingo@kernel.org, pmladek@suse.com,
 paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com,
 feng.tang@linux.alibaba.com, kees@kernel.org, arnd@arndb.de,
 fvdl@google.com, lirongqing@baidu.com, bp@suse.de, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Xie Yuanbin
 <qq570070308@gmail.com>
Subject: Re: [PATCH] Documentation/kernel-parameters: fix typo in retbleed=
 kernel parameter description
In-Reply-To: <20251116145302.3681-1-qq570070308@gmail.com>
References: <20251116145302.3681-1-qq570070308@gmail.com>
Date: Tue, 18 Nov 2025 09:13:17 -0700
Message-ID: <87ms4j5nfm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Xie Yuanbin <qq570070308@gmail.com> writes:

> Fixes a typo in the retbleed= parameter description, changing
> "migitation" to "mitigation".
>
> Fixes: 7fbf47c7ce50 ("x86/bugs: Add AMD retbleed= boot parameter")
>
> Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 7e8af24c410a..a857e42d1d48 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6420,7 +6420,7 @@
>  			that don't.
>  
>  			off          - no mitigation
> -			auto         - automatically select a migitation
> +			auto         - automatically select a mitigation
>  			auto,nosmt   - automatically select a mitigation,
>  				       disabling SMT if necessary for

Applied, thanks.

jon
