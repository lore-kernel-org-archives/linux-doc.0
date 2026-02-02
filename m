Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5B2FD1CA
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770059668; cv=none; b=Qj52IpJ/6/i4eXNhnQ/7bKlSWfxIgzUCem4yxJxBtGYE0+U3FhHntby2DN6aemZGGXuS9tmJLXx535EBlP75i1VWXrNf43PGXjcW7Qqmdyg9btAahKsLFCrSoX+KrCnWlDo2sBxsG5r2vf/3WfGnxezR2F4PTOIPdhiNWWEYhvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770059668; c=relaxed/simple;
	bh=PdWYVM9bQtDe0TudJddgK+d7dqdKR0v+WMWn+GfPpOI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iB0prgQhf38PsKX8kubKbCHeqgcGoour1MkySiMPAVUi6GYxm/WlB53DZEG/fjo6pn0GuLQHr/gBGjcMgErH0nRZsPjrAdIUKzcVo78ebaaKsMOYmzaXFI6+sBbkUfuBwAHsCQxhiJOAAlO6C9hu+5HxHw4jN/TQ/v4E6TUdcuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4pPMtsC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9zEvVgR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4pPMtsC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9zEvVgR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612IrqHU3459099
	for <linux-doc@vger.kernel.org>; Mon, 2 Feb 2026 19:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=; b=S4pPMtsCc78QnI5G
	/VtZ9+pEPulUv/gY0C4oEuQlmLvZ5LxZDmQeMk/oXwp2u2Z/FSopfMRZlITtFVtm
	AM2gzLtqaigijBFZRqxGUY8MYRfHB3ysBtr5XzRIQ2CEdaBamMBz0IH/nNGwu170
	HrJqJAmRpH+wVy07ZoyDzi7hrUkoNS6SJiy+TMOZanhSCOivZrtxB1sxqD1a5Rug
	6inUY+m/XSR38YQC8/VWtLgZ3dDKDeIj5hezzRQKu3WeBCBQvL4FmstGDRvLWfy9
	c1xcrFm5JzmgG5xson/0wfZDrR7LDNgNgPJi5ZO66jJP574sUtO7yoqU/VioeFuO
	dzj00g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbhgc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 19:14:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c711251ac5so1351693385a.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 11:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770059664; x=1770664464; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=;
        b=h9zEvVgRO6HvxGAQ6W4C/kCt8ihS01yLCGlCUnYaSaROqhWRZuaJHIbT5c4/AArq2v
         SUzFDNBOeEbCAg2Fj/p7XUVErvTGsGUCWaX9t3QLL8uXZ5uE/PoNz+yyCmLQGfvw/7Ow
         u9tNGCtPxD5iW8AzUEmP+nXmZaIRY3IXzbul8824wt+920gGy8WUkDOObE1TOOxptlkq
         o7RW7gcDVnzpNd80WBGWMEhG+lryQC7ldXp7yZ9pqkM76DbeX8HChSEztLVYzePhYgAf
         yXPcNreTwdfg8YQX89HjZkk3buWNbp8SGl0PAe9GSWGL5OXecIZmw6PQ2WBOVF91g7OQ
         t9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770059664; x=1770664464;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=;
        b=d7eXXGIqAOBobI4jTdUjB2jeYlIKiCLZHbQMwDmJwLEaKGUsPYYHdJsY4A5M7bx2Q/
         1z0OuzQIjELI+LnDF0MIJF4h5n4Mj8bmg0kIfkAvyLeYaZprZMrWXxu6lomIOZ2g491u
         YuNg6g73/yG7w33wx0u2jrDIv9X7KblhKAUmvTzoH3E2lgXTWsQRUI4ckRdQf+PIlQh2
         WX0BS8duaKHxOq3o1/1cqedUnC1lPZ7XzUDWdpzFzYq3snfyMBqfgnpT7X13VbK1Mm4J
         sOmVQY1ESWR5tbVhOwHXj5sy2KwKe81WkKNPAdS3UpxqckN57UYyW5jHTW+Q+QZDKrl3
         3AwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnOU0/8P89DPooIRKN8Qo4u3MSjPRitRuiDTyD/iwisFUkD4DQ2uJaVCd7OFE2XqUWmgzIRsCl230=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhESC9WdO1QJ/5UvM2gqbtbSIPcEcIhd8dJx8cYiLu4Otcr17i
	B/IsD1iTpN9Q5MKMfNy/W+Nww98pVnL5dviWERcn8SgEJECcfD+aF27Xb75X399kvLollKlV+/y
	K5g7fb4hxhof6begRsbF9gLdwd4iepcP5J0iKmyX5RW/YkhyBXmhm3Xxa1U4uFcM=
