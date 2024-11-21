Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F267114F10E
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732217324; cv=none; b=uJQZvX+HqOO5jmrGOEXqCa4N85/RDxhRg7+gw8w0iUEqbjGVuP2M85y00AhKkDj8FhgU7rFPGfgB9HjEcAq1ztuhi9I37YS3Bqb1PADR2fQd9wmiXUca24AuUe4GOd11jF8XO+gBHSR1rVBkZGvBHMo+RodvvEW9je+DmmksqGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732217324; c=relaxed/simple;
	bh=+6V14akftD7prwpfHiKrBHyvArY1TxIkZk4n4pHHE6Q=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FEIcIck0nNnbQmbFyfLudP52jj1qhdxt31o3HvMg2NWryeGSIHgLIpIFt71XkVxKWAwI6VnwnLxb3jiRoJXHRkyxjtxyr49b9pqjJ/AVWncohijh97Fo3SuQdOeiZgrta8uWXtLZiwkVGsPs0S8Mx70cIRviUOZtfjhoj/e+8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtzWAeMZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtzWAeMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732217322; x=1763753322;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version:content-transfer-encoding;
  bh=+6V14akftD7prwpfHiKrBHyvArY1TxIkZk4n4pHHE6Q=;
  b=ZtzWAeMZm51Mo+car/Lq/JyY7GdMuAyRAMUh3bRWgjqfzfeYiCr2bIqK
   CklMcYBl6UjhJV59kJPI758f/4oaiOCg73W9oxSU27Ekl2+iJayfEpgc/
   1T8Gi/FBukNKOi0l1EDMoQWhHprgsph6jwbRby40R0qEYp3yQkK5iUxjS
   ekmlq0LCmM00Z39/vB375QVqXAFU3LupJNMpqZhmoKP+mrk9UgfxynGmc
   Zk4gWqYD9nlSvtn3EQb1vtXAI4c4lKVES9mhWlQzmLjADcuc1UOsOLpIX
   /1vcBlZ/X8zzTaeLpkBRPGcdelM9DVMFXtT4B9T6nq7yBmfEMw/XZC7Ud
   g==;
X-CSE-ConnectionGUID: ojym7LK/Ra6gEHxWcTA14g==
X-CSE-MsgGUID: TkPUiJ+tRSOOAQAKywIB7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36018152"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="36018152"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 11:28:42 -0800
X-CSE-ConnectionGUID: k3A8TvAjQhy7Y2SSWbgfSg==
X-CSE-MsgGUID: A7CJlkgYTx6QmWXmwwqUIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="89989983"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 11:28:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>
Subject: Re: typedef output question/issue?
In-Reply-To: <9b7a43f5-5d04-4917-906b-707581b5a39e@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e9d714fd-d034-4176-a2b7-50a72f80c8ad@infradead.org>
 <877c8w25sn.fsf@intel.com> <874j4025rq.fsf@intel.com>
 <9b7a43f5-5d04-4917-906b-707581b5a39e@infradead.org>
Date: Thu, 21 Nov 2024 21:28:35 +0200
Message-ID: <87serkz8rg.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Nov 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 11/21/24 3:19 AM, Jani Nikula wrote:
>> On Thu, 21 Nov 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>> On Wed, 20 Nov 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
>>>> Hi,
>>>>
>>>> If I print a typedef in html (make htmldocs) from a .rst file,
>>>> I see:
>>>>
>>>> type dma_cookie_t
>>>>     an opaque DMA cookie
>>>>
>>>> Description
>>>>
>>>> if dma_cookie_t is >0 it=E2=80=99s a DMA request cookie, <0 it=E2=80=
=99s an error code
>>>>
>>>> ~~~~~~~~~~~~~~~~~~~
>>>>
>>>> If I print the same typedef in man format, it says 'typedef' instead of
>>>> 'type', which is what I expect to see.
>>>
>>> I'm sorry, it's unambigous to me which one you expect.
>>=20
>> *ambiguous, obvs!
>
> Sorry about that. I would like to see 'typedef' instead of 'type'.

Right, so looking into it, Sphinx actually has two forms for documenting
types, described at [1]:

.. c:type:: foo_t

.. c:type:: int foo_t

The former is simple, and becomes a generic "type" in rendered
documentation, while the latter can contain a "typedef-like
declaration", and becomes "typedef" in rendered documentation.

So, if you can make kernel-doc emit a proper typedef for the c:type
directive, the output will contain typedef, but otherwise remains just
type. Whether having the actual typedef declaration in the output is
something you also want, is a different matter.

The man page output doesn't go through Sphinx at all, and is just
whatever kernel-doc outputs.

HTH,
Jani.


[1] https://www.sphinx-doc.org/en/master/usage/domains/c.html#directive-c-t=
ype


>
> Thanks.
>
>>=20
>>>
>>>> man formatted output:
>>>>
>>>> Kernel API(9)                     API Manual                     Kerne=
l API(9)
>>>>
>>>> NAME
>>>>        typedef dma_cookie_t - an opaque DMA cookie
>>>>
>>>> Description
>>>>        if dma_cookie_t is >0 it's a DMA request cookie, <0 it's an err=
or code
>>>>
>>>> November 2024                    dma_cookie_t                    Kerne=
l API(9)
>>>
>>> How do you generate the man pages?
>
> One function or identifier (struct, union, enum, or typedef) at a time.
> Just for testing.
>
> $ scripts/kernel-doc -man -function function_or_identifier file | nroff -=
man | less
>
> e.g.:
> $ scripts/kernel-doc  -man -function dma_cookie_t  include/linux/dmaengin=
e.h  | nroff -man  | less
>
>>>
>>>> I am using python311-Sphinx 8.0.2-1.2-noarch from openSUSE.
>>>>
>>>> [internet search ...]
>>>>
>>>> The $internet says that one option is to install and use:
>>>> Add 'sphinx_autodoc_typehints' to the extensions list in your conf.py =
file.
>>>> I tried that but now I get:
>>>> Extension error:
>>>> Unknown event name: autodoc-process-signature
>>>
>>> The kernel-doc thing is not hooked up in the Sphinx autodoc processing,
>>> which is more geared towards Python. I presume sphinx_autodoc_typehints
>>> uses autodoc-process-signature which isn't there because the autodoc
>>> Sphinx extension isn't loaded, and even if it were, would not be called
>>> on kernel-doc handling.
>>>
>
> OK, thanks. I'll just try to ignore it. :(
>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>>>
>>>> Another option is to try a different theme so I reverted to
>>>> sphinx_rtd_theme but that didn't help either.
>>>>
>>>> Does anyone know a good solution to this?
>>>>
>>>> thanks.
>>=20

--=20
Jani Nikula, Intel
