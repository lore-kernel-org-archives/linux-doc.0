Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F43E23392E
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195547; cv=pass; b=VUrNpIFn5IywMAXpk7ZRtGB+AisrBfN7sM7JrWiuVL/FTPtf/G8WZjTJuiBoMfNnVAtoVHcKKWdwSbtCJxJOI0DtxVeQDvDUjArJ1E3RaZRBKGB4AqnUfvq6FLuflYYHVb170zgKjLSthskkML+vUwcqUC3U/Q6MJclhYvUPqtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195547; c=relaxed/simple;
	bh=REhXcwRLY2nH380oNAV9MXKs1IS6E3dzixN5AaM7iKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkIOBhu1LxMWvN+DSgh+uxkj/qutVHE9gk0o4zF68XfqdoccEbm1FDfgYvP68Sg9bP4LXPFmnPwG1Z4pYDqWKIrn1BZEfgxfGhSPfQ5YZKRq8s5EBQL78JNC3Uqhg0IhvBVBtgp1wkxULP5lTGJLij9jFazxC42YGeu+w4mpPps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDpCfdAQ; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDpCfdAQ"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65c2cd216c9so2982875d50.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 05:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779195545; cv=none;
        d=google.com; s=arc-20240605;
        b=YMhhvefwBzokeV85JXb5rtmP097Qgla/9dy42PVk9gKkx1ynMXshOUiLHifC909wIB
         fFJ0urmFYaNHOGWi9BYqCNUn7jBrxv3bJPC5UlwN8F3BJh+nErIw2HsvZo1u7jWXpMTY
         oW11KvXtzkKjMnyH+A0oY2xskIWUaG4VysH5Xb6kSG3/ixWqFSIPKl+oMYSRVZp8QxTC
         FqJCRseksj3gWLJCHaWGUob13FZBpytmjt+k22AuHnQ820Vu9BF4gRbpOE5iO6YmvbHu
         gnjss7cyZ1B6pUJpPcqwrZz31/cxPhuG7lOhqlnGO6eXp61Y6QCKABezXp0n6bm3BaSN
         Gicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G8XxVjNnm7f5AMUl/j6BlpwBrqGpV03f/LRUGTJZ+9E=;
        fh=qOPqYVvmSXyxul/C+0piHDUtqaoEVC85eu4Ya9djn5w=;
        b=erY4JOXqbhoLkHYso+0mj25mpGYWY7C16mMaC+v+jPbHu44iQakqq0L0yaxKgN78U1
         BkDg8ZE9EPe1YcTncSSQF82hLxWV2yARt5pfCchCV32M0ALOTcLpwf1+VrYO1ywCgnJr
         q6Pv2HV0B+Yc58zlY3I0rDYZXBngNJIs2ZWj0g5yVqu6wzunyMBtzHwY5Vega4aOcK/C
         RhuDurhCd1tSTnUkmHRe4Vm3RsjaSKjtGxc0EsjMYWUfitUwe76Evdu5wozjbMeUCxz3
         d7RD/xLFuocvuHV7xXMxVnsyhjGVTS581BperqXdyN8ba6DltTiekPk9ZN9n7Ctr+vhd
         tQdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195545; x=1779800345; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8XxVjNnm7f5AMUl/j6BlpwBrqGpV03f/LRUGTJZ+9E=;
        b=UDpCfdAQ1IYdNkzEQZtB+XOKCdKyE2nvRovWEshBUgQQSHPZoN/jEwZwdouyd4kYwE
         ptdExXqitxB9PTedkPU7pXBuUHpK6h5aPcLuSIRdm2xn9kNkqidtG0ZshW7o/m8gtv1j
         r2b1yPwVqSLCKj38UtscTuWsDUOBJF8FKtRj3hxkS+CVEOcLE00+JeSc3Ba4z+CA7gW4
         tb1ItypA24757GXH8F8uX30sRTbbSStI+XHI7A0fQotO/ecTwZJToQO+0ibR3W+HHIiO
         RE7PRcy94sFaHDeZphS0CNZoi36MM2hbF9IpkZWg715XfaXUDxO5gNEPqbJ7g4pOa2+T
         Wlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195545; x=1779800345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8XxVjNnm7f5AMUl/j6BlpwBrqGpV03f/LRUGTJZ+9E=;
        b=PyA4cAav40zYqPMPHwEFztJ/MHVR3q2Zne35qO0SGx+WoCTm96KS2D/4OA4s/iP9gf
         I20nlv44DtyXIIjUxO7EJNcfnsF4GXJw4ke4/JZf0IlN6nuNKFAFy2pNY+66DPq66gIV
         wFj55GR7KsOt7IMXXYOUIQMQ4wy+c2qJ+MFJXDYdIRvn3wQW20IDH9SgwDTaUuGwtgzk
         ucoWQO7bMsy4oe13WieyppHckyXhU0Oo91W7b5px2GRsN8Do7j/bPP0TeGaCxbSz761y
         ycARG1G1Npbi2P2mmrFu2U+JsvA5VtPxD14X2TdRAmA4uqAJTTfLP6z51uuX5qPwqt4e
         GCPw==
