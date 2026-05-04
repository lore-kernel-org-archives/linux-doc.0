Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF5349AEC
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884500; cv=none; b=fQO4xgZKZyYOOL3XT//ObHn+RoMj1QG1mnugqfy83k627LdR7B0pfO8rXwWiDawJx6xklPNDhhCFX6qeU2kEaqmCFSNUOVtXW9+we0psi9xpeMgBwn5fsq+w+vcik/n24zpKy1+2B76ZROAdAp1lyzlEd3ZUmG0Q1xY5Qle1Nyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884500; c=relaxed/simple;
	bh=bLUccklgBubfjMF9F927WmSX/x9egmRdCcgt3JBFY80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QV5mMQmgXR6P1nTCUSuuDgZeR4aKLvC8hBIPs01Duso9KMwzkwFcNkhcII4uuMOSIj/Trz5i57drXO3QodjbJheDmbYCU8BjpCIeut0HYtEZMXHHolNM79VU2f43DQtnDRrRg/R2sZJB2jxwQ3SlFoRjjWgYRzVm2r9R5LaM/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=gktmWMMm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="gktmWMMm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso43428565e9.1
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1777884495; x=1778489295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bLUccklgBubfjMF9F927WmSX/x9egmRdCcgt3JBFY80=;
        b=gktmWMMmQ6ZMu18AJzugEYu3wh2PAKxmnNIQknr4FN9cJ8Q1Cj+Z7P1A7sJL4jDw3v
         ngsPhUFTOM4LdVZHxtePRtxqJBzAwOVtBLDz/ZkVFblYcaWqFXSo/sF8pBR/pY8SI4wl
         qmH83NPMfxtSR3ZIoE6z1IBUt1RbAnuFLvzHxBqzv1QxvbrEaLR+1gXUKuhPPU10AoXR
         QP3KqBC3oz58i31k9f3s6qwKdPqTLDHBWzxlTeyMwb0i7N90hnyGR4nsCT927hITPe6t
         /yLnXWlnVK2+/XiSZQ0jjB3l/I1yviapkncr37GOjF2IRiI6bMK8risVHZ11QyI+eEb2
         Cf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777884495; x=1778489295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLUccklgBubfjMF9F927WmSX/x9egmRdCcgt3JBFY80=;
        b=hx+Fd38VjHqEbXtTmdLgZeUqyXwD6mbcd0Z7eV/YjzS+bpgLvmdq29g6+g+isG59Ys
         O6S0O1Euh9WKnNE/Ud5o/KG8Pijz6Ux72d/EleW6NUp3a1dld4JPC1ftEaSWa/JT53Yj
         LXr1Ld6p1ym1SFgg9rGhNxwaMf9olGYOW31b4/oy9xwdJi27nkNhN1Tgh6J+sUfrYZqz
         Fa6zbR/m8QDWuiGdqwOwiUJH5k9VLGzjoipEiwPJyVJucNgk7fQxERGGBCLDveDX/wyq
         NHlY6AkieaJ+if3X0jO5ZqYrSMxfxU2LfbjNHa6X8tlVEKBUEFgQUfkANb0eMQ7TKiHT
         4l7A==
X-Forwarded-Encrypted: i=1; AFNElJ/3kwdq/JKQAFmaPTjcBFXijwPDzFnDmGd4TNEyHAUdcJUuxkxT5k6s/PdSxR8rdX/TzYkrPfQ7jTo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv7aKkupejBF5unVjzCYHqLffDU2XzzkzSBYgeiQC5IqN2v90u
	tTHWr7ikCMtS04fHGizH8A/ruoVOJvYG88MiyXS/1neDhFbBTjRtBhrNTgCJfHLPs0c=
X-Gm-Gg: AeBDiet8lAy9WNzRUp6xmgP9op/wBvFIpf3pfka8b1QPxzIaHJ9S4M6os0pchUMt5ub
	qXViRuspytDcOQan603/ep49Uuk9ZNVPWesGHAEWuoAbSE9G6mQBqoHK/l2jFG64dF/DIQs/GGp
	Gtm9VUjVyluJd3s0C0sSbB8ArH4Ba2AF/TfRYyrPjosZlLHBRfjAD/HuEIfvONSGaW+nRv+NHu+
	ip6ymzgKzdfvf1x6yG7FCZ7Sgj8gOCcZRR2+YkyRNrtob6kzxPEyA1EDkXWbSRWIMlPJWnMzjk4
	wYgMy1IA+CYzc9lTvgLptGrBH+exsbHOlqnxl8gprsmGQLWjBr4RvfV8B6iK/AsMgWMpXnZJJE6
	YQZG7Phfa+yOqYy3WmUxqrXH/pHI95bCuG04pDwycTjNVrzpO7ZK1GixI9ie1e7N+1OcVACXuir
	5kRbKMsNuCxsRhHzn3f2fsR9yYhQ2y+0+zneRHsxaq678=
X-Received: by 2002:a05:600c:26d2:b0:48a:5236:7f38 with SMTP id 5b1f17b1804b1-48a8607970fmr159836115e9.14.1777884495283;
        Mon, 04 May 2026 01:48:15 -0700 (PDT)
Received: from FV6GYCPJ69 ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44b63d78692sm20604340f8f.27.2026.05.04.01.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:48:14 -0700 (PDT)
Date: Mon, 4 May 2026 10:48:09 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Michal Schmidt <mschmidt@redhat.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pasi Vaananen <pvaanane@redhat.com>, Petr Oros <poros@redhat.com>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] dpll: move
 fractional-frequency-offset-ppt under pin-parent-device
Message-ID: <afhdCnT0ns-PgZD8@FV6GYCPJ69>
References: <20260430173611.3312596-1-ivecera@redhat.com>
 <20260430173611.3312596-2-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430173611.3312596-2-ivecera@redhat.com>

Thu, Apr 30, 2026 at 07:36:10PM +0200, ivecera@redhat.com wrote:
>Move the fractional-frequency-offset-ppt attribute from the top-level
>pin attributes into the pin-parent-device nested attribute set. This
>makes it consistent with phase-offset which is already per-parent and
>clarifies that FFO PPT represents the frequency difference between
>a pin and its parent DPLL device.
>
>The top-level fractional-frequency-offset attribute (in PPM) remains
>unchanged for backward compatibility.

That is odd. The ppt one was added just for higher precision but was
semantically the same. Now you change it. Could you still treat both the
same?

>
>Distinguish the two contexts in the ffo_get callback by passing
>dpll=NULL for the top-level (rx vs tx symbol rate) call and a valid
>dpll pointer for the nested (pin vs parent DPLL) call. Update mlx5
>and zl3073x drivers to return -ENODATA for the nested context they
>do not yet support.
>
>Add documentation for both FFO attributes to dpll.rst.
>

[..]
