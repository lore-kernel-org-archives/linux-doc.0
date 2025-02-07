Received: from mail-m32108.qiye.163.com (mail-m32108.qiye.163.com [220.197.32.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3EA1A5BA8
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922585; cv=none; b=Hquz4MpCU/zy7ANMYqvTBl0PP2wI4TzVRIeN9UB/uBOX+mxmoZCUlhMq+WjeUuRVsavtQHlhDX6C9/zS+CbXRbZ5j3zZ9GeieFuVu0MTAiCqCRi8XIDAtmC2ktnjWSBCbROd9W7AuYQYy8vjhcsdqAb+9TgFFqdK/c7/Dupqlls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922585; c=relaxed/simple;
	bh=UxIz+xl+BXDkF9LvOlrlrXa4XJ3YOZiGccL+cP/2+Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShGcxKhL8VI8G+7LS43RXRjdi2E99BHlyPMZVfOegtWQkK5zOHpysGzaFPaOqsW6RvUk+i/+OVHIRHqU/SP+K0Z8AG4fFBy3zLpgEM9uBXAUOuAX0sghgmdYXjx7d/+Z/FjlCRHwAeHi2OVVPGw2TDcDCcyfUpR/+2JekVrP3TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=eS9bCN1n; arc=none smtp.client-ip=220.197.32.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="eS9bCN1n"
Received: from [192.168.5.122] (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a6b03dfa;
	Fri, 7 Feb 2025 17:57:44 +0800 (GMT+08:00)
Message-ID: <727439fb-12da-44d2-9b70-127e5d84efab@cqsoftware.com.cn>
Date: Fri, 7 Feb 2025 17:57:43 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: zhangwei@cqsoftware.com.cn
Subject: Re: [PATCH v4 2/3] docs/zh_CN: Add keys index Chinese translation
To: Yanteng Si <si.yanteng@linux.dev>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1738835231.git.zhangwei@cqsoftware.com.cn>
 <02843f1e6bcab0fdf5b2433bc3762b51f84a963c.1738835231.git.zhangwei@cqsoftware.com.cn>
 <da9d1cf9-7650-4189-82b9-6e59785b243e@linux.dev>
From: zhangwei <zhangwei@cqsoftware.com.cn>
In-Reply-To: <da9d1cf9-7650-4189-82b9-6e59785b243e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCT05KVh0dSk0eTU9CTkgaTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94dfd808a703abkunma6b03dfa
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRA6CDo4HTIKLAwfAS0WTw0i
	SkkwCgJVSlVKTEhDQklJSU1OT0JOVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSk5IQzcG
DKIM-Signature:a=rsa-sha256;
	b=eS9bCN1nOR4qzNwRp3TpKb+TJAE6v8KZ4NK0AgkDyK4exOzLga5qf8OyWKy1gMacXQ7KflDNKC/lnDVdq15E6NLitTDnLdXLa5PkFv25moUNbQVbWPcgE871UnqsUEr7BuJml4DUjQjP7AbtDf3Qoh+MbUJSnc8P3NOcAmED0lg=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=jbA7a0owuWIO4MqHQ5Ux1FeZIySO4OJW55zZZGsm2/w=;
	h=date:mime-version:subject:message-id:from;


在 2025/2/7 17:54, Yanteng Si 写道:
>
> 在 2/7/25 10:23 AM, zhangwei 写道:
>> Translate .../security/keys/index.rst into Chinese
>>
>> Update the translation through commit 5395d312dff0
>> ("doc: ReSTify keys-trusted-encrypted.txt")
>>
>> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
>> ---
>>   .../zh_CN/security/keys/index.rst             | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 
>> Documentation/translations/zh_CN/security/keys/index.rst
>>
>> diff --git a/Documentation/translations/zh_CN/security/keys/index.rst 
>> b/Documentation/translations/zh_CN/security/keys/index.rst
>> new file mode 100644
>> index 000000000000..1c26e027aed1
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/security/keys/index.rst
>> @@ -0,0 +1,23 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. include:: ../../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/security/keys/index.rst
>> +
>> +:翻译:
>> +
>
>> +  张巍 Wei Zhang <zhangwei@cqsoftware.com.cn>
>
> Have you discussed and decided that you would translate this 
> catalogue? If not, I suggest not signing the name here for the time 
> being.
>
>
>
> Thanks,
>
> Yanteng
>
Okay, I'm going to remove my signature

Thanks,

zhangwei


>> +
>> +========
>> +内核密钥
>> +========
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +
>> +TODOLIST:
>> +* core
>> +* ecryptfs
>> +* request-key
>> +* trusted-encrypted
>
>
