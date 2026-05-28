Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936773438A1
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 05:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946328; cv=none; b=APCVA2La8BrZssQc/+vdOCzUYbp8vDnhZy4eK+ckPJmg5giNrlODSiJu3BzEC5SqpdlYNM1fRQ0x2ZNi66txwre6Nr1ELACBFYS4L5lkMTl3dcLCGBMCKpPZUplRkWNXnFktmWGCzmmd3bag4ZPAgn8HiWP/H8GrEp3U5aPT3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946328; c=relaxed/simple;
	bh=IK1Bb9AuJqkHv96iXJHC5mPYMiYpKU+zCrPc1d5SoUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rc/giXX1yjhDFAJLq+1OGwl3zKicojBLIgjqvZGEpnIBaeOzEtZARULe7Ou6b+iDl9CJzEt7i2C6r8IefSRyy16IlkM1v3Qle+OLehtX5XVZZeYODLMoiPMEWctJvWgI1pSXM9TnRGPdj0Ft3uAhtuTuxNHbkq1KqQGgnAuvK4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncEBLQbH; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncEBLQbH"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-136b46c3540so5171684c88.1
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 22:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946326; x=1780551126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m51ObGqxvbRirSNNGuV//C4DnnfvAOGn+7qB5s8zlHc=;
        b=ncEBLQbHMvHTAXzsg6fSL1Q2WHWhxrxg21cDJyqxFA+tTrQfO4yaaVD+vmb0EHzwXF
         483t8BjbBWwuOrO7qH+J/NZVL5zYxepqv15b6aPnGnvEVmWX6pASjq0IkbFwAkTQh9I8
         hwpzOszSSgYn2JTbtxrh0MTrhd23NQ0YOsM4pL0Xg1fNOtxvog7oX9dcDx8OSTcw7DAj
         FV2hIZlQZ0U6Q82zfDUc+9XB5B80QZZRBw4xPnpzOSxls1IYxfNeJC2XKo4bRKszQQb/
         CN7sjPsYdkybubH3ARplg4x7Dg5mwzk+OpdlfqV6MX/srRKRP/0YM0AjCa69AgXSo79Z
         BQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946326; x=1780551126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m51ObGqxvbRirSNNGuV//C4DnnfvAOGn+7qB5s8zlHc=;
        b=lU0jLGXS8cRAuzrl8eFF2/xNz3Br9KVb9POzOVohvE7mTKY3A7Brd+oSjvQX5G7Jq+
         XrGt7BUKuutto7iewK7y7ilesvUSb3QbXrdb/ihrmWsRuSPdyIWC4SjIFMBJG1iCsESk
         cwvZ2vBnWnhPDXFjyyuUokJaUYbeXMS5nyxH1w1UdM//f6np+q5NzOIaIwINnNZxfYv8
         VI7VNYzrddUwNlmmivQVTkxXv7PZjuJJcDq2gtr9v3bD22cEiaTvgXDLgfDyA+c5DfuZ
         fKUlQReAdAeEv/sIjFz2a47Zx5wd0CYONTAGGfYql80BCqOC36mMqh5BsvDTtngnVzvt
         X3Yw==
X-Forwarded-Encrypted: i=1; AFNElJ+pff8j1YFrMIFqrVZ2PICUT+LpEnOOVEIFdyHWz8ok8J9L2KqrgLCavj8dBJMcT2Z8rHNyYpOoEKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfkg60fZ7vho0oZwifwZWysezNTq3j0USryPsZcf7DUgFW53gK
	dNE4EfDidZ8nhlj0AkJGs0X/fw9C6H0qC0yXuLWuHcFmVj/aX1RPek4D
X-Gm-Gg: Acq92OEX9hDVZaDify4ZHBZD5ARL1BjTT9haRlyaBi0D5vlKhZP8f3shuQwzK/loi9T
	Pi0vY90AikeYHz+/83kk2YmezaDwzDiGQOmF9BPmoOoGtDJuArYQjiHPX1t7MMuVyKI2HNVKguV
	nkNVgrbZyjbJvpYh7NqgRU+p7JHETvwrtErmMSRrAH++lUUfq+VgPOL0tpzLvopmJii6Gxe9MyR
	fRHws4OAWRRaEdsX1WtSgNzvH+L0sdf2d9GJl7ZZwoLWxYh9TSqMvlRQWE4YOnw/gwDtYHHthJo
	ZA7noaiqj7ilz04kFUU9vtxZHt8P1mxFGd4GjaEynbAD3vRNA3zlvLG/iUP14NZBZJ4tyEjkgrp
	1Vzwvhga3h0tMi5tjS6WfB4oLOvaL6UfjV06DvizwUNW71W1N7iAuoEGkhc4b0JY79MCj79G8HR
	UOPhlgeX3Wxn265r5K2C1/+iVit5iD1iRmNj7CHwR2bfjNQypi5ZHsSa+TRi4k/D7Fs53Iusri4
	mo=
X-Received: by 2002:a05:7022:6093:b0:12c:6e85:505c with SMTP id a92af1059eb24-1365f70f672mr9871005c88.4.1779946326427;
        Wed, 27 May 2026 22:32:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:ca8d:7a6a:7fd3:5948])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b2b1f2a6sm9493424c88.4.2026.05.27.22.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:32:05 -0700 (PDT)
Date: Wed, 27 May 2026 22:32:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
	Denis Benato <denis.benato@linux.dev>, Zhouwang Huang <honjow311@gmail.com>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/4] HID: hid-msi: Add MSI Claw configuration driver
Message-ID: <ahfQW54YoHj2Pal_@google.com>
References: <20260527222122.10620-1-derekjohn.clark@gmail.com>
 <20260527222122.10620-2-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527222122.10620-2-derekjohn.clark@gmail.com>

Hi Derek,

On Wed, May 27, 2026 at 10:21:19PM +0000, Derek J. Clark wrote:
> Adds configuration HID driver for the MSI Claw series of handheld PC's.
> In this initial patch add the initial driver outline and attributes for
> changing the gamepad mode, M-key behavior, and add a WO reset function.
> 
> Sending the SWITCH_MODE and RESET commands causes a USB disconnect in
> the device. The completion will therefore never get hit and would trigger
> an -EIO. To avoid showing the user an error for every write to these
> attrs a bypass for the completion handling is introduced when timeout ==
> 0.
> 
> The initial version of this patch was written by Denis Benato, which
> contained the initial reverse-engineering and implementation for the
> gamepad mode switching. This work was later expanded by Zhouwang Huang
> to include more gamepad modes. Finally, I refactored the drivers data
> in/out flow and overall format to conform to kernel driver best
> practices and style guides. Claude was used as an initial reviewer of
> this patch.

I wonder why do you need to roll asynchronous probing and asynchronous
resume by hand? This I think complicates the driver greatly and forces
you to use a ton of works, spinlocks, and checks.

Thanks.

-- 
Dmitry
