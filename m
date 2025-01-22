Received: from mail-m49208.qiye.163.com (mail-m49208.qiye.163.com [45.254.49.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA3249F9
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737513778; cv=none; b=gO6VKg/7gF1sXC/SzjvoAm4EiLdE0ys6FVKIBvjDxnMreLJbBEQPklCSa8F6t7/E8Ii9us2nvOiT3myIXJqOq1kLfEv6ycufPhjCwUgnQos2Ry7aFUJJmn06t9ntqxlXuw54Rj1z+67PoEWPyCiN829YxuEfmr8WFIAJLsmISdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737513778; c=relaxed/simple;
	bh=lL0M5aOSPLr9mELRwHPYvVyjP4x63K6B7alpSYnkkFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8bV0MJ/QOlt//pnZlUO3VlRPvnL5KcMzCRge1kSuO9vyhw99wO5wXVwDRvTtDW89RtBC10V14lPEfKhPT9mePt3jX05DM8GfaO0R3eBO9rqmDAdo6075+xeRpLQCi51fyqdSYCMSugRF8oDIB5eq6lE3GMcPx9sJI27MF1e9Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=GcWfbDbM; arc=none smtp.client-ip=45.254.49.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="GcWfbDbM"
Received: from [192.168.6.2] (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 95aac17f;
	Wed, 22 Jan 2025 10:27:34 +0800 (GMT+08:00)
Message-ID: <ec66ba02-bc4e-4c73-b907-8b4e135cccea@cqsoftware.com.cn>
Date: Wed, 22 Jan 2025 10:27:34 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] docs/zh_CN: Add tpm tpm_event_log Chinese
 translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
 <0287c7309ecb1bf0ffd40d363f43f148beea0a18.1737354981.git.zhaoshuo@cqsoftware.com.cn>
 <CAJy-AmknZopyMndMpruBYGdeEZNLyQ6kqwneKmoVS2wU-BVLaQ@mail.gmail.com>
From: zhaoshuo <zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <CAJy-AmknZopyMndMpruBYGdeEZNLyQ6kqwneKmoVS2wU-BVLaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUxPVhlKSk1CHhgaQx1CS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a948bd6249309d0kunm95aac17f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQw6Hgw5NTIPSykKIx43HlEi
	OT4KChNVSlVKTEhMTkpJQ05OTUJKVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUhCTkw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=GcWfbDbMA6s5ohHiKbV1kHw4O6q5uhhw0DtaTTp7bX9afnECHCzsFG9hJOrRtlbhPhIAfMaSQlrjB4xt1IG5N4Muw9YnHXSTQ3GN9RaEbn1jkzmLjvJ/inNvDch1nur27Tat+nxqJns8RGSSvajg36OIghSaKr+r2wEge5FuTFs=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=8NkarS5C+gc3vnuKlpOi648wFMrPSbt/rxCsFkSksBU=;
	h=date:mime-version:subject:message-id:from;


在 2025/1/22 9:48, Alex Shi 写道:
> Translation looks good for me.
>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Ok.



Thanks,

ZhaoShuo

>
> Shuo Zhao <zhaoshuo@cqsoftware.com.cn> 于2025年1月20日周一 15:26写道：
>> Translate .../security/tpm/tpm_event_log.rst into Chinese.
>>
>> Update the translation through commit 2ef5a7f1482c
>> ("tpm: Document UEFI event log quirks")
>>
>> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> ---
>>   .../translations/zh_CN/security/tpm/index.rst |  3 +-
>>   .../zh_CN/security/tpm/tpm_event_log.rst      | 49 +++++++++++++++++++
>>   2 files changed, 51 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
>>
>> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
>> index a3cfb2d11c86..f324bd4dd093 100644
>> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
>> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
>> @@ -12,8 +12,9 @@
>>
>>   .. toctree::
>>
>> +   tpm_event_log
>> +
>>   TODOLIST:
>> -*   tpm_event_log
>>   *   tpm-security
>>   *   tpm_tis
>>   *   tpm_vtpm_proxy
>> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst b/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
>> new file mode 100644
>> index 000000000000..9c173291ac3e
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
>> @@ -0,0 +1,49 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/security/tpm/tpm_event_log.rst
>> +
>> +:翻译:
>> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> +
>> +===========
>> +TPM事件日志
>> +===========
>> +
>> +本文档简要介绍了什么是TPM日志，以及它是如何从预启动固件移交到操作系统的。
>> +
>> +介绍
>> +====
>> +
>> +预启动固件维护一个事件日志，每当它将某些内容哈希到任何一个PCR寄存器时，该
>> +日志会添加新条目。这些事件按类型分类，并包含哈希后的PCR寄存器值。通常，预
>> +启动固件会哈希那些即将移交执行权或与启动过程相关的组件。
>> +
>> +其主要应用是远程认证，而它之所以有用的原因在[1]中第一部分很好地阐述了：
>> +
>> +认证用于向挑战者提供有关平台状态的信息。然而，PCR的内容难以解读；因此，当
>> +PCR内容附有测量日志时，认证通常会更有用。尽管测量日志本身并不可信，但它们
>> +包含比PCR内容更为丰富的信息集。PCR内容用于对测量日志进行验证。
>> +
>> +UEFI事件日志
>> +============
>> +
>> +UEFI提供的事件日志有一些比较奇怪的特性。
>> +
>> +在调用ExitBootServices()之前，Linux EFI引导加载程序会将事件日志复制到由
>> +引导加载程序自定义的配置表中。不幸的是，通过ExitBootServices()生成的事件
>> +并不会出现在这个表里。
>> +
>> +固件提供了一个所谓的最终事件配置表排序来解决这个问题。事件会在第一次调用
>> +EFI_TCG2_PROTOCOL.GetEventLog()后被镜像到这个表中。
>> +
>> +这引出了另一个问题：无法保证它不会在 Linux EFI stub 开始运行之前被调用。
>> +因此，在 stub 运行时，它需要计算并将最终事件表的大小保存到自定义配置表中，
>> +以便TPM驱动程序可以在稍后连接来自自定义配置表和最终事件表的两个事件日志时
>> +跳过这些事件。
>> +
>> +参考文献
>> +========
>> +
>> +- [1] https://trustedcomputinggroup.org/resource/pc-client-specific-platform-firmware-profile-specification/
>> +- [2] The final concatenation is done in drivers/char/tpm/eventlog/efi.c
>> --
>> 2.47.1
>>
