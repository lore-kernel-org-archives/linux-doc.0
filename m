Received: from mail-m1973186.qiye.163.com (mail-m1973186.qiye.163.com [220.197.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FE306D58
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113118; cv=none; b=Lh6Ktsz2J288yFaf/zDnVQhDhfFvaB1x8S1KVrAlY5vn7Vdc6nBXg7xpfPoZ/7slbbi/tkcOYopHZzt8zwAorNEIk0bf7aNAl8NAg8fwxKPvPCkid3d3G9fP0zs72rpK/XctQRuJDe4dmZjQ7EfM5BuhLILJRjIl62nTxla58Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113118; c=relaxed/simple;
	bh=62AJ1g0WRtTp7PfY0h78F+k1VBncetKXt/KZSMVFNoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p98qB6hbGDdRAC2CUW8QsWIzDhsLlhxMkqZKivYxWbVgCEMulQpe+NVJ2Zgh4FLnPvhAwzvdagykFIpIlgV6hCCaoWPx9zejxKtyZ2eZNDLzTwMlnXOFxo2jYbmRkTtc0DsuPgp4lsnACd/4x4iMoltLwNeTQIuodlG9bcxCYTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=SzA1wy8p; arc=none smtp.client-ip=220.197.31.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="SzA1wy8p"
Received: from [10.0.66.19] (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2999bd7c9;
	Fri, 14 Nov 2025 17:33:23 +0800 (GMT+08:00)
Message-ID: <c278f8a7-b9e7-4ad1-85d9-6dcabebcd0df@leap-io-kernel.com>
Date: Fri, 14 Nov 2025 17:33:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs/zh_CN: Add blk-mq.rst translation
To: WangYuli <wangyuli@aosc.io>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763105050.git.kezijie@leap-io-kernel.com>
 <f90d639dcb2a8064c6a5e85614c4da263b9942dc.1763105050.git.kezijie@leap-io-kernel.com>
 <1a228389-14dc-4d2f-ba15-e9397c83a4c6@aosc.io>
From: ke zj <kezijie@leap-io-kernel.com>
In-Reply-To: <1a228389-14dc-4d2f-ba15-e9397c83a4c6@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a81b65b6609d8kunm75c74e7b1969c20
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSE8fVkpJGh8eTx1CSx4ZGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=SzA1wy8pC4Xsq/8yHYLtkidhuiwSzMWUVkl8DUH4BKq/76FeUoPi5sbj5msb4CHil8uLdm/efnBrhaa5V/K7jMAJnV5TVYHtmMKU+tTc44MSJ8XZ1Ju97R42YBO9S6utgWi00b1Tp/oyRcZu+C1g2fM1dtgoCqvA+wHxLqe2F7zKSQMS1dmcgePjbI8LtpOFIoaX4+N5oy3vyzDnlINKNYXyNgCSk5mRA2PKwPCuk4OzB47PTuriTLnxwB8ihFPdHdcq6m9PBfiDQVpwA2XQaSirQPY/X3ZyEBjeSqUw33WTta837AEcahtGl5fUQ6GvMEJdF6CrTkoeF0FaXCfGZA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=h/cpThxcPPgdJx9vum9pzpcJ7sjRqR1GkL9D8cFZzmk=;
	h=date:mime-version:subject:message-id:from;

在 2025/11/14 15:45, WangYuli 写道:
> Hi 子杰,
> 
> On 2025/11/14 15:37, ke zijie wrote:
>> Translate .../block/blk-mq.rst into Chinese.
>> Add blk-mq into .../block/index.rst.
>>
>> Update the translation through commit 41bd33df4e18
>> ("docs: block: blk-mq.rst: correct places -> place")
>>
>> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
>> ---
>>   .../translations/zh_CN/block/blk-mq.rst       | 128 ++++++++++++++++++
>>   .../translations/zh_CN/block/index.rst        |   3 +-
>>   2 files changed, 130 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/block/blk-mq.rst
>>
>> diff --git a/Documentation/translations/zh_CN/block/blk-mq.rst b/ 
>> Documentation/translations/zh_CN/block/blk-mq.rst
>> new file mode 100644
>> index 000000000000..b6933e8e96ed
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/block/blk-mq.rst
>> @@ -0,0 +1,128 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/block/blk-mq.rst
>> +
>> +:翻译:
>> +
>> + 柯子杰 kezijie <kezijie@leap-io-kernel.com>
>> +
>> +:校译:
>> +
>> +
>> +
>> +================================================
>> +多队列块设备I/O排队机制 (blk-mq)
>> +================================================
>> +
>> +多队列块设备I/O排队机制是一组API，它使高速存储设备能够排队并同时向块设备
> 
> In general, there should be a space between Chinese characters and 
> English words or numbers.
> 
> For example, write “多队列块设备 I/O 排队机制是一组 API，” rather than 
> “多队列块设备I/O排队机制是一组API。”
> 
> Thanks,
> 
> -- 
> 
> WangYuli
> 
> 
> 
Hi Yuli,

Thank you very much for your review.

Regarding the spacing issue: I checked several translated documents and 
noticed that many of them did not include spaces between Chinese and 
English words. Because of that, I didn’t realize this was now the 
preferred convention.

Is this a recently adopted guideline for translated documentation?
If so, I will fix all spacing issues in the next version of the patch.

This is also my first time submitting a patch to the community, so 
please forgive me if I've made any beginner mistakes.

Thanks again for your time and guidance.

Best regards,
Ke Zijie
