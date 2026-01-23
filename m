Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB4031AA80
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166417; cv=none; b=RDYpGuOp0A4VmPk8Nl7xVPWoogVOfsHesWrbpdlqSbQldyFb7E60LeKxv7ZgdmQoJu9YAEQPD+BkNOLC7QEzjxHR2G5GtvQKeyyE9rwjeleMPVEciCcDvnfiEBnzkiC9ep7PT1AEJgWfIr8WTlPHDwl/yJyeFBWtblkkCbuXflM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166417; c=relaxed/simple;
	bh=c0OBxnDnFnzQu+sgQag7RLfSY1ZxzwBMwfP+gzJqaMc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M4qLlVRAK2gEEsIPbCdRUClaTxU8Cg489KMBZnU9b8TyOciP6v9TOO1JWs9ponryz38euyWxVEfSdeg8qSXCEypsakM7JkWWbkh2c06Ou2iexUPZVuF8EmOJGyyG/tcD0JTD9raL00Bz0CgTQXmQefunpArs5gzj6GacbePxjWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOrKU9FW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOrKU9FW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769166416; x=1800702416;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=c0OBxnDnFnzQu+sgQag7RLfSY1ZxzwBMwfP+gzJqaMc=;
  b=WOrKU9FWqqwNTnShqBosVzMJfknxlvHEUnC0SfpRJS2SFDcmkijP4x9D
   A28zsuNWGcQ3n+BkgF+YfBH2WQzqmA8mfSyPIBK6PwQHReV9/nzM3hOTJ
   vkQI0tlRzSHr5V9pEI2SQaX9nowUsmg1qCrGg9TzfKHZDiXnjcqNW1cUf
   Z2OLqyBoVZhU6nYrJLhmzRgjC3brloIqNkqA92GfaHoEKU+diy+v1+gu6
   Pn+f2Cy59f/u9T5IBc3C5ehBFsZkvY8zXM9jWt4x2UNNTuk6xK/V0Mk5h
   49tlgK96Wnbp88S7XUv/Ch/NXt62sil1fzX9We/2BdYs9x7R1YjU5IUw1
   Q==;
X-CSE-ConnectionGUID: oUqkPn/jSYCPeAkN4voJNg==
X-CSE-MsgGUID: 1vTXK4DvQt2HHjo7jCUTQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81048817"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81048817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:06:55 -0800
X-CSE-ConnectionGUID: 6pxeDNHZTiKdgWt7tszmkw==
X-CSE-MsgGUID: QD9WbmI3RceZJfp7l60tYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207343195"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.2])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:06:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: Passing SPHINXOPTS is broken
In-Reply-To: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
Date: Fri, 23 Jan 2026 13:06:51 +0200
Message-ID: <11148f49962022fde99058c15345add4935bbeff@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 23 Jan 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> I was trying to get the regular sphinx-build output.
>
> The monster sphinx-build-wrapper thing has this obnoxious and complex
> logic of forcing -q unless you specify verbose in SPHINXOPTS. You'd
> think those defaults should be specified in the Makefile. But no.
>
> Anyway, setting SPHINXOPTS in the environment or on the make
> command-line doesn't work, because Documentation/Makefile overrides it
> to empty.

Oh, it's more sad than just this. There is no way to use SPHINXOPTS to
get sphinx-build to produce the regular non-quiet output (that the
wrapper calls verbose).

You have to use KBUILD_VERBOSE to make the damn wrapper not pass -q to
sphinx-build. The wrapper appends the -q overwriting anything the user
might want to pass on SPHINXOPTS. Which can't be passed anyway because
the Makefile overwrites it.

-- 
Jani Nikula, Intel
