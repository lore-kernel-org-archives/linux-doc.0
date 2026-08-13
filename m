Received: from mta0.migadu.com (out-14.mta0.migadu.com [91.218.175.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E843713E
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638502; cv=none; b=pUIvfPvmja4JVIokPdR4/jjQX/RzI+/aohBec5G869YB1yFlgNTovbio3b9kQloq4rbSnfgpgJ8/dKS/YIRt+783LM/sIuGJD7dz2VXFt5QYZjZFTs0wmJbW5ODPSDdXqYbC/5xkQn/Azwvqc9nY6gWJ1W5nn9sDom2XH1S8FC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638502; c=relaxed/simple;
	bh=JcAcNqRXO2Bmmm1hsGn6cGhv+HrDgzfPGYyGOUJX1X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzCwh9c4nYaUHCkcWB8VaSCu03p2N2IT1yAVCATTGlHcXze4oZd5I8aqB63b0PoJkRtA00S/y2Tt0yRJFx3iQceOo60u9hOnZlzT4958Q1c7xp4wY6Ry1PqlivPmoguip5BFKsK1ReQHX//xJodCENXJCmWH526JBeqmUQJmCOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=iuOHtq89; arc=none smtp.client-ip=91.218.175.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="iuOHtq89"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JcAcNqRXO2Bmmm1hsGn6cGhv+HrDgzfPGYyGOUJX1X0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786638496; v=1; x=1787243296;
 b=iuOHtq89qmFEFRmIE2UZda15wZAIZjjK1ybwU+39ewiiKFOGsjIWDWX/x87t4kBd//SOlrzK
 U/KglN9I15CRp0fe5iazL/HwxbrfXbTNNH2NDuV9afZCoQgCMdcsTm7INeBahYitiagDM5/1XyK
 9zhWIDHJlpKH4fDy7kObOKOT+cMfjecPYstJDpimtzEXxNjA57OtSFO727u2tEaYb7Duk8Ez7Uu
 1NP86WlJG7+ph8H9UDC7VM3iqA8S6d9CDQnxVmSSY0/qaH6Q4W1kicDB5OLAJfX3DxddY7qLWox
 Uwlr6a3KmKRfPtDIc+6JW7LyTsG9fEidh/gPMs7XUe35g==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 21da4d05a01802d2;
	Thu, 13 Aug 2026 16:28:06 +0000
X-Migadu-Flow: FLOW_OUT
Date: Fri, 14 Aug 2026 00:28:02 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] docs/zh_CN: how-to: document case-sensitive APFS
 setup
Message-ID: <an3wkigzi4_vgCIN@wyuan.org>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
 <20260812182327.53694-7-chenmiao.ku@gmail.com>
 <an3m2mN3Wq-OSGKv@wyuan.org>
 <CAKxVwgcgS-ynf8Dsex_XA8Px85e8-cmMuMXABorQ_qWHmm+xRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxVwgcgS-ynf8Dsex_XA8Px85e8-cmMuMXABorQ_qWHmm+xRA@mail.gmail.com>

On Fri, Aug 14, 2026 at 12:23:46AM +0800, Chen Miao wrote:
> Weijie Yuan <wy@wyuan.org> 于2026年8月13日周四 23:46写道：
> >
> > On Thu, Aug 13, 2026 at 02:23:23AM +0800, Chen Miao wrote:
> > > The APFS volume used by macOS is case-insensitive by default, while the
> > > kernel tree contains file names that differ only in case. Document the
> > > diskutil commands needed to identify the APFS container and add a
> > > case-sensitive volume before cloning the tree.
> > >
> > > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> >
> > Acked-by: Weijie Yuan <wy@wyuan.org>
> >
> > > ---
> > >  Documentation/translations/zh_CN/how-to.rst | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> > > index 9ec2384e1..e1d3d2b8b 100644
> > > --- a/Documentation/translations/zh_CN/how-to.rst
> > > +++ b/Documentation/translations/zh_CN/how-to.rst
> > > @@ -102,6 +102,14 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
> > >  开头的命令。**请注意**，最新版本 Sphinx 的文档编译速度有极大提升，强烈建议
> > >  您通过 pip/pypi 安装最新版本 Sphinx。
> > >
> > > +macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
> > > +不同的文件。在执行 ``git clone`` 前，可在现有 APFS 容器中创建一个额外的大小写
> > > +敏感卷（先用 ``diskutil apfs list`` 找到容器标识符，并将下面的 ``diskX`` 替换为该标识符）::
> > > +
> > > +     diskutil apfs addVolume diskX APFSX Linux
> > > +
> > > +然后将内核源码克隆到新卷中。
> > > +
> > >  如果您处于一个多用户环境中，为了避免对其他人造成影响，建议您配置单用户
> > >  sphinx 虚拟环境，即只需要执行::
> >
> > Nit: In the subsequent content of this article, all commands use "make",
> > not "gmake". So, is it necessary to mention the content of the patch
> > [5/6] here? (Use gmake from Homebrew instead of make from Apple), like a
> > cross-reference, to lead the macOS users to get more detailed info.
> >
> > But I'm fine with currunt wordings. Because if you try to use 'make',
> > you'll get
> >
> >   Makefile:15: *** GNU Make >= 4.0 is required. Your Make version is 3.81.  Stop.
> >
> > then, you should realize that Homebrew had told you that you should run
> > 'gmake' instead of 'make'.
> >
> > Thanks.
> >
> I don't think an additional cross-reference is necessary here. If users
> run into Apple's older `make`, the error message clearly states that GNU
> Make >= 4.0 is required. In addition, Homebrew's `make` formula already
> explains that GNU Make is installed as `gmake`:
> 
>     $ brew install make
>     ==> Would reinstall 1 formula:
>     make
>     ...
>     GNU "make" has been installed as "gmake".
> 
> Users can then retry the command with `gmake`, so I think the current
> wording is sufficient.

Yes, so it's not a big deal.

Thanks.
