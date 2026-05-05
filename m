Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B283E3AB27A;
	Tue,  5 May 2026 19:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011088; cv=none; b=TDkbBawwww0VTBS6KZfcu82bKiccrut6l6avACpzVCjXAhzDTjDuTQxvrshXpzVy2t/SB2bmPQOllh5+gGc1IBUZrXIewCucYdPgsTMoAPi4CZe9KfvUeyczOCHL3yg7uldJqVxRb9vRKbPDfT6be8WQkaqbmTcwfaR+V3xaHnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011088; c=relaxed/simple;
	bh=mTVkH5UJQolo4M2q3m8JIc1kQ80KSFh+zL6IcFTy5/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cC9zqzhZBL2edzUbvLr72Mqjl3avXe6kTWyf9TZFzt+3SeIWEzNtsYjknSTLg6fztBhf6HIgHnB693ilNKzqtN9y11NYrXCVAyi/yNneVtrTeTXjETxmwaxnOwhLx72WZk10u/I7RJasUQpBN3pHZKPHNDmK8NGbxD0qHZUxOoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KTDjfWDa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KTDjfWDa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ldptR6oYdYmWo9Zfo1a0GdsPtwmmYFZsV+6emq7twxw=; b=KTDjfWDaNAP3Pi9vwTR91+k8Hl
	5CMZTktlAZCy4q388IZ1ptzeYKnUuMI00yv8HMmL3Y5fzM4Zrvp2NCr/UbjlLagH5KQ2iBA22J0H9
	owQ3ZczXJRb+2SaoKJ5XCNoRLR4FNuruYnSxb4mTL61+/xslq0Ko84nyW2uArsR6Tl94hSLbTBv0e
	RWlRS9r3rTOb1EmUSWMde/SO4d5oV7TMg0PKwJFjbeWxdWYgM8d4X2X9Omgpkpy7bfQy237be7l4C
	NGoNWuKF7Sm0v4zvzI2EN8MWw1XMsDB6onDnqW6l1C1qDLc2BFCjn+9c17pZRfUE2kMOkveB+rR8+
	lHZWL5aw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLu8-0000000HMKs-3eIT;
	Tue, 05 May 2026 19:58:04 +0000
Message-ID: <4914fc7a-607f-41bb-891e-89df83a0b292@infradead.org>
Date: Tue, 5 May 2026 12:58:04 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Docs: fix unmatched quote warning
To: linux-kernel@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
References: <20260406232304.1892528-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260406232304.1892528-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

ping?

On 4/6/26 4:23 PM, Randy Dunlap wrote:
> 'make htmldocs' complains about ``prctrl` -- so add a second '`' to
> avoid the warning.
> 
> Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-string without end-string. [docutils]
> 
> Fixes: 08ee1559052b ("prctl: cfi: change the branch landing pad prctl()s to be more descriptive")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Deepak Gupta <debug@rivosinc.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-riscv@lists.infradead.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> 
>  Documentation/arch/riscv/zicfilp.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20260406.orig/Documentation/arch/riscv/zicfilp.rst
> +++ linux-next-20260406/Documentation/arch/riscv/zicfilp.rst
> @@ -78,7 +78,7 @@ the program.
>  
>  Per-task indirect branch tracking state can be monitored and
>  controlled via the :c:macro:`PR_GET_CFI` and :c:macro:`PR_SET_CFI`
> -``prctl()` arguments (respectively), by supplying
> +``prctl()`` arguments (respectively), by supplying
>  :c:macro:`PR_CFI_BRANCH_LANDING_PADS` as the second argument.  These
>  are architecture-agnostic, and will return -EINVAL if the underlying
>  functionality is not supported.
> 

-- 
~Randy

