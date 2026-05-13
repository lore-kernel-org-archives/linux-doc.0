Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418D3A7F4A
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697365; cv=none; b=dHfILJdlUghYMJUP7DJUEWhLqx7abq7As3KqshFqKhlf0TmxaaWAPlypxicI/CqfquMfi7qvCZAHSWpPHI8u/cDvrU26vNBP523jXcSI796gsB4gBMC8vTjsRmKh7EdXcF/FUGTqc11KppLbDrCeEoki2o8BqjmUQMyQQcYYVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697365; c=relaxed/simple;
	bh=yqydc2BAvs/EEy/vMFDPydcYDh+gc6ICoo3g/wT4z8M=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Subject:
	 References:In-Reply-To; b=VO7JMUyGsdy7WNOzuKQJfYOidqUv3eHY1/SlJDR6NZMMZ9tGqX0z7zUHMvv1ShW23ZH35N1dsc8x3hLsoAdHr8XN9gwWsp269mrQL0IUT6cqWXV6GojXZKKWJ1BchtExJht/OpNW0KR2arFt4FP4Kwclk0cl7SPCIXR47Pfd6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Ef+MNUdg; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Ef+MNUdg"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50d87c138e1so68140561cf.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 11:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778697363; x=1779302163; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQ2lrl+/gKDcPyuGztAL7xFoyeibd4FccB/Ub7cgd0c=;
        b=Ef+MNUdg2cj68iOeUx6W6u5nft19c9Bx8d31j7AN3WybWxNHZBb6dan2SqkNlVXciP
         Rbh3XdOv6EcXFPhbjOXlFJQg4RASegCNS6fiX35hq4YDmPc9DD1j0t8dcKFrbcPPlwNV
         kVy83zVUPu8M9skQHx3H0MKHLsULiQ88MjIerFZQile5SP/YeSExIhjHindyS+CNmTuP
         lhXjJo17EHoJ0/2lx7J90ZH2pHXasPeLJyzy2X3qK3FjSF3JJsfo8i2N9EHVbE9VIsDT
         Jx4cZGLBAcVUmRjrZ+iqVRWmq2sDmlZAvdXVDhKeP/5/u8qp2+OQOIOUYSjHuIQr8GCR
         qmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697363; x=1779302163;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQ2lrl+/gKDcPyuGztAL7xFoyeibd4FccB/Ub7cgd0c=;
        b=EQskbppj7/IZu21WZWc7g0qj4GDBDXmH2XlHsx5Jh5L17Gc+DAVGBZQgvjo1yuWCHQ
         hEXrRqQ7ZSN3rZzoCKI9YoJrSFj+Q8RaTg/vMjiPuQAmDqxpCJLSu9z8uzvXhfuE/PTq
         KsFMBE+jBAXu4B+Tw04hH1UkQFZMjDvm/AAWFHRuYCiCUWmf+sKWXyaJJTY3bKkAUn5Y
         +HPEGtHeWjOz2LQmAbw9YWRQn/GoSuZks4Z9GBM4vR4ebYMSwVHdQtwUtqQQ6t3zKT9O
         2XDfJz0GoXSgRF4+sBRAoXVAD5rYudRz1iK8R2Y5/xE9DcaRafBbMc1NAlYqukGVkACo
         ztOA==
X-Forwarded-Encrypted: i=1; AFNElJ/cwxhbG1ue6QHth9BL7z5BoF14NuSiRQpXFEpZIGWogx1hcZ97GgsetZ4H6ILsd2Vle9ZbW5eGqmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm8rQU2krzaM+wLQDirOEInzkoZO0C5eRZdhu6XHP2ow7Oz9ht
	Qwxbafn6zDSaBCeijrmgLriCnwem0GCf/M1KUQ1a9GrN4Q93xUXDDceaKSYCq705Ww==
X-Gm-Gg: Acq92OFrWUZn5quPkCRnGP948wgkjYy70JfQ5jAzNbZg6mdGQDZ0ruXEf4L7Q7lJaY7
	DdHG85gX0Igb/wQ2/h/ZMR86EcgVrtgi/X2iOMXU3XBtTYcE3AHcjLiPtcZ/C+t4alZJZwoS7dH
	Cj3XhiqEZlpV4cTXBhzfWwQyNPvfgfJg/4au9lHrUbPYGZnT+Jj3+CvvFrTd33viXA7pEWQF3gz
	borkHFZPVlytEqYiM9oXOMoT++23+CqU/gSuMvNKXPerr9bxcIlzLzlyXAW42KtHfm7bX/p0ylA
	BBFFl4iHgXJ6z0NMxap9DkZ9U51VTlV0x9xzKiC/ZYMGoeyjDsXCg5XJ2ZQQAKeVbmxYme+TWZW
	eNWm8bHuRj/CUjL9SfM54BAGmK0IB2t0xzkCXcQp6ISOR6vjnXj0UBijjVqGHOs9fWHBQkzf4gS
	67CcM8kxRDTx4SuBNJqrtr9o2fpJJt/mqOO7HRTCfy6O9AV5oZTCWZNxFdp9zn7nM9Kt39
X-Received: by 2002:a05:622a:5:b0:509:965f:888f with SMTP id d75a77b69052e-5162f2a4b4dmr62133441cf.0.1778697362725;
        Wed, 13 May 2026 11:36:02 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e82579fsm151609761cf.24.2026.05.13.11.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:01 -0700 (PDT)
Date: Wed, 13 May 2026 14:36:01 -0400
Message-ID: <fed9fdbba52e91a15597b3eeb79c9d2c@paul-moore.com>
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
Subject: Re: [PATCH v7 1/10] crypto: pkcs7: add flag for validated trust on a  signed info block
References: <20260507191416.2984054-2-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-2-bboscaccy@linux.microsoft.com>

On May  7, 2026 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:
> 
> Allow consumers of struct pkcs7_message to tell if any of the sinfo
> fields has passed a trust validation.  Note that this does not happen
> in parsing, pkcs7_validate_trust() must be explicitly called or called
> via validate_pkcs7_trust().  Since the way to get this trusted pkcs7
> object is via verify_pkcs7_message_sig, export that so modules can use
> it.
> 
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> ---
>  certs/system_keyring.c                | 1 +
>  crypto/asymmetric_keys/pkcs7_parser.h | 1 +
>  crypto/asymmetric_keys/pkcs7_trust.c  | 1 +
>  3 files changed, 3 insertions(+)

Merged into lsm/dev, thanks.

--
paul-moore.com
