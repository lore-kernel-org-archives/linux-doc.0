Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35971C2DB7
	for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 18:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728672556; cv=none; b=a3Is1QBTRG9wEjEgrQm39FksnyhRHeXTlQL+hl8m0pnr9cADb1PwLyUhdVRi06epDq5o6N1rDdbtXiyaqPCjAIAGVDzl8JXJ0NUW9KQFe3CkGyqcVtOC/4YtiT6YiuWzEOJx99XDwVX2TLvWeHPB/uyjvmDhcc0H9YkwvwxRof8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728672556; c=relaxed/simple;
	bh=mGGtmXOkiL+NaXSLGTVrliW9Y4OXTHK6Zp3M2UoVbDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ge7tlqm8MwzkSNvaHWCdVzfS3tQLhSQO5qVeA9x9Z+kj1pENHpHaQ2EP0GfMt/8o/QaxGGKPmWML8KWPlydbiLVhi4QdwUG1JKgeSaeqb3a9F5cnDb/i3pKquIKJcSi2PNaKSuo8FNpbtSy3bMS3GFfKBLarGYNe0VSiFGmjveU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P1Mu2dVS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P1Mu2dVS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c8784e3bc8so2998508a12.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 11:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728672553; x=1729277353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGGtmXOkiL+NaXSLGTVrliW9Y4OXTHK6Zp3M2UoVbDY=;
        b=P1Mu2dVSzaPZswsJ0+IxBNCK3oVF3cUVQx2CKUzD56o2Av/5cafAZn8WY4CUC1/5mS
         pNxHP/WrMhdfYTyao2pWG92avWxiWi85ZtXd986wgIxGCa0ht3IF6/2oA8c7vY54Xp5g
         XDUgvJGZ49YNCGyr8pc5NQHRw+1v6QCZbkUz0+VjPD1Vn3zjtGgZUbAuPnfuLX03NljW
         oyqj+6SfwO6rpbPdCxQU+2oc1Dg/WEuIszRGhYFI+pRyLi0zQwjVEP1iBj1zymvtWnWA
         5ZCbzhjO9tglWaU9bw3QKdBF1iVw8A06QWBw1R/iUFWpMr+vVW9MoGiZxGRu03nsAas3
         4McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728672553; x=1729277353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGGtmXOkiL+NaXSLGTVrliW9Y4OXTHK6Zp3M2UoVbDY=;
        b=wsyzAOWZdl1WT+w8cAitCEDl+JtBnlzowzyzrGPVuchKadugzc0K4T6xSkzUeWVzTW
         HTNhdeLm+BYIKWyHGiY1++Ws2u0QUtDtO9kiGUR0ofAp0QRfp/SOhylgC5OsWnIlT8z1
         p+OKsq6y0Y4C+1M35t0Fwwon/1sfqOWUykGnZrHTemoKqDXgot0Tn2LwNppqo6PdExoU
         j37Ppupf6/uQ0YoJjUHrTGCVBcsQAt8KvAVSsaBzIv7z3TKcd9Dg1tla9ljN9dpoK6aP
         hYej95J1PbwYPMZbcyxwLK867005vGvT2XJhjrhSM0hKN2MTkAZINc/I3R2BvBAorNgm
         OxXw==
X-Forwarded-Encrypted: i=1; AJvYcCU/kQaZKTshWDzk/TVF8ZdoXx9U/iZF8X9SDrAIsDcfKXOxdiKrT7K3NKFzOGvb/KqJgIvzeh2nQl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysrMw3oyPKeAZ2EYS6XubYD/BEVIXHmcoH0HSxFOru4BD8TZFK
	1L5pi+y1sp1iZzZnjNLqdCzJBPZ+4FC5AocwgaOp7ZUFO/M9XS1ivbyhT2jwzYL2/i7m9r6S3rf
	xZjGdsMV8wiXMfAI/zyodUaKHaMe1sVQaKzcs
X-Google-Smtp-Source: AGHT+IFdOExi8Gh2dAs70FPXckILto1QCGfCelh7xShxCeFOgdGoVjbiGquJFr6yyliTvxCD6Id/DS/KMK4tTK7Of6Y=
X-Received: by 2002:a05:6402:42d4:b0:5c5:c4b9:e68f with SMTP id
 4fb4d7f45d1cf-5c948c8832bmr3152234a12.5.1728672553112; Fri, 11 Oct 2024
 11:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011184527.16393-1-jdamato@fastly.com> <20241011184527.16393-6-jdamato@fastly.com>
In-Reply-To: <20241011184527.16393-6-jdamato@fastly.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 11 Oct 2024 20:49:01 +0200
Message-ID: <CANn89iJvzWA7W-Sa1j0nGz2LCPbu1tdLs9uwL2xCT=EZ3rUtrg@mail.gmail.com>
Subject: Re: [net-next v6 5/9] net: napi: Add napi_config
To: Joe Damato <jdamato@fastly.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, skhawaja@google.com, 
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com, 
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 8:46=E2=80=AFPM Joe Damato <jdamato@fastly.com> wro=
te:
>
> Add a persistent NAPI config area for NAPI configuration to the core.
> Drivers opt-in to setting the persistent config for a NAPI by passing an
> index when calling netif_napi_add_config.
>
> napi_config is allocated in alloc_netdev_mqs, freed in free_netdev
> (after the NAPIs are deleted).
>
> Drivers which call netif_napi_add_config will have persistent per-NAPI
> settings: NAPI IDs, gro_flush_timeout, and defer_hard_irq settings.
>
> Per-NAPI settings are saved in napi_disable and restored in napi_enable.
>
> Co-developed-by: Martin Karsten <mkarsten@uwaterloo.ca>
> Signed-off-by: Martin Karsten <mkarsten@uwaterloo.ca>
> Signed-off-by: Joe Damato <jdamato@fastly.com>
> Reviewed-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>
