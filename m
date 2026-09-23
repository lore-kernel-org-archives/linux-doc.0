Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60419568FAE
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177993; cv=pass; b=t9eZJ5dFHcYRP86h97D9hhJMIvDoqCJbLGEyuRT4H1G24qaqGR0A5/qNdteqWwGuM+MyBB55m6rJbmG6/AR7e6gdxRFUDuVF3h1HGk0Qqs4lFABr8yiF27gdXa4LqItJZ5iRSJe2+SZjsdREys4QCN9akm4dhrCvQK3paaLE7Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177993; c=relaxed/simple;
	bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4vDYRa8YrPEBHBZyXjrEVVMV2pud3M99reACFc6X/YDkT33FYsG6qr/PuJoCXzbH1wYHDOXA1KQUC/kjN44Lg4PXVxYuSMwJxg8U1oGIS0o7+dRImKe/eolKvamhnDNlr/MBg3V57VM4xjQ/ExI+2WYqat8YyfdL9L9PvA6FGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d794Otf9; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d794Otf9"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c96ef6e0afso117806b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 08:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177989; cv=none;
        d=google.com; s=arc-20260327;
        b=HbAi17SQGB12JPvq1g8s27pm6Lk8CBd+0ZOB+CPs+CUslJ9RQc244nfnFFE1aCi+Jf
         Yllnz29xxnWM8NBJfeNh7zxamanEtEKtU/KeHcExQw3KdbfuvgiFO/Nju81T9mUER49t
         yYHnzKoj/SAHrLQTdhNih/7VOAxegKweu2CtQODLFCxJz4Fr7QsWp7glFmjDxutnN88o
         vFgrT0/Bl4XncdTAue2iZx+SsT8FwOvMU91ngh7l4OZGKxssXsFQc1oum8kXS5ccOfYm
         ubmKPRiN/+EiX1TuOa85cz6khoLwWIVWyJ6QX6K+2AOoGq3yhstRuFTiDAutRjo+WJyP
         UscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        fh=XrHl+eG2w23UY5hwBibD87BCGOOFaI5V3vn/NZaUhqI=;
        b=SfIrB2oDMcHd5aM/yRmA4E3mb1Eh8kTlloc+4hoQOrqwHFKyQEQQqOBiTDsZFHVVIy
         SBX3azVjeb+x4Dh+IFipukxBFhKpRoYGxq9xfu9qeoh2AirH+G6hbtNITgJZ+fyoKeKB
         BAiYF6GgbBMt6ZGnHwgkr/WseGTB/lOx+sglnQDQb8rBz9O/kTjnVVWrCzRjLy81Njhw
         TH9/ieQysFC+umqyGMG37CN83yu4nGC1Hjcjoaq0Rnjzm4pQq7vpaBau9oPU+zp83JyQ
         pCYyzes/TZcP/Moijga62XyaLEkFJ+J3Z+X3ssZApuc1z85S7rokU31m/noy2Bb8qYVT
         cq/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177989; x=1790782789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        b=d794Otf9N2nr7JynGRvuTcTvw6yB3KeB07VCCGBAknOphv9T0y6GE33VKjsGGb0SmT
         MEtlyTV6PonQ2qrBEOpVmMYtQND0dqkPprXpXw11N7PWQM/VJXgLQmewZwLxSiWa77jg
         ZsmnuQz0IpsMAP1EhDSH3FL9dWLVfIF21bUWRBtOPHhg7TfPGjjrFvW9Up3w0ggseCfK
         rILoT6FO/dp3QIKv6gaXDYu0HO193KKH37Pex+nW2ZEiwPHuob5iE4KRV69vVesmDuC1
         FUjX5SCzGGsRHz/LS3pxBMjyXqj0TMpbUY5VCkHfVQ5k/xlS2pzlR2wDySg8kJ7bG0vO
         ccFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177989; x=1790782789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        b=jN7dG9gdlPJdMe7QFLmAD4dGBNUlmfmlX2jQiG9d+O1IEc1kIYeIV0jM+JUeQGdOGW
         2XKd4uutyJgBpqLXv1p64lrpNY09Xr/PrJnoPfS7LYEw0l0Nm3ZFonvzDe2CGjQ9CKTr
         711+DAiWMNbhNjslcv2eDauT1eJlKX0qgjJZyy51DYUuOi/I1E5zUuSlZAamau/fdfMB
         kKBe+2vQ+GwaMgloz0oEbL6iBj+Umx7+fTzbE7fyULMGbnFoFwufDiU2/CKsD8R5BkeP
         tbbLcrg1XbQyBzaVY0J4VGPwvDUWLYXxsu2ZbtBiGm0nIzDhLAxz5FZdO6H8fdrThVb5
         B68Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeqVrrUZxvFaoRkJsZVHGnJ5896lhkP83XQgePi/8EZ3AMGQvUv7DEYESm8pEqC/4wlC/BXgXAb6c=@vger.kernel.org
X-Gm-Message-State: AFuF++kNFq7ZF4pWFjKlCJGHygldHYsOKdqwVjN4AN7O7QnqofiLqfrT
	xGAQvhkqBEd73DnJBercbUTCUcSIQBTw7/ambWs15TE0J0/4fA6RawqdHO9tS9kgUfCKFzUO0um
	LVGek6I4slahdoXRT0+J56QFynwtAyHk=
X-Gm-Gg: AYBFou298OTNbw+CRg5GE3Egc9JLwK3/1HEwsRn7rnUzg6PGt8D7YmP6wBScIssBpdo
	BEJU+ZJ7kwrNuKEyVkAVeSRtkrrHXZtfOHcpkGx8glDCmEecXO8nfomQ380fwPNTI72pVxgFTsu
	/HTi5FUg7DjO1YjrRCH0mUZIOpKaTYz46S1JxSPkBueTBbXm3jkjmDjuBXiGKLiAF0AQbNYzhAt
	rtNFZ8GiyvIWbyzXErAyrnyryTYUJt+y4gtRnErkSVV5BVvV0dIUyjiK6RJbsW+z3AtWIetttqm
	wqrxwmnVustTNeWegVbNmcb/HI26kk2t6Egm5zKHtvHH9QzwCIh7VdmJKUlHPXJHjXeGLuA=
X-Received: by 2002:a05:6808:f94:b0:4c5:f237:4521 with SMTP id
 5614622812f47-4d5ba9fd270mr3658486b6e.5.1790177988984; Wed, 23 Sep 2026
 08:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-4-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-4-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:39:37 +0100
X-Gm-Features: AclHuK-4_fTyXS4Sk79rrR4cNhFbQRH-gmM6U6Ove1uzxePDNMKXgCwckYn6xmI
Message-ID: <CAGSyskX-Xuiyrmd+z1Gs-eDwns8pfA4gGQHN+XepDreYsN=dZA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/5] netconsole: allow configuring the rate
 limit burst through configfs
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> A target that sets ratelimit_interval_ms runs with the ratelimit default
> of 10 messages per interval, which is either too coarse or too generous
> depending on how chatty the target is.
>
> Expose it as ratelimit_burst through configfs.
>
> Restart the interval on write, as ratelimit_interval_ms_store() does.
> Raising the burst of a target that has already drained the bucket
> otherwise buys nothing until the interval in flight ends.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
