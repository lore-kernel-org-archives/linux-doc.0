Received: from mail-m49211.qiye.163.com (mail-m49211.qiye.163.com [45.254.49.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D5A95E
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735820892; cv=none; b=HmiWhrFfos6OiTu2BITVWwotyCdR6MW3mQ3VCTx2pErQTNIKPIS0T4RxFU/JWfl/kkuPUU17vkLoeMy3H6nHFlDnG56/N0PhQ4Q/fULJBFpHLaQdD//wYQ2YWSu5DISuk/lqOqVMw8Nw0zLERfobQ0gw+7oXWtLWeMI74K2wbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735820892; c=relaxed/simple;
	bh=NDpgek3XCJSCbSSarpdhindNRgW4VXFTSEXY8GwQvB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiFzzu/7Bz1ESb5cGypjAXwdP0Gv+cgVXAZERm9nh9Bx6qrKUPpiYBnp7I0DYYBzBt+ByA/QjyEzkQeQ0x/Jd85w9jZhJgf9/ddeTDpmy5R2sAMzqi5nKPd6JOShbwgrG5FJEU1lYFD+7EbCKeWOvPuOEHOL+vCvAKKgZXjICmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=JqtA9VSq; arc=none smtp.client-ip=45.254.49.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="JqtA9VSq"
Received: from [192.168.6.2] (unknown [1.193.59.150])
	by smtp.qiye.163.com (Hmail) with ESMTP id 77e15696;
	Thu, 2 Jan 2025 16:58:49 +0800 (GMT+08:00)
Message-ID: <95e4ad5a-d497-435a-949f-09b8ddb40ee9@cqsoftware.com.cn>
Date: Thu, 2 Jan 2025 16:58:52 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: Add security digsig Chinese translation
To: Yanteng Si <si.yanteng@linux.dev>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20241227082836.16078-1-zhaoshuo@cqsoftware.com.cn>
 <6552aa64-01cf-4ff1-adc0-bcbed2ea7907@linux.dev>
From: zhaoshuo <zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <6552aa64-01cf-4ff1-adc0-bcbed2ea7907@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0IeVk8eHR0eSRlCGh1PTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOQlVKTktZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTElVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94263d289f09d0kunm77e15696
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NTI6DTo5GTIVAygTTSIYPDUL
	MDYKCw5VSlVKTEhOQ0tDSEhLT01KVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkJVSk5LWVdZCAFZQUpMQk03Bg++
DKIM-Signature:a=rsa-sha256;
	b=JqtA9VSqJNrP4c88vgIjAk/wiP3hZTrOegnq+nGVHrUvLLm27fHKIhb8SLfq2y14lBbs9XWfzFYaP8n9SVQpL/AbgxeB/VDsPdQaxxZyAGOJtnY72AJTYdgHzekU99udMizYLDgmj6AXPGUR6eZjhKEqxIezmUZC4vaxvdCW7uE=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=RyraPucvIrNk1a7stX0j/JEAHW6PLOAGqGRd+bs1KKU=;
	h=date:mime-version:subject:message-id:from;


在 2025/1/2 15:32, Yanteng Si 写道:
> Hi Zhao Shuo,
>
>
> 在 2024/12/27 16:28, Shuo Zhao 写道:
>> Translate .../security/digsig.rst into Chinese.
>>
>> Update the translation through commit d56b699d76d1
>> ("Documentation: Fix typos").
>>
>> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> ---
>>   .../translations/zh_CN/security/digsig.rst    | 100 ++++++++++++++++++
>>   .../translations/zh_CN/security/index.rst     |   2 +-
>>   2 files changed, 101 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> Documentation/translations/zh_CN/security/digsig.rst
>>
>> diff --git a/Documentation/translations/zh_CN/security/digsig.rst 
>> b/Documentation/translations/zh_CN/security/digsig.rst
>> new file mode 100644
>> index 000000000000..96560d52859e
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/security/digsig.rst
>> @@ -0,0 +1,100 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/security/digsig.rst
>> +
>> +:翻译:
>> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> +
>> +===============
>> +数字签名验证API
>> +===============
>> +
>> +
>> +.. 内容
>> +
>> +   1.介绍
>> +   2.API
>> +   3.用户空间工具
>> +
>> +
>> +介绍
>> +====
>> +
>> +数字签名验证API提供了一种验证数字签名的方法。
>> +目前，数字签名被IMA/EVM完整性保护子系统使用。
>> +
>> +数字签名验证是GnuPG多精度整数(MPI)库精简后的内核移植版本来实现的。
> how about:
> 数字签名验证是通过精简的 GnuPG 多精度整数（MPI）库的内核移植来实现的。

Ok.


Thanks,

ZhaoShuo

>
>
> Thanks,
> Yanteng
>
>
>
>>   * ipe
>
>
>
