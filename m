Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B933CEB6
	for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756481882; cv=none; b=DnSQvL37DoLg5t/qL0100zx1JW4UTjnt4YH+huMixKPJbnHuqm/Q4aoWhBWUc8Asr2ngPLP9RzcbkcwT0qBYdbh0UeIAK4etThTvgbaGz+/OBhrk1vTnNA7vLM+i/dPJznficSTUmCJ0eGPYqad45GO9cgZFawiT3BUDXoI0tMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756481882; c=relaxed/simple;
	bh=dTqTTGZlJ4chGLvICslwE1y0ojIOPXnMp1K+HNp1epI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I80AKNPW5IcmO3yHTgqFEXcACH3s1M/phTJw9mH/TBzZPYHaHWcDiCM2hKI4wfLhCGZeuKuDbZwrEYEztCIWOcQFSVM9cXmbtzZFXKTAVWZ62CaQzz0NdCOy9jsbeI4zHp3RP7ef1NaV/CPN9/BcKERdwAZmKp8dMHiuPFFSh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xv4STqYZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xv4STqYZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-248e07d2a0eso191095ad.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756481881; x=1757086681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBf7SqSAMiJDLG40aDWJGII9dJmHgmKSvxJ5vBdynMw=;
        b=Xv4STqYZhdgB2G8RbmGohMgF7TwqhITRuYaWBEUnTsPI1hoVf+EBtwrXOaOehaQ5en
         7JmNJq8tzCgL/2UfS0Fe9d4Lyq/1kURVMygcdRjF4Liyi8EOIZtTaKiODhX9WdhEhatj
         j5MYZqQUQ/40kTx9YZBH440BFBiB2MaaCjqCBIDYLgIeuwg/MlimUAYs8H9XhADG9XBO
         fPaWInbFERSbjQ9gKhrb2wneh1aFbEKdJRR/8NQfkSnf5eCgWe1UnnNyGOZnYQSey1Ev
         FMnruH+I7i2TjIZD5tyk0k0xzMKHO+wrl8dkdau1LcS/+U5Iz12StZ2g175iwN66Baqt
         h7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756481881; x=1757086681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBf7SqSAMiJDLG40aDWJGII9dJmHgmKSvxJ5vBdynMw=;
        b=ATrzOjsOJ3wmfPkGsM7OCfXiGeRV2tbOr+gLOU6UC4aIWGNVveh2FlrkiWRnkrKE5Y
         9hivn1B8DyZg0+Y5vasjXDvVWOSuaUvamegFWDmHgTc5q8MowjC/4x9C82x686md89As
         516TvFunO95iTiy3jlLbVQ8mPUdrjnk4nbIhmo0NvWV3hxQfu4/J1JpOdBd9wx/v+dfD
         JQKhfhKLnSprPMt73DY11pLF2kvIp2VSKv+bWRX8b1mNIZWwNaBGPl4oPMXY1MHHGccQ
         6K2wPK25Ef664L7ZbmjPhOWQmUF/HXK7JKLN/YS3S+RUAFuaDLq/eH/0XkrZ/OLPlQ0N
         BN8A==
X-Forwarded-Encrypted: i=1; AJvYcCU5MO++3q7m/nd1UpLcBtX4JKcRoYLshdZuA7Lvk6CcAnrtYgyZrnZsQhWZ11M9OGAntbcK90XMBc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXk1Czbww1zphkRp7GKXCosj91zUpdmQ2vqxJiu9QXuEIUb1k
	y+BgFphQz23XSqdsUQX9++LPQ7XM8ybPzgVNFDZ67ws6tCbYsuyszmn8litqezv2ttXdP4/gplp
	wCy2VSoqkVfHoBlvWJiFEnZJ3zwEGtUvoz4EO4qS1
X-Gm-Gg: ASbGncuYq3F5rNUH784kXnCM/dXFMXtXCIYe2ZxOnOcbbliRCA3WQp4zU2NgNfuy0eM
	ZHpRV8dTopKS3MBZAAoYfI9g/Bjq1oESX6XM7VI7jSDOiT08NGVOfnTvy8TxsMYUSnabN9Y2QTG
	kMMXMHAt4b7IJjRCJ5LvFoVQU6gwwBoSasUg6eT/FUoE4j/KvALTorFxxLu1+zMcNh3GkDqCyi3
	Gvca6S7hZfTmvF3tDCUQBbw8KPtr3332GUVDuinkhX0xhY=
X-Google-Smtp-Source: AGHT+IGHvmLAKAqp+h6+xnNpvp5enqs0Nws580nvnSfEmJmHq7YmiK6/BK/XP+hcXSHZelrbBA+KbrK4+ArPIvGDx3k=
X-Received: by 2002:a17:902:e84b:b0:231:d0ef:e8ff with SMTP id
 d9443c01a7336-2485ba39492mr21568965ad.8.1756481880357; Fri, 29 Aug 2025
 08:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829064857.51503-1-enjuk@amazon.com>
In-Reply-To: <20250829064857.51503-1-enjuk@amazon.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Fri, 29 Aug 2025 08:37:48 -0700
X-Gm-Features: Ac12FXz5DCE7rZjZ7YALpNhkeMz6vVHFgx151bfCTOA8incUou3mzWHzQxbS_ZE
Message-ID: <CAAywjhSDz3F1uieMEuaFAtE2AKYXcv+5FjcDv3d4+T5ddWhy6Q@mail.gmail.com>
Subject: Re: [PATCH v1 net-next] docs: remove obsolete description about
 threaded NAPI
To: Kohei Enju <enjuk@amazon.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 11:49=E2=80=AFPM Kohei Enju <enjuk@amazon.com> wrot=
e:
>
> Commit 2677010e7793 ("Add support to set NAPI threaded for individual
> NAPI") introduced threaded NAPI configuration per individual NAPI
> instance, however obsolete description that threaded NAPI is per device
> has remained.
>
> Remove the old description and clarify that only NAPI instances running
> in threaded mode spawn kernel threads by changing "Each NAPI instance"
> to "Each threaded NAPI instance".
>
> Cc: Samiullah Khawaja <skhawaja@google.com>
> Signed-off-by: Kohei Enju <enjuk@amazon.com>
> ---
>  Documentation/networking/napi.rst | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/networking/napi.rst b/Documentation/networking=
/napi.rst
> index a15754adb041..7dd60366f4ff 100644
> --- a/Documentation/networking/napi.rst
> +++ b/Documentation/networking/napi.rst
> @@ -433,9 +433,8 @@ Threaded NAPI
>
>  Threaded NAPI is an operating mode that uses dedicated kernel
>  threads rather than software IRQ context for NAPI processing.
> -The configuration is per netdevice and will affect all
> -NAPI instances of that device. Each NAPI instance will spawn a separate
> -thread (called ``napi/${ifc-name}-${napi-id}``).
> +Each threaded NAPI instance will spawn a separate thread
> +(called ``napi/${ifc-name}-${napi-id}``).
>
>  It is recommended to pin each kernel thread to a single CPU, the same
>  CPU as the CPU which services the interrupt. Note that the mapping
> --
> 2.48.1
>
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
