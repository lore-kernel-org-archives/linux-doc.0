Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ED5448CE6
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115809; cv=none; b=GjeFlEj2P1N0jiMXefT2J8kcXHK96xE3hJu8s1svOkYV4XDQyFU3VrtddtLBFwrSxNaaDJYr+cw21m6+JyR9/xGmlYTbTraoX3kXXP6hRK9UlYewwRPyBVuobDPQ8mXxpOUevY8Aptdv0bxGbp+YOKfvkVlxiPgg4BNrBTYl/pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115809; c=relaxed/simple;
	bh=B4nAbuExddVSFXs3KbGUjfvDeU6rRPhZajLbSfwhCFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRYVVtszFO8qxY5d8JvCh3TzyeWuzy+gaJbrM1CPhh50AlS3dgQsDZE+zcHsqLs3F3l5toWdpfT+6hqvIZnD/n1ISNWtWOA/kreACk3DDx4wC03casgT7EQWANegKu79urCWnfTA24A5PaEGPs4yBrMNDxXlQFLrEOnpBTMBv1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=mbVfi2wS; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="mbVfi2wS"
Date: Wed, 15 Jul 2026 19:43:12 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784115805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xu8jcAVhJq6aZukec8XlDpfwNQZQbT0X243BuYb572g=;
	b=mbVfi2wSKLnfNblRpMBKCPU68GJMJ4jse0AL+1bwebc19HHjALAB3tP6g9l5Iov+7l/o1Z
	VGo4QzGX5/wHTYe7xvSXgH3aeDMD0eMU5F3jpsOsHXXLjigijP43G8xlUOYkXWmu+rSVqG
	s21yfFeyZ4QYozLEPfiL5hQIdwZDN17JGSjrRmf0Y56UTnzFl0lIupYaNLc+k9jqQxU5aJ
	uJUg9ifggaJH6HbDNAnATQjqHq1+03mylNXfMyaPZvstsrHazPhUOpgZrScvJFkLH7cbBe
	13DJkcuTL0CnnJPasJkNXqG0fb9udFadfdxQiEaKdwD3AaIDe4rOJeyzVCdVyA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Akiyoshi Kurita <weibu@redadmin.org>
Subject: Re: [PATCH v2] docs/ja_JP: submitting-patches: Refine wording etc
 for "splitting changes" and later
Message-ID: <aldyUNbLWNhbEyfS@wyuan.org>
References: <20260715113616.94305-1-akiyks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715113616.94305-1-akiyks@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 15, 2026 at 08:36:16PM +0900, Akira Yokosawa wrote:
> Resolve rough edges in translation text added since commit 61e4155c81d1
> ("docs/ja_JP: translate more of submitting-patches.rst").
> 
> As with commit 999084ee0b11 ("docs/ja_JP: submitting-patches: Amend
> "Describe your changes""), do the following tweaks:
> 
> - Rewording and rephrasing.
> - Suppress extra white spaces rendered before and after strong emphasis
>   in HTML and PDF by using espcaped spaces.
> - Provide translation words for "embargo", "word-wrap", "top-posting",
>   etc.
> - Rather than keep "interleaved replies", use only 「インライン返信」
>   ("inline reply"), which is a popular term in Japanese.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Akiyoshi Kurita <weibu@redadmin.org>
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Duplicated sign-off? ;-)
