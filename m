Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795058753;
	b=PMU1yLH2kcYbqHoI4z9VKcLKa2t0wo/tXkFwhYk1ywQWU2HSQuO2hhfDR9OIgL7kCtCC
	 1osJVTCOfxL+UC0++ieTpOX9Ms4xO7oqZSmHbZbapssiMJDpEXhWT/Cx9UIRsLQgbyZPx
	 sVFbjerIg9FhWF5iLh1nC6gNdyVg0sKTiIgs7OLJ8w6L5LKUZ4Y60s0yKDYt3NkflFJmf
	 sugxXnB1UQwOGJlYgjeVkDHeB++novsJ5lywx9vQyaCSLIU+3LotsHAobltjJiId0nFB7
	 /apKskq1frxKsuSmJim0i4AQgnVPqPjlBdi7WKR6HA/aPTNryN1y0DfBmrQESX5yEIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VYFehJNjVBKZDZJbFVr1UAFxWBTOgQ9HruW0YhVUrYQ=;
	b=0yX+kLoPbgMGgY4Ozr4NlApbNOgfiScJBHf9mAa8Rbhb+DW9EU9X81wTp71Z58kY1y/s
	 jgNkDz60l+vxrruJ6rMzuG2Ryhd3C6RFhIiOaM6GxVAcPSITyAGzZ/sUcihZmkrIridyf
	 LrqynhlKafpbaBRmhqIZbCnNHN5kgSj/tePun2a4kHCaPG85U6ZIM2umpbP9ZbsH6pEXK
	 eaNp30TLw+FISUzaJR1ZpvQCQUIMekVA0NUoTd33Zge2oATOH0gXZE7mKulaHU0JtrvAK
	 4bcaydCeBbs7tYQlJy7XRPg7AHUJkPO4glOA2eqMknCm/bItH0I80nqIf5cQyvOgntA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAQIFdMj;
	arc=fail smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86288606A320
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 03:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86288606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAQIFdMj
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55c48582654so17737241cf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 19:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795058752; cv=none;
        d=google.com; s=arc-20260327;
        b=mw24tZKjDdOFT+35nsKNBKe28ahCA/EiRKPuY+wE22FBPoq3W47NTgEjzVuzVDSm8f
         i8S3ozRJJ9+u1DsSurltAAS0dJrkLQ9BdxwBuMuafz0AMYZ3V9QGHNa4kB3Emrff/wxR
         yCb12iV8ee6rNwiQpX+TqbWLM/irpcfXqS9OG7ujppl4DKKhgATKlzlzAe9SorVlvF3T
         vrXyxkI1b2P0rkzUHSu8fELE3Lb4rv41x/k3miRGkQrP4Yq36Vw0R7w2VI35LbgZHQ/y
         zh2lSqzva+c3IvlMlB2mrqOFQ11y3nui0FsvmJDuL+LB7cPmyRTI+ZhlCT9aSWko7phL
         1e0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VYFehJNjVBKZDZJbFVr1UAFxWBTOgQ9HruW0YhVUrYQ=;
        fh=ktIENtcV8HFQERMFAaEoY02OLPdiWo2e5uuU+b+Pvy0=;
        b=nM4ZIvAOuqnwaBvSkl5GIFv0eqr/OLRQq7T7bBTDfavo8u4DwPnBqUU6zyOZ7WnN4q
         N62hx/W7m1l3rg1Ai4c95ogxYkf/ZIlmu9EDeBbJhFLaqYwHSjqqRRiBsO929p2FnmR8
         mKlvJggTzT1UcHnrTSMef+WzgQAqii1ssoak3qqnBzzqnftilGkIytdjBf/y3rGpnysV
         KJfuwlDFM/PQqnV9Ay8qHzUmI6JLyGFv7ubweV4/WzHnzkN2D4qMRDm6CJwLQ1ZVE5rn
         pJ+sVsNe2CBX841wy676x/9QPtJb9f3YwSpsPwscgfljPpacybj/DseSnn8ZGmA6hZkg
         sgyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795058752; x=1795663552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYFehJNjVBKZDZJbFVr1UAFxWBTOgQ9HruW0YhVUrYQ=;
        b=yAQIFdMjzIAVbCGnIcrJ307cyttMywjCpxY6iuB9DHCfyyoc9x7EK2BAN3H+WU9JjC
         +j5h2QJE1mITRwFVcQNP0iiOJTN0CJNygLBp9PmTV8IZeKT5Rv1uZ6uvrbU9iBC4lVbX
         bwxkI1vjee6gr6dNtJii/0J/kt5L5/KM2Arhd45mhkruBZaz7ET0QVrseoiAbAA7XDpE
         IGJO2L+Zpg/fCJzRfO8iNmGWUk16SJvm/4jh7SFOr3dsog3fkzzcbITrEfhHwdR/Hds1
         UH4WfmEnxOtRXcoSywA0itqcOrwZTZetvLDXb2SERn0j9Mtlez9kWQr801I8mF7+VW+o
         b2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058752; x=1795663552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYFehJNjVBKZDZJbFVr1UAFxWBTOgQ9HruW0YhVUrYQ=;
        b=HLOY0/hfWQuiU5GzXk4QXI+lStizpFiLx18zJRW1NiUyaG06ObDwWFYflkegiPj3v9
         UAQBIhPQW9sCGX6tFPPWH+UuYI4hcR9F/hdyzEXfqc5dUdRQU0XlZ9WIaZ9/yEcVcgJk
         gsMTjqb3bQB7pFpZ4a7eym9ZuFiRI2qmnQ5ba97UOIOSXhAZIU6zbzgMXYcL+gJqW0+O
         q1snWAKE0D3Jr2AbafJP0YkOfURrcT0OXEs7lKgkCt3TegniqWwGU8n9jsTNa8zZkztE
         Ydr239ny+8vo++rq9lXp6cJdBL6PmXbVgVJRbxghWmh/PhEnswGBe1argOhrNZpietGu
         L7KA==
