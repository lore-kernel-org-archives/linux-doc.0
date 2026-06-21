Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6EC1B4223
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 03:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782013398; cv=none; b=ZGspT67e22MIQW7rR8SHhLli+IM6U9wHmJGzH9HHn+jWoO3hBgQKscEZNbbfVfwqBkIc8VkrEF7KlQrKsIVEpyBWudvU3/X7t5TK5MGy3oNUtHOigqBV3Hh3UcUat+VcLuuL9s1HPpGZXG3tqFjtmNbAUskZfZtPdMyQUHiDUT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782013398; c=relaxed/simple;
	bh=f0VFYAJoBzqfNUa9Msfiw8ZQU/ag0N3Eljw1xeODBcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwO54T1yOQbr2dccX5FWbnE3PS2wHXPSeFpUm1rvRpMmv1iHBC/5QBrQGqyblIdJRRiKjLtp1Wj3RwDmiW+84cp/ojZcanB2rDvT5i/nPUAC1DEB/OH9gfzYWt/eR4bGEcLDPcKRh6IXizl7E5V4F/aNW5ekx7CYrv0kidUtOhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ogQtcN0F; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ogQtcN0F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tTkaFuJS+E2ALy7F5WkM5roLnWZefBa0N4TO3XBWJ/g=; b=ogQtcN0FhSHFNQL68AbPsKX/Zj
	EjnwkltmHLxiRzN5w2tjreD0KxIWGqSlQ3tKtT4uXuI7DZRtYA/ambT0rPuSeET8sP140IxK5aKdS
	ZaCm/Zuqhg2FmJRx/bD8KgN0/PipkhuecuObhqY3suuJrNrqioE0MSAK8p/bJqC6OtcNnUDVWiJQ1
	PHgiiY39gh0NXPAEElzTq+bFjsm+KBAzd0J+qf9W5DnztZE+yPIHaaoPUBqbS4lG+t9I5XtQb3DRT
	YSBsKHh91Y0L7JckGdn9iU/RxK+XJVkwIbJf6MEq9zbWgIw1Q+oPRIoFq6L6FDVl5Mt22HY0bE/bD
	wfAHqt8A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb95Q-00000003irt-3QF0;
	Sun, 21 Jun 2026 03:43:08 +0000
Message-ID: <1ca0f52a-82b0-41ea-847d-85d3903b50d2@infradead.org>
Date: Sat, 20 Jun 2026 20:43:08 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Documentation: xe_drm: fix chars used for subsection
To: Rafael Passos <rafael@rcpassos.me>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org
References: <20260620201732.94141-1-rafael@rcpassos.me>
 <20260620201732.94141-3-rafael@rcpassos.me>
 <4130fd7c-6f7c-4b03-ad64-7a738e2f0bc9@infradead.org>
 <DJEDNH9TR3ZE.QO68KQ89RX4O@rcpassos.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DJEDNH9TR3ZE.QO68KQ89RX4O@rcpassos.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/20/26 7:38 PM, Rafael Passos wrote:
> Hi,
> 
> On Sat Jun 20, 2026 at 6:42 PM -03, Randy Dunlap wrote:
>> Hi,
>>
>> It would be helpful to include the warnings here (but maybe not
>> all 10 lines of each warning).
> 
> Ok, I will add them.
> 
>> scripts/get_maintainer.pl should have told you that. (It does for me.)
> 
> It did, but I made the (wrong) choice of sending it only to the docs
> list, beucase I had 3 patches with nothing but doc fixes.
> 
> In cases like this, should I:
> 
> 1. send a patchset, including the maintainers only on the patch related
>    to them ?
> 2. send the patchset including everyone involved ?
> 3. not sent a patchset at all, and send separate patches for each list?

IMO you could do 1. or 3.
For #1, send the cover letter to anyone who is receiving
any one patch.

> In this case, the other two patches will be dropped. So I will send a 
> V2 for this one, and for the correct audience.


-- 
~Randy

