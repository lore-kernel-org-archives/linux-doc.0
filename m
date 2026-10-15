Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECEF542EEC
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080940; cv=pass; b=EGmHc/Ao3wsooBcuVtCxhrzLJajRWwxdc71eC7GN1YTbyitvG8wl9opSJ13SEH3+eDlGmP5pwefVLCRvE/ikqf097QjW1Fabd78PeVg+N4wGndHY3BxCqapPgBxCT81kVCjcYrchUIYa6QBoevD0nimlfg44zM31li2kDunhBr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080940; c=relaxed/simple;
	bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0bPOtdl+1TiBtdCkDR1LY/iSv6ebuTWs1QJbYgydiwIHMoaypbK7qNHBPZPsIaEErYHaTpwvYelZMYHksEJ/Zr8fcjaXI0yoHF2yohNRZGIAXseeOhPefupW8YIEIbtz937tnRUvL14vKaskp8fKFnFBryyniySEtzIt0dJWR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XutVYcfh; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XutVYcfh"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35159e0092aso638604eec.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 09:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792080929; cv=none;
        d=google.com; s=arc-20260327;
        b=NFPUFqQG73C6gbjGps7EUJ5yAd27vGZggVcoHqSRE+CWjvYmGbGFPWPzvUvti2qivK
         /zZCv6EgfYJbWCpZXnEgJkfKg9KZPbwNIKGvPNsF+pSdrUMubq1/XX5ySdHzc/6vdnbe
         2jJkURe/ezLulIWANFjYUl/ATHlogeCs1M2jxagMfoPc4AKMLI8pHSKLMQe8kV5buGOP
         GK6/KXmZRSnRIkgVFiEhWIUtAzKazs0uxK63jzhcaWnID+qtqLMPuDwQm1hJSvIu0U1Q
         aZgrIV91vLrn6fIAaWpuCAgKIq8UYcM7enTaBARTGPWitW0oy0xy9H1gmQ0HugJgbYn+
         olqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        fh=xt9vHJirMuVHSMwfjPZvRWdBrRnMYpiS9ksyi+BeDIw=;
        b=EKHhbFZctCXMcSHTat8ExqTe0Zg3jvNschG2OESxxht9xF07O+YswAKcP2SgOguDku
         ru80o1TMzgzMa4dLILzzRUHCRWt8cNgwp2ibKV/oWU4gnLH1K385jF39j6PFxVMOMi8x
         7mHMX8xJsdh5UTl+lyvjZ0SKxpazs5F8jsVXl1S4GzswvAaxn4SylxaSI7ncOa6cioFM
         nUWGZrbock9ow34GnNq1Hwh4lyzm5goxrxUw2AKLoAX7mSTwz3l3JWuQM83U0lAddTyQ
         EOdG5/mjPQJJ9EuYInrpBCwK7QoxSwPf8KX0T+//EB+JLfRgoF8Fe7tL8RLCOPCZc42d
         K44A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792080929; x=1792685729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        b=XutVYcfhfuIwYt7oz3fIbtmTfgpStJjx0N7LF92toIkgvtGcj2MmD5s/cVeJiTxigI
         LV+Fyr3gB5C6KJ/2BkH+cV2QBADoqzCXxAmJGt1H2E7qzljiCj+T9pzzVWPKXWcTQey9
         SIomRRuCS/L+IZvkJRCM+9kgl/OyB8TGUeC0WzP5sNjFobcjxGSGT++Yd/ljP4ZVuCzk
         6iulHb5Wha2Ih86swcKayujTnHVNmYMWixdP1Coo6LvkJ5hM2U5tcLDG6iQeFvIPB+sX
         HLz06BZ8XKlGRVhsDLCkzENGM7IGpoyud+xiLOu4KoFxA5sxTfeTHMsBrODtFe9hRXLQ
         DVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080929; x=1792685729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        b=n135Ck2eke5bcc5wUQ6f6RAkTPjrT2FkP0LcSLEvshW9VAUcbhRWKFzn4+qoY7f5wL
         B66tTnjJ2GUxh5rmtzb5RKEXlT327BYhx/NlAefqODSfsJwOYbB4HcDXPh0jQUdTz/YW
         NLr4iP9TEmRj/HQaQn3GEAxPnDRVP6/28ji34QSHNgi8Efo1hY4SoRXdPW9lqBaOu/mi
         trX2AEpTLTrD4GJtixF/aaGBdjr0TbNtMcXsb5bThYN+TsrEyB4GXDLrbT/MLvaqeTBR
         WkOHIyGx+zja+eiITYzVcTTeMtZnSZiYC+11mO5jUCHTegdHt/Q36SeGxrXApcVoirue
         r+ew==
