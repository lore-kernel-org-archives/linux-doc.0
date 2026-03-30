Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394673D47BD;
	Mon, 30 Mar 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878337; cv=none; b=J+/G1bAWu6nWSgmT1cQ092lQyxUZuhMIRyKk5BaWeuPIjHj7Jy+8XUTUCQeyqJkD8z6yQ1+44YdyRnTTICUbzhS+FufPZUb2An6n0Z6Cp/1gcm2gztgRoDtQnydpYUeQlZWb8mAkDfQcd3cba5kPrr4dunc2BtuRIN6A+L+ci6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878337; c=relaxed/simple;
	bh=oh3LJd+IVAspxFz+oZWd84Iw0XA0l52J4QuwSg5VRbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeLd2WWsSY8HWvxUMjqIpf5WQTLuqlSUr553x259onsug+iV0grsVGJLNu9Vz0rbN6Yl0wba66P2ccCii481Z9cH2NeOsERGFVRgOtlbBT3w2o90egClI+hwGGLssHFCMiOdylYuaL3ZvUemxWdk0jUv741Z665nXzM6151NTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=rxgfIOcX; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="rxgfIOcX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0/9KOg+FUezNUc5b2A1UkvHRKClpiuB0wSxuomQh7PQ=; b=rxgfIOcXW2uGO6FG+cl1uANevR
	LmT/g4+LAMvmNA+HyxD7DRYA+vX4AlvMQdjepsRkfb4SbO8V5S5WyrQCfGF2//mnVoalX6wvPl70q
	DoeDrca5dZzxJEdeL335SVcX2F1DeXXQAP11kNtTKL6IrV9QaBDRP5e4dxRfiYFhLMkmRKuLDrF5k
	Dhg8Vn2PgUJxLj/98swn3w3Hzznf6SLl2x4aEYAcnURDk4/6aflrNliE8YpUkV1HIeJJyakLESgdV
	rRpkFqCJAUG6mWTgS9UJ22WD8m25lfqC2pCYXqLc3gZ36/mkmk6x/z4ESyI09irPXAiBmrAQo5HAp
	+8CJaSfg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1w7Cvn-001UJL-0a;
	Mon, 30 Mar 2026 13:45:26 +0000
Date: Mon, 30 Mar 2026 06:45:21 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
Message-ID: <acp8wYLHDGAfhzI5@gmail.com>
References: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
 <20260323-ecc_panic-v1-1-72a1921726c5@debian.org>
 <a88d62ee-530c-1a6e-c05f-de324f940b8f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a88d62ee-530c-1a6e-c05f-de324f940b8f@huawei.com>
X-Debian-User: leitao

On Mon, Mar 30, 2026 at 03:55:00PM +0800, Miaohe Lin wrote:
> On 2026/3/23 23:29, Breno Leitao wrote:
>
> > @@ -1298,6 +1309,10 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
> >  	pr_err("%#lx: recovery action for %s: %s\n",
> >  		pfn, action_page_types[type], action_name[result]);
> >  
> > +	if (sysctl_panic_on_unrecoverable_mf &&
> > +	    type == MF_MSG_GET_HWPOISON && result == MF_IGNORED)
> > +		panic("Memory failure: %#lx: unrecoverable page", pfn);
> 
> MF_MSG_GET_HWPOISON contains some other scenarios. For example, an isolated folio will
> make get_hwpoison_page return -EIO so we will see MF_MSG_GET_HWPOISON and MF_IGNORED in
> action_result. But that's recoverable if folio is used by userspace thus panic will be
> unacceptable.
> Will it better to check type against MF_MSG_KERNEL_HIGH_ORDER?

Yes, I was discussing this with akpm, and maybe the better
approach would be to panic for types MF_MSG_KERNEL_HIGH_ORDER and MF_MSG_KERNEL.

In both cases, it seems that, the page would not be able to migrate. What do
you think about a change like this:


@@ -1298,6 +1309,10 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
        pr_err("%#lx: recovery action for %s: %s\n",
                pfn, action_page_types[type], action_name[result]);

+       if (sysctl_panic_on_unrecoverable_mf && result == MF_IGNORED &&
+           (type == MF_MSG_KERNEL || type == MF_MSG_KERNEL_HIGH_ORDER))
+               panic("Memory failure: %#lx: unrecoverable page", pfn);
+
        return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
 }

