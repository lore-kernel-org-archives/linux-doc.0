Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F821CACDB
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732187958; cv=none; b=Oi3IMA2K2jdUBZvUljwvVmizbpNoK+IWbpv+6x+iTPKFxP3yh0JOdLFpHchtxMU13V2/jeaLm5yLQZgT1RjIBZtvMHUAw7Am0YrpuhySmmbPuBy5bbnHLPGHb75iXytFbaf5nqs2q/HohRBL/l8R17e6T0XSkuZVW3O757cCJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732187958; c=relaxed/simple;
	bh=rzw9AaJiPB788iTkTZocN8/XKKA2FzhVRrElTDB1Vwk=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QFrVGfYhiLVM/Cjg57m0SgzDyaM4FU/PmHTdDL+FdKL3g0b+kpfFh0VH+Uw3khMenPsCAUDDYnLHylQhUiy63dwWwpOp0YPmONAd+9BdYez++bpw5/O0CQBgGLGlVaQhUplLWWhgC0j9hJyltBb/ba+zPqXczIyrqGGd0kZhjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcyHF1ex; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcyHF1ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732187956; x=1763723956;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version:content-transfer-encoding;
  bh=rzw9AaJiPB788iTkTZocN8/XKKA2FzhVRrElTDB1Vwk=;
  b=XcyHF1exQ6gVgz6YpSJGqwspwgk3QCp2BfyUtaapoK9IbyvXpLFdvWsq
   LBZdaJ3Fbp2rM1k1SzU3pRaSyh0zQzvMn0faU0SNGvK+8caM7eR8cv//J
   brsherEHnQvGll5XpDMjuwdrZgTZDHcp+k8abIB3Vw95h7yT3U59sZALx
   Tex261CmwoDw567t3924mf7GRh+py34kVWmTE+qICrrpCoDkeAoHSaTLH
   Yczdle8gzO4xPCkVFtwKar/lTt5/u9f+okL6Ktc8FEzyYmIDZ6r+XVeOF
   6/lILeeYCuAR6qvWZbAXYM5ITDn6HcMqo4wJksoUpQzlqF7qHzAFIv41h
   g==;
X-CSE-ConnectionGUID: j5NNBnhWSbeFUtP9Mns1ew==
X-CSE-MsgGUID: huNZiocjTuy7CpO/gniXAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="49719166"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="49719166"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:19:10 -0800
X-CSE-ConnectionGUID: alql994fQuCKptpKjPWORw==
X-CSE-MsgGUID: XtG7ZnYgR4+GPt2iYZJKmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95284234"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.95])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:19:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>
Subject: Re: typedef output question/issue?
In-Reply-To: <e9d714fd-d034-4176-a2b7-50a72f80c8ad@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e9d714fd-d034-4176-a2b7-50a72f80c8ad@infradead.org>
Date: Thu, 21 Nov 2024 13:19:04 +0200
Message-ID: <877c8w25sn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Nov 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
> Hi,
>
> If I print a typedef in html (make htmldocs) from a .rst file,
> I see:
>
> type dma_cookie_t
>     an opaque DMA cookie
>
> Description
>
> if dma_cookie_t is >0 it=E2=80=99s a DMA request cookie, <0 it=E2=80=99s =
an error code
>
> ~~~~~~~~~~~~~~~~~~~
>
> If I print the same typedef in man format, it says 'typedef' instead of
> 'type', which is what I expect to see.

I'm sorry, it's unambigous to me which one you expect.

> man formatted output:
>
> Kernel API(9)                     API Manual                     Kernel A=
PI(9)
>
> NAME
>        typedef dma_cookie_t - an opaque DMA cookie
>
> Description
>        if dma_cookie_t is >0 it's a DMA request cookie, <0 it's an error =
code
>
> November 2024                    dma_cookie_t                    Kernel A=
PI(9)

How do you generate the man pages?

> I am using python311-Sphinx 8.0.2-1.2-noarch from openSUSE.
>
> [internet search ...]
>
> The $internet says that one option is to install and use:
> Add 'sphinx_autodoc_typehints' to the extensions list in your conf.py fil=
e.
> I tried that but now I get:
> Extension error:
> Unknown event name: autodoc-process-signature

The kernel-doc thing is not hooked up in the Sphinx autodoc processing,
which is more geared towards Python. I presume sphinx_autodoc_typehints
uses autodoc-process-signature which isn't there because the autodoc
Sphinx extension isn't loaded, and even if it were, would not be called
on kernel-doc handling.


BR,
Jani.


>
> Another option is to try a different theme so I reverted to
> sphinx_rtd_theme but that didn't help either.
>
> Does anyone know a good solution to this?
>
> thanks.

--=20
Jani Nikula, Intel
