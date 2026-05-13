Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736AD3A783A
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697372; cv=none; b=KQfbmn6JntLAWeZdBpzFim9M/b9uoqto5E/3HCkUdIwdBQseAsfcLiBQnFXxtJhzEB8vVGcjQu+KuMecD/6fr1QLXKoLrRHFhuDgIYCKLcvPw+bBY6i9a8ksXPjz7JYDlloh3QDwyEVRvXtYWOuZd7ff/HC0zC9chXp/tZ8gf9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697372; c=relaxed/simple;
	bh=fKOKJEKCQB7cRMjjud6VYUpU43WsP6hzTEL1c0Fjrok=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Subject:
	 References:In-Reply-To; b=b8H11sghEBEVI+JXi3+Sx2wnyMoEw91XbYmUnQyDWCwshsYoPvg1tdoUj/qbof8rJn6H74QEEfgROydNIG5XvCUOTpopcmez7x1dDN4avCUxqdqq8J0aWxcNqpGPDf6p/mZ1herrzitcQDMN7941S3JWjprDgG33elmbVrBJ4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=A7MxMrbj; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="A7MxMrbj"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95fa7cd1392so160862241.2
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 11:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778697369; x=1779302169; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rnl9nddGqHsoJCblcDMeoQmT9vKG6sC23FZyxNkSplI=;
        b=A7MxMrbjSeVVFbeXNiNPJdI78vdz2rTwTyC5hL/rLuWxlOgb/ocUKXMFHPCIcJt2Xj
         FJzPw4sIPjyQrKUAtKPrkk1eiskLuK5mjxX21fVq6yM9zrt4rKqwNFAqS2W5xNWX2Wsu
         ZGPYuY6xNB0QZniXskfL7MZmHQPbOw5qEOPE4s9m2uH0kU6WPOyLlqlWRoZ46pdJaQeZ
         /mY1Dfx7m0kg3teBSECwDHM5kNukzof8+ESeA641G96q8LPqz8fgX171wmkz5IJmgQtU
         6JP7GW/WQQ/DEJw2JMZ7AWeXb3++SculGj729qIsqp44QL096yH9Sjwttw4fTFELZQVX
         VAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697369; x=1779302169;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rnl9nddGqHsoJCblcDMeoQmT9vKG6sC23FZyxNkSplI=;
        b=PoSjWhfXEKVpnhe6aDaDA7aWQI1bRoscScbRx0W20WtcQ6uFQ4v7et28FL2rCLHvFl
         3FR5XjMjndqPRpjZ0Qf8Dcs3VO8k2c4nNkjU/26qi9wq9HzTJBbdG92wt9ohxtd2xw8i
         cDYkTqhTJyWvEvlyVZCLxAAIVm52B2INUZ16ftamhyE6dMmmdxj+KXf5uZBx8U5mGkS6
         SFNT3l5Vg6uaghV3HbkndH1jRcogf7o76H79Osjdzd+M3jX6iMkYObliyJvhrR47p9kG
         uQROxnLk5loiEcNZItWC7x991UcvI24P8NSp5v6kg5B+s6qZJKzr5yy8lsMg+w2fL7+V
         EySA==
X-Forwarded-Encrypted: i=1; AFNElJ8tv+3U76OuhqHyd8V+Tg40QIzS52J6vVcYNXZPSl8EbKBkz3DVOiotraXVJ0Rgq3aikyOS6NLsk+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjKvLoIsyimwFtqn+0Dq36HTFBFKjm2fnkAu7KmE/WTxkgZXAR
	soSnsBs5i/RCw+8h3zIlhA/MVyem9tLh+693H2RY3/dTFkraRhemUBpeN/OD7jU9cg==
X-Gm-Gg: Acq92OGlrjPqMw6Q2m9eBoLTBU75KXPix9qRe3i/Df+q4RP7ZmtBMf0IGRO5pxu/W9d
	bnEzIr6RVfQ+pm44VROQej0qyqgfyapyHsBMxqWJRPfNbXZViaOXAsvlorFUaDtYHlFRlMWDjcS
	u5izNCbOyD1GIMGCIeTeQMRVWXcY2OX4mYcXrXUg0/Fsh4WT0kffviIFwyZ9K5JSiePIOjI1coS
	z+oPYbqg7mjqrYi5LyJ7aHLvtkzHfpx6Dvkg/iUENy5AJgUGIfI0VuFebr26wwzSEvBJ+54a0YJ
	JuqkEIh0izYb2/G1Ni7YbjSyRM/qSQYxPRoaQ/Tahl1SizrGAFkztMrlFJVMvHGI4nrarjnXPk0
	gr+8yto4UymmllbfOD3biA2VEwX4PpE7t86S/6xQr4q0b6Okop32i8LeJQEyo7yDai3xb+ERwF1
	kFdWKWjxUMST0e50uf1ql3ziyCzEE+M9lAWvB4fRjo/dJppC0CLDKMRgr3z6SAw2Ftp1N+
