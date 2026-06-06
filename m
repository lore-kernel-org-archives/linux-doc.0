Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED493BB4A;
	Sat,  6 Jun 2026 19:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773014; cv=none; b=vC5K2znMX2TJd7AWZRliK01EQz3EYODdD2UjEcBlf88SdSbNSHQfr9qUmqy4aoLHG2dtgavvtMqZOCgbwWu/rJ0jLj9abiul2fy6aW45ojUFC/9YXk6I+4A5ZplfyUJNbdOtw57YMpTxiqSllA+4KEBmMvdW7J0ZvlQvV+ms8p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773014; c=relaxed/simple;
	bh=jaS/R6cWcI9ehoK4wXAM/yrda4Cc56qlpTN+SBQmEB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kzJOTDCIWnwRP1VK6wEYmZFySCtJwWI6vGOhhRMGMZIaFJesfHcYLZI6Ub1biavVziqnk0KBdt9OML/zyVuD+JVxeFV8RSfKFKX5WgiLmC+oCDE0zjaCv+o7kjQZAOGASsYYUtVCmUxJbPj48C2+su9M21I7p3FuK2mTZj6bxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EKP9Mutz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EKP9Mutz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=otrIdRW+UsX1zT+l7mGAefN1YaPUC2wiZ2DNHM47OfM=; b=EKP9Mutzpu4fvsuq3Gu0b+DtMG
	61UZC4DOrigHe+e9BSLhgyTOmAWhWOdZsNhChtLCerz1aqm9RZmnpaCRmBE4a7/xd5WwVWbJKZkNx
	KyTTRKPKQPmcVU27fprrNZBzTEd5ZBivBJhTyN86U4j+5fANngLYSU7VRMKJpCqz6Wof9EHR2Lubt
	g405WrROkPxjn/68QCrUwbDWClkAvLP84HScfTipInMbNpFRY3RdoR4R+zoIYfufyDz4QKt460CU6
	pnsAkMaVx34pMDf4ZWbDB5yPTLXmHoazsX7v9D2F9Es2Iv7/ueWei3cD2+LGWqWPgy7wmlFW7+AFi
	0eCQWIxQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVwPK-00000001lpX-1sF7;
	Sat, 06 Jun 2026 19:10:10 +0000
Message-ID: <4c9b2927-29e0-40a6-bed4-14142dedd2ef@infradead.org>
Date: Sat, 6 Jun 2026 12:10:09 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: Fix minor grammatical error
To: Brigham Campbell <me@brighamcampbell.com>,
 Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "open list:DOCUMENTATION REPORTING ISSUES" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260605053826.7836-1-me@brighamcampbell.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260605053826.7836-1-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/4/26 10:38 PM, Brigham Campbell wrote:
> Fix minor grammatical error in the admin guide docs.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> 
> I happened across this minor mistake while investigating techniques to
> use a partial kernel config to generate a complete config. If
> maintainers that I don't send out minor fixes like this, please let me
> know and I'll remember that for the future.
> 
>  Documentation/admin-guide/quickly-build-trimmed-linux.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> index cb178e0a6208..194d22f56449 100644
> --- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> +++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> @@ -217,10 +217,10 @@ again.
>  
>     There is a catch: 'localmodconfig' is likely to disable kernel features you
>     did not use since you booted your Linux -- like drivers for currently
> -   disconnected peripherals or a virtualization software not haven't used yet.
> -   You can reduce or nearly eliminate that risk with tricks the reference
> -   section outlines; but when building a kernel just for quick testing purposes
> -   it is often negligible if such features are missing. But you should keep that
> +   disconnected peripherals or virtualization software not currently in use. You
> +   can reduce or nearly eliminate that risk with tricks the reference section
> +   outlines; but when building a kernel just for quick testing purposes it is
> +   often negligible if such features are missing. But you should keep that
>     aspect in mind when using a kernel built with this make target, as it might
>     be the reason why something you only use occasionally stopped working.
>  

Can't you just modify the first line only and leave the other 3 changed lines
intact?

-- 
~Randy