X-Forwarded-Encrypted: i=1; AL+hErEYFyMfJxBZJY0ifL/a2wQTc5c8bHrV4SVw0ccbNQIuIW7lU0gIybG+unUB3w6tVq88dNM+CG3B0Vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cpZDDDeQQI1/fkliwXmXbypUFDXMI9NaNuT7RpdrR0tkg21tO
	3yAh828wWyHPyZZlQGRCRow7w03J8Jvkba6+r8q2oKL9DrBm/OmIf5yMV8TfYCgGwdHagCdlH4W
	zJIfArNhNih90PoQrnavA16bgQ7ZOMMM=
X-Gm-Gg: AYBFou2N4u18Hpi4Vu8zhd7aCV4qCKfgbsq6kO7kq+9kO44NxNsWbGp491zqTiwX5Pq
	LbBpGjpQSGYyOpOe4MGqUAyPS7qMuHFxOW342MOgkG4xT7bhTJ9GzDlYKMNi2htO6cMRrrLBjBd
	iuvdVlOagixVxc/cnqVAiQQysIRB/0osJTv+Ktrex0gFZtY2Yhp/zsEbWKlsJLMHhFVvQca0cKC
	LpZZ5LHoLZwjI8ZtSSCh6ORqhHwer38gsXomuKJNJHvQyOUhWZO7iPrNNlPZrs2b+1oOTyYYBwS
	RnMlzmCbwKKSBcRswek1ubS6fPTUS2M9pLUcdpCU4xIhs9ycsnjME2ABO4qD9V15oLIP5VjboXF
	v6sVdC5/hmJ0fJVuVGk3H5vynRv8t3VfZ5KWrWd0IhOa+y03r1+Q95yvY72smD65Uja85qrmF6Q
	0AcmYKBnE/hYq4UfP0AhPwxArsXid/ZoRe9durID21drDPGHakYdQFdOIKkNqhtwG1l9ZE42qHj
	Nf0gkVsZqZ1Pkd49naNXLYY
X-Received: by 2002:ac8:5a4d:0:b0:55d:3350:d262 with SMTP id
 d75a77b69052e-55d5a63e3b0mr69700321cf.52.1795058752488; Wed, 18 Nov 2026
 19:25:52 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260923025148.35637-1-vinicius.m1821@gmail.com>
 <20261001013833.29002-1-vinicius.m1821@gmail.com> <CAMAsx6f5hMH8FF4ykRp42AJ7AxbuOJw=g-VL9PCFYYOAW1-SvA@mail.gmail.com>
In-Reply-To: <CAMAsx6f5hMH8FF4ykRp42AJ7AxbuOJw=g-VL9PCFYYOAW1-SvA@mail.gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 19 Nov 2026 00:25:41 -0300
X-Gm-Features: Aa3M54qqRPi2vYj3K4TQgQmNkd_5ndEw0-ORb-otvUVGtjOUYPaZSO9eoqnK1bo
Message-ID: <CAMAsx6cJvNhzxcVfrprHVpvRfi2=ncjWP6pfsNgCevpyutdTiA@mail.gmail.com>
Subject: Re: [PATCH v5] docs: translations: pt_BR: translate threat-model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 30 de set. de 2026 =C3=A0s 23:13, Daniel Pereira
<danielmaraboo@gmail.com> escreveu:
> Hi Vini,
>
> Thanks for v5, the translation looks good to me.
>
> The link to admin-guide/reporting-issues still points to the English
> page, but that is fine since there is no pt_BR translation of it yet.
>
> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
>
> Thanks,
> Daniel

Hi Jon,

Just a ping on this patch.
