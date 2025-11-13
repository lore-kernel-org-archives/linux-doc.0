Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2AF330B37
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021588; cv=none; b=AibOl5/g/CPSwUzMTG0I0JlIhDrgMUlW4U1acJ5220Dry1H5Eje5ofRgljdh8tfw4jpJ4ZZx5OZS5f0fxaGGuDznWMGbUTiqVxk/nHVNFuedz63P4vEVq+SsFm4BtmmkwoF/BXVDj+1J4LnUDFuT+IGgBynoES4WIb+Yxc9ArvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021588; c=relaxed/simple;
	bh=lAZKwdNG6yqgLTcxJuhIIb/0iuknKf83SnJ4Z0QPc4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aZiEtpYQ/OyoLrUGM6tZOM5wqtQ3p+BNiMamnbPmPdhjO/v7M+96iH9xe+DetRdQLL7RtWcHcnyIOn8ouDcrBVQSWM27Idg6xbRdvcjzPlL69rCx9ybafWmzecEKKoMirrY2fpFPXz4cJk1CSKs/8gDCQLo2raVBTvTZ/3i2rSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvG0YRkH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvG0YRkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763021587; x=1794557587;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lAZKwdNG6yqgLTcxJuhIIb/0iuknKf83SnJ4Z0QPc4k=;
  b=hvG0YRkHTmz0ibBGjUOJ0CuFLWE34Qgbh2HumLy2IFq+CwY8kF9LOW8e
   8LXEih9O2X/u1G0tpZFYVQq5uyGWKIUdHFyj2YK4k8f8Y+++zJa53Gr7l
   IjEjaxmp9QVl+onW+2UjUB+ijZ6X0D4uIOZ2ujT4HEfGS/RV+hA/JuS4k
   XnEg2/36IUKDUFAfy1ArhzRC5mIYwk/9vgenyUowjeY6xmpdJ8lMxumXA
   EA5FX46GIYf2WTXJpzCwBs5Ez4fP2fwAAro9rnxsV2OODvwRFWz1tWxxA
   m6XuaLcxHJMMFPth9cPwtppMuLKi4//EFpI0m/fr9u/ZMGb9+0lPXEeAf
   Q==;
X-CSE-ConnectionGUID: EvVdj3QHQL2FOvqX2nwNvA==
X-CSE-MsgGUID: hLH2Vx6pQe+KAYf9CppK+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87741940"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="87741940"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 00:13:04 -0800
X-CSE-ConnectionGUID: 08BN5OT8Sk6bVDXYo0UK6Q==
X-CSE-MsgGUID: voZTmB47Qk+/VbRL5f2kWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189453076"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.135])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 00:13:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Subject: Re: [PATCH 4/4] Documentation: use a source-read extension to
 include the index boilerplate
In-Reply-To: <qf6t4cbpurcssabychbtxplqv7metgglduu4soqjexfxs6ongy@yryw3bnk44y6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762948491.git.jani.nikula@intel.com>
 <e404d14ad5e9ed0ddc3f8920efb5d156dff99021.1762948491.git.jani.nikula@intel.com>
 <qf6t4cbpurcssabychbtxplqv7metgglduu4soqjexfxs6ongy@yryw3bnk44y6>
Date: Thu, 13 Nov 2025 10:12:59 +0200
Message-ID: <5fc09cd5678000ccca68200d9f692376024e4b33@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 12 Nov 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> On Wed, Nov 12, 2025 at 01:56:54PM +0200, Jani Nikula wrote:
>> Reduce boilerplate all over the place by adding a small ad hoc extension
>> in conf.py that adds the ../sphinx-includes/subproject-index.rst include
>> to all SPHINXDIRS builds.
>> 
>> Note that the docname is just 'index', because the SPHINXDIRS builds
>> happen in the subdirectories.
>> 
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>> diff --git a/Documentation/conf.py b/Documentation/conf.py
>> index b9a43ee32a00..cb0936a71d52 100644
>> --- a/Documentation/conf.py
>> +++ b/Documentation/conf.py
>> @@ -589,8 +589,14 @@ kerneldoc_srctree = ".."
>>  # ------------------------------------------------------------------------------
>>  loadConfig(globals())
>>  
>> +# Add index link to SPHINXDIRS builds
>> +def add_subproject_index(app, docname, source):
>> +    if app.builder.tags.has('subproject') and app.builder.tags.has('html'):
>> +        if docname == 'index':
>> +            source[0] += '\n.. include:: ../sphinx-includes/subproject-index.rst\n'
>
> The relative path there breaks SPINXDIRS, when it is pointing to use a sub-sub-dir
> like:
>
>     $ make SPHINXDIRS=userspace-api/media htmldocs

Ugh, I looked at 'make help' for the "valid values for SPHINXDIRS",
which only lists the top level directories. Patch 1 is also based on
this.

What a surprise, the documentation for documentation is useless.


BR,
Jani.


>
>     Traceback =========
>
>       File "/usr/lib/python3.14/site-packages/sphinx/util/parallel.py", line 137, in _join_one
>         raise SphinxParallelError(*result)
>     sphinx.errors.SphinxParallelError: docutils.utils.SystemMessage: Documentation/userspace-api/media/index.rst:69: (SEVERE/4) Problems with "include" directive path:
>     InputError: [Errno 2] No such file or directory: 'Documentation/userspace-api/sphinx-includes/subproject-index.rst'.
>
> Thanks,
> Mauro

-- 
Jani Nikula, Intel
