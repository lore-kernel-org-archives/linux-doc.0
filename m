Received: from mta1.migadu.com (out-224.mta1.migadu.com [95.215.58.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165A29A9C3
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143762; cv=none; b=TS8v0/pU+Cfkpm+epuG1xzLNj64MjCcxvYP7mqBFtlsMyYe9myQVXS4TQe9L3Rci5MYRpCBIhbZmgTx1yrcJct684dq2sG8hERV2mi3flT1i1oT8pa2vc/vl2TE9ZalIS2je7G65MdknHJdpz1PiNmN1wUCtYY/cP94UXT5nENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143762; c=relaxed/simple;
	bh=f2J951cROkfpncy2BXTZpJdasYB7BfhsXeuh4zvCgIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESWI8dIxx69+mK5TbSu8WQIPKSEFy/IaMcHzf9baIK5Alq+lSXnZ1CfOxf1b5HqkXuErJBeVHwSmzU22RYnvZjnA/OMuIo+2AvJanX99arZHwthiNtfBQbJ3WaLLs6kgtyj16FE44RJyX3OBmI9OVaYqxq2jkD6nSobLbPY7OHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=RbGfpWs0; arc=none smtp.client-ip=95.215.58.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="RbGfpWs0"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f2J951cROkfpncy2BXTZpJdasYB7BfhsXeuh4zvCgIo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787143757; v=1; x=1787748557;
 b=RbGfpWs0Yc89bz3+x/1P4h8d/nDrPufS50Pd+BCy9DggIuonC0jeuU3XOnwUNcrQD/RCide8
 nC1QPIDE9Cg30eGd7QYZqLHuOuY/ajRSp4JzyizqoWH6GtbDjizunEvhV4EKq/xMan9A58bRw26
 tDDlai0zBJ2hnHV07OB5jgDJFXQXQIfbjqNqKC/mnph7IgkECLBnGQsXgPwttzy9XJ8vNke1j6B
 yqwOIdD0NylOKYsUkyBlI+NHNUE1qo1VUG88UBK51Ju4XojbG4weIhzU4Uc37UzaKuCOd5blqBS
 gb/dlVojAfI4VmjbCzZJw4GZhrrDiiZtVDO7q1ApcfNSg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 9291b077c9071f86;
	Wed, 19 Aug 2026 12:49:16 +0000
X-Migadu-Flow: FLOW_OUT
Date: Wed, 19 Aug 2026 20:49:07 +0800
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Aug 2026, #01)
Message-ID: <aoWmQ965W4WxU4yZ@wyuan.org>
References: <aoLkMBQszbzqYowy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoLkMBQszbzqYowy@wyuan.org>

On Mon, Aug 17, 2026 at 06:36:32PM +0800, Weijie Yuan wrote:
> Here are the topics waiting to be merged.
> 
> Sorry for the late update.
> 
> Last time, a contributor mentioned that he did not want to be copied, so
> this time I will only send it to the maintainer. Meanwhile, I am looking
> forward to the emergence of an automated system for our work. ;-)
> 
> 
> Copies of the source code to Chinese documentation development tree live
> in here:
> 
>     git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs linux.git
> 
> Mirrors:
> 
>     https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>     https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)

BTW, I just set up a mirror at github.com:

  https://github.com/kernel-zh/linux-zh_CN

It uses a relatively bare-bones GitHub Action to sync from kernel.org
every day (I guess it can do every 2 hours as well, but every day seems
fine, as I'm afraid that if the frequency is too high, there might be
problems.)

I don't know much about GitHub Actions, so if you have a better solution
or thoughts on this, please let me know. Or, I would be very pleased to
invite you to take over the org account and set it up.

Although I know that people here may not be so fond of GitHub, this is
what I can do now.

Thanks.
