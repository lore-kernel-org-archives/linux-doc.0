Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9528F2F4A0C
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 18:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709169; cv=none; b=WegDVCZJlyRmAwZeiY6tofW0/edD4ngUjypmhwLriXjAO9fx2rwcPqfukOIIRJRDzb3B3WWd8OrTJ0rauxWoSfBy+NtbpINc5O6Z+ho0VArzPxpK3evc/ZBQMIYQlFHjn8O8Y7JJDRcwxEKmbyFtlrlVVUD0yXeRQaBna6vyj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709169; c=relaxed/simple;
	bh=n7Be+biVh0O8F8FvhkYQou6CywM8ch+inae9MbJjFs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYAaVL3vc/llnR7axRWtCTJpnhoLtaJTX12WBV59rm3FeB/ljlGTX7vObVd92EmmMt4yU/OQVyeAGw4pzNdZ7AiNBMYcVKj+zFVS+cStEUgS3brrxh81ygKMjVtj6LtwUU6ck5mMGa6Tei7VBxuPVpuM+51BimzBPKRKqMDdGho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mU0n2XBs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mU0n2XBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369FE1F000E9
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783709168;
	bh=n7Be+biVh0O8F8FvhkYQou6CywM8ch+inae9MbJjFs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mU0n2XBstRApFoWzAMKmK3OFVzi6juII8fVi4F4Gog1p1PJLb6zV0JnLFPR+toF/f
	 gPxFdZpBNyvfNdNQ//+bDN827JRtFxGpHxmNI7ZztATvKSR5/FU7wqPiMDhRhHgl+w
	 ZMz5SuvIF5WkH+HkBHnqGtOsFdsKb8NChG7Xwqq2aVVe809iQMDcqQKiFxhzGA0sH0
	 B09edrBUk6RrX2Y12BvSf/zJDRvd1A1dxySrXFVccb81zq/aS1M0WwaIuZ2HDp2tQ+
	 RNcdOm1m/FidcqUYU5LKa2VueCmFasjxab5st6V5WUJaBYeuuyVQwy1X6z2Karsec9
	 r1Vj8zlNT549A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aec139da7eso1401852e87.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 11:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rodl03GxO0qLL3v+ZgvJZgyv8NzjPtRQ8dZVh15uT1PamUs09DFF0WG1tVGqxxhhhuo/TSbSgh1qMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ybbNQqhh15jiVgGMO01TNh5xOTFCcFgbXaINepxUjk42cj/u
	Dp8K3nHygveKbPO71BYCRHMtG3BEby6Czl5c5k8TaC4jXQrzZoShvj3JBQ1hqve6XtqBVdLwGx5
	LUhom57JWW6lewAqnWNL/B1Km1hDn/90=
X-Received: by 2002:a05:6512:22d0:b0:5ae:ba93:abe with SMTP id
 2adb3069b0e04-5b01c55a3bdmr797550e87.30.1783709166994; Fri, 10 Jul 2026
 11:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705070212.1123-1-ceohunk@gmail.com>
In-Reply-To: <20260705070212.1123-1-ceohunk@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 20:45:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJ-r0LVA_hXQLH_o_XR5z0qaobgzJeK6wcrcQhyUG5JA@mail.gmail.com>
X-Gm-Features: AUfX_mxAooFVvuvsJQQHCc4fDGZN3viCrD3Ww90IbYgS98QigayAzHFLtLqIpzo
Message-ID: <CAD++jLkJ-r0LVA_hXQLH_o_XR5z0qaobgzJeK6wcrcQhyUG5JA@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: pin-control: fix spelling of below
To: Yuhong Cheng <ceohunk@gmail.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 9:02=E2=80=AFAM Yuhong Cheng <ceohunk@gmail.com> wro=
te:

> Fix the spelling of 'bellow' to 'below' in the PM API section.
>
> Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>

Patch applied.

Yours,
Linus Walleij
