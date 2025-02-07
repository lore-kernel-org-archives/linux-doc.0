Received: from mail-m32118.qiye.163.com (mail-m32118.qiye.163.com [220.197.32.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8C4405F7
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738897893; cv=none; b=dL6dtwSTNz1Q+muXFS4ZggiP9jW2Igyp8q6aMgnII2g+gYWnE/Gg4RDkirfEm84JPXPCvzSXvDW9o9g3Fb1T/pa3A4D1L8/8b3VKrMLJDjk5NvJwTi9MSLxZaMNdVWkOuTDIWeads3vybvAvHmhKYPJBxlEh6MnEq2he0hB6jnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738897893; c=relaxed/simple;
	bh=dxg4HZup41Yn18KWJJ9rIHTIeLs6FvpnmEIB02tsj2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSNn86CqQ8pyyoiLDYN+JAUkjMXRP6xu6JzuD7/GUtRHVrQl0kEMud3yxuSQji3DEyZixwUgUuFlzZvlJMP5SRCBbLGfAvsqTd/nOOX4/NXlSpFk8v2OoEu2mjgXZCrzNZnRqyPWBLiZQGTtFsHolIUiZIcntwfZAh0J+wUeEKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=Fqw96wGo; arc=none smtp.client-ip=220.197.32.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="Fqw96wGo"
Received: from [192.168.5.131] (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a6023abd;
	Fri, 7 Feb 2025 11:11:19 +0800 (GMT+08:00)
Message-ID: <ad5d2f93-af36-4298-9107-f3456bfe90b6@cqsoftware.com.cn>
Date: Fri, 7 Feb 2025 11:11:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/zh_CN: Add snp-tdx-threat-model index Chinese
 translation
To: Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org, si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20250124102136.561488-1-maoyuxian@cqsoftware.com.cn>
 <87tt99fy05.fsf@trenco.lwn.net>
From: Yuxian Mao <maoyuxian@cqsoftware.com.cn>
In-Reply-To: <87tt99fy05.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ05DVh9CHk8aH09CGB9MHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktISk5MSlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94de63f31409d8kunma6023abd
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxQ6GAw6FzILQw4UCz4aTwgS
	IgEwCw9VSlVKTEhDQ0JMQ0NLTE5PVTMWGhIXVRYaFAIOAxIaFTsYCggUHQ8MGgkeVRgUFlUYFUVZ
	V1kSC1lBWUpVSkJIVU5MVUhNWVdZCAFZQUhOS043Bg++
DKIM-Signature:a=rsa-sha256;
	b=Fqw96wGoWe7XPskBCTxAsMAxt66nN3/xRugJ/6qXlUyWGpSzL6HdV6vrguLX13LCnXXLlAVR9c5nE/68PV4reTqk6f5ou4gGExEVgZU0g415TIzI/KnRi47HKXpU3pXU6Fvu5Q8WIqN5MGy4+NUd+zS3EzMcl7ucQAOcTRCrkIQ=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=6czGWQ0cfSObi/alWKLtjio/+UeaLTzTBiAk3/VFy/w=;
	h=date:mime-version:subject:message-id:from;


在 2025/2/5 0:58, Jonathan Corbet 写道:
> Yuxian Mao <maoyuxian@cqsoftware.com.cn> writes:
>
>> Translate .../security/snp-tdx-threat-model.rst into Chinese.
>>
>> Update the translation through commit "cdae7e8a69c3"
>> ("docs/MAINTAINERS: Update my email address")
>>
>> Signed-off-by: Yuxian Mao <maoyuxian@cqsoftware.com.cn>
>> ---
>>
>> v4:
>>
>> Translation errors have been fixed
>>
>> v3:
>>
>> Message header fixes
>>
>> v2:
>>   
>> fix remove the unnecessary blank lines
>>
>>   .../translations/zh_CN/security/index.rst     |   2 +-
>>   .../zh_CN/security/snp-tdx-threat-model.rst   | 209 ++++++++++++++++++
>>   2 files changed, 210 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst
> This doesn't apply against docs-next; can you respin it please?
>
> Thanks,
>
> jon
[myx@fedora lwn]$ git branch
* docs-next
   master

[myx@fedora lwn]$ git pull

已经是最新的。

[myx@fedora lwn]$ b4 am cover.1738835231.git.zhangwei@cqsoftware.com.cn

Grabbing thread from 
lore.kernel.org/all/cover.1738835231.git.zhangwei@cqsoftware.com.cn/t.mbox 
.gz
Analyzing 4 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 19 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v4 1/3] docs/zh_CN: Add self-protection index Chinese 
translation
   ✓ [PATCH v4 2/3] docs/zh_CN: Add keys index Chinese translation
   ✓ [PATCH v4 3/3] docs/zh_CN: Add secrets index Chinese translation
   ---
   ✓ Signed: DKIM/cqsoftware.com.cn
---
Total patches: 3
---
Cover: 
./v4_20250207_zhangwei_translation_self_protection_rst_into_chinese.cover
  Link: 
https://lore.kernel.org/r/cover.1738835231.git.zhangwei@cqsoftware.com.cn
  Base: not specified
        git am 
./v4_20250207_zhangwei_translation_self_protection_rst_into_chinese.mbx
[myx@fedora lwn]$ git am 
v4_20250207_zhangwei_translation_self_protection_rst_into_chinese.mbx
应用：docs/zh_CN: Add self-protection index Chinese translation
应用：docs/zh_CN: Add keys index Chinese translation
应用：docs/zh_CN: Add secrets index Chinese translation
[myx@fedora lwn]$ b4 am 20250124102136.561488-1-maoyuxian@cqsoftware.com.cn
Grabbing thread from 
lore.kernel.org/all/20250124102136.561488-1-maoyuxian@cqsoftware.com.cn/t.mbox.gz
Analyzing 3 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v4] docs/zh_CN: Add snp-tdx-threat-model index Chinese 
translation
     + Reviewed-by: Yanteng Si <si.yanteng@linux.dev> (✓ DKIM/linux.dev)
   ---
   ✓ Signed: DKIM/cqsoftware.com.cn
---
Total patches: 1
---
  Link: 
https://lore.kernel.org/r/20250124102136.561488-1-maoyuxian@cqsoftware.com.cn
  Base: applies clean to current tree
        git checkout -b v4_20250124_maoyuxian_cqsoftware_com_cn HEAD
        git am 
./v4_20250124_maoyuxian_docs_zh_cn_add_snp_tdx_threat_model_index_chinese_translation.mbx
[myx@fedora lwn]$  git am 
./v4_20250124_maoyuxian_docs_zh_cn_add_snp_tdx_threat_model_index_chinese_translation.mbx
应用：docs/zh_CN: Add snp-tdx-threat-model index Chinese translation
[myx@fedora lwn]$

I re-pushed it and it was possible to punch in the patch.

Thanks,
Yuxian


>
>
