Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71B2D063E;
	Wed, 19 Nov 2025 21:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763589067; cv=none; b=oWW6ZfHgceKSVUeFhYVJv9xTx0VNnBclqPqHboc80ItMiPl0XNAMvWAiHXS9DWUvoNhzTNO9Rukr1M2zswghk/KYXW2k05P9j2q8mqlmXrBACCbGWtt4yBUjZMzHOOYeA4ch50DAQKQNkdZvA1wHowF4ZW0r0An59laPx/Uve70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763589067; c=relaxed/simple;
	bh=pZqbtM+xgi2ZqwLmrVts/Vzyip2jIuirSs6PlkTjmVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejY0Dwl8D8kzpanFV6THo8bog9Kpa6p1WhJ5OQWUAFQ9/bJiOevrCyEOYGcOskhgBsGRS3s8y58MMG4hHdnhgNXUxxclTcoIOOdPVrP32mXAiHoM1xAgmzndJ0uDUP2EqgmSoEOOUZI9YWtGsfoDs0C7OdXhjqojmjZsc+JYFwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UVXqmPIa; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UVXqmPIa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AC7A040E0256;
	Wed, 19 Nov 2025 21:50:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gMiCKvr7PnGI; Wed, 19 Nov 2025 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763589053; bh=+P1HEUF8JFMDSx2z35oAXeCTjsrrYdtCyXOb4Cxw9II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVXqmPIa4ikT0WkKiXY9TvtJgZRkhea/lardnYtvMEFSB4GtLkdznnfGxdRI31B9o
	 8QsduoUy5akBus32OB1AH0k2jOS4SsgV/gCKm36tpuBAu98Kp9tb25ntf2fdwxQz9e
	 /0z6qPqLH31SS1ICj9XAGsGq2EHSwWV3qq3K9GAau/N5hMULljM+NDfUfIpc0Y8pqo
	 qKuhysloizmHpvh9kT33PQKcesS/ijZESzpURIfUP4NULRAt2cvznZ6nF0mTeccEa9
	 nubIBGSIkvGY2rJQuleGjaUjVsdBLQqNS8+dZwId0W8M0OBmSntIyp3RCBeRI2AIgq
	 8dMceyRQ7gErg1U5OzhMDrUjwmciSoUxOHkAddZHVsYGfuZ5Pu1tBlap8Mp3NrtWaQ
	 HtqydH4gXS+sNAmjh5q0EO01Z4m3yQbw6EdhIbS0gdhGEWPhZXOoBnLVbJ7iWHvx/q
	 0av9vELS0a//E+3VLuIndHfyf8oLgf/ArWLfKRQHpLGHZ1lqXcjH3tiT8uSbGfKX2y
	 5JQv+4pu9AETRzBRitwQZsSiNoINGJsQji9Xo10xqZQKo4gXu0E965rOEmYpmNfPtg
	 zegYW0uCLWWoAMjfw7JYu3e/kMbpXmIt6NX6hUUU4puAlbI9Xn6Z+r3yQ+DLDhLLMQ
	 ery7FrLPm3O0keT1ALYqiBeI=
Received: from zn.tnic (pd9530da1.dip0.t-ipconnect.de [217.83.13.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id F1EEB40E015B;
	Wed, 19 Nov 2025 21:50:44 +0000 (UTC)
Date: Wed, 19 Nov 2025 22:50:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: Daniel Tang <danielzgtg.opensource@gmail.com>
Cc: linux-doc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH] Documentation/protection-keys: Mark as available on AMD
Message-ID: <20251119215038.GHaR47rlpLKZlu-m0y@fat_crate.local>
References: <3647894.L58v44csPz@daniel-desktop3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3647894.L58v44csPz@daniel-desktop3>

On Wed, Nov 19, 2025 at 09:01:30AM -0500, Daniel Tang wrote:
> According to https://www.phoronix.com/news/AMD-PRM-PCID-PKEY .

Please don't quote some webpage but dig out the processor programming
references and find the OSPKE bit:

https://www.amd.com/en/search/documentation/hub.html#sortCriteria=%40amd_release_date%20descending&f-amd_document_type=Programmer%20References

Hint: document numbers 55898 for Zen3 and 56176 for Zen2 and you can compare
which one adds the bit, and then say which document that is.

No need to add the link to it - people can then find the document by
themselves because those vendor URLs are not stable either.  :-\

> Tested on a 5900X via the program in pkeys(7) and
> `grep ospke /proc/cpuinfo`.

<-- You need to add your Signed-off-by: here.

You can check out:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> ---
>  Documentation/core-api/protection-keys.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/protection-keys.rst b/Documentation/core-api/protection-keys.rst
> index 7eb7c6023e09..59e7c178af4b 100644
> --- a/Documentation/core-api/protection-keys.rst
> +++ b/Documentation/core-api/protection-keys.rst
> @@ -11,7 +11,7 @@ application changes protection domains.
>  Pkeys Userspace (PKU) is a feature which can be found on:
>          * Intel server CPUs, Skylake and later
>          * Intel client CPUs, Tiger Lake (11th Gen Core) and later
> -        * Future AMD CPUs
> +        * AMD Zen 3 and later
>          * arm64 CPUs implementing the Permission Overlay Extension (FEAT_S1POE)
>  
>  x86_64

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
