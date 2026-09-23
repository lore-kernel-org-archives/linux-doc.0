Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59EE2765E2
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177937; cv=pass; b=fPxuprIQ015/wjHm0kTCzbeuxT6rlT1H3UhL3Is6G65KltBm2zWJk5Q0//xit+8B1tbHOhy3Eyb2n/bEwtHbu1LM50lGFMphFvsXJDh4//UTlp4ehIkr8+jjtEORBAH4X9S54UmRITLxdJFqJSKwCfYwqJe/txA1QRle/dGyYHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177937; c=relaxed/simple;
	bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/r0dpUcZ9Lten4k57/x6tUix/Cv49bSjhXp2HV/QwyNZql2vpJTH9ZukTNi9qTUapUFSZCuCo103IWz9oWTIfGh+ppA6RTo4BDi8zFt07IZaU/qwXb+1WSUYIduMZ/cQ0hXfGT60qS8eqEJCzR0W/1Qx+knTinQSGH9QcXMELU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgc6ZLjx; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgc6ZLjx"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b34ee88df5so139593b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 08:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177935; cv=none;
        d=google.com; s=arc-20260327;
        b=HFIPLVwgQiJFTda06h5hQMRw+lOm1xTBYATGRPQuL+1YylnihJlCsSBTBJCrzCb5D+
         tIz7FhPlREjxxJT9aZA4rC8arlV344+ZH9utweknzn1KaLPnsapIkUSI71amDPDdzdMJ
         XUgRnTgxPgrorcD7D1RXf/Nw+mGCPOojSF6J0spQ4o71x2w5UR2X+5cZwYRKKLW5QXWr
         BpA1kLkamZF0DHbAMOi8kKm5UqOdtgv5M2mlWZAXwKehPDOcpuUzp7xLyL5smzNnlyYP
         EdM0bTl72IYHLzGNHaxiR2/hIV1bW6eZ5J72M8jQXhE9g1VZSzULZtfCfTM6b5vJ8Xu2
         /mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        fh=PZWnQ6aDZTkTjsLUPjCEPF6BPgXcJ2YWY/E/24o4rmw=;
        b=VVxEYdLHEtHpJpary4F/43TPKAy9+R8K/10RS2ROdiZsH00QI1dKVGPDZ4XdMLCCMN
         dEE4bJzXtlL3/WVv1ZOJHNGj61NtqO9dDhE5tkfU5SWBN/qPzJj/LaLHFjisytdfE9Lk
         Vg0tpk06BlH+v3v2lPcC/joCkxQPj5OqwkKYfHZkUQ7fAI69mNktDe805vZvU0GiPh39
         JhdcrGhoh0gS56uJua+gNqjx0Wrg0toRZcl6q2PRxIxrouqx4tpP+/nYcQEWKYzY6bfS
         M7bbhA4M1anzz0gN/Uaohqq6E3PdGVG4uwSZlnpcHkvCZcsRx75/DlYXFRQbZQksP3k0
         O7tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177935; x=1790782735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        b=Lgc6ZLjxJeusXyd3EEeus6/sE1JDLDujyZs57woMUdQtc2Kjio2LZn53PlqdWY8WXT
         PtgkzzQP0ToxpHa1URnU5QbndZxyzO+oZnEWwQiIH7zzmPej8xSjBY5aySX0ud77uqtt
         k9rmz/ElydeS5nBSjOulsFVjWPNvLgjX1Cpj4tv5z5AvUTjibJznUimFF6bGEt/JYnND
         b01MckU/15AP/p7Ymcf/t4FYQM12Q30GgWluxCKw1MRqCAsPtHZfc8WLKpFviDNUoyWO
         QacCIOol8e1qIYJ7gxQyiOX1TsL3hqvUcuzvxk+OPAhBo+QpHXjDLjn6JRZO+PlIBCsR
         vWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177935; x=1790782735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        b=qdrZPtZhiluoEV9S64AIpq+xz7/bAIRcyaDP5wM1JDU6p9vUDnWy54483xNNzVWrBD
         /8DdNrtfBkErssc0qhobOETirEOuRZRAuIAx5Lrw1+Uk/47DkG5uPLXlpO5vNJQQDdN6
         OBlEzGPA+dh78g83ox18Ooy9eR9udHXz/3Xyp9w8UkWz4J8tq9ucDsfEiWqj0sNd9hor
         937O886wQGjNqdGZFwvl//bzA17qIG9BcqLXXvXV+jvhQ4u3KGcT37YbI036TxvV6RlZ
         b8J2V1uLULRbJ63gAZHTM6iilPAGozKmFlnDS/lkKwED/zLJGVc69sxGdxCnq+var0D2
         44Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxSjlPyfq2s0Ndifa/PbRg8AOtQ3Gh5TaDKGoMyEJKngBEhu3x2JCFFUei4E7BBnkqX8EzziFxHXhI=@vger.kernel.org
X-Gm-Message-State: AFuF++m8SvMXNS/yDqEOAMroKhdRxKxeyqV3Zu03ijqxeHQi2782m2aR
	F//E6Rsmj29qOEHmp82eytRIfU5R8+vKk/B2mjcjNdYPvTr2PjtRdRbOTBZhEfRiCTM3mefje1P
	6L/V/tbZSd+qd65AXey3Shf2tPh4RYtI=
X-Gm-Gg: AYBFou1bQXCtOT664nJgoAjaBTop9+EKGwAOKIp97aM4Y4goKI0HCdCKGZBXxLtY1mn
	wQUTg0ZfSGPt9SY/4mZItL6BjXbOVKPt2lhSAk0q376FBhYcL/CdxKKJ8b9vNXFseXVZFvsOpne
	xb+v7s/TMrPLFOkvv90lFAeSH7jYQ+AkLBC39AfJZWu3RPGJ3gNsy89mBPl8hGJhwEWeLDPSs+L
	+rZsDUu5++P0uI8+p8rJNhb8qIBub8sZoUZzny2JGCarutLly2kH/95vfhni1HBOcDOxbntJEf+
	9H0+wdax8qg2YlsXH66rtEwoQfURD2d55TanPQmKjUT4SM0dj674/2x6UP22Q26zssycEKQ=
X-Received: by 2002:a05:6808:148a:b0:496:9bf:c837 with SMTP id
 5614622812f47-4d5b3bf7584mr4092874b6e.0.1790177934516; Wed, 23 Sep 2026
 08:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-2-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-2-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:38:43 +0100
X-Gm-Features: AclHuK_jZZFxO2Dh2JWJerZTiWPe1oDb0kLQ1Sj5dw4U8L9ub-MiIvvivGhqr7E
Message-ID: <CAGSyskWZFfuCvvg8y+Re3VKhHWZiWrAxRkXXoFp9pgCrqxi=1g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/5] netconsole: add a per-target message rate limit
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
> Give each target a token bucket and consult it once per message in
> netconsole_write().
>
> The bucket is created with a zero interval, which struct ratelimit_state
> treats as unlimited, and nothing can set a nonzero one yet, so no target
> changes behaviour.
>
> Skip the bucket while the kernel is dying, reusing the helper the
> oops_only fix added, so a limit configured for steady-state logging
> never truncates an oops, BUG() or panic().
>
> The configfs files that expose it come next.
>
> ___ratelimit() only trylocks its own raw spinlock, so it is safe with
> target_list_lock held and interrupts disabled, and safe from NMI. Set
> RATELIMIT_MSG_ON_RELEASE so it does not report the suppressed count
> itself, which would printk() from inside the console being serviced.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
