Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07E1F8928;
	Fri,  3 Jan 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896992; cv=none; b=u7A4/+MPi1LlNS4EEbfxYG4NfBzQfWIWdOPHBI0xUARcXm1JTQbivPjOcn1Kj8l0MKhjiQU5NtLZU6BpIwuVYrX/0vpEHXRdBZtqHCUnhMxIHRMkNZozdnBmgtElP2JtnYfOMbmZCjBFnA5u89hiPkv1pyGoeM+6Lw1LeI5AGos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896992; c=relaxed/simple;
	bh=Sx8uKAcGsdLeQ5dFASF/J5pQFrJmaAaOb1DYwpTZsBc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ADanaOktVUWpCMVo7mw2gaEYGjDZHKFUi/xambWf6ykm1G0LWt+Flv1iztAuoH6KBnTelNx+WpO2xvD4mxFXjXCcwjsmXUPbZJr1qoe80d3+mAiUBQ8jN9/iWxIGnkvIq8FYbtEFXls/QV0Tz9DW1I1/Sh90flQJESvBTAjARYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN3hW0bJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN3hW0bJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735896991; x=1767432991;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Sx8uKAcGsdLeQ5dFASF/J5pQFrJmaAaOb1DYwpTZsBc=;
  b=FN3hW0bJyeKFsDxHymP8sIdeWePBh+g03FKJTtOTWqvJpJeyZP1m9QYt
   PvZPOD5JNCGg66maZo3ePLixGuU7Sq5+Nk8En0DlxRh9jmGq3dDSHmX1k
   AO1zqi0HWoECih7/9J15bDi3V7XfKhcXMg/XbTBnKWar/woHnASK9ph+G
   NYfmHGPSVsFjIR4ctTwtKPfotpUnvn1A47jr+90p+g+7fnN3xLqt+3bfu
   y/mLTnLXRbQ4kI/OYl0P8z3xXS2zLGgs2HTpMtUT71BbpvR2LG52aUlcF
   KClLGPIrbOE6G7i6PdZfPb9l0lgmlj6T/yDaPXBD+zsy8GYHK04W/5V40
   w==;
X-CSE-ConnectionGUID: 4UFF/UkjTkivahOLRkbgig==
X-CSE-MsgGUID: gOH/X8qZSP6hi3ae11j8oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36297197"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36297197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 01:36:30 -0800
X-CSE-ConnectionGUID: dpAsRF1aSAyz83h/U1NpCg==
X-CSE-MsgGUID: ZY8Ad0hhRHK5HgQtpi9ceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102228910"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.242])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 01:36:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?utf-8?Q?Herv?=
 =?utf-8?Q?=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 03/10] drm/bridge: add support for refcounted DRM
 bridges
In-Reply-To: <20250102130319.2e8079a9@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-3-173065a1ece1@bootlin.com>
 <87seq4nm3g.fsf@intel.com> <20250102130319.2e8079a9@booty>
Date: Fri, 03 Jan 2025 11:36:17 +0200
Message-ID: <87y0zsme7i.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 02 Jan 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Hello Jani,
>
> thanks for your review.
>
> On Tue, 31 Dec 2024 13:11:31 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> On Tue, 31 Dec 2024, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>> > DRM bridges are currently considered as a fixed element of a DRM card, and
>> > thus their lifetime is assumed to extend for as long as the card
>> > exists. New use cases, such as hot-pluggable hardware with video bridges,
>> > require DRM bridges to be added and removed to a DRM card without tearing
>> > the card down. This is possible for connectors already (used by DP MST), so
>> > add this possibility to DRM bridges as well.
>> >
>> > Implementation is based on drm_connector_init() as far as it makes sense,
>> > and differs when it doesn't. A difference is that bridges are not exposed
>> > to userspace,hence struct drm_bridge does not embed a struct
>> > drm_mode_object which would provide the refcount and the free_cb. So here
>> > we add to struct drm_bridge just the refcount and free_cb fields (we don't
>> > need other struct drm_mode_object fields here) and instead of using the
>> > drm_mode_object_*() functions we reimplement from those functions the few
>> > lines that drm_bridge needs for refcounting.
>> >
>> > The function to enroll a private bridge driver data structure into
>> > refcounting is based on drm_connector_init() and so called
>> > drm_bridge_init() for symmetry, even though it does not initialize anything
>> > except the refcounting and the funcs pointer which is needed to access
>> > funcs->destroy.
>> >
>> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> >
>> > ---
>> >
>> > This patch was added in v5.
>> > ---
>> >  drivers/gpu/drm/drm_bridge.c |  87 ++++++++++++++++++++++++++++++++++++
>> >  include/drm/drm_bridge.h     | 102 +++++++++++++++++++++++++++++++++++++++++++
>> >  2 files changed, 189 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> > index b1f0d25d55e23000521ac2ac37ee410348978ed4..6255ef59f73d8041a8cb7f2c6e23e5a67d1ae926 100644
>> > --- a/drivers/gpu/drm/drm_bridge.c
>> > +++ b/drivers/gpu/drm/drm_bridge.c
>> > @@ -198,6 +198,85 @@
>> >  static DEFINE_MUTEX(bridge_lock);
>> >  static LIST_HEAD(bridge_list);
>> >  
>> > +static void drm_bridge_put_void(void *data)
>> > +{
>> > +	struct drm_bridge *bridge = (struct drm_bridge *)data;
>> > +
>> > +	drm_bridge_put(bridge);
>> > +}
>> > +
>> > +static void drm_bridge_free(struct kref *kref)
>> > +{
>> > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
>> > +
>> > +	DRM_DEBUG("bridge=%p\n", bridge);
>> > +
>> > +	WARN_ON(!bridge->funcs->destroy);  
>> 
>> Please don't add new DRM_DEBUG or WARN_ON where you can use the
>> drm_dbg_* or drm_WARN_ON variants.
>
> Good point. However drm_WARN_ON() cannot be used because it needs a
> non-NULL struct drm_drm_device pointer which is not always available
> here: in case of -EPROBE_DEFER it usually isn't. I guess I'll go for
> drm_dbg_core() or drm_warn[_once](), even though none of them prints a
> stack trace and I find that would be useful.

drm_dbg_* can handle NULL drm device; maybe drm_WARN* should be modified
to do so as well?

> This is raising a loosely-related question about the DRM_DEBUG()s this
> patch is adding, such as the one quoted above: would it make sense to
> add a new drm_debug_category value for the bridge refcounting
> functions? Or for bridges altogether? They are pretty different from
> the core messages, and it may be useful to see only the refcounting
> messages or only the core messages.
>
> DRM_UT_BRIDGE?
> DRM_UT_BRIDGE_REFCOUNT?

IMO the biggest benefit of new categories would be for very noisy
logging that you really only want enabled when debugging a specific
issue. Otherwise, the hard part about adding new categories is their
adoption.

For example, we now have DRM_UT_DP, but it's only haphazardly used here
and there. I don't really see a lot of point in having that separated
from DRM_UT_KMS. When would you want one but not the other? How would
you go about converting some KMS to DP logging, and why? What's special
about DP, why don't we have an HDMI category? Etc.

OTOH, DRM_UT_DP is also used for DP AUX transfer debug logging. I think
that would've been a good category on its own: Do you want noisy logging
about DPCD access or not? But not used for anything else.

Oh, having written the above, I looked up a18b21929453 ("drm/dp_helper:
Add DP aux channel tracing"). DRM_UT_DP *was* intended only for DP AUX
message tracing, but its naming unfortunately suggests a broader
category, and here we are.


BR,
Jani.


-- 
Jani Nikula, Intel
