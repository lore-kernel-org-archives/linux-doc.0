Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443850;
	b=OkS3XWMgaZk8a2anMePBsnKUmN+ZGVov14iNwIqamRufjFL8fDHUVO4vgRTkc3iSLLOb
	 85TjRxMjKSTGYmZkEnA75Z9SmwITmijG2vwFm7CK9aqA7cPidv4OnJqW1pBWSmhogwV15
	 oQC9cgd9ProHQjRRLjGxFLbs4aNId/F4XBsE62FGBF+9I/jCJEEWa9X6X+RnIk09NGVER
	 5UmUyMiEk/W6HxP8oV6LRENJw3f64rP6BnyLipob8keqqhSOPf+fEgVEkHtRyxpzvn+eZ
	 zz3yMpKKeFljHYuVUiTQi5Ri26b19rFyY0tCgQG60E/YYo34K2R2oqoa+CDnxhL14Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
	b=t7cB6CLv5H4CULutU9DMMQHTa/b+XBRiMDLYBYKS4+J1nZaFDhh5XqK5Vam0hA+xTdKT
	 5KT1vdb0Nr3l8mgFMH2xU6PB/JXM+2k42CLzLlrS5d/haZcbQdbQRTr2D79mUaXAQWp2m
	 KaPVjDCpoK1+OSJ6h9DjAOLsMLoDK97J/7fpZwHThW0wXTRU9MQxHzjMeBsoQuuhBZB8D
	 Csm/lHvytV2MHLYxkuvmFACmbCAroV9IAuUrodLY+/DIxn5Qp8zp1gteiBpicweswpbVi
	 wCwWccEQ4jb7etw5WRZzEcMVng672Y3jIcUZwc46iJasqdL86JemIoqWgOi2+0GoL0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NG9cy6sQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JT1aN1lc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36398606A31A
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 21:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36398606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NG9cy6sQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JT1aN1lc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK1v53627855
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 21:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=; b=NG9cy6sQH8ZkfYkG
	H9XN29jQrzjrkPwM97s7ROfLzJ4085SGyOHFIPYfqOFgmvx18QlIM0mcN9CYhPR0
	lue6R7/7a1g+mterYAsZMRmHr77CAYcI7npMB6EjJbssC693Zq1Dgft4FBKZ+pGW
	R8uaqXhv2dxCpxnGl9RyG5AiFjj70fIjWTTn1O/jkMac8LvkKK+TwE459/mC3jGF
	FgkHFmnEbMaz9Oii/9Ivak9rluRfdDSoIwYppb2L1XtOFhQ3gIxzPzU4Sz0tWjjU
	lpqbfoeTwgUWv9F2G72fc6SuuXQLTWQejgRRQcA2gOjnexmsSwV5f2k6o0lJYANE
	+uz8Fg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr42gn5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 21:04:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so82585eec.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 14:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792443848; x=1793048648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
        b=JT1aN1lcDHBfZRx7o6UNu5YnLK5/JhnqH/T2m3MR6E33x/Yv4aECubt3RVguI40KJq
         2fVRsmJ4UgEw+0Ao3xuSr/LBYVTmLYQKYWmue9Fny82eidZJ7MVyBTPIIFjlrQlDXja1
         t0hFniZoLMZ0LGVQxEVgmIigH4M0Yri8ioLidolqYbHioG7HDT/Q+JSbODjVB3hMICAv
         oQnBToWUc9nWQCMUnVwtVj8TyT0DO/SYqL7CyBOQiXZ8/7FtZ/C6xB3X0rp9nMKFjcVB
         YXWDUElofcC12XHjglaYjDbfDpDjBBNCacLc7SW6WnWJmNxK1y1WX7Np/OGTU7li7r5E
         avIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443848; x=1793048648;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blTjjTu968skKectCc+Yq/rOfNGyGv4vOrqn0909Bn0=;
        b=gemSTO8OlHfhsRrWx1ZXu3ZtvWMlG7H2hEqe95zjfJbzRWVOPLAHel8EvmgihIHevY
         vkjbdcb5y+NQ0s8mac1trjyHdbLd6rDQvjtGLQFNbnV9GvrN+bYMMK1HDjKOGwQ3h9YE
         wKxNwPInCtqsZy3c1f7qFI0NgBDORY2YoqI1mE1TLRk9r64OhhEov8PDTLrwfJwGz7u4
         AivN4QgUVud1FI+v5dyTlEhp4nYFpkMTR1nZoIz53qarRRF6wSyHmJV25/opg70ClHlP
         56jEwqJQQr8vXP6ckiu9E6R7D+pKHvDfH7EALa/IxGmbQzaBBp9/Oy8p4OkFR1+zuynw
         jCfg==
