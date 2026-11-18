Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964036;
	b=GxUrWomhdjv4z4sZm3vilFkFo/jp6YfWTT/dBYzK41BkwQCWizbX99N3IQdBj1hHBYVR
	 OOh83d9YBGfChVmVUYwnZ6NlTQGK3dv/QTVAEie55+zq0IQGs+kvvTf7VTutEi//DIMhP
	 5sR/mMALD4uhtuDt/aRmfAhL1hdE390B27T0LAwC1jhcoJUkHHVqnbGhI+tp0XBX9OS/A
	 zpCAxBe6v08P+tR/FunkhL9yxL8IWpBl6TyXtOptfYUQB+1Od1akx9dVWz9zeG4euL+PW
	 qIACYw1OIdYo2QNk1O55n1IwdJdAFOI6VEkwLuSQpUPtqU+rGOWaJMlLPQSzulxXBGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
	b=YhOJqoljaCvi+I8S25y5BMhlJkvRrb8AgHXDw2nWj2uWcwXNLn+lc6ywbxQnnbtr6sWB
	 qM2yvGAH3M0lmOcuwfW7gOebtB66HAejLTgZ1DGMQqoFnybuAajE1OhHysBt/q7EbSR16
	 qLKgfHl6d/TbV1fAfyCqnKB2teMTt+XN2XgZOIdy9soZKtuQG5fCt3276WfqR9H60ovjP
	 EtU/M18vEKE9f7ZflD5zoenZBOEedK1htlzX2rdP61RA3L7L40NF/B3mxK5UD7RK97Et9
	 mGvXJJZx1ff51o2EbFXENKs/HsqgQlpbYmR8lw1RcFogFTnSOvITz6gsYf3y9GyWXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0vFrXLK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SnMS6qEU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2F1606A31C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 01:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E2F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0vFrXLK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SnMS6qEU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMerUK2877790
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 01:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=; b=E0vFrXLKHchFOKxN
	ecQsM1ZRtXi0Ym6SsPb7jY1o5WiKjJH3ZSYYHxZYRHFZ9OI+gjScKS8IUSOxjr9I
	CkRGyFvhUGTsghPY4aYuRNVbbD1wVcdHGTvsFGxwNLIkGrZ0bLc0qPZ4zgXUdTfN
	70LfnKL458QRMf27y/T8m4066XpVDnpSmMezQ6wm9EXdSqkodGPQeLRPtTuU7jDc
	8XQJHvsxD1i6T/bcMZ6xC+pXsA9BM/K1DuNW0G0iznp/wWbxbXLsYD1CIWClOcSP
	1l02aOG641oFsNWQf4zaniM9hf5SlhcMKGaq8QzwvMrJZ0sJlq6JVFNSmh5cnsYx
	o6BmTQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8re5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 01:07:15 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so454253c88.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 17:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794964034; x=1795568834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
        b=SnMS6qEUIhsA1ZNPGX2d63ztD0osxhdZTzmcxrGI9jtu2ny83ZBbhlOGPqVAQkdo1C
         +f6PRT4xuyPIPQgNKKchJuV8aP3tsZ8nWfcVGpcs2WTeukTJp2Vv96YhqqLfSjMB/Gob
         eKHIwPJYt9ZTB5p184UG3b1o6N8AMohPRl8PNRJK1s8u9JTz7jnAGiZb39Ta43az5uLg
         7/0X3F8TXWkOIOs66So/KXrvI+ycTnKpwk3CV0kaG+kCstX3+nnGPOJej/3S5UTntmkZ
         bSGeiArNrtHDy/cZ6PgUZILWSxictyTlIGV/PC/yN+ZRs0bJLvAi7O9KEfRIwBFs4n6Z
         X7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964034; x=1795568834;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
        b=tpyQD504owOQVQ2Olby+rnxJLWXRbYB4pQZXBVAobmUhKeOY8d5umRk3KDOoia/YFv
         39WsHV0Jn5AhXZ8DUDYUwCi+JFVCM54efah3R+FrQp/uTU/zH4ib+22YYrTTqk1tWsAw
         0zcyUtSp0yHESU/WZhjDbYtlWQxtlJGTW6XS+viYVi4+D51DV9CY9097BehPIGZTWcgR
         TTmvuyuiriYO32MC7OKoNS19YpJICWT7+tNqS1iXILpEh+rHZDOCBeRbQ6ceSxO/heJ9
         XgE+6XFeyFclek0pXmQR9Gx+IP5c83L+U5P8+FeszpcykVezV+HhueM6GzCyPpSqrsDD
         7KkQ==
X-Forwarded-Encrypted: i=1; AL+hErEbhaz34f4MX6CI6Fi+lftRAmhn+vpbMurMqwnSWaqyOVBNXFAC3tp3DkmmrqDJ7WT8Slb4+tiG3Pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ofXEtdjpg3ReH1Wmws0zSrunicIqcrPRBcI6sAECMQanBEwSc
	NNHA5xWBL5pZn/UWoZnJOzSsdZtBjTMdJ4Cf/1YYUjApLDszZ5ViOdlscxqMqG/r8nXFiIkexmK
	N5UuEGphdpRTM90oa6nXW8JB8Czzxt+84awXIhGUVanIbMOcjlXPmqX3vKsM013M=
