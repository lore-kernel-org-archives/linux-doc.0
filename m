Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982E380FC4
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471339; cv=none; b=Ybh0lqG07EtDvFCA3ro2UPZh4gOXZ+r8cr+nqPjZWFrWmrcBPMksKvAlOaIdj1g86hLqJqzfKw6D5mcb1NyTRsSDAdYtskqxP54XDX6qJj4SZEj7pdoUFyI9Lj3UlI83t7FS6mWM1dJL4t2m9lcKUUR5T+8ZQcEB2JMQAYEWds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471339; c=relaxed/simple;
	bh=ggVjkFZct/5lkhmmHlU+eub6iJOrvUDtrMTPOvTQKjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS7THUji8BUy0nWSLnsFbCebsERay9MmBNWLOaMFrgxBPXV20HSSAev1N8dc99uKhMIPHsPmL5QSnp6/OT93OHoBEdXerXELzhF3o+X1mv1zlyh109tc7NO5EUYjcvVwN8hYN7hM7PJScRiug1UonTCU5OQ7nt8SWBqEfaXT3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cj+AG0yy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cj+AG0yy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cab973140bso114404945ad.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471337; x=1785076137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MC98ctxgW8MLeh3Pdj+g0UDjTMAemyH6Fuqjpns6SUo=;
        b=Cj+AG0yyzPm2H1QbwUPA+xkj4JJ4neDekjMC+vdOHCS4XQVoq9/XtUO7NDf1KxAcMd
         3MWsT4K1puDvTD3EueHbzQEAEnztz96GJHQ9SQq/axeo6YAc3BjwnOmjMh7mkGeMGgkm
         Xrud/gueaSkF8AYoe1kgcCcmd4sSqlwMOuNSzPVQMRKU+2j3x2GzIjY/i/zZaVLD9VgR
         cqgsR9R42hUJIA2i1Y+3/QQZJQwQabJNvEf8s8a2s07UG4EYLW39KjK2Y357CsSFInvT
         YyY403vY60K9RWOGTCQh31FxlQwFvJYfWL54G0woFAbozkftg1svXBM7n40BNUZYzteQ
         t38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471337; x=1785076137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MC98ctxgW8MLeh3Pdj+g0UDjTMAemyH6Fuqjpns6SUo=;
        b=DC+3BeNOUtzLCMdvatIC+tyfFuNqdjkIzYD8dS+6a2/wSdYyde0mSizsr9AdFArVLJ
         I39kPDrYd7KvxQTVlJ7SkWtGTqcdjXSR87ahe4fJs3IWNhrCrmDneexbdXofpZNnLSU3
         AOonAoS6Dzdc9kHC5dBCC9V4F6PIBIfVyTCRKpJe599aEhRmdKlSicJLA+cTy/42Ivkf
         1YJe+wXpekEQPCBtpVdtg5OzRaK8hp1JdZCwVW1I1g5RwmyeLATxLZWNG6iBnMcG2UWv
         sAYOAqKX0zs0ZhwAKcV9DZ1eg0UibEwI0ZvnlDqSu4IP1hq0Z4o2qqml6a9Izl0y/EMe
         A2sw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+eJ9DyvyPsq5vbRVciKuYS/aHWN6DxI1F1w2yyf9Y0eRWHYBi4PO+EnHBo10u2KK4z1HyOiOesio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8GTC0lfp18TOW6vAiS8zmHKzFyF1rHH41aVIhLR0b+hrrU92w
	1YPSg8U3aaG+TPM4NnCCDLqzw2TR0aBMeWSxoZKTJpjSsrRe0wXOPLvp
X-Gm-Gg: AfdE7cn9lit9ABTDn2d6nxoZtaJcPvlfjx7YCLsJn9renYTDK5d0HohoisrO8/kyqpf
	MRTaJUZe3mrt2lKTMmlMkGM04W9oGhv7Fd/Xkt3p8D/HePf7VEt4caDRYayA4tPEV+N2LP8iYTP
	uCzdUl7s5MTeonVEEWBu6RQY+KBAgUN60XNB6bboyz0B98Y1X+uoR7CgGHpyeJHWgSNv8Ze6j1w
	qbgiKtDM7kpf5t1hTKWJsy98JkCNnLIHNpyZC9EfApkWog7jwxw4wTZITWJT460ASnDiYOGgsEg
	Dg13HvwfB6jbSM2mzht7O/E/mxcH0mhWWRqcFGyjPtjVaqF2L8NsXCWIWOR7RSbGROtUs9Qzo93
	Z0jEuiwcVzYug83cpVfTBoYJd1uO6ymZhLEiNTQBsspb0Qc1MTBMtpyNr8I04bwKyinCtskJvKZ
	oP2++GD113a6N1oOI=
X-Received: by 2002:a17:902:fd85:b0:2c9:b1ed:eb5d with SMTP id d9443c01a7336-2cf34a2a308mr114210865ad.47.1784471337121;
        Sun, 19 Jul 2026 07:28:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346daf66sm41246475ad.50.2026.07.19.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:28:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:28:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add MPS mpq82d00
Message-ID: <bcf83c20-166b-4473-8d5f-16444b4434ee@roeck-us.net>
References: <20260704081810.1701587-1-wenswang@yeah.net>
 <20260704081952.1701914-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704081952.1701914-1-wenswang@yeah.net>

On Sat, Jul 04, 2026 at 04:19:51PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mpq82d00 controller.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
