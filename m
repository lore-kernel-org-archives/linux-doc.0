Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147683271F7;
	Mon, 17 Nov 2025 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372973; cv=none; b=DLitou4MaqzpjcS1Oa/HpOwJBI92out5qOoXv1ngpM7fM7Mqxzw73vCcXbeRAq91/RiLYpqDRO2Y6XgzkuxWoePYC5qKShyxfFlTeZaAUCuQd3iVeMD5si6I0rjm79ylIb0Yn+YP4VmJSpYnkTuf4YiqUH6LCpDwmLZQW1j5M3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372973; c=relaxed/simple;
	bh=xMhOnnj753qpQYwSZLgCWOUFm7iWrbd9xRT5c4gGFdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNBGDvrTXnEw8ui9vdUlydcLZY9xL/p7lWpE+87LdzSo/DP9JHR2ECIPccO8S9ixjknw473Jr9V7Xr+tzC0FZb/05xBTI3cWXkBprgdl2UhmODzAFpja2iN2W+Hi2qhu3/ybaTkNTtEKw7MUqueYP1aH7jq6/QpxsVTA/bzfy4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAAnLqaT7xppRzX+AA--.35041S2;
	Mon, 17 Nov 2025 17:49:07 +0800 (CST)
Received: from [10.12.169.45] (unknown [10.12.169.45])
	by gateway (Coremail) with SMTP id _____wAXH5uO7xppB0YTBA--.44008S2;
	Mon, 17 Nov 2025 17:49:03 +0800 (CST)
Message-ID: <7360539b-dffc-4f02-bd74-b2038be7a85b@hust.edu.cn>
Date: Mon, 17 Nov 2025 17:49:02 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v5] docs/zh_CN: Update the Chinese translation
 of kbuild.rst
To: Chenguang Zhao <zhaochenguang@kylinos.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 WangYuli <wangyuli@aosc.io>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117093041.458075-1-zhaochenguang@kylinos.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20251117093041.458075-1-zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAnLqaT7xppRzX+AA--.35041S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGr18WFWxJFWfurW8JFykAFb_yoWrJFWUpw
	nxGryxJ3ZFyryYk3srKFWUuF4rGwn7Ga1jganrG3Z7tr12939Fqr1Uta4ktF97G348GFWD
	WFWUWFy8CFy7AwUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/17/25 5:30 PM, Chenguang Zhao wrote:
> Finish the translation of kbuild/kbuild.rst.
>
> Update to commit 5cbfb4da7e06 ("kbuild: doc: improve
> KBUILD_BUILD_TIMESTAMP documentation")
>
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
> v5:
>   - Add spaces before and after English word and Arabic numerals
>     as suggested by WangYu.
> ---
>   .../translations/zh_CN/kbuild/kbuild.rst      | 27 ++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> index e5e2aebe1ebc..57f5cf5b2cdd 100644
> --- a/Documentation/translations/zh_CN/kbuild/kbuild.rst
> +++ b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> @@ -93,6 +93,16 @@ HOSTRUSTFLAGS
>   -------------
>   在构建主机程序时传递给 $(HOSTRUSTC) 的额外标志。
>   
> +PROCMACROLDFLAGS
> +----------------
> +用于链接 Rust 过程宏的标志。由于过程宏是由 rustc 在构建时加载的，
> +因此必须以与当前使用的 rustc 工具链兼容的方式进行链接。
> +
> +例如，当 rustc 使用的 C 库与用户希望用于主机程序的 C 库不同时，
> +此设置会非常有用。
> +
> +如果未设置，则默认使用链接主机程序时传递的标志。
> +
>   HOSTLDFLAGS
>   -----------
>   链接主机程序时传递的额外选项。
> @@ -135,12 +145,18 @@ KBUILD_OUTPUT
>   指定内核构建的输出目录。
>   
>   在单独的构建目录中为预构建内核构建外部模块时，这个变量也可以指向内核输出目录。请注意，
> -这并不指定外部模块本身的输出目录。
> +这并不指定外部模块本身的输出目录(使用 KBUILD_EXTMOD_OUTPUT 来达到这个目的)。
>   
>   输出目录也可以使用 "O=..." 指定。
>   
>   设置 "O=..." 优先于 KBUILD_OUTPUT。
>   
> +KBUILD_EXTMOD_OUTPUT
> +--------------------
> +指定外部模块的输出目录
> +
> +设置 "MO=..." 优先于 KBUILD_EXTMOD_OUTPUT.
> +
>   KBUILD_EXTRA_WARN
>   -----------------
>   指定额外的构建检查。也可以通过在命令行传递 "W=..." 来设置相同的值。
> @@ -290,8 +306,13 @@ IGNORE_DIRS
>   KBUILD_BUILD_TIMESTAMP
>   ----------------------
>   将该环境变量设置为日期字符串，可以覆盖在 UTS_VERSION 定义中使用的时间戳
> -（运行内核时的 uname -v）。该值必须是一个可以传递给 date -d 的字符串。默认值是
> -内核构建某个时刻的 date 命令输出。
> +(运行内核时的 uname -v) 。该值必须是一个可以传递给 date -d 的字符串。例如::

Please take a look at my comment carefully. Don't modify the Chinese 
documentation directly.

If you really want to do this, please directly revise the corresponding 
English documentation - Documentation/kbuild/kbuild.rst.

After your revision is accepted, we will sync it to our translated 
documentation.

Dongliang Mu

> +
> +	$ KBUILD_BUILD_TIMESTAMP="Mon Oct 13 00:00:00 UTC 2025" make
> +
> +默认值是内核构建某个时刻的 date 命令输出。如果提供该时戳，它还用于任何 initramfs 归
> +档文件中的 mtime 字段。 Initramfs mtimes 是 32 位的，因此早于 Unix 纪元 1970 年，或
> +晚于协调世界时 (UTC) 2106 年 2 月 7 日 6 时 28 分 15 秒的日期是无效的。
>   
>   KBUILD_BUILD_USER, KBUILD_BUILD_HOST
>   ------------------------------------

