Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B324167D
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 06:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315859; cv=none; b=trJuVXdMZO2/1N/ea67Dw9m/stLqtLI1tvWTBwCBoVuCWDbPc2jDE/9haSTF4SARy9yYwufXEn5u/vxtikWoHF4RtNFzp4D+tT2tWGwoGhN5DkEY0DYjj6wl4AOSXvMmHjBq6WL03HwUXDL1FaRwFXF6pR1NdfMGHlNgIvCI1K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315859; c=relaxed/simple;
	bh=8IIDDK0TWHOYI3fSLBoQCmJ6fjN78uxFkmVPhr+9kJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJ48eDXJOjWgDwmpjMgH8goKwEBwWd1lhSQoKq0KVOTM0zCC/BPEbERz19F35tYiUIs0J1vol6s8fIP8HvVZKgg3vrHeJ1MDJdnbvM/dqWSHvBiOY3L/HV9ZtY5REN2hpqrf83npDyegGjncswRcphgcU+8CwZgXxSZuIKaFUCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Zq1A1Cy8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Zq1A1Cy8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=4K2F56qD6nLe87Pk1G8I9Oe8WWd5ztieCSFZyW3Zkc0=; b=Zq1A1Cy8YfIfaqLZyy5aRyGeF3
	5cqrg/IjArvSVzT54N/2w5NwtzifkAGzkwNSWsN7rscCZoGWQ3hGkCNNScikbBrxxofa3XyKw42Ad
	vlUc4DOtqfTtaYidKs57lwBtdTjH/L3W0fUOZNZzStsEbGBXVlp2bYLuQ68pTTct2NBY0iAj2YVtd
	7Sm5MND+ZnFpkhBCbC0Fhk0QbTyTJbIfp3QLZppGBaDeTI00i2G4Qy9Qai30NfkL8WZspy2vCjMic
	QwqRSuFcPKoqC5BlLyvtSR+iyOX+NGqt8oEv4Tm/FeH7uO4PDjRZLyJqQlSXgQjTnW+viO3WSzWHS
	C8XGCR4g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS96d-00000007Vsg-2O9z;
	Thu, 19 Jun 2025 06:50:39 +0000
Message-ID: <c9a5d339-c016-4e9b-958c-d1bca091dfee@infradead.org>
Date: Wed, 18 Jun 2025 23:50:34 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250610
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>
 <20250616140450.79b3fedb@foz.lan>
 <6fcb75ee-61db-4fb3-9c5f-2029a7fea4ee@gmail.com>
 <20250619081622.33958218@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250619081622.33958218@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/18/25 11:16 PM, Mauro Carvalho Chehab wrote:
> Em Thu, 19 Jun 2025 11:22:19 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 

>>
>> Can you do so against docutils 0.19 only?
> 
> If we're willing to do that, IMO we need to do a more generic solution
> that will compare both versions and warn if incompatibilities are
> detected.
> 
> Something like the enclosed patch (it is against my latest conf.py
> patch).
> 
> Thanks,
> Mauro
> 
> ---
> 
> [PATCH] docs: conf.py: Check Sphinx and docutils version
> 
> As reported by Akira, there are incompatibility issues with
> Sphinx and docutils.
> 
> I manually checked that before docutils 0.17.1, yaml generation
> doesn't work properly. Akira checked that 0.19 is problematic too.
> 
> After check Sphinx release notes, it seems that the
> versions that are supposed to cope well together are:
> 
> 	========  ============  ============
> 	Sphinx    Min Docutils  Max Docutils
> 	Version   Version       Version
> 	--------  ------------  ------------
> 	< 4.0.0	  0.17.1        0.17.1
> 	< 6.0.0	  0.17.1        0.18.1
> 	< 7.0.0   0.18.0        0.18.1
> 	>= 7.0.0  0.20.0        0.21.2
> 	========  ============  ============
> 
> Add a logic inside conf.py to check the above, emitting warnings
> if the docutils version don't match what is known to be supported.
> 
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Closes: https://lore.kernel.org/linux-doc/6fcb75ee-61db-4fb3-9c5f-2029a7fea4ee@gmail.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 5eddf5885f77..6047ec85add1 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -9,7 +9,11 @@ import os
>  import shutil
>  import sys
>  
> +import docutils
>  import sphinx
> +from sphinx.util import logging
> +
> +logger = logging.getLogger(__name__)
>  
>  # If extensions (or modules to document with autodoc) are in another directory,
>  # add these directories to sys.path here. If the directory is relative to the
> @@ -21,11 +25,34 @@ from load_config import loadConfig               # pylint: disable=C0413,E0401
>  # Minimal supported version
>  needs_sphinx = "3.4.3"
>  
> -# Get Sphinx version
> -major, minor, patch = sphinx.version_info[:3]          # pylint: disable=I1101
> +# Get Sphinx and docutils versions
> +sphinx_ver = sphinx.version_info[:3]          # pylint: disable=I1101
> +docutils_ver = docutils.__version_info__[:3]
> +
> +#
> +if sphinx_ver < (4, 0, 0):
> +    min_docutils = (0, 16, 0)
> +    max_docutils = (0, 17, 1)
> +elif sphinx_ver < (6, 0, 0):
> +    min_docutils = (0, 17, 0)
> +    max_docutils = (0, 18, 1)
> +elif sphinx_ver < (7, 0, 0):
> +    min_docutils = (0, 18, 0)
> +    max_docutils = (0, 18, 1)
> +else:
> +    min_docutils = (0, 20, 0)
> +    max_docutils = (0, 21, 2)
> +
> +sphinx_ver_str = ".".join([str(x) for x in sphinx_ver])
> +docutils_ver_str = ".".join([str(x) for x in docutils_ver])


That ".". (2 times) is ugly. ;)  (needs spaces added IMO)
Is that compliant with PEP8?
I can't see that PEP8 addresses usage of . directly.  For some binary operators:
  Always surround these binary operators with a single space on either side: assignment (=),
  augmented assignment (+=, -= etc.), comparisons (==, <, >, !=, <=, >=, in, not in, is, is not),
  Booleans (and, or, not).
[https://peps.python.org/pep-0008/#whitespace-in-expressions-and-statements]

Thanks.

> +
> +if docutils_ver < min_docutils:
> +    logger.warning(f"Docutils {docutils_ver_str} is too old for Sphinx {sphinx_ver_str}. Doc generation may fail")
> +elif docutils_ver > max_docutils:
> +    logger.warning(f"Docutils {docutils_ver_str} could be too new for Sphinx {sphinx_ver_str}. Doc generation may fail")
>  
>  # Include_patterns were added on Sphinx 5.1
> -if (major < 5) or (major == 5 and minor < 1):
> +if sphinx_ver < (5, 1, 0):
>      has_include_patterns = False
>  else:
>      has_include_patterns = True
> 
> 

-- 
~Randy

