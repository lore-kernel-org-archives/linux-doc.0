Received: from mail-m118102.qiye.163.com (mail-m118102.qiye.163.com [115.236.118.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA017C9E8
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 05:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.118.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736229229; cv=none; b=Y3Oq6udb6P307g1B47O7cEn94em9NxHbvr7sGXbHejCy1QnoSC7tFNgImu3udWV4IH44/gVkg7AFdR8XdCPavrJtiIXoOCwlqU9aGtYUNMBcXVC3acoVT1bfKsYnpameRXkG2RLlGworYPhlWLio4kzbWN69eFl6zZDk7r42LYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736229229; c=relaxed/simple;
	bh=pDxs6wjrDU+scUbICqk657TuxnYGAKpYR5av3xFJjRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YitrOJIRXYxszv03Iz9RjUigCKiSrzbMOtbqE4kyddY0DiSLfk39ZF2d4lHhaXMpbBnIrnGnvyqQGpowtI+ZpctAowVabnqz0zigosqfnz8HqBdpg4Frwd8zxYu5ek4z/FuDlEC+HrSufsqRO2MfJ/zXospe2wK+jdcJpvFu7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=F9f7UfYc; arc=none smtp.client-ip=115.236.118.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="F9f7UfYc"
Received: from [192.168.6.2] (unknown [171.8.192.198])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7eed27b7;
	Tue, 7 Jan 2025 13:38:21 +0800 (GMT+08:00)
Message-ID: <44461a7f-e3bd-4010-a014-07bd134c3e6a@cqsoftware.com.cn>
Date: Tue, 7 Jan 2025 13:38:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: Add security credentials Chinese
 translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20250106055744.20840-1-zhaoshuo@cqsoftware.com.cn>
 <CAJy-Am=D_vJ4C4jQmU3g8j4xD2=vHXPOEwLLtzn+FgfWwipzag@mail.gmail.com>
From: zhaoshuo <zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <CAJy-Am=D_vJ4C4jQmU3g8j4xD2=vHXPOEwLLtzn+FgfWwipzag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEwYVkhMHh8YSk8dGR8fTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKTEpVQ1VKQklVSkJDWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxJVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a943f4569ea09d0kunm7eed27b7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTY6Syo4CzIWKRwqDyI6DCsh
	VhVPFCpVSlVKTEhNSUlDSEtJSk5JVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSkxKVUNVSkJJVUpCQ1lXWQgBWUFJSEJKNwY+
DKIM-Signature:a=rsa-sha256;
	b=F9f7UfYcklHogM5QDcBiClRqZN6nrDM/oxoLVUsL22sIe6nAHzGMKqk+v/k6Z4ljEhQ8o9RmqcyGWvIgoVwaj0Vq+bLqjqaz+w22s6slbjZ5cGPxoxdq45Zof6+rIj7GaNuG2XYE233rkoceACDS8NB3HACW35UEv2cewyrr3i8=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=J3/wT1oCKn5WbSz6jWFWnMWZK3PS4T2eGPPZmRNOECI=;
	h=date:mime-version:subject:message-id:from;


在 2025/1/7 13:09, Alex Shi 写道:
> Shuo Zhao <zhaoshuo@cqsoftware.com.cn> 于2025年1月6日周一 14:33写道：
>> Translate .../security/credentials.rst into Chinese.
>>
>> Update the translation through commit cf92ec602ac5
>> ("Documentation: remove current_security() reference")
>>
>> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> ---
>>
>> v2:
>>
>> Modify some formatting and translation.
>>
>>   .../zh_CN/security/credentials.rst            | 479 ++++++++++++++++++
>>   .../translations/zh_CN/security/index.rst     |   2 +-
>>   2 files changed, 480 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/security/credentials.rst
>>
>> diff --git a/Documentation/translations/zh_CN/security/credentials.rst b/Documentation/translations/zh_CN/security/credentials.rst
>> new file mode 100644
>> index 000000000000..b42b86f96078
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/security/credentials.rst
>> @@ -0,0 +1,479 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/security/credentials.rst
>> +
>> +:翻译:
>> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> +
>> +=============
>> +Linux中的凭据
>> +=============
>> +
>> +作者: David Howells <dhowells@redhat.com>
>> +
>> +.. contents:: :local:
>> +
>> +概述
>> +====
>> +
>> +当一个对象对另一个对象进行操作时，Linux执行的安全检查包含几个部分：
>> +
>> + 1. 对象
>> +
>> +     对象是可以直接由用户空间程序操作的系统中的实体。Linux具有多种可操作
>> +     的对象，包括：
>> +
>> +       - 任务
>> +       - 文件/索引节点
>> +       - 套接字
>> +       - 消息队列
>> +       - 共享内存段
>> +       - 信号量
>> +       - 密钥
>> +
>> +     所有这些对象的描述的一部分是一组凭据。集合中的内容取决于对象的类型。
>> +
>> + 2. 对象所有权
>> +
>> +     大多数对象的凭据中会有一个子集用来表示该对象的所有权。
>> +     这用于资源会计和限制（如磁盘配额和任务资源限制）。
> accounting may use 核算 for better?
> others looks good for me.

Indeed,it's a good suggestion.


Thanks,

ZhaoShuo

> Reviewed-by: Alex Shi <alexs@kernel.org>
