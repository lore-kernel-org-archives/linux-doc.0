Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E136C0D2;
	Fri, 29 May 2026 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780071162; cv=none; b=GPe5RsOkw84ACjl1Cd1xBw2p0aAdjetWROnmUfAS3mNLlbumQB0Y/zFUIGCFyu0DRf/mr9AO+SlKlHXTf4ysTrkyU+W31hmFrq0cFQ4r3QWBZrXBSvR6q1rr858FosSnshlVVrv5DQqR9svddjgmbylMDKo7j/bEgN2Lsyznnzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780071162; c=relaxed/simple;
	bh=z+Lc5O2J/Ac6/dHKEA695nu+O+xYv0X3WMs8TMgvC3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdawVPf3X7GRzEOAVHdrwZJEAZPkBJWrh88X/18nStF2GGc5/088hi7PI5In+0hnVOdFbhwZ2sE6AylE2xzUDr1pUT1dk8kwGW+eTJeKVKmEXnlRFU4NMk1HUzEr4m2BiXrxdl64tfUuVD06gaYQqJGGvMh/gp85AexjwSYqGU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZhDZqfF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZhDZqfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780071160; x=1811607160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z+Lc5O2J/Ac6/dHKEA695nu+O+xYv0X3WMs8TMgvC3k=;
  b=RZhDZqfFHx2QwTMB6UBrxZcQy1F+ZN6x/haziIvO/NcQlzIPws/H+SCU
   C6CKAPZAJjpNnpBuWtg8yJiIb9hZdqmyNiefz6ocUikpLKrFkU/y5uMM5
   ROIPPdtBBsuuglBL4hVJKjcZCXiGdKzk5ferHxi5vbs6Mkdw/HZSNwZsL
   yQRambXzQ8pcrYzYMbYNbYNfvj2t8pyixwaJtTFc5MFPZc53agbzD/LTn
   Vsmw40IizuKpj47qtOTrhqH7A1s15I8/TJoBCCoMOaGXQsZuCjky51f1b
   sI4PuWt62PTC1BcBlLEtKyQdT8wrl27v3T8gU0YGbxx6j+KLvfOD1S70W
   A==;
X-CSE-ConnectionGUID: GuZIb9PTQZOZNmb0L/731A==
X-CSE-MsgGUID: 9NBqBjTdQQ6Fms6iz1jcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81109922"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="81109922"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 09:12:40 -0700
X-CSE-ConnectionGUID: GK8Gs3P/T/SpmXXC8gqm6Q==
X-CSE-MsgGUID: rgRSwxWJSoSsaQsCrv5UAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247984125"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 09:12:37 -0700
Date: Fri, 29 May 2026 18:12:35 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?utf-8?B?5Y2gd2Vp?= <zhanwei919@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/xe/hwmon: document DG2 fan speed reporting quirk
Message-ID: <ahm680G_8mf_cjG9@black.igk.intel.com>
References: <20260527115311.13398-1-zhanwei919@gmail.com>
 <20260529135028.20763-1-zhanwei919@gmail.com>
 <CA+qUFckr9uC7h4S9xw0JMxGnehXyrQ8HpOYdwoFoMsLk-HM_nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+qUFckr9uC7h4S9xw0JMxGnehXyrQ8HpOYdwoFoMsLk-HM_nw@mail.gmail.com>

On Fri, May 29, 2026 at 10:05:58PM +0800, 占wei wrote:
> +Cc Raag, who authored the fan support and reviewed v1.
> 
> Thanks for your help, this v2 drops the code change and documents the
> DG2 shared-tach behaviour instead, per your feedback on v1.

IMO it's a bit verbose to have a dedicated doc for this. Just add a small
comment in the existing ABI doc[1] under fan channel description.

[1] Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon

Raag

