Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD52367F5D
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106579; cv=pass; b=rXCmTrtI2ZfTcAac+rtmhDJeAFKE31aIro3OTPGQRP/Eji0YlKeA8T2aDUxfwMrIBRYK+Y4+MVldHZMrC/960BcVmT7kLZQ30XcuhaYiCjVkEwbTUWuEpL0/0TIwmaiPdPWpAKobb9zIF4sT9KZ54WZTjhfJaVVWBp854ivPpfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106579; c=relaxed/simple;
	bh=njt2Q5+qsm7uTVdDYefn6ijZItM+C+8Z6iUPhwx9Yz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Er6w2NI4/G4RDwDvN4eyKRN5I9pSnFrxllxf+AtEOjB7tzys8hjrn/ynt5Na8v1U538mxtx+kSxivgqXYuKTPGSPbYTdLS4XMAyJEkgltPJ6s4HBx1IEEIvry6vz8KSUIWG/i9tqrFu92ESfYYCeO76FzLhX153xnKD+5zs5cM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Cu3j/GWZ; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Cu3j/GWZ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso2224225a12.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 10:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769106566; cv=none;
        d=google.com; s=arc-20240605;
        b=Xah852pMiwQj5bwMFlSHnolFZPrtomP6lV2UZcuX8NIy7Lyp2kw37M67/eZDEdGFSl
         iOw1Ie1pr17vPA38U+SmfzSeldCMrn2cmkCqcEm0erBPbWV9i1+LSgGcU62DoL2G6XoQ
         5P0uPmQvirSHSOIEJ0OkowBTBxeRe80SlcRVi0oNeQh3toiI2FMjKFFZd3f6XQxCkoVF
         Gs8CvE1FJMmoezyO4MWL9yP6din3ZzU/BNEfS4MZeHn8bLIxFehcXZN/YMfB9WUBdfSE
         UHaBlKqjlvn7krWz/jr+/08ahQhBBUZ6B/FBIdlOnPbn8HvWXw1pgEY6YCuYNcYvPWDh
         vC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhM6KusIxk5pLuv1MBKQ22c+nR479iQtC12L+zVHy4k=;
        fh=FaBJFa1hNi/V23XKeYriRYmyGjN4upEoNkXkP0d17wk=;
        b=MZfrKgxd42nWN+YjH65N9cba+76ifx3Ykk3j3+JlPKkidR24Q/eaVZafkRlFB0k3BY
         oU6g/l/Zz60BDijdZqTKZ7Gu9wjb5qZoyGmGqQGEpfuQPwMJt8vRkb0iSSHUXN3cuiHC
         AHTOVtYcAWsa93fFutJS5/NmvebTGJU/4vIOnTphDuHgNDVBqkR/EdhahtMDX+0VBmrX
         L32G3FjgKG7uznFRj0nw2y4co5PaBbfNdrHqJQYXq0blAoRNWMsse18oVG3/nQTblzCJ
         ixGUlFHiTZQP8rBisXOZ3i8LnLMoHibUBkT5BmW2waiTX4pPU7kuFmJXAV//t6ux1OTg
         aDKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1769106566; x=1769711366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhM6KusIxk5pLuv1MBKQ22c+nR479iQtC12L+zVHy4k=;
        b=Cu3j/GWZdu2j4wvbEQnsoSLKC+eCX7Iyjat+7J0KakcfmLFMOIrUoUUiM9dKzo8LEh
         N0Avdj0c6n/zFpIExopltDOTQWK7O4QGQ8IHLaTbNnGNbybLosR73ZdkCHuasJp6kjDs
         EQizSxcPLO8euVqPCGCZK51tEykXvYE5Czy2b0FHgzWb5PLwDruU68Ba4DLToMmN6xbu
         yCyTB1UZQqVPpJxIG69rkctV/yIVtIIa4YZyFzlM3Yym2ZMU1oOgy/yAikxve3DiuKHz
         gtOLQ9PwwYNjMWVd6yc46T37o1uJV8068H9ruERkV/o85Jr4XnGMtuwE/5RLGrVkz1Lj
         odRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106566; x=1769711366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhM6KusIxk5pLuv1MBKQ22c+nR479iQtC12L+zVHy4k=;
        b=K6CYU+/6OFjR6d6LYZUpwGkplY5BsBnb3nrXvJ4a8nCpzuhsipF7p2fNrv2rs5buJI
         TEBAqGxRlq3+S+GssN1tnKngmgkQsWLqIimsg5E9f1F8c748VV1HQf/cGDjIhcX7tVqa
         pqMwtivzn+jd8gyXdpXH52gdF4EtKqt8BAS0uzeArNqId5RE1Y8Mv6edQDjh5J6xLx1i
         o6dVc0QhQ2OLXZRPIIwYAi4LVxIjwHc+QX+6xafxoPXOYZohEV1fgPoXklUUaHn/KgpM
         BIIywWDQE/g7v0zupzuFQI3LBGZCgATuh0/sW+/LrjFsgFruzrxmT2Y6NQZX7LcxMkVZ
         hDOA==
