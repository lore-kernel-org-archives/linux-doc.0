Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794421450;
	b=ovEy2SyPt6ONFCUO6a89fCMgR5hIjjSIMxDYfCDAT9jFlOqIymnMENOc/LMqP+Gvzosa
	 d7JWs7VbuMgruS4ed+h1g4sTkFLP9sziFDBbK0df5RJyJjEiiUW5Y1U+F59pfp56RRcm2
	 7IpOP459Vx+yabreamNlaa3mMDD7LhSE3G48sSgD6QehoN5Xma2ylVmBqFsbStIzT/WdD
	 9L2Waqnmd4F2ZA74qgEwDeEcqYzRCwobMu/6cKfM9kZfW3/79sbw2IzXDxbNzPStPYfww
	 onEHlCMDoN4OrwWi9nOxi8ec6ygS5G0greIosYGzRs94smhGgrCkpv2AXKhJ6Su/k6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
	b=Ll+lsyKcpuOqp+Aw7t0AVpFX3xmWTgmnqUuM64Zc6tsiycm23jY8JZZV86ZU/F+e89hK
	 oOut+OmozwmYzel7M4mSBu0pQ2mbWuhB+dES8SjLJx/8Bb3YuLTvC1hhDocAbU7ZEyImF
	 Q/tPkPpn0hvrQtRJcy4gkUQ7Un4+x7Tgsv3qllhMRjzwxaG8t2mzc3udu/4fXGBs9ooie
	 DXnftilDwSnaE/5ui5nQRHNF80ph0dqXalxKVJ6ld5cwhYweEJAflBJnI+i+m6+dIBWA7
	 evA8YvvZiP1Np0qROV4hIUV3LfSnrae9BlM8q6a99ZMVPq6nSozP61CEq5G7CGSs9Qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=isns6Mqh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB818606A882
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 18:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB818606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=isns6Mqh
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHt2si889850
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 10:24:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=aMG9NSIoryJ
	6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=; b=isns6MqhLK2gICBmvsfmHDefPrM
	fcse+kjR+dgFtXbRypDtqotW1Yl02H8zLF60ugJCdMKKjv2bgp3/FfDVbtAj0qPL
	nMdiMIQxDW/X1fu1xFPQrqO7h+9kKGnsak6+fIA8XRHkd2ZnZxPL61j+PZEgibEy
	nBb5hifSwAd17cHCObGIGWr6WQCyzXxmQufY6UHIk7KcX4LXVPfTsiACYBolCFv2
	uZsIapcgbM6aipiYch9uLbCT+xrDb7WMyVR20uj/cvl1DYR6dMROu6AKFq/+SWeu
	7vwmmqM2W1TLALIA4l+/gOuarfulif/2FeT4KQUkwmvzHlyXdH6HmkOe6Mg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hvaejfatm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 10:24:08 -0800 (PST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so5719844a91.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 10:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794421448; cv=none;
        d=google.com; s=arc-20260327;
        b=aHmi5svDnes0XjvvkeHg0W85EqGV+ChbEeT6kxpT3jYr6KXlum8E1uCP1jREZjMZsV
         xe/IT4AMdb8R4CG2ikaEVbM8WYbANNI8xiGXXsJqcpRkmH6bA8pxqVsAZL9dZsHIjS9W
         ybYAWpDEw/ztAV3XOnAN05k94iGSg9c2mc5fVvLlERvMxWd32+POzRKe2LP7VQQusp1W
         DlXYMNX/fgHoQ96ZMyaIi0eM4oozpQz+L0frD5fg+IJ7mH/hzpX+7ZcEfKGDGo8MirYc
         tJLv0M9rYO2lQm5Fd8bZ1r+A+Tch/bl/AlqgQ5pqbBCQEr/41avGhJKHPRbSMllhsDEM
         mbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
        fh=sxCMYdpBVysEEWWrrxevm2+srUSosN0z0LjbXxywK58=;
        b=QHaVp/cCz5nh0519+31RXc65qb20eN7uaJ+5xBgyRy1nlFAIozoxbvVwa/exnKYq22
         W+8qv/ZXA9RofriyYNQhRJgI7zC19zVAhin7Lmkr9uYVl3QoGPbcJ19JBqkBbT1neMxR
         YzMtw4PzPFV9vY2XuvIIkx0iNfq6nFMW8tccdvmgXtcC5Jgqu7LpumBufYiLd6k+GrV2
         EZsKb3/jZTbY1uR8Wi+nl7gDXiaf+aIaRAaFuwy58iqRrD3yrjNuIRfBxnQfPPwZzoeL
         3KBnKnAlRPtrDp6Eu53aYwzSC3lV0Bh8SViK6vwBiA2rWgnK2FgfPoBOX/DTkNuDx9EB
         FTvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421448; x=1795026248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
        b=hz3UXru4nURfMSNlIWILj3iJbyjqreS0YTrPsEI47Hg27iIDM6Pzea9f+jK0yGlmMW
         rytk8G1BbRPLw04pYg+AOdhBehPGez9cpl/Csw5W4dVRrK0phE34Jtoko2dWEEO8B4u4
         rPO2LL53ZlSIv8ruX5ilvFk/flqRfulZhD6216ipXH8NQtlkqUTFMtEq79d88ZW4d8zt
         Hb0KOZft2lWxidAFbg5w9vwnKvjt2LaL22bQGAErxMRDRXW7b6aYvAAw4SCezBN1szy7
         Tk4ErUZjqjBEhhVmw1nkK13ZDP68+7BJKwXIg4CYzdpBYrdssA3QtVbd4eG0e+a/CTC8
         yeBA==
X-Forwarded-Encrypted: i=1; AL+hErHDP1skxHWfeHCFKDThNfOWTKlXWU2cmzioNgDeU1LWc7vp25/fH5dobEY6+TCCxoyhrGfqKDeZq+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CbMI9kXh7v9loJa1dT801LYGQaE0odX73LlsoG32WE3h8ZaQl
	jgCmeyTT3m7cYHsvia6Z4Y80OAcrZJtzHHHPXYhuZWgVAA/0fekAzdz8KVQY53y9WHzfEb8mPrt
	mHxw18UDKBOKfqn1Arffe/wUKYOWMJmeZkMvHopbTabrtJg/4lPAzEE83m4wV3+XQOZO9Xyj9Am
	h9cA2lEvtoW2/XTUFin74ChvbDhni1trrnwbM=
X-Gm-Gg: AYBFou0lrVhUPzQgUr/RiMkQbD4ubgek4NDt8CnnVOkR2YebeYPVnGdFW/1hnaAfBaZ
	a7qobmuO4ZrWniZyWHGePr+v/NTnKdbTJWGdWrgMRR80gbvCb2UzmUgVBaXFlfKEMdTI2aG1aY/
	Pzb7ICEHCKU7Fgeek+GTT6820Mp5+2yjxt4gWQk3Ir/dPEL3HWfgfa8RaCOCC22Ucyf5l62BHdL
	ST8bRjSidTD1Zg2s+MHpGOtaWEDgae3
X-Received: by 2002:a17:90b:2f83:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b182eda7efmr3257451a91.26.1794421447603;
        Wed, 11 Nov 2026 10:24:07 -0800 (PST)
X-Received: by 2002:a17:90b:2f83:b0:3ab:884b:65a8 with SMTP id
 98e67ed59e1d1-3b182eda7efmr3257421a91.26.1794421447127; Wed, 11 Nov 2026
 10:24:07 -0800 (PST)
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
Date: Wed, 11 Nov 2026 10:23:56 -0800
X-Gm-Features: AclHuK8_olqmA7fXTYgEAj2-H4kgkwQj_X0uL-xyG8nZrZvhci79BGaB7ila0uo
Message-ID: <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=LZipeTfi c=1 sm=1 tr=0 ts=6af4b2c8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=-xR6GoDS8vL2zpuMsZwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _v84RoQFktzxTlzbbboatmRkFLscCk0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MyBTYWx0ZWRfX1tBmsWpd864G
 Rif8xee6kpyx0v0/YazraJCUKtui3UT39syrIFViVd3aXTb2LYTQ33OEwwobG0quPAsk8euWLLr
 NJfIvUgWVVs0WuQewFhnbIuZ3v9rVSg+iuoDiB2bwf/o3dtL8dPmUVQaD/e93VNvMOjZrBpAM6C
 rrad86rg1lXNjAPiTDl9hUtyvZPu7nOQ/Ee4C58wupzKZS1QjTmYByCBKFWjs8ETsQK/achGLtm
 S3bDXNXpRvuz7jD2QN240ABFRQlAxWEs+i+L3U6BracVdWXNKEvqFVS1AN+UaP3ZNBfCqh0nGOh
 DqedPqY7myOD7pls9moCzqwPGnWQyTNP3+JWVUChbS+brQX2bNc4GPxwNSDK7B3xWU8TGi0ovBY
 +2j6fNzgu0H1m2ZotsrMAaEMCqVKQGMyt7MXUGRhW7eWhq0Ih/JUbR56bP/i5nI/VHwZOCsIA3E
 KFcpIpjOrkIjZtCMu7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MyBTYWx0ZWRfX8/BYINdIH1fS
 v/jkV4OuKgusde50qZNNQ4A5f/ZGMZKglw0S9ke3XNBkDf8P0pyMLUozbO9GfGjTJLU/VqVNLwb
 uPKgZSQqTpi/LafwqB1l9KBOftNUu0Y=
X-Proofpoint-ORIG-GUID: _v84RoQFktzxTlzbbboatmRkFLscCk0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01

> I'm not sure the kernel actually needs any bookkeeping at all for these
> generic rx spi allocations. You could probably just pass the spi, dev
> id, key, and probably rotation count (as a device key generation of
> sorts) to the user without creating a kernel object. For socket
> psp_assocs, the rx state is consulted on the datapath before queueing to
> the socket. For tx state in all psp_assocs, there is the possibility
> that an SADB handle needs to be cleaned up. Neither of those apply here
> or in the rest of the series as I understand it.
>
> I figure the tc ingress rule can just take the spi and dev id by value
> rather than needing a reference to an object that we create here.

That is how it works in this series. The tc psp decap rule (ingress) does not
make reference to an rx assoc ; instead, it should have flower matches on
psp_spi, psp_ver, and psp_dev. That effectively ties it to packets from just
one rx assoc.

So why keep track of rx assoc objects at all? Two considerations.

1/ don't accept packets that correspond to a stale association. That is, even
if the device decrypted the packet, it should be dropped if the device key
which minted the assoc's SPI is two rotations behind. For psp socket offload
that is enforced in __psp_sk_rx_policy_check() with the pas->generation
check.

The spec permits SPIs to be reused immediately after two rotations. So the
device could decrypt a packet with a SPI that is more than two rotations old
in that case, or if a previous packet is being replayed, for example.

2/ hardware offload. the solution to #1 should be able to be fully offloaded
to the device. psp tunnel mode will be hw offload only, and is implemented
in the eswitch with connect-x.

We could add a psp_gen flower match to replicate the pas->generation
check, but the device has no access to the pas and can't offload that.

Keeping track of the rx assoc means that the kernel can take action on the
"this assoc is now stale" event. Possibly by enumerating the tc rules and
either deleting them, or marking them stale for userspace to reap.

-Todd
