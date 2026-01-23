Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C9C34DCFD;
	Fri, 23 Jan 2026 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160662; cv=none; b=JA6z4Fw+UDnmIIOitT2Hz6IeUV2YPMrrLpYj0hldNQYo8gfJR8AJldcDlW8w2NK02mvCZtxymZp4Pu1wG0cvFea9v5E/MfECehVMS2RB9slgS+qzvduBe3Sr8XrbLs8nzWic87oTkYLGpI2jdCHcqMlnNtMQjAqTs95KMNSEsZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160662; c=relaxed/simple;
	bh=CZa1vMHpUg5v/qNKAUI7G2FUVY2ZU1V2Jmi1peG90ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ga0C/l7qHPJBz5qV/7dE2QtOb3TKsGuGCBh3VVbG3GkrkBxeL9/JbltOqH1cKUAwqgDMKpmBl9xTx87sQZhktaGFLfoKnX3tknvwTjmJYS2EErksbPxIZNr5Sg5VqqKkJX3SYc2PRSUqybLUyfMtKdzQ//tgQqEVLokrT5kQzFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ILDWJMZ0; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ILDWJMZ0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rNtYxKFphBNCM3ZXt3jWBfc2mks39Zu0uY8qEV8U7vU=; b=ILDWJMZ0jLdxP/8aFyqAg+GCII
	2W5clH2vqc0Tz/ikM2ojIjhwf3qJnQgvWIbzzHdkP0drd2/wdlefo3BGEZdGAqwaVYAdcKlwqoXrB
	mbDDbM/RrVjQ/EtUs8VVvv7BX2muVlPV5ANtkaT5zkYdWGTVHkOYr0rtdE5CrI1dRtSF9i/YomzZQ
	uuG/GjR0At3kdqDwcfmI0nq6XPe5/EEsksnycRyNH5Xiqh0JPV5fhg83rwlxoHMTvQrVdsVrcf+E2
	n6ksNLo0+3tSjyumEBXy0V+Ynv2g/FFXHz/sxOtj43YWym0lyyQduhymmS8qxiakTdmbgXCAS3QaW
	BLsc4bzw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vjDUO-00DjsO-AX; Fri, 23 Jan 2026 09:30:00 +0000
Date: Fri, 23 Jan 2026 01:29:53 -0800
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, bp@alien8.de, pawan.kumar.gupta@linux.intel.com, 
	mingo@kernel.org, feng.tang@linux.alibaba.com, kees@kernel.org, elver@google.com, 
	arnd@arndb.de, lirongqing@baidu.com, fvdl@google.com, bhelgaas@google.com, 
	bhe@redhat.com, dave.hansen@linux.intel.com, rppt@kernel.org, 
	ryan.roberts@arm.com, ardb@kernel.org, osandov@fb.com, jbohac@suse.cz, 
	sourabhjain@linux.ibm.com, cfsworks@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: kexec: Add support for crashkernel CMA reservation
Message-ID: <aXM-vOUVbD8iwicr@gmail.com>
References: <20260123074820.310605-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123074820.310605-1-ruanjinjie@huawei.com>
X-Debian-User: leitao

Hello Jinjie,

On Fri, Jan 23, 2026 at 03:48:20PM +0800, Jinjie Ruan wrote:
> Extend crashkernel CMA reservation support to arm64.

This is awesome. I was waiting for this patch! Thanks for working on it.

> @@ -75,6 +81,13 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  			goto out;
>  	}
>  
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			return ret;

Don't you want to "goto out" here, given you want to free cmem.

earlirer in this function, it does:

	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);

you probably want to free it before returning an error, given
prepare_elf_headers() will return an error, which will fail load image,
causing the memory leak for cmem above.
