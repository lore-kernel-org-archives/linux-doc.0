Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E843A6B9D;
	Thu, 30 Jul 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437232; cv=none; b=fW5JL8Z5WAFRQre6l6brlwVzKEkWkCzP3ritjiQZxLsyAjCiNP3ZDSdI3wbaSiKINSh6fxbMnGXMV4jqkFGG03nxL8S+MZtFlB5YKRByHH06S5zR9STzvcZOaPL29UazK4CoYEc8ZerLMSCEbe4rcwAAlPFYVRLjDMCetzQdsp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437232; c=relaxed/simple;
	bh=bWdKari0Pcw2DqHMvZzESS4U6J/a755yrmnqx7Zjapo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZbd+vLFpNwI0Bi0HtXUxlkkbVMNI/eXTaWeq9LwzvJJRCHW1OTDttNkX2UJ/wJRbCwdpeg5YWj8IGCwAn1KP++POqG84DP+5Ji+1GJMwSofI8GdLHXbk+rw0Qa56KpWzX6kvoCDNJ5SXvntr4r38lEXTtHm72QbboecdRuA2MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=T9STg5AJ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="T9STg5AJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3B12740E02B7;
	Thu, 30 Jul 2026 18:46:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kqluVPcVCVQu; Thu, 30 Jul 2026 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785437205; bh=WEr9iSfoEiohJm8szSQQdXCzTcrKMvjLdCjdjhOMDTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9STg5AJi3tYE9i8KhxeaBj38LbvgitmcK4D5xw9qhIEDM3dLD+PgmsvQY3JOYo5k
	 95ZRPi4dwz57vgEVICAp7uIa62/xnylRtRD5yxUSJGGvXeFD+XjY0eRKuOW2PK4UXf
	 7X+VzLjWJFtk/yGi/+/GBoNja40h4197FLLtrHJyukYP7N9poJBTOHsP5QlaL/7MbJ
	 ruu9N+jtJ9ziGBaOA7VE+y93/TmFq+qJ1LBnogY1OblgpfFC6/MXIHrkZFUazNPG/B
	 HqZUXZV+kMw2RIhJTtGz4lIsba554qt2AS1jWSBVtad9cjsGM3bIXDV2WprLPAo94f
	 Jxqf46GeYzc/BQYmX9CURSjKx2J/bCY4W0H6hvsMZrSwyKj+t3JUchJYxqgp7XcxIK
	 8jJHTh/PdWM+qa1iV1wGObpLaBuPIXQIQLTjP5Jx5ElmfwhOgDIvEgKUhzjGHxFQAw
	 w78LfflHAPsTPZ60OiAva5ub4j/B7Wi41Aqe46yC5Uk2uzGQ+2kuZCfA8z6y5EIr8R
	 C2HkHh6B3RuFcKvxjt23TpSfRpJxoobU5bmmmUlAFQbp0ux+mnukc30DLxG2kq1AKJ
	 u+7k5/Yg+lWXnAjNPjPFkJ0kLRD3LG1tOFrF9Iwgyf4IAexNXKdhwllo8qMIy+Rru1
	 sDLYfa397yDlHEphOOjjkPa8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 189A540E014C;
	Thu, 30 Jul 2026 18:46:28 +0000 (UTC)
Date: Thu, 30 Jul 2026 11:46:26 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Moger, Babu" <bmoger@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	"Luck, Tony" <tony.luck@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>,
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
Message-ID: <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 05:20:54PM -0500, Moger, Babu wrote:
> Hi Reinette,
>=20
> On 7/28/2026 4:58 PM, Reinette Chatre wrote:
> > Hi Babu,
> >=20
> > On 7/28/26 1:43 PM, Babu Moger wrote:
> > > Hi Tony,
> > >=20
> > > On 7/28/26 15:24, Luck, Tony wrote:
> > > > > > 1) Does it start over from zero?
> > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0 Seems a sane option.
> > > > > > 2) Or does the monitor group see whatever the counter was at
> > > > > > when being used by some other group?
> > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0 Seems less sane.
> > > > >=20
> > > > > As per this code, it should start over from 0.
> > > > >=20
> > > > >  =C2=A0=C2=A0 } else if (ret =3D=3D -EINVAL) {
> > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am =3D get_arch_mbm_state(hw_dom,=
 rmid, eventid);
> > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (am)
> > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 am->prev_msr =3D 0;
> > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > Nope. If you want the value reported to the user to start over fr=
om zero,
> > > > then prev_msr should be set to the current value of the counter. =
That
> > > > would make the next read start from zero.
> > > >=20
> > > When an RMID is reallocated, the hardware detects the state
> > > transition and the first read returns "Unavailable". At that point,
> > > the counter is reset and begins counting again from 0. This is the
> > > expected behavior on AMD systems. Therefore, setting prev_msr to 0
> > > is the correct behavior.
> >=20
> > I believe Tony was curious how this looks from the user's perspective=
.
> >=20
> > > From what I understand it is neither of the presented options but i=
nstead:
> >=20
> > 3) Internal cache of hardware counter (prev_msr) is reset when resctr=
l discovers
> >     that the underlying counter has been re-assigned.
> >     There is a separate software maintained cumulative count to which=
 the
> >     hardware counter value is added as the event is tracked. This cum=
ulative
> >     count is the value returned to the user.
> >     The user thus always sees that the event count increase and it is
> >     guaranteed to only increase based on a portion of memory bandwidt=
h
> >     consumed by the RMID/event being tracked.
> >     The returned (cumulative) count will not be accurate if the under=
lying
> >     counter was re-assigned. The user does not have insight into how =
long the
> >     underlying counter(s) was assigned to the event being counted.
>=20
> Agreed. When this happens, the counters will not be accurate.

So, to summarize the situation so far (and all y'all, I'd like you to ple=
ase
only reply to the questions I'm asking. Babu, please do not try to summar=
ize
it for me - that's what I'm trying to do now.)

So:

Background
----------

On AMD, ABMC (Assignable Bandwidth Monitoring Counters) mode is enabled b=
y
default on machines that support it. Some systems can have 32 or less
counters.

The old default measurement mode uses RMIDs (4096 available in total) and=
 the
hardware can track 64 RMIDs concurrently.

Problem
-------

In some cases, all ABMC counters can be consumed, leading to counter
exhaustion and tools like pqos reporting zero bandwidth for the groups
suffering exhaustion. It is important to note that in ABMC mode, two coun=
ters
per monitor group are used: one for local MBM and one for total MBM.

In contrast to the old default option, the ABMC option which is the defau=
lt
now, is only half the counters so the exhaustion can happen faster/easier=
 now.

Is that an accurate initial summary so far?

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
