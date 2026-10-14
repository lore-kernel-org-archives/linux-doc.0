Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984644C659
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013892; cv=pass; b=axpxRUxXtnJeQr4BS5fgNQ6u9SnyVMpKJdJFbZXhKk5nAUM1QWjfsfk9IO61K8tRy4fJEXw8mF5atVLw+Wf5VR1YtUv/fuVbNHIdpLbzCvq8xdL0g1jO4IeqWK6hTG3OaM9PeIASqmg49I7L+w2m/tdh0rKW9AuxhiSDDNvXlaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013892; c=relaxed/simple;
	bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj1nBZeq+VoH8RB5k3kqwYnUwto7IhVFLoNbjWTuMhs47PSzJBwOnPa8i6q1OGysEoAc2TV8eVYoZox5Ip5xNqSsbRXzOSNGLWFEYUF+ZJxuV5D2Yza5DRhUNRXMVG+EEGQKb4QUSg0xpC0I+Ay8Uk3q/v6sdjSVo1ND8JskhEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGTX0rAd; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGTX0rAd"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-34c522572bfso589108eec.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 14:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013890; cv=none;
        d=google.com; s=arc-20260327;
        b=E9YXpvFcC0i+dw20yhuBmCT69eIL8EWsvtPeqeQdOEwOfLdHfnrTSV0GijTNm11+J1
         fUHAaMPJFltAErqHh1w2eKb8UPHpL6lrx7tZkdJAVYZzg16tPb+bQ03evcMziK9L2jWk
         Ob1F/Aim7hNJKE4jan4qE+cpRHz/7jX5n3Z1W9x55IUiMQp6KMNKZu1O59rU/v4xJXDK
         WMPF2El86Ufj8qS0TyBkXD99ziS68jmO9D/p22ty92eyXBvqGcFFndi5k0ibZ5tCcWer
         ad8RaZUUDPJi66BagRrDf7n7FPqhZaYJRCzibXN03+HzvWZqUFziDWRH1TY1D6aS3eLH
         QH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        fh=DkzmtZ8IHOwBIV4WB212CzVwK58Hr2+Q4OP4WScKLmY=;
        b=RHuPv/B2mMfHoENaFH8G39Uz+EqTRXvwbkvl2nMV9hs5qibGDfOz1ARE1FKLjKd/+V
         32pydM8OTEZzNv94hNduVfhbZ1fppO3Q0UtQysmIwpUxKcK0HqK8YNNRgE8m3nVb8QrS
         YXoh5MXKGkUPboJGW9e5nQS3UfFUZFA9XARI6z2I2TQYG9fRvT187MI2iWpPNbTqv6QS
         njXbqQJA4NPuHfElhsh0kW0AEzdpabbvHijLpec27x/CrFceGa3zwfMUgDIMoeZj/syc
         h/m5oKWMM+oDqMt570H0gkrbrC8I/CZMNI2QZmxPR68Uf4ljaElUa2gk68VjIRhR7hnM
         /ekg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792013890; x=1792618690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        b=hGTX0rAdLrHkQZaD2CeBaZKsVbVF2IkLrZRo1HfoeIVqYfX676cT4xfAvr13VPkyhK
         sRPwCWgqD4GMtK6r1i14dwVNSJwU/pfvsHlWDQ9VhSNb5JFwd9/Ms7rurJ9AVVkWpBU/
         xXCtaoz4XFOSsDot9tkzsV4tr5s9pdQDXKtmIa8KD9XrYz/tfH38lcBx3cXGQPCgswMC
         PfJWnWRjq4RIeMmzJF2zJ2PapE7g6TF43Mf3pN57dx62sg0QCrNuNlrX592M6ktYxwMG
         wLBIgW3KNJc/JGkgeUw3o++Yvk8R4hHN/aypJtUQFUdovlmvgR/w7g6tAR0tG4udjVC4
         ifBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013890; x=1792618690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        b=EqpsYgDhGxEg8nbPqcN+HdRO7hzHs/8TuR5Gli8jCAYOAUvyOZGcEvCrnT245MuCyP
         weRvg/jYKw7JIZISppUfnWCw6MNUaU+Mp1FcKVpcBfrJTDZt1zQq2p8NNypJjxieNMHY
         ScQIZpBwTUmxbeGyimP82bPZjH3Ahk2M6XomzKdGq1E9nVaE9h9+lQcxsavvYad/0Sys
         wcxQLDLQ3UA3geBzX8Ke0TJjmfxUgQByWP2noqE87Nw3l7DLQO/3Yk89kcAPAT7Wgq23
         S1892FTqbQ2+woxDyFRdd4ZoVfL09kKfiiEhjhiRYraJAkmUnjrTp19V2SEHAc6SEARA
         NPqg==
