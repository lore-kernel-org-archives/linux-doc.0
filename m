Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7BA387345
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 04:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201053; cv=none; b=EdFUh53ygKd9ugGgX83U/3i2BmnWlKhFFHpaJj6t8q65v5dR4cyVJLQpJS5Ho+FAYXNt/L4sE2XyIoVwcaKApqNvlJybcgb2fvc5oL50VgkJCC1E5dJGAaQeRo1Kbkh9wYKyRYCF1G8Xr0kOmp30iAPfxnPbRHBwciP68SQeUsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201053; c=relaxed/simple;
	bh=bdQ8cniUWezo4mGQTDiPxOysoQCCDQOO2h9aWMCYOUU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=maKjBn10xxEb7rmmvO+aKKZawQaS5wp6gNfpByMCm+FPT3mlksGvm7GC5zm53wa2TFvovwo24f7a+HSOAdyNanuaCKjVXmC+U4GzA1TzvleFZ88h2y5ti8CikiUKer1AAn5BoboBA8RVbUY0148s7tZfgcecqk0inkW/y9IPR4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=CZno3/yW; arc=none smtp.client-ip=95.215.58.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="CZno3/yW"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bdQ8cniUWezo4mGQTDiPxOysoQCCDQOO2h9aWMCYOUU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787201047; v=1; x=1787805847;
 b=CZno3/yWfRK4WfT3Mc9VCqRUkX92iqWXSZVDJ2hW7PAcNt7krCR0ZR5b2tFIPv4rHjcRZ1mb
 2d0mR/u0gECQYZbLHi+lEULtbSuWmLRkc1GeCX7X193XrNuf7bDhcMiWgnOUlZx1fqjMgB3qiCV
 f0wDqUodteBBINE8rr9ZKWjF0KyuP/G2F8dcg668ncZLWHWBlOT3iAt0x/7rtQTGS3SZ8E5BCo7
 3DR1z0rrG2s499NTV8jm3yzxJySVY9LL0i1ZEye5+c/Mosoxk2yF1+2CCqxVWqTDZGRQbyV5XC2
 jHYiB0l7/LPXuFF/7ZLWBvtBBdW7UJ3ps/SEPv/Fa6ZIQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id b6e9fccf5e67fab6;
	Thu, 20 Aug 2026 04:44:07 +0000
X-Mizu-Trace-ID: b6e9fccf5e67fab6
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 4/7] docs/zh_TW: dev-tools: remove maintainer contact
 information
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819145808.291567-5-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-5-chenyou910331@gmail.com>
Date: Thu, 20 Aug 2026 12:43:39 +0800
Message-Id: <178720101976.15514.12790537851918266547.b4-review@b4>
X-Mailer: b4 0.17-dev

> diff --git a/Documentation/translations/zh_TW/dev-tools/gcov.rst b/Documentation/translations/zh_TW/dev-tools/gcov.rst
> index 39ac3fff44cd..69965427a51a 100644
> --- a/Documentation/translations/zh_TW/dev-tools/gcov.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/gcov.rst

> diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
> index 4fd1757c3036..8faa87f26c6a 100644
> --- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst

> diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
> index 0d38e5f80e54..915449762d1a 100644
> --- a/Documentation/translations/zh_TW/dev-tools/index.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/index.rst

> diff --git a/Documentation/translations/zh_TW/dev-tools/kasan.rst b/Documentation/translations/zh_TW/dev-tools/kasan.rst
> index 27fb7645174d..7728b50aa4b6 100644
> --- a/Documentation/translations/zh_TW/dev-tools/kasan.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/kasan.rst

> diff --git a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
> index 3b08aad1da00..140f4f946833 100644
> --- a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst

Btw, ln 28-31 of testing-overview.rst (zh_TW):

.. note::
     由於本文段中部分術語尚無較好的對應中文釋義，可能導致與原文含義
     存在些許差異，因此建議讀者結合原文
     （Documentation/dev-tools/testing-overview.rst）輔助閱讀。
     如對部分翻譯有異議或有更好的翻譯意見，歡迎聯繫譯者進行修訂。

                                                   ^^^^

As we are deleting the Translator column, it better to change the
"translator" to "maintainer". But this doesn't matter. Let's just leave
it at that.

  Note: This translation was not converted from simplified Chinese, so I
        think keeping it as it is is also okay?


Overall, same thoughts with my comments in [5/7]: the dev-tools folder
also misses a lot of transaltions, and the folder won't be touch soon by
us in the near future. So I'm okay with it.

Thanks.

-- 
Weijie Yuan

