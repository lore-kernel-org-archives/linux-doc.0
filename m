Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22C2524AA
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707816842; cv=none; b=IM2OWdJM/Cboq31BIlvDkdHtUNrIM5M4PavzDHNNKt3+BQc6QwdHbJ3CyEZ89AFHDg96IBwQpzZEgacJjYhc8YOgt1z8YqVnD3IxeABvCFcx0MirtAazTViSiUHu0NbEmg9BDcqBM6c7OWg9gd/kFeZZ6V+6Y0B5jVAxoEV4Lpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707816842; c=relaxed/simple;
	bh=K5q0KnKSxZ0dzQLWW4o5754poUPbxc23jBDSmjWgsSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QdLmQ0JZpd18DzRkwrarUDqWxTvcLObmWG99kBzvI/SMuNgX6Zxmd1NkeBx64Ymflo4UJu9MxkyLiVXQQ5j49Vvm4DMsNVVSnGPbcdFdTJJ1Je2aY8X7yZy744Q6dIxWmgT0aQKVuuIAcNGVlJb7fUhOiA8mz+8Y2sGB+kZbPS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbN2UAwG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbN2UAwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707816839; x=1739352839;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=K5q0KnKSxZ0dzQLWW4o5754poUPbxc23jBDSmjWgsSU=;
  b=QbN2UAwGTiFej/CTZzA/sQKkuRXt77jTUwE0VSxa7iekeRJmM8fXnxCz
   2nEAUNE3JsSEQavqZOYKxW9aXHhWOh5s3UBJ19Ozeq6004DhHrYSCZXcY
   IVTdC75BO53PsiueLtUT7BrNkm8vRDJupf8+hbDqQQYl0pXUaD65dHRfi
   orhf6MFaSijUTKJBAJuwxJJnymrBJvMnH12UJDxeXrOq6I/NN3be3jBbt
   iqZ7xjlDvVxr5RgG+xTMLTQeFDCoWHOM/WohFygT7rPamfrq79jm9eRoI
   QFTE47BXD3JvGvcD1A2NXZCsA4bc67EcZnc7ZVpiRMaWvG4BOcPbr1ARR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5648614"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="5648614"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 01:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="911744434"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="911744434"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost) ([10.252.44.50])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 01:33:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet
 <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: docs: "translations" extension breaks "make latexdocs" with
 6.1.3<=Sphinx<7.2
In-Reply-To: <8b51b6d6-0360-4f42-9b96-02e0ccd0b34f@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com>
 <37ecca9e-83f9-4f91-9b76-b5bd012dc3ee@oracle.com>
 <4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com>
 <875xyt8i67.fsf@meer.lwn.net>
 <8b51b6d6-0360-4f42-9b96-02e0ccd0b34f@oracle.com>
Date: Tue, 13 Feb 2024 11:33:53 +0200
Message-ID: <87jzn8908u.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 12 Feb 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> On 12/02/2024 22:52, Jonathan Corbet wrote:
>> Vegard Nossum <vegard.nossum@oracle.com> writes:
>> 
>>> On 12/02/2024 11:28, Vegard Nossum wrote:
>>>> On 12/02/2024 10:52, Akira Yokosawa wrote:
>>>>> While testing update of sphinx_pre_install WRT pyyaml, I noticed build
>>>>> errors in "make latexdocs" against Fedora 39's distro Sphinx (v6.2.1).
>>>
>>>> I think we can solve it by making 'current_language' a true element
>>>> attribute:
>>> [...]
>>>> This is probably more correct anyway.
>>>>
>>>> I'll test this more thoroughly with a full build as I think translations
>>>> won't show up when using SPHINXDIRS= (because the translation is outside
>>>> the source tree) as well as with older/newer Sphinx versions.
>>>
>>> In the end, that first patch caused errors on Sphinx 4.x
>>> ("TypeError: LanguagesNode.__init__() got multiple values for argument
>>> 'current_language'").
>>>
>>> This seems to work across 2.x/3.x/6.x/7.x for me:
>> 
>> It occurs to me that me we should just have conf.py just not load the
>> translations extension at all if the builder is not "html"?
>
> I think we need to, otherwise it will have one of those issues that were
> discovered during the original submission: if you 'make latexdocs'
> first, then 'make htmldocs', the Translations nodes just won't be in the
> saved doctrees and won't be there for the HTML output.

"Note that the current builder tag is not available in conf.py, as it is
created after the builder is initialized."

https://www.sphinx-doc.org/en/master/usage/configuration.html


BR,
Jani.


-- 
Jani Nikula, Intel
