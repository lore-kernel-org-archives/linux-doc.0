Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794596939;
	b=QE3mvNUyiBuTjC4zVBq8aJoucU0LiQJ1EEr+ZWHaAPjGzx+Q2H58CfgFGQp+/rSJdbSx
	 AEw336T8b33z86mIDeF1TNEyylwHKbAqYJpKp24O4qIox1FuFqvnvnSQJyTlWqcRrsP8R
	 rvMtKdTLO0qg8fHQypBlSvs3kZycU9VFf72dMEZC5JJKQ/DOkvWHwDjec/ZsIHjT8oAde
	 fHuHLHD64OKGG85uRbcRlbhIQIpeQRFs7JBufhTAFkEwGvOi2HfFWjr5pKnKe+PfA7lfx
	 2CXH0uvr80gWmLDQpOP7IFsI8stGhGl+hCUrrQBjqoa7zWtCvrzQCqx+u5kN4eQYFrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
	b=YHLmgCgTw+EysRughY82TL/HTShNvf0p/EbgpYxElWNT5cgJp7DneFnNsbsH74TFz8g9
	 //cY4fdywsu/suzywhGRB2o8R/aRNY23ph7m1oJ5QXNBSJO/chsvfoIVVWm6L0nrNWK9d
	 lr9yjEM1hf7uyEA8t8phW8SG4YkXw7auqx5m2QeKHBtpDFlVrAMm9Up1LsaylCRqy168F
	 0BLBbVTYWJ95N4aMaPnWiEcyLoWWpveAV9mSxgLsk1KvhL57b45JH/yf5ALr5e9HSRJjg
	 f/e25ougCyvF1WBNq3HlYknAPP0PG5ly4gCQOTE/VcjdsOZ5ulI/lUm28cG+k7mw0jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=nOONlcMC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC0B606A885
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 19:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC0B606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=nOONlcMC
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADIwZWV437867
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=wMGf9TKkw2d
	AolbYMMRxX3h85UEtf4o2yarI4oY4daU=; b=nOONlcMC8i4eL5z9MdkEXEZlwOx
	Vrvx+jYuO0AU7xRzGRrS3LpEi73YXmUwnlC/dOM+wJ1ODaYOk7bl6zGXh9sfmJfw
	MKNO6Sg6FOBmO6fyVJijB2yweyStubRKYP+YC5sRD+08HFJSgTDbMn2V2e8elqHY
	cir6/wisuzYvGcarXU8Wim98GEnpbLytImhbK0UaDptgWMMAdVa2EzVnCL0Fdt4P
	C8CwU6njpzc16OA1dki1A/QVsYaa2fr1OOoMTrn0yofhzM7HL6RF2Wow7f2tRuaJ
	2PYNcqU0vefF9VfhQZZYt3fhB3NxmITWzERS0MJE8hSc3pgEiPS+lD+uMlQ==
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	by m0001303.ppops.net (PPS) with ESMTPS id 4hwh7ngs3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800 (PST)
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso10753285e9.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794596937; cv=none;
        d=google.com; s=arc-20260327;
        b=nQVWRwI3wtGxd+2tEsNpLr4PJ9qEIEs7jwzlf/1Mf4pUBN3Ub9Rm20RQo4XXVnYul8
         WjFiFqbWCDllaJHFuuqYJlS9Lt+7KY7nIQlPeRAi+fRPyUhlsJNIxQ1ddRWM0myGxDQb
         BfTlMaIDr/9X5ksfw1aBZfrOWRpj00C8jxm+2h9AobQD7CnkeooWI8NbTxlnpmhhCj74
         S57f4Sj1j581/V5a4+mg/u8tJhuQUSBx6umpg+Rt3jArXDERtWG963TYc+Ek9lVrj74E
         aszWVyBqPsks4341bjKhWQV1oXvoM9LGEJ/xuipT4awKw3XnS8V7W2HwI5B6D43UnB3X
         rx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
        fh=EVbG/xUkOVHVIQwg2K+SJUCJOG85UTpzz+riCsWE9fk=;
        b=kLNgEiKrpGrI0AOasYWEKUHOuV50mcnq/TWd1L3ydI3Eb8Soc/B8lBKykY8eNX/f2e
         auMlqJU22DQWkKaHzGu4Rx6csGVdJvCvi5LRSIV3xlralldcaZXl9BwkvnJAr926mWHf
         nQRuNvP0hrvSX1Xyb4YuLkQGkJY/cjklkPme6teoCn+YvbxVFyy7MMHZ3qeVxPGz/1QW
         3uMYqNk0zSzYPUREO/DBCCg4uzt0VkXRj6RP+qngBRdNecoLH5CXJuZE6zpyTUYFLRVv
         5tvdZVI8uIj1X7KpscGovZdS2w84utueqWXjn5q1T0Dh0m2dW+h6HfCKIYfpGqCkHOey
         j1iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596937; x=1795201737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
        b=T5wMCrVMBK5IPNA9FwA2uvNri7CJzj9a51BSb+VP1jDRQH2qlM1IaHVIXDgU8MoclL
         8rxDGAizGRrO3svbtWA92ibuDPYC61oDqhSQ3hqxW7tF3Qj6DcwFkria9VfheF89nipr
         /4ynbHdJAWSdSVH6OkL7XzSKioxynZcM6i3P0F++zcfoH1zY0YrUvggzfc8gLusJ9Ywo
         9j+G9+0NdWtfjVLENTczjM4/mNHfJgCcl2bzxBj42A4NIqUPkqljfYggCQKXtZSUmy1D
         e3gMJEQyxd5rxj4ji5FXrIEAn5lgnr4Ls0FU3znBxvmbbzb+ysYo0MRTx2BC4TYOg6OB
         YNaA==
