Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA432E92D2
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769941589; cv=pass; b=kMkIv2AsqjmrQhBbRrx1dOkWQ7yNAzNTK3wB8sNCwIZFYRQqvdHoZ3b6zLWZusMLeklujv8WZlDqlvp+D1iYEjIoJcnFp4ZPR2X6NuW7pkf04sa0toU9uV7vH9sCIFP8FIOH6FGSQDEQoR4MBQHLFeWOS7fNRnebp12/Fjm7Pmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769941589; c=relaxed/simple;
	bh=amYpk8y7uZ17bXL/jYzc2DIrfTgbEjzT20gzakvuc2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKYv7N9ZSK31UVQlTQFqfbEvJE40ssNllroGAMkYxvJe75QSpyekKNW1L5pyQys2o1+oaDMSGV9+jwTR6b1m/BMiYt79vQnZOJE93LISixKU+J1g+BoxvF9BgDQdpk6HwYILFzHGm2IX0NB9PyahCqcqfDjpgxBMy7uRF4ABec8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tjWXVEIk; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tjWXVEIk"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-503347e8715so42315631cf.2
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 02:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769941586; cv=none;
        d=google.com; s=arc-20240605;
        b=gkBvCU8Sen2BBFOwj1JyKeEkJ24oiXesrRRxgjO6DmtGN2xgUPKrs8cJfYg/yOUOvg
         sTzEvZSZWsXp6C6mryqZ2PSLBQwOIqpgKX0wgavgVgB07EeuoiUzBjzXTTpc9gVZ0F5b
         ATmiUBCSP2x2DhMhqknb30bSy2rvbStlPBwtgZLRAErStFnEVpY119zM+hMcGXh6X2se
         GlBl3XFjPEOnL0HQXb/czV9e++LYWq2LRe3RQ5Dy207JtwApq6vE/5pKA4BcDv66f+s/
         8vYbsqmqyDICdJ7AjFxTgLD2js8ZEPqa5AyQF3qIuIP7P714HzA17N91KpCPKZfTj3FG
         d3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=amYpk8y7uZ17bXL/jYzc2DIrfTgbEjzT20gzakvuc2s=;
        fh=CcaQcq+dWZKIveM/g/ifJ9Fbh21GYtEqusKW8dBbfXg=;
        b=GQQAEXU38GRienF/fIqzQuHrKKctfDw7KYK2ozaQXxoxVSahMBkKh84oaShU8xbrQK
         BTZBn+wOJoK5MgZjW7QdkGGEftNp+tCcKi9oUYQ9ckxWWGJlMaN3VIMM5XKTV1S2ucx9
         0Lqz1Ps9rMpbzY3ac4K6UhZ6sYG/LFVLthj8sXvDRDIr5oLdlAtTVEXUDvKHIbp8tXvU
         n83RSi4IKNplmx9KemHdhAzXwIuw0tNF72qnEDiyEAs8tzueDzWh8RHbfLlsqjIQQPig
         ELxmkgGg9wVM49KU4yaiW/1zZ9qvW06SEkwD5gEKu0R81KpUGjimnJr36gvoOMSkkQ+H
         +ohw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769941586; x=1770546386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amYpk8y7uZ17bXL/jYzc2DIrfTgbEjzT20gzakvuc2s=;
        b=tjWXVEIkwuWlA/YmIFxQycJ590x8iPoVszHh0oOmLhIj3YUMioygV1KM3fv92WjZ0F
         SHY5wx3LeG4cozL2PK8A3mbNvXvCenltELpXLUGtNCU+BuBeWX16hGri2tPTrLZ8KhA7
         NY+/rato5A/jMf5EUPWojk+ie8GJKNXyqrNyarsXyGaq2NqyMZOqHH04v9EnZ0d5O50B
         aBN+h5xgvWuY8k0S6atOqamEFKP/lARddKxU0NexaiEf8rzDo8icLpaWWeJvkRgM1ya1
         oitFZWauwURHO+nFbvtOrYPd6O6Bm2LyGhcwmgYMKRtTMt0fjP24A+hYD8DxfWyiDfSn
         bv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769941586; x=1770546386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amYpk8y7uZ17bXL/jYzc2DIrfTgbEjzT20gzakvuc2s=;
        b=ddcBJo4F8H65y8AO84VDMUurD2mVdTZOIHoPN4KCwXKlU/YJx+S/Dfw5IjSmd4E2u4
         bF7jpVcEycK6mCuovvYXjYNCVtSo7+QzEbzqfdxZeokHEVLiL9MgmM/kCwEcObhc8Y4w
         8UZBviCbhAM7NxKG8A/T5lWChFDk5M8DObGHxpdyTMWjGz8RQgiRGGDTkKivcv3325Bu
         F/iIVSlO9svnX01Jhbb4gtg3XsPHcgVzqZcYiG4ldlfmUykaklPwAo+wPZmjbHtpnHoU
         XH2e11nmySdcxNittJGPbuv2jKvPYuBbzF9B9qLHUAMJsXzHazc86NHB/WDIgx4Rv6W1
         n9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtRvUh1neaphaxZdLnutqWYEqCdh/hGQAZudcaBzof3XaZ7YwjKFKFw1t1gGoz4wQ0yJRYmvD459U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhei50U1+KTLgHNxZxVhfA9Tw2A4ZSJu0j1auX9RISTbKZAK3g
	RRod/3s444FEEPBz3Lu/eOgdWFuX3jr6cSlVq8tONOTtP+YxIoAoz5zFJnmCFj7WxWh5i/pNeRG
	b7+iTPkARYBDiwf3KdfgPNGN6aeyYhozqkSREgh44
