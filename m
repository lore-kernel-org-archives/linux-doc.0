Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF95390C98;
	Mon, 30 Mar 2026 04:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774844312; cv=none; b=KR8XspKlO5IgB8DTdyMO5jWcdtShGVDhSFwWrarGg+zDQdk6zqjSIzJHiXZn7ZMEDX+gUTwNdUnyEPBXaCVd31YFBvjWjnQrFChHl4JYNxQ2ve7TyZ6rKVzMD0jzWUGbR/6IhM1tdVyyTlXWRpzM1UPPWexiBQxsKSB4xl1geLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774844312; c=relaxed/simple;
	bh=BeOtCXTMCB7YaaO1WBZF71yVhqEr3ar112uNfVOk5Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N84qNr4mCqGsABCuqwLH2Ie/CmEixrcrC+mq8I7jRtDcjRoJRSVRqLH2vAMd2Ds971MEkiJLWfosSX8kvhfcR/01Nki0BHArLz9O6+f/+6trY9o2fr3BPF0wlwdp6jMpAa7MxTXKKDFyQCXTqa9XK+PCFVKadOtAiTxRqPOiyEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J8kcADn4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J8kcADn4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=sgEMrjrD66wL+BwansuR9C1q0Xf/+QldV+6TTBn3FIw=; b=J8kcADn4FJBooep86FOm/F03ej
	iUppKOu28L4LhSL+8+X3P5b/QPYw8NrtH/Plj65cjjLeuf1+b8Y7Bm9PAJ5M118HINjH0G1nGgYEw
	K5wi+1jcvPDHUssDRsZw82ecZbIbZUiqiLZ5SuAKk2DX2az3CY9ygKwV0qEtE4JU7AM13e5mrxh4K
	UGrmaZQcqZXRcOVxbtZyU7ni1Kd0SgfrxK7vGkJVgoYaVKpJXPA8fpi3WNkDnTD2tSPAIZWgkn/yF
	3LVHlfrqujkqXCsy/S6hwy+tJxhxEe5pI8n9CcTlo5ZYzVLmtjIlx71ZsI34WtvH9bpCNH8PAerpw
	wHOrpikA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w744m-0000000AaxX-25OI;
	Mon, 30 Mar 2026 04:18:08 +0000
Message-ID: <a62ba774-dda4-4852-9a56-6bb9267feda9@infradead.org>
Date: Sun, 29 Mar 2026 21:18:06 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF0gZG9j?=
 =?UTF-8?Q?s=3A_kernel-parameters=3A_fix_architecture_alignment_for_pt=2C_no?=
 =?UTF-8?Q?pt=2C_and_nobypass?=
To: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>,
 Marco Elver <elver@google.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Askar Safin <safinaskar@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Sohil Mehta <sohil.mehta@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260326074658.1899-1-lirongqing@baidu.com>
 <b72c938d-1690-49f4-b617-916f24c3c53c@infradead.org>
 <16386e7715284b22b5f72e7106ed5619@baidu.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <16386e7715284b22b5f72e7106ed5619@baidu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/29/26 8:08 PM, Li,Rongqing(ACG CCN) wrote:
