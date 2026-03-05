Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE335DA70;
	Thu,  5 Mar 2026 21:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746016; cv=none; b=rkZg3BVmhcoXLKL82q5I7iGga0Njl+dctFCDtc4gSvaOaZXWSoZrVoe/Uspw1fr33sh41Zvi7Vf1alqNzFwdeVviTKd8VasiZX1Gfz1mhn2SMhZ/NeY4z4V2jfyuMIFoF9nasSAEDoNBqovEKI99Iwa+hgwPY3rFVsVCiCB1bIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746016; c=relaxed/simple;
	bh=iD1ugdy4XbORgVksUifPKd41kQW/M/+DNYCa3YgLHTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXMDJRYWNUGGE0SnndEmKXMKTvQ/RiHVI+/XRHNgI/npEApMm/rZwFS4SM/3G1t9b7sJ5qea+6gbkCALblSCHdFMOid55AbSGmOrejFjKfhNoZYmgyVB9KriSDrzFHm8Izu0J8ERDEK3iy7TFZ0DitX5gsX6e/ksYg9u2BCst1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ug9lAcQy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ug9lAcQy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JbbaphU/d1BJA2KazkvkpYO7r0IGk4H0CbY/uL0wE4s=; b=ug9lAcQyl9wJUgxup+L07qNR2O
	rOgz1R3qis+gC4OA0hbY23KvmEyBudui/6SKJOooGFvkSs6g2ddJggnYaXD8sPcsfllpYMD9RTpJe
	DIs1cW2XM0LUhLd6EYWBHEM0Z+6WITbcykkGUXZ8SJfC4AgUbp9BdX2r/BZXCyed0oz7YMjE4W4OU
	Y7SQmNuzvxaDtfVLbzJXCZmkvrKiEusekY1ubGDklRal/i7a4fh27ESKfjYfovcKpRdczdGhQDquG
	JUwTqPHlcCHVIIa87hGtqC0s2CZpQpjzNbOl5ECINkn2T8V5vCHLecUvBCJDZaOsK6/qV0QRYLCcS
	qpV/W3OQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGDb-00000002aS9-3JxJ;
	Thu, 05 Mar 2026 21:26:51 +0000
Message-ID: <23a6d1d8-5b72-4ed0-9281-b2d84d539324@infradead.org>
Date: Thu, 5 Mar 2026 13:26:51 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: fix '*' wildcard formatting
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>
References: <20260304224201.1072044-1-rdunlap@infradead.org>
 <1d96c26a14026c7f914e95fba1af10e7a2726bda.camel@perches.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <1d96c26a14026c7f914e95fba1af10e7a2726bda.camel@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/5/26 1:24 AM, Joe Perches wrote:
> On Wed, 2026-03-04 at 14:42 -0800, Randy Dunlap wrote:
>> It seems that these wildcards confuse some parser (docutils, sphinx,
>> or maintainers_include.py), so quote them to avoid this issue.
>> Also insert a hyphen ('-') before "all files" in several places
>> to make the html output easier to read.
>>
>> Fixes this htmldocs warning:
>>
>> linux-next-20260304/MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
> 
> I think there should be a better way than this.
> This just uglifies the perfectly readable ascii.
> 

Sure, we can just get along with this one warning. No problem.
Thanks.

>>
>> Signed-off-by: Randy Dunlap <[rdunlap@infradead.org](mailto:rdunlap@infradead.org)>
>> ---
>> Cc: Jonathan Corbet <[corbet@lwn.net](mailto:corbet@lwn.net)>
>> Cc: Shuah Khan <[skhan@linuxfoundation.org](mailto:skhan@linuxfoundation.org)>
>> Cc: [linux-doc@vger.kernel.org](mailto:linux-doc@vger.kernel.org)
>> Cc: Kees Cook <[kees@kernel.org](mailto:kees@kernel.org)>
>>
>>  MAINTAINERS |   10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> --- linux-next-20260304.orig/MAINTAINERS
>> +++ linux-next-20260304/MAINTAINERS
>> @@ -32,10 +32,10 @@ Descriptions of section entries and pref
>>  	   Type is one of: git, hg, quilt, stgit, topgit
>>  	F: *Files* and directories wildcard patterns.
>>  	   A trailing slash includes all files and subdirectory files.
>> -	   F:	drivers/net/	all files in and below drivers/net
>> -	   F:	drivers/net/*	all files in drivers/net, but not below
>> -	   F:	*/net/*		all files in "any top level directory"/net
>> -	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs
>> +	   F:	``drivers/net/``  -	all files in and below drivers/net
>> +	   F:	``drivers/net/*`` -	all files in drivers/net, but not below
>> +	   F:	``*/net/*``       -	all files in "any top level directory"/net
>> +	   F:	``fs/**/*foo*.c`` -	all *foo*.c files in any subdirectory of fs
>>  	   One pattern per line.  Multiple F: lines acceptable.
>>  	X: *Excluded* files and directories that are NOT maintained, same
>>  	   rules as F:. Files exclusions are tested before file matches.
>> @@ -44,7 +44,7 @@ Descriptions of section entries and pref
>>  	   X:	net/ipv6/
>>  	   matches all files in and below net excluding net/ipv6/
>>  	N: Files and directories *Regex* patterns.
>> -	   N:	[^a-z]tegra	all files whose path contains tegra
>> +	   N:	[^a-z]tegra -	all files whose path contains tegra
>>  	                        (not including files like integrator)
>>  	   One pattern per line.  Multiple N: lines acceptable.
>>  	   scripts/get_maintainer.pl has different behavior for files that


-- 
~Randy

