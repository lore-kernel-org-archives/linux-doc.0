Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF9D1B3927
	for <linux-doc@vger.kernel.org>; Thu,  5 Dec 2024 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385168; cv=pass; b=fNFPWf5DAPyGYPO1qWYQpTI//HapZY/PaWcEwUrlh/fXvlOBVI598U9E/9NOXbpSqGTJRCUnojPum6I0fUTg1uZFtSVRVAkJBSVQGmxYK5yEFou0PSxsIt52biSgO4BDRgRRKferQfZY7ZGDPLMcq1GiJ6ebMM9fn7GdQe4DVY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385168; c=relaxed/simple;
	bh=Wx8YXC+ZdEGptY0SCt82WoyMkDVrF1C6tht31WF7ObM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0kkeZobXLmuNAdXV3E1NhFSGZdncemVCzw5zKQgE2dLg7mDBgMWu6k8axgur+88fr78HASylgUJJ4RKcSuIYG2LJl0h/KWoiZMd5wJbFo0h0KWZGqpCM1bL3xV7JmAHlVP392qG4tFZx9053mBeJwhnLp6Fe3rNtPx+PLFWr/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=S3moVIXL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="S3moVIXL"
ARC-Seal: i=1; a=rsa-sha256; t=1733385160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D3ngBROUYWjbue4dkbtsXKjI0AtdnPFprFXUIF8xaUhtjMMIXTl3RL9D7LSmWKbvbuJxkxvf0O3qRGRb8RpkOibkeGGTnqjYSUcAisgTeNCgvXjAGjNDHISzTyuGgF3anVspeKExMKb41W8TvLAe6Hreko/RUXpjna5JMUvvGM8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733385160; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8PuVKIgvSHPFRZfTFVoLxyP5726FmqXWQQMPzTyY4WQ=; 
	b=HtQO3jZhqAn1VU87NdZ4s5qfsKDniNQAbPeeetQPuXMRzVqaZnqQkosWlM4QZnfoqNnpk629VbuTSROVE5hFNkbZDhOTk/ofVsG3PDJzZfxDTOoauHZL+Q8aYCZ/HMwZwX8ViVKb6y5d3KanlM0DZuxTvXfCase4bE1pvEB57E8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733385160;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=8PuVKIgvSHPFRZfTFVoLxyP5726FmqXWQQMPzTyY4WQ=;
	b=S3moVIXLq6t7BMRZf5ieH9G0ixdabcI/AlU7OMUOMh0DuJOPaCjI+0PLUtpk3YKg
	MvigKe54Gc1wrW8nHd5iPbPx5czHRCAGuauaqNCld0bszXgeHtuEccBNQAiADkE5Icr
	tbOzuG9K9Vb3pDQJNkzw6/arg1njWkqXrKMacBSw=
Received: by mx.zohomail.com with SMTPS id 1733385159287453.3726781953336;
	Wed, 4 Dec 2024 23:52:39 -0800 (PST)
Date: Thu, 5 Dec 2024 08:52:35 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: move kgdb.rst from dev-tools to process/debugging/
Message-ID: <20241205075235.mfa6s2c7hru5otfb@basti-XPS-13-9310>
References: <a81c6e57-46ff-4347-9ddc-2cf566065b11@infradead.org>
 <20241202094154.3yrbqiinlpkqn65b@basti-XPS-13-9310>
 <dc993ea5-15ad-4780-9ccf-206224efe027@infradead.org>
 <20241204074746.mmvwyfbx6ausy5tk@basti-XPS-13-9310>
 <e159926f-32a8-42d5-8e7f-5aa84617bee2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <e159926f-32a8-42d5-8e7f-5aa84617bee2@infradead.org>
X-ZohoMailClient: External

Hey Randy,

On 04.12.2024 14:19, Randy Dunlap wrote:
>Hi Sebastian,
>
>On 12/3/24 11:47 PM, Sebastian Fricke wrote:
>> On 03.12.2024 13:42, Randy Dunlap wrote:
>>>
>>> On 12/2/24 1:41 AM, Sebastian Fricke wrote:
>>>> Hey Randy,
>>>>
>>>> On 30.11.2024 00:10, Randy Dunlap wrote:
>>>>> Hi,
>>>>>
>>>>> It seems to me that documentation for kgdb should be in the new /debugging/
>>>>> sub-directory [or that all of /debugging/ should be under dev-tools].
>>>>>
>>>>> Same treatment for gdb-kernel-debugging.rst.
>>>>>
>>>>> Any comments about those?
>>>>
>>>> Thanks I have overlooked these files, but yes I would say these are good
>>>> candidates for the new debugging directory. And then we can link those
>>>> pages into the userspace debugging advice guide.
>>>
>>> I'm working on this move unless you want to do it.
>>
>> Yes please go ahead :).
>>
>>>
>>> I don't think that we quite agree on adding links to kgdb & gdb into the
>>> userspace debugging advice guide. I would prefer to see them in the
>>> driver development debugging guide or only listed in debugging/index.rst.
>>
>> Well within the driver development debugging guide I have written the
>> following in the introduction:
>> ```
>> While this guide focuses on debugging that requires re-compiling the
>> module/kernel, the :doc:`userspace debugging guide
>> </process/debugging/userspace_debugging_guide>` will guide
>> you through tools like dynamic debug, ftrace and other tools useful for
>> debugging issues and behavior.
>> ```
>>
>> I would say your right about KGDB as that requires you to recompile with
>> something like:
>> ```
>> # CONFIG_STRICT_KERNEL_RWX is not set
>> CONFIG_FRAME_POINTER=y
>> CONFIG_KGDB=y
>> CONFIG_KGDB_SERIAL_CONSOLE=y
>> ```
>> But for GDB you only need to activate debug info, which is not just
>> useful for GDB and it is a debugging method that you do from userspace
>> with a userspace tool, which to me sounds very fitting for the userspace
>> debugging guide.
>>
>> But I am happy to hear your arguments if you feel like I misjudge this.
>
>For now I prefer to just have these 2 files listed in the debugging index file.
>
>We can add references somewhere later...

Sounds good!

>
>thanks.
>-- 
>~Randy
>
Regards,
Sebastian Fricke
