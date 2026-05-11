Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A62D9ECA
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489418; cv=none; b=NjMyhlzVztLDCxM+JbHqqVZaJC6Mn/ztc+AZCQnzwfwgQaAKgWS3uFW8CSkPi0vdP9l6e8KJNit+zekNY2o2hxU9K2KFbZUZ1k7OGAfX9KQDFvLfNSZajaRUQljr1h9BqsGQ8vpkxl+4xiSceqmdpKbSPe8XOKlFV0Q4cnoPNEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489418; c=relaxed/simple;
	bh=fS5kzIbAQ+ymmFxAoyMAv9UFw60UVlFc1Gyh16nYy+c=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mGtRwHK2qNcP2jf822Vz66gGfyrq9lYT1n+4oXCCC4iFhWoxuDvv/SMU2ETGPYhpMSNGC1IoZL+hrSh4RlOM00t2d709Si+YHcEbuKnXEQ3YME4doTy8LN+UGdcP5jLL7yEOpEf0OXm88qGMrCLT4TV3FBc71YJQOfnE3hsspWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/ChRIto; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/ChRIto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778489418; x=1810025418;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=fS5kzIbAQ+ymmFxAoyMAv9UFw60UVlFc1Gyh16nYy+c=;
  b=Q/ChRItoI7NDc3vLnfa98jTUkeizMPW7BFzdcP9wiPP/3iezgr/pJoTM
   seYiFRuxfeNlztnYwAsTafNOBkkzNe7WNBKSY420yw1OjWklG+UG+XtZE
   0D5t0wgr1hxuw3dC7EmFyunvy+QyJ2cyKjEs7ElM2qWdM0AX44koJnG8l
   s/hUQ7MffJHR/6S1FbCjaY7Mq86OXw4humAiRZ/728cwe7EHGBYnKYBnT
   05cu6QZvvwzsVOCkGNWahUEQ/01D0y3FnBUfy/FEMBqrMkEonFkcKrLP7
   9OkJH1kggtNafVK8qFeOgHQS7pPrdbO1LO/6kwGJEsuU1szeXv4gdrw9E
   g==;
X-CSE-ConnectionGUID: iZnX6v3tS5KiqTykP8LwFg==
X-CSE-MsgGUID: wLLccrHCSXa/zLEdfezhDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79552370"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79552370"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 01:50:17 -0700
X-CSE-ConnectionGUID: bLWumq/MRgSrDqk7ENBISg==
X-CSE-MsgGUID: Cnl7q39JSbaCD9ts6KBMnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="236536697"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.253])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 01:50:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jonathan Corbet
 <corbet@lwn.net>
Subject: Re: [PATCH 0/3] Documentation/gpu: tables of contents cleanups and
 fixes
In-Reply-To: <cover.1778238671.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1778238671.git.jani.nikula@intel.com>
Date: Mon, 11 May 2026 11:50:11 +0300
Message-ID: <ad1be55a146a3680ad920588a7cfdbc154b8a4fc@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 08 May 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> Make the GPU documentation slightly easier to navigate.

Maxime, Thomas, Maarten, Jon -

Any preferences which tree to merge this through? I'm thinking either
drm-misc-next or docs-next.

BR,
Jani.


>
> Jani Nikula (3):
>   Documentation/gpu: limit main toctree depth to 2
>   Documentation/gpu: add some tables of contents to large documents
>   Documentation/gpu/rfc: fix toctree
>
>  Documentation/gpu/driver-uapi.rst     |  2 ++
>  Documentation/gpu/drm-internals.rst   |  2 ++
>  Documentation/gpu/drm-kms-helpers.rst |  2 ++
>  Documentation/gpu/drm-kms.rst         |  2 ++
>  Documentation/gpu/drm-mm.rst          |  2 ++
>  Documentation/gpu/drm-ras.rst         |  2 ++
>  Documentation/gpu/drm-uapi.rst        |  4 +++-
>  Documentation/gpu/drm-usage-stats.rst |  2 ++
>  Documentation/gpu/index.rst           |  1 +
>  Documentation/gpu/introduction.rst    |  2 ++
>  Documentation/gpu/rfc/index.rst       | 26 ++++++--------------------
>  11 files changed, 26 insertions(+), 21 deletions(-)

-- 
Jani Nikula, Intel
