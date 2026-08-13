Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DEF492513
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637278; cv=none; b=EvDyKMJYQrMq8Nvzm35VhdeCo4k39R2cj+USxptzifgbjR33oItVkc2/wJjQoeHYbO9eh1+4r6Rpv/jq9xnJvnFpOvW3dfXTkotQHVqD5ON8o5uGDRQYWT3HCX9xc9YeA+3cSIeljSHCB6R5cNX0FbWMQUDI6iBjFgudoAsmooQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637278; c=relaxed/simple;
	bh=LjvFSmatLzQycp2gGrYhd/JSobsPQVfVZza4hpoOTcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mT+MKhPWTWgmv68fML4KMcTxGI/ysP+JXNx/X+QsJTC6Ph1nK50HdOxNepwt+3Blf3PVv1UaVH2oWhsJF/MuW9TFjzJHUPvKPWIC282yY+O4VD4tEVTQBLhwxX+Q7celoLV1fcAxYTyF0/L7s2+2rdxWNYs2FWGnHf0OtP94ovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=qOCszx+H; arc=none smtp.client-ip=91.218.175.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="qOCszx+H"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LjvFSmatLzQycp2gGrYhd/JSobsPQVfVZza4hpoOTcE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786637270; v=1; x=1787242070;
 b=qOCszx+HRH/c69BmjnS1xrY1VIzHLWbuJkfpJdRB5+8KP+sHEUgHu14JIUMPA9n9zi6uKw+u
 gZjlqN+rpUuoEJAuW3N3KCLKXtudh2hrUzQafjpVbWQMK+f9d0z3RaTI8Yb/x2H9b1/R6DwFEkP
 bn6AAXIUEvuX0QS+/Ab3QEmPe2nVqOgyr4hPOlx6jbQSwOuSxetw/ELvkwARLy5c+noiP9wNYmK
 mJlNx3ZiuBG3AbYm0cqhjQ1D7w4UnmkddlTmv9HLZRqJr6seyiyFwW8jLZU2BDCl6C2gX1wJdoW
 n1P8MIqCahqy2wEwzB5ZaiQyJ4Y8/ExEQ1QipZP/im2Hg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id d4808a6179743dd3;
	Thu, 13 Aug 2026 16:07:40 +0000
X-Migadu-Flow: FLOW_OUT
Date: Fri, 14 Aug 2026 00:07:33 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
Message-ID: <an3rxYQ63VqZG8Ft@wyuan.org>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
 <20260812182327.53694-6-chenmiao.ku@gmail.com>
 <an3khZbPdI0in3Sq@wyuan.org>
 <CAKxVwgcV32j5b_C5QiXgYJdx5YeEoxi8fcBLFJggkjmBnUREqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxVwgcV32j5b_C5QiXgYJdx5YeEoxi8fcBLFJggkjmBnUREqA@mail.gmail.com>

On Fri, Aug 14, 2026 at 12:04:26AM +0800, Chen Miao wrote:
> Weijie Yuan <wy@wyuan.org> 于2026年8月13日周四 23:36写道：
> >
> > On Thu, Aug 13, 2026 at 02:23:22AM +0800, Chen Miao wrote:
> > > Translate the macOS Sphinx dependency setup added to the English
> > > documentation. Keep the translation in a separate patch so translation
> > > status tooling can track the source change correctly.
> > >
> > > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> >
> > Acked-by: Weijie Yuan <wy@wyuan.org>
> >
> > > ---
> > >  .../translations/zh_CN/doc-guide/sphinx.rst     | 17 ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > > index 3375c6f3a..e6d42d970 100644
> > > --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > > +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > > @@ -110,6 +110,22 @@ PDF和LaTeX构建
> > >
> > >       使用Sphinx的系统打包，而不是Python虚拟环境。
> > >
> > > +macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
> > > +不同的文件。克隆源码前，请用 ``diskutil apfs list`` 找到 APFS 容器标识符，
> > > +将下面的 ``diskX`` 替换为该标识符，并创建一个额外的大小写敏感卷::
> > > +
> > > +     diskutil apfs addVolume diskX APFSX Linux
> >
> > This CLI way definitely works, while the Disk Utility app also provides
> > an easy way to do this. ;-) Shall we add more description or tips about
> > it? But I'm also satisfied with the current situation, as some hackers
> > who would read this may prefer CLI way.
> >
> I don't think GUI instructions are necessary here. Readers who find diskutil
> unfamiliar can easily search for the equivalent steps in Disk Utility. The same
> operation can also be performed using Disk Utility.

Yeah, agreed. Thanks.
