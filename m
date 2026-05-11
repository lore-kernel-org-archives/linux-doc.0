Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08413988FF
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485301; cv=none; b=H0+eOnwDbv0HWi9b/9a7PB+Y40ie63Wchg68xRWVDdBxnvA1jeDXahMUTXuwbIGBd+PV40K0U/eTv3VEQ+Bl8qtF5ruJQC1LUHMM3O4CRBtziP6dT7f7hwSucKR51z/LhWmzQY2ab0eEGUKcAIIg2AXCMm+zejXFyLHREjLrbK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485301; c=relaxed/simple;
	bh=zBwSDzpx7xxdzAFVKY6dfHL9FRIKu6BdJZx+3y0v5sQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hmic5TbYGO7TohmABeLgRTf6unm+UU+2hST7wlyEGy3+WZ4Tph1x5zSqWnbDVT3kZG+2sVU/yoceZ+LjAg/nLMqZlMYilUF1rMpym4YFP0ZsNHBa17bB7aGXMCu0yfNMoIi29w0+X3we/N4KhAOcS2TYj/76zHyyiQ0H3EA38Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWbzM6vl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWbzM6vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778485294; x=1810021294;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=zBwSDzpx7xxdzAFVKY6dfHL9FRIKu6BdJZx+3y0v5sQ=;
  b=QWbzM6vlwrHmlrzfDAFeAo9KLZIm4XUcz1kI1n2uDfxGzOA7FwagoBsF
   BRKXcxeT4Tgnl+V7hsi27VsjUTYfoYqf1Xp2KO+rBi4QE/qKuju72kb75
   6t+eYwJdfpSx7y+qJSUpv9xZijoLZ74neMx7+i9xoQoiumAxIF3WYWOCq
   d1WQ69/5z6Uas5yesDhyy2dlrnft/8RoNjBs0buCjTjbCMl7KNfPuC4wJ
   IS5TqOf2Sk1zeZ6TEzJKjwiqf0IQ9MxiiDufqg0WJj0xwhoXP/v0S7ct6
   SMoDqa3QKarvb/fSUT86tLB+tpyHry2buoTAsYJjWHISuaT/GaxcmHC0n
   Q==;
X-CSE-ConnectionGUID: MVJK46GrSKyhV8kC779q8w==
X-CSE-MsgGUID: Xv/fnnKPRqCX3paMm0At8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90741910"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="90741910"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 00:41:14 -0700
X-CSE-ConnectionGUID: dtEGvvG2SWC5TM1ceTz6vQ==
X-CSE-MsgGUID: L9VBZbOPTPSQmmanZOoxkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="237332137"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.253])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 00:41:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Cc: rodrigo.vivi@intel.com, Matthew Brost <matthew.brost@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
Subject: Re: [PATCH 1/3] Documentation/gpu: add dedicated documentation for
 Intel display
In-Reply-To: <4aba5b5e-75a5-4800-bedb-8f7cc673c7f7@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1778235406.git.jani.nikula@intel.com>
 <21bfa7777eb0926eadd309d4c6f5c9cf48405cf0.1778235406.git.jani.nikula@intel.com>
 <4aba5b5e-75a5-4800-bedb-8f7cc673c7f7@infradead.org>
Date: Mon, 11 May 2026 10:41:06 +0300
Message-ID: <6c6e0124df2b5f13661d3d8f4f1a9b7f1fcaca85@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 08 May 2026, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 5/8/26 3:20 AM, Jani Nikula wrote:
>> diff --git a/Documentation/gpu/intel-display/index.rst b/Documentation/g=
pu/intel-display/index.rst
>> new file mode 100644
>> index 000000000000..8d40363b8f90
>> --- /dev/null
>> +++ b/Documentation/gpu/intel-display/index.rst
>> @@ -0,0 +1,40 @@
>> +.. SPDX-License-Identifier: MIT
>> +.. Copyright =C2=A9 2026 Intel Corporation
>> +
>> +.. _drm/intel-display:
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Intel Display Driver
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The Intel display driver provides the display, or :ref:`drm-kms`, suppo=
rt for
>> +both the :ref:`drm/xe <drm/xe>` and :ref:`drm/i915 <drm/i915>` Intel GPU
>> +drivers.
>> +
>> +The source code currently resides under ``drivers/gpu/drm/i915/display`=
` due to
>> +historical reasons, and it's compiled separately into both drm/xe and d=
rm/i915
>> +kernel modules.
>> +
>> +The drm/xe and drm/i915 drivers are the "core" or "parent" drivers for =
display,
>> +as they initialize and own the drm device, and pass that on to the disp=
lay
>> +driver. The display driver isn't an independent driver in that sense.
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +   :caption: Detailed display topics
>> +
>> +   async-flip
>> +   audio
>> +   cdclk
>> +   dmc
>> +   dpio
>> +   dpll
>> +   drrs
>> +   dsb
>> +   fbc
>> +   fifo-underrun
>> +   frontbuffer
>> +   hotplug
>> +   plane
>> +   psr
>> +   vbt
>
> Is this in almost-alphabetical order or just random?  :)

The above list is alphabetical, but the generated output does seem to be
more random due to the headings. This is in need of better organization
anyway, and this is just a step in the right direction, so I'll roll
with this.

> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for the reviews and acks and testing, pushed to drm-intel-next.

BR,
Jani.


--=20
Jani Nikula, Intel
