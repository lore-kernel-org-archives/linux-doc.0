Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1492A8C1
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739826927; cv=none; b=ezo3BKPOPg9VyXZWCB+8DgsBB++W0dJl6wrg8HrZCBrwFz24YFOShFO+cR3TBcTulPPpH8DOkY5+o+0JQc7pyWX8U7zoW90JHwMur+50MvjC23zjKGjh1+Y6G0kqhUdpW3BBPImDi+ZNAnIGGJrS5ukOvus485L6aPegSTEqrWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739826927; c=relaxed/simple;
	bh=cvH0GnuTDjhiLAkLCxiFKXOuoMa8M9PlWN5im2CwS20=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BI6zOGwK/gzW95j6tFVI+ACnIlqh8Nihcho9VWPmjrlrcXm62qCKI2fb8bbrMWvteg/7Y9db+Wrnq//lhHiGdE+uXti5ZdW3eG3a7L1gWjbtrBzjx2+NYreIPtuj+KryUhqR+hcfeTAkeO6OCqlf/oWFElaEyGZZd/xp5amHNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aAEVzgfk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aAEVzgfk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:To:From:Date:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=cvH0GnuTDjhiLAkLCxiFKXOuoMa8M9PlWN5im2CwS20=; b=aAEVzgfkNneO8rbyaHXUW/qvc4
	QkPePrWIS5fwaSFGX52Ri2IwfbGeKH680JCbRopZMg0WGQsHoGo5l75apWSUVEPJ0QfLmvuqY/qSU
	MuVn7GRnsDyOWc7LeTqEwtiL+FqX+UaAG4YK4kXsSd53T3WcIfbgUidLTA/7EqQ5M/6h9EJuz1bh8
	Hk2xLYfyVZwpZYclHMUYM2tS9nGBWK84Ru9tzTJZHyUDegwhVlz/6RUpn9sFlBEqyulGMW2zJS2rg
	U3GztNebxqFnFhQtq5EakTw3fheF4TINXf1eJa6DgSGkZix6Kgt946mX9SY+al7+EpUprgbRx3HsC
	94IjAmXw==;
Received: from [129.95.238.77] (helo=[127.0.0.1])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8SY-00000001xOI-3KRl;
	Mon, 17 Feb 2025 21:15:23 +0000
Date: Mon, 17 Feb 2025 13:15:22 -0800
From: Randy Dunlap <rdunlap@infradead.org>
To: Shankari02 <shankari.ak0208@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: Fix grammatical errors and highlight code funcs
User-Agent: K-9 Mail for Android
In-Reply-To: <20250217200542.26594-1-shankari.ak0208@gmail.com>
References: <20250217200542.26594-1-shankari.ak0208@gmail.com>
Message-ID: <41063E7E-DBB5-431F-A4A4-DAB24E404AB6@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 17, 2025 12:05:42 PM PST, Shankari02 <shankari=2Eak0208@gmail=
=2Ecom> wrote:
>This patch improves few sentences by correcting their grammatical formati=
on=2E Some code functions have been highlighted for better readability=2E
>---
> Documentation/driver-api/fpga/fpga-mgr=2Erst | 26 +++++++++++-----------
> 1 file changed, 13 insertions(+), 13 deletions(-)
>


Hi,
Missing the required Signed-off-by: line with full name=2E
Thanks=2E

~Randy
[See if my tablet email does this correctly=2E]
