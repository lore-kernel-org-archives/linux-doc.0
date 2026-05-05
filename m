Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AA630DECE
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004293; cv=pass; b=KtuP9WnQ+PpG63eIW7roT6jIroPPqXrlRMcWgFyNDwOMUGCtTFF1qnfpniOv5nwm6xVJh1aWEnzCB7ayeeHf9HCYYeie0WWiKJm42U4HFLpIriHYVjTqEoZ5w7CizV6tMNNGWpf9S7K0UFmlbT0R8jH3oDvVoY2wgK0C9LB17EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004293; c=relaxed/simple;
	bh=HPLcX7NBYLHglzd+wosAPjjdOESwQWmMd66407k9fuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hg29PxQwJv5V2k9U7RAXKZ7GA60sVdsT2aL/GCOzK0NjrOLdnCOrTY6mL6g6ogpeuQJdXSOS6n/pdpWTpH8NB8SZ5sB1qDVJmKyIUZPAgdLsO40cFe1uCg9z4b8JjDBSnM2TdfMt0MWVHLf9oT883Zz1knENFPpb+eW4SEHXenE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctUIpLKT; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctUIpLKT"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12dc1c0b724so520804c88.1
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 11:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778004291; cv=none;
        d=google.com; s=arc-20240605;
        b=dV+gr7b1nMSKWz635522I2gI/tP+nJqLtaG/C04tzSDBgtyctbuO1UpIDtA28x9ynC
         2vJ7FZcobNoQFA6+b09341WL52f5CaVkNVfVoYzykh6yZlwaSmdOSSHZybsOk1VPAyqn
         z9IWJkO9Bt4vPES0arHyBRvCMVDXxmtbCvj/IvIw0o7YQys/TvGes4Fwh8LtsQhpXbVt
         veFOvmpSlpd19VvD3N76B6z8YwQ2VePVGO6MANjr+nhMCvPQPqdqQz+MbFlaKKCUg464
         0GotZaaL1Z7A+DRZFZbOukBmAzKfnY5iqcV9HKdzvhTR2NyNemuw7pM77GYU6IjCDgvW
         OgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HPLcX7NBYLHglzd+wosAPjjdOESwQWmMd66407k9fuU=;
        fh=iY44gQdrd0L5WNoTfj4IAwSoFXG9eX6+PCs8GzMqBC0=;
        b=VkOLo2fCLpYSf0+yY1eFvPqXFQbshStsH5H/wZTEfF3OPd2ukzohzIxzCUrKQe3kOR
         8ah48CT0KRKFy9yMOXyA4KJQJP8ynYWzmfcVrSARVjRCyQwCxnJuDwU7+F3kmBXJ1Gss
         4R9B7fNNLBSgaQ8PAE9QM8C1+9xS739QFYJ7X61hOS2xk0AoEHw45QxkMg06o/uUKxP+
         4yJtlvOO7kuIeUZS+6DIaPwZMUrf5H+f/UBRLSxRaQJOPQT1zobbvmrMNNWKGTMmETaB
         itm4n/bZkMopnOg/K8GdSJk9ATx8/SS50liNeY7uhZSg1j1nqR2HYzZxgkZ47HJg1aTN
         SJNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778004291; x=1778609091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPLcX7NBYLHglzd+wosAPjjdOESwQWmMd66407k9fuU=;
        b=ctUIpLKTYCVhMe8BmZ/Ec5mdKADBJkhx4zKKnCoCvmizLNe+sGr28h955x0pERI9j9
         CFa4oTHv6rNUs2ZdGUXMlNREX+v7Q7Vv9JzjHAtSAG1A8RACkg5mRJApDVaeHfwGbfgE
         ouD+4oelymQ79kOef2iRIZAVBHOY+AhTvtTwkveqgS+x9HFPP1Uw0HNgmcbshvKDjgtK
         Nx0MeY97G8iPE4SqMXGOwetfkN1HCCzmkIoTUeQcpZp0YAKFOGsnajm96HZqZ9EgHE6q
         6v5ufdWkNa181unF36F95ihLQB9c+hEI//kFxj1JtlXv1erXPK+e2/Nnwm1iMjSba/zp
         KoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004291; x=1778609091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HPLcX7NBYLHglzd+wosAPjjdOESwQWmMd66407k9fuU=;
        b=ODxPW2aHRpsNdH5wBq24ZyoLLMtiEAus6mBgPzmDratgrBLQOZLHS9ptK8QiBEmLws
         Ek04O4ZAuaF0XIrNEbtb1RJVEZuIwq1hO8BbagpRz15GnFgLPFeQR9/9epoCwX2Kjimj
         dJVLbNnYEK9plgU/mQ8eVIrlBnDexcxdmX37wKpnZoO/HdTR4Ac3azgjFkcJbbPeLdw6
         nstSK+Rd99WA7X7679SQYxWQuyTYN0ZcWC55Is/cqcwKGAOe8t+7hfiaq2kj049X3LDQ
         SN82M4XH4DXXSwFTQWtKdboxS/tY1ErivuVtyCQZSUT+wTqpcSWXNSezcmI66jVwIcrM
         FkOg==
