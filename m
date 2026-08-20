Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B911D387345
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 04:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201059; cv=none; b=nuGnccrVU0AdBn/xJY9ZRDzJsYn/3EO1XiZXe26jWgSQ9s4rF8Ljv8/i2xLJqatOKoTh1xQKOentgcROCqmCI7Leh3WmbAdbaUjgV69peLBwAMupUTuZYH9I1sRJlu6CvahksKcogFp0Xp4goGrNp4BMhIWk+Y3Spb6M5cSAshY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201059; c=relaxed/simple;
	bh=GQ1kpEYAMsyFKlo3cP+/6wHNA3WnSyV82WzyyDEpAdE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eh2N3+KtpU8iLvK4PKMtZ9pPWx73uzs7/Pk4OC2gj5v0os16jYzfiSRptmqtUzE4F7ZqE5w4yguuV3QKsfCEkGhrHP3p7yhfqmqE6GjRcqy9vw2PO8ZQZDx2GQjzLIu8BAvL9vnmq8BDsCbrlCzCEzVxGhHIjAnHLk7uap67hX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Fozj/T9I; arc=none smtp.client-ip=91.218.175.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Fozj/T9I"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GQ1kpEYAMsyFKlo3cP+/6wHNA3WnSyV82WzyyDEpAdE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787201054; v=1; x=1787805854;
 b=Fozj/T9I3wvaNAWY8Dm8AMuDTW2qlfXIJTbajwxKT2iuR/KTNjNTcKYunw25PFjp2FeI0S9k
 DCXfm7qbaFzDImlXKt7qXxlLowOp7s75AWAvNoOzQ/R7yK4MrthYwkmyFnSQ4bxzq4cuGJJHE1N
 tp0oQstA1Z9EgKELI012BDf4QawIGxKuVGOzVfjF5GjbB1xhk3UPD6qmQiw0eOVcCmafss6cY1E
 7imFuHEi+uFQyR3N//wIYtrn4WV/XYvfgFeUHd+ziaHU7+rQWGSKR/x0uVka4MHYXWUNrfszJ7d
 +WyoFXBk7zl4yUatvJdecmjz3X/7woQOpCSbWvre0bKfw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id ee858d71be10e2d9;
	Thu, 20 Aug 2026 04:44:14 +0000
X-Mizu-Trace-ID: ee858d71be10e2d9
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 6/7] docs/zh_TW: cpu-freq: remove maintainer contact
 information
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819145808.291567-7-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-7-chenyou910331@gmail.com>
Date: Thu, 20 Aug 2026 12:43:39 +0800
Message-Id: <178720101977.15514.14138104440682163035.b4-review@b4>
X-Mailer: b4 0.17-dev

> diff --git a/Documentation/translations/zh_TW/cpu-freq/core.rst b/Documentation/translations/zh_TW/cpu-freq/core.rst
> index 4f98d1e9f34b..8a2c835b5c50 100644
> --- a/Documentation/translations/zh_TW/cpu-freq/core.rst
> +++ b/Documentation/translations/zh_TW/cpu-freq/core.rst

> diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
> index 7f751a7add56..0e4ae51916d3 100644
> --- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
> +++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst

> diff --git a/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
> index 01ec8c837fe9..dbaa9df781e3 100644
> --- a/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
> +++ b/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst

> diff --git a/Documentation/translations/zh_TW/cpu-freq/index.rst b/Documentation/translations/zh_TW/cpu-freq/index.rst
> index a9df16870b21..c32c618dd972 100644
> --- a/Documentation/translations/zh_TW/cpu-freq/index.rst
> +++ b/Documentation/translations/zh_TW/cpu-freq/index.rst

OK, I've checked the files under cpu-freq/, seems that our translation
here is not that out of date (just a few commits left).

So in response to Jon, I think the changes in *this* patch is somehow
"meaningful" to me, because we won't touch these files in the near
future.

And for those files which we've already had a plan to do some job, I
agree with Jon's idea: We can simply delete these when
updating/synchronizing them.

Thanks.

-- 
Weijie Yuan

