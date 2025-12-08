Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273892D7DF8
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175002; cv=none; b=kJ9G8zhrrUzF3G2b0qiyLLt4fcfqBZBq21cehYfcmMR39l5oafduPqIWVI0JM87C+8TbDGGDkXvhIGWLtGqU1e12KCgPB73iU94mG05DQN3VJ0v3yOWkID21Xf9NWx0tY4k8BIDOe2QOhRG55gt5cC6fbmvUGiZUWdP6xlN3GWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175002; c=relaxed/simple;
	bh=HcPT9TBu0dyeKcqWP7OlNl2bs0hK/IvoK8Miov4/Ihw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdA0hTSt41jjmZeJ3Iz6fBU5J/SvkY0YaSbp/B1kXmE2JE1X2/gUFajg7IxQW5mOnhklO/Cxck+aYW5Bnux64B+/aTOWviGWI+gM+JFPPAdcpegR1zAMem7Xsj8sWGjbNYD7LhzIRGMSkEHtvreBEVu0jGT9rdMnVAFDIskq58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=exLf1tx3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="exLf1tx3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=WAbaESoY0E6KZ4ZmWAWS7j9Bm+SkT1YqPqbexePFj4E=; b=exLf1tx32STIIs/NupEBGIkInJ
	eY0Iscpk9psfo+kazjY2CUUsroi5nEQuFHOOjEMOp99p6G9SeXkwFJxkaGEssfn+ViFs+4+Dq5aY/
	U0HCMNG6GqaNb0DdMXnLxik9+JEQw6BWn8VgPlkFGjObDj7eUMVjrhVTY7Kf4UXnwYhw4Da/oSO4M
	6me7nEZCjfa3TtTjudlG5owzMTnqUWl1g5+6e+t4tyMVyUbjKoU61+TC3wSuAOYDPPwr4XwTNeBh+
	7VPFykD4wJqD+kk5DSVlKtPx+Wa6IXC4ErUgN0zlssiKbkSpggcYasWNeo44bwjecsqiDFB/+wO+z
	hoduhRsw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUeV-0000000Cg8e-1HLI;
	Mon, 08 Dec 2025 06:23:19 +0000
Message-ID: <ddf217d8-e4ef-4dea-96ef-bb3c6ed8ea74@infradead.org>
Date: Sun, 7 Dec 2025 22:23:17 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix typo in clang-format documentation
To: Addison English <addison.englishw@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20251208054639.8655-1-addison.englishw@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251208054639.8655-1-addison.englishw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Missing a patch description...

On 12/7/25 9:46 PM, Addison English wrote:
> Signed-off-by: Addison English <addison.englishw@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/dev-tools/clang-format.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/clang-format.rst b/Documentation/dev-tools/clang-format.rst
> index 1d089a847c1b..6c8a0df5a00c 100644
> --- a/Documentation/dev-tools/clang-format.rst
> +++ b/Documentation/dev-tools/clang-format.rst
> @@ -88,7 +88,7 @@ Reformatting blocks of code
>  
>  By using an integration with your text editor, you can reformat arbitrary
>  blocks (selections) of code with a single keystroke. This is specially
> -useful when moving code around, for complex code that is deeply intended,
> +useful when moving code around, for complex code that is deeply indented,
>  for multi-line macros (and aligning their backslashes), etc.
>  
>  Remember that you can always tweak the changes afterwards in those cases

-- 
~Randy
