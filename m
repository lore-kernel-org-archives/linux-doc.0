Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792530097;
	b=o/q3PmLlsOurXDO5zSp3lMlhG/H0PrOZSWrjfvrhagNWMvEnY8mgNvxqaSxwetnMGvPO
	 yMPeReMUtkivHKh67JKRCDiIwZ8Z+06CEIhUJiNses8wGnXK+EB6PLz3AGiRyVLuKqHdy
	 f54Db83DwxvF4dxgbLn90sOruYcPrnnpAzn0wahmwc0QhKNb6f1vpj6HRT6ss3aUCICRD
	 +00qyRYeKEmiSIqDszZtTLSxVC+pYRPEyxmFyv6hhFFpIo5z36iPVM4aZCdwhl90t4s5H
	 O+U3a21uJKhrmyR/+8x0I5NRXUKNJQZ2s2lVscbzL5w7SLDsAmsbBH6yVjZHOgNJvmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/xBaGAH+wloa6ldcCrprHr8uQD4Nwpjw3N6ZX2Y8dtk=;
	b=PyEdxH5J2yOmgDbtz29+o2Jq3ER2wy9BNTYIncrOzZx/glA5Mp4yP9+dcM4jIIhYuBuM
	 pOtorsKYT1Hpg3YlPFxTTc+29L8ou/VdQeuFM0/92wBqXaPZfxMfTGFf7hr7g+yhK/c96
	 OK9/7JMQUhqCbGz4oiMxc3jnI2UMgUEcDdcC6rHl87vdY5WD2TsC6s69/TtASLriV3x1u
	 r8agp+SBPMpwKGk96ABAFCNIpbxDaVyQx5eW68EX/1Bnq9GFvkQtaDWo19D3b2KNAD496
	 NCtSm72IvB/xRo+7m8M2hqwcN/z1UDFsKPWRzSx1tUnF17LsrtDOL//ocYIYEwDn/9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=dIkYvQVQ;
	arc=fail smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35758606A319
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 21:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35758606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=dIkYvQVQ
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1381899e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792530096; cv=none;
        d=google.com; s=arc-20260327;
        b=nBULBcnKBvRJCdzhwdoCoBndgDQqz69CbCkNkc7CsQSL8/gUJYs5VVr/2iAutShMYP
         0rxFQzxvnq3STYNbtCruhNZiJ4Ny6bGFAikUG58fNPUdxqwpI9WMpJFovUrKX9Ikd8jN
         rppcjjAWvJ7IFe+LZ5WA8aPAYTJFSfsrGHR1lHumXTr76sJF4cOXNGjThwWuyhVyejwI
         bXScg9i7F/W2XFf+cgz3g73oKjXs9aeHRvBBCEo52Gn6OnXsdUSWA+t7JMxNkc3wrgUX
         4d+cE53kxAriCmwn5rArsA8b16044Oa8VrO5ce4Pc6CgEysndVw3FZ8xSsvj9lZjMV04
         VOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/xBaGAH+wloa6ldcCrprHr8uQD4Nwpjw3N6ZX2Y8dtk=;
        fh=luJkgvev5wpSqLSftbpYVonmL1eywC+E7mPM4XNEaxE=;
        b=sXtOuqBzN6DMimI4tUpNvGKfgT0oA2XW4OS9ENZHMvtj+GAMpbo/4CJee59WFB9Hpq
         OO6RcNeGZ31yr43osFX/mXvp1jMYDibSaClnbOLqVlOZRJ7O/MFYwMxh8EvmHGzRRGR2
         z8qnllk2YuI0gc/lIvfsrFk5mY8RB6QQDgFEYpZph5S5aDW60axSeUOXUwHK7OJ+7kuv
         90AHoyqJhNFTgRBxuGw3XvD4TWWQ/YswQ9FL7jwWi8zO5Y2aCyI7adgxqT/aj9ZH/e1k
         +7hAcW6k33HSaFqZPzGZC7vTt/szGpV2IcW+YsEDe2kVjite/ufKNKmyDQGfpmCJ0xxf
         hPyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1792530096; x=1793134896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xBaGAH+wloa6ldcCrprHr8uQD4Nwpjw3N6ZX2Y8dtk=;
        b=dIkYvQVQcaFWJDZv3YQz3cEBAluMc9VDTsC/iQkb5G5YSs91e34ge1FVCr5h1a+hSK
         H6L5I09Q0ZR1XrzHoQ2lrKIz2MyjQc5TQiwWZEVx0kk3ueqhNSAyRa9W12zNpDbd0wUQ
         808jd2jAVnTS/fijIbovwXhFukp0GzZughleAhHoYoJhtAGYMc3yMMM7VkYPG1sefKmU
         XBMgDnPHph7MPLhlFMwb7pgy6cvv0atzitWCk8qy30vjPyTaxyF1r7eyTSghJ2dUQY6+
         PlYXkAEGBne3uJgks6wYM2zDya/6GFAMvFQtA91u17yX/KcOLXSsrfmRn5fSFtyW4eOX
         gXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530096; x=1793134896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xBaGAH+wloa6ldcCrprHr8uQD4Nwpjw3N6ZX2Y8dtk=;
        b=pRGY7c1f+dcpzX0FTvws4mpUsbuuYC0CwF1g9gUqHPBSVE3jIT0g4r3ezMMrgrdrPb
         8MvDNgXP2ioYEKcHMWplTYB6Asmw1ykiaNdFfRXlBP1ARQl1djaMYGHpCdr99BMb2IR4
         wyITwfsTfOr7UOaZ/PFWh/iEFsv8mG0IhLihcaaR1iJU3/Y8ERJIFyE+kZa2LN4Eeg0l
         6lJNSh+Cqx3P9V52iZBY0Dn9QM4eZYxdVh5XTe22breZuo34Q6aapL5eWlnpaFJz4kJg
         UbbVOVh17QPMzA/0lKuzHqUoq1tFGfo7jmTcy7lVUTDAyf41dzUNzPysZ0RmvxH9OsDq
         9f3g==
