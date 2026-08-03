Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077C3C1F
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783786; cv=none; b=AlwIGI/NCJl75PA7/OQ1UDuov9r2sioBsLKWvcVNlv2/mUZBoExd0L/ZypAD5exy1Fkv4cJRpZLLloUmv12ndL8eQ9apZmVFvqE0DcI+GI8vdciLOf/0wOT7XhRbSty69rZJr3m7CTaL4N5zPkeLTkc+tw4RYILmcfXqL8N0vV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783786; c=relaxed/simple;
	bh=Y+guXIj/BmYM6swlo5VbPH2qTlmRR/DFoupqiUA9Ejg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ezFodJD4Aw+Ud93FecpDnnnEr468NfKaDqopBRH28KHd2ApZX2mDvYH8ybwzA71U5JNKBT9hAOW7YC2kBKYEykEiseoGntpzW9K5IKy+4njv23U9LWjOf3j02xXOFoMmdnYyrcHa44i0mBesZdtAJblrZI0GMWjmdINVyOBlIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=J9Y/biMy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="J9Y/biMy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 99907408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785783784; bh=G7F+0uWxNTgm2x/cb0THzawGLZ49kLYdIXaMV0cZgMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J9Y/biMye42DzmgnCqo3rWYMehGj7aX8hT8YGx7cg2IBm+j5N+QS9OZqQYVhh9oe1
	 3iL2z14bbsRLateNImL3QSmctEbpl6Lfgct0O24T5Up55HKl9wKKXcJCO3RutuOU2v
	 ycnOtIDQmUl97ygtKOpUFUYDO1i9ugYrf9787nk8Wj4wjw4of9VMrhttkL/esJIT8h
	 3LOsNI8q99uOo6Jv+eG7wtg7Bw+T5g2oaCqWhPuazMi1e1D18qeVUzisQQGFzYGPAJ
	 1TllXdj81MA4CoyJlz/tXbmndaRBBd1IIKkcsZcEvT0NxcSqX+w5+40xQig6mVmPp8
	 drDE1q3/t6+FA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 99907408D2;
	Mon,  3 Aug 2026 19:03:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: xforms_lists: support DEFINE_IDTENTRY_IRQ()
In-Reply-To: <20260723190151.507295-1-rdunlap@infradead.org>
References: <20260723190151.507295-1-rdunlap@infradead.org>
Date: Mon, 03 Aug 2026 13:03:03 -0600
Message-ID: <87h5lbxc0o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Avoid kernel-doc warnings by supported DEFINE_IDTENTRY_IRQ() as a
> function transform.
>
> Warning: arch/x86/kernel/apic/apic.c:2157 function parameter
>  'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ'
> Warning: arch/x86/kernel/apic/apic.c:2157 expecting prototype for
>  spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ() instead
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  tools/lib/python/kdoc/xforms_lists.py |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20260722.orig/tools/lib/python/kdoc/xforms_lists.py
> +++ linux-next-20260722/tools/lib/python/kdoc/xforms_lists.py
> @@ -90,6 +90,7 @@ class CTransforms:
>          (CMatch("__(?:re)?alloc_size"), ""),
>          (CMatch("__diagnose_as"), ""),
>          (CMatch("DECL_BUCKET_PARAMS"), r"\1, \2"),
> +        (CMatch("DEFINE_IDTENTRY_IRQ"), r"static void \1(struct pt_regs *regs, u32 vector)"),
>          (CMatch("__cond_acquires"), ""),

Applied, thanks.

jon
