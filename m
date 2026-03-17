Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F52F2F6170
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763629; cv=none; b=jHMPx5TEW+/HwLhIhItt1RRsMuzV5g+lGt8DR0uKrncEXr4sAzqlLG1FvWiNg2ZXFj+fNbLNc+DOv/mqPg9rUU2QRi4vuivxmdNxeiy3XB+yqKp1w4o0iCLM9qh+4P03aWczVMBdt3823S+ojuvdMD4Bv+8xkQyrLUUCx4vpXLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763629; c=relaxed/simple;
	bh=8W1wLcDuGnh70heYzZXk1lmp712fZJuM8sRYD3B3c+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwSRWecZMxstVf8nq/nyaIEt/BWc/dzkRZD/kYoWyTnZqHFZNarxCVbxWhkx8H9cZZGbC2CnfFaFZNc9tWuWJatwiZBbhEX6FxB6J+xPRX/HavXGN01vhSbPInsZndQMxmVqLd5WzX/2lc5Z8kJ0J+gu25TxARrz37YbeYpHers=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9oBrIjC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9oBrIjC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b042533de1so20013845ad.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773763628; x=1774368428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzkNk18hc0Wjw2irPNMaFA/+tdksSmqqnGsewo6/mYw=;
        b=K9oBrIjCZ1b8lpQpwosLMgRyEO6dXVhuti63bFi9hsnSu9qen07+lAA4xkqcv5JQNu
         KYeRl3ZccP+SEEAxhV0r0eaPpGmpuwkfr+yz3LGbYAe4Zky+ch+9+vlbc1ZlKGSSGtEA
         aEJyVr9LB6QD6Ze0eprOCe9ODthV4HSdDvvDUT9RbVSr8vw0bH6Ui2YtBpbVO5TpP2JI
         YuhKRvkQul6lPW7ZxpqhhDbpValJRm2ssjoJHg/C1u50lEYDMFP5xEm+Mn18eFvN6IML
         JMLcecKS4D4nFCtNy+sDZGMbJN65LIvAIX+qBCCosPuWQJr5cpofukOseUKDvlDDrTSz
         3vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763628; x=1774368428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mzkNk18hc0Wjw2irPNMaFA/+tdksSmqqnGsewo6/mYw=;
        b=Ztb6Gg0ZedKBEz1M4s+XTjOSFohs7as+4PjBLPO62+AMVOsDzr8xJHkwp4fOw+/22s
         1alY+bc3EIP2YaNJTD95R3DE1CUQkWFkJTPnOFvZVXDM41gKEZcnYW6DHZmXW1HjSaS8
         JXvpzcMZqMeSLDTEJ/xVmH7WeclTqY65xvbI7laOv+x6csNGCfTm6AGCMW9MoqbNe8af
         k2QJNYKtMnBga3NIuuZAbOBf06xkGK23gjCEgcWD4rNxAP24b/NzmxSC7NFlVTJYpJTC
         3c/sCQcApDWLFUy7PO0VX28F1Errgt008FJNNVmi4drT7yAuAuCFpYTTbVvCv0rdN4+J
         UsZw==
X-Forwarded-Encrypted: i=1; AJvYcCVHeADeqDDA6gDDZ8BMLdSdLtTiLL89SFkIolRRJHE6symjRGEafqypoV3ckMAKOCHYXBXm12HREtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1J2XilzbTaFmH5mJL1MTY12QV39dSaYLpVFR6dbfd+1qerEYQ
	N5yB63aumMVHqXhL7hgL7ymdpSTB3EKTJmlq8tpu+CdNQ08q6Aib0z0k
X-Gm-Gg: ATEYQzznDgfnuvM6R7ZT4AotYvdRjqoo/cslV6Ud4fwEJYVpBjnx4EXofw0XVgdrMyP
	u5AJZhhe1BoU3oJ+DH3iaFGH5uXOKQwJd3zeWgeg17ep50wEU996HM69sZGMboOWaKN0olqF4bS
	M6SO3hs7Pe7sWGXqPxn3K/gA2cU0WXKqYedvC6tCaQFjbItPdkdCA5qssGl5GAdBkVFr63p+Haf
	GeYlWUCS/G/kkfabH77K5OHTx7wnPONKnMAaCIWf4vdudLIBbD7N9YwPbmDQPKnbXzjfGqbZ9/p
	7DpXVYwajB3R8HNM0x1Mf36J6wakfOxsHzPs06GZnWxtZxecpfn/ouWgoPquk03fk2vtrd57mlC
	v/Zk6D1BTTLkp7PzgQ1qFGsh+b2yCnwydY2Qap0WyWunKepmtuqD2a/mlAyjoBdFJ6lbI20F3q4
	79yDUOIPrZGajEmb81mn9+P+0n1IIF2nQyevU4
X-Received: by 2002:a17:903:2282:b0:2ae:6579:4795 with SMTP id d9443c01a7336-2b06e35b4a0mr344755ad.21.1773763627779;
        Tue, 17 Mar 2026 09:07:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece594b4fsm136171625ad.20.2026.03.17.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:07:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 09:07:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <7c5667fc-6650-4f0a-85a1-1b9c0beb33d0@roeck-us.net>
References: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
 <20260313111955.36811-1-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313111955.36811-1-aureo.serrano@arctic.de>

Hi,

On Fri, Mar 13, 2026 at 07:19:55PM +0800, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller (USB HID VID 0x3904,
> PID 0xF001) with 10 fan channels. Exposes fan RPM and PWM via sysfs.
> Device pushes IN reports at ~1 Hz; PWM is set via interrupt OUT reports.
> 
> Fan speed control is manual-only: the device does not change PWM
> autonomously. After applying an OUT report, the device sends back a
> 2-byte ACK (Report ID 0x02); the driver waits up to 1 s for this ACK
> using a completion.
> 
> The report buffer is kmalloc'd per write for two reasons:
> 
> 1. Stack placement (suggested by reviewers with __aligned()) was tested
>    but hard-rejected by usb_hcd_map_urb_for_dma(), which calls
>    object_is_on_stack() and returns -EAGAIN regardless of alignment
>    attributes. Confirmed on AMD X670E with AMD-Vi (IOMMU) enabled.
> 
> 2. Struct-embedded placement (suggested as an alternative) would create
>    a shared resource between concurrent arctic_fan_write() calls, causing
>    a race if two users write different PWM channels simultaneously.
> 
> kmalloc per write avoids both problems: the buffer is heap-allocated
> (passes DMA checks) and private to each write call (no sharing).
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> ---

Please also see AI review feedback at
https://sashiko.dev/#/patchset/20260313111955.36811-1-aureo.serrano%40arctic.de.

Thanks,
Guenter
