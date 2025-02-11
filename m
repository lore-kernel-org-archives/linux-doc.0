Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBD0257D
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 03:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245305; cv=none; b=tsByxohZHgowPfaszbwwzipXJXCzS0fMb93nO6VZRwL7WQ4pHfgrvwHmj3sIw7q5Np39+fmeawfOckR5EMtlqAdahV68hl7I5t+wISH4SKUcUkfQL02z4E0xz13a2OwA0XT9JODuUtDDcEVf9ltklqB6CZJ6enEevbd+mS0vf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245305; c=relaxed/simple;
	bh=GIv4mOfIvZ8jLOe4hkGhRcMB945f+a/Bklq1L2kN9lo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=c9qGcL4XIuHRAq2gPN8UEcSSaeLxIPdloXyU68z0bPpMSj/XXMk1k4880+4lBcgF5WD7EeXIxIrAirZ1Md7xNOiYxEwKtV3dJWyvTJSgMWhfzrt2aSiICILHhNIImYeYEcLNC1hWuSTODPjuqK6bKn7dmWa5YrEB0QlZtC+lAkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q7mULNOJ; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q7mULNOJ"
Message-ID: <6c45e238-7511-4539-962e-959ce98ee2ef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739245299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tartqfb+G6QuN0wjp2caSFF7GLILauvwjEgVW60hXJc=;
	b=Q7mULNOJI3CZWxLUAXO5oA6+hJ7iIzZr0gycpBL7jbnB6Ue3mQJzL0moutjuclMqfKYPGK
	k0yhX/s+2tK5Xlb+QjsqUkovE0uk6/14Im48AeoIjZmyck1nHxJCtxXydNriPjMqnZUyUk
	HPa4nh0AnnVI3/E8SaifsRGncJUTQWs=
Date: Tue, 11 Feb 2025 11:41:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/3] docs/zh_CN: Add secrets index Chinese translation
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
 <57978b69f643c1aacf78804affde4c819960fd3c.1738923258.git.zhangwei@cqsoftware.com.cn>
 <6dd30cc8-a06d-44f4-b190-fb648fca5457@linux.dev>
Content-Language: en-US
In-Reply-To: <6dd30cc8-a06d-44f4-b190-fb648fca5457@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/11/25 11:36 AM, Yanteng Si 写道:
>
> 在 2/7/25 6:18 PM, zhangwei 写道:
>> Translate .../security/secrets/index.rst into Chinese
>>
>> Update the translation through commit 7419995a331c
>> ("docs: security: Add secrets/coco documentation")
>>
>> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
>
Sorry, the download speed of my mail server was too slow, so I didn't 
see the email about this patch set being applied. Please ignore my 
"Reviewed-by".

Thanks,

Yanteng

>
>