X-Gm-Gg: AZuq6aJ61VqkheyYSFjA942gGvfavwnh7CC/V/OKJtOrHv9foSZfoITqlGI09gS5UcW
	1hgHkXZlWtXMDifn022VrSsS2r2TUlDsAww4GIfV9SCIYGTgutOOoqYHfr6nJlOiP5vR598QVHh
	NLSwF4i2AXvf3m3uvuJMwGroL+E1sTsEMPuowVwkWT9O7uUAk106ILi6pLLXiAhw90xgR4UmAuT
	8D/NrL0Six4q3FPUiMF4VHqHGfG27E2v2xbRNpJV1KR02LCYa5pDwS0cI0Un+3/TeJlcTU=
X-Received: by 2002:a05:622a:1aa9:b0:501:3c88:131 with SMTP id
 d75a77b69052e-505d219e7aemr108573901cf.22.1769941585616; Sun, 01 Feb 2026
 02:26:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131222515.8485-1-chia-yu.chang@nokia-bell-labs.com> <20260131222515.8485-16-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260131222515.8485-16-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 1 Feb 2026 11:26:14 +0100
X-Gm-Features: AZwV_Qi7N4AZtgtvbxnXQyIYVraEeuRtL1qe-JczyTuupqULFqmqcdCuYubvvbo
Message-ID: <CANn89i+F8Hmx3-DoOBcW_tJnsyqeeKHZm+_jC1nk5hrnBWN2Jg@mail.gmail.com>
Subject: Re: [PATCH v13 net-next 15/15] selftests/net: packetdrill: add TCP
 Accurate ECN cases
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 11:26=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com=
> wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Linux Accurate ECN test sets using ACE counters and AccECN options to
> cover several scenarios: Connection teardown, different ACK conditions,
> counter wrapping, SACK space grabbing, fallback schemes, negotiation
> retransmission/reorder/loss, AccECN option drop/loss, different
> handshake reflectors, data with marking, and different sysctl values.
>
> The packetdrill used is commit cbe405666c9c8698ac1e72f5e8ffc551216dfa56
> of repo: https://github.com/minuscat/packetdrill/tree/upstream_accecn.
> And corresponding patches are sent to google/packetdrill email list.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Co-developed-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Neal Cardwell <ncardwell@google.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