> 
> 
>> -----邮件原件-----
>> 发件人: Randy Dunlap <rdunlap@infradead.org>
>> 发送时间: 2026年3月27日 0:08
>> 收件人: Li,Rongqing(ACG CCN) <lirongqing@baidu.com>; Jonathan Corbet
>> <corbet@lwn.net>; Shuah Khan <skhan@linuxfoundation.org>; Andrew Morton
>> <akpm@linux-foundation.org>; Borislav Petkov <bp@alien8.de>; Peter Zijlstra
>> <peterz@infradead.org>; Feng Tang <feng.tang@linux.alibaba.com>; Pawan
>> Gupta <pawan.kumar.gupta@linux.intel.com>; Dapeng Mi
>> <dapeng1.mi@linux.intel.com>; Kees Cook <kees@kernel.org>; Marco Elver
>> <elver@google.com>; Paul E . McKenney <paulmck@kernel.org>; Askar Safin
>> <safinaskar@gmail.com>; Bjorn Helgaas <bhelgaas@google.com>; Sohil Mehta
>> <sohil.mehta@intel.com>; linux-doc@vger.kernel.org;
>> linux-kernel@vger.kernel.org
>> 主题: [外部邮件] Re: [PATCH] docs: kernel-parameters: fix architecture
>> alignment for pt, nopt, and nobypass
>>
>> Hi,
>>
>> On 3/26/26 12:46 AM, lirongqing wrote:
>>> From: Li RongQing <lirongqing@baidu.com>
>>>
>>> Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options
>>> doc into kernel-parameters.txt") introduced a formatting regression
>>> where architecture tags were placed on separate lines with broken
>> indentation.
>>> This caused the 'nopt' [X86] parameter to appear as if it belonged to
>>> the [PPC/POWERNV] section.
>>>
>>> Fix the formatting by placing the architecture tags on the same line
>>> as their respective parameters ('pt', 'nopt', and 'nobypass') and
>>> restoring proper indentation.
>>>
>>> Fixes: ab0e7f20768a ("Documentation: Merge x86-specific boot options
>>> doc into kernel-parameters.txt")
>>> Signed-off-by: Li RongQing <lirongqing@baidu.com>
>>> ---
>>>  Documentation/admin-guide/kernel-parameters.txt | 9 +++------
>>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt
>>> b/Documentation/admin-guide/kernel-parameters.txt
>>> index 03a5506..dc1c5bd 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -2615,12 +2615,9 @@ Kernel parameters
>>>  			Intel machines). This can be used to prevent the usage
>>>  			of an available hardware IOMMU.
>>>
>>> -			[X86]
>>> -		pt
>>> -			[X86]
>>> -		nopt
>>> -			[PPC/POWERNV]
>>> -		nobypass
>>> +		pt  	[X86]
>>> +		nopt	[X86]
>>> +		nobypass	[PPC/POWERNV]
>>>  			Disable IOMMU bypass, using IOMMU for PCI devices.
>>>
>>>  		[X86]
>>
>> This looks good as far as it goes, but there are still some problems IMO.
>>
>> These are all iommu= options, but iommu says that it's for [X86,EARLY].
>> No PPC/POWERNV mentioned there.
> 
> I think [PPC/POWERNV] should not be added to the main iommu= header. Since that header is already tagged as [X86, EARLY], adding PowerPC there would imply all subsequent options are cross-platform. Instead, it is cleaner to keep the main header as X86-specific and explicitly tag the individual nobypass option for [PPC/POWERNV]. This avoids the need to redundantly label every other X86-only option (like pt or nopt) within the section.
> 
>>
>> Then immediately following nobypass, there is this:
>> 		[X86]
>> 		AMD Gart HW IOMMU-specific options:
>>
>> which is also in questionable format. The [X86] isn't needed at all IMO, or if it's
>> desirable, those 2 lines should be on one line.
>>
> You are right , [X86] isn't needed , How about to remove the [X86], like below 
> 
>     Documentation/kernel-parameters: fix architecture alignment for pt, nopt, and nobypass
> 
>     Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options doc
>     into kernel-parameters.txt") introduced a formatting regression where
>     architecture tags were placed on separate lines with broken indentation.
>     This caused the 'nopt' [X86] parameter to appear as if it belonged to
>     the [PPC/POWERNV] section.
> 
>     Furthermore, since the main 'iommu=' parameter heading already specifies
>     it is for [X86, EARLY], the subsequent standalone [X86] tags for 'pt',
>     'nopt', and the AMD GART options are redundant and clutter the
>     documentation.
> 
>     Clean up the formatting by removing these redundant tags and properly
>     attributing the 'nobypass' option to [PPC/POWERNV].
> 
>     Fixes: ab0e7f20768a ("Documentation: Merge x86-specific boot options doc into kernel-parameters.txt")
>     Signed-off-by: Li RongQing <lirongqing@baidu.com>
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 03a5506..5253c23 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2615,15 +2615,11 @@ Kernel parameters
>                         Intel machines). This can be used to prevent the usage
>                         of an available hardware IOMMU.
> 
> -                       [X86]
>                 pt
> -                       [X86]
>                 nopt
> -                       [PPC/POWERNV]
> -               nobypass
> +               nobypass        [PPC/POWERNV]
>                         Disable IOMMU bypass, using IOMMU for PCI devices.
> 
> -               [X86]
>                 AMD Gart HW IOMMU-specific options:
> 
>                 <size>
> [Li,Rongqing] 
> 

Yes, LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy

