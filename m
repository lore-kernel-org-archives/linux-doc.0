Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6CB3939D2;
	Thu, 30 Jul 2026 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440644; cv=none; b=NrIPTY0YC6yvWZCxl23v3sH6joehJ7KJreoJKRHw0cpOlV51+/cz13Owrxo6uytr0VyTIsxNmeE3pCZpim4sE+I5gZLN64lA2CVahNUxaoEdS4ZTgBvZhVDnXobZtzxD+1QQrMNuBVj2YmiuziQg1j0EY8EEtlwYQeRmnQyf8w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440644; c=relaxed/simple;
	bh=1kTM+nPiHkcHJ9W8Z0NESrMZBdmYibx137c7ZYxFc1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGugysMIWHWfZTPFAozLaGOJwkNURHiIpSh6KFJuJhQRg85TPSAD9cJy6pKPPcxYmw7K+ozEm/atwWoUi2c4LaAdjStNaNQqNwwoBP60Q1xEjh9fF8ieJryRyD/iKoPYzG6w67PBJiYyvQoPYDN39kchqfKZCTvL9awS9fIi6AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LG/Xbe0p; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LG/Xbe0p"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B011B40E01CE;
	Thu, 30 Jul 2026 19:43:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nWIAK5GOFC0d; Thu, 30 Jul 2026 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785440629; bh=bhMIIXtqKK/5EAGrShF0FxuZM0QUBuQRpZ3U9wPXXx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LG/Xbe0pToBQkPhJqZh0s11y4EuEJ1mMYQOh01iHS1sbQ6vjUbpMhMZq+z7v1JIl0
	 OoF7pakHxi0+bvqAGz2RPyKKffXorr0Nr9MakY0CbRyKkxj+6rnzpEG5PdJDpGOgIw
	 kNLIrWj4BVcn4wXAu+NCkq5J+WDNkar9UDIakyLOKRV+ksWut06XP+vKD0EcPxIRmL
	 rnlUOJBEIac0mm/iL9Rj8QJ6bSPlNqOx6JV/cTQnBWsoLi0eQzwVMYteC468yn/NkR
	 QBOAHs6IFuM0JjkW4BG2nxrLknglj/NzRpTlAjMgk1RG+jxkFQ72Ta8vn+iWvcnCz3
	 W+BWR7kcHh0ZPDpAQOsv61WmLsx6uar6dH7g1Cq3WhlrEGGHoDcquLlLC2e62c1eut
	 KxuiaY+xkijO8IawUluCQenADc2TD84eQUGzLlpf8liS8PnswYuZ99P3H3ohWjKI+s
	 OSKHYMGFdFYJbMHbTE4pGTFX+Cx03e4/k9JQKb01A3IpqQsYHcQaJQZH44b7xhAoZb
	 GjTe5LuiEb8nVTqxCJAj52SX5+8iUQktRUg+KOlOtP7iHZCvd+kFjH3wPGldaBGplO
	 SvB0bEZ4GiKo2upwsZB3bXAbl6RIRA3BozMReBImBUr+4js6RhZp3jq0LX5wbuv6UN
	 7U89lM0FV6Z9FbZsuatvy544=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E325340E014C;
	Thu, 30 Jul 2026 19:43:31 +0000 (UTC)
Date: Thu, 30 Jul 2026 12:43:28 -0700
From: Borislav Petkov <bp@alien8.de>
To: Babu Moger <babu.moger@amd.com>
Cc: "Moger, Babu" <bmoger@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	"Luck, Tony" <tony.luck@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Message-ID: <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
References: <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>

On Thu, Jul 30, 2026 at 02:39:40PM -0500, Babu Moger wrote:
> Therefore, creating more than 64 monitoring groups in the default
> measurement mode can lead to inaccurate measurement results.

I have this there now:

In either case, creating more monitoring groups than available counters can
lead to innacuracies during measurement.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