X-Gm-Gg: AYBFou26etPjbM7cq9zjJ2h5o35nb7LDrt7DF2fi8g674fr9AFL3DXgfusPzqBgTkzn
	6azYmyZgGGo7Hz+80wr9pxZ5fEWr/kspvs2vWF2g42GLfnfVcIGd6rTVS6VIMqrmz3vzhzSnPXL
	K2kKSL5W3j0bCrcmBNO4OI+uvK694DOjBWemEsghYkfKGrg8lYHySC0wSClTFh4IcdYBGUOh99r
	FqlUPFsHShU3AXNt4ZoOEjMtXOJt2fqcthtuZDezSYfDBjWQh9aL7qOE9J+Hah8CZ3NV34YRLyG
	TWD7WmJp/mKpuzoNiPhaMtht2El0bPeLK7eWTzxbYERpNyYfhX4elfA3Ivex+Q7oRwgfJbkkVWa
	U7xPUg3Jd7aYSzlCueJ6dGmMNpCGue05raSLbTmd7Tgpq7sqv1qqbq47W8/1Umh/LcgfeIRkvY9
	hVo2AyBbTFecEZbjqCf5j82okRYSg=
X-Received: by 2002:a05:701b:2901:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b543d0daf5mr1270253c88.23.1794964034419;
        Tue, 17 Nov 2026 17:07:14 -0800 (PST)
X-Received: by 2002:a05:701b:2901:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b543d0daf5mr1270241c88.23.1794964033945;
        Tue, 17 Nov 2026 17:07:13 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544830c99sm3101462c88.15.2026.11.17.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:07:13 -0800 (PST)
Date: Tue, 17 Nov 2026 17:07:09 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261117170709.00002088@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afcfa43 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=FHltUQ19mvutv370iQ0A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: wz3_fqqrZNzpaNyDUEdHmeBkkA-397G0
X-Proofpoint-ORIG-GUID: wz3_fqqrZNzpaNyDUEdHmeBkkA-397G0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwNCBTYWx0ZWRfX8RDLyg15FVjY
 eYgpUhlF4PcShzBBYv+0yDRB+bemvwRfRT/qBNhag9DJm+EkXjJZXny4wQ0t6l4PB9EpVHbptLo
 F84v8Ee7A++YObE5PpxqDSfR7MB8D/U45kBYbuHqxkYabZFVpRsDoXr3qJTJ0fD6r/Zpc1v4nvL
 RWYpESbf1z46FyQ8kqgMrisbm6hrKKILJ4so9uUC7Um1x3gE8250eLB0Hsl1CeUzpjIzL1xaFUy
 XZDOopFBM3LwEVBpBpLJrm3kozRVPxyRO3O3/azle0YSCsa9pdu1FU+prQwxJksxSAESxKGhc61
 aEt/JEwgw/rrZGdGsHME5V7Oj2169EsRLiJYP/2TnSAeUINsYvboegwL+R7uoOyT7oAkWWPUXYo
 tz9ZfUQWfnQEvD2zFsuRnyNaQQfiQkgC1HYpyLXFBy8cLoz8pirZxGECQTSV0TUzdjRIgA1O+JZ
 SYaICLMy7pBqqR3GbQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwNCBTYWx0ZWRfX8sLMtT3kz2iu
 uOq7omj2A/Myf/duBEw3pYtTyCUr/vpr94Izt+VNfr+dLQm1p2ft0t5JR9rEYMCDSyXG8EHepTp
 mjW7l++hoI/fvlWKmvakPrrsl72a9G8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180004

On Mon,  9 Nov 2026 09:11:46 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Hi all,
> 
> [TLDR Summary]
>  [V15 highlights]
>  - general cleanup and hardening driven by reviews
>  - improved TDCF access routines to minimize lost samples under load
>  - completed ABI docs
> 
>  [V16 TODO]
>   - address any remaining V15 outstanding Sashiko/reviewers issues
> 
> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.

This is one from the family of issues you find when reviewing ones own
(well LLM generated) emulation, realizing it doesn't match the spec,
and yet works.

This works fine without the required SCMI protocol property in ACPI.
2.2.2 of ACPI for System Control and Management Interface 1.0
Platform Design Document. 111115A 1.0

Now, in here is an informative statement...

Protocols not listed using a property may not be enumerate by the operating system.

But they are... 

So, obviously we can ignore informative spec lines but that is a pretty strong
sentence. I can't immediately think of what would go wrong if we ignored it
- maybe we'd not pick an exclusive PCC and fallback to a common one the firmware
doesn't want us to use?  But if it doesn't want us to use it why make Telemetry
discoverable on it.

Should that be wired through from the ACPI parsing code?

Anyhow, not something I care that much about but thought I'd call it out
as an oddity.

Jonathan
