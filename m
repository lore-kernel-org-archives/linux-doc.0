Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CEA3C9EEB;
	Sun, 16 Aug 2026 04:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856117; cv=none; b=J37Cn5ygrav/FbM2lZBL277QYX674b/UtAcUdAHEXhZBXProYe8CPC3gl3l08YqpCowHwL7+Dh+LEjoKQmliLtHbdMUFO3SZTmOX21E6AAjNND4xBvV1iswLSGRBNHVbIhOTfIZk5RDsQjOSMEpKxV87nMch4oNVnSXaKWLn5f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856117; c=relaxed/simple;
	bh=gFjWFp/I07Sg4yakcJ6JFxdr9BLrw6Um83SfNFbVcIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVb5U7U0EfT4VDyJwVWGn1XziztXGvrzVQ38QcgO5+DMzKrEWLrCPIriRTvFadtvFbziV8mpG7gcjuHkacfwQcT9vAFpWZUiQ0IqABwgoaJNeP3LCiDRgEYQXhIlYLXL/YJdGceQUzZbD87+wzxjlGB6aGf+7Mso1KskR4Au7AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrACXbTR4QoFqr3mxAA--.51143S2;
	Sun, 16 Aug 2026 12:54:16 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCnclZ3QoFq8rxZAA--.31737S2;
	Sun, 16 Aug 2026 12:54:15 +0800 (CST)
Message-ID: <1043962f-69e1-40cd-8f67-cc91f2f1c488@hust.edu.cn>
Date: Sun, 16 Aug 2026 12:54:15 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] docs/zh_CN: how-to: document case-sensitive APFS
 setup
To: Chen Miao <chenmiao.ku@gmail.com>, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, skhan@linuxfoundation.org, mchehab@kernel.org,
 wy@wyuan.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260814214419.49925-1-chenmiao.ku@gmail.com>
 <20260814214419.49925-7-chenmiao.ku@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260814214419.49925-7-chenmiao.ku@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACXbTR4QoFqr3mxAA--.51143S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr48Cr48Jry3uF15Gw15Arb_yoW8ZF13pF
	109r1xKFn7AF15C397KFy7AF4xWFyxCw4Ikw1qq3ZFvrn5tF95tFW3K34qgFn7Jr92kFyr
	XFW29FyfCry3ZFJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0EksPUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/15/26 5:44 AM, Chen Miao wrote:
> The APFS volume used by macOS is case-insensitive by default, while the
> kernel tree contains file names that differ only in case. Document the
> diskutil commands needed to identify the APFS container and add a
> case-sensitive volume before cloning the tree.
>
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> Acked-by: Weijie Yuan <wy@wyuan.org>

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

BTW, this how-to file is only guidance for Chinese contributors. So 
there is no original English documentation and we don't need change the 
english documentation at the same time.

Dongliang Mu

> ---
>   Documentation/translations/zh_CN/how-to.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> index 9ec2384e1..e1d3d2b8b 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -102,6 +102,14 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
>   开头的命令。**请注意**，最新版本 Sphinx 的文档编译速度有极大提升，强烈建议
>   您通过 pip/pypi 安装最新版本 Sphinx。
>   
> +macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
> +不同的文件。在执行 ``git clone`` 前，可在现有 APFS 容器中创建一个额外的大小写
> +敏感卷（先用 ``diskutil apfs list`` 找到容器标识符，并将下面的 ``diskX`` 替换为该标识符）::
> +
> +	diskutil apfs addVolume diskX APFSX Linux
> +
> +然后将内核源码克隆到新卷中。
> +
>   如果您处于一个多用户环境中，为了避免对其他人造成影响，建议您配置单用户
>   sphinx 虚拟环境，即只需要执行::
>   