X-Forwarded-Encrypted: i=1; AKwUvBx3BxO5JqTgwnX9jWM17y92tx9d/D1QjHdttlZDeHImL4/Y4OM7aspAXeBmr5nthn6hLiSFtFi1FQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM1dVVeiqihZMkB+fva2aYWGl7YLiH7zpFpEmUcxDG7TNkhpDh
	G/siQ2ehVZS8yjHPtNN2plMVql+LspQeMOPb6AVKD1A+nZrqANhKVU6Aks9Fa7zy7q0vNHOsJWd
	wNfuvSakq/+srJhfifW4ogy6RBEJ+rIE=
X-Gm-Gg: AYBFou2l7eetXRw7hhZXi623lHfHz1LK38lyzccmTkZ/0F7OEzRnzBj5H5w08njHfQF
	I89oGHfdQ8lbcoz5ji9y8c1Mul/vgRnppHXcgM58qjRWHkVCEkuQT0i9zSzkYwonXnhH45ZaZ60
	GL95nydB2L59rSse+enrmoLA2UY/pJR82oPfsM8pVRH4+J318ZTakESvZSxe9sfxm0XCbJ3swSa
	Jhjw2Z7GrBFgz/K5r0RNLpGzPx40YLt4iIeakBe3OVZMHBjdS3zfvocbaeL3u+Zph9jmHgBIizQ
	SFqXADa4s8H206NqbE9hC89Ok5hvt3w66/usoHFnLWzKbpo5Yo6CZ3T/yvXOLIL+54AIc9CfMYt
	nk+uWatezmmUX60JoKXxmEpvjfIdDJ7HT152iNx7x1ofgqDGcKpWxgpSYqjaW7kcew8a0sU1zMC
	7IfeOHwMZZmpwdZWxmzLbBiHRxyz/xLp34aHKrnfCJLGDcdFp8thdjAB7ldW6O3Q==
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3537e04ce24mr33060104eec.2.1792013890143; Wed, 14 Oct 2026
 14:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps>
In-Reply-To: <as_Cr4FhzyAh-kC4@laps>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 23:37:56 +0200
X-Gm-Features: AclHuK8tgzioW0we3H5Jmz30FnP5L68F0LOvV3GcndlE9PwqCRYyUXS4gK8bCWk
Message-ID: <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 7:58=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> I'm following the specs[1] for these skills, and my testing showed it wor=
ks
> fine with a few of the more common tools.

What I mean is that they don't get automatically picked up by default,
e.g. Claude Code and Codex don't seem to.

The website you link (in another subpage, not the spec one) mentions
`.agents`, but not `agents` without the period.

So what I wanted is just to confirm that, at least between those two
options, there was no inherent advantage (or disadvantage, depending
on how one sees it -- I am not sure if it is actually a good idea for
all use cases to have them automatically be picked up...).

> We can open the markup language discussion, but I'm concerned that doing =
that
> will break some tools logic around importing these at skills.

Hmm... Not sure what you mean.

Cheers,
Miguel
