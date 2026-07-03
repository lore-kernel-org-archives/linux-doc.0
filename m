Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212833793A2
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071047; cv=none; b=TdFV5/Kk9l7JtX9I8QHb0Sbhs+m3x+cQizRl63zzVllTQ9L4qn2Kap59TqAJOHSR3kg1vQcRp90L8OzFe1fEayetHk45R6fksY7m4kiJUY9pfjcQPPMVmqx6ptwUDupmAngoZGp5ZXjO/MS7K/DUutFNzr0x/OxWysWiLOKbea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071047; c=relaxed/simple;
	bh=xuj4UnMGsBwq1kBf1xI+PfS24Rf5Ofr+yXc48b8F1fE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sh41oAdsOfEP77flEn/BZT1sA6ghg34qElt77WeaMYcHqUIiFMZzHDuQlHZ9OHj9HOgFZqsaMPl2xzhytyeK6yOLo+x31ObybqlDRq8kGyVYI/LbO2lqF46iZbUEV1y+omChF/D3ZsjRsHbT5jN6+/iup6/nwio9sdLCCB/STBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i2YS9x+o; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i2YS9x+o"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783071042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xuj4UnMGsBwq1kBf1xI+PfS24Rf5Ofr+yXc48b8F1fE=;
	b=i2YS9x+oI5i8+MyTYtWwOYkr6wUeX4fu1pD0OLDQjFM8j8c1uzq6HpnDniVQGTpplZC07A
	Ga9w6Xvf9t8tN7PxQoaSkIkLf1VeSqB27A7LBxT7+Yz7KjMYNTToXx87Xu35l19yF+qAXi
	PrEr8oKBtNF8V6/Xlzz8crHEoXjywr8=
From: Lance Yang <lance.yang@linux.dev>
To: leon.hwang@linux.dev
Cc: linux-mm@kvack.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	peterz@infradead.org,
	ojeda@kernel.org,
	nsc@kernel.org,
	tglx@kernel.org,
	thomas.weissschuh@linutronix.de,
	aliceryhl@google.com,
	dianders@chromium.org,
	gary@garyguo.net,
	linux.amoon@gmail.com,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Date: Fri,  3 Jul 2026 17:30:32 +0800
Message-Id: <20260703093032.51640-1-lance.yang@linux.dev>
In-Reply-To: <20260703022507.187457-1-leon.hwang@linux.dev>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
>mseal.o is built only for 64-bit kernels, so 32-bit kernels fall back
>to sys_ni_syscall() and return -ENOSYS rather than -EPERM.
>
>Document the -EINTR return from mmap_write_lock_killable(), fix the
>CONFIG_MSEAL_SYSTEM_MAPPINGS typo, and describe system mappings in
>terms of VM_SEALED_SYSMAP.
>
>Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>---

Thanks, free free to add:

Acked-by: Lance Yang <lance.yang@linux.dev>
