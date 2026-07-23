Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E653345EDE
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 06:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788231; cv=none; b=OlGpyDl6BFV6rjRRSuaHwIFL7WEPQoKFVO+uhrCymJRuycMiW0bHOjYjZwbpgmCSYAOrUjqvXeXpT1NTpZjvmCuT1ZIw/5z42lFyBOzwt2z41KrfTppyKuMQCnCCfNIIyS/xBG1jQvtnHG3W7wxob2Zg9tbH9Yrp9g+RWewrlKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788231; c=relaxed/simple;
	bh=SC4HOPJgmzKFcLjC2T9EoF5GjJySZ8S6ouk+BjPLVWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxWng1T0vM4qUdn9HFBCb8hWw86TWbUNSwAAWZGsBqglHxzSIAPVYJETdmAd0htZa5YrAbNia1/oQKi0+k3qwYfcYPnBCXH7cmqrK4wn+pXCK17uQv7sccMskN0L3Y0lxTtFrXYfA8g9LjBX8ULXXfpW+Sd9ta3x8URD8VvjYEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=jKq2hoQ5; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="jKq2hoQ5"
Date: Thu, 23 Jul 2026 14:30:09 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784788226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/yM3aP+XAqjDnMtkkZoyBHwCTDDFMJDQObjkGLbQcE=;
	b=jKq2hoQ5b9lsTZsL3Nv+BmPGpfSoL1Rx9eE3aNa5QV6Ka75rn6QcLbG1Wn8ytPAxWLNjls
	W06DRIhjLfz+78T8Y1Nmu03wmJbguHAcZGS9bb9pYcgkz/C1uXdY2i1R0NCN6z2I5TMfDv
	Bn4E5wmymK7m7R9z9X0bh/0nmtpHGY12ZH/cd+76OeABVWQZO8XW5Lz/4r1AU/aLtVpVUF
	DK1R4KWYv7/1XgaO2uCpTpiX9bNC0VdE2gIzOPzUtSTHCvlTkEkY8MdRrrsAfwFGIh/7Nq
	TYuSH7J5O892Q1xoxhAEs0KwAsOFpQDxlgMqo/9JNU5Juv22hdLgwkEpiOe1HA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/16] docs/zh_TW: process: localize terminology in
 2.Process.rst
Message-ID: <amG08XPfZzA5y00N@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-11-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-11-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:36AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 社區→社群,
> 郵箱→信箱, ...) and sync with the English original: rolling-release
> wording with the 9.x example and Wikipedia link, 9.x-rc1 examples,
> stable team now Greg Kroah-Hartman and Sasha Levin, LTS list moved to
> kernel.org, linux-next maintained by Mark Brown, and mailing lists
> hosted at subspace.kernel.org.
> 
> update to commit 46298375477b ("linux-next: update maintainer info.")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../translations/zh_TW/process/2.Process.rst  | 304 +++++++++---------
>  1 file changed, 146 insertions(+), 158 deletions(-)
> 
[...]
>  
> -一旦一個穩定的版本發佈，它的持續維護工作就被移交給“穩定團隊”，目前由
> -Greg Kroah-Hartman領導。穩定團隊將使用5.x.y編號方案不定期地發佈穩定版本的
> -更新。要合入更新版本，補丁必須（1）修復一個重要的缺陷，且（2）已經合併到
> -下一個開發版本主線中。內核通常會在其初始版本後的一個以上的開發週期內收到
> -穩定版更新。例如，5.2內核的歷史如下（2019年）：
> +一旦一個穩定的版本發布，它的持續維護工作就被移交給“穩定團隊”，目前由
> +Greg Kroah-Hartman和Sasha Levin組成。穩定團隊將使用9.x.y編號方案不定期地
> +發布穩定版本的更新。要合入更新版本，補丁必須（1）修復一個重要的缺陷，且（2）已經合併到

Wrap a little bit earlier here?

[...]
> @@ -150,74 +138,74 @@ Greg Kroah-Hartman領導。穩定團隊將使用5.x.y編號方案不定期地發
>    問題。
>  
>  - 請注意，大多數維護人員也有日常工作，因此合併補丁可能不是他們的最優先工作。
> -  如果您的補丁得到了需要更改的反饋，那麼您應該進行這些更改，或者解釋爲何
> +  如果您的補丁得到了需要更改的反饋，那麼您應該進行這些更改，或者解釋為何
>    不應該進行這些更改。如果您的補丁沒有評審意見，也沒有被其相應的子系統或
> -  驅動程序維護者接受，那麼您應該堅持不懈地將補丁更新到當前內核使其可被正常
> -  應用，並不斷地發送它以供審查和合並。
> +  驅動程式維護者接受，那麼您應該堅持不懈地將補丁更新到當前核心使其可被正常
> +  應用，並不斷地發送它以供審查和合併。
>  
> -- 合併到主線。最終，一個成功的補丁將被合併到由LinusTorvalds管理的主線存儲庫
> +- 合併到主線。最終，一個成功的補丁將被合併到由LinusTorvalds管理的主線儲存庫

s/LinusTorvalds/Linus Torvalds/

>    中。此時可能會出現更多的評論和/或問題；對開發人員來說應對這些問題並解決
>    出現的任何問題仍很重要。
[...]
>  
>  Staging 樹
>  ----------
>  
> -內核源代碼樹包含drivers/staging/目錄，其中有許多驅動程序或文件系統的子目錄
> -正在被添加到內核樹中。它們在仍然需要更多的修正的時候可以保留在driver/staging/
> -目錄中；一旦完成，就可以將它們移到內核中。這是一種跟蹤不符合Linux內核編碼或
> -質量標準的驅動程序的方法，人們可能希望使用它們並跟蹤開發。
> +核心原始程式碼樹包含drivers/staging/目錄，其中有許多驅動程式或檔案系統的子目錄
> +正在被添加到核心樹中。它們在仍然需要更多的修正的時候可以保留在driver/staging/
> +目錄中；一旦完成，就可以將它們移到核心中。這是一種追蹤不符合Linux核心編碼或
> +品質標準的驅動程式的方法，人們可能希望使用它們並追蹤開發。
>  
> -Greg Kroah Hartman 目前負責維護staging 樹。仍需要修正的驅動程序將發送給他，

1) add a <space> before staging
2) remove the <space> after staging
