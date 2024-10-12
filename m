Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFDC8BE5
	for <linux-doc@vger.kernel.org>; Sat, 12 Oct 2024 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728724794; cv=none; b=gDJApi/OCNourKKKvlQvmSoiLf83CPtVa0x87eRYp/xf4COS561Oy36kJ3fFcEtJ99P2CtOiH9LJ74Yi2blzZAzNWv0tycRbjBJajj+Usa1iCPfgkVVN5JBgdGRzCW7e6g/vGK/ruilC+uxEOMipA6d3pMSpOQef0Ws2TFbQuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728724794; c=relaxed/simple;
	bh=3EdNEQxnD4DiiNVJv2PrcGgdgMPOZNDAzDst19Oeax0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6K8WYSraWg5xgFnHXnE6TuDPqj+6jT8cuL5VCOCtgPMqN19WZNHf7VBBlSbCrLllM489u17AUEixG7hGH6361GznCSqvKmrdB/Ia2TvAtWmDfYm10ZGOCmFhrlxwA0lQsRgFU36Iift2YqlPmuetbYPhtOc9enHAF5S9CNAHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hamsaDnP; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hamsaDnP"
Message-ID: <ac6fda5e-52cc-4d64-974d-594d8c20a15e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728724789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d1rSObAyZ6N5jjXIRf7mwXD1W8TE8ZpljxGtGrpABKc=;
	b=hamsaDnPFKdrq60bbRa+EsFiVhSsJMVTqGCQzgskxYjO73zoNmPSR0fMiOGi4vCVGWk7JX
	gl2GN2hc7apUiNADh1ulbEc0isXfxaxsOotkCgxSlsPQjbfdejq5MsBr8/hPSkvy22v6Xx
	d1vHajwUMfZRBUdqG/qcsHvuj9rO+1M=
Date: Sat, 12 Oct 2024 17:19:43 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] Docs/zh_CN: Translate page_tables.rst to Simplified
 Chinese
To: Pengyu Zhang <zpenya1314@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yaxin_wang_uestc@163.com
References: <20241011154913.2808-1-zpenya1314@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241011154913.2808-1-zpenya1314@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi, Pengyu


在 2024/10/11 23:49, Pengyu Zhang 写道:
> Hi, Yanteng
>
>> 在 2024/10/11 09:47, Yanteng Si 写道:
>>> Hi Pengyu,
>>>
>>> 在 2024/10/8 23:38, Pengyu Zhang 写道:
>>>> This patch provides a Simplified Chinese translation of the
>>>> "page_tables.rst" document, aimed at improving accessibility
>>>> for Chinese-speaking developers and users.
>>>>
>>>> The translation prioritizes technical accuracy and readability,
>>>> ensuring that the content remains clear and informative for
>>>> its intended audience.
>>> Let's add a commit tag so that the scripts/checktransupdate.py can
>>> recognize it. just like:
>>>
>>> Subject:[PATCH v3] docs/zh_CN: add the translation of kbuild/gcc-plugins.rst <https://lore.kernel.org/linux-doc/20240907070244.206808-1-dzm91@hust.edu.cn/#r>
>>> Date: Sat,  7 Sep 2024 15:02:08 +0800
>>>
>>> Finish the translation of kbuild/gcc-plugins.rst and move gcc-plugins
>>> from TODO to the main body.
>>>
>>> Update to commit 3832d1fd84b6 ("docs/core-api: expand Fedora instructions
>>> for GCC plugins")
>>>
>>>
>>> Thanks，
>>> Yanteng
>>>
>> Sorry, my email client sent an HTML email and I have fixed it. Now resend
>> to the mailing list.
>>
>>
>> Thanks,
>> Yanteng
> We discovered a pfn calculation error during the translation of the
> page_tables.rst. I have submitted another patch to fix it, and it had been
> reviewed by three maintainers, but it has not yet been merged into the mainline.
> https://lore.kernel.org/all/20241009144135.12453-1-zpenya1314@gmail.com/
>
> So I have a question: should the commit tag be based on the fix patch
> I submitted, or the tag of the original page_tables.rst?
Hmm, I think you can ignore this tag in the next version and specify the
reason in the commit message, which will also be helpful for future
updates. Of course, there may be a better way, which is to modify this
tag when Jon applies the patch, but I'm not sure if this will work.

Of course, there is another great method, which is to still ignore this
tag and split your translation patch into two patch：

Patch 1 ：only translates English documents （with tag);
Patch 2 ：fixes the pfn calculation error in the Chinese document.

put them into a patch sets.

git am <Patch 1>
git am 
<https://lore.kernel.org/all/20241009144135.12453-1-zpenya1314@gmail.com/> 
## Remember to pick up the review tag
git am <Patch 2>
git format-patch -3 -v 5 --cover-letter
vim 0000-cover-letterxxx.patch
git send-email   v5*


Thanks,
Yanteng

> Thanks,
> Pengyu
>

