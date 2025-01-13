Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7872A1BD9D8;
	Mon, 13 Jan 2025 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790296; cv=none; b=RdSV4wOfN47miVljil4lAdcouEbm62upqEXNKQjEo4RJZ0dyfgOe1HYhnUN2Smcz25BLFP+T6h5k6/OwOR+cIG7dDIuXUndJwtIqJxIF6ACQonVVJPUy7iGZvYQUIMLRkCC78b8hJFykgd5tOI8eQ951oyltL0kIP44NnBYepnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790296; c=relaxed/simple;
	bh=sTcALPZkAgJHkTcNlD6d4HES+1K9o2Cas2mW7XshdaM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wmf2iWWAe+yUg/PQvW1F4gxHDy/piRgIjZuTZvcmUGhFLqdrVoB6219z8YUaG9Kw/zW9gUV+R/+zYZomAYMwHJ3olfyZCrv2LVaPPAqifnFceSs2rOq6Mm0LpWc/nAD7J4ya7NRNx80A6tdqxAIqvM0gQ3Ggqnwtjd988hzdt6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o8gLVSoU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o8gLVSoU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A946740409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736790291; bh=63LtJrMjVi8KUsk9v2N02b5xJaKI2aPnMujeBiMubLo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o8gLVSoUlqcHDCIQ4qtwpsRr8+gvgqqGs4qx3o7qOUBNcTJiRjigv8I2b+zs7VtwQ
	 TmBVLiZ3C6/fn9Ki0Xb0Xb2yy4q9AqtRhTUUKihXHGpTBKWe2iGImYILvAXSI0hqyq
	 ++usc8gGps8e5qRrODQ7LuXjYlNyghq9IenRD1GoXZWGB1ELXIqDJ+cH3MjHSqt8zt
	 ykpV/RXEIlJwuJ1xKTdT/GOVlFD7ZHee5tYSj81uhnevHBewkNqbUCeayxkRylI20i
	 5D8l18xE8XNKBuHgW/lfnrgcRsgn4GDYCfUAjZ0DMfsoavQdwhprfYUDgJLKHHz0PO
	 QQ6BUSlMr31Rg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A946740409;
	Mon, 13 Jan 2025 17:44:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, greg@wind.rmcc.com, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Hu Haowen
 <2023002089@link.tyut.edu.cn>
Subject: Re: [PATCH] Documentation: bug-hunting.rst: remove odd contact
 information
In-Reply-To: <2025011005-resistant-uncork-9814@gregkh>
References: <2025011005-resistant-uncork-9814@gregkh>
Date: Mon, 13 Jan 2025 10:44:50 -0700
Message-ID: <87a5bubobx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> At the bottom of the bug-hunting.rst file there is a "signature" which
> doesn't seem to make much sense.  It seems to predate git, and perhaps
> was from an earlier bug report that got copied into the document, but
> now makes no sense so remove it.
>
> Cc: <greg@wind.rmcc.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <si.yanteng@linux.dev>
> Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/admin-guide/bug-hunting.rst              |  9 ---------
>  .../translations/zh_CN/admin-guide/bug-hunting.rst     |  9 ---------
>  .../translations/zh_TW/admin-guide/bug-hunting.rst     | 10 ----------
>  3 files changed, 28 deletions(-)

Odd indeed ... applied, thanks.

jon
