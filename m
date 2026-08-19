Received: from mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2DE4908DD
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159940; cv=none; b=CJm4RVsrtnFFEih/+W9BtrBtg2sBBEeAZrgVYSclrqsNJiD3Ad4sdhk1O+5ettn6I8NEnE7Bt+wM2Qa5qgb0ArsqMpy2vz1XNNTnhVlLERyHGiVIpxZxiSotdCYTu65N2H6hUeSgps4BwPXgOs6xGnC40pJiegUTvZKl3iJU8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159940; c=relaxed/simple;
	bh=FCBlr1qC7aVSJ28aoEa1fp/PJENuotGbz2x+c+V4f9I=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=krgviyTSWUsW7hYEQMqjB5Dgek8cltZ84rMd8ldbLn+CfCFIkjB7j97GE9eNGC5r2/iohogmUrjc+77rxgTdS7YTGT/554mFrU3sNAL9mnEwb37i8GZ01iLs5/29mbNzb48be80JhZQF/cKn13zGsySi1qkCSgrSRy7A3QIO+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dyAYbZYn; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dyAYbZYn"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FCBlr1qC7aVSJ28aoEa1fp/PJENuotGbz2x+c+V4f9I=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787159898; v=1; x=1787764698;
 b=dyAYbZYnSb0X0uW2uRlefbIqjtYPKscFCaH1DdoXkC49PDnmugRanHB5sPcDDJVysE931SsU
 DEIj8YtATOhj7yAqB4kBe6ioNnWq8XFtm47N6OQ3VIBSy0ESLClE0VP+R4P9Cefo9r/TOlHL6ih
 3Fkrea9+ahZacgjXQ9226F8kn+sfnArZoQR9aqcpRd0bc9FWaoUDGBHOFeFKKsnP1DAnnrld72X
 E1D4+IiwuvF6rasB+Ux9hd1qhAmRIYqXIXF4al3auKDjlN2SWnzNclwoBd17YmX/aUPpG0fNtLX
 3gw25Pb+4Aw9DHixETv346IgrHz8teN0pEGS7ojRSGAdA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id ca268152c08f691d;
	Wed, 19 Aug 2026 17:18:08 +0000
X-Mizu-Trace-ID: ca268152c08f691d
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 7/7] docs/zh_TW: remove the last maintainer contact
 references
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819145808.291567-8-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-8-chenyou910331@gmail.com>
Date: Thu, 20 Aug 2026 01:17:34 +0800
Message-Id: <178715985494.54895.2755625001946358260.b4-review@b4>
X-Mailer: b4 0.17-dev

> diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
> index 8115a7618307..b9a3e18495d2 100644
> --- a/Documentation/translations/zh_TW/IRQ.txt
> +++ b/Documentation/translations/zh_TW/IRQ.txt
> @@ -6,8 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
>  help.  Contact the Chinese maintainer if this translation is outdated
>  or if there is a problem with the translation.
>  
> -Maintainer: Eric W. Biederman <ebiederman@xmission.com>
> -Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
>  ---------------------------------------------------------------------
>  Documentation/core-api/irq/index.rst 的繁體中文翻譯
>  
> @@ -15,12 +13,6 @@ Documentation/core-api/irq/index.rst 的繁體中文翻譯
>  交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
>  者翻譯存在問題，請聯繫繁體中文版維護者。
>  
> -英文版維護者： Eric W. Biederman <ebiederman@xmission.com>
> -繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> -繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> -繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> -
> -
>  以下爲正文
>  ---------------------------------------------------------------------
>  何爲 IRQ?

I actually suggest deleting this file (IRQ.txt) directly.

I don't see it in English Original Documentation folder. I guess it has
been removed already?

> diff --git a/Documentation/translations/zh_TW/disclaimer-zh_TW.rst b/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
> index 28b734c223b6..b65cffabd696 100644
> --- a/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
> +++ b/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
> @@ -3,9 +3,10 @@
>  .. warning::
>       此文件的目的是爲讓中文讀者更容易閱讀和理解，而不是作爲一個分支。因此，
>       如果您對此文件有任何意見或改動，請先嘗試更新原始英文文件。如果要更改或
> -     修正某處翻譯文件，請將意見或補丁發送給維護者（聯繫方式見下）。
> +     修正某處翻譯文件，請將意見或補丁發送給繁體中文文件的維護者（見
> +     MAINTAINERS 檔案）。
>  
>  .. note::
> -     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請聯繫該文件的譯者，
> -     或者發送電子郵件給胡皓文以獲取幫助：<2023002089@link.tyut.edu.cn>。
> +     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請發建議或者補丁給
> +     繁體中文文件的維護者和審閱者（見 MAINTAINERS 檔案）。
>  
> diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
> index 660a74d2023c..e72f86e37f2d 100644
> --- a/Documentation/translations/zh_TW/index.rst
> +++ b/Documentation/translations/zh_TW/index.rst
> @@ -15,7 +15,7 @@
>  
>  .. note::
>     內核文檔繁體中文版的翻譯工作正在進行中。如果您願意並且有時間參與這項工
> -   作，歡迎提交補丁給胡皓文 <2023002089@link.tyut.edu.cn>。
> +   作，歡迎將補丁提交給繁體中文文件的維護者（見 MAINTAINERS 檔案）。
>  
>  與Linux 內核社區一起工作
>  ------------------------
> diff --git a/Documentation/translations/zh_TW/io_ordering.txt b/Documentation/translations/zh_TW/io_ordering.txt
> index 00b374092d7e..8ced3f08e69d 100644
> --- a/Documentation/translations/zh_TW/io_ordering.txt
> +++ b/Documentation/translations/zh_TW/io_ordering.txt

I'm actually quite curious about why this file is at the top level of
zh_TW/, I see this file originally is at Documentation/driver-api/io_ordering.rst

I suggest directly removing this file entirely.

> @@ -6,7 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
>  help.  Contact the Chinese maintainer if this translation is outdated
>  or if there is a problem with the translation.
>  
> -Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
>  ---------------------------------------------------------------------
>  Documentation/driver-api/io_ordering.rst 的繁體中文翻譯
>  
> @@ -14,11 +13,6 @@ Documentation/driver-api/io_ordering.rst 的繁體中文翻譯
>  交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
>  者翻譯存在問題，請聯繫繁體中文版維護者。
>  
> -繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> -繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> -繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>

I have to agree to remove these lines though. As a newcomer, I obviously
have no idea what historical reasons compelled us to write these three
lines.

For English speakers, these 3 lines means:

Traditional Chinese (version) maintainer:
Traditional Chinese (version) translator:
Traditional Chinese (version) proofreader:

If you happen to know the reason for writing it this way, please feel
free to let me know. Thank you.

(Reply with b4 review tui ;-))
Comments continue...

-- 
Weijie Yuan <wy@wyuan.org>
