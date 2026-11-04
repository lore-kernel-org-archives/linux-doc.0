Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782385;
	b=tHLBn4qjpwxw6T6eYTwZvwcZVfm346IblNV9vWAluzy6wKBlr3Aa74cG15ED3pdkx3xH
	 JJ6y98ATy+JJG4Xw5SsMfzSCKe/PwgBdUyunCwWsT98QbLyNx3g6Bcwrsz3belsZRXNVV
	 kCZTHR8U5FBwAZ95aejNk+FVET8nwu5N7QIK6/+VKJmrM8CE3igNttW0DeMb9LiiXxHVG
	 TTSceqDsWMP2ARHjd3fP1Fz9OIzKQUnR7H5OTbI0pu9S8QHDSYagL+Tz63z3d3nxWs9bp
	 0JzqsdstaN2oBX1KrdRFewsUndI6riPZrI26Z84+LLINqnqIzKxknjBX3rBogutofLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782385;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=yUcMHykGBsdlMngLe5E8c5GRiAK228iYooBSZKs6auk=;
	b=34u+1vORz3bnVvhi7IVUZQb26ybDmurFJYyUitje32fpbW9G7YE4QCY9I13Sg000iUVX
	 rHOcp7JQ16XwW+2josnAehZOw8vHsy/8xZcIxddQZDgDkgDK0nKKEg0eEL5hH7REVpPLB
	 WKZasrSZ0eXa3bOjfERcla3Op1NU8cjFPD93D73NEh0GRMcYWKKqV+QPe98HPeS7xGXkQ
	 XBOK72jlDvoz68P2V8MpU0NNP/VX9u2hU+fBQKXtyk/qCToW5CIpACE3X4guAqhjo0Geh
	 hwNQKCbx6UsR3LKXcSXS3TjZLvxbPEUVdZ07ZYVDBvnkGL0W7kaq6PK4wrEjWZEPSyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D92606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 08:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D92606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-846566246e8so401484a34.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 00:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782384; x=1794387184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yUcMHykGBsdlMngLe5E8c5GRiAK228iYooBSZKs6auk=;
        b=qWsMCe3gfa/1T5YcamNIFKLqF8S7iMHRDaRzU3NXPakLVje5v9oicU3jZWsDDL0N/Z
         kYct5wWTEIdoGyKf7hddOR66MOE9TuzNaNiIViUVqwH7o0NaVsf7Qw8E6F6s7JXjvold
         /55YApzM5/Uek5Jm/Tq2Q/tz1xn8BOXm4dUldQhCSKJm2OEZtja7dftwFdYft4PZW9+4
         p2d0lx8dPbZSD+gjgyshBkbQwMssuc8G91Rn+HLcHtnKJPBxG2Zvzr3I7jFHoXgdru+I
         BslkG4lhBAgiEQK4yxzFrwnvkQ/CuZTmTl/iYdv4zQzZb/OgJWqAyn6o4Tit/QZCHrJp
         4UOA==
X-Forwarded-Encrypted: i=1; AKwUvBx+xptNqEyE8p30lL7+cAbZg//0L41psRK7rYQJv+GkuRoIaroLhJia//tSaa3kOZ5LaNHiTOEtndA=@vger.kernel.org
X-Gm-Message-State: APuU4Z83u79lvgH/AdIc2zSYMVtGMv8h4ybCljxureuGwfJcZzr6NrDE
	db+zL4JiKmkuFcsd+cFox35GyWLlyL2gkuGj5wlG/nyKAYQB/8KDri9cwilPlTBAK9A=
X-Gm-Gg: AYBFou2bUO0s90c5wYFTt9X7rvo5A7jtQek48Fh+qFxZy97jLcYbdxPZoeW5egA+zQK
	hwwfndyiEfiUrG6ipTZ7vGDsYcV3GfvW4g0dXwwipJzi9az+bBtrLiEb223+UK46bzRFkUwAOZd
	BiF7KGCbJvwvm5zHR663MPc9/xSzoOdePNbPumrOA5frMIGu7fuFEPtfguj6wwzNby2N29rWqvo
	DD0sgmCbM5e12aPLX7Kez5dVvtHoqreH2+LDLTnmw9usELRKWOeyWX9qLggSCycQelEd35N8+nr
	OjQGDqyaeFxliF50yZlAb94IUgq3LTXhciTYlAOFdp2ovNmYg41pjgzSTApoUPrdtKAaeoli8lE
	DIV2ENn3vm5UVqtoAoqoGu/dwOZ8/ubTHDaPjPozmpkJXr9Fy52Ae4JsBtZEaeOpb2Ib5nnwqly
	pQE4bSyAWxGkpj1Immkirw2/B1EPVwl5cUvmid98JancB9NZjOV8WbLqHqmjE9fQU8XDwGYJ8b3
	Ny9DJQH0Drk5LKNFozjRdxSG2foT4P+KU0MYAU81F73sCy+JhzYEeMAUgm0Rua7To0IRPBGe4B+
	iGBcREjf/H8WUN+iUbVEV5qkRDccToRUfrnGxK4tAdrRtBwA302DPxJKUrXJ3f/uUcH5z/Rdcfq
	2MtOmcFkOCsOzfVKhHtuRrtgPRWn/MQlu/vsAt+Eo
X-Received: by 2002:a05:6830:680f:b0:804:e0e8:1a86 with SMTP id 46e09a7af769-85d3611ef6emr7791355a34.1.1793782383496;
        Wed, 04 Nov 2026 00:53:03 -0800 (PST)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e55906sm1384025a34.18.2026.11.04.00.53.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:53:02 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a755bbe158so250133fac.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 00:53:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxdojbFHju6mWlr/MQIBtXa+Zc7CG2Z2A10zmRRum3YIthRobtHYpR3fgnN4GqY5YklifZn+IMBtJ8=@vger.kernel.org
X-Received: by 2002:a05:7300:c5a7:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-36ca1bc68a8mr2873501eec.0.1793781881630; Wed, 04 Nov 2026
 00:44:41 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev> <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
In-Reply-To: <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:44:30 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com>
X-Gm-Features: AclHuK9nnsy6U4khk5cNnlQ4F7O21MbUU3fY_2pf7x3dkjkCudC-yc-EGP9flSY
Message-ID: <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Drop.
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings.

Thanks, v2 drops it, and the series is clean with checkpatch and
checkpatch --strict.
