Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D533B2FF8
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697386; cv=none; b=DXyZRxFqZsQ8ht/uCKTij3ifs12srqrNRYAvqLDl3Q75PUHvEnckDS2M/9Hv1lbyjRyH07knYc7XJ5kVDeqQXGZ4DNRNgbIe5hFbhCKwyztKPIZ9Y4ulBAOlEu6e462cEXXUdMfp0LZ54es0JQ2ED7IEmngpSPtG87WP/eA0P+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697386; c=relaxed/simple;
	bh=tgzzRWeFFLLVqVYfNiMDpJLCOzGiUIuA89Thkq9k3HQ=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Subject:
	 References:In-Reply-To; b=mf7oUrD4J+2pB4QaXv/koj3LKXMt4r9EJFBY6XSD5ado5pszHKdVbyW5/BCq/XiSngkNHUcb67Y7+adjgSGCASVsyZKFQDFhSmgVrUbQ/ErSkZ6vPm7lYmPTgYJLUGK/xVtDJ2d2hMtngJLGhdKwvHk6ovPfUGWyLeUVTDENYWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=OgS/BO2b; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="OgS/BO2b"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8d65f4073bfso960639985a.3
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 11:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778697383; x=1779302183; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEzHwGtzOySpS8QquZN0ToIgXpoAH078jjRlfa9/K4s=;
        b=OgS/BO2bpdTxroMuiGRoeS1Kd8TGu+n/VV+WqSV5EdDkQy2ry+MuEAcq+3O4u1qftC
         N3UeUZCi7NKeH6u1yanyynP+qfWFFdT2TbxCEZAJWE68OFOeL23BDB0xY/bDojJNUdtC
         UzsWx90C+b62rC1HLhjvt10mZ20k48/4+22WS5QzqS0C5eOC4u40c49h15HvJFEk/+w9
         D2+9Yj+vTMXWs0FU+S0LN9+avj9f2aEEk6FNru/DKCzh4MhuhhYonY0H3xhASFcOcqeR
         V9W+MPvtDhOmu2wj+Wk5MmQESayw0+E2jt/BtR1+/C2sanuAv6MwjVuUJLedMwRnNXwc
         6U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697383; x=1779302183;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEzHwGtzOySpS8QquZN0ToIgXpoAH078jjRlfa9/K4s=;
        b=qBH2CpfstslP6+rgBemBBAtz8T5ZG1ZhvZu5S3GkkBbE3nEebZjqRYejGuofzjbHVC
         ToV4ZBKvpW2YET69Q1qYW4CI2DifTrhacBPqRlcMEwM7H/L69LAUZ755CufIsUnPpbPG
         Rzw8tGe/fWUltLJhFVJBOGTkU448ogo5Ofv+Vh3gQ5PLnpZCQzfU2CkQ0dzHD5W3qILP
         +2CFtp6fDxNQk1SMVjEruclt25Iy3q9CWSRfG4oigryQGX0aGy1kZgUxwhwVH0T47ZD3
         27ticGuO9WR5DtATuk5a3kGsnihL51BpyoArRRH3SGlQ9JOQYo2A6PqxZgTXcLktWOWK
         d7hg==
X-Forwarded-Encrypted: i=1; AFNElJ+ecLBD11wX/BsfxAzLWWwpQUZoXfSB+Jp8CKT1GM67unjv2AfVpKeD3QJW0rIxXi1O8GjLlhxj5F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEqBZ/qQFXyI1ZArac36Jd4ED7gvc8sB/8mVB+Uwc+mGC1LvtS
	+hZMXvq75EJh3q+wFrKeVwr781ntJK94cF3HapnzrS5/H1WABr3BwTFxGJ+Zl9Nx2Q==
X-Gm-Gg: Acq92OFWSM6IiMP/ujoHkhhFh/UIVRn4aBKRufx6e7GYmaWmdabA8h/n7cZbIa+P6K2
	bNemIqpN/HoIwVPylK/iIQNZRtkLZRLvP3ry8BYeTGbqlqKTI5Fm+UaLMsxXAXr8lx0hBtVfGXQ
	c8mObSpZdXUr0G1W6KwvGBxwIOBigSS0ujfPGIknwE8iynNF/wKMvzxkbqGRBLePsGwlPOfvstp
	Y9290idSM0F2H1hxvdacm/O4leODCp9fh/bPnvN0gEmPwCNnyO5qx/v//Dbq0oeUqoKz1h7LIPz
	hsfppwPSXYznqWkis2ffqhLQZu4x3/wt+x1179ag5WvTPxEWFYWe8ep3TJl2fVNFjlAIyKJhmik
	Isnv5qp87svthrhTYDKyz/9xCs9VnTKsCsVX6/MVSHtfIlBfvK55goKRd1rOk8FtSsQ0p3ra7Am
	vZMqM8At7RoNG1+DqF7E6loJ8MvRnshtlLs7UVnkD066aTAZKHYl30tkiUvVMdvAsmKQox
X-Received: by 2002:a05:620a:4506:b0:90d:3af3:2a62 with SMTP id af79cd13be357-90f8a827302mr710313785a.46.1778697382848;
        Wed, 13 May 2026 11:36:22 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83bbf5sm31346585a.28.2026.05.13.11.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:20 -0700 (PDT)
Date: Wed, 13 May 2026 14:36:20 -0400
Message-ID: <e115b813def48703bcbcec42bfa54c51@paul-moore.com>
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
Subject: Re: [PATCH v7 8/10] hornet: Add a light skeleton data extractor  scripts
References: <20260507191416.2984054-9-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-9-bboscaccy@linux.microsoft.com>

On May  7, 2026 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:
> 
> These script eases light skeleton development against Hornet by
> generating a data payloads which can be used for signing a light
> skeleton binary using gen_sig.
> 
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> ---
>  scripts/hornet/extract-insn.sh | 27 +++++++++++++++++++++++++++
>  scripts/hornet/extract-map.sh  | 27 +++++++++++++++++++++++++++
>  scripts/hornet/extract-skel.sh | 27 +++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100755 scripts/hornet/extract-insn.sh
>  create mode 100755 scripts/hornet/extract-map.sh
>  create mode 100755 scripts/hornet/extract-skel.sh

Merged into lsm/dev, thanks.

--
paul-moore.com
