Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B68D320A02;
	Mon, 17 Nov 2025 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=137.74.80.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368934; cv=none; b=T2+ffv59q1nXJ51UVhl1ugVPiH4KmV6hxGBrQQrcxCGIMZB5Z01Ph1gRsH7qIsMb/q7yB5tEAe3k7UvmYb6I8as02GcMoQl0CYJ+y/T6kxmZ2pdEaO6GmbzcnUDXrr9FPUAa8jC703mT1oviBdObic9Uoyr57272sHrfmGo/GOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368934; c=relaxed/simple;
	bh=/+sHNNsMr3nOYEHqtWHJfOhdXDqZZF0xEqxDu3wZxlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJoV6BKmYF1nr0Ubh7+bdYSDyAMFs11uDdGrZt03BuMUX0+T4j7l/PP3YyGr/K6A0i9s2rrsrgkcmqrph/JUBhx24QfR4lfaOctJnoXEYETmAvO1uizmxgUw0pFOUB2UqZCbh8f4byfev+ttY5XBGUOPTV4iRgwohGfjivjJVEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=nXpljtvx; arc=none smtp.client-ip=137.74.80.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="nXpljtvx"
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 226D8202F3;
	Mon, 17 Nov 2025 08:42:10 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id CA9814019F;
	Mon, 17 Nov 2025 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1763368927; bh=/+sHNNsMr3nOYEHqtWHJfOhdXDqZZF0xEqxDu3wZxlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nXpljtvxgiSmnWYORAXDHkgVoYOTH/1pPFUpcnogliq6GrINeBDL+MuqkTr/Uresv
	 OXvI9egAURwYECrryYP4AsRTy5t1xkoCyXQMQ9bQ7mdkpCU32O2Ghi4nITslFw9rM9
	 WJ4Bp/3ZFyffKB6A8RoEem4twPq1Zt6gSzBqozQY=
Received: from [192.168.0.64] (unknown [223.104.43.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id ADE53407D7;
	Mon, 17 Nov 2025 08:42:05 +0000 (UTC)
Message-ID: <08bb4da6-08e9-4a97-8465-8ffaa8d69516@aosc.io>
Date: Mon, 17 Nov 2025 16:42:01 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v4] docs/zh_CN: Update the Chinese translation
 of kbuild.rst
To: Chenguang Zhao <zhaochenguang@kylinos.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117082204.400487-1-zhaochenguang@kylinos.cn>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20251117082204.400487-1-zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CA9814019F
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[zhaochenguang.kylinos.cn:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Chenguang,

On 2025/11/17 16:22, Chenguang Zhao wrote:
> Finish the translation of kbuild/kbuild.rst.
>
> Update to commit 5cbfb4da7e06 ("kbuild: doc: improve
> KBUILD_BUILD_TIMESTAMP documentation")
>
> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
> v4:
>   - Add space before and after English word as suggested by Dongliang
Besides Latin letters, Arabic numerals should also be separated from CJK 
characters with a space.
>   - The changes in the v2 patch were not my contribution, they
>     were made by others and have already been merged into the
>     English documentation.
> ---
>   .../translations/zh_CN/kbuild/kbuild.rst      | 27 ++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> index e5e2aebe1ebc..3b327ba12662 100644
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
> +
> +	$ KBUILD_BUILD_TIMESTAMP="Mon Oct 13 00:00:00 UTC 2025" make
> +
> +默认值是内核构建某个时刻的date命令输出。如果提供该时戳，它还用于任何initramfs
Looks like you didn't finish the "Add spaces before and after English 
words" job :-)
> +归档文件中的mtime字段。Initramfs mtimes是32位的，因此早于Unix纪元1970年，或
> +晚于协调世界时 (UTC) 2106年2月7日6时28分15秒的日期是无效的。
>   
>   KBUILD_BUILD_USER, KBUILD_BUILD_HOST
>   ------------------------------------

BRs,

--

WangYuli

