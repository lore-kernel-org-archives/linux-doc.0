Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248960;
	b=hDnRLOS/CN1gWucXAbbazT9Hdxek7zDm1TURhtFSckcYngCz9P9I2H4Os82aK9filD9y
	 17g4mwVciqhvZUtIESBoF2dd+FipbZ3JGfrrYRzS0riL5SEtRnA1d6ubAC7Fhq67ysR9G
	 WcL2mPl/HF/uZVF41Yhll4r63QmuI3jj5GOD6ziswIfLHfrqQbqNNquu9pAi747Qb7pua
	 5TrAm35GlDpGfdqgN55Tx7IyOOZg5SB/TQebMw7zZ3CnW8B9E9Wda9NWadbPJU1/zYMLJ
	 OiwlsSLk7qWyn4Sj6AHFlYb1V7aL+HwDRu4QX36GC1TiXs8ONnPhfq/vrpTz0YWDt5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
	b=V5Ihx1FY6eloZSSw81zdDM5oZzKzXSInSuG2Nqpr0R1bSffEkDZppZOCfhLKbSYTfi4g
	 JaBLNPJlatayEh9iS6XUiT1T4Rhsyxo1I4iHoqn+Pq43G8jc9ed0EwLRom8BLW1kprvx1
	 Ocyqv5mAsTKB1JxGSBGP0tBMvCnkCMUQw0iaSM3bez4hHbVhQxIwGM5/91fdX/Hr4b+Zv
	 MHJ5lxE67lSeaggHqsxhT/A9DNvt8ibJwAJ5kI4CZY+TLDasQ7SWT56ANIxHrly1RLamc
	 7uP2GjFiHGtMtZsA4Y8XR3p8MdFjV0SJvXw1tNW8yDEJIIwuYDWa1bCUAL7eSdGir3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+g8qHTx;
	arc=none smtp.remote-ip=74.125.82.196
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA45D6070EC4
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 18:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA45D6070EC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+g8qHTx
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-37198ed3727so1620802eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 10:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248959; x=1794853759; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
        b=H+g8qHTx/1ABTl/J0fYJk8LmReb6tQX8eqOlhMogAupx8Y2+3vIn0oTm0tGGP3USEg
         MA79rIdUVkkQHJXzuMLCwiNGH03XRFTZ+Whl3gw4xKlMuZlAPwQyFzIPepp20O/9tdOB
         KO1p8a+HMsYkPSqgOKZWOdnuvMyJ5CNaLDPKYW+7pUscM02XbPSQKdNsKpo6G4voGoqO
         etYxNNkqRu2JxRmdlye1zTQpLJ1Ky7NmprSAuY1Qi2sxsYn6G2QgweRAAZUTpwEioysx
         9qNKmpiIRCgofwmFJkA6ZJe1qLLExTiwsj9Q1sIOpWgHuBNztIMr7nT6sdM6W+8SSeQb
         bF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248959; x=1794853759;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
        b=TVb2L4Dv89fRtH3mw6BR5AdrnZNVgbtqeMUSMJgbAqbuyViqoUS8luxtfTYsE69YN5
         4d43A+16WWXVOfV8K6CawwxI0JvyS9eDBu0G7QH85XTRkxbUFEEoMiN2qFpuWblosFeK
         bTKcyHu/kGmx37yPCoWyvlHFe+wy5DgsMITdQ0vpCRHlaj2oY127YL88ih4ReEvBbOVr
         A8XRiGwn1O+jynYZimUVuq/ZAULgskK20pLrdAETICDbuG+R8wOS97CNoFSb7cEkwHVB
         4EBxYxu+VfgU84Qhsz1C0uMxmXYXRJ/IusHzy9aH8mmpZo8vVBHFSk0nJq8fbIju2hPY
         h78g==
X-Forwarded-Encrypted: i=1; AL+hErFOFPLz3mo4ZyW9dg85xao/Ke/Ve2BxGL/tEBkC+DQE64JfhsROEIvvg31EQgguYZgSye/G4ET2RKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qDR2nekRH34E5KOd+LcWDFpYitPMQYi639BJsXaZqHe/FcFT4
	RAykBnbfglbqR+8JePSqivcoK6TykxzVVTZDJe/KnSrt1hns3Ko4JrjO
X-Gm-Gg: AYBFou2X9pznAA4tx8QiZBrZkEtWhlEIbBpogFo/2y0gfbgiKj5Ngl/e8do8fOlutsP
	cpvIkGJaFeDKQmAkaDbFWTwwgLD9qg+F7Km0lYu3uQePAYmG57rz3Mv+o3BJ5VWD+m9mLzgnYtx
	XUPAr5S89HvY0Ejfd3SKsMVDEBjGPAu2RRRPivO8TsDhsdxfxCgnMVNi8rGPJaRWgFjdSM6oC/z
	jVQL0rATDjMpGjwNfO+NmJvV53g6MbMBSotg6z0oOjWMQk0/Tba6YcbNflo/pgznwjJwW0IzdGM
	WbJg6xQ2VnV0MlBVJxsrGWWI4T6DJ1TvXd4PtEsH2uiCP+plijVRUZZoaafhviIhbBdeGw4FC6a
	c9A/X8H9hXo6fCw5Jj7ebvMUIUXcru2dJlG96WK2j8qRJCFY6lXvo163WptJvtGUsukcBinxFgF
	LqNZ+VG//0lQZX0bInUmqQ5UYov7ebCPf5kp9kfuZ5Rmew1chGvqfciMqCmwcME/4MiwCv2QWzT
	ZHjJgPs2ZFlY5ovngLPFnQ/x3lw87EmluiqJvSznlhceaTTVpwBYkp1/GlAr2knP9PShx9pVvF9
	6p9bb+VPDKLEkcHBVv3dN9Mc8rW6htuI1cmXJ5AwsFJn
X-Received: by 2002:a05:7022:5f0d:b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b3b5e27137mr363920c88.14.1794248958814;
        Mon, 09 Nov 2026 10:29:18 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm684335c88.9.2026.11.09.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:18 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:17 -0800
Message-ID: <08dc804d3ce9bf9b8a1c0193ee7443c5@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418737922.994134.6838913010792422653@kernel.org>
Subject: Re: [PATCH net-next v3 5/9] bnxt_en: set the netmem TX frag size
 limit to 32KB
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

> [Severity: Low]
> The commit message says:
> 
>   With 64K pages it lowers it, 64KB frags would otherwise wrap the BD
>   length to 0 with BIG TCP.
> 
> Isn't this a bug that already exists on 64K-page kernels, rather than a
> side effect of the new limit?

[..]

> Without the tags and a note about the dependency, stable kernels on 64K-page
> systems (arm64 64K, ppc64) would keep the wrap. Would a separate minimal fix
> for the net tree work better?

I'd rather keep both in net-next unless there is clear evidence that net
is buggy.

> [Severity: High]
> This isn't a bug introduced by this patch, but the same 16-bit wrap still
> looks reachable for frags that are not netmem. bnxt_start_xmit() writes
> every frag length straight into the TX BD:

[..]

> BIG TCP has been enabled in bnxt since commit b6488b161ab2.

Ignoring pre-existing..
