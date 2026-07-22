Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE7534BA5A
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733013; cv=none; b=NrzZ5wJ+8Qeqj+/LqoWwZcxhSFxhSsnTfiqsPVsQo0Db4JNggvmBlIV/Q9yc4I64ZPDdNx3zzxHFWbluUrYLf+HHcpus/6O7aGuZeroyagpBewdVZVMYQ16hpWJpUkq6rKBy5nVDojWloSP9bUJtsyO5lnJ+RTMw48RNkXHxIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733013; c=relaxed/simple;
	bh=YZLYweXRi2DcyXxezV2nqRAkZL6WYv+b5NsuT/zdy9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt+j1q6eX/Se9L0zg4cqJscqFRg4uygEFTJKqjirZ5GAvyKkpWAp0DnyhbNrpppWwaTLjRfnWR/5tSvhAV8mNXBGDIXhT7vsFnkv3Tl8tIcSNPRjBK8yq8Q8E1Ul1hQaj1ieYxclpXzHR2zs552KCQEekf8/lQLLNgX0gi2ipjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=pVQ2hCXt; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="pVQ2hCXt"
Date: Wed, 22 Jul 2026 23:09:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784732995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dywlVlhAopTIjhlQQgfefXXZB7PhKC061tN9EkYV5ew=;
	b=pVQ2hCXt9wxaHRstl3Sx+Yivb4Xs+ojG/ZvK7s7xnHgVZznd6jwD21DtRka3TyZX0+vgMb
	n01PewM1mvJ5MFFyTMIpOXSzhDSNcaobAtInlTQxDcCWH5MZIl3mFIBNCH7Ur6d/xHCTBF
	Qeiv6cv7LxdqCoOB2yokmqAzIIkM4kV0V3asyDhQG2FduITLuz0ImvW4sDExGngOyN1P3u
	ncQZ1QzwsjxlWUer/G28InsQ0k+Ol82fVraObAL2ld35BoQsTRSh15ZXQNAr3UkMA6XeXn
	9wPlUhImgpl7hBwTi8d1GRfjqY7OCl+h816bxFxY4HNP7265PEesyTn9T+CVtQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] docs/zh_TW: localize terminology and sync process/
 documents
Message-ID: <amDdPZ4SqBNg1kBa@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-1-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

Sorry to be wordy,

In our zh_CN/how-to.rst, our template for commit message is:

---
docs/zh_CN: Add self-protection index Chinese translation

Translate .../security/self-protection.rst into Chinese.

Update the translation through commit b080e52110ea
("docs: update self-protection __ro_after_init status")
# 请执行 git log --oneline <您翻译的英文文档路径>，并替换上述内容

Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
# 如果您前面的步骤正确执行，该行会自动显示，否则请检查 gitconfig 文件
---

So the ref for previous commit is wrapped, while in:

  https://docs.kernel.org/process/5.Posting.html#patch-formatting-and-changelogs

It asks do not wrap the ref of a certain commit, i.e. keep it as-is, in
the "Fixes:" trailer.

But our case is not about the "Fixes:" trailer, so my understanding is
that we should wrap the ref of previous commit in this series.

Hope there can be a consensus on this matter.

Thanks.