> Zhan Wei <zhanwei919@gmail.com> 于2026年5月29日周五 21:50写道：
> >
> > The number of fanN_input attributes on DG2 is hardcoded to two because
> > FSC_READ_NUM_FANS returns an incorrect value on some boards. How the
> > physical fans map onto the tach channels is left to the board vendor:
> > some OEMs route multiple physical fans through a single shared tach
> > line, in which case the unwired channel's pulse counter never
> > accumulates and fanN_input reads a constant 0 RPM.
> >
> > This is expected behaviour for such boards rather than a driver fault,
> > and the driver has no reliable way to distinguish a shared-tach layout
> > from a genuinely silent fan. Document this so the flat DG2 fan count is
> > not mistaken for a bug and "fixed" by lowering it, which would hide a
> > working fan2 on boards that do wire two tach lines.
> >
> > Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
> > ---
> > v1 -> v2: Drop the code change. As pointed out in review, the same PCI
> >   device ID ships with both shared-tach (multiple physical fans on one
> >   channel) and 1:1 fan wiring, and FSC_READ_NUM_FANS is unreliable on
> >   some boards, so the DG2 fan count cannot be lowered without hiding a
> >   working fan2 on boards that do wire two tach lines. Document the
> >   behaviour instead of changing the reported fan count.
> >
> > v1: https://lore.kernel.org/intel-xe/20260527115311.13398-1-zhanwei919@gmail.com/
> >
> >  Documentation/gpu/xe/index.rst    |  1 +
> >  Documentation/gpu/xe/xe_hwmon.rst | 48 +++++++++++++++++++++++++++++++
> >  2 files changed, 49 insertions(+)
> >  create mode 100644 Documentation/gpu/xe/xe_hwmon.rst
> >
> > diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> > index 874ffcb6da3a..3c14cdcaa8a6 100644
> > --- a/Documentation/gpu/xe/index.rst
> > +++ b/Documentation/gpu/xe/index.rst
> > @@ -30,3 +30,4 @@ DG2, etc is provided to prototype the driver.
> >     xe-drm-usage-stats.rst
> >     xe_configfs
> >     xe_gt_stats
> > +   xe_hwmon
> > diff --git a/Documentation/gpu/xe/xe_hwmon.rst b/Documentation/gpu/xe/xe_hwmon.rst
> > new file mode 100644
> > index 000000000000..8cd48df59386
> > --- /dev/null
> > +++ b/Documentation/gpu/xe/xe_hwmon.rst
> > @@ -0,0 +1,48 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +=================
> > +Xe HWMON support
> > +=================
> > +
> > +The xe driver exposes hardware monitoring sensors (power, energy,
> > +temperature, voltage and fan speed) through the kernel hwmon subsystem,
> > +typically consumed via ``/sys/class/hwmon/hwmonX/`` or tools such as
> > +``sensors``.
> > +
> > +Fan speed reporting
> > +===================
> > +
> > +Fan speed (``fanN_input``) is reported in RPM and computed from a tach
> > +pulse counter: the driver reads an accumulating pulse register, divides
> > +the delta between two subsequent readings by two pulses per rotation,
> > +and time-averages the result.
> > +
> > +Number of fan channels
> > +-----------------------
> > +
> > +The number of ``fanN_input`` attributes exposed in sysfs is the fan
> > +count returned by the ``FSC_READ_NUM_FANS`` pcode command. On DG2 this
> > +command has been found to return an incorrect value on some boards, so
> > +the driver hardcodes a fan count of two there. As a result up to
> > +``fan1_input`` and ``fan2_input`` are always exposed on DG2 regardless
> > +of how many tach lines are actually wired.
> > +
> > +Zero RPM on DG2 is not necessarily a bug
> > +----------------------------------------
> > +
> > +How physical fans map onto the tach channels is left to the board
> > +vendor. Some OEMs route several physical fans through a single shared
> > +tach line, while others wire each fan to its own channel 1:1. The
> > +driver has no reliable way to tell these layouts apart, and the same PCI
> > +device ID can ship in either configuration.
> > +
> > +When a channel has no tach line driving it, its pulse counter never
> > +accumulates, so the corresponding ``fanN_input`` reads a constant 0 RPM.
> > +On DG2 this is most often seen on ``fan2_input`` for boards that drive
> > +both physical fans from a single tach line. This is expected behaviour
> > +for such boards, not a driver fault, and reflects the board wiring
> > +rather than a missing or stalled fan.
> > +
> > +For this reason the fan count on DG2 is intentionally left at a flat
> > +value rather than tracked per board: there is no driver-visible signal
> > +that distinguishes a shared-tach layout from a genuinely silent fan.
> > --
> > 2.43.0
> >
