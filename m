Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96325319879
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 19:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062610; cv=none; b=b4WRkx8lwM6EX3mM8e4dFTVj84sipBl7td4TRc4gBqPOUPzBIHzlQpW++rCBXZgmMMtwegtLd23FxH9fGeTPBSOsZeGIfVxVAzDMCCvb124WwucdabZlnOdkBJ2HXVSt/5FGEmchb3ocem9ywDJ8q0nF9ZF+cwD2318Z630wW9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062610; c=relaxed/simple;
	bh=hADdWybc/5PnqH0cGDKOuxrDxugbBqGYTQtlRmal8Sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOXkYl15v/TQHTYYbl6FRYi+dGA4iFljhJBcqzerAwpT8vaIuZG0rxaMIoZjpBv1bCh1yVpixrUNLYep/FJtMnOsQJh18OXNAqMvnj8u00c/Fp2px+Vn6UJUQH6msfI1zGogu2tPgRbEjzyJGfLMj0ENJK5qvCGW5o/gDp7oP9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EKGc0U6y; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EKGc0U6y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0z5xRciB1nwiYE36QR+wqCITtrSU3WTcv4Iqt7ZAWZ0=; b=EKGc0U6yz7EPH0kw9T5UsW60vh
	DRp6qRL9ib6SSJG67hVlAL+aVoeV2BYEs9bKryLwjBccTvicf4C/jVK43wN6/LysD7oA2x6KU/cAe
	n50LePzzMrZMMizyA5zTCaDhmwpFZ7auW2g3TVRxLSFZUijT+9K7nWmPKQsP1uKBKXPfqHZyeLjCw
	AlOHzm90LWNxNrSu6ZqAAprul+6EQBSVwPxbSbSvNSXxozrfT71VYo3dSd0Lrt41lTpzOcL10OETs
	erppIvKieetVwLud7nZsT4FsHMad3nuT+R1FXeT5vgGZim7mWtHGmx73UBEM8nRhsSSCl7amnkfWP
	P/OocU+A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd7g-0000000B1CD-09Zt;
	Thu, 13 Nov 2025 19:36:48 +0000
Message-ID: <c44d53e5-71ab-423e-95b4-1ddb08e40823@infradead.org>
Date: Thu, 13 Nov 2025 11:36:47 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] Documentation: use a source-read extension to include
 the index boilerplate
To: Jani Nikula <jani.nikula@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <cover.1762948491.git.jani.nikula@intel.com>
 <e404d14ad5e9ed0ddc3f8920efb5d156dff99021.1762948491.git.jani.nikula@intel.com>
 <qf6t4cbpurcssabychbtxplqv7metgglduu4soqjexfxs6ongy@yryw3bnk44y6>
 <5fc09cd5678000ccca68200d9f692376024e4b33@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <5fc09cd5678000ccca68200d9f692376024e4b33@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 12:12 AM, Jani Nikula wrote:
> On Wed, 12 Nov 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>> On Wed, Nov 12, 2025 at 01:56:54PM +0200, Jani Nikula wrote:
>>> Reduce boilerplate all over the place by adding a small ad hoc extension
>>> in conf.py that adds the ../sphinx-includes/subproject-index.rst include
>>> to all SPHINXDIRS builds.
>>>
>>> Note that the docname is just 'index', because the SPHINXDIRS builds
>>> happen in the subdirectories.
>>>
>>> Cc: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>>> diff --git a/Documentation/conf.py b/Documentation/conf.py
>>> index b9a43ee32a00..cb0936a71d52 100644
>>> --- a/Documentation/conf.py
>>> +++ b/Documentation/conf.py
>>> @@ -589,8 +589,14 @@ kerneldoc_srctree = ".."
>>>  # ------------------------------------------------------------------------------
>>>  loadConfig(globals())
>>>  
>>> +# Add index link to SPHINXDIRS builds
>>> +def add_subproject_index(app, docname, source):
>>> +    if app.builder.tags.has('subproject') and app.builder.tags.has('html'):
>>> +        if docname == 'index':
>>> +            source[0] += '\n.. include:: ../sphinx-includes/subproject-index.rst\n'
>>
>> The relative path there breaks SPINXDIRS, when it is pointing to use a sub-sub-dir
>> like:
>>
>>     $ make SPHINXDIRS=userspace-api/media htmldocs
> 
> Ugh, I looked at 'make help' for the "valid values for SPHINXDIRS",
> which only lists the top level directories. Patch 1 is also based on
> this.
> 
> What a surprise, the documentation for documentation is useless.

Yeah, I only found out recently that subdirs can be specified there.

-- 
~Randy

