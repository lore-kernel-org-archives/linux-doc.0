Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36E3FD943;
	Tue,  4 Aug 2026 22:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785883660; cv=none; b=c1ziPEc9IuZ6P1Gj4kZC7p6O9bXPpo1orL8obuQbbftoKAsWtncXCiylIRHnLAwk13DAQjQeWBjnfrUNLX3G/O/bhTS2YgUrUCk6g28OjMkPSuowDsPajIzCFgGJBwSv0/SQfA539IVk82qpzWjJUuk4CR+yXMqDLia+ICSYYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785883660; c=relaxed/simple;
	bh=BW1bAA3/bdSPI2Ym1hMsYM39BPwfMNHTI1UfEO9U094=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDyahIoIq8aLzAwejArzy5Q9ti8f5+xrAgEwKnL8w94hAvK5TlCsUyvq9CxcwGsdI5DrsUJBhg1QAewzW22UXhbm/TnLDaEEtbAFNFA/3GzZa1pYz2tLuFtXsyjYaMzUlGOtskFakej2q6NER2Wf0lO9DdKmNoin1Nkg/x4a5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gXUeEPZP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gXUeEPZP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 17CEF40E00B8;
	Tue,  4 Aug 2026 22:47:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fJh3SBRnbiI4; Tue,  4 Aug 2026 22:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785883645; bh=eE/CoqtMwzrh+tYxIqzG+DXSKCBFkSO1UOv094Xej1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXUeEPZPOqqT8hwUfoBm1URYvg+DqtnV0qndhNIYbaPZv9kDk0TmCMkEVEqX+Pap0
	 ppZpmkDDbVoRSmlBe56lr7V3DWZ8TK1d5UVqYXWR4HobUi/o0YscruxqJHofUjE/hU
	 dWqXG1xWJdPGoL3fhwpcQdUXHF6cyiv/3+fw+VM6ZGb2Y7eMveIfflzDjIs3uHHVq7
	 nOnyQDVpqjctOljG1RgL53izQlC/iktxdMlvVgmUmOX3VSPp+TbiqLvOuBT2bC3CC+
	 416EWhvmmdopXrL42h4QLk6G8EWx0FqRW/iqGT9Ehufc2Xa5P6QRxFqaMJVzPulhrc
	 YXitYnSwD9h+x4o3oZwscCODibLjAGu+cehTaf+lmFNiYbSgLG5IGPO+UenMtftw0F
	 F8dKbQTEsAtPz56SmYGJHJGmqtnQTiwb1CwIBwjoWocUMX/ikM8KXaqhJ0A2FZa/C/
	 AIkStp9b2ni08o2MKK/SkUvcqJilNyZWkfj3ezVJzyqRfhv1t7frgUgSkQndFVFM3U
	 FjrVBNIcL9KUNrEgFVyuPAsKYIdSmzaxJbfDDwwefk9iUVaV9Qs03H88PpXY497Ha7
	 JLHdgDCB5g364gaDOnWmGYeKwNc8Ic5x/4adpZ5KN4LF3q+H49TEXhVDMionFYWWzn
	 9vL/v1GzMnDbPaS6bEFybMCM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 52CF340E00C3;
	Tue,  4 Aug 2026 22:47:07 +0000 (UTC)
Date: Tue, 4 Aug 2026 15:47:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>, "Luck, Tony" <tony.luck@intel.com>,
	"Moger, Babu" <bmoger@amd.com>, "x86@kernel.org" <x86@kernel.org>,
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
Message-ID: <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
References: <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>

On Tue, Aug 04, 2026 at 03:10:18PM -0700, Reinette Chatre wrote:
> > So, long story short - and I appreciate the explaining - we should switch
> > AMD's default behavior back to RMID + 64 counters - exactly like it is on
> > Intel - and the ABMC thing will be explicitly selectable by the user.
> 
> nit: s/exactly like it is on Intel//

What does that mean?

What's the difference between Intel's RMID mode + 64 counters and AMD's?

> 
> ok. 
> 
> > This way there are no surprises when running any tools on either vendor and if
> > one wants something special, one selects it.
> This patch, once minimized for easier backporting and marked for stable, would
> accomplish this.  
> 
> Two nitpicks:
> * "no surprises" should be "no surprises (as long as AMD hardware does not return
>   "Unavailable")".

AFAIK, Babu was unable to reproduce that.

>    There is the known issue with the default mode on AMD where return of "Unavailable"
>    is treated as wraparound by pqos.

I guess Babu can address that.

> * "one wants something special" should be "one wants accurate data".
>    Caveat: User does not know how inaccurate data is in default mode. Users need to learn
>    about existence of accurate data from outside resctrl via external sources, possibly
>    leaving it up to the tools considered here.

With my simple thinking, I would expect that accurate data means, the number
of counters being in use is not hitting the arch limit. The moment that
happens, I guess one could deem that measurement innacurate.

> What is the plan with https://github.com/intel/intel-cmt-cat/issues/311 ?

I guess that should be closed once we switch back the default.

> sidenote:
> Separate from this I again would like to propose that AMD work with pqos folks on
> how pqos should handle the various text return values to fix the wraparound
> issue.

Agreed.

> For example, is the preference for counting to stall at a number until the
> hardware reports data again (so that user space always just sees numbers and not
> be surprised by text) or should the text value (for example "Unavailable") be passed
> on to user space or ...? The current wraparound issue should be fixed but it is
> difficult for me to gauge what solution users would find least surprising. My
> expectations from users do seem to be on the high side.

I'd go for "the least surprises possible" approach here. But I'd let Babu
comment here about the specifics.

Thx!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
