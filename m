Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC430DD2F
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 06:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997945; cv=pass; b=Ddf95BrI6KvQHAv5u7A9Y4RlPq8rQVob+nc/IrqDr2ESReMtN1d+3Ih0bWThEqFL+Gr6IcTjqhMe/3aoESHsQmQR3nszXcLwftt+gT2fk8eg7LcbnJmg0s0jJU1P83DxyD7Z+oWGLDSGojAuMI0N9AuOsuyZJjuknZrTevP0Gvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997945; c=relaxed/simple;
	bh=NIfOp3H+fBf634aBcEEfMrRh5iS6XP6r1lQpzxgi98U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPjWOFUJfgzXXffE3yxmzN0/kg5FFMVCQT7uqigMTOTtFZtxBV3cf9ohwpX3Eajkx9tIJV9mAc221jr0wyDL/LaTxqOwrvmYVjyz0NQsYfIzIyM4ZQsRPrH7kmrnt/XkOi3G2g4E1u3EVSFzDgjkHJy7m8qNZoL5hHbGXmXzpU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcuHCFnD; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcuHCFnD"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bda3b4318dso61444eec.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 23:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778997943; cv=none;
        d=google.com; s=arc-20240605;
        b=XwRkR8IdQAjGFgNbmrinqI8APIqMJSLdjEGfScwjiX7m2huM/GoprxwmyTHanjYV2r
         HLokdGcPxslSZ+NpcmCDP4OG+X9WX2fO5/FeX4DmSbtkE4wrqEnEIIxdWixJvyNqmyKr
         NCKeUML7AMXAqIFZcM82p9YWL18FIjJce/quJo5ppiVgwILqdDffdA69z/bnSsapFcAk
         cxcapLVwqgJ5YzQK8ipB3484x7eo9AkhfHJzVGFThpsCCOJkVz3dZototmA0AX0nrevd
         PzPkWKx89Jc5K0uQ8dp01KGFVCnRtZpI4Jm2q8OT2ouWFvfvECwxagPdKaoE9Rvx/ecc
         c3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        fh=+E7suSL3RLnUHf8gOOD4wzAcgRpJ/S14kkRkJY76XDs=;
        b=LIzv/Eblz9mBpTWUdKgqA/ffJK/xAZ72P7nrF5P4ce/XcOJO0OF+AnvfS/Xb6vrtzr
         ePdTsDRPkYBcbJJjblmjnxgsF1ImKmfZVLfAmFkDw4LFYE0BRnYkRxB2Pk59MvPVtDY+
         cenL2asLjrngeiCO7T7ojJCAHbyXHRS5xV2Ax4fvGQaez28dMGld5Q1eQ9lCoySoDn+u
         aaOxPbCyDdW3IFYDMwb+JdKDFCCf0IXwB5juAtH1KDfInTtu2IvV93Glk+MntwdxxBw9
         b+ngfYbLRpplcgmtz5lN2BjKhFFzIVpcLqmlWN+Ahstmeo1DDeIjm/k/9/XuPGJsjhOH
         3x5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778997943; x=1779602743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        b=LcuHCFnDo9fASZNRc/LD1I8mMIlLz6PMOPZBlUZHw2C90QqGa7XOfqxzxQtuRJ+ESR
         85+ojIWtywR0nIhzzb7F5C8pRHHKBSILK9GaJaSyitFlSBRJdcFpLtC4gP1wcs90dzWt
         ulsfNDqCkyVEXHWzI5PkFUBrTOFTPoKZ8lURsk3xXoDYr4+1A77sSvWzkYWPULSA9FNd
         sq7eyvJiJf7CXYDoEdjhIdQqBrCt+ERBaqUA2zS2wi0rlMZWB8QH6znjRlITNfib5EUV
         bOw81M0cnbZs0FDWurjLhFUvPEUMvLlfO8ftF0+maYHk7VJ+7QttOEpKMnsbbTpURq4c
         CQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997943; x=1779602743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        b=itd88nRgQ/xmqQm98Nynu7adM+ayatw3JeuSCnjHSVt+P8Z4L2EMerCZmpIxGF+3AJ
         KCbQKaap0iSN4x/1pleHsD35jldvk4/ol6aImzFqRO4Fl9W1hTh1Z0AKxIUJVVICZmry
         YitNRwb43d22VsObavHx2xQ+KfZAWDb5tSnoh74GEI5ZKwdb4OJ24gNc3KwHgXh0Rhnf
         hwd5TcUwT7SCvAi1y4BEkRhFzpuqT8Us/tHN7wFoXEauv7CPDbOlPS22asmGXRwW6Udg
         97fzJNzhFTOckoaUbFg3lUfW8M0LiK1ZGMjd6ZKjbKz2lSex1djO1cA+QbqMifxd1BIF
         mqog==
