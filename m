Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63DA37D104
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785056199; cv=none; b=M0fwQIxbGd8Ku63F78cqQhOCjKBcfqqcEhtXSRkutECPliWk69rf12A44Y5mVFIdfZFvEUk1zxAv+1G4h5NFaTbz7bt/vn9VnkWccU8uf5KxFA3Xl9fzYBU57nA8O+i8GKyZBhxCHTA+iaaUI6NOyFurOjL2leeJ+1E0+JeHqXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785056199; c=relaxed/simple;
	bh=SWBMo9cFKDpKSLtH5L+hdB5pgvgfKJSbkJIwFcPp79k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUfpPDLQyu5ZqOVy5hSfuB54MnH2p4Tge0w7F/Xnw3pk4W34Lf2u94IU9zBjnQSsQnz5830FqJtrIYELNmb7srwNLvPJkKnAODlEO2GbS9nKLVpzYTBrKH0ElbH1wDk5XEa0Wl+dwU7ikFeXnerDZ9G+DZS+AadeORzPRDj59Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=AEJIIDMy; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="AEJIIDMy"
Date: Sun, 26 Jul 2026 16:56:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785056185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SWBMo9cFKDpKSLtH5L+hdB5pgvgfKJSbkJIwFcPp79k=;
	b=AEJIIDMyp+ZuexLzbFJr0I/A33OTjRtPay0LnV4qIOl9G3GHz/aCwJtMIvTTaLSiBicZZJ
	9x6Y9vQUhNiZ0X4OMp3lf/Ygy6B7aYLSiZg2Dz5amPRpdHiXgk2ci1h+5tBT4RjAMM1SSn
	5W+rPg23g3AZoEpJivZcAVnZC5VzdajKq+FmYXMQDMajGTa6yv/HQK1GVMo7E30vIvq21m
	WUPkzO0fzI5RISr8FXCUTWtmIZnFWdC/07jW1SeA01n80cW82CMV2tZJg+NDllZfy3Tf/8
	jzM4Hah4lKyx/TLmzXnUd4X0Qqw0RLDKcpp+nxGWfocJd9Tbul5BR1rGl3AJ1w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/16] docs/zh_TW: process: localize terminology in
 2.Process.rst
Message-ID: <amXLs3GG7f8JOdcC@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-11-chenyou910331@gmail.com>
 <amG08XPfZzA5y00N@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amG08XPfZzA5y00N@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Jul 23, 2026 at 02:30:26PM +0800, Weijie Yuan wrote:
> > -Greg Kroah Hartman 目前負責維護staging 樹。仍需要修正的驅動程序將發送給他，

By the way, there should be a '-' between Kroah and Hartman.

So: Greg Kroah-Hartman

Let's mark all these down, and fix them in another series.

> 1) add a <space> before staging
> 2) remove the <space> after staging
