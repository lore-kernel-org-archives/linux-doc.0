Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794956107;
	b=OcU6szc7owjrxr0u3+3yoPEShRlqyRbbVGDAT3V2oknSduttI5y/rqjoqsohQauze822
	 UC0Qrj2gc2fMSurhvMEplLY0LZXl4W9/441IkcR+S/2uH6CaC/7K4O4UxxS0Kt5cDlVZz
	 zEkRmznIy2C+yABHWTQVQ+TUjeWPtVpm7CGeBjdbzdo1LDBPTYE6ukJ3iXIhC9M63zPkh
	 Nf+192utFvJmbY2nSa7lLvY+Z2nBRTlwRF0A/bRDlIzsIxZoC9nso0F1nv6aHL3J3TleF
	 MHe93nJJYj5IaIUFiC7b5W5hoPWHVV5Y96Mfiw06/i6DyCngaRjH9JIzYm4l0BdcCwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
	b=0e0Q7SbAIxJPNXGF1nbZntgmE4AgQPGDcIhjXi5hQZrYETknQFxFuc4wusBJ/LKEiYNe
	 YCfvyNceVP+taK43NZIfvaRUbAA6wePQnTrXYHgNWd6Ab3fHyOrYwMok3mEBesJliDfQV
	 69TUOIIW0RalGtXH6YMmThjTRmQbIuriQ1+gUjhPeHxEPyYL9QI+x1m5+TFyDi3NTSXzP
	 DRrOQcMV0lHcHZR0Xew4OtM5Uw0o6DuHicEOqKwkXV7/jyFpBcBM9BSC6JjZJgaI9htbM
	 bh1W+ZOJ+4vYz4UY0oj85JbAiVKZJ3nzXT9asylqexKKjk2g6UMrJ5RyQSIc8aVHdvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NPDWNUn6;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A205B606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A205B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NPDWNUn6
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfZUc2494089
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:55:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=XTWULvHY5M+
	9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=; b=NPDWNUn628COc0atYZ/CbMaWxG+
	0TNGfxRCGsv1WrYANoIZaC+tKoYjD5X8kNmyXR8dpBZayuNDuuUCja+hWrjMqbQc
	XxkpdvsWiVArTT9UJfikfZbnelRb/DRpVlYgtxXFa3XtPyVF0540TWjYmvrsqO+P
	R+hi3LRmruY6Y/3r56HGQKoFy0CaepMpMmZG4klMBviT1U+1fEaeySnvKUF8n+Z1
	Wfi1IZWcGzocGnaz/SNYLQqLT3qgJR8XlBsQ+qKgyEYQQVpJE2NW3vnlCVKHFSdC
	M3nFonl+TButab+DN9Vmtl2UIUTzMNzzvKDIVO34G60V2AXaydz6Pdka2IA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu5g5kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:55:05 -0800 (PST)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so224977a12.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794956105; cv=none;
        d=google.com; s=arc-20260327;
        b=U2En8UkarHC7m7gFveu1qG2eKuO9N7l3BinhrvoJrQyMiilSUZQ78AoHJhdNBXxU4r
         JSEKHc7rxaBPD0bQMvpQbDUqdV1smzDMLRY6qvNUvuhVI36IpFGLbkMp1Dm8R0JgwyIx
         jNpi0GxX9iErwR1NyAiEcXlRZUGsb5aGD6V5pRZXHxIj8YWaBsIeqiFRA9VjMS0U/6F+
         73jh0DF7PQaxV7Qg02aQYVNK4W2QQnB2gD+EzEGe+EWKlWUFLEEU3dquNH2LOwlW4Rsa
         xgVAxmy32miHoWBiTDgYfKHQtPxLadeOONQptSO8OGDocatv5WBC77YtK83vdFoPF5E6
         RcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
        fh=ii1FcDUs1VPlYURj8Xwzxm49JB6MBIkW5TtDJoeRQxE=;
        b=Tul1nn8MNfBOeLzmiGK4Z2tp0JXnunVG4qjDhJohDZh62anEnEB07MOOMzCHykl0zq
         O/BhCUJtgCP3z1S8aA+Hc7gna7YsClKTUH+Zng5FNYRlupdNtLtOrrAXg/oaa3ypUSCy
         gCtMNvF8BAh9mD5hI/DqzCZr7G0IUgpH797EVLuWhrwcey2ypJoVhtTmo/eYffkeHkhT
         jDZ8UgVyQS8nPuLP+/YdkTZhoamyHUjl6F2Nb7eollrYfn79E0h/1teiPPQKKsq/do2F
         DIoJGdWWBwTbcWHaVfCVPoZHbAbivZDc4GFZCkpPzUAlUor5KI3hI+0mjWyMS2N+kIyg
         I70Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956105; x=1795560905;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
        b=asc4llnKWpsKG1frZOTgxA8SFsqPoWwwKWvIrMR8Geek/XHlDkqDhLS0mKzq4QnjlV
         YYsL1f8E/q0EYr0NSYBZwFZC71TX/d8AVCyZgEPd97+8c4QXWoUedR3y5Eov8hnSisAm
         z/+8K2WEWFZ7qnLpu+xwtK4xXmphB9o835jbvcdAIjD1qeHdClH5lw5sDKLUEjtBvpxt
         8DdBys7QflRw3uIaNDoUlq3Tk0hARK7GmP2mZs4Y+EQXJXYPnz74y1kW24IvuR1jACZo
         qmUbeSgbXGo2P6LHqwsfZ/AJa652jvJXgDQIPsvtAMKGmJ6Vslks3CbDyv51WWYFXJcX
         4V7g==
