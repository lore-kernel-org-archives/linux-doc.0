Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF81514CB
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728913232; cv=none; b=MRW3ZB5gIGJ4mBEC1kObuv+ZMjtKkQEOubaTJnJtQsPe+QG34N/pza9NuNO5FE/OcXL0RKjR9N00dbAGrPT8cwXJFpTdOeOVLGrOF7I/wTSZd3dEX0zA4RuTtgGEBx4y2ZnZPk+X2rmmANN27Ccam+X8psvBjUy86BTTP4tLvCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728913232; c=relaxed/simple;
	bh=WR/AzP9RtpsxSbDytzvhgAFTfK9x4nZWVAgWWb/KIvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuRWT98pbG+oBaH3Sd5spBDcJWcBIGfaD4yqSYwU5EAlhxSbUlvm9w6xijgbZST6DWZdnViPaTqJyWrLU0TURKiPZA2h3vNIokaHvmfu21r0Ox6LJTYWkoDgrQtZ6nSedsDcjVAYed6XrlzxM/CN5/QhTUDtUWJe5amtsIOz30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gszwSzl2; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gszwSzl2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VgEedW17Py+aOCShRuWodbNGyE3Npx99YcqXLaasT2I=; b=gszwSzl2choEaGrZ+1zGmD/zXc
	Td+0XyPQphCUz03uH6X8ZlqfwxGeF/Y0PS21RkUbmW2hB+irGZcSwokxBFajiIzppAXPGrUh01n2W
	22WbgyfTr5Ndsngm3/CQ4Hw6DraRP+15e/Brl4xh90lNDOv5YPeqH5Fg4xO4ZonOP3mjInm2SyTIX
	g4nEk8Bdf36yRukA4UFdWbMJza7Tbooyqx/xN1Mb22WnHrCaUnuu/+nd+I1o2YN3V4vQWGCZYF5IE
	6YU+yEWqizHAaDUIiHxKntHJjBMSxc3/top9+a16DUUouKlhYSroPVNDGNiq9aAhq427Zi7Pj+11W
	h1+WA8/w==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LJE-00000006M48-2aGa;
	Mon, 14 Oct 2024 13:40:29 +0000
Message-ID: <5c4a180a-9d69-4da6-8cca-0d413de13dfc@infradead.org>
Date: Mon, 14 Oct 2024 06:40:21 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kernel-doc: allow object-like macros in ReST output
To: Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org
Cc: Horia Geanta <horia.geanta@freescale.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20241014051333.462847-1-rdunlap@infradead.org>
 <c4c6b323-f541-4696-890b-2a852b761b39@suse.cz>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c4c6b323-f541-4696-890b-2a852b761b39@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/13/24 11:45 PM, Vlastimil Babka wrote:
> On 10/14/24 07:13, Randy Dunlap wrote:
>> output_function_rst() does not handle object-like macros. It presents
>> a trailing "()" while output_function_man() handles these macros
>> correctly.
> 
> Thanks!
> 
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
> To clarify, I assume this part only happens with my patch that motivated this?
> https://lore.kernel.org/all/20241009142936.56092-2-vbabka@suse.cz/

Sorry, I  didn't mean to imply that your patch causes this.
To be sure, I am rerunning the docs build with only my patch now.

> Also can you clarify whether these docs should look like:
> 
>   /**
>    * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> 
> per Documentation/doc-guide/kernel-doc.rst
> 
> or
> 
> /**
>  * DRM_GEM_VRAM_PLANE_HELPER_FUNCS - Initializes struct drm_plane_helper_funcs
>  *                                   for VRAM handling
> 
> as it is in the actual file include/drm/drm_gem_vram_helper.h
> i.e. if that "define" keyword is needed, or it doesn't matter?

OK, I'll check that also.

-- 
~Randy