X-Forwarded-Encrypted: i=1; AFNElJ+WgsYNcxR1zkBXZ0UYcxJfMMHFgqMEwfDLalv2Ng0kJdyw0kUAy4f7PtV3IPzFQJi1LifTyp9PFTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fG4SIiDYGjhkVB7wityGCh5kdK10EtyvkyE0lT7qygX8hqYY
	4RuMbPgx4c3Fm8Ec9wNRz+BkOAhAa1I0FuGBtkMHaB6K5NK7RSLzHayyricX6RvCX0s+e80cnxF
	s+kdCo6PFUN89Db6bnzVh4kC8NtUyWGg=
X-Gm-Gg: AeBDieshMwW0DW53lTnoMJIIiZq8PVk575M7N1oQMi5d9TOPPzaZYCaTfOx7UQYwO+r
	VBPGjjDoZkCjuAj3sxbuY7kfWUGJkM46tmdpGO2ORzlqQIWm4Z9F+msK6hCApOI+B8MMtMjX6iR
	S9v9l4d/pR5xsiDE8t0ZVOF8Fq/VsAp+Ee5XMtkwYITqt0L9w6+j82ua9O2qYSqeIW5sN8Mb8dn
	qTy4+18BXo6x+75rD4ROgWFI3egXjOZNwDxLj+74yydU5NeAZ5NqohEA8zvQlHu3BhE/DLfl7ID
	T1QXSc/p/+poHt+JWUDGTKuN7UXxJK6eBwRjy0ssvdt+dXgqBotNIrrFIuky9kFoHHlT5XlrhZH
	nRvzltogN7DtMClgMHXj8RZgZ+fukuqWk3g==
X-Received: by 2002:a05:7300:3b08:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-2f54c37e2eamr60720eec.6.1778004290801; Tue, 05 May 2026
 11:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
 <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
 <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net>
In-Reply-To: <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 20:04:38 +0200
X-Gm-Features: AVHnY4IIS_qym11pAKvI_P0NhOVs4Km4RvGpgY89imy3B_jM1rRJ3u4fzshUmYs
Message-ID: <CANiq72nshUgJe=DRvSu_vRNoO6UW47fz+4xfqXCCgFkS6+hvXg@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init maintainer's
 profile entry
To: Gary Guo <gary@garyguo.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 3:49=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This file is part of the bidirectional source sync.
>
> I think this file is still meaningful in its present location even if not
> rendered, so people touching the code would be able to see it and be awar=
e. The
> presence of file is more visible than a P entry in the MAINTAINERS file.
>
> That said, if Miguel and/or Benno think it's fine to not have this file, =
I'm
> also okay with it being removed.

Yeah, I think it is fine to keep it, and it also has the advantage of
being always available.

(If we are keeping the parser change, then I am not sure we should
even change this, but it is not a big deal -- I wrote a comment in the
other patch about this).

Cheers,
Miguel
