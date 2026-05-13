Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1977D3B895F
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697393; cv=none; b=S48usDt4psSfLUB8h/e+3kRcjsaQKQIDD4oevDq6cZSIS08ZsBZIF9L+oCuHgaaVcJsKNhq6mFPBwFgyfPQLuhy7sIjwLCYPBp5yDI2p60NHTp/SBN/xJO3EjDMrbwdMtQ+YrvI7C4XXkCwh9cc4O33TWTvFQxRCNXrSexUQxrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697393; c=relaxed/simple;
	bh=NXfuPJC4WSBHlTygHezAndhnrlRtJXLP/Fq/2xUcvRE=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Subject:
	 References:In-Reply-To; b=myU3wEolWs+LSHtMmoh6NlSPvBQJWMHzKdZJMakEane+1Cx4S6IpdOo9jQySzQSyatzWgYrcw7hT91aOGRpB/rBPmKicUDNrx2MNQaz/GhS9XheApjEuv/1uy+zTF9xYGfuC4Key4r2DLDLhxKstSMtm5xUEjpyKE3cp2nqhjhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZJHbv2lD; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZJHbv2lD"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8d560ede296so794329085a.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778697391; x=1779302191; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOF9niRN6Jvg5hWvhCYadN/BxIKdMgGJZ26cseYyxbc=;
        b=ZJHbv2lDOZRJyTcKA+qvxIxLhoedCd9bmSSGg789mJ9ES2t41UXgUniEVqTMl1LpW+
         Wx/oEFavjodiWFxplHWOcyg68Sb3LmHDuMNQK4X9uubJQAIBrTUYCmdPWgQbqkPKOHCA
         qYl/AgVibbk7e62sLWG/GGK/eyIfiCBmFbI2rXCWrQSl04vn7W/8iBeUT6bu+AdzjuwB
         uKMX8VzjWyYdNct1R2GAP5boJ1JWljrsCvTO2jEpuBV7dWYVJaFcryHbKGazlTKQIytW
         reQpp+eSC2l17bXt2mK2AjHwIiT3Sxby0sUt4vyrSbVb7Va0KH38Ow3GpXkxn+4FLDja
         iB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697391; x=1779302191;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOF9niRN6Jvg5hWvhCYadN/BxIKdMgGJZ26cseYyxbc=;
        b=fW0q2yFor6Hl5DklDyvkcG5y6IV0rwg5ikEsch6DW1X9ka23tFCXMSmY4kozissv1J
         t/9r2yrHSbhmfWnFQmGG0R1g+OuJZltPNMfze8SN3dncKuiHDlRFDBW3b6Y18y8lLLdl
         uEgQj1feG/gZ3AGReFrv50JrxXuu7A4OFbsS4jb6Oo2h0s/FMUTngGhHToI0mCK86/W5
         ZarufgMOkzQQutowmaH8sFhPuGA2XlzQr3Xez+JvBTLa6O9kA7szPyEddp2sdMj2CsYu
         Sv1BX9W4kRr7Y6ZTTWA/OxKBCS0tmAViiDzBVYxFLqkst7lMo1WYAHl56tbRAQHvZ5tu
         0gQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8e7m4R1XG8oXUYPx8DdBbadDUOx6z/lTy6ENctj+4eLFsy5crDh3dCfa0togS8wrKEIWLJtJMRFJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzini25VRieEzfY8un2I7VaxYDtZAHPbquPKfr1j4sIVjQIl6bP
	xrfATlH1MU8ZPkR/+aIecCUIlbRQvVlD1Csr9AjP+VB1HP1UmvomQMGf7hiWgD8E4Q==
