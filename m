Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794444717;
	b=CHIwM575EzUBaf5CAmDJxvXcJizjFgIFsMe+C8rG1Jb0GzQFtXVj4et5vH3BmcbLx8y1
	 7nmC3/xzCbqZyInKU10BkvMV8zxz02oXE1suwvlqZIJUzgudRdQIRWjBaU3k3slyn4WNK
	 QBVO2bi6c+YLZ6CYKO3/l9Wf1ncfL3IWBw8n8OZNTDzffHGctgQibyNy3kP3HXELieOvr
	 P83I0lPZfcKzO6tiP6Cj+4yHM8HZLXy3Ov5OFxY24c2wszBw+jbShNI0wgSrID5wag6jc
	 cuItVrjn7bacVIOa80BQRingB2Q0awD1mVqTaJ1ddAFSx71drtruBGnIZrzfh8GBvjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
	b=fytI8iAzsdwizs/MmZMDPdWTjgdM4Bx1yBnPzCJuuOegVODNqsHy8ODELXLgG6E5rR8O
	 lvEswcHL/fiTb/3L8gjXfnwtUHANixx8jeTXMRQY+FM+TsBt94PQb5myY0mBtoFhk8eew
	 ORLPtZBWvmDBKqAVwtvRTBiZ31Q2/mUEZkUknI+X/rGxF+xrjTo+84J8jl87skX+vjPq6
	 4fYhPphEjbv/siVPncHSvaP6hS314ScVFul4jmHl38KO+qkQM8N5eVxr242MtDqRlxqZ8
	 s34K7Er2Y1d8qnE8+CrzYo7MpPIri9D8+yCD2FHC/mjDRqEUNiobm2V0BInv5P/7tDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="M9reJI/S";
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C179606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C179606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=M9reJI/S
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC02QK51688117
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=COvz1LYfsfn
	PEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=; b=M9reJI/SbRv3KTUBSw1H39UYEB+
	5lytBhF7hV4YQaPVXjAXypBnalL48KDk1A1rPKkW4JS7QlVjoHRcEgxDsnA3DkFA
	V060Ck2jnCyXydM8YqDn8C+78ia42U3pbptfzsZlVy9Q4snVD20ijYvY83yoTAm8
	ocCd0aFLyIXSlQmjSjI4EMdJy/wmj2AUKlRJZxWjN0PrKyVpD34ID8GoMpx8amwx
	sUFDPaIZYs7/+VMoJ2ms1f1pJNJM2ePMvINLR5wuKhj4NwbcNnaqKiw3F04xD0Hl
	fQXX3j31JGidEqXUi2+1MYP8OtMbJoF6w9Rm0iCvm3rpqRXC98O03u3+rog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hvaejhwsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800 (PST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso249913a91.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794444715; cv=none;
        d=google.com; s=arc-20260327;
        b=ncQ1WK8FSgrj18u5aGH7ZhTb64EBKsjjsUmHBaA3XNgz2Tw+8Qy53+q7zpQvXeHI2q
         HW/t8g11CukgxPqeimEE8DHAgn+kyjueegZRNM9NiGN9f4QgwZ75pUGMv8dcHEiVoYXr
         H48ej2yGroLz6BNg7QRJmi8Fqo4kVgaSeKr9HW2kEuFnDLMy7nqimflkAoJyIfX7yYAK
         zttShDTTBbx9i/QJQhrZuzrjs4uG8ZA2x3CcFWpew5BO9KdXj94rMQkj7Y8iGRFnTTAP
         ST/yizLhOa9o1m7oUT5wzKomXNVGgVuK1PjjK6ZJBLX3ZlXkUr1l0EyamrIGE1+lrpnt
         mUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
        fh=8sS5EV07gA1gEr+gZ2Zo3o1znXKuN4XdDLy/sNWbrHA=;
        b=VETHMOx/07oHMXZYlXnDmgN0kFehJgJpcfrB7Dr/luFAzx6GL7Ert4yaulFdC2/JhE
         M15ngrHgU73qWPkRGxVBrVUYRe8UTv1gq+mMEx+/tCQH6Fk8R9t2lOHVpwDdw7RUkPKh
         qeD04gI7GKnlGepnEKTdDkcQ+1vnR8NHb+iIaenJqM46O7BHIbsez+Uo74AkQonXioqb
         RbAUxP5vRPSKvlnKmrD5u0Rq1Pz/oOTmSovG/8wAEZxJ/lLIXDHt9lKRhNwK6qo5ZeOd
         c5WrZ6PBbVAyOoHYtKRFlhDsSNZwGlAGtwlnecE39MkZ0UvbkcojDwvECjhj/o2DZW5Y
         p2Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444715; x=1795049515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
        b=XOomwZRBGbdp8tpPnLzHy6zFF+i7szaA10O78bEV5VOr7Zs3gy6K1PHT8BL+SJd7U6
         IL6DYXad8HEW2Wfmh3GXrOA+hAhT3J4MrSSJRUVLeSnTbEWbBtYaTkvad0prpheIOUTr
         qBytp2noAEpiI87xoBVaU2zti2mvyqv3qw4wapfINlxCMmcWVK092IXiynKGweRx1trJ
         1LhtuEJsNlVxUPLV2v/jLVUi8NySCetIR3rAihfwX8h8ERAkEQxcTP4+bPIDsc570fLX
         ordwR9DYR88t7R03rQYE7oofGIBHrekDRi0ETT4n0B9USkDIWb+tKarkUIlo7RVXZXh3
         xgjg==
X-Forwarded-Encrypted: i=1; AL+hErHOlqkIZvN7CnejS5+2XCa/naUfvrWmYWesKXs0b4cOYKRlLSI1H5IxAhLuC3Nb4czSOCufszLgSZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h9vQseiD+ZpzFLHa54q8nDvBZ8ReM4nzTnltc65ddPGGloYyQ
	JL2N2XtQQXQUmfNCbRowDqBa0nKON5ThVsD2lqUFXg3Htjrna2jeT5h6PHm+B1napQUFSSB9DqN
	k52wITK3AZsGTAHHzNzMqFOwr8aoPRyFmsUb01hls+TLDa6Mykt+Enx8plb3tBvhchReoGXzlEh
	YkuMUUWbWAyvsSvAVYvEjp6CtL2RHcwfVTic8=
X-Gm-Gg: AYBFou3rdVW1O/+8909hw9L9G31bkw87rvgKpC8BU39xivQum3Lahb9E7bIuvBaegik
	U1R2VDhCnwjp0tN2XbEjFSt3Y/ctT3wOnj7g/+aIN3Y9uFu6cI4An3K3TCbd+DW9CNpgIq4Xk6p
	iD5l3orEoeeQkHeshCID8fvrVNafu8uUGNQmURCnEJ10AWhUgMWq+OOL1ZLLpSXd8OiXvpwcYAs
	Tb2D4Ztcm/mLmcODr1/EaLBl85lnKIW
X-Received: by 2002:a17:90a:8c8e:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3b197cadcdamr475962a91.27.1794444715075;
        Wed, 11 Nov 2026 16:51:55 -0800 (PST)
X-Received: by 2002:a17:90a:8c8e:b0:3ab:d26b:c2df with SMTP id
 98e67ed59e1d1-3b197cadcdamr475937a91.27.1794444714456; Wed, 11 Nov 2026
 16:51:54 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-5-toddfreed@meta.com>
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
In-Reply-To: <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 11 Nov 2026 16:51:43 -0800
X-Gm-Features: AclHuK_TCwMOAV1WvAw9HnkDUPDvVUUNIB0-FrcHVRqyh165RWlzsz9oCiRdiUI
Message-ID: <CADh2yMzdD3FSJSAY2+vJYADwRg704Ndqwz2DhAC3nhmyZe85jQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=LZipeTfi c=1 sm=1 tr=0 ts=6af50dac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=EaETVqjJsHDKXBk3jaYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: z4HF6r2NcMqQqTnGS_fKp-VbFUNBG2_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMyBTYWx0ZWRfX22PKTPVTbcYx
 az5oZg9OxbeEl/2fW2XmjU9tId4bdc9O5htCiwh2necnKpa4/5O17dMqwSEqW4oZ7L8awWb5OXp
 YDFgMW+8PitxhRFv9OIfFRoxv2mLhB+7fGFWtgvo9Q6KfXSdVqbOh0FTjtYbYNM90VJ0qwU2dcR
 K+0Jv+KH4DtvvlNAEuLtiAiQhLDcYlXUt501wRTkVlQK2wELwyLnIxa8Z4FzwhapExdOV2+wYCG
 OgR1L9Urbo9GlDuddqQd2WQkwgNMs0q+Tau+iReZEKU6WWnnvzQS6WHQT+3ZM6VrtLQiDMnJeb9
 YSPvu/ik3ujC/K6CLw3uRZpGOWNgJ4a5VEv/fRbbYImSYj2nj21FkbXd89CBXWeOxg/jxs3v0X0
 DnQ0iMwLhhVFBaNJaRPkMRxJCBcdSMdUGxObRSl+S4lc549VCO9/ck2zfLSfWUoA3tNUOS2PqgJ
 UB72CdlA1oc+SKs94UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMyBTYWx0ZWRfX0sGyt9Q00CQ5
 xlk8t+XbzhzkNHmUNVY96oqzHtjtcbLACsAjCrCu7h1pa4debWp70n9OqP2WfWc6xGKfrFFADDR
 EIeECLvbnlDNOzbAYC0fgWIXRsIR4ps=
X-Proofpoint-ORIG-GUID: z4HF6r2NcMqQqTnGS_fKp-VbFUNBG2_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01

> I think the design could be improved by not reusing struct psp_assoc for
> the socketless rx spi accounting, and by not placing the socketless tx
> assoc on the active, prev, and stale lists next to the socket
> associations. I'll try to comment inline to give you a better idea of
> what I'm talking about.

Sounds good, I will do this.

> I would create a separate list for the socketless tx assocs, so that
> SADB handles can be flushed on psp_dev_unregister(). Then you can just
> leave this function untouched, because invalidating the generation is
> only for __psp_sk_rx_policy_check(), which isn't used by the socketless
> rx assocs.

This sounds good as well.

-Todd
