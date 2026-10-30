Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389430;
	b=cuKUXJDzr/XBnPC89XV3amxtuuxlj2qkjM9iqorby2dRtPd8nkw3FN0y7mnk8z0odD+C
	 jF3HgoqFqEVc4/nU2rBgQSGr7Bp98JFFSkQFHChBvm9jSPat6Nqa8q27OlRbB2SnTxMDr
	 7y9T3ixdMd7NX3w5gQD79jq8OjuFb/gkORFTCLPYKk+ND05cVjh58nKCMUvmhN2gyTsb/
	 z202Ph89Q6UvxuuNJyFC6/45wNmszWSAc73Rfxfagee++TCsuMudNseDyeSDTB5IdX/F7
	 qZ/bzr1CugEmN1U+vL7GtrFuHDZ0TZ/JkzvIpf2/btePY1e/w0JSb1UvayMYYz6SnFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
	b=NEoMzT5jNHLhPD24EZqOY8KmZzWpSeymd41lrMm4BHfi6xSOWSiiGYNanXjoIyQ9yzEx
	 hMFpN40aS20RoBSXXLKfRXJsgptiUY5Xo4KtKOWXpyq1sxFgSw+nUz8sY+6nmJDKQxspJ
	 53KGwhbQYmoj6jpMhBcFf24Ong1+kc2Xs0ZF1g3Ps0cAlVBW7VTJQXsBm8zBYm6zRk8b2
	 7H8OmVPoXsTbisPxNHIBXeuTBW5SAtct1uTJAnExHMPGQ+3nZ3AtNVaCsAdpj25dzmCWM
	 WeLHThETsCi8MyzZLKGOnCpV/YlUqVRLTp2ALLgQi4/UrXnz8QEKhNvQvL7YbsRu25w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mg/YKwDX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kyc2IyZs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64DD606A31C
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mg/YKwDX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kyc2IyZs
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhiG5487185
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=; b=mg/YKwDXjNT4sPSS
	zHJ/KjhTajfRCuh8o7XnjdPQKkn8VSnYjnIsnbyIEhg94zmXDIKiOPQJlUhTlE6K
	2JhR6X/Cbjws4VEztAiUqalx0ofpe/DOi9JcvImPuxNn2IO3nP6Hieu+c+OJGwWp
	PS7i2yXjr2YyK2VM27vAVwD62WF0pyNU+YfYk5fgyOH6Eke8mCha8F7yF+OHx2TB
	bDNO4IgKFiJv0cG2kfQES8MJs8kXeOfxaeiDG3qtoZ/U5I8+iB0BAx40hUEl06bt
	NdF8TYkbdzHL91dV2SH917+kOcWvaie72JboesjUDflH4Kc7SBlu9ozhsfGd+cJT
	GfmSzg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s705x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:43:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-193b5eb133eso1217664c88.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793389423; x=1793994223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
        b=Kyc2IyZse8E01JbN0ZV6D//07kBPkwXg0tDFxT8jjQQv62wmtPzb+rmOlhPixox2MO
         JuDJLo18/PbZbWcBKT/6SJN6PPsQnkdUcBFuBMoyVF3pJYRr6JhB0gf8pIwrA4W6BJke
         pGXRa2tuyjLHe3HolXi5OhnFUG8cNUitcsRcoBAZrouGpnafOOvev5jlpP9uUIRhc6HP
         AH7G2sM81CGH4k/EVk1Mmjq16m4603aAcJRtPm7bbwwpaDysSzbRt+QE86kTgQgwMTc8
         foaNaoKpJHZGlqbyLWrvWgI3uUiIHh44dcE0ORoOFosTBuDAZBTWIBuGjgdsDAW3hR8V
         B7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389423; x=1793994223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
        b=h7TAKuNFXCPhEdWs+6NGH5PBHcTp6bGcSi+42BhsMx5d2HTZKzOO6jtyQ8EwOy52Tf
         x8gq8AmKHI4ShkXtGHsZ+m03Uq/m+Zj4kDK1uPozJZg+Q6uNFSA/Cp8RBL6vt/P4x4Go
         N3oiZ4L/Uf2JCRrP66Go1UnhWkAeykIUaN68EdAtDjuZkzta6H5DAKpjFfv2OoUuaXWL
         0wdT9ZxRD8Vxpivc4vdgg+LeWiII+xtgVw5XELq4jA/8QkBX06W4gxyqZNG75SQUAb+P
         xQuKG0u5LtzP5MzYkyDHp7l0lD4GAfjazNYY0EKsOjrt9uD+5FwhR9wlHs5c6A4+wu4y
         mX8A==