X-Received: by 2002:a05:6102:6f06:b0:631:b834:e055 with SMTP id ada2fe7eead31-63773d10a25mr2918465137.10.1778697369491;
        Wed, 13 May 2026 11:36:09 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90b4c50afsm2995736d6.27.2026.05.13.11.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:07 -0700 (PDT)
Date: Wed, 13 May 2026 14:36:06 -0400
Message-ID: <37fe68a4543e20fb34b6c9a146151711@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260512_1604/pstg-lib:20260513_1343/pstg-pwork:20260512_1604
From: Paul Moore <paul@paul-moore.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, "Blaise Boscaccy" <bboscaccy@linux.microsoft.com>, "Jonathan Corbet" <corbet@lwn.net>, "" , "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, "Andrew Morton" <akpm@linux-foundation.org>, James.Bottomley@HansenPartnership.com, dhowells@redhat.com, "Fan Wu" <wufan@kernel.org>, "Ryan Foster" <foster.ryan.r@gmail.com>, "Randy Dunlap" <rdunlap@infradead.org>, linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, "Song Liu" <song@kernel.org>
Subject: Re: [PATCH v7 4/10] lsm: framework for BPF integrity verification
References: <20260507191416.2984054-5-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-5-bboscaccy@linux.microsoft.com>

On May  7, 2026 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:
> 
> Add a new LSM hook and two new LSM hook callbacks to support LSMs that
> perform integrity verification, e.g. digital signature verification,
> of BPF programs.
> 
> While the BPF subsystem does implement a signature verification scheme,
> it does not satisfy a number of existing requirements, adding support
> for BPF program integrity verification to the LSM framework allows
> administrators to select additional integrity verification mechanisms
> to meet these needs while also providing a mechanism for future
> expansion.  Additional on why this is necessary can be found at the
> lore archive link below:
> 
> https://lore.kernel.org/linux-security-module/CAHC9VhTQ_DR=ANzoDBjcCtrimV7XcCZVUsANPt=TjcvM4d-vjg@mail.gmail.com/
> 
> The LSM-based BPF integrity verification mechanism works within the
> existing security_bpf_prog_load() hook called by the BPF subsystem.
> It adds an additional dedicated integrity callback and a new LSM
> hook/callback to be called from within LSMs implementing integrity
> verification.
> 
> The first new callback, bpf_prog_load_integrity(), located within the
> security_bpf_prog_load() hook, is necessary to ensure that the integrity
> verification callbacks are executed before any of the existing LSMs
> are executed via the bpf_prog_load() callback.  Reusing the existing
> bpf_prog_load() callback for integrity verification could result in LSMs
> not having access to the integrity verification results when asked to
> authorize the BPF program load in the bpf_prog_load() callback.
> 
> The new LSM hook, security_bpf_prog_load_post_integrity(), is intended
> to be called from within LSMs performing BPF program integrity
> verification.  It is used to report the verdict of the integrity
> verification to other LSMs enforcing access control policy on BPF
> program loads.  LSMs enforcing such access controls should register a
> bpf_prog_load_post_integrity() callback to receive integrity verdicts.
> 
> More information on these new callbacks and hook can be found in the
> code comments in this patch.
> 
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> Link: https://lore.kernel.org/linux-security-module/CAHC9VhTQ_DR=ANzoDBjcCtrimV7XcCZVUsANPt=TjcvM4d-vjg@mail.gmail.com/
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  include/linux/lsm_hook_defs.h |  5 +++
>  include/linux/security.h      | 25 ++++++++++++
>  security/security.c           | 75 +++++++++++++++++++++++++++++++++--
>  3 files changed, 102 insertions(+), 3 deletions(-)

Merged into lsm/dev, thanks.

--
paul-moore.com
