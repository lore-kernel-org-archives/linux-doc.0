Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600F81CACDB
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732187985; cv=none; b=RRTt38ZVDkaopPGxJNDb2yDTklg0UPTm3AE9N81W96eX2md7/LBWh9Rn1ITziohT7VjJVQvv2VLLbPVRCC+0hbqq4j5lTGPnnByejRp8NHUBFyQfN11brI/1S6oZB4VAVG3/EZFt34Xlb8C+VzEvxwvoe/NwelWuLuFDJm1s0TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732187985; c=relaxed/simple;
	bh=NPnRjj78Mqh87ZWpYMgw8SLuPzdYhoe5hGzsF5REprY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=moXku3S7qs5x2MeSN4Zx8zEXHHYlcsitdsO2ikWPm8dmdbg+8K2zwOkAY4cxR+zCP3zZ+kw0y9eNW5QsxYOBnO30yTk2Xa9ojm/TUYSuCp4+IYMpeogFN1NPKEQ6uV4gLpp8ouz4EkWnxQmnYQB1nSZCpCxisIYE3JByfL9/zh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkaEOr7I; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkaEOr7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732187984; x=1763723984;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version:content-transfer-encoding;
  bh=NPnRjj78Mqh87ZWpYMgw8SLuPzdYhoe5hGzsF5REprY=;
  b=nkaEOr7IALyziY6Bank8MY+DJO/APexJZFvUzLLuEHC1ZjkB6s5VDNQN
   ebBWBIvk1RjeByY+WXFl0qolyoUBpJ6kUpoA78c4AsIFhElCdyxcZiiaP
   OYlPRpuSmfYBnp/RMgsErAiRTf9661BDde+xLdQczcjlEbRHIHIaTcUq0
   R3mSOp0r+0I22Z2Yzi+Pv0Ln8Q2zcJPJqNTofgUrcBoICoFEQNdoi6XqK
   C6HaoQhphnepdnd6S1x/uXJv0H/0nc5KdhD1oWXV2PXpXEeGTneBpdwGO
   gejXtNaohws9/tRAJNFB6eJR1BBXuRJn0kY5sMu63IQtRs8J+2E09ihnb
   A==;
X-CSE-ConnectionGUID: JzSzWtHLTG+D3YYD3ubIsg==
X-CSE-MsgGUID: CjsZm5j2RBaY2CmKloLWXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54794164"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="54794164"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:19:43 -0800
X-CSE-ConnectionGUID: dGbMR1j8TdmhS9rxagQjCw==
X-CSE-MsgGUID: xLq0CNzmQ4WBUagMvPXXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="113494582"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.95])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:19:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>
Subject: Re: typedef output question/issue?
In-Reply-To: <877c8w25sn.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e9d714fd-d034-4176-a2b7-50a72f80c8ad@infradead.org>
 <877c8w25sn.fsf@intel.com>
Date: Thu, 21 Nov 2024 13:19:37 +0200
Message-ID: <874j4025rq.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Nov 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 20 Nov 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
>> Hi,
>>
>> If I print a typedef in html (make htmldocs) from a .rst file,
>> I see:
>>
>> type dma_cookie_t
>>     an opaque DMA cookie
>>
>> Description
>>
>> if dma_cookie_t is >0 it=E2=80=99s a DMA request cookie, <0 it=E2=80=99s=
 an error code
>>
>> ~~~~~~~~~~~~~~~~~~~
>>
>> If I print the same typedef in man format, it says 'typedef' instead of
>> 'type', which is what I expect to see.
>
> I'm sorry, it's unambigous to me which one you expect.

*ambiguous, obvs!

>
>> man formatted output:
>>
>> Kernel API(9)                     API Manual                     Kernel =
API(9)
>>
>> NAME
>>        typedef dma_cookie_t - an opaque DMA cookie
>>
>> Description
>>        if dma_cookie_t is >0 it's a DMA request cookie, <0 it's an error=
 code
>>
>> November 2024                    dma_cookie_t                    Kernel =
API(9)
>
> How do you generate the man pages?
>
>> I am using python311-Sphinx 8.0.2-1.2-noarch from openSUSE.
>>
>> [internet search ...]
>>
>> The $internet says that one option is to install and use:
>> Add 'sphinx_autodoc_typehints' to the extensions list in your conf.py fi=
le.
>> I tried that but now I get:
>> Extension error:
>> Unknown event name: autodoc-process-signature
>
> The kernel-doc thing is not hooked up in the Sphinx autodoc processing,
> which is more geared towards Python. I presume sphinx_autodoc_typehints
> uses autodoc-process-signature which isn't there because the autodoc
> Sphinx extension isn't loaded, and even if it were, would not be called
> on kernel-doc handling.
>
>
> BR,
> Jani.
>
>
>>
>> Another option is to try a different theme so I reverted to
>> sphinx_rtd_theme but that didn't help either.
>>
>> Does anyone know a good solution to this?
>>
>> thanks.

--=20
Jani Nikula, Intel