X-Forwarded-Encrypted: i=1; AL+hErGj+RL+jFK8J+cQm4euxgUWdkz/gCi005/od9/09y+U8IegDnoXEANHhYuxzCaqfLqcVKEKUnafBMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b0jEpdfa4JyM8lE60JThO9fuSbCOpAHDwV/EKj6sLXX4B5yCk
	e6KCysY+D/DskhYE+QMjezrJRmXBRnullyJGTCyBbN8HTDsf99f+KyC1JfxK449g+O1CTobRWaR
	3jraRTvVzleDHyEbLkqbHya+UHoWiw0aTVUbMl3ug5qxMcvlRdGfcA4quxc4yj71Kskl5YJ1Z9+
	XdIxJKHmiiFfH2+5KZ1wXaGXZf49P1WD/ln/c=
X-Gm-Gg: AZFdTZf7tCY3lbxrUG7K0yIp541ozj6n/W8cWNea/xmdWbrjVUtpYaXwdwmqWJnLIiS
	F5ZaSr2G8WDOtVykg9qC1HPcg+vrXc4YAai77vBFqGJkp/RkCIiEEpMtfRvnHOFOKYEKKk+9BL7
	+hzTM67LDWdy+B3QyC+qVEzFuR5IPa6pQm+BN9xqIGqsrT4gB8hJqxG4HPb53EY9y0kuKUDWQa5
	TAIS70KKtGUtoGkvIRyAnOVf0YrPx/KIbk5X3KBIMDWONs5Xoc=
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b3d0640f3bmr891152a91.6.1794956105125;
        Tue, 17 Nov 2026 14:55:05 -0800 (PST)
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b3d0640f3bmr891106a91.6.1794956104611; Tue, 17 Nov 2026
 14:55:04 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-11-toddfreed@meta.com> <179471270629.2199510.9480561958902023552@kernel.org>
In-Reply-To: <179471270629.2199510.9480561958902023552@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:54:52 -0800
X-Gm-Features: Aa3M54pEdqPp10DAjnIjgsYaaHWMRisY79HeZKYFQbRbnu5DENxcJuo9y0o8SvU
Message-ID: <CADh2yMxPrJZNtVdCgQWkHsKBk0cnAZ-0RiVaCMquQNSH8K32Mw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 10/15] net/sched: flower: add psp_spi,
 psp_ver, and psp_dev matches
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX81AQnCGkriNR
 P37Xe47gjQmvC4+R7Y1xRnb/DF93RwBlVpW5USx0sK7pKj/iOX/n++h+2ZRHNbpLEL2HTgKf50/
 1s5ApK0wwbRBg4x5mrGCHO/yJa4gUM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXwhnZlhgE8Mwd
 KaAjrkyjRoz460WjopLTVN+EzTy6zxVUq/Y4V1jLqAsowULyqIL10GUUlk6eMUdz/5X06B9cS4L
 qOBcVhXQ3vagTbgLlG+SRthaIcYcfI2WOwVqNwGfGw/2swhWK5TLmD5UqnV008bOeuEZAKxnhkJ
 QNC0OHyLKKmwvXm4BP6L52FlqtSbV1drV4CfsKQUMF0VaI95EpU4pgw3AGg1Y1VrWGrXYDTKyPx
 pj1rEksO1aHjinXFHpDIr2eRUPUsTNDdktv5+svFji3asM6GaXaupicXEYzmXTr3yJXcXN5wI1d
 KFN9uQcx8lg0dZViS1TwkAiwarEDHkCD4KlOKcsfQETMwrVZ4mmZXmak0NCpV7TyHPTytTz5qW6
 df51lppHXC1Md409/Um/h1i+AfobsoocQuRimSB2TcGU28g9NiX2X7rGfkOz2TKBvkFUuHEJVmi
 9+q3QZ4DsfMSNNIM7lA==
X-Proofpoint-GUID: CYk-Eh5xmSn9QehTw6wdmXv7TSySldXO
X-Proofpoint-ORIG-GUID: CYk-Eh5xmSn9QehTw6wdmXv7TSySldXO
X-Authority-Analysis: v=2.4 cv=ftRJ914f c=1 sm=1 tr=0 ts=6afcdb49 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=e8l9bKk9WhIOE85pT1MA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Does the commit message describe the right failure mode for rules that
> are still installed after two key rotations?
>
> The commit message says:
>
>   Together these matches tie a rule to one association, ...
>
> and:
>
>   this means that a rule matching packets that correspond to an rx
>   association which is stale (two rotations have passed), can still match.
>
> The "Socket-less associations" text that a later patch in this series
> adds to Documentation/networking/psp.rst has the same gap. It only says
> userspace should replace such rules before two rotations, and it repeats
> that the matches tie a decap rule to one Rx association. No later patch
> in the series adds a generation match or any enforcement.
>
> Could the commit message and the documentation say that a stale rule can
> end up matching a different association that reused the SPI, rather
> than the stale association itself?

In v2, there are no Rx associations. It will be more clear that matches tie a
rule to a SPI not to an association. And the reliance on userspace to replace
rules before that SPI could be re-used, will be further highlighted.

-Todd
