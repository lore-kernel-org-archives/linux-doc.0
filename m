Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FBB2E0938;
	Fri, 21 Nov 2025 17:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746102; cv=none; b=muHYQrgkm1nMAAVT3rpaesZagpioa1S7pDRPFqQCmStWONRWE793XZ5JDS4dmKIIuJzeiuS0yneQJMUfsjyy8CYSMOAaA/gecP99k04UL5qQwoe2M9ua8/OqyL9obcKF+tTRSRr9oD1PFDT+pukhDHPwXWvICsSQmUkb1hQBLys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746102; c=relaxed/simple;
	bh=BfOnXDkWvVSwtZ3vsdvtrbFxauofmrfbJRK+gsLxcmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LppRb0Yy41nvLvLCAY/BL0qWgAOLQr1vNeVQIpD04FKyTWJ3fwj1EjfgdEsys7/z1uGCEGAWg9xIueDS6LBAumMl4d8/OVNsJZWB8QLw9oWUgU+jiSf/7fpigkbzuJnVMjnoYpAUBFh+Ykylv3GI1JUDpNHAbJNYiabn0UJjrdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gL6GNxEh; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gL6GNxEh"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A0CD340E01A5;
	Fri, 21 Nov 2025 17:28:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8uxNFsdJbFk3; Fri, 21 Nov 2025 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763746086; bh=9DfeOlXoUBhAtEmTPyvzuLILDnp6ey90cftOwz+aOBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gL6GNxEhkmWwOxSNsUfG3tazRZnd8VMEK666e7wbxVp41VSSqD2c8nPGH/+Y+OjVG
	 kIDJfGrI/RbBmeWPI1LZmHZFm2BXKaIFvQ2FVhaz2hS9yFrmpm4hdot7RI7oYnTAoQ
	 xDVGAgJOeQc+Az2Q8DJSPCYt9V+iNL4VwwYwLJanwqQFTpwXt9cfYV6A2OiKK/Y88c
	 e4RkUwDV0PXMFzbl92cgexPaO9gSg5HpEcmqqtj+qT4x0s3YhqPyF5u/M9D44D5ZRh
	 reOQ6Tn8xkWi3jVpYNaj9t99yjEinQ1QtbtMJmwkmZpn/Q+ShYgcqyO7N1lD1Ie0JH
	 L3ZDOA7WjjyXyLcTV5/Y1baioNjpRGU7KxrvG2WSxn4N2K92Db3EN6ijJyRtO2c6V2
	 FLa5k0WOi4/YCizv9sbkxNairSyKX77iDd3d8mzoR5k5lEnHdncLeNXljSlkDhFKud
	 bV/TsLu2FhmfqrHem/cPUbSLufWa3qg+sLHTIZXrPm90Si7bxafnyyMDJUw/4t7uy2
	 vVJexW4mBn1FPT2rkwgca1unXuF1rPJse1an0zPdZSJm2RVPWNuoTNdmC2FF2+3gds
	 47HR5pAa6+NpwgDcG5aSkkfSq/tLfQk+gUzHDFytfgg5L7dCJpTn9Z+UmPHCvC/geh
	 etEcfHGCNciyaRyesoRZglOc=
Received: from zn.tnic (pd9530da1.dip0.t-ipconnect.de [217.83.13.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id C07CC40E0216;
	Fri, 21 Nov 2025 17:27:31 +0000 (UTC)
Date: Fri, 21 Nov 2025 18:27:23 +0100
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>, tony.luck@intel.com,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, corbet@lwn.net, Dave.Martin@arm.com,
	james.morse@arm.com, hpa@zytor.com, akpm@linux-foundation.org,
	paulmck@kernel.org, rdunlap@infradead.org, pmladek@suse.com,
	kees@kernel.org, arnd@arndb.de, fvdl@google.com, seanjc@google.com,
	pawan.kumar.gupta@linux.intel.com, xin@zytor.com,
	thomas.lendacky@amd.com, sohil.mehta@intel.com, jarkko@kernel.org,
	chang.seok.bae@intel.com, ebiggers@google.com,
	elena.reshetova@intel.com, ak@linux.intel.com,
	mario.limonciello@amd.com, perry.yuan@amd.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, feng.tang@linux.alibaba.com
Subject: Re: [PATCH v12 00/10] x86,fs/resctrl: Support L3 Smart Data Cache
 Injection Allocation Enforcement (SDCIAE)
Message-ID: <20251121172723.GBaSCg-0l6MJM4QuRG@fat_crate.local>
References: <cover.1762995456.git.babu.moger@amd.com>
 <3fddbb5b-a6ac-4465-afc0-6365225ba2bb@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3fddbb5b-a6ac-4465-afc0-6365225ba2bb@intel.com>

On Fri, Nov 21, 2025 at 08:05:36AM -0800, Reinette Chatre wrote:
> Dear x86 maintainers,
> 
> Could you please consider this series for inclusion when you find is most appropriate?

Lemme take a look.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
