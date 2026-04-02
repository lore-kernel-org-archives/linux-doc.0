Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99611345CAE
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775153993; cv=none; b=HxZrZ1FDFXQWOrqZJ79tYYJotKR9caMF+w/ILFEOGw+RsEAAJzPYT/T7Tg1t+1YFtZxSKykwvi/q/GMYMyE4YFon3EnRrDqh0md1fGfPWhEGbn/wcTmadKXlGWkds2Cwl810X/NmH1l019okQIS6jbCpabeA+DWKcYZSCLfxPVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775153993; c=relaxed/simple;
	bh=cphyPCgyL6ebWPWnpuwMV/17NOnBN54i6xVER3IgbQc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=YzUG6+ybOUwhb1P2VBM1lYtDmLu7AcDQaxeMwQw81e58wjV4KLg+jsOsxGJ7rg+RbVd7QKuBXiavf15RGO8usTBfBlL7jzfSUKJe8Id1+8X3YaoaofqmVLKDZ2DbcvJcWWoVFpXIgHMXnqGORckLWC8Q13CGJpVQSM4HnWhNhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYc0L+M/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwApsvXl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYc0L+M/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwApsvXl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4TAi2255083
	for <linux-doc@vger.kernel.org>; Thu, 2 Apr 2026 18:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=; b=dYc0L+M/7pKMzfsJ
	Xxh2RKcWwrM1NMLt7U9a1q/qJ8EUI4G1em6m584wOhh2e5MRjqxDvWnj2rSW4YWA
	pWMx3EtqUW7MWn+AlPactqXGo8LxbLsmeD4m5hpdoFqmZtKB5TvpfYyHHot7ABsK
	y8pKqzeWw9pnnF8teo5Lfc+ltfck6i0+fN9YQJqbCrBFxGComSp9JzdU3G02GR01
	zJ2Ff4dVxsGLydLlF78ZyMnLobclfcZf6NUCGL8k+nMkqP8gTPN0b5uOo5tuNfoU
	GlBardYOabKU5XtR+g0ZF4G33Yji6oyFNaFovSOQYfnzFPXwYhYxAuHATSOD03k9
	QtEboA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t29g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 18:19:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso15789761cf.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775153991; x=1775758791; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=;
        b=HwApsvXlZRpQacDjqV4SSelAXBjRi/FXN1fdPqCc+el2IbgYhQJOXH4zYr8ANWCJwL
         OkK+8DIbl4spDW0THmNnZWDZ44RFhEmZsQ1LZ4rtaT4CTsDcH/v/CgM6aILdX7JpMsEc
         aKg171shZPC0RTz+QprvE50aQSvEgP7jhL7lViDLF1B1wyyKlLrjFiD0mDVyHMsA8cij
         jrumXmYcjPEl+KzbHjvocddjC77fpvpI69I4lSpdGdLAr0vRJ4Kj4utxzjl2F2mTiubE
         A2O4ncTR8WIV8L76iDZMhb4tSH9w8ZxvpCIQX78ccckMwAD+GpvBwHRc1MSghfGn7BtG
         Q9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153991; x=1775758791;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=;
        b=JUeTJUjwAMvSNVl67NIo09s1rLPXoNNjDJhhEJKrGFyCBBKjAN7aY9X1YtqmLmy/uH
         W7I0E6IIXw5/FOnoqZvBLNhqoUs0T9Vm+M74pO/gQPsqORCH75wO2Mk8Ji0Ri0dD6hLZ
         GYmIOrH6HzRRRx1pA+ZQPXogwsV8FHWj///uin32UAxtS5plzcVfCqUTNWvkWhLkSWGl
         U44h634ggzaftvKfIIdZSpu2wMXh9/wyOTqtXB8ZhQTStSRSwxPrJ3qXtaG+rVIZINKk
         KDY8yxdvrUbkbdf93rJzLV6/UE6vt43fwmRrusnF3inEJL1Cb3dBiCLl3tXIegPb/qv4
         LVrA==
