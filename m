Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953838;
	b=eAB4mWOpscLtxltLiA6IszvBQPGjMq7Qag/X/g128jK7TsRjlGPF+0+Fz5J7FhI9gdIT
	 nUCkd+Kgnf63c1LH/RGwD4cB2pPhVZlLFsBk4EYbwgPSGZuukwFOjytxdOeE4jQbpC2l6
	 zoI98nBfWtVkWrtpuUu7Fh7Zp1tygcIHz13N1Jprk9HZY/6IJnI+KEYAdUx4p1BpRyDrF
	 Az2ewrNVUr8sktTvk5N4IvcV2aX2W6WvAJGeKalnk3jNKW/FvO5tgtHoY0ccGpgF0NzFY
	 PBELhFmre6Qii+5OKnjJnUzkALqdvE350TPF5wux7YTGNJqcs8bG+ct3VSe6V2ygS5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
	b=VCLo0lb9R/XCA6kb2JW9mE2KEdwuhjQK+EmUrbgmWnboV9MtVcUtlXr6ZnXQ0BQn+Wpn
	 4op0s3Zi83zYps4H1h8CIA3WIF9JEtd+FuFBwnjUlBDoxl7NO7EcNa28MV/p279R5hkaD
	 8ORkB+sTg41M1IDOSW/QUm2buFJarW2iN1UbgluCOgFI3711cZOA1i8+rHKQJocFJ52Pe
	 r3TVlxae6cIRJwq2sY/xSQiXwWM80I+ia/xcHSnIRvl60EdGaPpoQcHWtpmea7pZImxXN
	 /WZsjD7JGZ9cCPEGchpXIGJYCqEoJvxlSoSK01rPsP3TVTYguc+fL18auPdkmVEv0og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EvkMrAlm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46714606A335
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46714606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EvkMrAlm
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM22at1933465
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:17:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=naIMYO16Tb2
	J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=; b=EvkMrAlmrDK8ub69Xg7pAjpcfhg
	bZmfLUAoEXVsHI582DX2XvH/l6wGABdG9omOSqhVscA/IEoGuPA0CuKpLQIwkQrd
	hBEyFCYOGEXtjyA8x3b0g3YTHTx/sHwE+cQmDTvaKvteMtyAtX6dmBfQkCozkLZf
	p22cxMmQsz7yD32uSvOi3HsnxIikFWp62dCypEtCz6SeWEqW8jjr10TkF5/Z4PeJ
	/8L+8tNnAtQ73AhwuAwiHeC+vacHLSuhs6/KyihzjSuZu88a3UB0O+P7RJ2pM+Pq
	VMyvbB/nLDYMAxlh+5ivYxFI1VuB1MRuJ0Byb/cV3VEMNBGlBCxo+Gavfxw==
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0mn0xqam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:17:17 -0800 (PST)
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4915ba023d4so148709f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:17:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953836; cv=none;
        d=google.com; s=arc-20260327;
        b=N0Ty7GAwXz+y3uFdHMiaWx8FMKVmtfYa09GFrmDfg2Mem58WfLJzaHkrOmeRr/fIpR
         b6+IeBoNq0dC1Lzjc+AF3ISN47VyJ6Bhc5F5DpTv9lLVbamayUs4FEAu0vU9RqAhxlrY
         M5qm3OjX2uuPi4vcv0GTOEqG8GKVcONkgX9jWpLG5tKLp+/AzUKmJTRzIkddUZa4G/lf
         N2S4sxvk5b3Jj2fuVd9V5W/0nQLF97SUwmMS7ZkBy0isluhihjNUgS9OhtFKh+wZQW8e
         IfiBiFGCF7OB2b+i5n15s1W3rImib7uS6APZrE68s2OEaY7LLj6cX6Kvdm5iS38sbZhH
         SwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
        fh=kSfwYro6y4ddgdUpL8KN6+HN/YtzwMRNttyZV0tXiCw=;
        b=qIuYfD5oV4TAI4LDUT63ZR/j9RA25FqEwZW9snO/epWLmXzOUTq+2g95iNFqnd75NK
         4wPw6+CPrzIssFNz3Ng3cXYmZ7vXHYpnTL4G/BoFu73zQG0d/S9qQFITfxMEKx3Is/Yt
         5vLcPGJL4kFNI/d2EI5zBe2wN8w4S2zm046OamS8gD+jbORuf5tzQXqSNXu6ofTQVCHR
         sHzC5vBv318nQg8oZTSMgYP7IHCeSLQY+lnwMT/NkD6j73HFHtpFuto4EIS6/SE6Nqan
         +n+GkE30OkLeWgtPqxg/Qoor2Q3Y5T3OqAhLgr40JdwLvr58FvMLSwcRu6vJH3KdorO6
         UlBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953836; x=1795558636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
        b=07uQWvHKXY2RdEvBXjyUvG9gAWvkhNOFsmsYkSF73wXmjXkPBTFpIFUgG5nfZQI3XL
         dh6P7PYnq6nBxTZMIwN2PscVj28u6dTMZ7ctzJ6/ZZjtdW2Zm07EIX+limzkyGXuy7J7
         m4X34jPAQ0BISTcu+cJA3wpA0ltSXRePePzWWgEwuq35WDHt7qSe0T+eHEm6ohYVKVQx
         55LO1SLeCDWR0eU1otBY83YlyVCREd539bbJXX3Uk/3IAiCCja0raisfUwKuvFJtCPg0
         0VfjMFsOyTCEjENRoxPU5TlmuugTdFh1+VbphFfUrf78uwjhSwcUVSeQGyWfj2RRQf/I
         fRbA==
