Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D0361656;
	Wed,  5 Aug 2026 00:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785889333; cv=none; b=IDNpGDiyCwvWuOmarqZKvIclevb8D8wIvkJ12p+6OFafq7LXrd7NyeSAKKicVXJ1PfFnnCOiuTDDQ+2WI1RZgraRoODzz239u1NRo3kij8WBU5F8SaDrh6YsOPQmFw09TDoUMAf6gFayPsI8rrMpCAAwUdYZ2EGSPY+nfqrt9FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785889333; c=relaxed/simple;
	bh=QFTLvXeTcMs5/AGfg7+CMECeegde3iRx4/ybF0OsHPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQEISEyBDDoX15mw6Yy+3Z3c2gJZGxXZI8eypb6uTytVQ68bQvq44huwkUWK5JFRpWbUYwMDeGBRtbaeh4y7+C6md3OYAIonMUySudjU6GzjE8zdSdY7sHd1ncKXTH+2v+f/kTSxosksxU5FgapfAklfkuK8XU+EkeuAgTp1E0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eV6wHyx1; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eV6wHyx1"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2BCD040E014A;
	Wed,  5 Aug 2026 00:22:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dixRh73Opure; Wed,  5 Aug 2026 00:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785889319; bh=0Rtb4RXDI8WoYfEgRQzhqCXskdcss2/7k113ehDu/rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eV6wHyx1UAQ8tJfBphVOty8iYDpRYDOc5ibSgf74mkiLqbwbd3CveIlDy7SI5kgRO
	 swUJ4fYqqy6dgX3VBHqI5hEDU1yO17R4R44qmsx2yyVPD1UtqfkNuVaAR7ZQJZYAcu
	 BujDwfboKFGb0M73ZeU8YU3xyXHxW9b0UqzT9aBhyzPM20Ckap4yPCQRAuNQg8m0U0
	 QGbmdc3jJ9iae4Sr9flI8JZTBQ743iFBrafxJ5RJYn9M1P5mHvDEr/OZuiqE5rv3fu
	 3HwE1BVE3hURUdKrgZBOMJuEnMqsMVQpKYeEgtCJUArFght0ME8XQe57BdjoRcqqpN
	 3C8A+sF89C75uhEtzCITkVZiM+JvUREBAvkngrZi1VPpISS2C4QhPu/unaR02cW2ed
	 V8Q4o3uq2cVJ1ymxt6bW3vwx2fl0L4jMAX/Y4HFPxJwmRZec2y5DL83IyLJmVUtgkX
	 otNTVN8M94V4BbQfbm8qIohqj0ZW1gyJnfse3RuutxK/LJVioUe5gLGmihvoENR09k
	 H0jKBj75PvL1e8Ci8irn5Ck1ezE8P5efmG9WAc7wkk0E4WJPiUK8V0vjRUonUElPAa
	 9nDboU3txe9Dke0MzVVAEc4NYH/W1ZZ8SdO4KBNtP65kKjtEd5Wd1RJBdEQIWsKveZ
	 AHzNHp2b3fkEqANDS1Kks9vE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8B9BF40E00B8;
	Wed,  5 Aug 2026 00:21:41 +0000 (UTC)
Date: Tue, 4 Aug 2026 17:21:38 -0700
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
Message-ID: <20260805002138.GHanKCEmyMcvK8Xg4w@fat_crate.local>
References: <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <SJ1PR11MB6083C1B9D29DF6184B50597BFCD42@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260804234048.GGanJ4gFClcqwTHHDJ@fat_crate.local>
 <SJ1PR11MB6083DBB0D7FF2B466F9CA808FCD32@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083DBB0D7FF2B466F9CA808FCD32@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Wed, Aug 05, 2026 at 12:02:35AM +0000, Luck, Tony wrote:
> If AET has less, then resctrl drags the limit down to make sure everything
> that the user sees in the resctrl file system will work.

So this "dragging down" would prevent counter exhaustion. That could be one
way to do it, hohumm.

> You are all the way there :-)

Thanks! :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
