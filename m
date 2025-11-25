Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F54670808;
	Tue, 25 Nov 2025 06:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764050456; cv=none; b=JIB/eq1Odv38dGvm5WDNd5X6lX4CvIBbOL294E3KCeFEsBM3FLjOJrEsJQBOlXT/RviQSk15w/4yW/76Y4XbLAOJX+WU6bF/cVTpIMssMgx5Ar6B2XMK/pjXIiJ9SHibrLBWnSLiggeC9mIRlM82tcDoG8a1HFLI9DKKkNawAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764050456; c=relaxed/simple;
	bh=jP3GYOpy3uZ8JHuIiKkAGlB9B0lTBVd7pOoMOEIxvkc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=r6jIYjgoR2xQDwfTOGmsYKmg83BN5kKMx8WRQ82K+tkOQ7GL9oSgkpJF1mZ7JuMubydmmFdvJH53rPmzwBG344V0jmvKtDcTlO+xT0TU8cJ3r0jlZtUdZHhP/Ht8+Wz8r44oKCsVPQ4lSkgajFmfkV1YM+XWULRbUHjrv9+i2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NUyZDhVH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NUyZDhVH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=IYjVAcW/bZrN/tmlzfFCXkMqYS6lh4z3oiIjQ6JrGoo=; b=NUyZDhVHciHqP91wj+dnerOMqG
	1+YeDnqK8kiKHAhYyKSiTgYv60IU7PT5YHpe19oCsjfno7iA8MYTOf1ge6cQSqbe4Y1aKrr6Ippd8
	iLgDEifQmtsaxq+OP4bT12BQE/hN8rugbzhH/YBYF4KTfq9eGd5+yDILDCpnwz5lmtJRPWvX7Kdi4
	beKaQvu4qRJYYOqYeb1AQeFNlSk7cbh+VKbY+vQYx2AaV+i1UhMNHXDbuFSdMZ69hp5Ly75dNLm4m
	PePxN7fnH+B8YFFVF17BAUoKZLTKxqtovngYf5fN9euo4kWC5GyhSwSgK5cvImwi+qRKoL8A1LCIz
	ttfH2kdQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNm6Y-0000000Cnrd-0TO9;
	Tue, 25 Nov 2025 06:00:46 +0000
Message-ID: <19bd0112-9735-49a9-8a5d-076fb0635514@infradead.org>
Date: Mon, 24 Nov 2025 22:00:45 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs: admin/kernel-parameters: Add trace_clock=tai
From: Randy Dunlap <rdunlap@infradead.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>, Feng Tang <feng.tang@linux.alibaba.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <kees@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Frank van der Linden <fvdl@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
References: <20251125053406.148219-1-zhangjian.3032@bytedance.com>
 <7222680d-2812-4aca-ad29-4b908c6ba676@infradead.org>
Content-Language: en-US
In-Reply-To: <7222680d-2812-4aca-ad29-4b908c6ba676@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/25 9:53 PM, Randy Dunlap wrote:
> 
> 
> On 11/24/25 9:34 PM, Jian Zhang wrote:
>> After CLOCK_TAI is added, add missing option trace_clock=tai.
>>
> 
> When/where is CLOCK_TAI added?
> Commit hash?
> Thanks.

I got it. Thanks.

commit 1ff3c9677bff
Author: John Stultz <john.stultz@linaro.org>
Date:   Thu May 3 12:43:40 2012 -0700
    timekeeping: Add CLOCK_TAI clockid

>> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 6c42061ca20e..fdbd2149f321 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -7452,6 +7452,7 @@
>>  			mono_raw - Use ktime_get_raw_fast_ns() for time
>>  				stamps.
>>  			boot - Use ktime_get_boot_fast_ns() for time stamps.
>> +			tai - Use ktime_get_tai_fast_ns() for time stamps.
>>  			Architectures may add more clocks. See
>>  			Documentation/trace/ftrace.rst for more details.
>>  
> 

-- 
~Randy

