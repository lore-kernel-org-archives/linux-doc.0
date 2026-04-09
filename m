Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157F319857
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 01:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699777; cv=none; b=Pf0ARMEHrUyV9M6FXZmWlkGJWXOXbFCozwkNFBirCZOk1iWPOgec/VNsKt2qlrUCAS6kvwT7adkVpRvxNgBayininlgDHw58mAhUICMYf0+G83MwCvr011dww/GZq/Xf3RkkYU0ePbNAsj8xfBaYCvU0MvU8kd/ZamnlHz6xZi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699777; c=relaxed/simple;
	bh=AvuBKiDm+Lp1ocp27Omn0d7uHvE+DIipxV367+xv81U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzq193N9dkxTZZ0420Yg0/1iImHTnBGJNjcZG/pNpAYCY1RRoDF+n0XgII6++2zYWCFBdypqCAjOysIfFqAT9ZsaxXFJzmFNA9lJaHmFq1Dvy2nXJ9c6UK8nv7IkzJLmxxJaxEIUD/7ysdrH4exVy+WycWmqmQoZs3EFd4/xolQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z++eKhxR; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z++eKhxR"
Message-ID: <ea389ca2-8980-4022-a7d0-d96c913f671c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775699772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n31YwgANNxir0IqZ1AmWTsXElIZ9bdMo1T2ZdsadX0c=;
	b=Z++eKhxRA2Fx5lMqcc9QiWiaKIcOsEsIaqTo65xxhhAB1eEcdUlus0AgWBHz7JWp7YdmuQ
	lAx2vZTt4Q9xjLSYWqhFVk699bTbT7e4TgBO+TMySfVWZIAIfyMF+WznhPdBWXIbwHw8hQ
	5CbFC2X/WzxINA8aTk1aTBiDeHCd4vs=
Date: Thu, 9 Apr 2026 09:55:31 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] crash: Support high memory reservation for range syntax
To: Baoquan He <bhe@redhat.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Youling Tang <tangyouling@kylinos.cn>
References: <20260404074103.506793-1-youling.tang@linux.dev>
 <d584d383-1862-417d-9251-153d9bcf5626@linux.ibm.com>
 <adZYpnwOxgvFMLaT@MiWiFi-R3L-srv>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <adZYpnwOxgvFMLaT@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi, Baoquan

On 4/8/26 21:32, Baoquan He wrote:
> On 04/08/26 at 10:01am, Sourabh Jain wrote:
>> Hello Youling,
>>
>> On 04/04/26 13:11, Youling Tang wrote:
>>> From: Youling Tang <tangyouling@kylinos.cn>
>>>
>>> The crashkernel range syntax (range1:size1[,range2:size2,...]) allows
>>> automatic size selection based on system RAM, but it always reserves
>>> from low memory. When a large crashkernel is selected, this can
>>> consume most of the low memory, causing subsequent hardware
>>> hotplug or drivers requiring low memory to fail due to allocation
>>> failures.
>>
>> Support for high crashkernel reservation has been added to
>> address the above problem.
>>
>> However, high crashkernel reservation is not supported with
>> range-based crashkernel kernel command-line arguments.
>> For example: crashkernel=0M-1G:100M,1G-4G:160M,4G-8G:192M
>>
>> Many users, including some distributions, use range-based
>> crashkernel configuration. So, adding support for high crashkernel
>> reservation with range-based configuration would be useful.
> Sorry for late response. And I have to say sorry because I have some
> negative tendency on this change.
>
> We use crashkernel=xM|G and crashkernel=range1:size1[,range2:size2,...]
> as default setting, so that people only need to set suggested amount
> of memory. While crashkernel=,high|low is for advanced user to customize
> their crashkernel value. In that case, user knows what's high memory and
> low memory, and how much is needed separately to achieve their goal, e.g
> saving low memory, taking away more high memory.
>
> To be honest, above grammers sounds simple, right? I believe both of you
> know very well how complicated the current crashkernel code is. I would
> suggest not letting them becomre more and more complicated by extending
> the grammer further and further. Unless you meet unavoidable issue with
> the existing grammer.
>
> Here comes my question, do you meet unavoidable issue with the existing
> grammer when you use crashkernel=range1:size1[,range2:size2,...] and
> think it's not satisfactory, and at the same time crashkernel=,high|low
> can't meet your demand either?

Yes, regular users generally don't know about high memory and low memory,
and probably don't know how much crashkernel memory should be reserved
either. They mostly just use the default crashkernel parameters configured
by the distribution.

For advanced users, the current grammar is sufficient, because
'crashkernel=<range1>:<size1>[,<range2>:<size2>,...][@offset],>boundary'
can definitely be replaced with 'crashkernel=size,high'.

The main purpose of this patch is to provide distributions with a more
reasonable default parameter configuration (satisfying most requirements),
without having to set different distribution default parameters for 
different
scenarios (physical machines, virtual machines) and different machine 
models.

Thanks,
Youling.
>
> Thanks
> Baoquan
>
