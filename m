Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3438A191F65
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723200276; cv=none; b=IiHFDRlLA6J2xKtOr12q8APLtrV9Uj9YHFE4wCE5Y+4UyqDy6io5tdxR2fMg1Jw8uk5yZboJr8luaFW5rsyJts+wuwXPDU2/5ZdpESEpI2sFlBZw1/Kp+/LpE98F0X68/lA5sTKZtlQ9R2X3flok+KGkFUSE1hOOj32KBV2l3sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723200276; c=relaxed/simple;
	bh=3m+JzrMFymn1hseJJlO+/uUN3xAN/dajin5z1ik7b5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaaOWFYLJwGd0puG/GHNggH1+lr5rN/O56VWietefj9N/fBHV4yxBbE8Eog99BaUEVDTD+UnAfINgdpk9iYq6JPMCATF0A07Ls5ioXlX50x0Pfg2WzYYdB33lSWU8SDDC2owszmNGBfGz5kCjrRLruA+BVc435PI0c3PM8gS9+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FBUT1tH5; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FBUT1tH5"
Message-ID: <25b4c3e0-784d-41ea-8ff3-8cb175983676@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1723200270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3m+JzrMFymn1hseJJlO+/uUN3xAN/dajin5z1ik7b5w=;
	b=FBUT1tH54L+WWit7FfwXs30PzwSpYyfUSVA8efZ/mYQs1zNYxl29BHQph91f6XfUeYg1Zx
	3uo6GQFQQIO/eQdkvqXIrtzc/OR2KhQez463hBzjNqE1JXFxd5jxby4cjYJ3tTG4gkRNZK
	RD8QLvYYVK4G3BVnfRQ4zIErM7YrrZM=
Date: Fri, 9 Aug 2024 18:44:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5] docs/zh_CN: Add dev-tools/kcsan Chinese translation
To: Haoyang Liu <tttturtleruss@hust.edu.cn>, Jonathan Corbet
 <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240807162720.46588-1-tttturtleruss@hust.edu.cn>
 <d6eec1da-0e79-432f-a5cf-7dc8c59f28c1@hust.edu.cn>
 <87r0b0th7l.fsf@trenco.lwn.net>
 <c4ffaae1-59a0-4837-a965-441af4851d2a@hust.edu.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: YanTeng Si <si.yanteng@linux.dev>
In-Reply-To: <c4ffaae1-59a0-4837-a965-441af4851d2a@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Haoyang,

在 2024/8/8 0:48, Haoyang Liu 写道:
>
> 在 2024/8/8 0:45, Jonathan Corbet 写道:
>> Haoyang Liu <tttturtleruss@hust.edu.cn> writes:
>>
>>> This is a mistake but I missed it before sending this patch.
>>>
>>> What should I do to revert or correct this patch?
>>>
>>> Thanks for your help and patience.
>> Send a v6 with the correction made - but wait a while for other reviews
>> first.
>
> OK.
>
The doc is good enough for me, so you can send a v6 after fix the typo.


Reviewed-by: Yanteng Si <siyanteng@loongson.cn>


Thanks,

Yanteng

>
> Thank you,
>
> Haoyang
>
>>
>> Thanks,
>>
>> jon
>
>
