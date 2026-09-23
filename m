Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD85476C2
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178019; cv=pass; b=Z50zwk/uDsEi3CChbjF7RsTOvl3vDYTc4WMvU4KCs+NtKbZcBuF7krsiul8wi6mPWAXzhXXCZwMgH92QnP9VmxiGLgUa2tFss/t/hDn8CcV4m8is/55eprUPCoF9nh4X4ynCPeIYW9xHTd7Coxao+U2bP9YIiMm44v+TG/EFZjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178019; c=relaxed/simple;
	bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0WlAnxu+hZkxQJqXHGkd9TNeQKAp043Y0kwGNghvO40QWLkCWWY6zgebHbj7M0BtKzGXTJqvvsAMI/PdWYb4+IhiuKsgp+A9I50fKOMTh4LmFwhuKKoyEW1DmJYpQ7oBeHD6t2NJxlycYBqDRYW70LY16tTRtZdahjo5wJj+wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm2INPB/; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm2INPB/"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4bdf2e95fso150479a34.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 08:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790178016; cv=none;
        d=google.com; s=arc-20260327;
        b=cpOMhKFE+O5+s1P8cn5bycjwVbj0GBauEU93TnbjPa7u6SBNY0XqtxVY8l9t6rCKrC
         MqedEjYEQKOmVaeXrXCnC/ViU/c7eQAHucKKQC5n3iHzLi2pATAuG8Ob7VYPXaQamJvj
         RhT+0z2WDU9Vwi8l4xZnniDvHuKIj2KxGTFeLtOnI2uT4TfOb9M3FMD8C7s8bKmcR4tV
         LzBLXgvGqS10dqNZ4T5WfSDhGJntiRLS6a66lnVyDy9TOnuQ0VGZqP8zu8+ReLjO8jb2
         +Z483FV05qZLXKCjC1amv9o7/zYWd3EaW9NuluPltWjAje9PeT5P98bWhHVP0LH7FTch
         i8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        fh=nTwu20bhj3fRJ1ZNjbTzIUfAXpLOiY0IRynFVcLCMoo=;
        b=qSfL7gyV9DUuv2QypYckprUnVtiNGV42HuOZ9fcW1tzKE6eh74gNh6fWqfoRiKJgry
         GoLM5NeVV7Q85xtwRCUfm00oRWosXMkvemrR0L3zQOtL5rr/Uil3KFGwpGYG6wn81Isp
         Ta+1hwefSrfTRRiwk+DBFTWlYQTZUejKoB9791PMqT7YwBogrl9c6lQFd98bdZd6nSmu
         9IVq93FEbVdbc875thYWRyc6xQ809bqEnkYA6fR3RT6QgiPWQRBREI5Tc9Dd9lkfWWsy
         awGv9MesHpMQbEp/1nJwTb4RrxtKZbojtNtyBXnIuXJoTFH4KZHei9B3tvUzUvXgSbQr
         WLJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178016; x=1790782816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        b=cm2INPB/9rCqjGjznTx5zKWjrWfIWpnXs1FvzTdYqkVb88o7r5PsQtPn0uiuVPmnXC
         MX+tQKC46Md0kIf/xSfql3JI8jk8bZGaudWm+a8OI+3n0x80ECOAUxLnbh7p4BymQ+1z
         gGDM8DX+WamDE9uhQ13GCKBtV37b5dIVJh68fA7G1hIyak8/GH30PUmpcg8N8qzSuaJF
         Hlsw4VRBcntF8kMTGrBbWpCl+d4UbAkmLzRdn3qJUIDIqH/nulpMI2ezM8OoUKZ4540a
         w0l36sjehhvgGfijL8ne78bQImuJ3/DR1UVURKu1a0NYNGWDsySW8zpg1XkCX7ZPohuY
         X0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178016; x=1790782816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        b=SjnigXX0dln60Rpg6JRbi0wSZTTQAp3mj5kkUUu20wfOlUXKwPc62kAaIy5qEnYG8r
         gEg9pS0qqDVL9k9e7DZ9UGx89LUycoJ8Z11bUDT8MYN66SB9XKCFT81roTVIUICgPRxG
         mICF7k5dGa4/nyBFhtKdg3piVEnz7iu2O3cVmVEQ4hMfazW2ntyqslyCjdaYDJsbe7hI
         J/KMIl3t+CgZBw8L1s+FvCygP+lzeZ4yGW/O9ZQeYTwSpxEHUKYCiZWaIO12V6Wxa+pQ
         f4W0iI+FzzD7vQO++T0Xzpsao3xMuVxXD7/GTZwX4RtJnFO4UrhphxmKfOSlK7P81INz
         wWqw==
X-Forwarded-Encrypted: i=1; AKwUvBz8xW8kHWLgONOWEUr1FYJ36Z1RflVXD0jkZZzNWM18M8v5YnL05rA01oSNgj0mvB8MN6atx20P5KE=@vger.kernel.org
X-Gm-Message-State: AFuF++kW4w+w7vs59Ox8HY+qmceuCNXDKipEFb8l0eAJHuWKI2WR6VHW
	qBQD1Xpmqb821Hvtf0XJUDDcEh9XcN4Jxmc66sfPHMBS+sU9++LejuRL1a/K+xGueSyL5VRgFt2
	eQUX7FY1cEfCpS8tV2tB6Vm9Dun8w0hc=
X-Gm-Gg: AYBFou2w6RWrKYwaGwYpuimM+6qXzAlcGm2ZzTv/yE8gdg3TfsgRW8l5Rq4v0MfYQiV
	5bqDynBBmgx4faesigr2oaG6fvdECM8+2RafKy3GIegpDaHrtPUHOIO9zc/6EaqbDcWEOw28Tva
	lz5nyg0atUZlFJJ8V/5YFupEWvDev1srS0GKBzww4x+9o9BfVzFAFU5bGxwtmMR3MElcD6f4z/Y
	iVOiZ0FqXXfQd+EKmrpPLDKCbbtQ5+HT5HMb6xb8JC1X/XpcDI1Lfb+wDgJ+Dm6Ictr3CNyHC9M
	p1fOIphuAxlAn7BKd5bv05nzqnzxFTFcfuUDqTcH0sEcV8itTB9GL4v1V3pyXO0DA2OjHWHJTNy
	7Aoa3oQ==
X-Received: by 2002:a05:6808:1a1b:b0:4c3:ef94:830e with SMTP id
 5614622812f47-4d5b9f9412bmr3726243b6e.3.1790178016141; Wed, 23 Sep 2026
 08:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-5-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-5-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:40:02 +0100
X-Gm-Features: AclHuK-eiR2fNKubYazj5gcFmudoFI1w_j91DvZRl7oxVpCmicGBPNhjY_7h0xQ
Message-ID: <CAGSyskW+HsE6Bp=95EMF5rWqKtoUAFp6CjH8sAFs0gYywuALvA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] docs: netconsole: document rate limit feature
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

On Mon, Sep 14, 2026 at 1:11=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> Describe the per-target token bucket and the two configfs files that
> drive it: ratelimit_interval_ms and ratelimit_burst.
>
> Spell out the two properties that are not obvious from the file names.
> The limit is accounted per message rather than per packet, so a message
> split into several ncfrag packets is never truncated by the bucket
> running dry halfway through.
>
> List both files in the target parameter table too, and qualify the rule
> underneath it. Only a disabled target can have its parameters updated,
> these two aside.
>
> Note in the message ID section that a message the bucket discards never
> reaches the counter, so those drops leave no gap in the IDs.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