X-Gm-Message-State: AFq9FYLFxvp+b6xKBaltnh+laM5VL4w7Jy6PHcorbiu221LDuzJNjpOZ
	fbnBt04IY/GumPcqxKr9G+QEWgqDkpST6G5nSBuQPzxicHnl1AG8BmC2/1uwV7Oo2H+7knEVDLh
	hxJyM3ONVZfRnU5/HoFelt/0r7xY/twzwYaXLUrcKvQuFnzEsQUAGIsGi6VOVgrw=
X-Gm-Gg: AYBFou36UkAnuY50s1xM9Zlims23qnBinZh1vUZb4tR2pWd3u5QzljKLfM26+w+vgfE
	1hYDJCFHPQn3TNSyTAK2E77T2zEyH7fXAJcnuJpjcuNVNpqZ8fdu8ZZ/BXGIzr3toQl874alfGk
	1msnCypnu437hzcpRjOEo4sKtzJt/PpG/av7OpJqKIP8ZH03rlWy+y0Uc30FOJ09sL57xjuRcWn
	z+03L/KcVBXX5EbBhXASF7eWJx9I0CIAmYBwCzxM154EFmRY7QAUsci15eHgYvvItj57LQ8HwSH
	E6eY7kz8fxjCZcwjkP3hQ2FxSRvkn6R4MXl91Zs4F4wNoZXN+3Le2SKcrSLlzy2KL4u/4V+EsS1
	2c5AqraCj6tXvXBfOx9EeoyJDt8YrKzKwYuM08SqBnvms/ChUNDxLnyIPfYxA2lxbRqezpyTRZQ
	k2wkFfNW+KNQRgDdZoXy1OpeU=
X-Received: by 2002:a05:701b:2052:20b0:18e:5292:2670 with SMTP id a92af1059eb24-1ac5d88cae8mr4358384c88.23.1793389422499;
        Fri, 30 Oct 2026 12:43:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2052:20b0:18e:5292:2670 with SMTP id a92af1059eb24-1ac5d88cae8mr4358362c88.23.1793389422005;
        Fri, 30 Oct 2026 12:43:42 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm10965340eec.26.2026.10.30.12.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 12:43:41 -0700 (PDT)
Message-ID: <0f57c001-4c0a-4b35-8864-d83ed51d0abe@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:43:40 -0600
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cooOAF4i c=1 sm=1 tr=0 ts=6ae4f36f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lJNEF0nvcUjEJBKM1O0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: JUkCkwKyk9yWmfscUbeOLo8wwU9h3vlU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX7+QXtuLzO748
 IKHU5j+pLPDhcgyqDChDpszeI25H4udwYvm+TH+uuRz9IciOqrdn8jwwxGiAh0cii+SJaE1LEsz
 nxsOrDd7ofhg4iwHz3bNcEtDhrP/PobxQhkqLPk2el2zUlZ+DFghvVVFnmTF8wgUrJU1iLFQCee
 WAP5Ic6SI7mHkOmEJhfdt9tvNWzpA53ABpv0wxHlRDmkNQ1VOey1cf6BK++GoavABJadu5xmi1n
 ewEr+oZldDwdijfZV2bsYg7HX+RMCFGJ4YXFToJrp+gPdcmSOwVO6i9PMwTahFHCXGOl30yOR10
 woJDhGPLnm8trv/L5xstjGPp3Z6vgtjgmyzYPi54faKsX1DqHgZoCqewh2B3N8lk0HgaMq8birx
 VN6PmlL2hzRrCBPVuBIj+8a0p7mK7OOxF2/mHJ+4DCPBGu8C1G7r6FdR4Gy6R1X5voRanv9rR9a
 tlkeulqM2ogBhG9oHfQ==
X-Proofpoint-GUID: JUkCkwKyk9yWmfscUbeOLo8wwU9h3vlU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXzoedEWwUqbkV
 lkhUwiIJwi/px2fFQ1Jh61K4hTYPDRQJkq7JiRJEwTNq0gLI8619LDxVM/47mVK8hgzEwIlwn5a
 HBcqt8oTzvFnJBBN180MPkiEw99MyVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078

On 10/13/2026 2:45 AM, Kishore Batta wrote:
> +mhi_sahara-y := sahara.o
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
> similarity index 99%
> rename from drivers/accel/qaic/sahara.c
> rename to drivers/bus/mhi/host/clients/sahara/sahara.c
> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..75c0cf6010e1506fe661cfd110112bbb37465880 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
> @@ -1,6 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -
> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + */

You've been told multiple times (on v4 and v8) not to touch copyright, 
yet here we are on v9 and you continue to do so.

I'm stopping my review here. Between public and private versions this is 
the 15th version? The 20th? I've looked at the majority of them and I 
see you continue to make the same basic mistakes over and over. It does 
not appear to be worth my time to continue to point out the same basic 
issues version after version, and thus I think I've concluded there is 
no point in continuing with this series as is.

For the entire series: Nacked-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

To proceed, I think someone else needs to take over ownership of this 
series and address the open comments.

