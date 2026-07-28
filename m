Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F03A873E
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262585; cv=none; b=aejlNE8o0WnQxQkoBKTf5JYIqq4bosTJkdyRYKYkR3lxQOymJHzJg9ErKesLGX5g8qskIy5tVKbQfF9jK5TpR/KiE033sRcCTjJP+58D6uir1JoX5qeEydNOuVEVjD3HEGgYueJGJ7/ZSJpXehWBZYhVsKTaxU+lbLP9jdRWjw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262585; c=relaxed/simple;
	bh=BsA36hLe73tjLqu9GFV/wuUWWOjlwJAEU3HH4B5rUCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fehDEA92we0ujNmKEwsDBIUbSsO7fLSVJbeQ/LqqKna3+hkw0Wx/1io3/xAquNOSgj6M6RiCIRkqxQceLkNSNoE4irsAOZ4r5L5ZZTi0C85y6Dc8pFJGcPhQbjpsDF/qrePzQBLpYSaTdlbrH2tQoORFEONwIKo5TTCH3fJdfD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=vYzGdHBC; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="vYzGdHBC"
Date: Wed, 29 Jul 2026 02:16:14 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785262580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DUB8chZfGEuz3WNlcO7k75bERUEddeU3qsQmO1k20HQ=;
	b=vYzGdHBCGiTIqbC6wnuWcw62sXYNQolpCtykugHH1WjsJhV8lqqPxfyAKV0EIp2HopIWy+
	otjfulgixVPCDpw0WzccgXm5gyUiQJaNqnITNgPIFhczRF2KDhIxRF4JcQn+GPvv70w70v
	Mu2dMWY4oVH5ZoQFkRzrem7jPflr3ffIOr805p9MeiA4MlC4tHBIse5xzqPO+lins8A6WM
	nWcJP7igLAbGWFAYkBQ8NJQhpbTd+kb6yvmeik9D5XLtu21/BcidWM8Qzob6e4FnSYqWhr
	EI0ULmSNGDgwUx3MSf35FK/VVG053Obo8c2tS84bQ5z4qg/vcv3rJLi0eUhAFw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs/zh_CN: add process/applying-patches Chinese
 translation
Message-ID: <amjx7uNttBjvVZJl@wyuan.org>
References: <cover.1784289654.git.wy@wyuan.org>
 <b65902acdaa37438479b3739e907a9e0ff604c55.1784289654.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b65902acdaa37438479b3739e907a9e0ff604c55.1784289654.git.wy@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 17, 2026 at 08:07:42PM +0800, Weijie Yuan wrote:
> Translate .../process/applying-patches.rst into Chinese.
> 
> Update the translation through commit fa04150b8ef7
> ("Documentation: describe how to apply incremental stable patches")
> 
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
>  .../zh_CN/process/applying-patches.rst        | 392 ++++++++++++++++++
>  1 file changed, 392 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/process/applying-patches.rst
> 
> diff --git a/Documentation/translations/zh_CN/process/applying-patches.rst b/Documentation/translations/zh_CN/process/applying-patches.rst
> new file mode 100644
> index 000000000000..43ddb808e654
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/process/applying-patches.rst
> @@ -0,0 +1,392 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +.. _cn_applying_patches:

Sorry, just now I found that Jon has been asking for removing these
top-of-file labels for years. I'll remove them in v2.

Thanks.

> +
> +:Original: :ref:`Applying Patches To The Linux Kernel <applying_patches>`
