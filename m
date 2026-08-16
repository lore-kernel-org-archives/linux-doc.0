Received: from mta1.migadu.com (out-212.mta1.migadu.com [95.215.58.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D0A224B13
	for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 05:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856858; cv=none; b=qeznTImJdXK5PxeYHeZImPLkiDaGI4o7Ejb/vi3J/RCdHVqO1CvuUHgYNTglRbiZg/O8LLVxx3bUcRz+yQHH8/Kd1aD6TZLH/WAG9g/RAHo8CLorb4PYGcAOp4TwFY5UopaJo1prju/vMLkw7NcFaP9xvwzZSpSGpscKrj3iFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856858; c=relaxed/simple;
	bh=usNBf716QSUaNU8G219MN3HVeA/Kq24lxCj2hAKjrpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SB2XVo0MmfclqSwsmm7jJ35odBA/0MPHwWGflIWBoec1DXAqs0dfiHWfHkJGMQ9NYYUFaDANC2spygB0N1zNQBMzDj4qzansBTLnFEs5tIIPqpICWA/H3FbIW91tsepKk+W6BuPJJJp6k2hOHm4+I7UdJ/0Fu4lAJCsf0TFglhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=XZUE/1+L; arc=none smtp.client-ip=95.215.58.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="XZUE/1+L"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=usNBf716QSUaNU8G219MN3HVeA/Kq24lxCj2hAKjrpg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786856853; v=1; x=1787461653;
 b=XZUE/1+LqAK0eVdL3DH23srNzNdw6xZFFA0674AighkdmeHkz51c7jrpYZg5snCzZzYET6lu
 xq9/gubqD3J0z56tNcMBxGif7mj9PeZJw3czyAFd6rVIkluLF07AOCO1lA4pLAHoTQ4LZA/M8M4
 wNiznkAP2ZPedzjF1s7JVIsaFadtWJEGpTa4m7QXWxZsrRkML92BCe5QYrk5mAuYzvh7Mytigll
 Fpaw8vyRhToZGm4djaK+Hrj5SrZfqVYB9pjBYonESDZqEsmqsJWRAPhIRXdLJbL04VX3q2OhfhV
 qJbvh0qNCKjSvBeEhO1wi/C5cysmR1LZgacHHbH6t9LrA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 29bf43ac55638bac;
	Sun, 16 Aug 2026 05:07:23 +0000
X-Migadu-Flow: FLOW_OUT
Date: Sun, 16 Aug 2026 13:07:16 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Chen Miao <chenmiao.ku@gmail.com>, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, skhan@linuxfoundation.org, mchehab@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
Message-ID: <aoFFhGeMzQNvt0i3@wyuan.org>
References: <20260814214419.49925-1-chenmiao.ku@gmail.com>
 <20260814214419.49925-6-chenmiao.ku@gmail.com>
 <e63fa3eb-7387-461e-9215-0974213a577e@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e63fa3eb-7387-461e-9215-0974213a577e@hust.edu.cn>

On Sun, Aug 16, 2026 at 12:52:10PM +0800, Dongliang Mu wrote:
> 
> On 8/15/26 5:44 AM, Chen Miao wrote:
> > Translate the macOS Sphinx dependency setup added to the English
> > documentation. Keep the translation in a separate patch so translation
> > status tooling can track the source change correctly.
> > 
> > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > Acked-by: Weijie Yuan <wy@wyuan.org>
> > ---
> >   .../translations/zh_CN/doc-guide/sphinx.rst     | 17 ++++++++++++++++-
> >   1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > index 3375c6f3a..e6d42d970 100644
> > --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > @@ -110,6 +110,22 @@ PDF和LaTeX构建
> >   	使用Sphinx的系统打包，而不是Python虚拟环境。
> > +macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
> > +不同的文件。克隆源码前，请用 ``diskutil apfs list`` 找到 APFS 容器标识符，
> > +将下面的 ``diskX`` 替换为该标识符，并创建一个额外的大小写敏感卷::
> > +
> > +	diskutil apfs addVolume diskX APFSX Linux
> > +
> > +在 macOS 上，该脚本使用 Homebrew 安装系统依赖，输出的 Homebrew 命令不需要
> > +``sudo``。PDF 工具链由 ``mactex-no-gui`` cask 提供，所需的 DejaVu 和 Noto CJK
> > +字体则通过 Homebrew font cask 安装；如果只构建 HTML 文档，请使用 ``--no-pdf``。
> > +安装 MacTeX 后，请重新启动终端，或运行
> > +``eval "$(/usr/libexec/path_helper)"`` 使命令行工具可见。macOS 用户建议使用
> > +默认的 Python 虚拟环境，因为 PyYAML 会从
> > +``Documentation/sphinx/requirements.txt`` 安装，而不是通过 Homebrew 安装。
> > +该脚本还会检查 GNU Make 4.0 或更高版本；如果 Homebrew 将其安装为
> > +``gmake``，请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。
> > +
> 
> Hi Chen Miao,
> 
> The zh_CN only keeps the translations, therefore, you should first put this
> part into the english documenation.
> 
> Of course, you can extend this patch into one with English and zh_CN
> changes.

The English Documentation for this is in [PATCH v4 2/6], so you mean
it's better to wait until the English part is merged, then we can apply
the Chinese translation part, I guess.

If so, let's add a 'Update xxx through...' in the commit message then.

But wait..:

+该脚本还会检查 GNU Make 4.0 或更高版本；如果 Homebrew 将其安装为
+``gmake``，请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。

Now I find that this part above is not in the original patch for English
Docs, did you miss it on purpose? Sorry I didn't notice this in last
rerolls.

Thanks.
