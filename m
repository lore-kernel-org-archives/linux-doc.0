Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0131991B0
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537869; cv=none; b=c5u0WJLiFTWsF3I8gTpQC+zr8BVMeiLVqXiWTBnGK+5IRV2+N35QJCowSaqkLstOvf0et/FVfl6Oex2B3z3pqHMSqgp5MxJ9YYn6LuIOshDWo9l8OS85FrS32tgRRRoCXu51VGdePdmJysidDtfR6waeG3EyfzFxXNiq6d8RSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537869; c=relaxed/simple;
	bh=gHIYGqZJwGtEvfGWF8fA2dwhS4sVsotDmNNYzW/iVeg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dD4+nN6b2Up6HveqmpDl/13Hye2fgHqw0q9b/KK/uIgTsrCvw1bz0dkZyOp7FG0x85tfbv0RyetLV8i74KEvzUGjynVlizXk4DUdOh71GnL96/WtZILi2vSg/PelMR8+nREH8/TGjzOlTxC6QXWWOpszzK300uYWQhHZQKHfKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVaN3Ekv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVaN3Ekv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725537866; x=1757073866;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=gHIYGqZJwGtEvfGWF8fA2dwhS4sVsotDmNNYzW/iVeg=;
  b=EVaN3EkvovWbonlrAF+l4DYIi+K3T3Ztb1PBCAi66uzeDWYnPYvHDXI/
   YFLvRxNP8hONZ/R2KBkSHqScN1HJaOuSpUdof6Zfv5Zkxb31F/VCfGJXW
   SpgsqWXnZtDfDwhO3aFUNRef7dTxIIIkWzntoAOWgSOYMCiVpUWqJnHF0
   ItxZKAr/IEWgiHBRlYNXDsU/xtlHqiKRcfBT2Cmr5PY0x153sduVcTUFT
   RwHcvh2nbhJnUT6VvNtwp/6VjOsMr0k+5mzvZOTYPxhw6U5SjIpPC8Mc7
   /eFBSD4poGf/9vMgj2ee5rcYiDhCvh/CzYH3ab+tcVm4qG8mU4BVbzKma
   Q==;
X-CSE-ConnectionGUID: 4MKEGNLHRBmxPftu7iKxww==
X-CSE-MsgGUID: 0SIO+WAoSuaA4bMlZiDhQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="13386111"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="13386111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:04:26 -0700
X-CSE-ConnectionGUID: dk6kbgdUQtyvAeKlD8+1OA==
X-CSE-MsgGUID: q4P3sh0HSDGEtgTkjj/7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65260228"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:04:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: bernhard+linux-doc@lsmod.de, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: Re: [PATCH] docs: Build kernel docs deterministically
In-Reply-To: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
Date: Thu, 05 Sep 2024 15:04:21 +0300
Message-ID: <878qw6qpbu.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 05 Sep 2024, bernhard+linux-doc@lsmod.de wrote:
> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>
> Because we want reproducible builds
> and https://github.com/sphinx-doc/sphinx/issues/6714
> did not receive any love from Sphinx devs in five years,
> let's disable parallel doc builds until that Sphinx issue is fixed.

You mention in [1] that this is likely a duplicate of [2] i.e. multiple
Sphinx instances running in parallel and racing in doctree access.

In kernel, does the issue then boil down to:

htmldocs:
	@$(srctree)/scripts/sphinx-pre-install --version-check
	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))

i.e. multiple Sphinx invocations instead of just one?

Broken record, I still think we should axe the Makefile hacks out of the
Sphinx build altogether, and let Sphinx handle everything, via
extensions if necessary.

BR,
Jani.


[1] https://github.com/sphinx-doc/sphinx/issues/6714#issuecomment-1848975385
[2] https://github.com/sphinx-doc/sphinx/issues/2946

>
> This patch was done while working on reproducible builds for openSUSE,
> sponsored by the NLnet NGI0 fund.
>
> Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
> ---
>  Documentation/sphinx/parallel-wrapper.sh | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/sphinx/parallel-wrapper.sh b/Documentation/sphinx/parallel-wrapper.sh
> index e54c44ce117d..cb93626bd86e 100644
> --- a/Documentation/sphinx/parallel-wrapper.sh
> +++ b/Documentation/sphinx/parallel-wrapper.sh
> @@ -10,6 +10,9 @@ sphinx="$1"
>  shift || true
>  
>  parallel="$PARALLELISM"
> +# Because of issues in Sphinx(https://github.com/sphinx-doc/sphinx/issues/6714)
> +# we disable parallel doc generation to get deterministic build results
> +parallel=1
>  if [ -z "$parallel" ] ; then
>  	# If no parallelism is specified at the top-level make, then
>  	# fall back to the expected "-jauto" mode that the "htmldocs"

-- 
Jani Nikula, Intel
