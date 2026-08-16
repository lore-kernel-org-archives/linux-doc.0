Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67B120125F;
	Sun, 16 Aug 2026 04:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786855999; cv=none; b=IoIs2lsALfmCfN1I4PZspvLcLE8aWZDaXn5RPfADJbmd45Ry1xFhXJzIGiDkhyEc1dzKPAZpFRhewAX7zXDYi7tBkdqesynrop8abOyr9LLXpGYzzwSeFdU19iixBcqKrpYLN/q0I4LFzM562eqlHWvcf74LOKORwSNUpcN12N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786855999; c=relaxed/simple;
	bh=Tm148oDMR4B1R+OP4yVmqlGP2YnTwN2NPc0OtuMxDZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj7+z3F7lk2JnTNadFOfXEIvuPWuPcSHPV38EMKWWHeImCDzmw70ibe21y2BS1yotNYdPEK4G1mLg0QSImPjqMT0PqK5soLyUOmR0tos4aDXRiYdwUJc5D6bWEYYF+QOTo3/hLeZTkcmd5hw5DCUol6fdVnT7efh7g1ol/GoQX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrADXmjb9QYFqCXmxAA--.50967S2;
	Sun, 16 Aug 2026 12:52:13 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXsVb6QYFqErtZAA--.3978S2;
	Sun, 16 Aug 2026 12:52:11 +0800 (CST)
Message-ID: <e63fa3eb-7387-461e-9215-0974213a577e@hust.edu.cn>
Date: Sun, 16 Aug 2026 12:52:10 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
To: Chen Miao <chenmiao.ku@gmail.com>, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, skhan@linuxfoundation.org, mchehab@kernel.org,
 wy@wyuan.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260814214419.49925-1-chenmiao.ku@gmail.com>
 <20260814214419.49925-6-chenmiao.ku@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260814214419.49925-6-chenmiao.ku@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrADXmjb9QYFqCXmxAA--.50967S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWkKw17AF13tFyfXFykGrg_yoW5Gw1rpF
	4vgas3KFn7tr90kFySgrWjyr1xCF48uF43Grs3KFnxKrn5tryqqrW7KFy0gr97WryxZFyY
	va12qrWrC3yUZFDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUVZ2-DUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/15/26 5:44 AM, Chen Miao wrote:
> Translate the macOS Sphinx dependency setup added to the English
> documentation. Keep the translation in a separate patch so translation
> status tooling can track the source change correctly.
>
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> Acked-by: Weijie Yuan <wy@wyuan.org>
> ---
>   .../translations/zh_CN/doc-guide/sphinx.rst     | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> index 3375c6f3a..e6d42d970 100644
> --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> @@ -110,6 +110,22 @@ PDF和LaTeX构建
>   
>   	使用Sphinx的系统打包，而不是Python虚拟环境。
>   
> +macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
> +不同的文件。克隆源码前，请用 ``diskutil apfs list`` 找到 APFS 容器标识符，
> +将下面的 ``diskX`` 替换为该标识符，并创建一个额外的大小写敏感卷::
> +
> +	diskutil apfs addVolume diskX APFSX Linux
> +
> +在 macOS 上，该脚本使用 Homebrew 安装系统依赖，输出的 Homebrew 命令不需要
> +``sudo``。PDF 工具链由 ``mactex-no-gui`` cask 提供，所需的 DejaVu 和 Noto CJK
> +字体则通过 Homebrew font cask 安装；如果只构建 HTML 文档，请使用 ``--no-pdf``。
> +安装 MacTeX 后，请重新启动终端，或运行
> +``eval "$(/usr/libexec/path_helper)"`` 使命令行工具可见。macOS 用户建议使用
> +默认的 Python 虚拟环境，因为 PyYAML 会从
> +``Documentation/sphinx/requirements.txt`` 安装，而不是通过 Homebrew 安装。
> +该脚本还会检查 GNU Make 4.0 或更高版本；如果 Homebrew 将其安装为
> +``gmake``，请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。
> +

Hi Chen Miao,

The zh_CN only keeps the translations, therefore, you should first put 
this part into the english documenation.

Of course, you can extend this patch into one with English and zh_CN 
changes.

Dongliang Mu

>   Sphinx构建
>   ==========
>   
> @@ -409,4 +425,3 @@ Documentation/doc-guide/kernel-doc.rst 。
>      <line x1="180" y1="370" x2="500" y2="50" stroke="black" stroke-width="15px"/>
>      <polygon points="585 0 525 25 585 50" transform="rotate(135 525 25)"/>
>      </svg>
> -

