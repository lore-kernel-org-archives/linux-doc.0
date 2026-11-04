Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819528;
	b=pN5QKEWU9/oQvMC0RHleNSRi8Y0djDA5DbrzC7Yc7df0qh5xPjs0f+Gflg9jijyNoyGs
	 eBAF8UtLUmP7JgNXZzsVhnLlooxmnW7cC4vQHE8KsVLdzGsB4trTiGl7l9MDTPOuwizgl
	 g71CnLnx17QJzcbe56eauIhlSX/BI3g1h7pX77m5jAXA3OfDk2np3VSm2qM/1QiOoMs7S
	 A/ZTlQkZfBrhGEvqSkNiFucozR20vYQHt5Z9Ol2SGkhhZi+6YgUPq9YPlY7MkageDkK3e
	 bxESpYSltNMgb690SUm5K2O4B0lGOJTvcDkCVmQ18ylFkqmPgT0JNtKptCxMf/bGSkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819528;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3DKxUDhIGrS0XKk3YGxhQanUk4e1Hk17J0HKDnLrC4w=;
	b=tVQ3mEMMaCR/VxfAZIuWqwEhSH/GiwfTI3Rvj4BXasqwCSZVa4ae5HdnMDPS5Zra0AOM
	 DKBOlFw8PF+uBjHUWxXWJ15nQFeTOLYoEngQUbFzzACPZgPnL2DLT0Y62xxVfjOFAs9J4
	 0zx1T95//5HGiF2OcAiIgUWzAYGqsAZPjJ49NrkwElJMskUw2o5NHTQ2Vyw5iKhLGpVJ3
	 X2fKRGGpmAtkCtJZp6eq/K3dDVS9rRH9ItlWNpIJd7APpbT7t1rRms3qtHsIBraygcnbd
	 F1yUxtozsyfJW4gRjGhZq7efUJdLHU2qPe3Y7nAH+5Vk5VTCXRCOXD760WgHW8r/X4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6BWhVAu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D5606A32E
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6BWhVAu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEA41F00A1B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 19:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819527;
	bh=3DKxUDhIGrS0XKk3YGxhQanUk4e1Hk17J0HKDnLrC4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E6BWhVAujpHKz0HBPWfMuhI0XXUt+yp9/6ZuVZ1TU6mTuV1ZzSVOS4IdADWTV8hCr
	 LQ0ZrqnUh8V6ahlcAptxCCUaE6Gsii+LRJ95oD1ujXoR3XbM/+ofsUOdw+flCmWzAR
	 tttyyhsFOuA6Z0TxoapeB1vau8qI2/5E4/UzlYEuphhqT2EeBJbfzA8hT9tPzK8ywM
	 jCTFhnfQtIW+Fb095szIl4Z4sdfi55VrPT7ZKY/bHSNwiUYMBnmIUdR5yjUYyJQBGP
	 Cn0ZOAWu/WkWXoVsVW3JIW8PBN3Jb5C0XImVmkt64vm16BgdsraokB2p6S8dsAC5JH
	 5EEok3qIQ/DlQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so8897361fa.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 11:12:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwcx8FmAwpfUejcwMaTic2oz8xpYwDXVBM+ZApca119nXXVkp+sYdqZRbxyPkoWkeE6bTs76jrzxjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6tSaqHsDRg/uW6upvAIjXKz6jNiv17CHDBJWcq93mU9qsnFx5
	e9TCK79eFmZ1yI0oHeQhxlq2MvMb70Y1N/RL3M0BYylEVOgb96irB1O8E9Vow7sbDMWVsnuOBiX
	p7qb6Y1dI8EMp+3OnKeiLfe60EnSOFFY=
X-Received: by 2002:a05:6512:1247:b0:5bf:b144:fcbd with SMTP id
 2adb3069b0e04-5bfd95871afmr6554848e87.42.1793819526207; Wed, 04 Nov 2026
 11:12:06 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104151651.3035537-1-stanleyjhu@google.com> <8adcbd80-f684-4e00-81b3-a2661fac895b@acm.org>
In-Reply-To: <8adcbd80-f684-4e00-81b3-a2661fac895b@acm.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 4 Nov 2026 20:11:54 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0guHKxUKXqB2MO037X_hn9B4Qr6mfqgKShP7xLaXt0xtg@mail.gmail.com>
X-Gm-Features: AclHuK82fCXfTCCutppNy8n6kl31mTAu99xE8kGJzMIP4eRpp98LhfMeiJfG6w0
Message-ID: <CAJZ5v0guHKxUKXqB2MO037X_hn9B4Qr6mfqgKShP7xLaXt0xtg@mail.gmail.com>
Subject: Re: [PATCH v2] PM: runtime: Update runtime_pm.rst for non-fatal
 resume errors
To: Bart Van Assche <bvanassche@acm.org>, Stanley Jhu <stanleyjhu@google.com>
Cc: Brian Norris <briannorris@chromium.org>, Pavel Machek <pavel@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Jens Axboe <axboe@kernel.dk>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:11=E2=80=AFPM Bart Van Assche <bvanassche@acm.org>=
 wrote:
>
> On 11/4/26 7:16 AM, Stanley Jhu wrote:
>  > +  * If the resume callback returns an error code, the PM core sets th=
e
>  > +    device's runtime PM status back to 'suspended' and returns the er=
ror
>  > +    code from synchronous resume helpers.  Unlike with the suspend
>  > +    callback, failures in the resume callback are never considered
> fatal,
>  > +    so the helper functions described in `Section 4`_ are not
> blocked and
>  > +    a subsequent resume request can run the resume callback again.
>
> Hi Stanley,
>
> This matches what rpm_resume() does since commit eef1d74bf88f. A nit:
> suspend callback failures with -EBUSY / -EAGAIN are not fatal either,
> so "Unlike most suspend callback errors" may be slightly more accurate.
> Either way:

Adjusted accordingly while applying.

> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Applied as 7.4-rc material, thanks!
