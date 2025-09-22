Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4AD2F7AA1
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527681; cv=none; b=WwiFVoHbK4IGm/2ScWh5dWK8Uv8qoA0oMjmOuWwQThGmto0LyKisKUOTF3kZ+rxTBqbBfzs/wSGctZ30sq58cz70jdT5Tsaei2XHAPBFuSdgk9tcKjqbR1xJ/F9AIr5hC/5xb3Og9qK05UcBskDDVg8aFTpooYhs6PbfaMlDu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527681; c=relaxed/simple;
	bh=wHhXbBUv8sLtLk6ZtdozUkZSGPHqvYUTRhRTVOMPPw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liN/ePV5wjrvCHzCzD1ukmEKCsy7K8UYBxD4Wr0e8HrQ26y1nSZLARgAThVoIP6HzfBGyPnSxkP2goeCLnZH/Lv9zCG3uKw47Fiv7wC35bNZii93EVRacPn5WTgFsaMdmyzWre08TQ4vHylgxwlmaaJ9gfWBu/L72hge8U1dNes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B53g+eii; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B53g+eii"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445824dc27so43155695ad.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758527679; x=1759132479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHhXbBUv8sLtLk6ZtdozUkZSGPHqvYUTRhRTVOMPPw4=;
        b=B53g+eiiTb5GDiKWZd/72tvC2vLjAUOqGrQYYHn2hP6zqCOPWTErNP9eJU1q4+a/Qt
         nL2Vs9X5i9mVdn1Pyxy8caliAFbGYzbaF7JFqNAg1lNiOr3b5sq3uBRtzxY4DtbA2Nge
         lZPVjDf9YW9iKP6TBSRl3pKL4xYTUIju3wH9Pb7IAagjLzpGzB9R/deQZsblrDLnw4tZ
         48iOLBZlT6ZK+DwHPH8ZRpmUFCzPRzbAqu5ux2Cn6gw6LAUdDKHFSXtE/h3lkJosoJwr
         LkRD09lFr9kXwu453ADEQaTiKiuozO6aJpudEqSfRiUnSk1qUAxKi8t2ptYTix8/TUBx
         bpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758527679; x=1759132479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHhXbBUv8sLtLk6ZtdozUkZSGPHqvYUTRhRTVOMPPw4=;
        b=wwN4nXNib9OUoXcfFp8/bUjDZQzDn3cMAV6lVcFZfO7tGT6VYoZ1V7WsH6F/pngqxs
         R5/aqP4A11U5hkv6jqr0v0lSu56X6W7T3eMe1eofnDRe57sKgxWyxvWesRDVicBkecu2
         eg6eJNxwgefkT5YHkz6mB/2kn8KXbl5ydohlivSY6GpQ84K6d4BCdTEbZPKd+Mdk6zHq
         WO564/ofHOZXl+gksg8wAupO79A5L4i9vLjDCAHsOwwhnotLxEMOong6W6EeGxGQbBPH
         1hC+FEs1Ey4xsxfEe7AdwTOLL3cUZ+SQz1/kt0L3KZimFIbw4khVFxH+1dd6YT1hQdui
         81lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaRk9ueocyCtMIEcZC3HrSFzbSW8/INepoacfZ7flYyd97NSxoF1ouR1eVi2cKjRY3bkUoabHAKLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXysfyP8poAakToSW4m9+tDQ2vK0dzyuZPqPv0lB8ERLAxA3gC
	f7VlOt/YsIj78aybplujo5C6SLTXUMFJ8ddFQ48sY1XmpAb7RqHA/EXk
X-Gm-Gg: ASbGncva57jt2bp0xx+USdM5H35oM/O8lgzfDzy7uDl2iwY3aavq/72jzH4DOnwQuES
	TkmR8HODLghM12iTKmd7FSrI3pBHFVZVSPTL1YvuPyUeh9fYnU3tqzjuiLbkfE1sAYGk5OfWiei
	NnnzLcUruq7Sy17rd3H3/AT9CHh77wvW8XZUUutV3j5NCCAJOHSVfUHTBhsZlywlv+v6CpxrFfa
	XszYwmR2IXIFRN3pRTqIfM6oLlWRIPRiPDFgmtCUKKxcCOz6AL3v4/JIUdjVHecJfbgP6fE5XTl
	sGT0HSvbmTcuoFFwg/2/F1AqdrAc9AX2+v9zoUbP/e534Zdjc/rSmeZr0bk/zH+nJ7EUpwb6+Dv
	PQG8LTI5Ss4m59fJ1HDswfA==
X-Google-Smtp-Source: AGHT+IHz3wNSWldGNXV3xlynWhX7Cr9eYZtSb12u2x27WnJQYglboQKton+MwFy1y4rS6oR/rbqndg==
X-Received: by 2002:a17:903:3846:b0:267:c984:8d9f with SMTP id d9443c01a7336-269ba45919fmr182012075ad.24.1758527678869;
        Mon, 22 Sep 2025 00:54:38 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e2046788dsm71684115ad.72.2025.09.22.00.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:54:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D26144220596; Mon, 22 Sep 2025 14:54:30 +0700 (WIB)
Date: Mon, 22 Sep 2025 14:54:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux KVM <kvm@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH] KVM: x86: Fix hypercalls docs section number order
Message-ID: <aNEAtqQXyrXUPPLc@archie.me>
References: <20250909003952.10314-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Hw9PxwxK+FTyenQ"
Content-Disposition: inline
In-Reply-To: <20250909003952.10314-1-bagasdotme@gmail.com>


--6Hw9PxwxK+FTyenQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2025 at 07:39:52AM +0700, Bagas Sanjaya wrote:
> Commit 4180bf1b655a79 ("KVM: X86: Implement "send IPI" hypercall")
> documents KVM_HC_SEND_IPI hypercall, yet its section number duplicates
> KVM_HC_CLOCK_PAIRING one (which both are 6th). Fix the numbering order
> so that the former should be 7th.

Paolo, Sean, would you like to apply this patch on KVM tree or let Jon
handle it through docs-next?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--6Hw9PxwxK+FTyenQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNEAtgAKCRD2uYlJVVFO
o3wKAQCS3n6Xj/tW8RTpqqfFhRw/RaeX1a+0H1vnroXuIBgyAgD/d3RMhZPFm9JN
FhRV0MeuKVEwYkg2livKKUt+Jgs+lgY=
=b9qT
-----END PGP SIGNATURE-----

--6Hw9PxwxK+FTyenQ--
