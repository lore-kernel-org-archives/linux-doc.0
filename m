Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBFE46BF
	for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738082760; cv=none; b=BA5xbczhBW5b75j0B31Bh6HEcjjRDG+PWW80/xOsJjO7aiuaFONyPB8zmkSTDfC/x68cf497NN6t00RtGWt/Ae4DCM+ZQgGuknGF7QVt687CbIHcXT1fbGu6/ITgkxrRWRIUQawjN/QiW/4vmndR6fmO0a3Jbg0njho6w3IEXSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738082760; c=relaxed/simple;
	bh=72kmVKXf2GdpdMlpX2f79tWr8mGYcX4pjkYD2ZxbQAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5a8eiLcGPTPih8Kz2ca/sGPAh+Rg02tHiTtPt2pD4uwX6fxtwDvWctVRZf54lm3ccFQHw6lrBMgN0hsFleCfTjD7VpAEviyFkLxNDW9x30xt4payqzkyrilWlmEVmIsvNJOPI4RUUbjur6yOyNXMAbB0zR7u5UVVChIVdh5tFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NlX9sXst; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NlX9sXst"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eIcIoLmBArADoKADRn54IBjGvph5e3q0v0KXusXLJ3c=; b=NlX9sXstcGbbt+2szwC8nRcPIY
	yfLXVRKGA8eN+Iud//onZc0jD8z3vEI5K0PiOtd8tRRXDbE4BQDrW3fT2IaV4fSZbBy0YC7++I+fe
	jARSSDS3Kn4Un6YDEGkvMvHmcfa9DYt4GjM9KXxBGETeVgmtxhQHHnT4FNmPKoSNN5NhLD/AtFeT9
	LxWo18V7l5vSuQdCUrWvL/ZO9HsovoBvTzH2muxxuSv8JrmRgOXrY7SuR0BsFWV6dMbYhlTWSdDMZ
	g5kkxde0a2P0x/SKumKo9KAh4NWY1N5GWfPukH3cILXbKdRdcsc6JdTCUPQaho0elTcIYrfJRz94C
	4Ma87xfQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoio-0000000ExwI-22iO;
	Tue, 28 Jan 2025 16:45:54 +0000
Message-ID: <53e400b4-1552-4470-9c18-b681a44fe952@infradead.org>
Date: Tue, 28 Jan 2025 08:45:50 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs: submit-checklist: Expand on build tests against
 different word sizes
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Tsugikazu Shibata <shibata@linuxfoundation.org>
References: <20250128102805.112691-1-akiyks@gmail.com>
 <20250128102805.112691-2-akiyks@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250128102805.112691-2-akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/28/25 2:28 AM, Akira Yokosawa wrote:
> Existing sentence on cross-compilation that mentions ppc64 does not
> make much sense in today's perspective.
> 
> Expand it for the benefits of testing against architectures of
> different word sizes and endianness.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/process/submit-checklist.rst             |  9 ++++++---
>  .../translations/ja_JP/process/submit-checklist.rst    | 10 ++++++----
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 

-- 
~Randy
