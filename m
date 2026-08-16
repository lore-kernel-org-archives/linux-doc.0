Received: from mta1.migadu.com (out-149.mta1.migadu.com [95.215.58.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B2168BD
	for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786858745; cv=none; b=svM8e7+244mWnhSVEC+cEy2qnMv0v9AGJG1FNfVH4dEA7WHtRKCAMdO6yDDTO47Fmx343snH3Iu0Yy6YdHGl7hin5VTWFHiQ4esJAGBbkQ7RU4eCydZrS6ibe15YB7Matj/PVTzk4414lrvX52uEoaQ1WJOJY/5ULwWErA0K38I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786858745; c=relaxed/simple;
	bh=uD9tlbOWCwG3A60Vl/Zny5izUoSSAuiHChQsrYg2rIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVGpD1LYCNzrLulypLdmIP1l0IqEjI3VfzwUV0XotI0gnBw5RMZFMGSWvzarg4UxC6HfR/N7Vf0jK5E1gVFXjT2CAXqQ1fBxy0MFfncm1Qti0v4/ZLEF9bM223G9wAi+Q6zdzJYcFZhtWW/QvJ7vOyPBDOdR/6HVF7VNQHOUHh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=lGvE7rbe; arc=none smtp.client-ip=95.215.58.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="lGvE7rbe"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uD9tlbOWCwG3A60Vl/Zny5izUoSSAuiHChQsrYg2rIU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786858740; v=1; x=1787463540;
 b=lGvE7rbe312ovm8nLRgYMMtwlbq2wS3qNkfgqQgdZUIl0Ge1DFyF65PhKNoldlmtCrFJIO5s
 U5Va9Zb+KQ3P/pmKxRWDI5lXOMNDPYwUnDL6SwavHICY9XiAl87t3kjhPnrnC5bMOiui7AgbnC3
 kcR7oIhH20Y0m7MQqb8mpiLVdM9cA5kj8Oc10hIat35HXtcZTUapMbDTJWfR1Q7c+21U9L/REL7
 mYugJA8M/JIV9ALN5NFiveuk7tRLT95J0UZ+Ep4FhzGmUmkdTPn3rEHi9h9i0iJMeBypkKp2NA3
 oJ4bE7h6O3TziLrmJgkJvJVovadtLMdtABGaM4Btuqgvg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 1235b7b19aadbdff;
	Sun, 16 Aug 2026 05:39:00 +0000
X-Migadu-Flow: FLOW_OUT
Date: Sun, 16 Aug 2026 13:38:56 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Chen Miao <chenmiao.ku@gmail.com>, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, skhan@linuxfoundation.org, mchehab@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
Message-ID: <aoFM8BTNhJW9PrGd@wyuan.org>
References: <20260814214419.49925-1-chenmiao.ku@gmail.com>
 <20260814214419.49925-6-chenmiao.ku@gmail.com>
 <e63fa3eb-7387-461e-9215-0974213a577e@hust.edu.cn>
 <aoFFhGeMzQNvt0i3@wyuan.org>
 <b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn>

On Sun, Aug 16, 2026 at 01:25:51PM +0800, Dongliang Mu wrote:
> > > > diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > > > index 3375c6f3a..e6d42d970 100644
> > > > --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > > > +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > > > @@ -110,6 +110,22 @@ PDF和LaTeX构建
> > > >    	使用Sphinx的系统打包，而不是Python虚拟环境。
> > > > +macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
> > > > +不同的文件。克隆源码前，请用 ``diskutil apfs list`` 找到 APFS 容器标识符，
> > > > +将下面的 ``diskX`` 替换为该标识符，并创建一个额外的大小写敏感卷::
> > > > +
> > > > +	diskutil apfs addVolume diskX APFSX Linux
> > > > +
> > > > +在 macOS 上，该脚本使用 Homebrew 安装系统依赖，输出的 Homebrew 命令不需要
> > > > +``sudo``。PDF 工具链由 ``mactex-no-gui`` cask 提供，所需的 DejaVu 和 Noto CJK
> > > > +字体则通过 Homebrew font cask 安装；如果只构建 HTML 文档，请使用 ``--no-pdf``。
> > > > +安装 MacTeX 后，请重新启动终端，或运行
> > > > +``eval "$(/usr/libexec/path_helper)"`` 使命令行工具可见。macOS 用户建议使用
> > > > +默认的 Python 虚拟环境，因为 PyYAML 会从
> > > > +``Documentation/sphinx/requirements.txt`` 安装，而不是通过 Homebrew 安装。
> > > > +该脚本还会检查 GNU Make 4.0 或更高版本；如果 Homebrew 将其安装为
> > > > +``gmake``，请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。
> > > > +
> > > Hi Chen Miao,
> > > 
> > > The zh_CN only keeps the translations, therefore, you should first put this
> > > part into the english documenation.
> > > 
> > > Of course, you can extend this patch into one with English and zh_CN
> > > changes.
> > The English Documentation for this is in [PATCH v4 2/6], so you mean
> > it's better to wait until the English part is merged, then we can apply
> > the Chinese translation part, I guess.
> 
> Oops, I missed this patch.
> 
> Yes, I mean, this patchset should only changes the English documentation.
> And then submit another patch to sync the zh_CN translation.
> 
> The changes to how-to.rst does not affect English documentation and I had
> commented with my reviewed-by tag.

OK, thanks!

> > But wait..:
> > 
> > +该脚本还会检查 GNU Make 4.0 或更高版本；如果 Homebrew 将其安装为
> > +``gmake``，请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。
> > 
> > Now I find that this part above is not in the original patch for English
> > Docs, did you miss it on purpose? Sorry I didn't notice this in last
> > rerolls.
>
> I think Chen Miao might miss it unintentionally since this change is in
> another patch.

omg, I somehow missed the English original in [PATCH v4 3/6], too. Then
it's my fault. Chen Miao merged two parts of changes for English Docs
into one Chinese translation patch here. So he's right. I was just in a
rush to send out the email and didn't take the time to double-check my
question. Sorry for my recklessness.

Thanks!
