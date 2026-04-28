Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F90325F99F
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377084; cv=pass; b=tsisHWW4gbVM6QHSFQZ3wVsrehVl+YLkWUI8v4LcFeAyQIsN2DX/9QKViOMYFp8/G27uJZZXnvrXQXA/0wrkmm+xjuhEPHKmM6Mdpu04u5rVaXWl/fRYW5bNsMiPaJFDL5rjamcc57qs2IDsz+8vOAFW2oRgAsqFAKq2hy2/Qlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377084; c=relaxed/simple;
	bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDSqZPPPO5LVqVc8OLdYGP6M1tWBkVGgIqNo+V5u2yKS1IFAEu/QAszT1DcgIx681+MhlP/P5pdNwKfICJ+HcjjUffPy1lyGHrxdbX8cO/vJmIyrCGWZxV29Qxi639Sf/atYXuTjEZ/wp7cdlDbIP510YJeKTRgcm/3NCcU5WO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBT1du2V; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBT1du2V"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d9b27e4aa3so685685eec.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 04:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777377083; cv=none;
        d=google.com; s=arc-20240605;
        b=T2G7YqwUQcOCRaa2kD5bryW7UdxmPR8vYTfM/IUjaKynqZfHlgqHGbnTDxFj9B1hsD
         5edN7bkmB0q9Eo3/gaOqj+cPE3PNNb/+jgzTlFRdokE+P2c9usaFlXblgOFwSASGAN7H
         voxUtXnaaQa3g8tFkd4oOhk6f3r8U6h7HEw/Y6eNMBmp/E6t1McBLpuG9uqu73m4DwVi
         1MMowaw9j5ESe1vVvbn+VKGEMr711/uSZGboC8QJTaN/lFx49vkeYyHwPJ04QuPFnYrB
         T0LVnZAkhWeSB2CnuvMU5BIrqakexcfZiiWk0vlYZU+VNqF/k5RjPKVGw9zuJU5BCzLI
         r6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        fh=O7vg175EBzSnGieH/ztdl2c7Ab0A8LxKQlcZQFm6Mf0=;
        b=jwGB55SBsqCiBfC9KNkUqYLKI3vcnIeI7LBvAe9Ss/tSRfkuazTqku24U3gSvqImbJ
         +2X6+wlD1SKclNOG3ROYAYGbWacZi+G7YbaxrYCuTwi1wizXx4H7XjRkvGva8pF6oWwE
         Ts0l1oDsyjnG+m4JE8Xi9j9gptkeuVzGwsgOKT26wkVpwfSdkTLk2mwhQWPr+BQm4t74
         T76sbewH820V7sAPK0SElH0Cp7vy0hSbTrAvMdz4k+CZ6LJChm3w5cJeiWN6iSk0OLp5
         tCU4HJHXXeFGhb9FU7I4hNfilXmK1KchwQgGS9enI4GmRZbY6toaW3zqsTaMQarXqObk
         BEeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777377082; x=1777981882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        b=MBT1du2VPcosM1uWhj1auYgkyZBDXtcU0q3uRn0UaVRgtYuscxwKeLCoMRLexjMkN6
         /3XXhiEfld2SOlTQg3zBI7r/78CVn9mYxSQblYhTP38x3LkmCgcjI99T0CnRp2uoo9Gj
         8oYh09qg3kHmE4MEM5kBsFKWhZFto10Tee1J0SUuc9pC+uklcWm5zIbz6ZWEe6Pq63je
         f4DCTr/GjO9KLv1ApbTLcMYEsE9D9qdpSgPMMoxVlx5QcWyR7segCXODQ3968dscbVuP
         GAXVOLLCPhGDhKDVvR/T2eyOkomBRM4uwFqOia2Osal+MdqiNi8jo1S8E81MqAhEhfwL
         2h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377082; x=1777981882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        b=kUysNG7bCB6usSy42Y6+xjfC7ydbBiZjauOATd1QZifV9rRFYy/K5PCfhjRHKq+lU1
         fuBQDWvRFz5vdPYt5Kpu8FOm96EFIAtgqPxqZbG75WBBh2zrMPI17PLi/urUcz+JaRsR
         JChrjW1Bzc01jBVFRk8aI//dfFAINYtvixEOCgeIS13aEIU6EzRxgnqUl1C35pZIhN8i
         DNus0cx1jhwqpZ1VpTbu3Qd2sP956dXA2nWwlkno4l0kc/+iOdbUZKC3VgvLHWROoWsg
         A0IRmQsd5xjxQEVD+wuxVYSvBktC5NgU67Rx1YUqFj7SbU37VaQRAs0cLCvMshHSVpUm
         ym4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9rNH0lP+uC8DkdFQ7cyMXT4pBRnRytwZ656YI9blLxIhXPyt38x958mrD/8m6k4Sy9DQ23LfX1VC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0jzjen0/Hke0TBoPriWomwMXFEPZaeXOXUgdeMbDrOiwA3up
	cCvLKjVxIb/LqfBqEy6BPWv9qTI1kbTHyJyjqdUA5Ujg9xkyINNT7AQg+h4AiwsgK1o+VdOWyGp
	41fn3oNwDghcjL8tlMeiHgaKL1Qe8CkQ6iAhZ
X-Gm-Gg: AeBDies9i5/W4cd1fyGJePrCjTMqEQ83Ulo1nAYhgs5xptlrW+Fz7+HSBrE6y0nXbBJ
	ZZTQkrqmenIU7VVqBkc58gYYaBDDxwwDgKK8GwqPNfSodIM9las/rk6N/Y5KKPcNaa3/YLh0Cav
	k3p8Nz3kC/JQnQnl6/aPtagB1QkOveqvChUS5e1wt8sh7gh9DkQY61HY7xLXcxXMTGGXFPjl8nX
	4abptkeoyq72FEDzaGVzZtSUGAlflulTSrCQTQ3SbUPxlRWEoO703J+GWTyMaocVND1c0OC+IvF
	SoLm68ChCkrSEtDsYxPyxmZNkQXU69op1T5OaBevCfPyJPQxRFHPk4ygRB8o8CvgW2u4ShCsJs8
	GaCFMC8kRtOrdapBfiop4B2m1k5o0IIGu+A==
X-Received: by 2002:a05:7301:3d10:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2ed09bdc0ccmr579752eec.5.1777377082557; Tue, 28 Apr 2026
 04:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com> <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
In-Reply-To: <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Apr 2026 13:51:09 +0200
X-Gm-Features: AVHnY4I93jEEHcqLYwjkfMluqxrTct8LvxfIDurB2CADW-KHDEb5dYbjSTfetIM
Message-ID: <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julian Braha <julianbraha@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 9:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> It would also be helpful to reduce the number of hard dependencies
> and ideally only rely on packages that are already shipping in common
> distros.
>
> From the dependency list, it appears that the majority of dependencies
> here are only indirectly pulled in by 'reqwest'. I guess is only
> required for dead-link checking, so maybe that part could be
> made optional?

+1, I had the same thoughts -- even if the fetching is done outside
`make`, it would be still be nice to reduce the dependencies. Even if
it just means calling into `curl` or similar.

Then I thought if the same would apply to `clap` etc., but then again,
we may want to write more tools like this in Rust in the future (we
already felt the pain in the past the pain of not having a e.g. JSON
parser), and whether we could have a more general solution for this,
including perhaps even a kernel.org registry (either as primary or
not) etc.

Cheers,
Miguel