X-Forwarded-Encrypted: i=1; AFNElJ9OJ2NuiDs4nznC2coszTJ+Ty1eEy1t1yiyxH8uWLLe58aamaKWADhJP0Tl+XlFzv71OPxPg9wcW5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgpoGAEqLcboIdMou/yDpArg5EGCdcbI/O/7+OQqicZI6rflFB
	oCJJhD/z3vYfvdjAPRPPZs8ppMD2jbXp+HUsOuj5NDgoLf/10wCifUnF87y9hmDlRyHTnW3O3Fx
	9JUMBW5uYwlmGDFnBKKLe+Uff4Wvud1w=
X-Gm-Gg: Acq92OFotnevkilYQMdzd8jGLMYoB3NQKLNNTuxN1dms9xjOcEprTYOvMbgB4I3ASIK
	IE0Y0zpxeKoLnAhfJCrtYvzq0GlPujXttdiLXX7hX5+eDqbyhhltGtG9A+u6jyydLdUO4ze/4vs
	a1lchTr+bDQ0dThiOaRxcj9gFAxQfvIdUL5upAJ+FhS7PYdxo1t1xs4jf8T0+KDvxOyrfKZHw5C
	XdCaPJJBYG+a36TBuwKBC47CNVvimIJx7UUWcCLIDtmW8O7Zu4+N6zpSLRRO/y1JXHFvwGqo7Dg
	NI4j0Tr2yq8Keb7/f5nS+1jFfmeytghrpd9rW2EJ903SJ9GVbsKKz3bJJxfLXYKN3lfX8p6+rs9
	FD3uI0pfbsW5djpd/tnEgHp0=
X-Received: by 2002:a05:7300:ef82:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-303986d6062mr2073868eec.4.1778997943409; Sat, 16 May 2026
 23:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com> <20260516215354.449807-3-julianbraha@gmail.com>
In-Reply-To: <20260516215354.449807-3-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 08:05:30 +0200
X-Gm-Features: AVHnY4JDLNTOr7rmluha53m8xnMSfI_2zj_-n0FsyWKVI29ECinwLPYxnOOxaUw
Message-ID: <CANiq72=dKOhoLUoWRmzG9Kyv0jWY97Nx_O4rWV-UHjRtULz-jg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] Documentation: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 11:54=E2=80=AFPM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> +kconfirm's Minimum Supported Rust Version (MSRV) is v1.85.0, because
> +it uses Rust edition 2024, and this is the earliest supported version.

Note: this means it will be the first code within the kernel tree
using the new edition.

I think it is fine, since in general no one should be copying code
from here to kernel code or vice versa.

(For context for others: code in one edition can have different
behavior than in another edition, and thus it is risky to mix them up
by mistake).

> +In ``scripts/kconfirm/`` run the following to download the dependencies:=
:
> +
> +  cargo vendor

I am not sure how important this is for `scripts/` and/or `tools/`
(Kbuild may have a policy), but this should probably handle `O=3D`
builds.

In some cases, the source tree may even be read-only, i.e. we wouldn't
be able to create `target/` there.

Cheers,
Miguel
