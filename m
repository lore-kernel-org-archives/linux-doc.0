Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F043D3148B1;
	Mon, 17 Nov 2025 03:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763351070; cv=none; b=c6+VCyOpwRG5VpLEjuxAVT6gADinNX/is8R45dguFHK5FRqG3890CVYdJyNOFViRp94q5WGAOZzKpSp2imYCQqrOU0ftVsX06jnDoMa+Y1URwzKfGKs5psvZSF0jZCGjLAXFrPbmrT9t2y+8Ao+/BctH+qlK6Mtq/e+DmiPPXi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763351070; c=relaxed/simple;
	bh=FhBIa5Voij9yF144obc0n4ylOgEb2hbcuL02Wyp+8ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0f9uCEjOLVHGLd6MCsKgSaL+uuXZe5azYzhgC/6sX3PojRSnJ6GS9B2M8r9Jnradon+LY6W93Zg6LBBgmYpV6JA48oiiMYY6zU9lg3Dk8hpsEXTWyH31KtVT7CuTMi22sF/UuhFD5hOb3entC3sQuuz6EtwZ2Xo60lb9wRUmzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrABHr2YEmhpp85D9AA--.8570S2;
	Mon, 17 Nov 2025 11:44:04 +0800 (CST)
Received: from [10.12.169.45] (unknown [10.12.169.45])
	by gateway (Coremail) with SMTP id _____wA3Apr7mRppdbYRBA--.26948S2;
	Mon, 17 Nov 2025 11:43:56 +0800 (CST)
Message-ID: <77254588-fa2e-4c06-b2f2-530d74c71fc6@hust.edu.cn>
Date: Mon, 17 Nov 2025 11:43:54 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/zh_CN: Update the Chinese translation of
 kbuild.rst
To: Chenguang Zhao <zhaochenguang@kylinos.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251110080808.388549-1-zhaochenguang@kylinos.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20251110080808.388549-1-zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrABHr2YEmhpp85D9AA--.8570S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4rWrWDCF15uw13ZFWUJwb_yoWrWrWUp3
	ZxGry7Jwn8trWF93sFkFWUuF4rGwn3Ga1jqayDC3WxtrnF9rZ2gr1Uta4ktFyxG348GFWD
	WFy2gFyUCFy7AwUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/10/25 4:08 PM, Chenguang Zhao wrote:
> Finish the translation of kbuild/kbuild.rst.
>
> Update to commit 5cbfb4da7e06 ("kbuild: doc: improve
> KBUILD_BUILD_TIMESTAMP documentation")
>
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
> v3:
>   Update Chinese translation to the last commit of kbuild/kbuild.rst
>   add Chinese translation for the following commit:
>    5cbfb4da7e06 kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation
>    ceff0757f5da kbuild: rust: add PROCMACROLDFLAGS
>    11b3d5175e6b kbuild: support building external modules in a separate build directory
> ---
>   .../translations/zh_CN/kbuild/kbuild.rst      | 27 ++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> index e5e2aebe1ebc..a0415f3d8b6d 100644
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
> +这并不指定外部模块本身的输出目录(使用KBUILD_EXTMOD_OUTPUT来达到这个目的)。

Hi Chenguang,

if you would like to add space before and after English word, please 
follow it all the time, e.g., the above KBUILD_EXTMOD_OUTPUT.

>   
>   输出目录也可以使用 "O=..." 指定。
>   
>   设置 "O=..." 优先于 KBUILD_OUTPUT。
>   
> +KBUILD_EXTMOD_OUTPUT
> +--------------------
> +指定外部模块的输出目录
> +
> +设置 "MO=..."优先于 KBUILD_EXTMOD_OUTPUT.
need a space after ..." and before 优先
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
> +（运行内核时的 uname -v）。该值必须是一个可以传递给 date -d 的字符串。例如::
> +
> +	$ KBUILD_BUILD_TIMESTAMP="Mon Oct 13 00:00:00 UTC 2025" make
> +
> +默认值是内核构建某个时刻的date命令输出。如果提供该时戳，它还用于任何initramfs
> +归档文件中的mtime字段。Initramfs mtimes是32位的，因此早于Unix纪元1970年，或
> +晚于协调世界时 (UTC)2106年2月7日6时28分15秒的日期是无效的。

As mentioned in v2 patch, this is your own contribution about the 
content. Please directly revise it in the English documentation and then 
sync it to our Chinese documentation.

Dongliang Mu

>   
>   KBUILD_BUILD_USER, KBUILD_BUILD_HOST
>   ------------------------------------

