Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA1345CD0;
	Tue, 18 Nov 2025 11:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464892; cv=none; b=ef0P8uIWyECnc1n1fqbM3kO9oY2yNo4Jg5qVadvo1Gqz4D4Wut3ybOx3I9EPsBPgSG4vTPjXA3wzfaGeD+AoubbV1EDgvgybciFbiYQGHKriOcc356NQsZARM644nit51EGL1yoS5Xk6zUpxJ5tn2y5I+a+jbiBOHIM7oJPlrN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464892; c=relaxed/simple;
	bh=K2oH+Y8uP3O3ERPpr/3L5S1AwwdHwF8rrIvIa1TbqaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx9lV9Ud6G39dQvWYQZKUpcRDEKqE13muIFLhqvo6OTsaCBE3SAeZRy59UXvUPA1C1YiEPKZ4kSoVeFRkR0BaWKbCMjJyD2GnOis3YNPz+geL+KJKEPO3wRnl9z9Le/ZeljuBiK8ocHa022twn9mgQJlO8ZOnjXPCVa6NIabAKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XDW/E69f; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XDW/E69f"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5046D40E0191;
	Tue, 18 Nov 2025 11:21:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OrkFntO4-I-2; Tue, 18 Nov 2025 11:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763464880; bh=xXXwf2cz1r2PPDAKkTZrRiPEQU9MeGuM3VOUZQHCi1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDW/E69fe1VF1FUQ3/g3AdsWd2gVenwRFG/NJQHz+LY1GL246WeRbuSMJsWLVqXbu
	 ewl0vt8CmkviAoXMHGMKqjLRmUgrYBUKQNPJZXfNkIw7NwHD1rWYEL9wdFF5nTmsTl
	 Jg0/BE8VwrzQYn39b6ci+8v7ZEI4+nULN7sWJeA3ju5P9/f+sf5ZbkgLplQp5Jh5rD
	 ctFIwpoZJWZV4LkClp2S2tegPR1fq/+E6TARNi4BUv9QkwmoPkTgMo/6XBP7nfWTa9
	 O3V+RKEbCVc5OnhknOYRI9GXezw8tN8D4eu/v0aWEcITe+oXqa3ZFZ5bnvkXCgwAKW
	 7qpZpm1SVHktXBHhZB3Y0QPjGBdvzExU1vFwicAPSRfGk4Wpny0Lx7M19Qw221Ps/d
	 cVXWjHCyC66fHOGgWZwsWEzL13AnPmjfgNOYy1qrjXXValKGMmjlS5LMG8p78sep8X
	 Nni+RhJmLHqezonIfVBvJnyciB4m2UkpX84ngtx66bzhukypvQ9Jki/5qtsd68Tkza
	 DFNq3nPUETmeCJcwMlHk6QuwLLbEJv7rHhPLShxFoVxKZ+8Bfwnvth47AuDBqx+Vy9
	 sGKRjUr6fOSe1E6VkeiszDtt4HS+9q611uLcl8NY0b7L9729opXQXedXCFSblGa4zz
	 ADK775fyKCnNdzJqRnIR41no=
Received: from zn.tnic (pd9530da1.dip0.t-ipconnect.de [217.83.13.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4BCB940E0216;
	Tue, 18 Nov 2025 11:21:02 +0000 (UTC)
Date: Tue, 18 Nov 2025 12:20:56 +0100
From: Borislav Petkov <bp@alien8.de>
To: Xie Yuanbin <qq570070308@gmail.com>
Cc: corbet@lwn.net, akpm@linux-foundation.org, peterz@infradead.org,
	mingo@kernel.org, pmladek@suse.com, paulmck@kernel.org,
	pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
	kees@kernel.org, arnd@arndb.de, fvdl@google.com,
	lirongqing@baidu.com, bp@suse.de, jpoimboe@kernel.org,
	alexandre.chartre@oracle.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/kernel-parameters: fix typo in retbleed=
 kernel parameter description
Message-ID: <20251118112056.GCaRxWmNg4VUnZB_al@fat_crate.local>
References: <20251116145302.3681-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251116145302.3681-1-qq570070308@gmail.com>

On Sun, Nov 16, 2025 at 10:53:02PM +0800, Xie Yuanbin wrote:
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
>  				       the full mitigation (only on Zen1
> -- 

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
