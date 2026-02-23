Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE714377543;
	Mon, 23 Feb 2026 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882695; cv=none; b=ZeyZFUmhIryHtV5IqybXFDZnMVM2KYogFLHBdcRT/CrFe5bsl3chjCQzUFhipK5lQbJr64tcLL4ZtmeDFM1VaWCF5Do4psH/J6DYR4c7Ozyu47Fn+VhWYNErRhpAZi6KIFCasdRV4wSTjfEaDYzCdRMQxV9yJ9yfWuk2mP+edv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882695; c=relaxed/simple;
	bh=rursJlRwqXyD2bSGh6y4/ZstHxXVRq+jxVxxBWlCBp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kfFhVE440vyYUnmWeKWlzWmj+r7jyApw7Kv7XmqeZG5kMU5ZHEp/n/YRNtsB+D/Hn2IA0sVLiJ1huDIcOYQ4eDSduzfou3cnjZWUC7nmW7/VvzMASH1/l8eMFWR/g3CyT5KzokssVdoNbddTxsZ9LUWPIufKqKBZyxq93oQAs+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mY7bSBQC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mY7bSBQC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3CB81411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771882693; bh=3JnlMoh8qs12CiBWq6JB4l2IWfxAcGfSWYKIE+V1veQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mY7bSBQC3ii4N737iQTnL49KgW5cHtSZgbfjq32gTc1N8q+5OGXJiKQmAYfTaGPO4
	 n7aikCHY6Hqe+HeQv3rB/YNG6/mWSMrOX/jFaHvqci9vNtuRnkv+XepVN0sKkHJaGy
	 cr8SSz387vSJrkkv8LU0K3Wr2fG4ZScK9Mm9RlFVdDkYZjdL2tEeaxZSwF9niT/G8N
	 jK9lsrjaPx3hkBLoyJ3LYyEZ6HJmE9AfTSVVUJf3SToyq35F0qqbAxp6rmyBmOw2v+
	 6nFCWHERDyWIFFx7nhEzWKbF7s4nhnfE4OE/Ena5G1bIi5aiUwijqcqLzrbYOWaxlb
	 Kd7NXT56GhTlw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3CB81411D3;
	Mon, 23 Feb 2026 21:38:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, David Gow <davidgow@google.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] docs: admin-guide: update tiny script for number of
 taint flags
In-Reply-To: <20260216063729.2832770-1-rdunlap@infradead.org>
References: <20260216063729.2832770-1-rdunlap@infradead.org>
Date: Mon, 23 Feb 2026 14:38:12 -0700
Message-ID: <87ms0z3zuj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Account for 2 new taint flags being added by increasing the number of
> bits handled by the tiny show-tainted-flags example script.
>
> Fixes: 8eea4e744758 ("taint: Add TAINT_FWCTL")
> Fixes: 2852ca7fba9f ("panic: Taint kernel if tests are run")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: David Gow <davidgow@google.com>
> ---
> v2: rebase and resend
>
> @Jason: the note that you asked to be added to kernel/panic.c has
> already been merged: commit ed4bbe7e8fa1:
>   Author: Randy Dunlap <rdunlap@infradead.org>
>   Date:   Wed Oct 15 15:16:26 2025 -0700
>     taint: add reminder about updating docs and scripts
>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: David Gow <davidgow@google.com>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  Documentation/admin-guide/tainted-kernels.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20260213.orig/Documentation/admin-guide/tainted-kernels.rst
> +++ linux-next-20260213/Documentation/admin-guide/tainted-kernels.rst
> @@ -74,7 +74,7 @@ a particular type of taint. It's best to
>  script, but if you need something quick you can use this shell command to check
>  which bits are set::
>  
> -	$ for i in $(seq 18); do echo $(($i-1)) $(($(cat /proc/sys/kernel/tainted)>>($i-1)&1));done
> +	$ for i in $(seq 20); do echo $(($i-1)) $(($(cat /proc/sys/kernel/tainted)>>($i-1)&1));done
>  

Applied, thanks.

jon
