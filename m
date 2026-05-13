Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F8A3D9667;
	Wed, 13 May 2026 08:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660105; cv=none; b=Um2EKqw/JxDoUkxt/CteBzOnOm29G60HMqUVZUqFEHv832iQbp3fumrQ2OggSCd4aaGg8LQrhpbO5XeEY1c0dFjBdNh5V9we3CpvBs7xNB6gmvhzSd7z4LcDMhqlPn3k++Yki12XqvM8EL0AjKsqBT8FJL2Aud1kYJFR8KAn5sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660105; c=relaxed/simple;
	bh=V/bm3ynCIZ+uSb6B7eiWQi4VDGTVHFLWot0ygqtBp0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nxl9YhOhvteJdwqPD3tVtM0OOL4F9tpi4H+JGYIay+DPTilP4/4/w2W3O9DESMYGK9WqvibH6gMfDOgiMSR5BYZ7eNG3EnsMY0c5DrZLvMmrKCvsG33jWPdxWbpx486CDFabH03K52pn8v2983hsBR3iQ7aAn3p5SATtC6AWe68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Dxgxc7mB; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Dxgxc7mB"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4gFmLW38sXz76YN;
	Wed, 13 May 2026 10:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778659715;
	bh=V/bm3ynCIZ+uSb6B7eiWQi4VDGTVHFLWot0ygqtBp0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dxgxc7mBYATxtMOH4zJIPRanGATtsMt6PJfd+vNPHH+xlKVcTjR/5OyD8p5Fx09qG
	 A9g6ITqN1hIUKqCeyqogMgRLSkWxfJd/F6F13cMQmxiqWYWnCHZ/dlVq4BROW8WVnX
	 ct/XTyIDn243UHUWeoBtF1zLLfjOCUqK/A3q+SY8/Bfq+q/UAaXNSu2A3x/3ZXPrCq
	 VypGMMrc+4bIc1APs7Sej5wzocX8VawLTwGHn+JkxjzXBr8qTg9r8TOmQe1PKNrxu1
	 kaGfOxB0OXR4vG3GskEqZ4AUI/dsoO2+plAi0UQEubQBr8SPSB6w3Y75xElQdlcDAG
	 gRUzqcheOA0BQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4gFmLW2SfZz76XS;
	Wed, 13 May 2026 10:08:35 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gFmLV5Ybgz8sbH;
	Wed, 13 May 2026 10:08:34 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3E69361840;
	Wed, 13 May 2026 10:08:34 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0b89ecab-23b7-443c-8d3a-c092995065b7@leemhuis.info>
Date: Wed, 13 May 2026 10:08:33 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: reporting-issues: clarify advice wording
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512150431.894-1-eric039eric@gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20260512150431.894-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177865971453.2110784.2993534534726153894@mxe9fb.netcup.net>
X-NC-CID: FL9L/knWRKzUre0OeXS+w3+u3xnO0wlOVJw2IOUS30X1rHfIbss=

On 5/12/26 17:04, Chen-Shi-Hong wrote:
> A previous change

You mean the one you sent earlier we discussed? But that was not
applied, unless I'm missing something. So this should have been a v2 of
your patch (which a changelog) and against the same base (the one that
"these advices"). You want to send that as v3 now.

> replaced "these advices" with "this advice", but that
> wording can be read too narrowly and may seem to refer only to a single
> recommendation.
> 
> Use "all of this advice" instead

That's great, thx. And thx to Jonathan for the suggestion!

Ciao, Thorsten

> to make it clearer that the sentence
> refers to the broader set of recommendations in the paragraph.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
> ---
>  Documentation/admin-guide/reporting-issues.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
> index 731865b5e8ff..87dd874fffcf 100644
> --- a/Documentation/admin-guide/reporting-issues.rst
> +++ b/Documentation/admin-guide/reporting-issues.rst
> @@ -129,7 +129,7 @@ After these preparations you'll now enter the main part:
>     situations; during the merge window that actually might be even the best
>     approach, but in that development phase it can be an even better idea to
>     suspend your efforts for a few days anyway. Whatever version you choose,
> -   ideally use a 'vanilla' build. Ignoring this advice will dramatically
> +   ideally use a 'vanilla' build. Ignoring all of this advice will dramatically
>     increase the risk your report will be rejected or ignored.
>  
>   * Ensure the kernel you just installed does not 'taint' itself when
> @@ -795,7 +795,7 @@ Install a fresh kernel for testing
>      situations; during the merge window that actually might be even the best
>      approach, but in that development phase it can be an even better idea to
>      suspend your efforts for a few days anyway. Whatever version you choose,
> -    ideally use a 'vanilla' built. Ignoring this advice will dramatically
> +    ideally use a 'vanilla' built. Ignoring all of this advice will dramatically
>      increase the risk your report will be rejected or ignored.*
>  
>  As mentioned in the detailed explanation for the first step already: Like most

