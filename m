Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54D3B52EB
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697389; cv=none; b=gu7TasQ4VS4FiN/JAhU0I/DSmAfrjVoCD/mLRJ4NEFQv3lpEHSyUZar/GhWk3cJUI5Im60XD8Pq739hTJJw+SR8krMCUrEvowfYfczcLMxT3Fuj30K2LqJXNpBMI4I+RMS/76t03T8CYLhbNWeyPLE4jumpE3qvEU/BANPeOF6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697389; c=relaxed/simple;
	bh=AwM9cJRmcVcStEw5TEKGWm73QdLaxIwl7c+W6VAlCCg=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Subject:
	 References:In-Reply-To; b=g/ZOtlrehw2/qSfYz6sUYajSdszSwxLPvtk2TIuOfkVQ9kXNjG+3OMK8vBNC9ii/sNz0q54AQXgMIDOUK/zuVxZVHiqxwEXgZDblA7waPW/AvSD66wdJbQesGa3DirzA9Kv8F9sETBAZ71PMpa/V4M48R9V7uZMQnmVaYvaWAI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cD9oDTfI; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cD9oDTfI"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-90fe17c157aso104451885a.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 11:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778697387; x=1779302187; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXBweUZx3jqIrVzTdHurGYke6t/WyOEmRQAf2KrWVaM=;
        b=cD9oDTfIYT1bfyD2JwneiXjHGdC7t9/bNzI4gN1HdbDcl7YcfCuWCZ5N5zKVTabveq
         hbequyQVPVigXhC1tEoouH1XapFTWsX4N7s9peUNA+JTSVxMJpm8b8jCNUSvyYuCfXqR
         RUIDWtMO9eCCOosCBxY8Gj3ec4sgvteQOKkp8DrRfP+O5ITWBdq3LDrKVt6LPBDifttH
         M6koMy1l17tS9cRwl6CXYxdAY8+7hmJC2AsrWV60HGEBU+gjxc2CV2sE5HeMO/ojwF4Q
         JHmKNfWsNYzqEWsSHF0zjFFTVnLvjfOvAo4fAMAL/+DxvCxtJ7ZkDPKIDMnQhO86o0z7
         9BBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697387; x=1779302187;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXBweUZx3jqIrVzTdHurGYke6t/WyOEmRQAf2KrWVaM=;
        b=lDbiXNbglf0TWNDOugXclWYXSHEn/rXtIZx5W85W/P/i/FEL2AsM2gUI+bDAZi/H2Q
         AM4Ldq6ltCAkvCJFZ2zVRTSw59Nv7H92DorqXLJl/Gn+25TwUtmAh9U20Cw8+Mxh3Wui
         Bpqa1MG6+alu+a8paZJhTFH9o+qUeuHlXQbiFOc6Gjm1EJk5OIx+srG3+Ua9sxIgafn2
         bcy2oF/VXIZBqHkMxgna/E7E88Pb3JeyDIg2uiOUcjwWd163+X2jTRdbxX8z9SEruM2q
         iDHbrONcZw9B0PZ09wgk/UhGyn8sJjVRwYzc53dFy55bkprvjq1ANcaPz1BVihKVNUVy
         YsCg==
X-Forwarded-Encrypted: i=1; AFNElJ+UtbMUVZg1gotikZ5b89z1/HZMDmR3rwgrSx+k5WkcvWvfy8qUFoOGtcfMQKawBhGomtmFhiJFQMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR3jgsH1g/l9MnXaxXAmteoaEIF8LDqJM33org5vfgffBgK9QL
	b9H9fKxLIhyNjJijsJZzxtfn2aMW6ywkcCUKEiqKPLummgrFNQc+ux3X+n+RwkiyKw==
X-Gm-Gg: Acq92OFxfrIRbAvRBOZ2XRwFYGoFyIx0yIoR4J2rpNE0I5/lCgLJHtkw3WEOeQeiWoG
	HT1H+u42VhJdbsWveDpcgAcVbBR1bEi5R0iyQpj5Ou+fD6pZgnux9uaUrnHQShxzHiToAfvmbv9
	OljFanpgaVxta/35myA85zTP6yrp/0wrRESsWlipKhqvnrMPkJKF5vqvjh0UmHzMAQJj2bZ6nx+
	rLWutGcPBVtd/yFN2bKBxbiAJuE5wNZzGeTa+QVD/oZjThHu0Dl3M4stIy7289t3qy8naVylNDv
	YMEqMC4zxZARwOfk5cPJgmkbhKoct13G7Ut1An2GabxTv7OPm0r/zSKTM2Mi7XC/2I7Eg80BO70
	E0k/RJCk7JgNIfOjeO1U1FpfmrBo6bNehx4mSU9riEi/NYVr/4LVu3RwHYLk5zImY1SYq1vKdIy
	p82PHZN4bNViyLzfId+RTG/YtmCfjMqX4uWRnfvVUWMVbPBGUAjrwRT185hJ4eNXCXpMVYNByJJ
	90Bfgs=
X-Received: by 2002:a05:620a:4403:b0:8da:e62d:888f with SMTP id af79cd13be357-90f8ad0a495mr680403485a.53.1778697386562;
        Wed, 13 May 2026 11:36:26 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83f926sm31771385a.30.2026.05.13.11.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:23 -0700 (PDT)
Date: Wed, 13 May 2026 14:36:23 -0400
Message-ID: <c27b6ff5e1f47b0240a92610c1aa4b88@paul-moore.com>
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
Subject: Re: [PATCH v7 9/10] selftests/hornet: Add a selftest for the Hornet  LSM
References: <20260507191416.2984054-10-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-10-bboscaccy@linux.microsoft.com>

On May  7, 2026 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:
> 
> This selftest contains a testcase that utilizes light skeleton eBPF
> loaders and exercises hornet's map validation.
> 
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> ---
>  tools/testing/selftests/Makefile             |  1 +
>  tools/testing/selftests/hornet/Makefile      | 63 ++++++++++++++++++++
>  tools/testing/selftests/hornet/loader.c      | 21 +++++++
>  tools/testing/selftests/hornet/trivial.bpf.c | 33 ++++++++++
>  4 files changed, 118 insertions(+)
>  create mode 100644 tools/testing/selftests/hornet/Makefile
>  create mode 100644 tools/testing/selftests/hornet/loader.c
>  create mode 100644 tools/testing/selftests/hornet/trivial.bpf.c

Merged into lsm/dev, thanks.

--
paul-moore.com
