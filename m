Received: from mta0.migadu.com (out-73.mta0.migadu.com [91.218.175.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366B48C8C4
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635411; cv=none; b=JpV05qus7IBl0REyAYP+qgoKCIORFivGyW1GOWjK64TV2Ie/6akWlChvAEVpq6oHvF5XUHQGZd9doW7H5ts0KTRNIWgNC9fACmrDwiIlUzwQvHcpc9a6Ywh32qRUjcPeXS0NhHfaJvvnIXe53lZPne6vh56QG104BHDnv7vIKYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635411; c=relaxed/simple;
	bh=PDTvTE4gMxZ/dHZItIxrnXnJXy5ei1ry9kiRia+/KOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6JCEjIX6yePucgc8lpLVFGi03syX97yfp3DInM6nmTjMVp0kMRKqc0HaTQSD3ApjdnFNNT85JVhptYH/x1p2yohM8tYpjd6VQf6QhCWSvOGGCxXLqYc0ZRI7hhlPabn8kXtczwkg8j5JFtH651t5mlzez34NdMSqj1pDn5POIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=T/KmGlm2; arc=none smtp.client-ip=91.218.175.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="T/KmGlm2"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PDTvTE4gMxZ/dHZItIxrnXnJXy5ei1ry9kiRia+/KOk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786635401; v=1; x=1787240201;
 b=T/KmGlm2Y8O/Gu5zufz8+0iWWQS8LNtTADGxS/YEM/mttHzJEaWBdwaXreh0jStyxZr3wJcV
 mRM+esVkqj46VoY7Raqx7tEQIjrXhv621pXg27ZI+BCI+9ckyVV3WKVKJroOqhY6GufVlborpWH
 syOUFA0zeOn2Ru0P8pQmS5D19ufTjHMtKZBSeCRGdf0NZ30ukxnCd/yHhWu6ZL0+KDIDu0yKMD5
 A8lwW9G9dsDqBk3d40UQpMLNcfuzutVwxAR27iybx6U7G2+dAu/VjVC0A8byBemIMbKnkpK142o
 BurZa7IK9qutpHJBX5PRWBR15QmDEeYRMCM+VcXA58dTw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 5bbb4349d0321783;
	Thu, 13 Aug 2026 15:36:41 +0000
X-Migadu-Flow: FLOW_OUT
Date: Thu, 13 Aug 2026 23:36:37 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
Message-ID: <an3khZbPdI0in3Sq@wyuan.org>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
 <20260812182327.53694-6-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812182327.53694-6-chenmiao.ku@gmail.com>

On Thu, Aug 13, 2026 at 02:23:22AM +0800, Chen Miao wrote:
> Translate the macOS Sphinx dependency setup added to the English
> documentation. Keep the translation in a separate patch so translation
> status tooling can track the source change correctly.
> 
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>

Acked-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../translations/zh_CN/doc-guide/sphinx.rst     | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> index 3375c6f3a..e6d42d970 100644
> --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> @@ -110,6 +110,22 @@ PDF和LaTeX构建
>  
>  	使用Sphinx的系统打包，而不是Python虚拟环境。
>  
> +macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
> +不同的文件。克隆源码前，请用 ``diskutil apfs list`` 找到 APFS 容器标识符，
> +将下面的 ``diskX`` 替换为该标识符，并创建一个额外的大小写敏感卷::
> +
> +	diskutil apfs addVolume diskX APFSX Linux

This CLI way definitely works, while the Disk Utility app also provides
an easy way to do this. ;-) Shall we add more description or tips about
it? But I'm also satisfied with the current situation, as some hackers
who would read this may prefer CLI way.

> +在 macOS 上，该脚本使用 Homebrew 安装系统依赖，输出的 Homebrew 命令不需要
> +``sudo``。PDF 工具链由 ``mactex-no-gui`` cask 提供，所需的 DejaVu 和 Noto CJK
> +字体则通过 Homebrew font cask 安装；如果只构建 HTML 文档，请使用 ``--no-pdf``。
> +安装 MacTeX 后，请重新启动终端，或运行
> +``eval "$(/usr/libexec/path_helper)"`` 使命令行工具可见。macOS 用户建议使用
> +默认的 Python 虚拟环境，因为 PyYAML 会从
> +``Documentation/sphinx/requirements.txt`` 安装，而不是通过 Homebrew 安装。
> +该脚本还会检查 GNU Make 4.0 或更高版本；如果 Homebrew 将其安装为
> +``gmake``，请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。

Thanks for this, I like it.
