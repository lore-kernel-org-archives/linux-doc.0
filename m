Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C32DA75A;
	Tue, 10 Feb 2026 06:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704772; cv=none; b=AMzL+5/lpVd9nXhyUGcHWN73g/W2qj9MTJTN8hQzV6BvnFme0iwNp73zmTvcK0LK7RUXLooZ5YRqccDkYtbJyRnejp0kiUbVOEJSGAV7JzFr536xfvZKFY521P7m/Azeuj/2ICgkvsYdmx//kngM/f9Ar3aNgu1oTsDd63A4kA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704772; c=relaxed/simple;
	bh=qH1r9Yx8SE63rdhx/DKoN5JCD01C42sf1Vved2jPJE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qkhe5DdFf142CY8L8VxVzjxTdzVcXixHRIfPD3/Ms3mSmp2cS6u3w/7/VHoJmKnpssoVpLm0kONGI5UpQEme4bNqK5QcGu+MQM+uZKImetEXv9hTqHsOVxACeJuQz3Wb0lWW5DjXD8m78vle1oNXd7rxFXEzpsOqEAJRyJ6pE1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OJQAAr/h; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OJQAAr/h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=E5Q0cWyHffOH8Imcg9FdYw5x8Ae5y0Ol39k9vDyLyVY=; b=OJQAAr/hCdJipwcEVWrvddEgLT
	XaJSrHdEZqQoKuHrKCb21oH+nSzo710HvhW61c1N059hLGvR20H+xRWCMLfQp4WbrFr4cJ45epbUc
	vyT0tHTPIYPh6VVwAI+FISsfMO330AKVwM4iZf7XS1+MuYem1GDn9Vg1SI16ZVjMiLzSNd1afiJeh
	+C1KrSphYZmMamC4H3O4BIekFfU6XGJQ8M+ucNEB/063UDjEWdX68fPSpW6E2BefyRdAnujPLOSvg
	RKXceqtKyS7EhdXPcF7CCsjjJ+YtZ4nNzlKhyYq3NwPE+gF28dHKAiR0sGqWv+hUPDfMcSBcwTOQV
	L0gNr71w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphCC-0000000GXGV-1bH9;
	Tue, 10 Feb 2026 06:26:00 +0000
Message-ID: <2c22d136-973a-41ec-a87e-8d2ce2dbb004@infradead.org>
Date: Mon, 9 Feb 2026 22:25:59 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs/core-api: fix typos in rbtree.rst
To: Min-Hsun Chang <chmh0624@gmail.com>, corbet@lwn.net
Cc: rob@landley.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210060829.42975-1-chmh0624@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260210060829.42975-1-chmh0624@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/9/26 10:08 PM, Min-Hsun Chang wrote:
> Correct minor typographical errors in the red-black tree documentation:
> - Remove redundant "a" in the cached rbtrees section.
> - Fix "updated" to "update" in the augmented rbtrees section.
> - Fix "be looking" to "by looking" in the interval tree sample usage.
> 
> Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
> ---
>  Documentation/core-api/rbtree.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
