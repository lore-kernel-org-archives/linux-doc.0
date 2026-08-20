Received: from mta1.migadu.com (out-222.mta1.migadu.com [95.215.58.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E112538D3F2
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205316; cv=none; b=VXE0D5I/MZILdngvKsnZTNl9vPWoDrud/qQ8n5KosKLDRBpiG41Qg4o9yx4vfLtT7qLgGISWW9+kSlR+tXqEyo5KGJXgMgoTooYcAsRI5Twh5sA9SdgOqAddaFTfH9faoLx5Awd9HNXG/wWA8SjZ7kF+i9eiNXNO2hOxoFFaOXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205316; c=relaxed/simple;
	bh=DrRtQlSDQJOx/Y9qBlHxitUx0TsmotG0yu9NDgAgUBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4TBTl0MSm/fRYQtsEI2xfMZDnzRMXdIUR7JTc5YQ/fycilu7mSjVzsDV6miqwTaHEZkBPD7R+NmokX7aopMckkkMA1nd6xsLfPROeYdPC0h5iOSMx5U4ESTIwSoaK/ovMqqT/Oxn9+ISNN74nG3+pWHtVZbtvZLX5Cl9hw+oqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=iS/uATeu; arc=none smtp.client-ip=95.215.58.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="iS/uATeu"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DrRtQlSDQJOx/Y9qBlHxitUx0TsmotG0yu9NDgAgUBg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787205309; v=1; x=1787810109;
 b=iS/uATeug6WkhvlaCXO2UNGpYx7we6orDtsKBWjPOivzDpkSS+Id1y04RNHM/KyHi4xwsDGv
 7BmK9L+HkSN4f5gBGJh139/ufmgeDW2rG5l9yrsEpoRbTOlugsfYGHYqUB901FBKRi62r/p41dq
 r8Tzl/bAF48DWUW5m7qabEDG2F3/Hhpybjjm6O+NbPA9MuBSv4kKy1ehEgMBLdSQcNR72BzQw98
 frMY2BlNHdG+E8QO0ARiPyPwLZZrGn+VVKfllamXGKOGZYCRAyQS6q4dB811NcNBbVQsh42g6CJ
 d0Cb9dlm4HF3e/RHwS4Clao4Kv8MYanh1PtRjMP7rUNXA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 05ac3a493f7f75b9;
	Thu, 20 Aug 2026 05:54:59 +0000
X-Mizu-Trace-ID: 05ac3a493f7f75b9
X-Migadu-Flow: FLOW_OUT
Date: Thu, 20 Aug 2026 13:54:52 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] docs/zh_TW: remove the last maintainer contact
 references
Message-ID: <aoaWrFQWqkYnOPw8@wyuan.org>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-8-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819145808.291567-8-chenyou910331@gmail.com>

On Wed, Aug 19, 2026 at 10:58:06PM +0800, Chen-Yu Yeh wrote:
> disclaimer-zh_TW.rst is included by every zh_TW document and told
> readers to mail the listed maintainer directly; index.rst asked
> would-be contributors to send patches to the same address.  Point both
> at MAINTAINERS instead, so the contact information lives in one place,
> and drop the remaining contact blocks in the top-level files.
> 
> This mirrors disclaimer-zh_CN.rst, which names no address and refers to
> the Chinese documentation maintainers and reviewers instead.
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  Documentation/translations/zh_TW/IRQ.txt              | 8 --------
>  Documentation/translations/zh_TW/disclaimer-zh_TW.rst | 7 ++++---
>  Documentation/translations/zh_TW/index.rst            | 2 +-
>  Documentation/translations/zh_TW/io_ordering.txt      | 6 ------
>  4 files changed, 5 insertions(+), 18 deletions(-)
> [...]
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

I actuall suggest disclaimer-zh-TW.rst being modified like how zh_CN do:

# zh_TW/disclaimer-zh_TW.rst
:orphan:

.. note::
     此文件的目的是讓中文讀者更容易閱讀與理解，而不是作為一個分支。
     因此，如果您對此文件有任何意見或更新，請先嘗試更新原始英文文件。
     如果您發現本文件與原始文件有任何不同，或有翻譯問題，請向
     該文件的譯者提交建議或補丁，或請求中文文件維護者與審閱者的協助。

That's it.

(The Spanish and Italian versions are also a good example and
reference.)

Or, if you perfer mentioning MAINTAINERS file:

# zh_TW/disclaimer-zh_TW.rst
:orphan:

.. note::
     此文件的目的是讓中文讀者更容易閱讀與理解，而不是作為一個分支。
     因此，如果您對此文件有任何意見或更新，請先嘗試更新原始英文文件。
     如果您發現本文件與原始文件有任何不同，或有翻譯問題，請向
     該文件的譯者提交建議或補丁，或請求中文文件維護者與審閱者的協助，
     詳見 MAINTAINERS 檔案。


The current version has both a '..warning' and a '..note' , but there
does not seem to be much difference between their contents. (In the
Japanese version, they have both a note and a warning, but the contents
of the two are different.)  I really do not understand why we need two
separate blocks here.

(I noticed that other languages use red warning, except zh_CN. I
personally think a grey "note" block is enough, though.)
