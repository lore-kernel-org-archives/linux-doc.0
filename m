Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAB35957
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763072065; cv=none; b=dYtjA3GwH+iqah5D9Q0mIM1BdzbDsDQqTHH0Olf7hw47E23JhxRlCVX0WYuzbTmFRQslWrTrbAmh2/c2Qmn7TvlCQjWQbLwjnwSy6HeVvu0OoHZMItFYeMrV0yHLRGK0ZkfDp2nSw3XFrVFCRo6X5aQpT5lHjsJSEhsm8NRjXJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763072065; c=relaxed/simple;
	bh=vg2n9jgyf6Un8yroS0eZ9RJEclmxHEAIxafM2FtYloU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VFaLUVlRO++jxPx38MuagzGuPWPbEQPsCE5ByUGNVGmD9Q2/3yffX9kS5LdayKaQxe1VBjf3wua6qJFfILazjOZeDi10snM2rbL7jLAIqZ8JhglThrmMYvX8GbwMaSgyxm8dzL7jjAsxopE64Zr+yTba1/ORePjDgNKjQY6YJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q6Ilp+n7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q6Ilp+n7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477741542bcso18995e9.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 14:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763072060; x=1763676860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7JRornaiplk0uZKMqz9STwhUMyLeMRJwxelXDphyMs=;
        b=q6Ilp+n7pTN4+s4aQsfVwd8VdZlJEgIq9zdYAR/33q19ER0geRYo1QEysrFMwV2E3l
         pXWZBeQxzsFBvjBEyAoWSqnJcCpWaA1WiOwjXHZgAxuLQfeSKWo3wy94l5EfwuOjQ0DR
         C0EnayLvOwdjaCa7dJeaR743KyE4+C+scFCHI+NDi2azRKiJcp1JfhDPaDk/coIb3fAa
         fEERTY6L9K253ca9ik2xF0Zxx2SZpjGWvq6wmDzVXj7kV7Vid2VPyfuPHgDbyYHvNOM3
         YyYriFbnqgeb0ZFOhN7rYO8GMMACLXRFkX2fO6hsSD/6lYR4PKJzcIRH88qHDTxWTwPQ
         U1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763072060; x=1763676860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f7JRornaiplk0uZKMqz9STwhUMyLeMRJwxelXDphyMs=;
        b=fhDPNn818LD+IL9QMXEAaOiUKg4MH3yIN76HKgj1hPcYE0RqiehYWIMfW2Zt7URy9t
         UY5oY02I6F3Jxz98oNWdHJXOb+FR/MbJ/871t6kbl3sA3R7F5jYz6XTWNI/TIJ7fHlzV
         iBKwbaFfTr/wNzF7oBrc8StNx/XZyiVmoMTd86/1yeSM64b1yjay5rW/hs0Di2KNdEWw
         4BTaAoghDEpQBeBCq1HZ8yf0oryUPSsA1LgxGV3DhKnoOZzjDLFYkfiBBsMURoWOoc/e
         3p9MaYVzhQqxPJqmvb+0sp279cWopDgQt2WmaBVvpzrtIug+xhV9BPWpWac/VGyxWKFy
         r29g==
X-Forwarded-Encrypted: i=1; AJvYcCXMRgE0FvxblPgNWmLkkkeSEZe2LRxNqjlfsaFMdDTFaHHQ+qLN2CBM5zL9Sy9XRujjjIIxWOe78TI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8d4BBVk4/x6cvR6kPPlz2X3/ydjfQu1x8Y6Q6tTjv3OQlCZuh
	dqxsXhy0qNz0vtzNbfaovH652LsMAfNy2sXvqAodfSaLc1H9wpcH3fVFZTrVhG7jEqcE+j3kE4R
	QYbL3njFpFTwPEuWwuIF9KYwBrZvN/a+QqAfMNk97
X-Gm-Gg: ASbGnctGzMx39taOFw0dwemkETu2/siEdlLORctGonq/dcJXhY+Gtc+Vf+u52QGMH3R
	LRABDbt3lSXHBJmxcpb+wMMzLLf6dJEl0n1lWQxzY2T9zjvu96ApHpUqHzYT3iMX0sOEjn6IAVs
	PCXIXZtfeR5cIpqruz51ZNPDT1fvRb/rg0/sWfHHzo/07GODuzyD1nE4EM/i95cFuV/zmyJ7+sg
	6cihgj7J9eTgBjyLNWeLlZBy7PY6H4Af2wK2qSbuLp2yFPPbOeQyJBJ0S58zU37/zRjuwVjUTeB
	M8Cfqdx/7nhEdvS4b9TzfpUxsw==
X-Google-Smtp-Source: AGHT+IH1dTN9h9lNDnRTlh4UyFd6aH1+EDMlfhkx9gNk7p2AjcKqv19bBUUeTsmBJjRKqPU2Xh2SmzFkyX1KkJheFqs=
X-Received: by 2002:a7b:cc99:0:b0:477:772e:9b76 with SMTP id
 5b1f17b1804b1-47790b11bbdmr102735e9.7.1763072060296; Thu, 13 Nov 2025
 14:14:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <176305834766.2137300.8747261213603076982.b4-ty@kernel.org>
In-Reply-To: <176305834766.2137300.8747261213603076982.b4-ty@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 13 Nov 2025 14:14:08 -0800
X-Gm-Features: AWmQ_bk6n8j-0ORtQ1jAf-pM3nvvAf6VB8V4V3Ju58iczpjKI42PYMXub9cNtfk
Message-ID: <CACw3F51cxSgd-=D46A6X6GptEZS8-JZ_MnB_yK_ZR1wktunYRA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
To: Oliver Upton <oupton@kernel.org>, oliver.upton@linux.dev
Cc: maz@kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com, vsethi@nvidia.com, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 1:06=E2=80=AFPM Oliver Upton <oupton@kernel.org> wr=
ote:
>
> On Mon, 13 Oct 2025 18:59:00 +0000, Jiaqi Yan wrote:
> > Problem
> > =3D=3D=3D=3D=3D=3D=3D
> >
> > When host APEI is unable to claim a synchronous external abort (SEA)
> > during guest abort, today KVM directly injects an asynchronous SError
> > into the VCPU then resumes it. The injected SError usually results in
> > unpleasant guest kernel panic.
> >
> > [...]
>
> I've gone ahead and done some cleanups, especially around documentation.
>
> Applied to next, thanks!

Many thanks, Oliver!

I assume I still need to send out v5 with typo fixed, comments
addressed, and your cleanups applied? If so, what specific tag/release
you want me to rebase v5 onto?

>
> [1/3] KVM: arm64: VM exit to userspace to handle SEA
>       https://git.kernel.org/kvmarm/kvmarm/c/ad9c62bd8946
> [2/3] KVM: selftests: Test for KVM_EXIT_ARM_SEA
>       https://git.kernel.org/kvmarm/kvmarm/c/feee9ef7ac16
> [3/3] Documentation: kvm: new UAPI for handling SEA
>       https://git.kernel.org/kvmarm/kvmarm/c/4debb5e8952e
>
> --
> Best,
> Oliver
