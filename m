Received: from mail-m93110.xmail.ntesmail.com (mail-m93110.xmail.ntesmail.com [103.126.93.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AD8B665
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 04:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763872587; cv=none; b=KeanHCmzdx7cWsq9tJOCDDab2bdb4jpQ/ea8SEQzMwjxrUBLfhdHmtJBRlwxO33cJun28HQuXCKXnUX9GNAtMtmuv5osx65U2q5K0JrAMHO2IC9PCsh0EHED5pXtz/HpkfAMwwgRed6jeeYFFWCul3d34ZoXuUC/ELVwJTSQBf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763872587; c=relaxed/simple;
	bh=YYaJit5CWL4uO7xOKRasqa5//MJ+FmyS255S1nKzPzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJoClIGrYEiX0r8Bq8z1DWEWRT/mKUyEv6c5s8a8zs/t3rMem33rmSX86oOlYfdvSz7/LFUFquy3vUNr1YPn5n9XGdhquX8MklBEGXcSbPaJMWrzxyqn/ZoVUhfg4MK4B35eEQoPXZ4PDpoDnL5KMLFIbg+D01OOjGe2VAyQdfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=eq+gDY8S; arc=none smtp.client-ip=103.126.93.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="eq+gDY8S"
Received: from [10.0.66.10] (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8c03a61;
	Sun, 23 Nov 2025 12:00:48 +0800 (GMT+08:00)
Message-ID: <9f59f865-4fc2-411a-9978-ea86f39bc746@leap-io-kernel.com>
Date: Sun, 23 Nov 2025 12:00:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs/zh_CN: Add wd719x.rst translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 corbet@lwn.net, linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
References: <cover.1763112421.git.yjzhang@leap-io-kernel.com>
 <f9720c918de47890c536124e7866859c866c67f4.1763112421.git.yjzhang@leap-io-kernel.com>
 <CAJy-AmkoqiOEf3mqCzYWYSVEdttEQrOJ_29MpUHm9+GW6DcYcg@mail.gmail.com>
From: Yujie Zhang <yjzhang@leap-io-kernel.com>
In-Reply-To: <CAJy-AmkoqiOEf3mqCzYWYSVEdttEQrOJ_29MpUHm9+GW6DcYcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aaedf1cdf09d6kunme5aa24a62d972e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0tMVk9NGUlNTENJHhpCGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=eq+gDY8Sw7d1zN4OrTyOp6w54zYECqZim73icNH8n3BG8mGFYytGHGT+bllmtK/45FZuSqcn/YHuhtk4dem/6pAtZwf391JdQn+lQ7bW5wxn5uGJgB4qkcmE2FcifDWZIBmQRXWMyn48dmiY+MWV/Qrdu+EpSdyCbPbqFgH7s6BjuPbfe194dZugroKZpJAilrh6PCkpTqlH7xMooJaj9OpuaMWeE+hHEbEHQ2c/VclUW4rXP2Wdo3PlQc25MTj6NZZ9SdjyXMXd0hv++kKDcH3ZDCFHNCphNFcthcnHp5rOr73ohnblhLSLrQRWy+2JMhc0IFbH3yUEYA1FZPilBw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=VZJAwgHYoa1O52lOc/7vCj9bvzFX2S8FmPW3y20O23w=;
	h=date:mime-version:subject:message-id:from;

Hi Alex,

Thanks for your review.

I have run make htmldocs locally and the generated HTML output looks 
correct on my side — I didn’t see rendering issues or warnings related 
to this header section.

Could you please point out which part of the format violates the RST 
rules, or what specific issue you observed in the HTML output?
I’d like to fix it properly.

Thanks again for your feedback.

Best regards,
Yujie Zhang

在 2025/11/22 22:29, Alex Shi 写道:
> Yujie Zhang <yjzhang@leap-io-kernel.com> 于2025年11月16日周日 15:16写道：
>>
>> Translate .../scsi/wd719x.rst into Chinese.
>> Add wd719x into .../scsi/index.rst.
>>
>> Update the translation through commit 40ee63091a40
>> ("scsi: docs: convert wd719x.txt to ReST")
>>
>> Signed-off-by: Yujie Zhang <yjzhang@leap-io-kernel.com>
>> ---
>>   .../translations/zh_CN/scsi/index.rst         |  2 +-
>>   .../translations/zh_CN/scsi/wd719x.rst        | 36 +++++++++++++++++++
>>   2 files changed, 37 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/scsi/wd719x.rst
>>
>> diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
>> index 5eecbef4c9c0..5f1803e2706c 100644
>> --- a/Documentation/translations/zh_CN/scsi/index.rst
>> +++ b/Documentation/translations/zh_CN/scsi/index.rst
>> @@ -52,6 +52,7 @@ SCSI主机适配器驱动
>>
>>      libsas
>>      sd-parameters
>> +   wd719x
>>
>>   Todolist:
>>
>> @@ -87,6 +88,5 @@ Todolist:
>>   * sym53c8xx_2
>>   * tcm_qla2xxx
>>   * ufs
>> -* wd719x
>>
>>   * scsi_transport_srp/figures
>> diff --git a/Documentation/translations/zh_CN/scsi/wd719x.rst b/Documentation/translations/zh_CN/scsi/wd719x.rst
>> new file mode 100644
>> index 000000000000..5f82c9220541
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/scsi/wd719x.rst
>> @@ -0,0 +1,36 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/scsi/libsas.rst
>> +
>> +:翻译:
>> +
>> + 张钰杰 Yujie Zhang <yjzhang@leap-io-kernel.com>
>> +
>> +:校译:
>> +
>> +
>> +
>> +===============================================================
>> +Western Digital WD7193, WD7197 and WD7296 SCSI 卡驱动
>> +===============================================================
> 
> This format looks incorrect for RST rules, did you check your output
> after do 'make htmldocs'?
> 
>> +
>> +该卡需要加载固件。固件可从 Windows NT 驱动中提取，该驱动可在以下
>> +地址从 WD 官方下载：
>> +http://support.wdc.com/product/download.asp?groupid=801&sid=27&lang=en
>> +
>> +该文件或网页上都未包含任何许可声明，因此该固件可能无法被收录到
>> +linux-firmware 项目中。
>> +
>> +提供的脚本可用于下载并提取固件，生成 wd719x-risc.bin 和
>> +wd719x-wcs.bin 文件。请将它们放置在 /lib/firmware/ 目录下。
>> +脚本内容如下：
>> +
>> +       #!/bin/sh
>> +       wget http://support.wdc.com/download/archive/pciscsi.exe
>> +       lha xi pciscsi.exe pci-scsi.exe
>> +       lha xi pci-scsi.exe nt/wd7296a.sys
>> +       rm pci-scsi.exe
>> +       dd if=wd7296a.sys of=wd719x-risc.bin bs=1 skip=5760 count=14336
>> +       dd if=wd7296a.sys of=wd719x-wcs.bin bs=1 skip=20096 count=514
>> +       rm wd7296a.sys
>> --
>> 2.25.1
>>

