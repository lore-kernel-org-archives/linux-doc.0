Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD314175B1
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728920929; cv=none; b=PMRDOSdWqpjb1kZdlhsqqJrv5gHhPBSm5oCPOmBXtkPpVGOog8IPhdBEShr/EmHPQ2igwXZRVhBleWREEmXT0KoM07S/zp6rkUW2Wak6YDSjhYyIRNOHHmuYBkmFvRkFLIdioZiW2FAYuwCtsicKt5+kVsEBwklscJWUjETwlKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728920929; c=relaxed/simple;
	bh=z2UsJqzv7CC72O92S/vrz1vSlgsc+hNmrr+UQKEntc0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bo1twyyohfVawQ+AFMfaODXOvsNGlLXOopp/b3GvXfxO7QoUuD5RBhkm49tVMA0iF/5tBnToJtgksFEltbQESf4YLIlCecSSAb26Qy2ua80UPN0UIWO9J4SHIKN7MxIzOar62Lfn84zuuBfGc6Nhs/dwiOgS89o67oznhew/Hps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=J1qZNVh+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="J1qZNVh+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C0C2442C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728920926; bh=KsBiH0rb3KTJP9bsGDwcxZeE2zYK9n/Y6Scyw7CVZAk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J1qZNVh+/5ouKxXyzjL2a0C9wVf0gRWNNB0XccPz4gQLeMxDqeHPamnZ/pGugKeja
	 RgaNi0kJx/NyIcVtKuob91edMxMuUmyLzBIJVlXSiFOOTHS2Ywdz6SRcReBsaUF9sR
	 KYqHH0D1aDjOper94HLMOoSAe1EhpquUb3pxvlGQvvk01kzXUZ/milDQvD4v9i01pC
	 3UHExX0XCYNG35wS52dfHn2bC0CRIDYXlAr504cqWkVQ1ce/bRT6r9w5CUHbaIyr/U
	 sjFDu3RcgIXGOruFzVPpj9/s+Rvcd2VKdW0TiPZ83IHWZPBUSn0MGz/6125cuc4uyH
	 +zb9A2JzssCGQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C0C2442C0C;
	Mon, 14 Oct 2024 15:48:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Horia Geanta
 <horia.geanta@freescale.com>, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC] kernel-doc: allow object-like macros in ReST output
In-Reply-To: <20241014051333.462847-1-rdunlap@infradead.org>
References: <20241014051333.462847-1-rdunlap@infradead.org>
Date: Mon, 14 Oct 2024 09:48:45 -0600
Message-ID: <87cyk2u1lu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> output_function_rst() does not handle object-like macros. It presents
> a trailing "()" while output_function_man() handles these macros
> correctly.
>
> Update output_function_rst() to handle object-like macros.
> Don't show the "Parameters" heading if there are no parameters.
>
> For output_function_man(), do show the "ARGUMENTS" heading if there
> are no parameters.
>
> I have tested this quite a bit with my ad hoc test files for both ReST
> and man format outputs. The generated output looks good.
>
> However, I am seeing one problem that I don't have any idea about and
> would appreciate some assistance, even just email commentary about it.
> The output now includes around 100 warnings like these examples:
>
> Documentation/core-api/mm-api:37: ../include/linux/slab.h:154: WARNING: Inline literal start-string without end-string. [docutils]
> Documentation/core-api/mm-api:37: ../include/linux/slab.h:192: WARNING: Inline literal start-string without end-string. [docutils]

That comes down to this in the kernel-doc output:

> .. c:macro:: DRM_SCHED_FENCE_DONT_PIPELINE
> 
> ``DRM_SCHED_FENCE_DONT_PIPELINE ``
> 
>    Prefent dependency pipelining
> 

Sphinx is, as we know, weird about white space, so the blank before the
closing `` makes it unhappy.

The attached patch on top of yours makes it go away - but there are some
other weird warnings, like:

> /stuff/k/git/kernel/Documentation/gpu/imagination/uapi:169:
> ./drivers/gpu/drm/imagination/pvr_device.h:686: ERROR: Unknown target name:
> "static_expr".

...that I haven't been able to track down yet.

Thanks for working on this,

jon

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 78373af6679e..aaf29b11b3bc 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -830,7 +830,7 @@ sub output_function_rst(%) {
     my $paramcount = $#{$args{'parameterlist'}}; # treat -1 as 0
 
 	if ($func_macro) {
-        $signature = $args{'function'} . " ";
+	    $signature = $args{'function'};
 	} else {
         $signature = $args{'functiontype'} . " " . $args{'function'} . " (";
     }

