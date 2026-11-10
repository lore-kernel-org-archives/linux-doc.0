Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309853;
	b=v64BEKKCDp4ucxnlfNdKVMR0pHxHcF5oPvhIxzklH9LzpDQiFy83FNJnHf2NZ1AgBEtu
	 2+BhfmUEH0upSIrdrKNvJtq1RFtoLCojrgzjTF0XU0lAsk0uVc80OldVKYgoBwdENaUUj
	 c304FTn0V8lpnkIJE67eJDbEOY/2OKtDd/ZHpM+nxYMyCnVI+3vbrY0h6quusHt5bLPJ9
	 v35YSgydKYdQu8LG+kPNP4D54p1tEsZzj9vcyo1YK1Olt1SNLbqDzEM9K2b5Y4/0DZNZI
	 caB//A7hmG0VLjKotJzRgxCt2tAEsiXx4FSBq4A43+QcEuPaB75sUtuJM4pn04Um97w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309853;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GSxk5inLl6eR4GxLhrbpF5X6yIIQQwy8bOFEMuCfqd8=;
	b=30qZknayHZsnJegKCQHQmkzw/PthKMJbcKaoALqD+F6zxNrmzBACgZ7J5gT+1a8ucJrT
	 t7/HrTVIMdkuOdjdj3s/Oy+/YQgCZXnFs814anGk/zH/vUoCDRCX1aRrUqPp7A3B8geQx
	 Nhf73Bm5mls/PNP0CNBk2iFdf68I+zsPkkHZBxkXEk/h0WpXRHEbtU+DosFhIX2nLeU/H
	 l2IY/N6HnJ+8BSfc0u+u5NkA80SJwf013Qyn0m1BqeDw+rpifYILzQ3lXnmqxDCAAA+CB
	 5JDY9Zn2xMxZMxaKEZio7wos/2YkIecx5rmeh581qfhgEf3vZStdH73pOvqC9qQiNbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=NjfWmHze;
	arc=none smtp.remote-ip=95.215.58.28
Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DDF606A326
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 11:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DDF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=NjfWmHze
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pG5FGwoCSwf/iv1r5DaRTDh4G8eWrNNp8X/5/qREznI=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309850; v=1; x=1794914650;
 b=NjfWmHzeDdBfnmge9uZgVOEZkphkXRev4Sjx+vRFNp27hn8Lnw2F9o00rRRLjmF0CowcWohZ
 ZsrYQ7BJ7mORu0NrBreWra2Hw29XaXOJha0ppObLsvu4cAjH9gevaILMkqrvYnzYalu6DFw9jCf
 9Lp5D4AqMfIIXJgv4X7TVGzcmKDIf4ziWhp9uNxC4b7rCeCFN9e3Jk4uoVgrdyRzkjd+SXRRkAW
 8gyos4XsHhEMa/eHDc6v2kwrl6A/I52o3pMeD1mstlV8bodGp5ZJnK4EP/QLO4yV5LLYNdFds6Q
 BOkWFhE1ABX9+0bMofeT+u4C/lyP/1o1GYJpcXeLrRo8Q==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a1e9ec0d085fc574;
	Tue, 10 Nov 2026 11:24:10 +0000
X-Mizu-Trace-ID: a1e9ec0d085fc574
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 19:24:06 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] docs/zh_TW: process: add applying-patches.rst
 translation
Message-ID: <avL-1n9EnJlmeT3n@wyuan.org>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <20261106113545.708896-4-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106113545.708896-4-chenyou910331@gmail.com>

Chen-Yu Yeh <chenyou910331@gmail.com> writes:

> Translate Documentation/process/applying-patches.rst into Traditional
> Chinese from the current English text, including the "Normal patches"
> and "Incremental patches" subsections of "The 5.x.y kernels".  The
> zh_CN translation was consulted for wording only.
> 
> List the new file in the toctree of process/index.rst, after
> email-clients as in the English index, and drop it from the TODOList.
> 
> update to commit fa04150b8ef7 ("Documentation: describe how to apply
> incremental stable patches")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../zh_TW/process/applying-patches.rst        | 392 ++++++++++++++++++
>  .../translations/zh_TW/process/index.rst      |   2 +-
>  2 files changed, 393 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_TW/process/applying-patches.rst