X-Forwarded-Encrypted: i=1; AKwUvBxXcJd6XM0IQkgYgEbtntiD0EBulMjZdZY7P/PMpKPm3KFVoFaamwbuyZP+qWGcE422cTAkV20UY64=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+kLTaYpVlXXMpf4ZltL/Ds+AQ+yJbT/WOILx/VZzbb44AsPps
	xnRJCOuDX4eM561qL3we1OQKwaF/3WpEVEKE/cKFgzeQMVGMztg7C5eCYBNJwWVE4KvhVLGB6AQ
	tn6Mc7hxn2MmR9bsAbB8GsgTAb2aGAuPed+d6WotwNw==
X-Gm-Gg: AYBFou31xlQm+6we/6JjJQj21iOXKWbRuvtHQqAxb1n8ZGF1fN9TF/+gAf2FD6Rvccf
	4mND6XdpiYzd4Or8gzCCHD0uH3NXMSzRoPdxyZkDoovaFkzwwXWXoFO3f51I8EajMloavc8jjFt
	MwhvcX/xvmyRQlCrWkSDb0P0TvBo7Z2e0TyCtGEiXGtjaBBXDBixc08JRwBtyudX+xuEEbAzhV/
	K0ASQuGwcdomR+MpZ9/84vdix3a6spAt8DuqFX2mQ3kpYMkNqoTC0zh4a+8hNYcwvqfTc/yJiqh
	vrRZAZ/rTocKthXh9IUKGtrUVQtgIKo7OsCLIM8k0HBhc5XLPhTdhOGtVGzyIdTJfyfL8tqr/fY
	MbuUkGcOFd8H8/QMwpIkBYb4GXoE+SYeGoVsZkPsRt4CZ5+5jiCrNRRPfB6Iw7s0wZaXPakae3u
	kpXiAfQaH9L4yLk1O9GjrcE+1WnKKD/QHmyl3qo22r
X-Received: by 2002:a05:6102:418a:b0:7c1:b55d:373c with SMTP id
 ada2fe7eead31-7cc927a4610mr114615137.31.1792530095910; Tue, 20 Oct 2026
 14:01:35 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013202647.2206263-1-rjethwani@purestorage.com> <20261020133601.2081ab1f@kernel.org>
In-Reply-To: <20261020133601.2081ab1f@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Tue, 20 Oct 2026 14:01:23 -0700
X-Gm-Features: AclHuK_QigUGhmprn1ml3zVfD0rGYZgdiljtuQlcsVXkC70e1X79ePdfVRhuVMo
Message-ID: <CAKaoeS2WHQ6QH5XJ+T0RLuxVDJAOtzdfVz0V6gSoZ7n5GJkFdA@mail.gmail.com>
Subject: Re: [PATCH] tls: keep TX and RX hardware offload on the same device
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:36=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 13 Oct 2026 14:26:47 -0600 Rishikesh Jethwani wrote:
> > +            rcu_dereference_protected(ctx->netdev,
> > +                                      lockdep_is_held(&device_offload_=
lock)) =3D=3D netdev;
>
> Too ugly, add temp variable, pls

Thanks, I'll use a ctx_netdev temporary and send v2.