X-Forwarded-Encrypted: i=1; AJvYcCWwnTq4U31/kGe87rA08pyMKkShibrYPf6tKXY4wMOUGk8oJBPcdz70t4RkguNo+2lkv0SM6uHZ2XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIRcHEiKUcVZ9DLUfU233u6lU1E5SBAnFRJ0Ps1QyICPPhmib5
	AGeJHcLufn8klEyIMgUVl63rLtPBECWdshSHE5C0Ru+AVRMkkY8VwAdeQGwPxLSANYipQDhzNmv
	pk8E2nvE51yQNf+dr5p4KxIENuP1q/t/Nodq7egKOdQ==
X-Gm-Gg: AZuq6aKz7Z1P74gquu4qkuuWsDe1UWdfqCwTRJJd9vMXenIjaTXWi5Im0pytTwDRJ7Y
	aPwZHP4vHnKvCx9V+V1sq4lZb1xL9kn7xmmZYl6VMh9nDlPuF+fTz2VLc1KEFmc35SebYTh6DxU
	yIW8Kp729Kh4mhop/hNk4HEIUeIRfJv/zEDPKMIDdkHAixg0CzS2ZONvay0VTRJtkrG3CfFapJK
	TAzFaYG5ag6NZnUnRSpfmQ4UhNYX7Mw9RmDAXJVLibFkgnvRT78SkcULgBjmWkkgGz4AxKVXYMR
	xTDFGKZ5xZy8tZzwwkQCwP4+qp504UlYHZO8v0GWCA71Nh0=
X-Received: by 2002:a05:6402:268d:b0:658:31e0:4ab5 with SMTP id
 4fb4d7f45d1cf-658487626dcmr360840a12.11.1769106566431; Thu, 22 Jan 2026
 10:29:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105165839.285270-1-rppt@kernel.org> <20260105165839.285270-3-rppt@kernel.org>
In-Reply-To: <20260105165839.285270-3-rppt@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Jan 2026 13:28:50 -0500
X-Gm-Features: AZwV_QiNfRhOr3LvFRxRYZiugzOXBGGS10OWpm02Kx5rrzXcYiqpJE34NwK_FC8
Message-ID: <CA+CK2bAuY0rKenkEbaAfnwYd8q=ER=U38TGga_8CkqZze=9Yjg@mail.gmail.com>
Subject: Re: [PATCH 2/6] kho/abi: memfd: make generated documentation more coherent
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Jason Miu <jasonmiu@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:58=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> memfd preservation ABI description starts with "This header defines"
> which is fine in the header but reads weird in the generated html
> documentation.
>
> Update it to make the generated documentation coherent.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/linux/kho/abi/memfd.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.=
h
> index da7d063474a1..c211c31334a3 100644
> --- a/include/linux/kho/abi/memfd.h
> +++ b/include/linux/kho/abi/memfd.h
> @@ -17,8 +17,8 @@
>  /**
>   * DOC: memfd Live Update ABI
>   *
> - * This header defines the ABI for preserving the state of a memfd acros=
s a
> - * kexec reboot using the LUO.
> + * memfd uses the ABI defined below for preserving its state across a ke=
xec
> + * reboot using the LUO.
>   *
>   * The state is serialized into a packed structure `struct memfd_luo_ser=
`
>   * which is handed over to the next kernel via the KHO mechanism.
> --
> 2.51.0
>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