X-Forwarded-Encrypted: i=1; AL+hErHo0XjgloLzWB6+Un1ZGvSGgDhjNFSU4DNnnLtlD0OgIpvR1BjmsLpGIBkDCbdCFb5hU62o3R/aisM=@vger.kernel.org
X-Gm-Message-State: APuU4Z88ASz+bRjE5fEM5CAf6oRD/W0fZu4cveVUEx5XJb0uGQRR3k5d
	Jfa2C6OU5+r+0pR8ELSbrV4T3PU78zFzAZbqFO3bA01fkZpRMKcjVRfGhkwXVktyepn3s+op7p8
	LCjjuLuXOo8SeObI7KoKjXaICYBxmF3MB1Qb5M748ekAdjVatayULMu2HjyS/CQwZB68kOoZf69
	1wgMoijM8wtKdMvVkl3p57V1hRJstDgtE1A1s=
X-Gm-Gg: AYBFou3kzvKyxc+YrPOX74xKzEV2DCEcy7qfZdcRr51XMc2z5INLlux37jNuJc57ryk
	TGQc1UqpUIcffCoiGMie7NOucdW4Qg8lAFFg/uMVdcN6j90+4tggRAiRNBZp1nKtnh8Er+vStUX
	jEt7JRMXjQyTBv044V662wOhmPuhnD/bu8mjn/ZAl8adwTJLaWAa07wn2RUYjKF5NaWqGw9hs83
	bcoScnCrVacJjNIWmaX0qUafrKHql/xjyC6DmjtfuZoJpeHz1A=
X-Received: by 2002:a05:600c:c172:b0:4bb:5f07:10d3 with SMTP id 5b1f17b1804b1-4bb5f071385mr25701255e9.21.1794596937145;
        Fri, 13 Nov 2026 11:08:57 -0800 (PST)
X-Received: by 2002:a05:600c:c172:b0:4bb:5f07:10d3 with SMTP id
 5b1f17b1804b1-4bb5f071385mr25700845e9.21.1794596936812; Fri, 13 Nov 2026
 11:08:56 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <CAM0EoMnPM54re5-WKyWgwyoz0cn1uGT6=E96OBG2-4m7M+kx7g@mail.gmail.com>
 <CAM0EoMmrRrmPdXPKyiQgEHQSb=mq3uYfNc69hEKw+Rw1EQAzmw@mail.gmail.com>
In-Reply-To: <CAM0EoMmrRrmPdXPKyiQgEHQSb=mq3uYfNc69hEKw+Rw1EQAzmw@mail.gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 13 Nov 2026 11:08:44 -0800
X-Gm-Features: AclHuK-U0ThzUJNaBNSfjppeRsNnyfVDY_cTKL9afgrilY3k6R5ZNeb33jtLtAI
Message-ID: <CADh2yMyJ7Fgtv2BAyNpKFkBC6YRC=Z7kOHSiBcH6kTqcriWL4A@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less associations
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfX3uRUfuDqTWhy
 6i8qEKGm8wjinrA1C2fCxrQKB5Pl9pZ0qkRCpK9Vw2SpWWKcSJKYhVqEEgwIzdavFrSIlRnCOmI
 uYNOtYILeA8yQrdQsNTTkQvYSpCAE4U=
X-Proofpoint-GUID: J1i1lwOJN4l5jN-wPOdujDhQshr96CIm
X-Proofpoint-ORIG-GUID: J1i1lwOJN4l5jN-wPOdujDhQshr96CIm
X-Authority-Analysis: v=2.4 cv=R46WitRX c=1 sm=1 tr=0 ts=6af7604a cx=c_pps
 a=Q4jRaax7EcWM5fECTC1wcQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=c92rfblmAAAA:8 a=VabnemYjAAAA:8 a=V8I_lJ-4SMfPdcaXHV4A:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfX+mi7T7nspyZy
 KKy/WNkioaAdKunQEstJCBP/yocxCBpiNgbTqixiO7tQ9okRYvW6nGejYE4nFBlgfvh+3F4KMRZ
 bk8uoXA2a91+FxKoO23x7KlZMA00vVnqT6RG38ZEzF3S7Pw2QIxa4E5+mpBNtpcCsUKIoD0TP1B
 n7iD/Na20mjvqnGclTVpvQ9NqIH6vFWQHi5CYIogj6F5DEaW6lPUEgMOEU1NWc9fyF5OdtL8JBe
 4EtjXowN1fAYQj9xdcRlFKAQFqn60XDTYXe6SjSz9yfbldanrfaykr0QxM3BAfcPdvYkmdFhoFL
 uQsw59SjkKIa0u6MVYOxvzuzA7yh0DKHd7RswHUto2n+t1DJBWl39B54VuuKXEkl+mT642q4D/d
 9o/1uRznjj7IZVFLzb5QDVt3q1HyvbDLj4GQQhH1j0QOlEoQ+vuyFQ1WYUkTuNnSPiPtCggiNUy
 zhQRj4W0fZmA5uS8fjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01

> My bad - only one of the sashikos (gemini) responded. I suggest you
> wait for the second one. I think it watches this gemini sashiko and
> tries to come up with more clever findings.

Ok, I will wait for that before posting v2. What is the best way to know
if that has happened? This posting is from 3 days ago so I would have
expected all the sashiko reviews to be complete by now. Let me know
if I should adjust my expectation.

I think this is the right place to look

https://sashiko.dev/#/patchset/20261111005533.6436-1-toddfreed%40meta.com

-Todd
