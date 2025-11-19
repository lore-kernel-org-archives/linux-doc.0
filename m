Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C4126158B;
	Wed, 19 Nov 2025 05:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763529497; cv=none; b=Lv3u2WPizoC3+wLvwnkGM2VnRFgrGovT9LuX+t+v1hhCz+lkeDAJArpuG1KaQoZrUOc6LQPMF3kWcc4g+1dTXw+3neHIx6vhlPRw/3UdToipzCPhK2joPgJOH0Oe7HgZsZ0Ibpsnrf6kxMv1d+rf3pajN5L6KyTDjo94jwL7Mqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763529497; c=relaxed/simple;
	bh=L2jFun4EM394wBii/Czo2nd8NGLGrFBOoa+OdxfAUjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbssySB9I7C7cm3yY6P9MNIznUtBlYpXhxssUuOm+3QPWWixDkO1XjIKTHMyN87MpCVqfb0sm5who6HSFdXtPrHm+YuoSVeGoGAnoSIPwmy5CdtuwIEI2kYEeso8AnLWrL5N0mrT5dPM1GgRtJ9CVAJu0WppzthnypErRWFHDjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=udK0drTZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="udK0drTZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=bz0BO6IuV0oUk9FNnOO/vbHcpu3Yn8rYoDL4dPvmLh4=; b=udK0drTZlVz+1nsOxx0z2cNTut
	Wxbywr2Pl7G2XeUG9grhuY9MPbEeRBQD6/NDCqW6ezBMMkFAL5QKlpJ3lp8KWMadtaTiZknn7FyIx
	rODAdimKzOnbjgaX66Nm87VSpRd/eIj2JcdBkcNYyKycNrGkYibCq06Fn1KD5uezuIYw/2vuytVbk
	apgIYBtSDmD87hUUTWWEbOIsgI1sQ6qJ4ZFZLQtLhBjld7gieVkkxqlDU55id5HmrJjtIXKv/HhRx
	kStf7anIYYMAAwmRPYztFPReN1Z6h0D5otxQi+h8ejE8W/g56LZ0yOeVcDZRM+1a4GpxOZA/mdQ/m
	oedJf6gA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLaZy-000000028ST-3DYD;
	Wed, 19 Nov 2025 05:18:07 +0000
Message-ID: <81442fc3-d8db-4446-8071-e72febceab69@infradead.org>
Date: Tue, 18 Nov 2025 21:18:06 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kernel-doc: add support for handling global
 variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
 <2d3108a03afc4e48de85835667f5875af97b6a38.1763291890.git.mchehab+huawei@kernel.org>
 <3a27a1ff-7277-43d5-b1f2-4b26ef5595ec@infradead.org>
 <20251118100237.46c7082a@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251118100237.46c7082a@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/18/25 1:02 AM, Mauro Carvalho Chehab wrote:
> Em Mon, 17 Nov 2025 22:59:24 -0800
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> Hi,
>>
>> On 11/16/25 3:23 AM, Mauro Carvalho Chehab wrote:
>>> Specially on kAPI, sometimes it is desirable to be able to
>>> describe global variables that are part of kAPI.
>>>
>>> Documenting vars with Sphinx is simple, as we don't need
>>> to parse a data struct. All we need is the variable
>>> declaration and use natice C domain ::c:var: to format it
>>> for us.
>>>
>>> Add support for it.
>>>
>>> Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
>>> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---
>>>  scripts/lib/kdoc/kdoc_output.py | 45 ++++++++++++++++++++++++++
>>>  scripts/lib/kdoc/kdoc_parser.py | 56 ++++++++++++++++++++++++++++++++-
>>>  2 files changed, 100 insertions(+), 1 deletion(-)  
>>
>> Thanks for the update. It's looking much better.
> 
> Great!
> 
>> I have a few comments/questions, all about typedefs.
> 

Hi Mauro,

I just noticed that in my sample init/kdoc-globals-test.c file
(I have s/global/var/ in it), there is one global var that is missing
or misparsed:

// from net/core/rtnetlink.c:
/**
 * var rtnl_mutex - historical global lock for networking control operations.
 *
 * @rtnl_mutex is used to serialize rtnetlink requests
 * and protect all kernel internal data structures related to networking.
 *
 * See Documentation/networking/netdevices.rst for details.
 * Often known as the rtnl_lock, although rtnl_lock is a kernel function.
 */
static DEFINE_MUTEX(rtnl_mutex);

This var is completely missing in the html output. In the man output,
it is rendered like this:

NAME
       static DEFINE_MUTEX - historical global lock for networking control  op‐
       erations.

SYNOPSIS
       static DEFINE_MUTEX;

Description
       rtnl_mutex  is used to serialize rtnetlink requests and protect all ker‐
       nel internal data structures  related  to  networking.   See  Documenta‐
       tion/networking/netdevices.rst   for   details.    Often  known  as  the
       rtnl_lock, although rtnl_lock is a kernel function.


-- 
~Randy

