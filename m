Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC943159
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 03:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750910025; cv=none; b=Fvf/bRAGOhTO460cp1Zyf99sYk25MTmVi/uzwP/p/7BlMvvISfqzJmc7euKol1lo/yd2fIoxu+nu7rvkRVfivLY5VrZXDII0Jyx+VH3xfVS81UTTCzY0AUpkRIBtznG21TUDAX/vdysuJAXchk2xwMN8jSt/Eg96DHDtCXaqZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750910025; c=relaxed/simple;
	bh=ut8EIQxlm1pQ8/hGsUBupebkMfvnUeHH/WZnol2j4l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvrIj5IkHUR7BaaVGg3meqNzVbhbExVYlOlD05ZxENQBxt7XmQWCfH93Umq6CzLpb9umj1ly6JjyWyTtQZgjIxZp11wgLL3e4qTEpkUkUYNFuYAK7ik2Se+1DHxcUWFvDtG3LktOrQdVdInckzB5Xk7/Rq3p8pFgNZHT724Amyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fdygE7cl; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fdygE7cl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7a3smiZyWRzsmmBypjPQ7YNIm/v4QYUa3XfrwW0dEtg=; b=fdygE7clMAgWeRO65PF48IuFJ8
	fQI7czHJL/9bIYH6mHDJGKaKeWBFe1lCb3xNVLRKzp/p7fM5jcFfat7ISWlFeZCy7fGh9V+vkMRwx
	ARFh6mOZQoybo65hnVGpZ2btOVb/ep3jB942KEFC9rX6ZHDyXds+8GK5c9RJVI9qHJum27G7Dz6+G
	NuFclSHavavkc/GHhl9Ok2hWjKS4wYydFVV2OWAyiohcP5xnJJkXc2LL9GRVUB4wvZi9toubrOIcq
	vaeE/Io66vqkFHEelYnSFgaGuW56/8eHTsyVfG5/w4mOCGDESC8rVwJ2C4L0WF3uNVN11O1lVBY0I
	BKGvTQdg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdgB-000000061qq-0Ybm;
	Thu, 26 Jun 2025 03:53:40 +0000
Message-ID: <47a54d96-b38a-4f9c-aed7-437050c7f56d@infradead.org>
Date: Wed, 25 Jun 2025 20:53:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: make the KernelVersion field optional
To: Alison Schofield <alison.schofield@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>
References: <20250626024101.792073-1-alison.schofield@intel.com>
 <d45396b1-2579-477b-890e-830d52ac2581@infradead.org>
 <aFy_MoUTFVmNWC4C@aschofie-mobl2.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aFy_MoUTFVmNWC4C@aschofie-mobl2.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/25/25 8:32 PM, Alison Schofield wrote:
> On Wed, Jun 25, 2025 at 07:52:58PM -0700, Randy Dunlap wrote:
>> Hi,
>>
>> On 6/25/25 7:40 PM, alison.schofield@intel.com wrote:
>>> From: Alison Schofield <alison.schofield@intel.com>
>>>
>>> The KernelVersion field has limited practical value. Git history
>>> provides more accurate tracking of when features were introduced
>>> and target kernel versions often change during development and
>>> merge.
>>>
>>> Label it optional.
>>>
>>> Signed-off-by: Alison Schofield <alison.schofield@intel.com>
>>> ---
>>>
>>> Plan B is to remove the field entirely. 
>>>
>>>
>>>  Documentation/ABI/README | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/ABI/README b/Documentation/ABI/README
>>> index ef0e6d11e919..315fffe1f831 100644
>>> --- a/Documentation/ABI/README
>>> +++ b/Documentation/ABI/README
>>> @@ -46,7 +46,9 @@ Every file in these directories will contain the following information:
>>>  
>>>  What:		Short description of the interface
>>>  Date:		Date created
>>> -KernelVersion:	Kernel version this feature first showed up in.
>>> +KernelVersion:	(Optional) Kernel version this feature first showed up in.
>>> +		Note: git history often provides more accurate version
>>> +		info, so this field may be omitted.
>>
>> ISTM that ABI files and git history have different users/audiences.
>> Sure, KernelVersion may be incorrect (but close?), but telling a "user"
>> that they should install git and clone linux.git to determine the kernel
>> version is a lot to ask -- and then they need git instructions for how to
>> look up the kernel version.
> 
> Hi Randy,
> 
> Thanks for the user viewpoint.
> 
> As Dan mentioned, it was his feedback on my use of the field that
> inspired this. I poked around a bit to see if omitting was becoming
> common practice and found that in ABI/testing, 41% of the entries
> omit the KernelVersion field (1423 out of 3431), and it's the same
> 41% for all of ABI/.  That led me to believe this field is already
> being treated as optional by kernel developers.
> 
> I guess this is just shedding light on current practice. I have no
> insight into whether users are hollering about the missing KernelVersion
> fields. 

I see. Please continue with your patch then.

Thanks.

-- 
~Randy

