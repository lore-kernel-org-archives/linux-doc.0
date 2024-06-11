Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8E363CB
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 01:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718071056; cv=none; b=k/UN2diyEnYSrCRnjB+eFvo7OKuVIWgFZMkTXljEV1KpJ56q5WNkY6xEY0SooH9Vne8skxpSD7IQ9OBnSRMur0kVyAIoAs4SfSvj6wF7LmpC0LZW8W5+A95Qd0doO9vv40wSlihzNcco/5ycxziK1K/rcu8WoTYjcT7OPQvqDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718071056; c=relaxed/simple;
	bh=nLEzaZx72iPlTnyfh9Fic3uZvO+memWkfX58YeOUF9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBUaDm7SCWBDwksLBKR61bYKcF/V4DiRPoK03g5HMUoxjJHGULYFh9Kws8fetNX1SUW4iTW7NfjsbIR6nKQ1nd3XcYsSzvqjaSgrQqH3RDWlgI+Fchn+p2B7+JugzXsKbgrPbHyRLf5bExNDSvw/PmGOMzKOxRAekvaIUw9JNE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.86])
	by gateway (Coremail) with SMTP id _____8Cx_eoHr2dm74gFAA--.22552S3;
	Tue, 11 Jun 2024 09:57:27 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.86])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfccGr2dm5ocbAA--.2625S3;
	Tue, 11 Jun 2024 09:57:27 +0800 (CST)
Message-ID: <2e5eb4da-8c3d-4875-ad8d-3dd692b98de5@loongson.cn>
Date: Tue, 11 Jun 2024 09:57:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs/zh_CN: Add userspace-api/mseal Chinese
 translation
To: cuiyudong123@126.com, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Yudong Cui <cuiyudong@kylinos.cn>,
 "dzm91@hust.edu.cn >> Dongliang Mu" <dzm91@hust.edu.cn>
References: <20240607105602.703-1-cuiyudong123@126.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <20240607105602.703-1-cuiyudong123@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxfccGr2dm5ocbAA--.2625S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw4xuFWDtF48uFW5AFWxKrX_yoWrJrW8pF
	yqkryxG3W3Jry5Gr95urnrJr18GFyxXa17Gr1xGa4YyF93CFWvkr4Utr9Iyr9rGr18AayD
	Xr48KFy0934qvacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIF
	yTuYvjxU2MKZDUUUU

Hi Yudong,


Thank you for the translation.

在 2024/6/7 18:55, cuiyudong123@126.com 写道:
> From: Yudong Cui <cuiyudong@kylinos.cn>
>
>    Translate the following documents into Chinese:
>
>    - userspace-api/mseal.rst
>
> Signed-off-by: Yudong Cui <cuiyudong@kylinos.cn>

Hmm, When I run "make htmldocs", It output WARNING:

home/siyanteng/linux-next/Documentation/translations/zh_CN/userspace-api/mseal.rst:88: 
WARNING: Unexpected indentation.
/home/siyanteng/linux-next/Documentation/translations/zh_CN/userspace-api/mseal.rst:124: 
WARNING: Title underline too short.

关于哪些内存应该被密封的注意事项:
==============================
/home/siyanteng/linux-next/Documentation/translations/zh_CN/userspace-api/mseal.rst:124: 
WARNING: Title underline too short.

关于哪些内存应该被密封的注意事项:
==============================


A compilation test is necessary before sending a patch.

And we also check that the resulting html page(in 
Documentation/output/)  is correct.

> ---
>   .../zh_CN/userspace-api/index.rst             |   1 +
>   .../zh_CN/userspace-api/mseal.rst             | 185 ++++++++++++++++++
>   2 files changed, 186 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/userspace-api/mseal.rst
>
> diff --git a/Documentation/translations/zh_CN/userspace-api/index.rst b/Documentation/translations/zh_CN/userspace-api/index.rst
> index 5b14721c8264..b7da307ec6bb 100644
> --- a/Documentation/translations/zh_CN/userspace-api/index.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/index.rst
> @@ -27,6 +27,7 @@ Linux 内核用户空间API指南
>      ebpf/index
>      sysfs-platform_profile
>      futex2
> +   mseal
>   
>   TODOList:
>   
> diff --git a/Documentation/translations/zh_CN/userspace-api/mseal.rst b/Documentation/translations/zh_CN/userspace-api/mseal.rst
> new file mode 100644
> index 000000000000..17eb9f271ae7
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/userspace-api/mseal.rst
> @@ -0,0 +1,185 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/userspace-api/mseal.rst
> +
> +:翻译:
> +
> + 崔玉栋 Yudong Cui <cuiyudong@kylinos.cn>
> +
> +=====================
> +mseal 简介
> +=====================

One English char, one "=".

One Chinese char, two "=".

> +
> +:作者: Jeff Xu <jeffxu@chromium.org>
> +
> +现代cpu支持诸如RW和NX位的内存权限。这个内存权限特性提高了内存损坏bug的安全性。
> +攻击者不能只是写入任意内存并将代码指向它，内存必须用X位标记，否则会发生异常。
> +
> +内存密封进一步保护内存映射本身不受修改。这对于缓解内存损坏问题很有用，
> +尤其是在将损坏的指针传递给内存管理系统时。例如，这样的攻击者手段可能会
> +破坏控制流完整性保证，因为本应受信任的只读内存可能变得可写，
> +或者。text页面可能被重新映射。内存密封可以由运行时加载器自动应用，
> +以密封。text和。rodata页面，并且应用程序还可以在运行时额外地密封安全关键数据。

English text:

applied by the runtime loader to seal .text and .rodata pages and


Automatic translation tools also sometimes output content that is difficult

to understand, let's polish it.


Thanks,

Yanteng


