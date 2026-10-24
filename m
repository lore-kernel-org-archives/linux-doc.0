Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854748;
	b=qCnLpe1Tk93UK0oht83MC7R4Kia7OdOrZtYoQLoR+ldYow94WZeOSfEaFRY4T2S81aqw
	 P52+jG98fS339VGkxnL4ShRRXek1fcuKY0obGxodT6hy9YeGrSekUtFSxJOXYnvA4tXDg
	 qE/1AaRSH5VYSxTpYW8bAGLI2IkyXdxjyjjry0FLkhq4ogagnOH6h2TsLeg6ycd7Akswb
	 rvMyd3jhUWCp9qjQbmac1TuRwf2B9Z7h3M0YJrWR9RjJhJDAGrxLlzfGQYAo9KGP60H6p
	 cfKxhER97kny3hQyOmcb8NyPAOV72mRFiCEf5ECVp7M1CG/phi3lykZylw2FIfJwoqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854748;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MyY2jy4KUwx/K3rgfa29m+xcrAnt+SzmlWOsNDROzng=;
	b=LcXEb+/kizFTBYuDBw4ejjM5pWaShx3/LaN1SC0GkPZ1o16tQWAVCk1OhAieZg8jcIvQ
	 gSrKzaXtfGv7dXgCAQX20XXtMY2AQFQqm5uMsw+8XJAPt7R27rXmVm96Op7m1X0f1wJ4g
	 iJ3hwy1am5NeTwlxDMcaK9+vuDwq24qQtJO6BJWHp18ESb25qnDYT6plHuJLod4qP8ABj
	 MikNGvWGbMcHinXFyOYcmVo0Tdm2nyjpRtn3Kg6xThPjJTk7MBbsyETQSTYSO0W/Jzz/D
	 hOdko+uLDpTsVRdKNoc+MlaobOSBjM9dImYa4i9/sAHBpCdLn76BTfrCj0kn2aaGkaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hackers.camp;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A2606A31E
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 15:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c5b7d5865so254578f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 08:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854746; x=1793459546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MyY2jy4KUwx/K3rgfa29m+xcrAnt+SzmlWOsNDROzng=;
        b=KpGWJ9qI6bhjwAlZEsFzkCcAAWHmMxSFpjIhWHOb2+CgAF+Pd7tx6QmOCUD59rrv6S
         uJLcT0IR3d1Jh3outKKUBayg02xVE1b+j/GEtfro73BmlCfurl1FTRfTf14rOG42G1n9
         nJUUUWmUm/cIP3iMIjXeEjZULlaLT/Jj7HrOUHuuPIik6Vtrfek2Se9SicrqnParFNL8
         bKT4Vw4nxAeFX1MpFhH33ITK9sMnrucJj8MqAuQgKWOTmSix+eLn8f9bKQgNDg1Zq3YF
         wIjM92inMr80JlC7tGc/LKg112l7+6S+XIXlS5Cdh/eCXML55f7w3BDB2Be7liHML3gy
         YOwA==
X-Forwarded-Encrypted: i=1; AKwUvBwuP5jqfWVa3/j/ZB0a+YwV2VPb0fZ9ptk8UxpA6cmVUZNlhy10HpaQfgf1jX7Sj9ByXr7GAClthJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFc7fgw7EVp8/0PkG4saGavjpq4V3Z+Uv+GMTSk6C96R5J+ybA
	Xfz9SKO2UxxIDXQHSV55T4jIphnJi0aOW82g7ABClogASP6/5Sqo/rLb
X-Gm-Gg: AYBFou2o+Y6d4IH1UZmoAnCjER/0Ds7sXUPJEpPNEnNpMHsdqXSTd2SWl9jxKpZeXzy
	6yDG6E3UTcNLrwcl+BinUrjamOlm2uf3+MswefUh/HPLlLCCK0SQUDFhthnuxiNSCYSKdxjqIHk
	6wuk47AzN2eSfH9QF7BAWWY+S4GPf+nL2cXXMGZ5SirABYtDhBz1Ab4oBheCaNNtXvDMNnWg++O
	1vpmC1RWztM9tDwUG5Kk52HxLvXymB30kGtL/zzmVaVLudfHQfdXl0/jtdsw0kaPp5rnU+Ieml8
	CIh4aZj9/gpJ15vPPbODvarPM2+N8RtD3vDoqG6amvEvv3rF9DZGogBS5517XOx9/hH2vZazO8X
	EoT7cjBrWCU9P73ZxFfvnW4myFGw+RuQiS5yPnGLWwx+WMJcMQOUIpVhokYw43Td66VDBCmaMwQ
	rQHk7OCKzcQlcnwJhzv4m2+4B19vAr5NmwpG4VDV5DVwsrAFB1UXdqAdPXkFpmXY18QhB2Cg5My
	BnynHDT/Il0Dp5wfxVBNmvNuK+HA0O4Ay1vY7TeLsJQt5zwV4z9Soi5mphzcG6O1FdfOia2biZ8
	CTd3NgrhV05O3fWJYBbOGUoK9fawKKwcvQZaLdY=
X-Received: by 2002:a5d:4245:0:b0:48d:f4e6:7b2 with SMTP id ffacd0b85a97d-48e3eb8705bmr2186375f8f.3.1792854746356;
        Sat, 24 Oct 2026 08:12:26 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm5353538f8f.48.2026.10.24.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:12:25 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: rdunlap@infradead.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org,
	aurelien.desbrieres@gmail.com
Subject: Re: [RFC PATCH 18/18] MAINTAINERS: add beamfs
Date: Sat, 24 Oct 2026 17:12:24 +0200
Message-ID: <20261024151224.47953-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4ebbbb17-7833-4a2c-9e7e-b3c731873caf@infradead.org>
References: <4ebbbb17-7833-4a2c-9e7e-b3c731873caf@infradead.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/19/26 11:38 PM, Randy Dunlap wrote:
> Entries in the MAINTAINERS file should be in alphabetical order,
> so between these 2 entries, please:
>
> BDISP ST MEDIA DRIVER
>
> BECKHOFF CX5020 ETHERCAT MASTER DRIVER

Will do, thanks. The tool that places the block stopped at the first
title sorting after BEAMFS, and in this tree that is LPC32XX DMAMUX
SUPPORT, which sits among the ARM/ entries; it now wants two ordered
neighbours. v2 will have the entry between BDISP and BECKHOFF.

Aurelien
