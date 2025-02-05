Received: from mail-m32102.qiye.163.com (mail-m32102.qiye.163.com [220.197.32.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415C9227BB6
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736704; cv=none; b=jEbLymhLPZCJj9Hq5MSdT+svqSWirJNJ0H1jKxtvF5ed5LC7GlgBsD+baNqDvkbzKquOYNJsVmaRR8IWQDHTpdpyK1eua8YVPb+lKXD+p2H6a+ZThhDV6x1AHEpU1PmhyP2dDvBABU8Lc3bH0c6BtGqf+LQ+5GwFLiXbXwsqagw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736704; c=relaxed/simple;
	bh=giZTeZNEpaF4NbqB2StZbjy4VQpeJe89YV5NlQErC3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wi8KA77IH6O5gWxDk5AWOVJJUbBY9ImKVAdRJH3n3G7Ld/6rcTEtFl/QMGh1yCbd1a1TJ3/Crt3ngu2q+FN5HX4EG4UUJXk5JYtZn4DIAWavoF9lcAPgM/QAkS5azB1qupX9wBNc4b4o0x7hudMQtJ28ws0DdPofa7oIiB4VnQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=MQvMVzNQ; arc=none smtp.client-ip=220.197.32.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="MQvMVzNQ"
Received: from [192.168.5.122] (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a34e3153;
	Wed, 5 Feb 2025 14:19:48 +0800 (GMT+08:00)
Message-ID: <1a2cd639-01a5-44d6-969f-f95085d98ffc@cqsoftware.com.cn>
Date: Wed, 5 Feb 2025 14:19:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: zhangwei@cqsoftware.com.cn
Subject: Re: [PATCH v2] docs/zh_CN: Add self-protection index Chinese
 translation
To: Yanteng Si <si.yanteng@linux.dev>, zhaoshuo@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn
Cc: zhaoyuehui@cqsoftware.com.cn, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org
References: <20250121051234.79066-1-zhangwei@cqsoftware.com.cn>
 <82025758-b993-47aa-a8fe-7ed6cf5a5def@cqsoftware.com.cn>
 <87y0ylfy2q.fsf@trenco.lwn.net>
 <a495ae39-9121-410a-b881-35e6b0b22dff@linux.dev>
From: zhangwei <zhangwei@cqsoftware.com.cn>
In-Reply-To: <a495ae39-9121-410a-b881-35e6b0b22dff@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSEgYVkxOSUtKGE5DHx1JHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94d4c3ca8403abkunma34e3153
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ny46Tyo6ODITMAsBKDQOITcc
	MxUaFEtVSlVKTEhDTEhNSENCTUhPVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSk5PSzcG
DKIM-Signature:a=rsa-sha256;
	b=MQvMVzNQSZ8HLCe28jZiIDE2V8VYoXtTDZXw5YJkOTi/uKcD4nC40cztLJkXiulTydQtma7Sd6fTPSl69vtP/NvSjKRAXkWu71RaouPu0xY8fShlqHlHBoiPnufQY0hBOnESh43ljy8cmbiPnCXzogsR942TH6vbOEpC6h3citc=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=TlgmQPa66V/KAeTRaPZ4R45uf8am7ESWGoZf1TJ7zhc=;
	h=date:mime-version:subject:message-id:from;


在 2025/2/5 14:16, Yanteng Si 写道:
> Hi, Zhang Wei, Zhao Shuo,Yu Xian,
>
>
> 在 2025/2/5 00:56, Jonathan Corbet 写道:
>> zhangwei <zhangwei@cqsoftware.com.cn> writes:
>>
>>> 在 2025/1/21 13:12, zhangwei 写道:
>>>> Translate .../security/self-protection.rst into Chinese.
>>>>
>>>> Update the translation through commit b080e52110ea
>>>> ("docs: update self-protection __ro_after_init status")
>>>>
>>>> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
>>>> ---
>>> Hi, jon
>>> Please apply Zhao Shuo's patchset first, and then apply mine.
>>> https://lore.kernel.org/linux-doc/cover.1737603330.git.zhaoshuo@cqsoftware.com.cn/ 
>>>
>>> <https://lore.kernel.org/linux-doc/cover.1737603330.git.zhaoshuo@cqsoftware.com.cn/> 
>>>
>>>
>> I did that, but yours still fails to apply.  Can you send me a respin
>> against docs-next, please?
> It seems that you plan to translate all the security documents.
> I've noticed that there are still two directories left untranslated.
>
> To avoid conflicts, Zhang Wei, would you mind creating a v3 like this:
>
>    docs/zh_CN: Add self-protection Chinese translation
>    docs/zh_CN: Add keys index Chinese translation
>    docs/zh_CN: Add secrets index Chinese translation
>
> It would be best if each of you is responsible for translating
> one directory. Then, if you have reached an agreement,
> Zhang Wei can send the second and third patches on your
> behalf.
>
> Thanks,
> Yanteng
>
OK，I will do that

Thanks,

Zhangwei