X-Gm-Gg: Acq92OGHuuy6V8HAj8qZbBvl5HIgzlz+MJ00kroeb7HwALIP0hYLsZV72QGIaif+oai
	B8OLRsumw7KdENEbc4zkV3AlITM0q3XXedZbuiUsQFci3eWA0R2utNHdzAD4SqwcZUhA43gyOV1
	JKB1F7pBtqB7dQFrWkCkQXOAZZjEO9wmnk3n4tcQfaVeatmP0umN/0p35lzRiV7H3Xb0najXdFu
	SLfcy2/aJAKeR/GYI1M9zOMgjcZltnAbAlFGQgXNjtT/c49NBBM3+PSFGCYtXgtv43E4TW9rx7b
	8O4pczm7DqJXhIqVbSDU4e6aWiOPQIKmonx75sOhoVEB298kuUQGi64BhxQTU8MMXXgFefDPra8
	SY8P6JDUwU03d4R9jCJVl+7wByfXSThy6oyJQyuRudUBk+Re7eiFZquampklM1xZb+rVDADwg/3
	mafLyFkf8Re5/DWXae2VpvkVJsCt+QIsV42fX/K3w2ADyYRXRV3GbTesJusIvDD+V8y7Y3
X-Received: by 2002:a05:620a:2682:b0:8e8:bedd:14b7 with SMTP id af79cd13be357-90f89668be9mr690867785a.22.1778697389597;
        Wed, 13 May 2026 11:36:29 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bab32bd0sm34033485a.14.2026.05.13.11.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:27 -0700 (PDT)
Date: Wed, 13 May 2026 14:36:26 -0400
Message-ID: <c759ac7dd982a61d78078371780bdfac@paul-moore.com>
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
Subject: Re: [PATCH v7 10/10] ipe: Add BPF program load policy enforcement via  Hornet integration
References: <20260507191416.2984054-11-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-11-bboscaccy@linux.microsoft.com>

On May  7, 2026 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:
> 
> Add support for the bpf_prog_load_post_integrity LSM hook, enabling IPE
> to make policy decisions about BPF program loading based on integrity
> verdicts provided by the Hornet LSM.
> 
> New policy operation:
>   op=BPF_PROG_LOAD - Matches BPF program load events
> 
> New policy properties:
>   bpf_signature=NONE      - No Verdict
>   bpf_signature=OK        - Program signature and map hashes verified
>   bpf_signature=UNSIGNED  - No signature provided
>   bpf_signature=PARTIALSIG - Signature OK but no map hash data
>   bpf_signature=UNKNOWNKEY - The keyring requested by the user is invalid
>   bpf_signature=UNEXPECTED - An unexpected hash value was encountered
>   bpf_signature=FAULT 	   - System error during verification
>   bpf_signature=BADSIG    - Signature or map hash verification failed
>   bpf_keyring=BUILTIN     - Program was signed using a builtin keyring
>   bpf_keyring=SECONDARY   - Program was signed using the secondary keyring
>   bpf_keyring=PLATFORM    - Program was signed using the platform keyring
>   bpf_kernel=TRUE         - Program originated from kernelspace
>   bpf_kernel=FALSE        - Program originated from userspace
> 
> These properties map directly to the lsm_integrity_verdict enum values
> provided by the Hornet LSM through security_bpf_prog_load_post_integrity.
> 
> The feature is gated on CONFIG_IPE_PROP_BPF_SIGNATURE which depends on
> CONFIG_SECURITY_HORNET.
> 
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> Acked-by: Fan Wu <wufan@kernel.org>
> ---
>  Documentation/admin-guide/LSM/ipe.rst | 162 +++++++++++++++++++++++++-
>  Documentation/security/ipe.rst        |  68 +++++++++++
>  security/ipe/Kconfig                  |  15 +++
>  security/ipe/audit.c                  |  15 +++
>  security/ipe/eval.c                   |  93 ++++++++++++++-
>  security/ipe/eval.h                   |  11 ++
>  security/ipe/hooks.c                  |  63 ++++++++++
>  security/ipe/hooks.h                  |  15 +++
>  security/ipe/ipe.c                    |  14 +++
>  security/ipe/ipe.h                    |   3 +
>  security/ipe/policy.h                 |  14 +++
>  security/ipe/policy_parser.c          |  27 +++++
>  12 files changed, 498 insertions(+), 2 deletions(-)

Merged into lsm/dev, thanks.

--
paul-moore.com
