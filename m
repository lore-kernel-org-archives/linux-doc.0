Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F58B32ABC1;
	Thu, 15 Jan 2026 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472399; cv=none; b=BL/NKv5wQmEJH42PTeCkINgAGsuUHl+PGn1VuzVLs/YGkbLLQhfXl09s9Z9BsnvD/BZjF/1rqYtrYA8FjOS3ZizKEqO4uApoTT+/NxTSy3g2+tg9thuwci5KpNZnevuHYk1zC871vuYqRR+5CdCCgTAnqBu7ZR9smeHItYw96R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472399; c=relaxed/simple;
	bh=7hoBrqhE+KsCsxFUVPuC93ks3r8D4g8YMV9ieVLOW74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lNvVdwujLcmtit1iRFDMYS6R3h5SCKc//mI8ePGWksOVssT5uVAyBACmM3UzWmaLs2Nagg2kpqLHola4JR6ckdwvLszhkYIDCDeqNjimaThaoE7W8DDWFE3bl5IuxY4HrHJeqE0D+86gU6xbuhUBrIGaygQtehFF7jjp6eq13JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8ZsWhE0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8ZsWhE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768472397; x=1800008397;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=7hoBrqhE+KsCsxFUVPuC93ks3r8D4g8YMV9ieVLOW74=;
  b=e8ZsWhE0IXoPJKR3W60/VjpqG9h5zSqlmtkc5Ay5kqnhAV6UlhEqvyqX
   Ki2poPSsppumwK+5GAU1zNFibyAhq6t9pwS4BTeMeVeBFLVO/qONVgiKw
   tMScNdaO2kEXHa0CpVAQv2FgEbzo2sk0b/+3SEXouGqvo8Mk82G5izyzo
   sqDPxg7wTgXrVC8Uc+SbLCEfjBHHsJOO/176qoNEhadrJFLDvF1edXhAC
   PF4z4nlGq5Gsvq7jv6CaeAGzKp1s84Gvfi15MA9au87l+UXR/qYF8LyBU
   J3zgZD/gmqp615ZmqOx58+oigJMDZuBsPbWfkpvTBpRZSxAh9jrYY2C4e
   g==;
X-CSE-ConnectionGUID: KQqbZ3mvTNeQUAcBeMPBcA==
X-CSE-MsgGUID: L2x5kC/FQBuL2uF0KQx9uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69692094"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69692094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:19:54 -0800
X-CSE-ConnectionGUID: yLC5fuNPQUuaCWfLbvezBg==
X-CSE-MsgGUID: aEdiE639T+qdXBBxCHO7VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205332262"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.150])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:19:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 02/13] docs: enable Sphinx autodoc extension to allow
 documenting python
In-Reply-To: <6aa5a5b4a686f07c8f3e6cb04fe4c07ed9c1d071.1768396023.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
 <6aa5a5b4a686f07c8f3e6cb04fe4c07ed9c1d071.1768396023.git.mchehab+huawei@kernel.org>
Date: Thu, 15 Jan 2026 12:19:48 +0200
Message-ID: <8e5e9257091275c6a3ddbbb254ca15ed55020627@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Adding python documentation is simple with Sphinx: all we need
> is to include the ext.autodoc extension and add the directories
> where the Python code sits at the sys.path.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/conf.py | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 1ea2ae5c6276..429fcc9fd7f7 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -13,11 +13,18 @@ from  textwrap import dedent
>  
>  import sphinx
>  
> +# Location of Documentation/ directory
> +doctree = os.path.abspath(".")

Looking this up based on __file__ would be more robust than cwd.

Calling this doctree is misleading because doctree is a specific Sphinx
term that means something else. The doctree directory is where the
parsed and pickled documents are cached.

Oh, I see that you're just moving this, but this is something that
should be fixed first.

> +
>  # If extensions (or modules to document with autodoc) are in another directory,
>  # add these directories to sys.path here. If the directory is relative to the
>  # documentation root, use os.path.abspath to make it absolute, like shown here.
>  sys.path.insert(0, os.path.abspath("sphinx"))
>  
> +# Allow sphinx.ext.autodoc to document from tools and scripts
> +sys.path.append(f"{doctree}/../tools")
> +sys.path.append(f"{doctree}/../scripts")

These would be much nicer with pathlib.Path.

> +
>  # Minimal supported version
>  needs_sphinx = "3.4.3"
>  
> @@ -32,9 +39,6 @@ else:
>      # Include patterns that don't contain directory names, in glob format
>      include_patterns = ["**.rst"]
>  
> -# Location of Documentation/ directory
> -doctree = os.path.abspath(".")
> -
>  # Exclude of patterns that don't contain directory names, in glob format.
>  exclude_patterns = []
>  
> @@ -151,6 +155,7 @@ extensions = [
>      "maintainers_include",
>      "parser_yaml",
>      "rstFlatTable",
> +    "sphinx.ext.autodoc",
>      "sphinx.ext.autosectionlabel",
>      "sphinx.ext.ifconfig",
>      "translations",

-- 
Jani Nikula, Intel