X-Forwarded-Encrypted: i=1; AL+hErE9bjVKYYDmvjkT6dBO+VfSs2anCfg3jV3cYnyW1VuCPZOsEgnaOaNocmZzpmfmXOm2FCl+4CPyyZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AQZWr2hEZrikFkZDm98VVii4xy7CSeJp6TfzLx8KMQeUc4kGT
	2fjM6btpWY2xDZaF8JRxfEk3M6ENStoEjC4lpkqcQmJ5LmHiabLy7Zd5b21xS8fYwxr/aERiEaT
	tSKForUNYLfwUdssTFGEs/dXfSuWEQCYWDXXPWf83eFWdYp6UcHINz7YqFrqR3OiDTjw1rEJYeC
	plQrAYeUxSd/Vclagyv5P2bjaTX8zRBSFOoPg=
X-Gm-Gg: AZFdTZdp+m9CKliX9xUaUgBf9CS6H66ATQcYHlRTRWAMQntpc254XyivWaAqlsBUiKM
	9ZWWwHBpRayr0ap+95hgbgavn/snCnDmMgeuVyODgY/tH+dMRd5E0JC684MGfXnMBxX0Ll3keOn
	PUuONbxbwkpsCz/5ZLqsLA+tfXGoDAl79+wEXHPSJpkYPyUVPGMjhsPj/kyXPp2F1OTCWkQ4r4Z
	kx+LDzJgNj8kP3dDPwvYMFz5F/ne3GOqvVTyHL1zI7DF2F7hb0=
X-Received: by 2002:a05:6000:603:b0:48e:5eac:7e48 with SMTP id ffacd0b85a97d-4a63d2cf7f1mr1645572f8f.22.1794953835983;
        Tue, 17 Nov 2026 14:17:15 -0800 (PST)
X-Received: by 2002:a05:6000:603:b0:48e:5eac:7e48 with SMTP id
 ffacd0b85a97d-4a63d2cf7f1mr1645531f8f.22.1794953835465; Tue, 17 Nov 2026
 14:17:15 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-3-toddfreed@meta.com> <179471269307.2199510.1215468778950936295@kernel.org>
In-Reply-To: <179471269307.2199510.1215468778950936295@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:17:02 -0800
X-Gm-Features: Aa3M54r5Hu3045uljd3xO655IC2ADA2xeFtOm9g-Da5bBZKD676NvfeHASL2RN4
Message-ID: <CADh2yMznmWWJsh4ArEhrm2n9fG8i7o3u-kjLrvs_dwsBPiFvtw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/15] psp: take the psp nexthdr from the
 packet on encap
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX8da9Qtt7JeMY
 27QF4kB5V27/qKsYSxCRL4ILO+NemCFoFakqafx6cwCSuyXV5GBI1mNsbALIg/4Vbr3FJOt/X8M
 cZRffqAiUhnhOUEBujMBdbEPzHMFMRBVyEb/Z/2Qt9yH9uV1tUR3jry1k7QhiXHIGqCq0f5wFm9
 KBhiGXsM75Cdk+VT1mXwNRVpwcjKFvb+4RQKxIT7R4T2x+ymZSPT73kZJFvJM6S1Z+lVttBM0Em
 fxMQrzHuO8HwDVWIy9TwmyYLIA5kVIvp/jdha0h+kigLAxkNXfRGJm+7/+iduzXY8AmiGXccsOc
 OHP4CIvgoojO1k0fKof+Jf/xqraj04gxzZGAlJMMSpO12oqz6U4gcBCHoB69jWR8dp5RXzWH6Uy
 /foU97BAIfNSFQP8wXeF8X2ItP4X7QUR8hS9+MQRyRzeUKI3GjIwDUzApdY4pafFhOjBReTOiqt
 aVakXH9WWc2mEoKpkXQ==
X-Proofpoint-ORIG-GUID: OWh20pySGvNch-Yt8AMGyWgr1yc0poAz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX2Zt55wE8/k+s
 Rqn6a9O6ACeEJwXMxbBRy9yp1AmRM756iMA7kQXqQXKOeJvZ3HAKVPPDfKqziqPsnYvPN5YV6Hs
 spAeorY2leA8F9DlqySgRKD3co9fgIE=
X-Authority-Analysis: v=2.4 cv=HcmB3SE8 c=1 sm=1 tr=0 ts=6afcd26d cx=c_pps
 a=C8Sa+zVB7PeSwznsLr31Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=-eSvoOO0VIkvbIxHXOgA:9 a=QEXdDO2ut3YA:10 a=eYhU8IiCvE_ms1W8Tcak:22
X-Proofpoint-GUID: OWh20pySGvNch-Yt8AMGyWgr1yc0poAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
>
> psp_dev_encapsulate() now accepts non-TCP packets. Is the outer UDP
> source port selection in psp_write_headers() still correct when skb->sk
> is a UDP socket?
>
> ...
>
> Should the sk->sk_hash path be limited to TCP sockets, with other sockets
> falling back to udp_flow_src_port()?

Yep. v2 will only use sk_hash for TCP.

pw-bot: cr

-Todd
