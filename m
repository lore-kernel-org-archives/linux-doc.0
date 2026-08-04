Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D673AE18C;
	Tue,  4 Aug 2026 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886884; cv=none; b=OCbpz/LPABCY3oOFhs+Y8BG+I9O18DQGbj410QMOnE0uvWUbpMCu/vQKbdueeSEEkvZwEL3ao6rvsybsfH+oDtynlBOjoVD6oG7LdSrrfKdQtGtd3U1DcYlNUq3d3Dy0h8F65gQFR8KC6hwA3sXOlmlz62Etgs31JVbDgWJbJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886884; c=relaxed/simple;
	bh=BkDaZCWbSk/329AoK6n704eToLRHqZIRlCPrkwTRRQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ju0eJ08UiI+KBn/JZCmj4SlC1qNRHrcB0QqoWdBaQMVCgWvCZMDC25MXlFukiM+R1OQ4gamXtLCpu6hPJAs21BAcai+X7+kgkbvfmsZBp2/jqGuVAUEdn/++kkw28+ShQpcdFhgBELvP3r3tS53qWh1584rXDkirbKAXfNvjnTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=F+GrqBL/; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="F+GrqBL/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0647240E014A;
	Tue,  4 Aug 2026 23:41:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id V7_SJc6WDtxQ; Tue,  4 Aug 2026 23:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785886869; bh=707JwGDc6Mj8NkuW1jOL3JPs5A2QsQSLVK8M281cHtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+GrqBL/t8tDXD8KYo66aoIsjQIchRRN+r4/f2hkxu8HIJXEhBwXPeUO5D0R2a2/0
	 2o8KhLLw5jSP53MzHhZtQ8ZLOqVpA11BSqDBF0khAcW3jKIfcLHjgeE5Nz7TSU5WOW
	 HpixDwhaXiZAk9xOAvE4H4iI9NpR+GNW3ky6H4lZEfxfu4Gf042kznjHbOnF//Totv
	 0ZuZF/gRNg5g0pgvH+dmEilHu8Ip2CSKdCeC8XLfLnbNZeOc8uAHLuNtgZMCSHYhLp
	 4vUabVuKPPyhmEmVZ+sunBC+gPdlA3ujZQ2QiatKEMol9DpSmS2yO8Ri55qXi0/Pig
	 sIW6tw1pWhthDMjfv1T2msCTTghpvOYf3xg1rqXCu7ymekl00Sb7T83nluUoVzhU2B
	 YAzFNZjY1ebSdHqlhcX8jic7HPnjdXMT6+qg/lMcOW+BujztVe9WR30dEf/EFMuope
	 0cq0P3b25Fw1jouPX7juGUQHXwhHPXO3YjHrEb+GRKMaVxOKVPlCfkPHeKYHQvdh3X
	 lgOqEvRbObZTu/w9+RYEENPEieD/U57YcfKouY1NXcnwNPBy+Zshrj5KIbk6WfhTfS
	 VZoIv1d3ps8thZr5H5heWXLdA3Rg4sCv+YMSv1n6X+x6EqFGb131lER/ku4qOVLkUS
	 xbiCPmAqI11Tz06+4AWNwM3A=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9870940E00B8;
	Tue,  4 Aug 2026 23:40:51 +0000 (UTC)
Date: Tue, 4 Aug 2026 16:40:48 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
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
Message-ID: <20260804234048.GGanJ4gFClcqwTHHDJ@fat_crate.local>
References: <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <SJ1PR11MB6083C1B9D29DF6184B50597BFCD42@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083C1B9D29DF6184B50597BFCD42@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Tue, Aug 04, 2026 at 11:05:48PM +0000, Luck, Tony wrote:
> Intel systems have counters backing up every RMID. So CPUD leaf 0xF tells
> Linux how many can be used.

Are you saying that there is not an Intel system out there which has less
counters than RMIDs? If so, that would explain why the exhaustion happens on
AMD only.

/me goes and looks at the SDM:

So there's leaf 0 there:

EBX[31:0]	MAX_RMID	Maximum range (zero-based) of RMID within this
physical processor of all types.

I'm assuming that means you have so many RMIDs and all of them are backed by
counters.

And if we look at one example if Emerald Rapids:

CPUID 0000000F: 00000000-0000007F-00000000-00000002 [SL 00]
CPUID 0000000F: 00000008-00008000-0000007F-00000007 [SL 01]

https://instlatx64.github.io/InstLatx64/GenuineIntel/GenuineIntel00C06F2_EmeraldRapids_02_CPUID.txt

That 0x7f there means 128 counters for 128 RMIDs so there cannot be any
exhaustion.

Am I close?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
