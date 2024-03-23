Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26E8BE5
	for <linux-doc@vger.kernel.org>; Sat, 23 Mar 2024 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711205769; cv=none; b=O1gJKyQD8GmXkijpm7b0dJCKEoZOu0dYH8YAdWkr9GYqJHh58ubzCTbuvtwzFnHThP5sWIDav7+wThXcm2Jzx1r5NE+ggvFZoNrNJRCtWjc/ywFotKc+9MaZcJiIHQhG8hHQzbYrdxu/3FxiQ0lzo3yhPDTpd5TD+DivLNLReh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711205769; c=relaxed/simple;
	bh=YGl2EnH/HgHB56L78E5cgN0zjjxULHdiYJ/KZbLDXos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSAIq0md498G6kpAu4zz3wy4otwCsAGbvU61FrsauiUCMIjl/U31XpTFr/LBwPKpVO1wrhyk/48djy/xNhQBFjELF0YctWVDR+tSeBrYKcAWOWeIqoLTqOxfXIpGBUKMss1XhT1o1NVRY1SfJP9/uzWel7j1qcax3OOjyW2Ci6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L424DxKF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L424DxKF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=a3icl55x6+ifXw2HDBRuPpys/mdNOjsws8THqdskrU8=; b=L424DxKF7yRTs6Eigkv/fr+xe4
	IWvt3WuIvstdn/nAElULod+jo0KbPzskmqhGNmwX+0AI/GlbK/8w0eamPcOhRJN36FlKRkm9jA9+T
	ZZUxFuzFQaDcbcxF17nTLMoCZ5aykHZEu2WnXPoQVbZpzqk/a3B4K5VEy/z0lBavJWXGIqAw6ii4t
	j2BEtq5BJ21jXWdz9qrgIml1JbpZD3xjdNTN2i7wwAOg240pZPgB5kVhqn/Ze8UH0JkmQeRp6hDG/
	sJqY3fxMNiah5YA+wZ4jv0cbX+DdiBmJPpDJJWWAThqjqBEZxVjNk5dxQA3dO/VzABnF5PE92v4+2
	wgWvxlig==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro2mo-0000000Aapw-0Qk6;
	Sat, 23 Mar 2024 14:55:58 +0000
Message-ID: <b6235333-5142-468f-9f59-4454ca8531e7@infradead.org>
Date: Sat, 23 Mar 2024 07:55:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Detect variable fonts and suggest removing them
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, =?UTF-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0Lg=?=
 =?UTF-8?B?0Yc=?= <relect@bk.ru>
References: <20240323120204.155678-1-akiyks@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240323120204.155678-1-akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Akira,

On 3/23/24 05:02, Akira Yokosawa wrote:
> xelatex doesn't understand variable font format.  Recent deployment
> of variable Noto CJK fonts in Fedora and openSUSE tumbleweed breaks
> builds of translations.pdf.
> 
> To help developers work around the build error, add a script for
> checking existence of variable form of those fonts and emitting
> suggestions.  Invoke it in the error path of "make pdfdocs" so that it
> is activated only when PDF build actually fails.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Reported-by: Jonathan Corbet <corbet@lwn.net>
> Link: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
> Reported-by: "Иван Иванович" <relect@bk.ru>
> Link: https://lore.kernel.org/linux-doc/1708585803.600323099@f111.i.mail.ru/
> ---

[snip]

> ---
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/Makefile          |  2 +-
>  MAINTAINERS                     |  1 +
>  scripts/check-variable-fonts.sh | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/check-variable-fonts.sh
> 

I don't have much to say about the patch except that it seems like a good idea...

However, some of the terminology could be improved IMO.
E.g., "variable type" or "variable font" should be something like
variable-width font or proportionally-spaced font.

"static ones" should be something like fixed-space fonts or monospaced fonts.

Unless I just completely don't understand the uses of "variable" and "static" here.

> diff --git a/scripts/check-variable-fonts.sh b/scripts/check-variable-fonts.sh
> new file mode 100755
> index 000000000000..775800edb9fc
> --- /dev/null
> +++ b/scripts/check-variable-fonts.sh
> @@ -0,0 +1,30 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# For "make pdfdocs", recent trend of deploying variable type of
> +# "Noto Sans CJK" and "Noto Serif CJK" fonts breaks xelatex, which does
> +# not understand variable fonts.
> +#
> +# It is hard to distinguish variable fonts from static ones in the preamble
> +# of LaTeX source code.  Instead, this script is invoked in the error path
> +# of "make pdfdocs" and emit suggestions if such font files are found.
> +#
> +# Assumption:
> +# File names are not changed from those of upstream Noto CJK fonts:
> +#     https://github.com/notofonts/noto-cjk/
> +
> +vffonts=`fc-list -b | grep -i noto | grep -i cjk | grep -F -i -e "-vf" | \
> +	 sort | uniq | sed -e 's/\tfile:/  file:/' | sed -e 's/(s)$//'`
> +
> +if [ "x$vffonts" != "x" ] ; then
> +	echo "====================================================================="
> +	echo "Detected variable form of Noto CJK fonts incompatible with xelatex:"
> +	echo "$vffonts"
> +	echo "If you need CJK contents in PDF, remove them and install static ones."
> +	echo "Otherwise, get rid of texlive-xecjk."
> +	echo "====================================================================="
> +fi
> +
> +# As this script is invoked from Makefile's error path, always error exit
> +# even if no variable font is detected.
> +exit 1
> 
> base-commit: b8cfda5c9065cd619a97c17da081cbfab3b1e756

Thanks.
-- 
#Randy
