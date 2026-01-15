Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FBE3BF2E6;
	Thu, 15 Jan 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498308; cv=none; b=gtrTfYka5FNv855/ce5bQZ5162rkc7wuD3gnnEDkDVRL+1iOW5AHnzQLCkC3bEk2pCdsHy8mH+Y2mYmAxp9HIgshzkU/agWHy3rJnSfwImfWRt0wJtL8P3ahZtawNfyQRWv8h92xt+8Wg9NWxiQGQRParbm7F1R+nxCIu9v58xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498308; c=relaxed/simple;
	bh=fipIBUhmA8tW6kksPAM+qGV8JZQlKTQQwsZJoLAa3s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qG2bodE6oAsFnLC+Ca/Yhg5x8IyX1yeec6l4QWVsYAWexbKVlarUoIJdEOEqaDvZmiws1KlpO3B0CUQSKfgJLvpbDHYUPCDbbyFYe+GYIXFI2qV5Wv5xdUSKPqVAz6RnJf4DCLM/e8ZKdbN/IE7JnXi6Vz6vPSJ3tE6OgUjuj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FOG2W4WW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FOG2W4WW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=hMhblZ3EDuQznDOXy5jJiVzvOLpt/1Rd/6/oRN1eD4w=; b=FOG2W4WWU4m5sCf3LU/qlC2IC1
	OLmrqGQGL7SYfMSXo67jTu61Mpb9RRTgu9+lFS7kL6caNSW7FrYF4mEJf93naOF+7wKYxkxIlFLL+
	e2D/F3nfJG7M7/n+FhtK1okhmk/szyCRSLUh2saLYaSje8ivEiX7kpS8uBXs2z0ZSJX58mH9ul1n6
	ZkQ1hWim3rxCgeOCPE40UC1E19yEZnobearxOpBdKbm1glW8U2TVRvX/7qeFJmOzDf7J6PJ3715hj
	gvBVkEVRDOlbNiL+CLXGUALX4YiYkSf0yXoBvKsrG6JElpOl5tVx+ldS0+f8MD8A1I1QTAYaploXH
	+lqhRnTQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRCC-0000000CrJR-28NG;
	Thu, 15 Jan 2026 17:31:44 +0000
Message-ID: <8af04281-6cde-4903-8b30-3eea213d8ff9@infradead.org>
Date: Thu, 15 Jan 2026 09:31:44 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
To: Jonathan Corbet <corbet@lwn.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
 <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
 <87ecnquda3.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ecnquda3.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/15/26 7:05 AM, Jonathan Corbet wrote:
> Jani Nikula <jani.nikula@linux.intel.com> writes:
> 
>> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>>> Em Wed, 14 Jan 2026 12:24:31 -0700
>>> Jonathan Corbet <corbet@lwn.net> escreveu:
>>>
>>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>>>
>>>>> I do many of these on a regular basis:
>>>>>
>>>>> $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>>>>>
>>>>> Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?  
>>>>
>>>> Yes.  The tool moves, but its functionality remains unchanged.
>>>
>>> That's actually a good point: should we preserve a link on scripts
>>> pointing to ../tools/doc/kernel-doc? I suspect that a change like
>>> that could break some machinery on several CI tools and scripts
>>> out there. If so, it could be useful to keep a link - at least for
>>> a couple of kernel releases.
>>
>> I think the tool source should be called kernel_doc.py or something, and
>> scripts/kernel-doc should be a script running the former.
> 
> I honestly don't get it - why add an extra indirection step here?

a. compatibility with people in the wild running scripts/kernel-doc

b. adhere to well-known naming conventions.

-- 
~Randy

