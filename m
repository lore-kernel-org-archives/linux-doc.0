Received: from mail-m3279.qiye.163.com (mail-m3279.qiye.163.com [220.197.32.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0718F14A09C
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 02:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737513840; cv=none; b=suZmS1m0R4snYtqx0C+BT+z3EB+4wSGX/AixfFYs3L2WEPVdJTVZThcCCc1ca7VYlEekJvq6Mfwg3/vRr2xcRivLXGkjx8puJpvFAqKKffYDYLliMGOnV4bfucfcBt8vvLdBtxUjgdaWt9o6Zumoil6K8Jy5Lvswpi1cMB5zors=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737513840; c=relaxed/simple;
	bh=xz+3F98P2CrCU4AmPCMe5asY6cTmjSuGDfAN6ks/AYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R21r0x/rODo5GwSqzWigFtEDgH95MQDbvUqeCA9zMh5RDDAjx8Xo71L7z57VD0BB6MGdo6Jp1Y7RONZH2FadPmgR3aUcgaRLHjlnn987tTcWwXYeDijb9PYE440SsAMtqJa/lbPoJj4zh99z0mgGQXawL448zM7dcnr4juk1iNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=NUXc9OTy; arc=none smtp.client-ip=220.197.32.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="NUXc9OTy"
Received: from [192.168.6.2] (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 95b1ce70;
	Wed, 22 Jan 2025 10:38:46 +0800 (GMT+08:00)
Message-ID: <9e45fea3-fc1f-47b4-a461-de13fb43beca@cqsoftware.com.cn>
Date: Wed, 22 Jan 2025 10:38:46 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] docs/zh_CN: Add tpm tpm_ftpm_tee Chinese
 translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
 <b5ab071a6869a52c5ef16fb96d710b80cfef96a4.1737354981.git.zhaoshuo@cqsoftware.com.cn>
 <CAJy-Am=FTNX37C1e-wmEf83T0YfdtaT-ZQKCfV6oU5fU3Knbjg@mail.gmail.com>
From: zhaoshuo <zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <CAJy-Am=FTNX37C1e-wmEf83T0YfdtaT-ZQKCfV6oU5fU3Knbjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUhNVk0ZHU0ZTxofTBgfSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a948be0660c09d0kunm95b1ce70
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAg6CSo6EjITNClPIhIuIktJ
	HVEKCRVVSlVKTEhMTkpITklMQ0xKVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUlNTEs3Bg++
DKIM-Signature:a=rsa-sha256;
	b=NUXc9OTyErk98MbJCosvBUMrIPF4/u6kCkwL4+d04G1td/nCaPz+1ZO8R38Bn2qwJHAbWGlcLWI75iCkK2JClIcbAjqe7iWGi1bgfs608xNgHpSOSpf9An2PYqdX+TCaG6DzvBHVoVtf3PC7lcq1CytId/sBb0KyxB1/2bTtS10=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=xU5UVyh8xAJQIdCj1nmgPSKDmTkM28SKfaZUts1vDtE=;
	h=date:mime-version:subject:message-id:from;


在 2025/1/22 10:07, Alex Shi 写道:
> Translation looks good for me.
>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Ok.



Thanks,

ZhaoShuo

>
> Shuo Zhao <zhaoshuo@cqsoftware.com.cn> 于2025年1月20日周一 14:56写道：
>> Translate .../security/tpm/tpm_ftpm_tee.rst into Chinese.
>>
>> Update the translation through commit e8bd417aab0c
>> ("tpm/tpm_ftpm_tee: Document fTPM TEE driver")
>>
>> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> ---
>>   .../translations/zh_CN/security/tpm/index.rst |  4 +--
>>   .../zh_CN/security/tpm/tpm_ftpm_tee.rst       | 31 +++++++++++++++++++
>>   2 files changed, 32 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
>>
>> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
>> index bf95200ca586..707646590647 100644
>> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
>> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
>> @@ -17,6 +17,4 @@
>>      tpm_tis
>>      tpm_vtpm_proxy
>>      xen-tpmfront
>> -
>> -TODOLIST:
>> -*   tpm_ftpm_tee
>> +   tpm_ftpm_tee
>> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst b/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
>> new file mode 100644
>> index 000000000000..5901eee32563
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
>> @@ -0,0 +1,31 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/security/tpm/tpm_ftpm_tee.rst
>> +
>> +:翻译:
>> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> +
>> +===========
>> +固件TPM驱动
>> +===========
>> +
>> +本文档描述了固件可信平台模块（fTPM）设备驱动。
>> +
>> +介绍
>> +====
>> +
>> +该驱动程序是用于ARM的TrustZone环境中实现的固件的适配器。该驱动
>> +程序允许程序以与硬件TPM相同的方式与TPM进行交互。
>> +
>> +设计
>> +====
>> +
>> +该驱动程序充当一个薄层，传递命令到固件实现的TPM并接收其响应。驱动
>> +程序本身并不包含太多逻辑，更像是固件与内核/用户空间之间的一个管道。
>> +
>> +固件本身基于以下论文：
>> +https://www.microsoft.com/en-us/research/wp-content/uploads/2017/06/ftpm1.pdf
>> +
>> +当驱动程序被加载时，它会向用户空间暴露 ``/dev/tpmX`` 字符设备，允许
>> +用户空间通过该设备与固件TPM进行通信。
>> --
>> 2.47.1
>>
