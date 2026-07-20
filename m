Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F277369206
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563805; cv=none; b=bnD6j1SQtzCLEE4CuMjmvrYwtchrjWdtk7zUWyaXi/bjgLiVxRB8YwgaSeZtFByMkx4jbLdsvP4tIP1R2wdtrcuU2S4o3wdLXH15hsUL+VSM6yWXkK8W5QzvuIpcO1qBqixIUy/e7afwA46XybrcP+Gj+b+U28IhNMXy4nzhJ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563805; c=relaxed/simple;
	bh=wFJ2G2Nx9gaZnhcJciXnJKtKTiKxKkOSK5x9fJBL0+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NomKvx227x5FnqrXzQYFz7S5BAm6U2KavW6Mgn7BE/UBXDzEuv4dea0imPVfdmx6gvcLXjbjRbGSeQBxiy2aVdkr8QUGPuUDzoe62jAYUzYHVRwQJdesYpA+5cDwNe4i5T8RUMkCWNdIFnXFoFCsTQ3XPCvfZ1EousQZ8upMv4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5Tl0y8x; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5Tl0y8x"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf50c6f235so20992175ad.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563801; x=1785168601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p84L8EQrf1/Bk8g06gBQbk74BG6TjMtTjLqNj/+ZjME=;
        b=A5Tl0y8xGFhmOae9NaaTLDmK7o+XPuBytKDpA2BWnjEagaZ+vrZia1CNgjtgAoz3Z7
         W3+tMa1LN5T1Ny+xUgRqU8J5l0R/CHUxFjhAJe/xv67q/5q4ClGgl9NtDUEUCeqFznCi
         ztMZgXTtbsmaW00SvSp0m3fJo/6SGUYENJNTvFsbalD/SJW+8SAvWpt/5AGaAkOiNEXv
         U9Z34JKs02kecD1zrg0gMEJdqhHtou6p339+peFRNkKqiyn4efww8cq6C1gZy42YfSzN
         nQhYzNwiaB1B2LtYRie1NR2Pp3LIkgF2QWOnV7GAvKMMF67Ckk6grMyHJN8dHg//iV9z
         Dp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563801; x=1785168601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p84L8EQrf1/Bk8g06gBQbk74BG6TjMtTjLqNj/+ZjME=;
        b=ENsuwp9VddZoh1ZDi0yeLnDKTh8IDA2CfhuqEX3ttLSXwBK+jVsRuzbAceZCQIAteQ
         t1HHzP75SciTTTWyFJZvVKFY3xB1Ts6pSiX4F8d2unOfWiBOU3fSGf66kQnCVbayPziR
         8EExsVizoKHMVMGKYSOXlD6kz4yDup4ExFFYoLgsTT1WuG3S329VRuz6dnJ3evpN6xoz
         Q19CwWPqYILRhFCmBlZI2pD6u9viYHTM8cNBn63X8aruYDpGVPmGrjKqexI0Ji7FuWaP
         Hqy79mTSxaD3NWJxhDl0SRx+PKLWjghJREJRY8o/NM6ZgXKLy46YggyM2C6+JcZW/bnZ
         dhqw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3/f7h6ghrJT5EXxWxB6A17CFnZaOpQ1+0LN9EwIc9Ph1rXZvq1D4Sp68dEYglhaEpDIOPq+DWqn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHi0U/+e1aNHLhtxkWR99KtkLySUa4Odt0qypHwYciyFxAbZ7+
	KIXayLTHm0Uc882X0fI3FZXnHKHa6DNtiugZm8K+W4GapKQQJSJMEzih
X-Gm-Gg: AR+sD12f022uvxZwGJiIVimCknxFk4W1Dn9m7cEidtu9Kw2kxMV/zIxgeiXLvmEfm1N
	NpvtEbhnoB2+C+xFmCGkXcyq/b4sPXOCJoxsUPbWzUTphOiu7KXmpG7obgnwGTzMTfYlC2wKWL2
	+k84r9V40Gqp7VjFrmJRthrQspRYs1u5p0EZIhxr8sHqAYSyl+MlemTeIjI7tbEMNc2togPrDuw
	hQyT3QuSTz1GE6bX+YpTUzaZ4ory5Tx47IvCn62HYr859Ah9ShtUirfhw1V5H4GkUMJSHc/dBK3
	JXGTj7tU8n13nDFmTbS0n3VikOjqtyW9PJscjapndzt+v5q1VIeQr0Vsj7r2JTvULYhAmX5GzaK
	iH0qlUgldJog/UOYf1LntLC294Amy6ppN2z2Iy4UIexjUqx/dU3eBNdn9/soQYDoURLuqUN9igK
	FRFKWtflElZGco+3c=
X-Received: by 2002:a17:902:f786:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2cf3495ffccmr169921345ad.23.1784563800862;
        Mon, 20 Jul 2026 09:10:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm45256293eec.5.2026.07.20.09.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:10:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:09:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, corbet@lwn.net,
	skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v4 1/3] dt-bindings: watchdog: npcm: add GCR syscon
 property
Message-ID: <d79b16b6-9179-4b88-b401-66a177774c00@roeck-us.net>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-2-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706144828.3517631-2-tmaimon77@gmail.com>

On Mon, Jul 06, 2026 at 05:48:26PM +0300, Tomer Maimon wrote:
> NPCM750 and NPCM845 latch watchdog reset indications in the SoC
> GCR block rather than in the watchdog block itself.
> 
> Add the optional nuvoton,sysgcr phandle so watchdog nodes can
> reference the shared GCR reset-status registers that hold those
> latched watchdog reset indications.
> 
> This is needed by the following reset-status support, which reads
> those latches and reports watchdog-caused resets through bootstatus.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
