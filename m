Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F723E358
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665570; cv=none; b=KMuzeaE3JRhUzbitRRM67gJU9v+WRfuQLBjjN2Oi3oLQaBlfMKzEjK6UdjiC6SUirJCMq+aAQf8/UrYQ1y7C29Fn8pBnt/deS/+9sB0dCDXbm5O6YXos6pcCDiS5qtr15DOvxDwgIU3k8BdvK4F5AIbZy9h4migmMR/roN0JLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665570; c=relaxed/simple;
	bh=QHJW/cOB7E5qVsa0OylJOtPEMwr5/JClrBXUOCd6HyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJQcP15aGYC0MRkuklgZ8s/G0JtNaLn0+XU2D1hH5TarNocO7/tLboola9dkadtEyTLo3rSQFkHynU3tRWxx3UdE89LWYcyUza4GW7xlRIzUbxQ3r0gYYdWldtLhjVKeVQHcpWfBjEgHhS9JK2uv439E70hYdhnNpHxtSsghQjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vcrs3rGl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vcrs3rGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF10C19421;
	Mon, 16 Mar 2026 12:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773665570;
	bh=QHJW/cOB7E5qVsa0OylJOtPEMwr5/JClrBXUOCd6HyA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vcrs3rGljtgz+6uRkKzzgi9YJ34eJGJE4UoneystBg4vw5b0PJYHMzT72NPoW2yTy
	 w6KMCYc0bUWJPnTDyGzx6HloHUKFI6q1wyOw5OPutqzgsV7OAoNIXvlT5VodIS4cGo
	 0NslFsaev/HKkmOSRGHbZZ2dMf1sJAWuUePVM3dozVuXVVlqP1bOK/UaMYdfTwSCmU
	 qw1G/b05Qd/Zg93M2MM9ROe7wUUrcaeme3UJCOb36J2kceXDRg06zivqlBznbeBn1k
	 vBvZPqyoIc0lI/KnuXgmNE+EXDZ/7O2sPRFjpakg166HBOLJUpm/R/c5svklMi+myy
	 MCA/ytOjIgWPw==
Message-ID: <5b0ba1fd-0c91-430b-b997-4f4e193cb449@kernel.org>
Date: Mon, 16 Mar 2026 13:52:46 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs/mm: document Page Allocation
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Kit Dallege <xaum.io@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20260314152530.100357-1-xaum.io@gmail.com>
 <9b8a1636-ab8a-46ce-98d9-fc68d774e969@lucifer.local>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <9b8a1636-ab8a-46ce-98d9-fc68d774e969@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/15/26 21:36, Lorenzo Stoakes (Oracle) wrote:
> NAK.
> 
> Because AI slop obviously, please don't send this kind of stuff.
> 
> This time I will +cc the page alloc maintainer for you, who I am sure will
> be overjoyed by this...

Thanks, Lorenzo. Indeed I don't think this is useful addition and agree with
your NAK.


