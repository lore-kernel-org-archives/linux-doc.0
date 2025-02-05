Received: from mail-m49246.qiye.163.com (mail-m49246.qiye.163.com [45.254.49.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737221C16F
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 07:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738740385; cv=none; b=RPwRRpjF+Ey/YUetL55DfHPE8Gih+4+ZxEn3rQ8Nkq+AruWKJNNPTvjyfpGvRb6/tV+rzJ/3rY9ZaFSkrhOzYzFaxbBF9jeAtNAmnuEsaMknLpyiCrx9aC6M5ldlDncUZ0braAubIJYSqJiMa3RKk5pJ6vKEOTG/rT2j1pkSRx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738740385; c=relaxed/simple;
	bh=zZuaDqoBJb44ra4ySAUEzXldmuNKvbKPC7Hfe+Ey8PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcmwTCvrtn4lIPH9APYE/EIwiOugZTuDOz6rs1n0Gag7hHrD1etkTIuTTSHrb/eZ5op73kWYAaCzehgVV5xEm3LWav5NUBL0xgVMl+ZPdU+UDoK4NAjsxNbvUUzLTE/MtDD+PJles+XbXSsGMMIIpyJqum8UZ6bnh5ICYeoIhGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=VgB1N2Mi; arc=none smtp.client-ip=45.254.49.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="VgB1N2Mi"
Received: from [192.168.5.122] (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a306ce01;
	Wed, 5 Feb 2025 10:50:22 +0800 (GMT+08:00)
Message-ID: <ea95aaf2-87ea-4fcb-b88d-3739205ba5af@cqsoftware.com.cn>
Date: Wed, 5 Feb 2025 10:50:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: zhangwei@cqsoftware.com.cn
Subject: Re: [PATCH v2] docs/zh_CN: Add self-protection index Chinese
 translation
To: Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org, si.yanteng@linux.dev
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20250121051234.79066-1-zhangwei@cqsoftware.com.cn>
 <82025758-b993-47aa-a8fe-7ed6cf5a5def@cqsoftware.com.cn>
 <87y0ylfy2q.fsf@trenco.lwn.net>
From: zhangwei <zhangwei@cqsoftware.com.cn>
In-Reply-To: <87y0ylfy2q.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQh1CVkgYHRpPQhhLGUtDHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94d4040b2603abkunma306ce01
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mio6PCo*AzISQxQeIwNLFTch
	PhpPCxJVSlVKTEhDTElIQ0lISU9NVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSUlJSTcG
DKIM-Signature:a=rsa-sha256;
	b=VgB1N2MiU+FxcYrF7bWbVm566t+9nLOJOlH5n1ZRSaPR9vNxaYRI8lsBCtzqHYIbd9w/kxJI+VPGRb1GrVH0LNP7eI3DRAmWSEN4wend2tCcATeSW9BHtQJcDFQixxZ/djy8X6Ji2KBevM6BoxIb+fKP2MP57sEmzhFoovYEyw4=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=kDXhMI+yqd9rY5I2xBia7R6qPq+tcEMfbPXRt6F84g0=;
	h=date:mime-version:subject:message-id:from;


在 2025/2/5 0:56, Jonathan Corbet 写道:
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
>
> Thanks,
>
> jon

[root@fedora lwn]# git branch
* docs-next
   master
[root@fedora lwn]# git pull
Already up to date.
[root@fedora lwn]# b4 am 20250121051234.79066-1-zhangwei@cqsoftware.com.cn
Grabbing thread from 
lore.kernel.org/all/20250121051234.79066-1-zhangwei@cqsoftware.com.cn/t.mbox.gz
Analyzing 5 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2] docs/zh_CN: Add self-protection index Chinese translation
     + Reviewed-by: Yanteng Si <si.yanteng@linux.dev> (✓ DKIM/linux.dev)
     + Reviewed-by: Yuxian Mao <maoyuxian@cqsoftware.com.cn> (✓ 
DKIM/cqsoftware.com.cn)
   ---
   ✓ Signed: DKIM/cqsoftware.com.cn
---
Total patches: 1
---
  Link: 
https://lore.kernel.org/r/20250121051234.79066-1-zhangwei@cqsoftware.com.cn
  Base: applies clean to current tree
        git checkout -b v2_20250121_zhangwei_cqsoftware_com_cn HEAD
        git am 
./v2_20250121_zhangwei_docs_zh_cn_add_self_protection_index_chinese_translation.mbx
[root@fedora lwn]# git am 
./v2_20250121_zhangwei_docs_zh_cn_add_self_protection_index_chinese_translation.mbx
Applying: docs/zh_CN: Add self-protection index Chinese translation
[root@fedora lwn]#


I re-pushed it and it was possible to punch in the patch.

How do I modify it

Thanks,
zhangwei

>
