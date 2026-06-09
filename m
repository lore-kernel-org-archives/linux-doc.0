Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C739411666
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 19:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034683; cv=none; b=M0e7Mfqyt6HFV12V6Od+58JmXPczVjJghpHZMa49agXCMfa0GbYLFllDyIbICLpIO6t47bPUk7QvI8qravYNj/dgHxf6chGBEQoJxgbBgp5wW4hwYpTMkRHGfy0ZoRgn6FMCMZ1BL1ATUsJUQbx5iCMLmBu6rEbPsLwYu/JeK4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034683; c=relaxed/simple;
	bh=fGch22jZAhUnZc2JB3l1ZbWmjnBlSQCGkHHpCvFs43M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WylqHuOvwEx0TKqmUGcuIaap93U8gdSM85JH1mlIBApo7A3pg8V3eI9sgIsByUT8Knl1NGYNjNRp6oaafhqWeMtfojJR9uyUdDD3A+ytnbCsBZAyOY8qptnQ4ZMjp7l9ylLgQWutc/BcVMOgWhOBF1/PMNDfDarwW98gFNSEHog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=UyXqKSNF; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="UyXqKSNF"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8585cd8400so2329344a12.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 12:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1781034677; x=1781639477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcuzUwojIicQgNYVYeBBnWiTMNVB+UCosfiJT5lPt0I=;
        b=UyXqKSNF7MeRdF+p+a/Q7xA+qqR94IN04PtDH2BybrKhexarRDDXAfF4tdhOmxHZrT
         RlIT5FXzHVn8mYXZfEr57p3iHASMqWqz0grvrUmfMehVf65VlftVCjtoDVLWqKuJ2g9g
         9ntRMpn+aNfBGOf07KdDrVHSl7U16jlIZWlT2DK43BKSPQUuTwCReOjGXHDGdl3IdIKh
         6zSSH7ggMDgL6SSWsEGUT3QNdVktO652YtC3QiGVVZcCBLfQYyp3ClOrutX6WYPXVWlz
         BNBdDphHRGrgneVhKMvz8GzV2KcIL06RS45LwY9HXPKhba+SWOylLOZqSXtO/6/vdshY
         IvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034677; x=1781639477;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcuzUwojIicQgNYVYeBBnWiTMNVB+UCosfiJT5lPt0I=;
        b=AUax6EryzAr/EijjuqwRLjLUBfZeE+rnrUu96s8swvescTPkZR3e6B4xrA5QbJFFB3
         iKsyaoKleb64KXDpsT/ibqq/H1cYGUrBB9RHElSpedK1i4s0DvDRJjaGKng08ObmDqy1
         0C3M8QvIUD3EJ2gBucWn+a+f+V9rP3JWdMfN0coTUq+yXqdLaawJ7bNyChFAmnbbbRbY
         hr8+ZlEKXGQsSm14SwOcNA4G5tR2LRsxKQ+DKakZnmmsoE/x7CKfOTeYbxoBDkD5gVmb
         fjw/T7CXlPfQ8mExeVkCcd7MWRnDuqDcrE81Trp9AS/PsKT/uxFYJrbyLZ4e0P3Kz6cW
         oQUw==
X-Forwarded-Encrypted: i=1; AFNElJ+uTPciwIAgy6gpQo48QfhsoHyuUU0VIMK/Q4ETfjsDkQd6zDeHreZBECCiPyNSjN59coLXySxK5rM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrt7nBuxf1uiJ4RAwkrqMGT/J7IA+hmaEBD92ugpOkyLbnwbtP
	cyONurddPEj02zz1mPWkJkaJ8zSwZ9yxybrIZkkgn+//cdJFYDMPIh2JRZDIl5wHeVM=
X-Gm-Gg: Acq92OEUcfcbpeoFoUVApgqiCt04IsDgqVwe3QO1dqLCa70Fe4zKQU8LOzCHT5frNwO
	gSNtPpBy41w5aE4iqmGyPFp9dYMQGckcK9DO+1vAFSw08zn78rfEVpPxBYwFW/Q7veB0aEgyzYw
	yas+OCnBnRTn/Fz2TJucMn/lii6Qpf37f+sgkZ1pOPv8OL3/yrapGgE28FjeR4J7GPJ5QV+k4Ey
	5NE2zETXy0qu3HkrZeNleNm7raQJXeROyMSo0zRO9Lnf7iaHHvILeVDQXu3QGrr8Sn6ZWCdb6+c
	mwGyodpz7vU1k4zwsu/XxNDoZHCDY+nMKxMhlI9rHM2x8rZTis/JV5d1kXsw9QplvKtcuGCLGWA
	bVQ70AJi+SInyAVGJVuAc8ViLo7uNwKufSF28dQTBUjX37iePKeNwpkdBjVLhiqbhz7H3KthbKV
	ljJhCfJ6s0QrfM5Zs=
X-Received: by 2002:a05:6a00:b807:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-842b0e1c7d0mr21125579b3a.9.1781034677416;
        Tue, 09 Jun 2026 12:51:17 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm22197411b3a.34.2026.06.09.12.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:51:16 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:51:16 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: networking: add guidance on what to push
 via extack
Message-ID: <aihutHOO7Dwp8aQ/@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
References: <20260609190919.1139517-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609190919.1139517-1-kuba@kernel.org>

On Tue, Jun 09, 2026 at 12:09:19PM -0700, Jakub Kicinski wrote:
> Every now and then someone tries to duplicated extack
> messages to dmesg. Document our guidance against this.
> Also indicate that system level faults should continue
> to go to system logs. The high level thinking is to try
> to distinguish between what's important to the user vs
> system admin.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: skhan@linuxfoundation.org
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/networking/driver.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/networking/driver.rst b/Documentation/networking/driver.rst
> index 195a916dc0de..abd366dd5e43 100644
> --- a/Documentation/networking/driver.rst
> +++ b/Documentation/networking/driver.rst
> @@ -128,3 +128,16 @@ to be freed up.
>  If you return NETDEV_TX_BUSY from the ndo_start_xmit method, you
>  must not keep any reference to that SKB and you must not attempt
>  to free it up.
> +
> +Error message reporting
> +=======================
> +
> +Number of driver configuration interfaces pass a Netlink extended ACK

Maybe I'm reading it wrong, but seems like it should be: "A number of" ?

Reviewed-by: Joe Damato <joe@dama.to>