X-Gm-Gg: AZuq6aLp04en8nt037ii7akncztOER84j49kesuH0j1mMumI7C8q5JkOPFXFxCvzLlY
	FH2Q+C8UVMKkFVT6W5yNGjfwSUNJhF2bFZ9XANAn19Jjvyn4cGX1jJu/2N1OsAaDJL/y+FBIeAt
	Yb85D85Qpy1p3oEIcxMeofAVNmAVOcghIisEdccODhZYMrqaFuG/tqnr8izSngs2sJadNM94FwN
	zG0TD2e66l2++ja0PUJCCDKdeovk3m/0iSGTYtoC8fQqeOfQ5pnP5HZNmh91DT2IJIRmLGHLxot
	b0Vu2PE7cgGY6406tqpZxE13YYT046BfiW8SFxjlwq+0wj23AuqOdksTxqDV7ohImtIJTwsYGw6
	dbalzbucEOk9mwbepbvzD0NwCONYZSQkvtaEmH1wP2ntX6Fjh
X-Received: by 2002:a05:620a:254c:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c9eb330b40mr1572184485a.82.1770059664073;
        Mon, 02 Feb 2026 11:14:24 -0800 (PST)
X-Received: by 2002:a05:620a:254c:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c9eb330b40mr1572179985a.82.1770059663552;
        Mon, 02 Feb 2026 11:14:23 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e267b699sm98668775e9.16.2026.02.02.11.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:14:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 19:14:21 +0000
Message-Id: <DG4PS6NRRUC1.1FL8WBJVEEM4D@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>, <rkrcmar@ventanamicro.com>,
        <andrew.jones@oss.qualcomm.com>, <linux-doc@vger.kernel.org>,
        <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
 <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: 04N-WoUzOBZRDx5GK1Y4LvR6xGzOq1t8
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980f790 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=PElOwc1BOWmaZxrSg6EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 04N-WoUzOBZRDx5GK1Y4LvR6xGzOq1t8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MCBTYWx0ZWRfX5Wo+tMOBsY4g
 SPbMEPQku5u66Ug/+4WtP127NYookkmdyjRvSeidNCTStg2edk45lQ6QGgzyNm8ZLojFVqd4Y+k
 SUgkB2tW8l3UTkSpdEkZLSFUP+VUmd7s4eT9TLRw8Mna7A3glfFKZjAm9o1no5R/jcaJz5YaYGI
 RdWItjxT3Uc6mmZSyPmx67H7O08jtZhu6is8VnxMartrQTP22vTGS4GUBxpW4VyHqS2Gs5GEg6j
 47stzczjuAh3G1h0jgkalPIj9BCbL1HoDLxvLwkkCnvBJA7fPQ9xOA+QblvY2JKaoR02pcDr609
 ASxK7KxxgTCvFS4/0SVe2r0W60UantnU2pGg3U06UIVSla3nKI9tIqQxLdatU0YkfVf1XuWUHum
 OfhARrRg4KYkW0glWMQeJDbAgTXQEVU7EHf+9HHU6yXCkcZSgTBYAYEBtgj9BHs+EQKpoRlLg22
 iyZJaeQNYGZODsUNKhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020150

2026-02-02T22:07:14+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
> supported by the host and record them in a bitmask. Keep tracking the
> maximum supported G-stage page table level for existing internal users.
>
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm=
/kvm_gstage.h
> @@ -75,4 +76,40 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gsta=
ge, gpa_t start, gpa_t end
> +enum kvm_riscv_hgatp_mode_bit {
> +	HGATP_MODE_SV39X4_BIT =3D 0,
> +	HGATP_MODE_SV48X4_BIT =3D 1,
> +	HGATP_MODE_SV57X4_BIT =3D 2,

I think it's a bit awkward to pass 9 when selecting the hgatp mode, but
then look for bit 0 when detecting it...
Why not to use the RVI defined values for this UABI as well?

There are only 16 possible hgatp.mode values, so we're fine storing them
in a bitmap even on RV32.

Thanks.
