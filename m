Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A0F3C1983
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031407; cv=none; b=s/lYPT866A1pl4EfjNp1+MRQNzhXNTxz4kyGzO8FleR2jrxKfo9KnB3UkiaYW75Z34w0mDLEN5+vdZiBX5gJQNUvIJAdP9CV0lMdvvf7BcaRtlQqRM6SVq6ZKt7AnX+iCSUCtEV0E4o+UQ42vGw+ISgnLJ5iC/XjctnSOuPwnVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031407; c=relaxed/simple;
	bh=bu16v41XFVDL/1bkFACIQn0+SSHoaeeuCh5bNZiSsRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBaNkD/i4dPCFH7Y8+Sekv3oaDi0ckZh5UT7QchUYIlEb6ZyRbHj32n5QOFwgqVyBJ91OxYSNCbELoXv8qopW9hnUdTsucOzAmvQn45KYA0CTOLBgNOZJAh6OKmSmSJsvKSHq3TcLBPZqoSLV7TBgGLAEbVzwlZXdHbVeDMQHN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ZqEPmYQN; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="ZqEPmYQN"
Date: Tue, 14 Jul 2026 20:16:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784031397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T1clN2kKBid09HVFY2RNgjlEoWkc9pcIzlIe3E1ZdLk=;
	b=ZqEPmYQNdD0E9JLeaFQ9lGq2QMMAVsECiUVLnTHTVxRySit9Bgqwx9JPCmtNGhKHviSINT
	W/cItRHA+Q19F7CNoq13uTgQbLG270SqwYlKLgL2MmCtmYFH6RVuPgSag6l7GBz+xWjeEH
	C6q04pu1ctLW5NzJDvf6asIPPcUCsMT5YsyWeNkCfiaBDQDWLtYNfeaBfV7vw2EaGNcMEh
	WdjWEisjJpThZ4o5Irmqcx+aG22LMTbjWo38GOwrqyYB2OKYI4M3GtP3X8qf5ZW6Y2QCo5
	H6YuaZ6dCaJmjl74pa6sxsDK3olgjoww5C7bwOejeNJNIehA/dOL7v3xx4rNMQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <seakeel@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>,
	Yan Zhu <zhuyan2015@qq.com>, Doehyun Baek <doehyunbaek@gmail.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026)
Message-ID: <alYomSIiGeUtQI1I@wyuan.org>
References: <alUXH8qRRjno2eZG@wyuan.org>
 <CAD-N9QVXqYxtsn7YuUtCDWrwwk5+iFAkT2jcs26zbDUfwhAwsQ@mail.gmail.com>
 <alYGtkVxW_0N-VqE@wyuan.org>
 <cc922c1b-49a5-4c3a-855c-af8eb6539f62@hust.edu.cn>
 <b664685e-6785-44ae-8005-443032508096@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b664685e-6785-44ae-8005-443032508096@gmail.com>
X-Migadu-Flow: FLOW_OUT

I took a look about patchwork, it is basically like a mailing-list
version issue tracker / pull-request dashboard.

It can manage patch backlog, assign patches, record CI results, and mark
patches as accepted, rejected, superseded, or under review. and record
trailers. Well, pretty much like a mini version of Gerrit or SourceHut.

But I think it's a little complicated for our needs, as it offers many
features that we might not actually need, which involves learning costs
and maintenance costs.

Just now, while going through patchwork of other lists a bit, I didn't
seem to find a way to filter out Chinese patches from the linux-doc
list, if we were to use it.

Dongliang, is the dashboard you want exactly like the one I sent in this
email, which is read-only? Or perhaps wish there are other functions as
well. For example, you can mark the patch series you have reviewed.

I can't find what IMA is btw.

[1] An exmaple of marking status of a patch in SourceHut
    https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/70509
