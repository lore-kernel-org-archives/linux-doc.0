Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB2519D8A9
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734728384; cv=none; b=gLy+6NbXaoBzoURLpJJ57oyN/BwRSljxyJStNvSRTzzOTP122wqO8dLXRmMl3UoTl24OPTSsjrYilhrRm0DdQZd/cBrb6bhusEZUAMab/ZjP43OuXvCAwZbJUfylcz7K+GgCAfnJLa5ZLz6t5cOIHcCsr3xfcp7+f2aTwfGZ4AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734728384; c=relaxed/simple;
	bh=gBDcyFqaeLIuF8+dgxBErn1VxDylrAXeliFSsXYLf5s=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d0oTQY09O0U/K+12FquUY9HiECjWM5zFr8AGGWbaV3x+YH+9tU7dPRpNXMSLUNvvSDkJ7MZ9GoLF9SuI58wQN5H7kQKNmVqXqvEHJmxN/YDiPw5hGv2EflsWaHCtV65cMkl7w80WzVFUvWu0mXyQ8HD6TeKCBwAGxcCx6FxcTGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=osVWQ5FT; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="osVWQ5FT"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 805A8403FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734728375; bh=vnpkxElrRlYw9UpMbCSoQL8vR2Dd1nlb2PR91LQrZHM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=osVWQ5FTKGz+dacKPize3KZg2DJK24Km6eHQSTSHhKLqWhU0j7unv2wLf1tOTlORH
	 VMgGb4iznpTrfVg0vvV5zFhk5CmGiqp5g1fjQshB92wrqfMxw29w1XeQs+4s2gB9bW
	 BzyGB2nUVaXkKWM2G0yPRJlFil0oh7sATGXADaeGS+kHiLNLgGyrfzEzglSYuwSXvS
	 2fNBmwid2Cc/vYpobxddK7QUlAMYUIyohTqy6cmAO15I0CQv/KU4q/yYG1WKZomr+O
	 yfdhzCNAZYt03eATilxM9ILock2YTdA1WVKm73Av23Tu+PNrtBfvHo7z2vgYeyWZQ8
	 nvWncAXrt4W1A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 805A8403FB;
	Fri, 20 Dec 2024 20:59:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Randy Dunlap
 <rdunlap@infradead.org>, John Ousterhout <ouster@cs.stanford.edu>,
 linux-doc@vger.kernel.org
Subject: Re: Bug in kernel-doc ("-" misinterpretation)
In-Reply-To: <31a0a954-7d45-4ec1-ad55-50a788ddcbeb@oracle.com>
References: <CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com>
 <78b837e5-5fdf-47b3-8f83-824777ba0569@infradead.org>
 <31a0a954-7d45-4ec1-ad55-50a788ddcbeb@oracle.com>
Date: Fri, 20 Dec 2024 13:59:34 -0700
Message-ID: <87wmfum5op.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> On 20/12/2024 06:02, Randy Dunlap wrote:
>> On 12/19/24 10:37 AM, John Ousterhout wrote:
>>> kernel-doc gets confused by code like the following:
>>>
>>> /**
>>>   * define HOMA_MIN_DEFAULT_PORT - The 16-bit port space is divided into
>>>   * two nonoverlapping regions. Ports 1-32767 are reserved exclusively
>>>   * for well-defined server ports. The remaining ports are used for client
>>>   * ports; these are allocated automatically by Homa. Port 0 is reserved.
>>>   */
>>> #define HOMA_MIN_DEFAULT_PORT 0x8000
>>>
>>> It seems to use the last "-" on the line (the one in "16-bit") rather
>>> than the first one, so it produces the following false error message:
>>>
>>> homa.h:50: warning: expecting prototype for HOMA_MIN_DEFAULT_PORT -
>>> The 16(). Prototype was for HOMA_MIN_DEFAULT_PORT() instead
>>>
>>> There are similar problems if there is a ":" later on the line.
>> 
>> 
>> @Vegard, can you look at this, please?
>> I have already looked but didn't arrive at a solution.
>> 
>> 
>> It appears to be these lines in process_name() that are confusing the function name
>> and following description:
>> 
>>          # Look for foo() or static void foo() - description; or misspelt
>>          # identifier
>>          elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
>>              /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
>>              $identifier = $1;
>> 

That does indeed seem to do the trick, and gets rid of the warnings
provoked by .../homa.h.  Vegard, care to send a proper changelogged,
signed-off version?

Thanks,

jon
