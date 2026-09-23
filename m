Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091205326BA
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177960; cv=pass; b=NoMon0ucF85pFsSafCfTyAnZHzLLmouHNKOoMymjWkyIF71SYApPC924QltL86ma5ADfLQ9bhFu6f2HJqj8cTYYGyMNtYxPm1JpIKq6vE6E90x3/2CP/UK6JbA7fnN4aZjWPSY0D20RQuVxzhKRGekkqmqPnQBYiZFgnF8WrEMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177960; c=relaxed/simple;
	bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEcCBExNVn2puM3ujZx1S6MXm3sqUUrZKaK616VPn7KEP73YyqA5LyKZcUZKxSmzVB/PUPO2BzFwHH282UhKcdgJMQ2lkWPSOcg6YCFB7t/gA7Ha7hPG6K+Etnk2J+qRmUvANOVlDGQkI+/p4djk1QNZu5LZVvcmgLG4A0T1qw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NupUiLUv; arc=pass smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NupUiLUv"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6c1247f9222so113146eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 08:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177957; cv=none;
        d=google.com; s=arc-20260327;
        b=idtMwa1sUH48FluQYrXOLZipBJJ95qj3aPV6E9xhQswrkdtE7qkZtlWQgixkQjqPXw
         EK/BE2yvxTU95mdHEvCTifKp14SpD5uL/RxGwL1TcQ4C3cM94UCt72l8l61uHNVK6+w9
         wfPJtYGdMggVqv5OTgDwqSX+dHjLe/WcUlV3AB6pf7NbLgCioszHlX25vmH5ZUQzZisO
         zmUUlgkKAsd35AJDl5Jz2aMLEPRoGMHs/vJY6r3Fh/uq2BA/CfBNTp+Ti1/wXvesrrQJ
         hM3vgidP1iKGdA7fi7v8WpBrGEtKn+koJLC5zuAUjbkyQEYLuV+pk+2hvjWwt3ZrrNYd
         6Qtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        fh=khzVW3A2BsV1pAD9Di2dt2rwVP7Bblfrgp0b1XR32xU=;
        b=q9wfvGLM4zl9Id0sbG6DbGpWK+8ppyW02vBlIou5psr53tGwXynBUsH5udcWHhHLYR
         YkrV7sTfHKd0jFlv9PFr+ogwFSs3hlmPdtjBaSDrU0Mo7UwsjnJRKuu4cspHP7+BLX51
         hcm5ghwhgtkkC4/ko1uhXWe+rEuVVxjQC4wzCwmvs7ITbqHV/pfgmrAm+TELB7LQKAyZ
         7cGux42+aGLqbPaoUQ4flMcw0FpVw2o9Eed/VRI/CZ2PE9M3cSYa4le7dnZM7+rMM/ah
         Dk8GTxG2yo+GHn+v+3iXHCefY8mQ1M7QlVYTuqJ3KW/MP9HeCSBrCHgYHgkDqdRWtiiE
         smjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177957; x=1790782757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        b=NupUiLUvsu7Z/KU+xCkZqtmp0YGwaKf2vFfzWTI3psJf+nZDndqj7oKzKwel6Oa+zn
         UJnv7kzrnHUMDBFcZSybsFOqNIFZbuPULSud2P3bNbP/TALLyXdEQxCjhi8JbJgP8k+2
         YC5fk/IwAQBmq+SFsJudjKD33Kg50M9NDqoEDaU30/Vpdd4gB0U0DccQIwLc1o8fw+t9
         jN/Ap6YtFAWbLyHE+zKF1cJV0/uempDWumF/e3nc0NkOXXjaZ4vXjFpMKXr3trUQPMxK
         DLGghUoUHdjiq0G4j3EItTz2pEWVSX0f9eijA75om7V7I09HT7QJ2c/+eHUEFrsWxwRE
         rq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177957; x=1790782757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        b=sr/xQ467SqSrDoPhGKUC/AmgJ/ssNuHPhvbBtwzjgBQ2XsHFKTu7416j6OM3ElNnkC
         if1Y6QBgFy2GkB8IRyUZpt25Sd+J+Ee+mNnAZpAPnkWvTr0aNqio5DEUbRQDnqyPXQ94
         6y+QAvs+BE5x+Pgjqu+AY8P7cneOPeAnJG1CoKDWM+N5hKSezTKkK1ed4YzkAlPUzYwo
         fKAOG9nhAjqXuUHboRybHQRGHfqReTxUI7wvcKD3mcTWgXYR/lsAJrFZM3ZyPk+afvJC
         w6IlTRr6G1/+YHf4mblmcKKgGMvepK63YiHNdLoxnKOb/1o2pC3qTKNL5uMHZnmF2CF+
         MBnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlOPUPYlLfeMBggtS9a79wV79Fx6PhbPKTPaeVJWdjc3kCXKo1QrivNIfGQHAdFRFy+bkVVmH85ow=@vger.kernel.org
X-Gm-Message-State: AFuF++kd7EKrxVjoTyXr4ic/Fn2GGbjDPKFSKe/90TG9Ff4V4G4Akw5Q
	MUiEs/G0OwEiK5mVAXy/ub6lKcJSbN2jYy5Pk3iLGrn3CVhtiPzr5YPBdRbt2RZYPNYaBZka+iK
	fdtZVtOprxCEWyA2/Rd88XTeSovoTnG0=
X-Gm-Gg: AYBFou1ogaaoGKuepmFIxae4+9FLwhd7UK9CQ9xlTnpPr5WdUCPNTnPLNwjm9CZZqmu
	3CbwW6N/lMsX5+hijpAv05HrWMn/DeAoyok5Bqd03mDqMgEu9P5ghJd7J/gA3BCSpUBdCMnZbtn
	tDS9LsQ1dL4lnpfseDVnw65HtAL56AWe5MKUM6ZVNQCQe3drPfytuZ5uSeG0PG2PHu7k1d1BhMa
	roKkSu66JizHUGH5lPdmiO7gL2d5zR0Q6Upjwy+y1GUqZNpxorTzz7rI7SoGfA7Rg2e+iKVfqvV
	GsFot+dGvh43LAGkguev7K8mri6BFo3n+Fpp67P2LrnQyl4zAJ2yqSXRrX19Z1ZdIUBn+9E=
X-Received: by 2002:a05:6808:1582:b0:4c5:6b14:a2d2 with SMTP id
 5614622812f47-4d5b89c0affmr3913291b6e.3.1790177956718; Wed, 23 Sep 2026
 08:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-3-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-3-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:39:05 +0100
X-Gm-Features: AclHuK-QgcIqftUxh16QhJeV_h-FMaPzu0_1xOVp5f_OWxqLY_Kv1c8tOFDe05M
Message-ID: <CAGSyskW1M6ZMrSK6hTOinHOZkHH1H15Niq2-GU13EdL2BtELGg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/5] netconsole: allow configuring the rate
 limit interval through configfs
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
> The per-target token bucket has no interface, so every target is still
> unlimited.
>
> Expose the interval as ratelimit_interval_ms through configfs. It
> defaults to zero, so a target stays unlimited until an administrator
> sets one.
>
> The write restarts the interval instead of only publishing the new
> value. A target is configured while it floods, by which point the
> bucket is empty, and ___ratelimit() only refills it once the interval
> it was set with has elapsed.
>
> Reject more than INT_MAX milliseconds. msecs_to_jiffies() saturates at
> MAX_JIFFY_OFFSET, which is below INT_MAX on 32-bit, so checking only
> the jiffies value would take a write there that a 64-bit kernel turns
> down.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
