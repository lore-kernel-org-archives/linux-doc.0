Received: from mail-m15590.qiye.163.com (mail-m15590.qiye.163.com [101.71.155.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910E1BCA11
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 02:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737513128; cv=none; b=Bltcx4ANzIvG7RjBEM48JMwiBumMKROYQC8qQB0uJ+I2pUS1V0HtN45oNLN2Ic1js+7kc6ShnwyoIFmTA/cn8NlNrvUD02Fqi+x/YzC4AHaVXHvHYiJW8upd3wK/5vz0QfW22eufFq/r8OmD2b+OHa72n8o88JbAt/kzbdtRA1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737513128; c=relaxed/simple;
	bh=lLXVoVngOFx+N1DZ3QCTA5wWXYmzZgvGM5MxQ8C3qAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1bayngBMzpXPJCXzjlcTytwqT4fxkkV7a1eI3xqWgtopqpqXoFdcl9RKEwkAgBXENF9fawDyyX51YDjuvHcUn+mMZo2KOeLLPzcYoKGwbAw53BUuA9Qqb5Mwz8kg9svZwQGEhWuGyhhie4nWm3OK9cmkiLQmJRYJeYUvH3IiM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=eWJKCnqt; arc=none smtp.client-ip=101.71.155.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="eWJKCnqt"
Received: from [192.168.6.2] (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 95aac018;
	Wed, 22 Jan 2025 10:26:46 +0800 (GMT+08:00)
Message-ID: <d47e6345-c4ad-4637-87a0-fc7493f2f338@cqsoftware.com.cn>
Date: Wed, 22 Jan 2025 10:26:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] docs/zh_CN: Add tpm index Chinese translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
 <ff15a31080a2671da3e114fe95f2a19e294367bc.1737354981.git.zhaoshuo@cqsoftware.com.cn>
 <CAJy-AmmkXKX70peEf-bK_V0FHm8q8dtqHL-kUPx+wngEfv_Dsw@mail.gmail.com>
From: zhaoshuo <zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <CAJy-AmmkXKX70peEf-bK_V0FHm8q8dtqHL-kUPx+wngEfv_Dsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSxkeVh5ITU5MTk9CGEJITlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a948bd56a5509d0kunm95aac018
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6Lgw6EzIOTykuIxk#Hx9I
	NR8aClFVSlVKTEhMTkpJQ0tMQkxJVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUlKSkg3Bg++
DKIM-Signature:a=rsa-sha256;
	b=eWJKCnqtgAEiOoW+T8+jumin7QjUP5Q438DqUSSTMx9yP9npus99LEzosfBiGTHqcQrk/vFjYhpcWbiOcKHKYyRF8cvd2MZLml8/PdsYz8hfI5icHha71fTufZ/sTBGLwXGlia4aZ8u5giWGn2U5gORhxQv3aM6ue0zPA5fN/JE=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=zfU59EdTXUJCI92F3Z6piD4qPIPXdszsV3h93g9Oeeo=;
	h=date:mime-version:subject:message-id:from;


在 2025/1/22 9:43, Alex Shi 写道:
> Translation is fine for me.
>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Ok.


Thanks,

ZhaoShuo

>
> Shuo Zhao <zhaoshuo@cqsoftware.com.cn> 于2025年1月20日周一 14:51写道：
>> Translate .../security/tpm/index.rst into Chinese
>>
>> Update the translation through commit 1d479e3cd652
>> ("Documentation: tpm: Add TPM security docs toctree entry")
>>
>> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> ---
>>   .../translations/zh_CN/security/index.rst     |  2 +-
>>   .../translations/zh_CN/security/tpm/index.rst | 21 +++++++++++++++++++
>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/security/tpm/index.rst
>>
>> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
>> index 38e9ce7cf471..0aacecabf0c0 100644
>> --- a/Documentation/translations/zh_CN/security/index.rst
>> +++ b/Documentation/translations/zh_CN/security/index.rst
>> @@ -19,6 +19,7 @@
>>      lsm
>>      sak
>>      siphash
>> +   tpm/index
>>      digsig
>>      landlock
>>
>> @@ -29,6 +30,5 @@ TODOLIST:
>>   * lsm-development
>>   * SCTP
>>   * self-protection
>> -* tpm/index
>>   * secrets/index
>>   * ipe
>> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
>> new file mode 100644
>> index 000000000000..a3cfb2d11c86
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
>> @@ -0,0 +1,21 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/security/tpm/index.rst
>> +
>> +:翻译:
>> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> +
>> +================
>> +可信平台模块文档
>> +================
>> +
>> +.. toctree::
>> +
>> +TODOLIST:
>> +*   tpm_event_log
>> +*   tpm-security
>> +*   tpm_tis
>> +*   tpm_vtpm_proxy
>> +*   xen-tpmfront
>> +*   tpm_ftpm_tee
>> --
>> 2.47.1
>>
>
