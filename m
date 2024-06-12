Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE853374FF
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718180147; cv=none; b=FrPzy7kGKgWFCFhZWnOGSMyFAImiLjcT8lcQzjSkJrVPOMwy8ctMhx5jTyXtftRGSkSfi6nA8k6imYVDvHk2e9kx/hSbAWWmZ3FSO2dCu2caDaTJ+ExlwvpTQD80V3k1UOjijHDSCka6ROsOuFaT/SbYgzx+IG7DslfvT5XJZns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718180147; c=relaxed/simple;
	bh=VEzB7v/ai/VnZMWmHCYAhgeAVV7HMum6IJA3IzllMtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMT+uHrPyvdgXvd+q60q4+kyEUMrNK7Q91ax9dn82ZlPu5N0vP0IG9qmwaJCvkyaoCRllo78rckqYPFEF+6zxDNMxJ/6fi5W0h0QCUpzd/i67uY2gbz+xEBN4U4M48nznBWLYkJGXbAQaTf8VLuUPlhBEiIs9fdgw5owndaCJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.22])
	by gateway (Coremail) with SMTP id _____8Cx7+ssWWlm8eoFAA--.8074S3;
	Wed, 12 Jun 2024 16:15:40 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.109.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxVcUpWWlm3ewcAA--.59937S3;
	Wed, 12 Jun 2024 16:15:38 +0800 (CST)
Message-ID: <51206ee7-9ebc-4ad4-87fb-6efd570cb3c1@loongson.cn>
Date: Wed, 12 Jun 2024 16:15:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: Add userspace-api/mseal Chinese
 translation
To: cuiyudong123@126.com
Cc: linux-doc@vger.kernel.org, cuiyudong123 <cuiyudong@kylinos.cn>
References: <20240611075349.1005-1-cuiyudong123@126.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <20240611075349.1005-1-cuiyudong123@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxVcUpWWlm3ewcAA--.59937S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFWUtr4xur4fur48trykCrX_yoW8GF48pF
	yrCFn3Jan0yry7Cw1xurs7Ar4rWFyfXFW7tw13t3ZYyrnY9Fs2yw42vFW2ka4UJa1fu3W5
	XF4rCFy7CasFvagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1YL9UUUUU=

Hi Yudong

在 2024/6/11 15:53, cuiyudong123@126.com 写道:
> From: cuiyudong123 <cuiyudong@kylinos.cn>
>
>    Translate the following documents into Chinese:
>
>    - userspace-api/mseal.rst
>
> Signed-off-by: cuiyudong123 <cuiyudong@kylinos.cn>
> ---
> V1 -> V2: Resolved compilation warnings and optimized the translation of documentation
> ---
>   .../zh_CN/userspace-api/index.rst             |   1 +
>   .../zh_CN/userspace-api/mseal.rst             | 186 ++++++++++++++++++
>   2 files changed, 187 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/userspace-api/mseal.rst

When I apply your patch, git output Warning:

Applying: docs/zh_CN: Add userspace-api/mseal Chinese translation
.git/rebase-apply/patch:160: trailing whitespace.
   aio/shm 可以代表用户空间调用 mmap()/munmap() , 例如 ksys_shmdt() 
在shm.c中。
.git/rebase-apply/patch:174: trailing whitespace.
   技术上，在 mseal() 被添加之前，用户可以通过调用 mprotect(RO)
.git/rebase-apply/patch:189: trailing whitespace.
正如 Jann Horn 在 [3] 中指出的那样,
.git/rebase-apply/patch:212: new blank line at EOF.
+
warning: 4 lines add whitespace errors.


And you can run :

./scripts/checkpatch.pl 
0001-docs-zh_CN-Add-userspace-api-mseal-Chinese-translati.patch


Then fix them.


Thanks,

Yanteng


