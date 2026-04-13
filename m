Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16603BF680;
	Mon, 13 Apr 2026 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079359; cv=none; b=Gmp6doyURVNiGbRav5//vaDV2oRqc4++WTcFgMFhmtDXJT2J6Que0l3yg9IK0Ze06MgiCCUIXKbuTh0JvJQhue5e9xcreC8RNshMPJLiyoi3S3SF02W14oJoylT0nD1joSfXpKqbe8iAJTJ1Ef592GtfJgd/IHl7HadcaC/wSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079359; c=relaxed/simple;
	bh=qyuACa6cSDnuCVOltnurx00idjKamNDwYb4pWwlW7y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrgbakyUXIJB64uVjTLIQwNF6L65KiUzFTjjxizrP3uDsl7icMg9uLW6shxsAd0DO+b4hkqAMgiRqGTkaviYM86WHnuefVkhZGfxxKBe68oe1Qp9Qdco9/hPGZDuJn3sZOs/3RPyQTe3ZiNMjz4v98F6oOCokTJL7Ec/GVr79b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=EQzxAo9Q; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="EQzxAo9Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=epg3lloxstaR+U2vf+uUHLYMjLaIyOPP3DRHzedUqkg=; b=EQzxAo9Q44B5SjzTyheEABdbL3
	ggxr/2N/jTNN+JQZThPbeI0p6MxqiEdEO2GdqY1MUk5G/PJRKybDDGU74KFLlYcX/A2mMcU0R1uhb
	I0UQzGNbvINHzfPAPRWuNHmNi0lWtSDamNvgJZ2W60u3ZcoNt9nHp4Z2FXI9joYC+KF9XJLvhD9GB
	tj+Hop85hnwTbrPgfhvazdA2gOuYktSqCGvK5/PlOC1LofEDdcwSxS6sQ2W/+nWK5WyjC5FVdqTVd
	nLFY3NIS8X1jdbxKXqJovZ6RYinwkpvFFM8Fqca81ZcJhNLB8xTi3k1ZC29UqGRuY56dDsgVWKfUQ
	/E4vJchA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCFN4-00CFrC-0y;
	Mon, 13 Apr 2026 11:22:26 +0000
Date: Mon, 13 Apr 2026 04:22:21 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
Message-ID: <adzQIS7jd_Ce_JrA@gmail.com>
References: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
 <20260331-ecc_panic-v2-2-9e40d0f64f7a@debian.org>
 <59c133a7-74a7-4678-d907-add764bbd107@huawei.com>
 <adkFQF7QH8Jc3p3U@gmail.com>
 <15315535-3881-e2db-02d4-907235dd98b7@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15315535-3881-e2db-02d4-907235dd98b7@huawei.com>
X-Debian-User: leitao

On Mon, Apr 13, 2026 at 11:42:19AM +0800, Miaohe Lin wrote:
> On 2026/4/10 22:17, Breno Leitao wrote:
> > On Tue, Apr 07, 2026 at 10:57:36AM +0800, Miaohe Lin wrote:
> >> On 2026/3/31 19:00, Breno Leitao wrote:
> > +{
> > +	return sysctl_panic_on_unrecoverable_mf &&
> > +	       result == MF_IGNORED &&
> > +	       (type == MF_MSG_KERNEL ||
> > +		type == MF_MSG_KERNEL_HIGH_ORDER ||
> > +		type == MF_MSG_UNKNOWN);
> > +}
> > +
> >  /*
> >   * "Dirty/Clean" indication is not 100% accurate due to the possibility of
> >   * setting PG_dirty outside page lock. See also comment above set_page_dirty().
> > @@ -1298,6 +1319,9 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
> >  	pr_err("%#lx: recovery action for %s: %s\n",
> >  		pfn, action_page_types[type], action_name[result]);
> >
> > +	if (is_unrecoverable_memory_failure(type, result))
>
> Would it be better to name it as panic_on_unrecoverable_mf() or something like it?
> This function determines whether panic on the specified memory error.

Acknowledged. I'll rename the function to panic_on_unrecoverable_mf() in the
next version.

After extensive testing, I'm considering adding a boot-time configuration
parameter for this feature, similar to BOOTPARAM_WQ_STALL_PANIC,
BOOTPARAM_SOFTLOCKUP_PANIC, BOOTPARAM_HARDLOCKUP_PANIC, and
BOOTPARAM_HUNG_TASK_PANIC. This would make the panic behavior available
from early boot without requiring runtime sysctl configuration, ensuring
the system crashes on unrecoverable ECC errors rather than ignoring
them.

I'll prepare and send the updated version shortly.

Thanks for your feedback,
--breno
