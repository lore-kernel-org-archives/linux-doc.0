Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9178462;
	Mon,  4 May 2026 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777852908; cv=none; b=hc9+dnXo+e1BhQ2fuf364SS5ZbzArYL3FKJo9Ja6dm5EBe8nNRAc7tyDczQ0n5Tu8Va9Hk89Stt6SrYOwn/1vNPigz329yCRJzVzcgwdjTVBnmv0SOPwMvOMtL8GJVWT88A8grukep0NuB2qFO/HEEug+HbUPCzo2128BM0qCKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777852908; c=relaxed/simple;
	bh=GuS8C68UhcQ29gNKD74cFYn6N9cs3jFrnnhF6EJf+D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQfIA1jzMJ5ZMD4hmzaZ5MnxV3k3AxQ+XtBKFV0fNzDBje8eKAlYyMD471/CIWxfChida5Df/n+sj8t9SUuSjFq3qzZ4hZF09TVxhaa9Ehj5t3wPozqCWA9/URPv3BfC2AgKLpYr+zss46ZOu9Eu2bN26iKYiodyGKDHtMlfz1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EKy9tYty; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EKy9tYty"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=l+Ggoiz39GbtMVMqJ75PKNPwltNM/Cf8vCNPMEuyCzU=; b=EKy9tYtyUEW7eXDqm63m5qTqrz
	meUnkARb5aXqYuieS1bfTN3KWSzp2PhO2RXadRiexdKaZPmHyjwR0SU67QjRUSLtPhvodx2vN2NEm
	ujEn/hXOoej58HQEX/GWt+7EoKijVUVPlI9LSB6J6vOstVgWgHJZaZdmVhnXrq4Rg663bxsMjJqLn
	cUkfBNcDZZZWtCArqAoosT0tR1wnvK04rPPwldBkLCb57OiMRPOKzlpU9OOlUhoyz/DcFoeF6Uy2b
	XS5GBgbb5bn/L9u00uwcUDBIahs3A1GkwWf2ZkzCXnsnF8v+hR5hOEV4I4zkWLsaQa1bdYjjqC1gQ
	2hoDnU4A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJgkm-0000000BzQ2-2UQ2;
	Mon, 04 May 2026 00:01:40 +0000
Message-ID: <a1a87b0c-8790-4cf3-a69c-3f4d5851d0f3@infradead.org>
Date: Sun, 3 May 2026 17:01:40 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix typos in reporting-issues.rst
To: Felipe Matarazzo <felipemps@protonmail.com>,
 Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260503232816.70687-1-felipemps@protonmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260503232816.70687-1-felipemps@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/3/26 4:28 PM, Felipe Matarazzo wrote:
> Fix 33 typos: wrong words (want→what, is→if/it, sent→send,
> abound→about, exiting→existing, option→opinion, and→an),
> missing words (of, a, too, s), extra words (on, over), wrong
> word forms (built, stops, advice, severity, lists, types,
> Inquiries, requests) and garbled phrases.
> 
> Signed-off-by: Felipe Matarazzo <felipemps@protonmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  .../admin-guide/reporting-issues.rst          | 62 +++++++++----------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 

-- 
~Randy
