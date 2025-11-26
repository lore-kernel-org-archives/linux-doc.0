Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3475293C42
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764141609; cv=none; b=nepsw+g16EVNr25UvtkGJAAicyv7kILrkz+mG+UuKslTR6fWXEYA4bW3q2GBR1QckXUdSshZBVjIabSJ27ZSZCGGEVfxAwqx1CPK7Gd5oveBu4wiM2wb4N/HdzA2yj3rBwygS/xX63Axts+qAn1qbAOCevepfuuXjNqKINM6Wf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764141609; c=relaxed/simple;
	bh=0VQrgSjDjU4qQzJ7hZrbtMfLNNKPLwxprA8ln020frQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tENgW4akypHzQI0QkpXXZFfHx9192PZVU7cxfDG+MJGTZGddsYt+dsfF0WtZHifo5aUmsuLRbakZcUwKz7mEHFO54z/o3E90gNkPZ08yaxSg2qMerEkEnUAcQ7g7uftGAQ9ltVyzVwMkgZIci1UTjB4vv0lscndC+opvYwXILKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3eiJ0pI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3eiJ0pI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A42C16AAE;
	Wed, 26 Nov 2025 07:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764141607;
	bh=0VQrgSjDjU4qQzJ7hZrbtMfLNNKPLwxprA8ln020frQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d3eiJ0pIcAdhlFTNX/KhOYFhtqCKGeHWOtlOkjVF7Gy48wa9sDwjCvB7UaSAZCSkX
	 SQ2k8oCoF7r7g8HVrSI+YOhQUzt7rl/gGyV2JXslF2XkJswBycETPIPrpAZXSwHOqb
	 IPxJP07V0yGlwvLCTAFn6pyjDivgMfv6UP9AZsyuBut98JdbZPRrjqMowCoC55XWCk
	 FSmv0/QVtm3w4awLaK8dTB2JzmkbfrZCmBTDcTiLCxv0mEWJrJaV/GirnFbqRZGWf3
	 Kr9dD/olNOE7gchBRIteieQM5+xQ23mkWzDy66Jkb4Ioh+qcJUN3erXyO2ycE71Y+P
	 rlLV0VN/Xc3kg==
Date: Wed, 26 Nov 2025 08:20:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: kdoc_parser: use '@' for Excess enum value
Message-ID: <20251126081954.71104a56@foz.lan>
In-Reply-To: <20251126061752.3497106-1-rdunlap@infradead.org>
References: <20251126061752.3497106-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 25 Nov 2025 22:17:52 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> kdoc is looking for "@value" here, so use that kind of string in the
> warning message. The "%value" can be confusing.
> 
> This changes:
> Warning: drivers/net/wireless/mediatek/mt76/testmode.h:92 Excess enum value '%MT76_TM_ATTR_TX_PENDING' description in 'mt76_testmode_attr'
> 
> to this:
> Warning: drivers/net/wireless/mediatek/mt76/testmode.h:92 Excess enum value '@MT76_TM_ATTR_TX_PENDING' description in 'mt76_testmode_attr'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


> ---
>  tools/lib/python/kdoc/kdoc_parser.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20251126.orig/tools/lib/python/kdoc/kdoc_parser.py
> +++ linux-next-20251126/tools/lib/python/kdoc/kdoc_parser.py
> @@ -919,7 +919,7 @@ class KernelDoc:
>          for k in self.entry.parameterdescs:
>              if k not in member_set:
>                  self.emit_msg(ln,
> -                              f"Excess enum value '%{k}' description in '{declaration_name}'")
> +                              f"Excess enum value '@{k}' description in '{declaration_name}'")
>  
>          self.output_declaration('enum', declaration_name,
>                                  purpose=self.entry.declaration_purpose)



Thanks,
Mauro
