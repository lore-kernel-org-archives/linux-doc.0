Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEE1C243C
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943163; cv=none; b=Qdzh8cqiYybh7cLao2LK5iQoCQUw5yRgo/8utQxMNM21HGOX8PpPHDidredeyK8hviCntyX/8QEsapE1h+1utK4SUdv6VdIyji7zJzPFptNKFMtqb0dScnh1IZK6S4oaFFdxB75J4L8fYYEzO29nsri5buH2aTJSd/JTEix2pfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943163; c=relaxed/simple;
	bh=Qj0xMZPhKZIiidjpPm8YFc7DNEEcN3eoRjGOuP7gZYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ndj3IZkVBe9V3ryssEQupd3l3yA0njTftpZ3cUtJm2nSVuGyCdWVaa2q5PtPjbBYOAzRMlvpzKga2EBm5k8tOjRTx1c2W2+tVIrCPWL7z1/zeiO/ho1JdtJt4j0wM3JfML/Ezf4j3ZyZpwq+ALPkQi6hjQS25Axtqvq11F6yFOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=izPI8soV; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="izPI8soV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wuLTLSxRZM/X/kUmbJ3xP9MBfWxvf4jNFZyGsn9YAAA=; b=izPI8soV6LY4mQUtcmcO8WGe+1
	QL0g+pYsSf/TzhpOnAaZbfNlL/VqSIJXb/CUpS0uU16wJdENM8/Xdem3dhrRQaFeLVOUSk9j4jXwD
	jyFaEuYGFpvLBE8Lwi+q3W5HwN1YRyvdi00vfsp0OQu3ofXbDs2Hm497n+bymWHrRSDQEDvXk9NTf
	ctkNzjo1A3VkwOkkcPZW/ZwbBVrurmQDMRAaIMEKlmNBFDoMwb9JcvhID2uiHDPqA1WVEL3y7HsFu
	3/V4uCY3lBmpk1uq2Wq4hJDnQBdG1pESHLeqLoI6EHtNdNPAtrScaPZ+8hiuVIyxvCs8PD8YneQ9q
	5O8MIAFQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t0T5v-00000006RTd-3E1P;
	Mon, 14 Oct 2024 21:59:17 +0000
Message-ID: <184785f4-0f0d-433d-840b-0efb7cdfb8fd@infradead.org>
Date: Mon, 14 Oct 2024 14:59:12 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kernel-doc: allow object-like macros in ReST output
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Horia Geanta <horia.geanta@freescale.com>,
 Vlastimil Babka <vbabka@suse.cz>
References: <20241014051333.462847-1-rdunlap@infradead.org>
 <87cyk2u1lu.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87cyk2u1lu.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/24 8:48 AM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> output_function_rst() does not handle object-like macros. It presents
>> a trailing "()" while output_function_man() handles these macros
>> correctly.
>>
>> Update output_function_rst() to handle object-like macros.
>> Don't show the "Parameters" heading if there are no parameters.
>>
>> For output_function_man(), do show the "ARGUMENTS" heading if there
>> are no parameters.
>>
>> I have tested this quite a bit with my ad hoc test files for both ReST
>> and man format outputs. The generated output looks good.
>>
>> However, I am seeing one problem that I don't have any idea about and
>> would appreciate some assistance, even just email commentary about it.
>> The output now includes around 100 warnings like these examples:
>>
>> Documentation/core-api/mm-api:37: ../include/linux/slab.h:154: WARNING: Inline literal start-string without end-string. [docutils]
>> Documentation/core-api/mm-api:37: ../include/linux/slab.h:192: WARNING: Inline literal start-string without end-string. [docutils]
> 
> That comes down to this in the kernel-doc output:
> 
>> .. c:macro:: DRM_SCHED_FENCE_DONT_PIPELINE
>>
>> ``DRM_SCHED_FENCE_DONT_PIPELINE ``
>>
>>    Prefent dependency pipelining
>>
> 
> Sphinx is, as we know, weird about white space, so the blank before the
> closing `` makes it unhappy.
> 
> The attached patch on top of yours makes it go away - but there are some
> other weird warnings, like:
> 
>> /stuff/k/git/kernel/Documentation/gpu/imagination/uapi:169:
>> ./drivers/gpu/drm/imagination/pvr_device.h:686: ERROR: Unknown target name:
>> "static_expr".
> 
> ...that I haven't been able to track down yet.
> 
> Thanks for working on this,

Oops, that is picky. Thanks for the fix.

> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 78373af6679e..aaf29b11b3bc 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -830,7 +830,7 @@ sub output_function_rst(%) {
>      my $paramcount = $#{$args{'parameterlist'}}; # treat -1 as 0
>  
>  	if ($func_macro) {
> -        $signature = $args{'function'} . " ";
> +	    $signature = $args{'function'};
>  	} else {
>          $signature = $args{'functiontype'} . " " . $args{'function'} . " (";
>      }
> 

-- 
~Randy