X-Forwarded-Encrypted: i=1; AKwUvBz2Z9nSGaZaNIT9Hl5DdXPQHTM5i3YhNTG+xOVdJWP0ulYQ05Fxl8tMiUjfjoEg+v2Uv7PFWzwCxJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHG3ELsvS2hqBYJ3rXxhVv6dl44w67kbEsyGWG+1u9bk/KRkXt
	XTvqixSqytmD3lThCa/IL9sgwL0K7tMtz7Kvw4peMOObbHor/5CUa5b3+DLuoUpnu4pJo7R8ijs
	TyMHfVuBFQgwGnmxIQUExO0zZfiFf+PM=
X-Gm-Gg: AYBFou24IARoarhwdZjcPfsqhlQKj2ufCk1a44289i/vB0YxlRYqO0y0JMZTaHOhTx/
	Y2PmQXt7nzOsQ55WD1dlyHNuy0FK/QGgintAW51KbWcke5KzQNeBf0vMemJD0cAnGO2ebC5Ze3y
	e+Qxb4Qb+dxjVdbvOckTW2L3KeHWjJN27dqCa4gzk2h5yBgPJKmHiPp5LLn353+aZFu+6bWW0O2
	QzUGG7v4EZoHPIHvNFeHpveps6mi3mwvJqLKmeIOMLvbzG44ncp7IoYSSGHCoCZoA8p4IoA4zGv
	OLjPafgBd31Up9EPCuupsfpkBE0N3To0iFQa3XELlFjT0DzStmnZqETgKW+Jbc+G5WfHOAMfm1K
	5s3cIi2vqMnIT4IxU1T40eBhXN8RiMZz7ejzOh4vBpUyHAYokSFnWwBI2Xjge6L75SWXHnKhbLC
	5HK3FqG7XahNB7FbdaQg/mYb15n+W4LSRL6R2cfYLp8hqBP5H6leTAlQUUumF32vg=
X-Received: by 2002:a05:693c:66d0:10b0:35c:492b:e310 with SMTP id
 5a478bee46e88-35c492be9f8mr17514341eec.0.1792080928498; Thu, 15 Oct 2026
 09:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps> <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net> <CANiq72=raWNCedXQW9dSDwxQTE0hfs9ecyGChRPnWqO6DUvbOw@mail.gmail.com>
 <atDlfUEr-d_sRP7c@mit.edu>
In-Reply-To: <atDlfUEr-d_sRP7c@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 18:15:15 +0200
X-Gm-Features: AclHuK-PjnHmcyinHcDPK4Z6dnO9W7SGIPggSgvmNWFmm386jeOM2Bdrq8WVyuA
Message-ID: <CANiq72m+j4j86sCnKUzjjq8udcW+hgdrnTa28WUWfyFu9qHXDw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Theodore Tso <tytso@mit.edu>
Cc: Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	broonie@kernel.org, ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:43=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote:
>
> I'm a bit confused why people are assuming that we would need to have
> copies of the same or similar content in Documentation/ and agents/.
> For agents are are *doing* somethiing --- for example, determining the
> correct commit for a Fixes: tag is not something I'd think would be relev=
ant for Documentations.

I am confused -- I am not saying we will have copies between
`Documentation/` and `agents/` of similar content.

I am saying that `SKILL.md` is necessarily Markdown (please see
Sasha's patch), but most of the actual text is in the `.rst` instead,
and that such a split is more complicated than a single Markdown file,
especially if we don't plan to do any processing on it (as you say, it
is mostly text).

(I do think certain skills may want to point the agent to some
`Documentation/` by file path; that is fine.)

Cheers,
Miguel