X-Forwarded-Encrypted: i=1; AJvYcCVfu/4ydPhIW4rxlFdLgsPOLsTZ4ZZxHKXsaty1lDpjGKMHC7sH5yMhRhNdyHHmlFkarvDvhzZvNas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAPrzfSLDYq9V2vN0x10q0eiJvpncKK3PBZsk2z0Nw6bLLhiDp
	RJtHDlCQUhn3XGy49/fVsI/ZT4zQluUycFHqwJWjWI2xB59M4G31DABaPLtuVHqmjqMy5t6MrkQ
	4mi+k0j4pEFuV0JL9HiE2Cv1jOGaqkAF9G4hds3b2Bn7veqI5hAhA8+8tu+FJxn8=
X-Gm-Gg: ATEYQzy9/GoRL9nCZUX/wJqslE4t1ZjyMZAhdjUjq9k9ZyDGPhivSgFg5pWm572seIp
	IYVud0lkvkKafPKJusbXFFVBQr4XSKm/Q+vZSb+I3NU2vNf8DmBA5si4GUV0G+WEfnvMPXN4XU8
	wzXQLWB69+wBRqMQSzLf9RyOc9AC1ypQ0y3p4nwnbNH2zNbxrYfB71PyoVgEv4MagFPvlKPE4PW
	sWdfGgp+2zmXx6qvZhW7p2AfM41/Ub6gCMh7117YMjhVIDQt06z7WlFf2x8/T7ia9dsAyE0pXI/
	BhR+rujC0Ec/fmnM3Da1efMQNZhNmOxjCVuWq7Igrx7jgjgkT4vXHF4eYAzLqucXEE6A+D7EiIr
	oVhlZijE9EZ0kgyNjRZKniQoBG9zY6U5eLFGtpxdcXXZpNtK6iFn28KsefqEd
X-Received: by 2002:a05:622a:aa12:20b0:50d:4199:8c88 with SMTP id d75a77b69052e-50d62772bddmr5001871cf.1.1775153990870;
        Thu, 02 Apr 2026 11:19:50 -0700 (PDT)
X-Received: by 2002:a05:622a:aa12:20b0:50d:4199:8c88 with SMTP id d75a77b69052e-50d62772bddmr5001461cf.1.1775153990314;
        Thu, 02 Apr 2026 11:19:50 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c971f03sm114386766b.7.2026.04.02.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 20:19:48 +0200
Message-Id: <DHIVKK81LLM2.3VTYW1UXM6USQ@oss.qualcomm.com>
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: mFXm6D2IULZrvwItJDwcPPaLXxlokYJ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NCBTYWx0ZWRfX8cdwtPx5/B3W
 9XqgRVmVU1jRZGgSss24FA10HLuojdSuvdKJ1aHturTsA/WtisBPFs7BelnsiQbtBuiy/l5NRKc
 8JdS3kEJjpLeRF3NmhEh+3gQVikkVtGQg8OITJQ75DhEZo4uYh/KD2FbsI5U4TeTpaQgptCSUZR
 BfgyAxNxHBMuSAkQQXvsrWUx7jjbrvefdKQlyGo3jH676cnI5053akjE4wRdjguUnUIhpy6tlK0
 xROOGIlxO4lpj5ZsUxUUU856YZ9jaN/wJFJmaTXU8flA/tg27+9J1VbIXvjVkv7TcStfokNav/A
 Iwu8MH8PQicV0dWYNwL0kS1bR+gHsbjODvH7zlPRWW+JXzxBG2VRxnj6m89cY3JcOHBoahYbFhS
 6yyYt366kiBTCnyAMfBKGzq6by4GKRVMrMTCLYCdPNsz35DfN2qxvCZOYiFMOAZqcSj8LvRZ0sK
 9lSJLY+2oIOLWlNwmgw==
X-Proofpoint-GUID: mFXm6D2IULZrvwItJDwcPPaLXxlokYJ_
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ceb347 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qHmfJlKEtTjsIq712WoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020164

2026-04-02T21:23:02+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Extend kvm_riscv_gstage_mode_detect() to record HGATP.MODE values in a
> bitmask. Keep tracking the maximum supported G-stage page table level
> for existing internal users.
>
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm=
/kvm_gstage.h
> @@ -102,4 +103,14 @@ static inline void kvm_riscv_gstage_init(struct kvm_=
gstage *gstage, struct kvm *
> +static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
> +{
> +	return kvm_riscv_gstage_supported_mode_mask & BIT(mode);

Shifting by more than the bit width is undefined behavior in C.
RV64 effectively translates BIT(mode) to 1UL << (mode & 0x3f), so this
could allow values larger than the mask.

Thanks.