X-Forwarded-Encrypted: i=1; AKwUvBy4nsEnNBDS0Ovfs+iItz4mIQnx4UmsLi5C5jnYq0inKx/3uu0Xtw++Rn0z08UdcRCWh/Tav7UHC/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfjs6bJsIWp94nNJDT8Tq6CMuLG74yXGjgBI6GFUmv0EPt1tFw
	/QY4I2+FKiDVhiU9wysJVtlvOCl8J6dSvZSWsh7n7yGzK8sXLYJxT7PbudWEX9PT4dh8PD/K7ka
	sAHZNM6PWFkpgbg4374H/OBc9HMtzPPBwJxcrm6cAiBR12BWIIGCMKGD6D0YH8TvKb/97+jM=
X-Gm-Gg: AYBFou17odtkBSGWyQD78soQUBOZT6GM84C4WZ/NQHDtM+en8Fffkw24RXz7oeP4LU4
	TjAr/M5sl4+SJQJcM2i6iOQWNQyW7Vn4CPiWgCyZySfOB2nCHNeIQQRgDewzLXoQB1xfTeb72Aj
	x7EsyDKY8D9d0qET73BYIiFif4ek9TcDGt9NSxuIrRvigugNPF8vtzATl4JAurftOd54RScCnMY
	DY1G/KhFVtA6E7jeXhJpg1pqEIz68kygQKAZIvcerNTbrU79wSJyS268cRV8czmtpK6c0gDM9kf
	iEjiL/1hghPiA9shsaG3rjRUMvqWHoFTaYyTaENKW8feY8r1oKedCABTZ3LRHc+9nXZgjunxT7/
	v+/Ti3Mrau1rAiKNxq8yUkVtHD6nK9YZLddcMg2bIvA==
X-Received: by 2002:a05:693c:8214:b0:361:a195:c46e with SMTP id 5a478bee46e88-365f83a0701mr382435eec.1.1792443848216;
        Mon, 19 Oct 2026 14:04:08 -0700 (PDT)
X-Received: by 2002:a05:693c:8214:b0:361:a195:c46e with SMTP id 5a478bee46e88-365f83a0701mr382370eec.1.1792443847154;
        Mon, 19 Oct 2026 14:04:07 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm36508652eec.21.2026.10.19.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:04:06 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:03:57 -0700
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
Subject: Re: [PATCH v14 06/32] include: trace: Add Telemetry trace events
Message-ID: <20261019140357.000075d3@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-7-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-7-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX3swq4IkwyfrC
 PUUB4eEMBHo/HSI93SjN5Q9TKcOvgSfdzY+frKw2VPQK0TOa4pBGQZPX5OwZSnDQjbF8cuIzzLX
 jDTprhNj0DsJH1MB0hQU/FuE9Pdh8MqmuOqdT26WssKCzJzLC0poTauEBXiW4xsjlxQkUTKQfJI
 e7n7Z10vsy0Rk+5dFhEH0Y08nA1Ewl80M6CYywqdFEUQAvdnFTe/EH3Z0h5xelmLPL4jrDZopNo
 6P4q4QTi03QxYlO/v+z/9/ZxC96PgeBBRP9xiftsJdMnYKzuULiQ69A4/OwtZQHNRTUtPf9YKYm
 fGUVePZZwoJbwVP1oxhOPuJeMoUNgB/mm623uzoMmwz5bZfKxiiJtn6mjNYFwhABeRyHquAPHEJ
 9hj7qpwyUWcIi7Fzkinx3jAk5yO8W5bq4vdVCzeRBeGUoop30Trk8pCQW3dDNnZyiqZo98PltTB
 m7qXKoEkWVKcneONqig==
X-Authority-Analysis: v=2.4 cv=Ve9ir1p9 c=1 sm=1 tr=0 ts=6ad685c9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=qlR7w6QO3uULSQa8ePQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfXzCQgDHy2Jpmz
 f307NkpqsQr1Cx50Sv1zWrz+QAnjjulvu31crSBaO1/a2nxi3nzIh2n4izg+Qwdrh0GGdHcaMPT
 v6mZ5pk2H3xbyRmWFXsa6upWVulFDCs=
X-Proofpoint-ORIG-GUID: dJMzyj-lY2Tt-8sj2qSpIBs5rKMdTk25
X-Proofpoint-GUID: dJMzyj-lY2Tt-8sj2qSpIBs5rKMdTk25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190083

On Fri, 16 Oct 2026 19:55:27 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add custom traces to report Telemetry accesses and collection events.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Fairly standard looking simple tracepoints so FWIW
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

