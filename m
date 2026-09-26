Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33263793A9
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450978; cv=none; b=CCwlyU76ZPYEyjBdQvur4GwfJeC4It2MTateC78phI7ume72FATsWxN253+gC8yXxEr2SUkFLUVnsbBjugSHvbEWt1g2Rr5TdkAqL26UkfB0S1UvfGEg2lTgCb01DV00j2g5ygfQWtuLJOc9wFoTw+T+O6qiWlyqVlhjF3yk/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450978; c=relaxed/simple;
	bh=1ebgJkP09GKvWRwvK5F2YFranzNOE8JKc24FCxtrAac=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gbQ3QeHwxSU25H4pJ7Ma4sfWOd0DM8f7iLcC5wjnVgMdYvb8Emg3sUq927/EAcL8TQygLTDuDP56wWM2zWTrd/+HiHqMtGxni4DlUivT9Gv5YcpZAhugdPG5vk1ve16H/5gAo8CrpoO/LLycJhM1HMA+FZ4MzwYoNSo7tnL1QTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNVA/a8q; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNVA/a8q"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0df0bb2d6so390450a91.3
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450976; x=1791055776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=SNVA/a8qgKUb3gTUOZ71bLh9aF+GX/IvEj7/+R7clocKI6ceYsIqQxLVlGEEAXwKty
         O3r8ieBNfrCcDAha9sevmHF/A/xdcGeaZFZ1MBPOkQS+lOC562MAXY4fp1Gl/HoLADSj
         MUL3qzcxewg17wzMeXAl8PlDRRYUNLwHLWODcEvyM5avk9Vwag0V4EEQrUkXzIXehbcq
         fHay8THxNPJiVl3V+EKUrgQd+Bd0D2kKVLiFXPunkjZCca0ClkHU4VQwn16ETrVwwdFS
         lDw9Y1LerOfh8LwqR2TuTjoHN8FNemW3e33YaAtNKHKynBmLFQ5Tpjw5O9qJ3bo29i/O
         8Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450976; x=1791055776;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=BRudxdIcKniNb36nT4+aX3D5M7F2XAad4lWyYGdaHSsUCUjIUdxPpChx+4pu3o7+mq
         rUvXzKVsaCuQEA1KHM+0ziwD87X/Sm0W3sPQtkoivXGRum+PvbhZuikWPf6+LPUT+NKD
         I+gyNOcQyHdTqbUmAb7nPZP/MeFpQbh4Th3IFYAf2dK0XSSs+JgUVKRV4BUkKnpGrESs
         I/Q0+ijlAHanDmkUrgHxjPLcGwrGr/c/nql1jDgNNuOkgRio4F1/dTh1tb5yxg02g/SW
         2Yc2ZNGtyM+HCWCL6miUotDXbezWFWy61DlxMAb8AHcfvAxDlxR2ROR7Nki6+bg2iNNO
         bMrg==
X-Forwarded-Encrypted: i=1; AKwUvBzDvr2NHF3kLXXEIHG7sd9zcEW5+9jkL+bMSn511T+npq/Z9WBEdOEFOVXaWgrohAE2VaFLOoFnAZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZWIqRO49NdgSIgyDqPUq69j7vzh11KWfE6SwuOv+VQ2wxoCpr
	hPUGQ0LWP5TXxPzVvT5YE9JSbCEI8GV5yxu92/5Mb4wo2S/fUPX+p65I
X-Gm-Gg: AYBFou1JGv3ZtdHeRstPw76rt6G7AM16ha3Jpj/K8IFqsbZadaLLdVOLOzQQHks+sBD
	GKqLYtqbGJCL65Ywtw8cU/xeYEl529jsRiJNNbFtpkWDIN0SjCWguyJnVEptA4A7foRS5TyD9jk
	ZyCGrtLQmqkwjfAXje9KQo/E/pC6Z6Ya9cd1ZggHZjGnD7DXkqT5gciDrWQ1C5iE1k4qrgSK2lX
	l+8JeuCc7CD5Bj2AsXD1H1BGcI8zyiEU2P55fGbvjOdLiV1Wmx2qa08/tUhlbZXKROSij9v3Ke/
	W9/eQe2ELw2InqCCU+VdDRV9e2rTUmP5RM18w/hIyI5nPJ/bsrzKXBD0JhVeIz3Mul4tZjQ0hdM
	ebIbE1sHovxhnYRzuTmS8R2OlI/lYiT+AITY2d/SyKA61wP3j8yiMB3aCutsHfuV42deZARYq57
	Nzhp8IXhKlvmnQjB78/V9fkEHPxrgR5IomtpNvl0zvpU9PHMkuxl1XTQ9S+YpC8pX0X6NEAt5vT
	HgP98Id+dEyQ9BzdQ9gq2AkEpREJ236NWojyKpPJR8=
X-Received: by 2002:a17:90a:e7d2:b0:3a0:eb54:2e60 with SMTP id 98e67ed59e1d1-3a0eb543751mr1574379a91.31.1790450976021;
        Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
Received: from [192.168.11.3] (215.96.231.218.rev.ocx2915.net. [218.231.96.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm3564492a91.3.2026.09.26.12.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:29:35 -0700 (PDT)
Message-ID: <df064f9e-ad54-43fb-9b25-9e2869506732@gmail.com>
Date: Sun, 27 Sep 2026 04:29:26 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Linus Walleij <linusw@kernel.org>
Cc: arnd@kernel.org, Frank.Li@nxp.com, aaro.koskinen@iki.fi,
 alexander.sverdlin@siemens.com, alexandre.belloni@bootlin.com,
 alexandre.torgue@foss.st.com, andreas@kemnade.info, andrew@lunn.ch,
 arnd@arndb.de, claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
 david@kernel.org, devicetree@vger.kernel.org, enelsonmoore@gmail.com,
 festevam@gmail.com, geert@linux-m68k.org, gregory.clement@bootlin.com,
 imx@lists.linux.dev, kernel@pengutronix.de, khilman@baylibre.com,
 kmehltretter@gmail.com, kristoffer.ericson@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/09/25 22:30, Linus Walleij wrote:
> All right, now we're talking! Could you test and review this patch:
> https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org/

Thanks! I'll take a closer look at the patch and the discussion thread.

> I do avoid touching the v7m path and it worked last time I tested
> it  (on an STM32) but I'd like to see your take on it, AFAICT generic
> entry is not really possible (easily) on v7m because of the
> pendable service call mechanism but maybe we can think of a
> really complicated solution? ;)

I have experience wrestling with a PendSV-related problem in an RTOS kernel,
so I believe I can contribute to that part!

Best regards,
Yoshifumi SHU
