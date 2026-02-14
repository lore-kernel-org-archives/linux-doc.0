Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4542A9D;
	Sat, 14 Feb 2026 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771091739; cv=none; b=d+VsEVpxzqBneddHc4YXfYXX9Mw15eeLWaHQ3ynmYb/cTuMpUxQllQ3xtllvb3P9jr3UZAWYGKgaOWdkU9qPZ5WoawGghmalNxOFKhpK+PLGdeEb9v9uLPBhD/po/EJX+YaXeayfxbb9qx0bvpubNvBFE+DX+54dMH4tnJdjeF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771091739; c=relaxed/simple;
	bh=8k9p35h4k1nHlxAsWZiTzXWplhkVW7scDXKOelaLXoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCIPrF2QIAp1QFMEt7/I2wbOEnZ7/5sL3GYs5gWji/HD0Xm86mY2/Thvf+ZxIiVDnC9gOx3UlrzW0WkrX5tsueWh1dHGhiURHnjAFF7V+14FMzoEteqPfAG8tenBy+9ILiXoc6y0Da3So0VwnSPNsqfcT0EZNJQXh9DaCEmTFm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g9JeU5hR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g9JeU5hR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZXyKMHp2eF9MbF3RSLLokv0H96duorRO1W4c3XjM0U4=; b=g9JeU5hRSv8Cxbkc4GMpENLkoq
	Juy8SXTbJEOW7szrX//LL/iHgXvnL2W2pXzrzCouW80ngIQUuhAsK+Edx+N5kL/etVfoft8+5LHVG
	tfqH+rIO1AUqFJ4Oz05ewF+Br7opcfriREBgK5ni4ixyD0Iq8fY7RFUBy++Cmikxs1Bf0tNFWXtNx
	qUKtYIR9Yn1BN1CKGssLWb8DU7O/xVSUkngqgP63AjtOHQprz+Z3xWm0GZtcnYmUmAojhQH9ewhzV
	09/Esk3l7a1mkZ4605BnYl3yDJ4vYFeK/Mz79xKLM4mAvE1MrDmGCuhmgza7LHykYGSdKB5ORiqNO
	4G748meg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrJrg-00000004orp-3ECM;
	Sat, 14 Feb 2026 17:55:32 +0000
Message-ID: <156baf88-cd00-4bbc-917a-0b1b9b79b2cd@infradead.org>
Date: Sat, 14 Feb 2026 09:55:32 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: clarify wording in programming-language.rst
To: Jonathan Corbet <corbet@lwn.net>,
 Ariful Islam Shoikot <islamarifulshoikat@gmail.com>,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260214132842.1161-1-islamarifulshoikat@gmail.com>
 <87ms1bqmh0.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ms1bqmh0.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/26 9:11 AM, Jonathan Corbet wrote:
> Ariful Islam Shoikot <islamarifulshoikat@gmail.com> writes:
> 
>> Clarify that the Linux kernel is written in C and improve
>> punctuation in the clang sentence.
>>
>> Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
>> ---
>>  Documentation/process/programming-language.rst | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
>> index f39d1d3dd9ce..c18e307ccb56 100644
>> --- a/Documentation/process/programming-language.rst
>> +++ b/Documentation/process/programming-language.rst
>> @@ -3,10 +3,10 @@
>>  Programming Language
>>  ====================
>>  
>> -The kernel is written in the C programming language [c-language]_.
>> -More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
>> +The Linux kernel is written in the C programming language [c-language]_.
>> +More precisely, it is typically compiled with ``gcc`` [gcc]_
>>  under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11.
>> -``clang`` [clang]_ is also supported, see docs on
>> +``clang`` [clang]_ is also supported; see documentation on
>>  :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
> 
> So you have tidied up the language, but not addressed the fact that the
> information is somewhat outdated.  Clang is a first-class option these
> days, and the documentation should probably reflect that.
> 
> Oh well, I've applied this as a good start :)


Maybe mention Rust as well?
-- 
~Randy

