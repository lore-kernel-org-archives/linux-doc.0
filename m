Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B25237E2E5;
	Tue, 14 Apr 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162604; cv=none; b=d9j7MoaEYIp2rpA1LgTeyO5BwkcIWrbahGImTEYbuJlIV5HxJ6xbj1VGCvTTehaUqXI6ZL9bntuudjLG5TZdVONNRZJm1GA6OHk1oeDW5ZiVEHzl763HUMdT3yss/CtRqEKGJePIDphzpAA5Sqq3cTusf9kA2gvcLT2Yuiwpu5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162604; c=relaxed/simple;
	bh=Ntq9Ru+EVs7Qqy0EkxXe5jJO0r1pUpTWq7mOtjYRHK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkAVqNmS2Sjtp5CdrYJNauPTFgqB9+gr32toRdzwry42JIUUUnHjQEC1JY3cgrPIFYmkDSPXVJ5mLr4Xjqwg+SVuKf4YbyWiUFPTU1GMQiyABQDbRZRr/1Z3iJErr3Pv888+u+uoJzuSLUko3w6sp/UVNEm6RbfEHHnFF9LuY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=nFYlpAcO; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="nFYlpAcO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=EW3Ch5R6PoJ9WqT8OIObJ3ll1Aqj7CDBKj5ebouaGqY=; b=nFYlpAcOdKWY/6NjfJ5sKtZn2+
	yjKajGrt+KQDVCoMkfvpp0m66hBqUp6eX1iFWPl/06IEsLZ6MA9+kAsqiUDYrfMc+mWHABw6luu7o
	SXIjoXXcCLV8fFxNTjwcvlIn5E2iVSrOAgOlsircvQRLnAsvWyeq7dBh9lkFuKcgsJ0R/wSkgYzYM
	qHn+4DyoA5hgvYpkvNSX99YkhgQi5VJjKK/yY87vXgkCfgrRbWaAx0a++OTy0BIGG2dotVDqEEXL2
	yj7SFm9+QMpYQyqJh64M3yVXtkcG66FenT8vXCfyr6CeHrCw9X0a+MPfPGZxvlRqyICx4blD4CoDD
	lXKFA1ZA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCb1Y-00D0BU-15;
	Tue, 14 Apr 2026 10:29:40 +0000
Date: Tue, 14 Apr 2026 03:29:35 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, gustavold@gmail.com
Subject: Re: [PATCH v3 2/3] mm/memory-failure: add
 CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC option
Message-ID: <ad4VX61uLf4NA3zA@gmail.com>
References: <20260413-ecc_panic-v3-0-1dcbb2f12bc4@debian.org>
 <20260413-ecc_panic-v3-2-1dcbb2f12bc4@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413-ecc_panic-v3-2-1dcbb2f12bc4@debian.org>
X-Debian-User: leitao

On Mon, Apr 13, 2026 at 06:26:34AM -0700, Breno Leitao wrote:

> +config BOOTPARAM_MEMORY_FAILURE_PANIC
> +	bool "Panic on unrecoverable memory failure"
> +	depends on MEMORY_FAILURE
> +	help
> +	  Say Y here to panic when an unrecoverable memory failure is
> +	  detected. This covers kernel pages, high-order kernel pages,
> +	  and unknown page types that cannot be recovered. Can be disabled
> +	  at runtime via the panic_on_unrecoverable_memory_failure sysctl.

After considering Linus's recent feedback on kernel configuration
complexity, I'm reconsidering this approach. He recently emphasized:

        "The kernel config phase is probably one of the biggest pain points for
        random new people trying to build their own kernels, and we DO NOT ASK
        PEOPLE STUIPID THINGS." --Linus

https://lore.kernel.org/all/CAHk-=whigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk+XDssHU0A@mail.gmail.com/

I will respin a new version, dropping this patch from the series to keep Linus’
blood pressure in check.

--breno
