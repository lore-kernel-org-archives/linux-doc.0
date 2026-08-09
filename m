Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBF5218EBA
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284735; cv=none; b=YaSsQoCee4Fpg4kVvs+pRVuiCkTgfJwUt8kp6wAVsm0MmVztqb6HTCSTyHyFCa4sczHb0jZEheIl9kE9Zu5aYBZcqmIkOages6oFAzG7lglee+4q5mWbcHltze/qP0mMgYnRdaDfu+Rg7j0B+jo+wjkRN2JLuYFVnSdeoPOPKlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284735; c=relaxed/simple;
	bh=M8oyVoFWHXbghQiooqNGdJTWDJWQ3hUa/ucsggQhJMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T14tQQ06uC2G2TOH5i99/CbEQgqrEtyiOp4Ujx99PK9lzvdgVo99+36jzfLh9RRgRFkPHFrhhUMuqPKE+99tYbGKpdqnVjuyIlt0pxW69ekEjN9uEXSl0eqhZSN3QGBnLfjYJ7k8KEDpNwcwbspUq6e8JQFyTOAWFj7J8DzzkMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dfljvO6Z; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dfljvO6Z"
Date: Sun, 9 Aug 2026 22:11:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1786284730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vAy6LzTPmXqnW6sC5E9xi0DLzA18eI18neNYI7h0+BM=;
	b=dfljvO6ZvqfvIHkPAXycLOQLWzgg0tPojHHKkhsuyxd7AjlhebdPwogau6Bhyd0cQ263A8
	wU0tFIRPwiei9xVkrdNjQ2rbkUTXnPsomoHxNoI4QGL8CWo9l4mC7daP6SP38eDPQXa7Ny
	oRDov2qXv8Ts1quCL3YNs7ka+jBujz4UKEIb42g5KaRSpCDLlibVt5fkfq2cQJbTBVy5sV
	u7e6eM0OaXys1O5GZ9/Ai0BO3gHmF4cG0W+YFHSNVpnRtS87RM4SjeKLNThpqLWkPjuncD
	yXv2OyHLMGQBOyHanqcciCDvNS57vWOoH6oWMBubuwYm5TCCNRWq5GfBgF4J7Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Chen Miao <chenmiao.ku@gmail.com>, corbet@lwn.net, alexs@kernel.org,
	si.yanteng@linux.dev, skhan@linuxfoundation.org, mchehab@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew
 support
Message-ID: <aniKpkE5iCCU835q@wyuan.org>
References: <20260809101923.13176-1-chenmiao.ku@gmail.com>
 <20260809101923.13176-2-chenmiao.ku@gmail.com>
 <anh6axawbEiF37WD@wyuan.org>
 <49a6022d-7d7b-4414-ba61-4482ecca4b11@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49a6022d-7d7b-4414-ba61-4482ecca4b11@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Sun, Aug 09, 2026 at 09:21:45PM +0800, Dongliang Mu wrote:
> 
> On 8/9/26 9:02 PM, Weijie Yuan wrote:
> > Hi Miao,
> > 
> > On Sun, Aug 09, 2026 at 06:19:20PM +0800, Chen Miao wrote:
> > > The dependency checker currently reports an unknown distribution on macOS
> > > and cannot provide installation hints.
> > > 
> > > Detect macOS and include its product version in the status output. Use
> > > Homebrew for formula dependencies and install MacTeX as a cask without
> > > sudo. Keep PyYAML in the virtual environment requirements because
> > > Homebrew does not provide a PyYAML formula.
> > > 
> > > Document the macOS setup and the --no-pdf option.
> > > 
> > > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > > ---
> > >   Documentation/doc-guide/sphinx.rst            |  7 ++
> > >   .../translations/zh_CN/doc-guide/sphinx.rst   |  5 ++
> > >   Documentation/translations/zh_CN/how-to.rst   |  6 ++
> > >   tools/docs/sphinx-pre-install                 | 89 ++++++++++++++++++-
> > >   4 files changed, 106 insertions(+), 1 deletion(-)
> > [...]
> > > diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> > > index 9ec2384e1..e8c91d81a 100644
> > > --- a/Documentation/translations/zh_CN/how-to.rst
> > > +++ b/Documentation/translations/zh_CN/how-to.rst
> > > @@ -102,6 +102,12 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
> > >   开头的命令。**请注意**，最新版本 Sphinx 的文档编译速度有极大提升，强烈建议
> > >   您通过 pip/pypi 安装最新版本 Sphinx。
> > > +如果您使用 macOS，脚本会使用 Homebrew 输出安装命令，Homebrew 命令不需要
> > > +sudo。PDF 构建所需的 MacTeX 通过 Homebrew cask 安装；如果只构建 HTML 文档，
> > > +可以执行 ``./tools/docs/sphinx-pre-install --no-pdf``。macOS 用户建议使用默认
> > > +的 Python 虚拟环境，因为 PyYAML 会从 ``Documentation/sphinx/requirements.txt``
> > > +安装，而不是通过 Homebrew 安装。
> > My question is perhaps quite stupid. (I'm not familiar with this part)
> > 
> > How can you make "git clone xxx/linux.git" done on your mac? I've tried
> > this before, but it seems that there's some format issue? macOS's
> > default APFS is case-insensitive.., so I guess you did some extra
> > settings? (like 'git clone --sparse' or 'git clone --filter=blob:none'?)
> > But my intuition and experience tell me that it won't be convenient ;-)
> 
> For Mac OSX, you need to first establish a Case-sensitive APFS Volume, and
> in this volume you can execute thse commands.

Yes. So what I mean is: for documentation that tries to keep the barrier
to entry for new contributors as low as possible, if we are going to
introduce macOS-specific instructions here, would it be worth mentioning
this as well (i.e. the case-sensitivity issue)?

That said, if someone is already doing this kind of work, they probably
do not need much explanation about it anyway.

> > If so, an additional description for macOS users might be more
> > user-friendly, I guess? Since the how-to file aims to lower the
> > threshold of the process of translation. (While I don't know how many
> > macOS users are potential contributors.)
> 
> I don't prefer to add many description about "how to start kernel
> development on Mac OS X". Some key parts should be enough.

Yes. Agreed.

> > And another thing is that zh_CN would prefer splitting zh_CN
> > translations apart from the original English one in your patch. Because
> > there's a script to monitor the translation status.
> > (Better confirm this with zh_CN maintainers)
> 
> This is a good suggestion. However, many minor changes of documentation
> contains EN and zh_CN in the same patch :(

Then I guess we'll just have to wait for the next patch adding a new
translation to verify the statistics produced by the script.

Thanks.
