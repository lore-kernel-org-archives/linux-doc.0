Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C140629B
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047314; cv=none; b=Uukb2xJ3SHywnLHrk+OneK9pTNJ5NsOgJPa5zKxc+Bq4phA6PcXt2kHruGPvW+ReNDL59PzGk5bx4+vFsfIeyeaMq1g/FFaLS0jw1huehxN4yVw3Iox0MintoyfYSXtj6UV/qiMf60eghnrv3sZyYydRY/Wk9r4E5eesBAelTeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047314; c=relaxed/simple;
	bh=nobZSEnqo+L+S7OzWYBTUmcg7e/MZWKH0QayPPPMmVE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NsuiCuUXA2AaLxVQvIGoKn+0nfQ/YeBeea6Y99ZIelwN+KsTH5pI6feAhq4LWmu8KI8Mr0Qi89jfSWoK71lEw0nA/+cgDULyMdhcnMKrKqk9dCMXmtcai04Ue1pIfpkMBcsxqIBRb/gm1J4zgKgP/HhiOOhIVgdDf+ROq5LpfjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZa1h0nA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZa1h0nA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775047313; x=1806583313;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=nobZSEnqo+L+S7OzWYBTUmcg7e/MZWKH0QayPPPMmVE=;
  b=SZa1h0nAyuW1ucnuBqarsU93xDrQ9NwM5QMCG/sPckbzwSnLDCG7d3Ib
   vlMJ+MEyf+i97qxhLnXexgyvbaKTV/LmfX477IBbuFv4FH1syyohrirub
   IOM5jYVmF3nXvTTreDUk52994XYn6adX9fqUJI6gJPB2HsQZTkGtHzhN8
   kIaAyRu/+pHUm92dAYJ4yESn/bdDFRbMqOGDEjVMHPoltjidTEzZJUZ4Z
   tRewlm5eEiUurLqJ7iRH4bHgTfotdI8K0GgLRGPtvbgplw5+twG+3SZ5d
   bBOKH1UIH77VGDhCn0E9GqMgUUj0uuqJ6TTXPmA1VMHeT6bAV+z3FT+nI
   w==;
X-CSE-ConnectionGUID: tEq1ySSCRfmB4biTESFQkw==
X-CSE-MsgGUID: MTGlWmMXRi2uUY7xKn7MVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75795516"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75795516"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 05:41:52 -0700
X-CSE-ConnectionGUID: J2WEWAyYRUOr0AUL25nXaQ==
X-CSE-MsgGUID: 4rLF1uHfT2iVcTTJ0KOmZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="225827329"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.152])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 05:41:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Simona
 Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 0/2] drm: Rename drm_atomic_state
In-Reply-To: <20260331-drm-drm-atomic-update-v2-0-7e8fe6ddcd32@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260331-drm-drm-atomic-update-v2-0-7e8fe6ddcd32@kernel.org>
Date: Wed, 01 Apr 2026 15:41:42 +0300
Message-ID: <5b2b2ff534b1994a3299be1daa7b4ec9db81ffbb@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 31 Mar 2026, Maxime Ripard <mripard@kernel.org> wrote:
> We've been discussing for a long time about renaming drm_atomic_state
> to a better suited name, since the current one is a source of confusion
> and bugs.
>
> To minimize the impact, this should probably go through drm-next
> directly.
>
> Let me know what you think,

I don't really have strong opinions on this one, except I agree this
should go directly through drm-next before the merge window so everyone
can backmerge it. Otherwise it's going to be a conflicts galore.

IMO drivers can do the variable renames afterwards at leisure.

For the i915 parts,

Acked-by: Jani Nikula <jani.nikula@intel.com>

-- 
Jani Nikula, Intel
