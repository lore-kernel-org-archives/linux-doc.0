Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00643E834D;
	Wed,  8 Jul 2026 21:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783544664; cv=none; b=AEYmLN5W+4dJrv8RSG/SnZ6UZcdL2dai1GBsFQDgwm0xGH2iRMVoNJ9npPlylRE3yiS/xEjuY0cbz5dvM3JHHfJwVjdC+lwPRxaDID9tmI9fNbMsabT3qmS6y9TL1Btj8ADZFk4NuYXZWJx8g/V3hhYb4MKknVvQK1PETGnNYas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783544664; c=relaxed/simple;
	bh=r741P+udzsTtq8JRcGIUXdP/M4oFmoy8cMcVX1ZcAe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuZ8+H21Plej1lkTeZx4JVN0/Rr6g3ueDyDjyiLTgQFIKfDvozw6GAd3fbIYApcCNoUQ01hvRGT+IbohdAcpzLCeY+4bEF7zZjHVF17ni7hHdMNzJWPkASvXEB8kRLgi9OQETNpNZA2VXcIeBsx3zHmc6ND5ViVVXObu/+iJdxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aQ5Gfbdc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aQ5Gfbdc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Iwdhzr9Ce3QYS0uiImqEiqd+DMEn2V4Ds/W2GIf4RMM=; b=aQ5GfbdciWS4RxGV6FruFgeMjA
	RfnlUhHlrb0XCEjKO8iazzM47WT0IUPHFP/4k3GiqFZkbwhgHZED+lLJUxv4S1SJKylR1FjVxKY97
	LbF950GrXH0ZGH0zdFxMmXOLqCwyGJCYsnwjOsGTrX8ePIkjWppRxsrQ1+0GYgq8eS4Eh4y+ddcgu
	R3V3jPjPjq9+ehlRq+4EV8SX99osb0ge+/foyaRwkxH+zJHmG7DNuvhchPZHaGMQg+1VnWAkIkVFL
	2nDP2iSq+0lnfxM5wwiXhluT3o2OnDrKGpcXlMA7bAlp7/pDGOZ0LLyc6fFGgNn1SrN7yX6qyl4ca
	EvmMmJsg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZRM-00000000Psz-2pgd;
	Wed, 08 Jul 2026 21:04:21 +0000
Message-ID: <1bf78dca-1651-4173-938c-d76b3c8db229@infradead.org>
Date: Wed, 8 Jul 2026 14:04:20 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] docs: submitting-patches: Fix section structure
 around DCO
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akiyoshi Kurita <weibu@redadmin.org>
References: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/2/26 3:44 AM, Akira Yokosawa wrote:
> Commit 5903019b2a5e ("Documentation/SubmittingPatches: convert it to
> ReST markup") made "DCO 1.1" a subsection under the section "Sign your
> work - ...".  However, the DCO text is meant to be referenced in the
> section.
> 
> Furthermore, in HTML and PDF docs, paragraphs following the DCO:
> 
>     then you just add a line saying:
> 
>         Signed-off-by: [...]
> 
>     [...]
>     as it was propagated to the maintainers and ultimately to Linus, with
>     the first SoB entry signalling primary authorship of a single author.
> 
> appear to belong to the DCO, rather than to "Sign your work - ..."
> where it should.
> 
> In reST (and other documentation tools), once you start a subsection
> under a section, there is no way to go back to the section.
> 
> Fix the section structure by making the DCO a literal block, with
> indent changes made in commit 5903019b2a5e reverted.

I don't see much difference in the before and after HTML
other than the use of literal blocks, which do make it a
small bit clearer where the DCO/Reviewer's blocks are.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> While at it, fix the same issue at "Reviewer's statement of
> oversight".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Documentation/process/submitting-patches.rst | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

-- 
~Randy
