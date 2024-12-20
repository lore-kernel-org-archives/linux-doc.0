Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6EF9EC
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 05:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734671411; cv=none; b=i5GgEB1PFPesyS4CgwAkBKX5kLKeSyLaXDDhmcbQx6aG4QJge9tjm+2q6/WMTYvj9l0+eH0RxbnRCYPA0hWoQ3gixJaLCe+Mjau09mIMzKL7kbXWm+D0q0ZrUsZiyK5psDRtBHbl0gUpzx4REBkIW6KcsnpfBAf/8wOOAbUULI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734671411; c=relaxed/simple;
	bh=nQAuVVFgMoryM5wSVPpNXZp2p2Ic02XNphuALScgEHU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=DNfwbnAXfmB6v69dgCs/q3QiF4y43oUIyn66GErCk/rjU46lCEXPJSuIvQxL9bfDy4vXhmTjf7Rho8e9udfGXoxTO/hioTji2Ewx/079ZSqdT4Plhh4YkZEGpMOeyTqmv4+A6yp/E+aAAXVKZDObB5TuZDOyHbVxqTurQLDRVpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ueZmAnVG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ueZmAnVG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Cc:References:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DoEsuUFGI7Z01epZ4kmPxptjQYsVMT0ELivChMWjklI=; b=ueZmAnVGCNFyHFnUyjFj1l2lbo
	LHle4wpB6S2kjJ+wMv6lhvPt7xCU9tDNvpTVOmueDN8SIFMNrM3I1Svql2HqXHrsI6wLWoXPupsTQ
	z6G0/0pEVCaoA4brTjvXfuw/iFrolobOCYetpcAwAlpS58PXnAx98JdT+VUpwKA1YWJB9PAPYIe95
	5q9+QQG1GfOuXCsz395KfASjo4AwlPKotjQAYzaYyGmWRWmp/JGtQMGUiEAr6hm/v8G1fxiS4x2hV
	VXBY3oXoF3ToONNVQIXFFC57PSHMl0Ezb+KxDmRAYCO9leLRcxMNmCzuhZryn6NDPx1hbtClZ2etF
	t8+K3QOw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVH3-000000082SN-38Y6;
	Fri, 20 Dec 2024 05:10:06 +0000
Message-ID: <23b78991-59f6-4e6f-9caa-5ea4da394ef2@infradead.org>
Date: Thu, 19 Dec 2024 21:10:03 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in kernel-doc ("-" misinterpretation)
From: Randy Dunlap <rdunlap@infradead.org>
To: John Ousterhout <ouster@cs.stanford.edu>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com>
 <78b837e5-5fdf-47b3-8f83-824777ba0569@infradead.org>
Content-Language: en-US
Cc: Vegard Nossum <vegard.nossum@oracle.com>
In-Reply-To: <78b837e5-5fdf-47b3-8f83-824777ba0569@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[adding Vegard's email address ;]


On 12/19/24 9:02 PM, Randy Dunlap wrote:
> Hi John,
> 
> Thanks for the report. (I have confirmed it.)
> 
> 
> On 12/19/24 10:37 AM, John Ousterhout wrote:
>> kernel-doc gets confused by code like the following:
>>
>> /**
>>  * define HOMA_MIN_DEFAULT_PORT - The 16-bit port space is divided into
>>  * two nonoverlapping regions. Ports 1-32767 are reserved exclusively
>>  * for well-defined server ports. The remaining ports are used for client
>>  * ports; these are allocated automatically by Homa. Port 0 is reserved.
>>  */
>> #define HOMA_MIN_DEFAULT_PORT 0x8000
>>
>> It seems to use the last "-" on the line (the one in "16-bit") rather
>> than the first one, so it produces the following false error message:
>>
>> homa.h:50: warning: expecting prototype for HOMA_MIN_DEFAULT_PORT -
>> The 16(). Prototype was for HOMA_MIN_DEFAULT_PORT() instead
>>
>> There are similar problems if there is a ":" later on the line.
> 
> 
> @Vegard, can you look at this, please?
> I have already looked but didn't arrive at a solution.
> 
> 
> It appears to be these lines in process_name() that are confusing the function name
> and following description:
> 
>         # Look for foo() or static void foo() - description; or misspelt
>         # identifier
>         elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
>             /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
>             $identifier = $1;
> 
> Thanks.

-- 
~Randy

