Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1FF1D4154
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943247; cv=none; b=upVtlKbjNGAW0Sxv9SI3aFBhrgayixmEdziEqg+AAQtg/T/maVCrYtigRk5Rk5EQnxP+QtHTcWPeD0IsLvTZsAVZUKAnLWFKPzRpPCDZVzhgavDrPX39GBaMlZI1qobVyHEB7KGkLTeyYos3DQc/NbxanOzhmgc6iMSp5M9Mrrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943247; c=relaxed/simple;
	bh=eF461b4NEbYQ0XOU+2Mt/axX2yy097CzoJ5Pj39UOzc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YLeTbvrPsOpD2f/LjynGR+8uhlc4ix6VEPhnaaCmzTO3ZPNXM1xDQEXOUyWJ0Tbg8JbjVI42nY5Ds3+HuTdVenFzme4kpnL1gNIcAsIiJ5XWHVTkTUIySiz+xI6paqAHw8utA56EgYBvIzbG3chTJmZ+uZyi9ibcitOqsM1Eqeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JVm81Zbx; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JVm81Zbx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7zYARNQkaRegS+0XdqD48mzK1v6dFx6Cg83CkHiVdgA=; b=JVm81ZbxchhIZPptM8RkyJTXrX
	d3RM1tabzYmb7cN56HRr46+//j4L4brSBe6rl0ob/PO8MPiR2khgCsblDUyGZJugep0+5cdkzA76W
	FBZCHlG1o+ZGArilng5IlIH/n6Ar1mPno0oDyzUSFWy6CXOUz1nxQbojzWX/JRcaSD5SJkR1Z8ksh
	b8OqIxGhGEzQsWj8mr9HJLI/G+HNDb1cNtZMNhnPKGnIGx2W5vXs7oPtaNA2+zTPQ9r2G5kqocH1T
	s3KgTbH3YS00rj5uc0RHDfH1EB0CzBYp9nKCznoBy6EQPRxW45FQnstWixKJdf1Bg/xdlxefv3woa
	5O36piEQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t0T7L-00000006RUN-0Ump;
	Mon, 14 Oct 2024 22:00:43 +0000
Message-ID: <75d99b04-3925-45b8-9aa3-a2cc935dd971@infradead.org>
Date: Mon, 14 Oct 2024 15:00:40 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kernel-doc: allow object-like macros in ReST output
From: Randy Dunlap <rdunlap@infradead.org>
To: Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org
Cc: Horia Geanta <horia.geanta@freescale.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20241014051333.462847-1-rdunlap@infradead.org>
 <c4c6b323-f541-4696-890b-2a852b761b39@suse.cz>
 <5c4a180a-9d69-4da6-8cca-0d413de13dfc@infradead.org>
Content-Language: en-US
In-Reply-To: <5c4a180a-9d69-4da6-8cca-0d413de13dfc@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/24 6:40 AM, Randy Dunlap wrote:
> Hi,
> 
> On 10/13/24 11:45 PM, Vlastimil Babka wrote:
>> On 10/14/24 07:13, Randy Dunlap wrote:
>>> output_function_rst() does not handle object-like macros. It presents
>>> a trailing "()" while output_function_man() handles these macros
>>> correctly.
>>
>> Thanks!
>>
>>> Update output_function_rst() to handle object-like macros.
>>> Don't show the "Parameters" heading if there are no parameters.
>>>
>>> For output_function_man(), do show the "ARGUMENTS" heading if there
>>> are no parameters.
>>>
>>> I have tested this quite a bit with my ad hoc test files for both ReST
>>> and man format outputs. The generated output looks good.
>>>
>>> However, I am seeing one problem that I don't have any idea about and
>>> would appreciate some assistance, even just email commentary about it.
>>> The output now includes around 100 warnings like these examples:
>>>
>>> Documentation/core-api/mm-api:37: ../include/linux/slab.h:154: WARNING: Inline literal start-string without end-string. [docutils]
>>> Documentation/core-api/mm-api:37: ../include/linux/slab.h:192: WARNING: Inline literal start-string without end-string. [docutils]
>>
>> To clarify, I assume this part only happens with my patch that motivated this?
>> https://lore.kernel.org/all/20241009142936.56092-2-vbabka@suse.cz/
> 
> Sorry, I  didn't mean to imply that your patch causes this.
> To be sure, I am rerunning the docs build with only my patch now.

Yes, with just my patch this problem is still present but I will now
test Jon's patch.
> 
>> Also can you clarify whether these docs should look like:
>>
>>   /**
>>    * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
>>
>> per Documentation/doc-guide/kernel-doc.rst
>>
>> or
>>
>> /**
>>  * DRM_GEM_VRAM_PLANE_HELPER_FUNCS - Initializes struct drm_plane_helper_funcs
>>  *                                   for VRAM handling
>>
>> as it is in the actual file include/drm/drm_gem_vram_helper.h
>> i.e. if that "define" keyword is needed, or it doesn't matter?
> 
> OK, I'll check that also.
>

still pending.


-- 
~Randy