X-Forwarded-Encrypted: i=1; AFNElJ87UR0F/HPFuXjNHmrhOL7Bv5n3h5qrfcs59YIXgHdNsi4vzxwoKspsQ1aocx+m2da6+A5KKGCh/Us=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZEKZ3a5S7B6CWaFWt3oIyXUB4EuxMiJdux4JQaKIGPfytoMrB
	9YuD77bW06viFe7mcgKKThnk3+Fszoxw90ChXGtf+/6MxAxQHu11f5AN/Cxwnss0qfIM+0ZYDEC
	GTluolOUbxsQ7s615Ish2kjYFvC1GVzI=
X-Gm-Gg: Acq92OFCBub79lgwNwTdc2XnIIjMBuWvs35PlzT8XaIfVDQATXyqR33P9m4W+8xuST8
	tGXmFwIkZvpQfPUNJCoXZUh/i2sKNKwlOqzBhecc242QS2uMerN30NG+jbUvIlfz2qJlgoepPkJ
	eNunm30pgsqCPduJHasLyXyY1qEDiCB89UpdxxflSLUEQKJBbuEWJids5qm/MD9limXoWO/bxyC
	gG5209WRoEt7+6vMio/yUoZ+LqUJZ4XSpe1lhm2lSwW87NVWCSB5eomXzO7xaXPcarlQF2MkbIL
	tqML/+IfwVAaY7ywD04lGs/TSkEE9CHndkPY+sjjJFqaJw9KCBuW4rR4mGkz0UI=
X-Received: by 2002:a05:690e:1442:b0:651:ccc1:b4f1 with SMTP id
 956f58d0204a3-65e2261a440mr19937704d50.2.1779195545221; Tue, 19 May 2026
 05:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519125714.2435640-1-pratyush@kernel.org>
In-Reply-To: <20260519125714.2435640-1-pratyush@kernel.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Tue, 19 May 2026 13:58:53 +0100
X-Gm-Features: AVHnY4KZP5LxSAGhJdo5NjwgIgRGcQH4ac7CzTxS8cwS1VoU10GwA76yTE3deEI
Message-ID: <CAMw=ZnTotDOXfh=9zHtdRpyt9QRSQ+y=c1N+U1=f1wdzOtJzig@mail.gmail.com>
Subject: Re: [PATCH] liveupdate: document liveupdate=on
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 13:57, Pratyush Yadav <pratyush@kernel.org> wrote:
>
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>
> While the liveupdate= parameter is documented in kernel-parameters.txt,
> it is not listed in LUO's user facing documentation. This can make it
> hard for users to figure out how to enable the subsystem, since enabling
> just the config isn't enough.
>
> Note the need for the kernel parameter in LUO core documentation, which
> gets exported to Documentation/core-api/liveupdate.rst.
>
> Suggested-by: Luca Boccassi <luca.boccassi@gmail.com>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>
> Notes:
>     I think we should take this patch through the liveupdate/fixes branch.
>
>  kernel/liveupdate/luo_core.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Luca Boccassi <luca.boccassi@gmail.com>
