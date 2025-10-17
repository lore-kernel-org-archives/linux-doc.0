Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1A0296BCF
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 17:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722040; cv=none; b=SrhbjBuWne23eXNR8c3QNn8Zqb7HYE6j5x3wyQORc1cWfqH8TYDml6khJF5uWTsy28BDi3qbhnRKla4iFwHtaCOHlt6o+JFldqhtGvYaASl1pY0qZaSP793j+xLZYLwgtXCGfY0vmHKD0PNea1JUlTs9A0mGpKCE3K1/pB7O6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722040; c=relaxed/simple;
	bh=Z4xZU+dMM63XhK7RAxIJix/VkYmtY9IuPNM7EAKtSgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbjH4LKGnzQZjE/RM7SaBIU3GYZkf6b+5Hm6njL1SCms422sJgFaDl6oHDxu/eY0GJzFBrpIqDSX64SObmXmK9Y9t6F9TzhYhnSnf+aWo/SGu1Q0beZmt/vaxYuT2Rye/G68nVOKU8Rnwd7FIAh8hfZyTx33zvT0C4dDg/3TFg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xqYEVVXL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xqYEVVXL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=CoOoPZjobDn5neMYar8x9k7M6FBkCMlKT8uIQtsjwxg=; b=xqYEVVXLSsa8V4vOHrSV97UTdc
	8Xb41iEfxP9Ay3L/3mHuUsLW2/CVFbsoahaSFiMfNcKMu+rC/FDu+F1cxSVB/U50Obxnn+RXc2JNk
	Sk0cjmZAG63qB0MDCtIosjNrtqhdnjxhZMNzNYomLNuvSvdXlxQHsOLGaMc1fcGseQf3mqdiB6Qo2
	dE5D+8+ATB31bq5ArWIc4wPMj9sgwSwtdT/T1sH7P4CFxOhJQPRVgPUYOLldyL0oDL0Pth2dRDMUJ
	VB1s8IJBldE7glsUBzDU75Q2xd8MQf+FWmxWiO1Rtd5iIw23jpFq7fPzNtka58r3J3g5nXy2BFloF
	lWFHElEg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oEX-00000008auR-3K5z;
	Fri, 17 Oct 2025 17:27:17 +0000
Message-ID: <3b625448-fce9-4be6-aada-f11c5c60cd4f@infradead.org>
Date: Fri, 17 Oct 2025 10:27:17 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: parse_headers.pl ?
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <9391a0f0-7c92-42aa-8190-28255b22e131@infradead.org>
 <87ikge6gts.fsf@trenco.lwn.net> <20251017054731.54fe573a@sal.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251017054731.54fe573a@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/17/25 1:47 AM, Mauro Carvalho Chehab wrote:
> Em Thu, 16 Oct 2025 08:50:55 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>
>>> Hi,
>>>
>>> Documentation/doc-guide/parse-headers.rst talks about some
>>> parse_headers.pl file but I cannot find such a file.
>>>
>>> Is there a replacement for this documentation?
>>> What should it be?  
> 
> Good catch!
> 
>> Mauro deleted it in aebcc3009ed5; clearly there's some docs work that
>> needs to be done to finish the job.
> 
> Yes, it was replaced with:
> 
> 	tools/docs/parse-headers.py
> 
> And its library:
> 	tools/docs/lib/parse_data_structs.py
> 
> The command line options changed a little bit: 
> - it doesn't have anymore a --usage
> - it gained a --toc option.
> 
> While it still does what it is documented there, it received some 
> improvements during the conversion, and has gained --toc.
> 
> I updated its documentation at the source code on both the library,
> with is about the same content of the .rst file.
> 
> Some of those changes are on a patch series not merged yet:
> 	https://lore.kernel.org/linux-doc/cover.1759329363.git.mchehab+huawei@kernel.org/
> 
> I'll seek for some time to update parse-headers.rst to reflect such
> changes.

Great. Thank you.

-- 
~Randy

