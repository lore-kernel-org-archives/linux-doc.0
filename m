Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D491620C02A
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 06:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736196; cv=none; b=KVRczOxi0FEafHP0kfEqYTLL5MkEHr6I4qQ8OZxDtgIT7H8yudRyPmYQoqPY+JMxTxVLuHlyqZcLhsmkp0d7yNBsmMN9j9Qyeh06FqDDb8CvfcHCaI1EaxHLKQ2G+OHHHUD2K3a3+6+VyvA3gIqkLzbFClbAp5fblayDlz+XfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736196; c=relaxed/simple;
	bh=Xgk+CnTTSxwrcRItHTp1u5DpA4vlUbnA7+uAOWc5EDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf0z6pvmd187y8JmJvfSWeD9nTX4UCfSSIfpL4u5z7ipq2AxY5UOvArMjT3beDs/+BnkDl6UjOaeWkuEdXG7255+78tkNGf2voCWrry13UsoZVxxI/tZTe0LFecNZHw4IFI142Nhj+ml4i+Jk7LAsOBGmRKg8TM7Zgxk0X+LQfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lHfJe1v3; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lHfJe1v3"
Message-ID: <a495ae39-9121-410a-b881-35e6b0b22dff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738736186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zH9fHxHexS5NSbMPLYauLqT2UZHazK//K/Vs6yYelc=;
	b=lHfJe1v3bmnrYaN6+qUj+cR8tKAZxi5komWlFIWgIjelOUdPngv4H+0pGwR5E51Y+4kv7X
	kNIYkFItEg/yYJGsOkMiLDL8tFyv+qvenMZmlqp7+fdAcGkQKmZA9fCc5CyX32JJXYVnnI
	zfRjVq6OZAXbk+4NlpFoqwnp4h77vZg=
Date: Wed, 5 Feb 2025 14:16:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] docs/zh_CN: Add self-protection index Chinese
 translation
To: zhangwei@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn
Cc: zhaoyuehui@cqsoftware.com.cn, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org
References: <20250121051234.79066-1-zhangwei@cqsoftware.com.cn>
 <82025758-b993-47aa-a8fe-7ed6cf5a5def@cqsoftware.com.cn>
 <87y0ylfy2q.fsf@trenco.lwn.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <87y0ylfy2q.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi, Zhang Wei, Zhao Shuo,Yu Xian,


在 2025/2/5 00:56, Jonathan Corbet 写道:
> zhangwei <zhangwei@cqsoftware.com.cn> writes:
>
>> 在 2025/1/21 13:12, zhangwei 写道:
>>> Translate .../security/self-protection.rst into Chinese.
>>>
>>> Update the translation through commit b080e52110ea
>>> ("docs: update self-protection __ro_after_init status")
>>>
>>> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
>>> ---
>> Hi, jon
>> Please apply Zhao Shuo's patchset first, and then apply mine.
>> https://lore.kernel.org/linux-doc/cover.1737603330.git.zhaoshuo@cqsoftware.com.cn/
>> <https://lore.kernel.org/linux-doc/cover.1737603330.git.zhaoshuo@cqsoftware.com.cn/>
>>
> I did that, but yours still fails to apply.  Can you send me a respin
> against docs-next, please?
It seems that you plan to translate all the security documents.
I've noticed that there are still two directories left untranslated.

To avoid conflicts, Zhang Wei, would you mind creating a v3 like this:

    docs/zh_CN: Add self-protection Chinese translation
    docs/zh_CN: Add keys index Chinese translation
    docs/zh_CN: Add secrets index Chinese translation

It would be best if each of you is responsible for translating
one directory. Then, if you have reached an agreement,
Zhang Wei can send the second and third patches on your
behalf.

Thanks,
Yanteng
