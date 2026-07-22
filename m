Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD38E426439
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706157; cv=none; b=mKytu2DLiBJF3pCQIRn0KS6rMx4xvnxNBz8dPL4H1e5R5k3DzTzVw1yx+2Qm60mMod8HtEJh7PAwoUcC2asmhQAnnfJ7s2TbQGG0WCCxxnQat+KAp+x0epC1zX978ptrkz7t05056YroYwsD6Cd5d7L/xnvlnbHYX5Ma4ioqTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706157; c=relaxed/simple;
	bh=+f1OMNJCfMnlZEEN+bTgJYq8IH8slysGyownVhjslHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlXZaLU8g8s3Mf+Sy6HEPQPuhP+io5fGy0YF2VXOun/Ohw3RDu/dxjt5s+4Jp73YBSX1H8UzimI3SCMd+xje6uYNvR8ER8OCaHKsU+cyFjnYniaYMAz1L50lVCxQaL3ZnkpKPujXC8VJLNwvCe+eqAOI+PoYzXZ+dSFyf24VtCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=aMXNTzJR; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="aMXNTzJR"
Date: Wed, 22 Jul 2026 15:42:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784706151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76XUqIOdS18bNMK2fQusD4AOgEfN3fp+oeZVFVaslBI=;
	b=aMXNTzJRYhcZSSiH47tuElu5i15rxKeeT25ERNIrIGi3+4ILpzrgM8srF8xprUR/kfzzTN
	2hOLoXc4FZ/qAky7flmjJAmA10+B7+llyetMlQ70jMii1o6xI5Au6rtIbMwT61m5HTQLPD
	dkHEuDF/aNgg86gtgHNli3VgfPun1HZH5Uj40f4gvwwKoSd5GMvY4Ap9s3EyDvmUWFeu7p
	PtBiPIX8e3GfiO6k0GhREpF2fzYSJ5biUOjOw4DlFuSkjdIpxCeTqzAEPWk9oSxfjQFeYM
	3ncVHsaMIsIYP+JncfYIjrAsGHfZNfZ0iraIumjHRdrrmMMj+AvE044k2B9ECg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] docs/zh_TW: process: localize terminology in
 1.Intro.rst
Message-ID: <amB0YHlmmfqbJZXR@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-3-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-3-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:28AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 軟件→軟體,
> 免費軟件→自由軟體, 操作系統→作業系統, 模塊→模組, 社區→社群, ...) and
> sync with the English original: contributor identity wording now
> follows commit 43e9076a00b1 ("docs: Fix conflicting contributor
> identity info").
> 
> update to commit 5ce70894f6ca ("Doc: correct spelling and wording mistakes")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../translations/zh_TW/process/1.Intro.rst    | 211 +++++++++---------
>  1 file changed, 106 insertions(+), 105 deletions(-)

Reviewed-by: Weijie Yuan <wy@wyuan.org>

I have noticed that you have already made the correction from "免费软件"
to "自由軟體" in this patch, nice.
