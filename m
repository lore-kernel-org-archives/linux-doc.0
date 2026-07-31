Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CB54785;
	Fri, 31 Jul 2026 00:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458112; cv=none; b=ORGVNjdnBIeHYH52UCdwpezP4N5EVg1wv/uVzB8FPw3HbxTSnt75hVhbnjqWH8F0RGroijpJ0j2nYvOciWSmU1uLnmJj18w/enm/DI0/yH6EALOYGEeHRuNxj34hW5lAYUxN9e2OVXOYtlVhHcw5Qu11I+ZLfEIcf9NTSEci3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458112; c=relaxed/simple;
	bh=inuGPdZPLZ4fyP1BHeQRfSLb1/IiFaWH5ttB4pCyiFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIa2B/lUudZP3PizqrAO7fWyE+GTsZavabnGX3EO9aM4L34QlqgU7z0FAJIPCHKtWiwQyReixRMaFfv5igY1/lslrwnXee5TZGOjiMJZnhqV9mZNoO+SqyWjdo5tfI0PhbPQe2ZYxi5Mdj7nNRBiW7mIltGn8zX62Di9TvrMTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hX4Niu7Z; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hX4Niu7Z"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4387C40E014C;
	Fri, 31 Jul 2026 00:35:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X0HGNYjL1YT2; Fri, 31 Jul 2026 00:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785458098; bh=PYjdPhFEIdpY2sm91QGHQ/ObKqBlDqSibPerHY2MApk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hX4Niu7Zi9i+PktucJFG8khAaobz9OzFhFQz1Ek8JSKpY6O9mvDA1jSeKcx2O/M3F
	 Ob79DMaJD2QzXtBj0qvjG7ebrapqiJHcIxGKrncWUfesUOz2o4YIqo0394hYZxT1um
	 L2d12X4vVB6p1nBBFMgUdNRwa+ePsGMd3GHKT0lx6XTnGwtW79PLjaxjkDZ6UcsVgz
	 E7k90qFcFQeR0vcfXxISNcIaUWs6WIv8Wyxllh883xedMzV+PjGOcPewnMTWc1bpLF
	 df4iQQly6m6IZnf3mICP8rxDr11zGPFdP2RCdU76RcEzxuqaAJ8kgcAxjDz1nrtzGC
	 HlXq328zGQCTDQpTEGnYjuh62pH7N8tuWuDsLDzFiVcJkatdSk5gP7pIxmxgv+jPAg
	 7cS8Mbch9Q0KgAMkdmIQp/ycyuQwoIDz8c6sSMvngRt5O+XQePXSc30D82arw9tLXX
	 tv2KF073p07XPIbI/HEan7AnhNQ0QokeI2Wi3y+/M/E1hJHJdfXmkWaa6yBX8SgMVd
	 TyV8TQwVd3FMBcwhWVErDHbh2AIirF6XjhCoSfBHLisef/rDQlsEIICWk9wWUI57R4
	 yVmKva5hDC8p6g6Gw2JSvKLZoB9buOesAsuNdyKxD3ym6ls5ovL/Ay1Ie3ZXQg1+sO
	 AlgWMwe+wH3x+Su3Dv2mkupk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A5D2940E0140;
	Fri, 31 Jul 2026 00:34:40 +0000 (UTC)
Date: Thu, 30 Jul 2026 17:34:36 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	"Chatre, Reinette" <reinette.chatre@intel.com>,
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
Message-ID: <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
References: <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Thu, Jul 30, 2026 at 08:40:29PM +0000, Luck, Tony wrote:
> > In either case, creating more monitoring groups than available counters can
> > lead to innacuracies during measurement.
> 
> Is that magic "64" enumerated anywhere? Or are users expected to just know it somehow (or find out
> the hard way when they get odd results when using more than 64 RMIDs).

How is this done on Intel?

How does the resctrl code handle counter exhaustion?

Do tools get some -E<error> thing in that last command status?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
