Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14F260DC6
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028850; cv=none; b=GzD7QANtQm6q+XYTKyRZOYk0em13VPBVeiA4u1B8FJmE4ZVwapE06NYpIfnC4Kbwb2HoQeemO4/uhSedELeorUDS/X6Fr2krjYWkYfML0X+T0xpUNGpKaixYCwPozrEmsIS2nuAEigEAr7YtHaph8cl1gvm6luYAFXfuVreibGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028850; c=relaxed/simple;
	bh=u2xd50yBI0/mMN5bx+KoM8dwANCe541fHQRULl5JSZM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VKfUEPaJOTImciQ/bIeZcGkcrflhMtCAJ6q7RtSJ8DRFkZky0j/EwrYqs3xC5131ZvKcc0oUT1nPIq7MPBeqFSg4O6zi6UJWPStW2rlFnD6czb2LvO4/qYHEnrBTWV4yFJJb4g7e1AotaKc2PjZtLsJYkBvknwTFTdeVLEopEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acsPEAGC; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acsPEAGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706028848; x=1737564848;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=u2xd50yBI0/mMN5bx+KoM8dwANCe541fHQRULl5JSZM=;
  b=acsPEAGC3HeqxwBiSyhqk4nN02KXP5MCnp/QR1sMvaQ94bUYNTleLN+9
   gpLCFMiRXYWy1XdYEBZdTKCQaSXGETWcCrsJnXFXI1rdOkZYOEK4TNZ8X
   Gr+9L3BuEYG73int7sWcB57ZeLqQa52uusfZIYZ2grFM5FQEZ7q0AFKkb
   y5NEjsw4k0HOOZSPTwkl17Iap1cXR06ncwDTsJP/eRs0AsUgFNze5Z9iB
   Ilr5GnXBcbSAYi8A6+JioRzJJ3W2VtODeYFe9YqAq01i2lqJ4EeLVs2EG
   2iKKpMHD93GW2zygEszYAjagDuKEQ2ykxpFOHr6OT3PpfJBk+u6t9whiu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405334999"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="405334999"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 08:54:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909353115"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="909353115"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.40.183])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 08:54:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
Subject: Re: docs: requirements.txt has stopped working again
In-Reply-To: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
Date: Tue, 23 Jan 2024 18:53:59 +0200
Message-ID: <87y1cgm1nc.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 23 Jan 2024, Akira Yokosawa <akiyks@gmail.com> wrote:
> Hi all,
>
> Annoyingly, installing Sphinx 2.4.4 using requirements.txt of v6.8-rc1
> ends up in a run-time error which looks similar to the one Vegard
> reported in commit f4cac0f74658 ("Documentation: constrain alabaster
> package to older versions").
>
> The new error is from sphinxcontrib.applehelp which reads:
>
>     Sphinx version error:
>     The sphinxcontrib.applehelp extension used by this project needs
>     at least Sphinx v5.0; it therefore cannot be built with this version.
>
> Do we want to continue whack-a-mole update for Sphinx 2.4.4?

I looked into the root cause here. Sphinx since early versions
(predating even 2.4.4) depends on packages such as

- sphinxcontrib-applehelp
- sphinxcontrib-devhelp
- sphinxcontrib-htmlhelp
- sphinxcontrib-qthelp
- sphinxcontrib-serializinghtml

but does so without any version constraints. Recently, all of those
*packages* started first depending on Sphinx >= 5. Apparently this
prevented installation of incompatible combos, but resulted in circular
dependency issues in pip.

To fix the circular dependencies, all of those *packages* made the
dependency on Sphinx >= 5 optional, but made the *extensions* in them
app.require_sphinx('5.0') runtime. This happened in the past two weeks.

What this means is that installing any Sphinx < 5 succeeds, it'll pull
in the latest versions of the above mentioned packages because they meet
the package dependencies, but all of them will fail runtime for any
Sphinx version before 5.0. Even if we don't actually use or need any of
those extensions.

I ran git blame and git tag --contains on them to figure out the
packages compatible with Sphinx < 5. These should do it:

diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
index 5d47ed443949..0aa4fdb84632 100644
--- a/Documentation/sphinx/requirements.txt
+++ b/Documentation/sphinx/requirements.txt
@@ -2,5 +2,10 @@
 jinja2<3.1
 # alabaster>=0.7.14 is not compatible with Sphinx<=3.3
 alabaster<0.7.14
+sphinxcontrib-applehelp==1.0.4
+sphinxcontrib-devhelp==1.0.2
+sphinxcontrib-htmlhelp==2.0.1
+sphinxcontrib-qthelp==1.0.3
+sphinxcontrib-serializinghtml==1.1.5
 Sphinx==2.4.4
 pyyaml

Conclusions:

- Distro packages probably work, because they maintain deps separately.

- Installing latest from pip probably works. There may be occasional
  hiccups, but they'll likely get noticed and fixed quickly.

- Installing known good requirements from pip freeze works.

- Installing some random version from pip is likely to fail.

- Installing a mix of distro and pip packages is likely to fail.

So maybe we'll need a minimum Sphinx version for distro packages, and
three separate requirements. One with just the top level deps (sphinx
and pyyaml, no versions specified), one which is basically a pip freeze
of that with know good config, updated regularly, and then a pip freeze
of the conservative (2.4.4?) versions, rarely updated.


BR,
Jani.


-- 
Jani Nikula, Intel
