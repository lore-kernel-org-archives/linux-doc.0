Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AD92E2825
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 04:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788983; cv=none; b=BJdepXVOcsUhr/Zky7YUO8FFiE/LuRsPSbt7L9QCfcnCz6AsbPEByMe3wHgOmK8GsXVV2A7RSxdS4yiIO/8PgKoMjk2dJb0tSyZ0scU7rHDsITV27XYZVKw4rfBNbzsKxnwRevVXizz4HL8epXfqyLxysvEawN4PasaR1kjG6uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788983; c=relaxed/simple;
	bh=2jLp+9owgiqgZBOCKFldUxG3+QmUa/8reLXIFzBTr08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGyzavqe2cOzK6WE1pmOG302ncBN6FwS5EiD6qLfuDK4rrbkHAQI4xNRyJZA4vA5W+KWnYIVYctkiYVtq+NfdlhTruFwOdl8zfa7TqgV76tLyCEcF0vaMnfnPUV2DuDEGZeiX8zc6CZCyesTd/r2ZJzLgvXn0PSZrzLqEEthftI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iU93sRdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iU93sRdK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SBJ4010468
	for <linux-doc@vger.kernel.org>; Tue, 2 Sep 2025 04:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	83fAnkrveK9gQC9R/+BmmA0iOQTFfDns/UdMTMdybB0=; b=iU93sRdKWl3pXPjk
	CJm3C1+MEZAjvpK2QCNBTrxyaoU8Dhm6LI8yXVNG07wdFhUQ+ksbZt3/Zf7NxRK6
	a5cbhGIxEEh+Tv8SPxrURN+2jGmdO/stF+UUlE4bEdYO47qgwQ3q7ycSXF+Nr9Nn
	v/CMBo4e1KGkQds1Q+1pNR7W6n+hTt7TLGOjv8GMg9eQe6F90QFWkgmx09pd/HyH
	3mteK7EK7DSm2rE69rebLfyl+0iyWeC0GSLldtq0zEmRxug2+HK9dalUeHEomiNf
	/guNOzY6Juhf/kGHVY30dyPqkKaZtx3/0TYu0TIaf4kCg+otGg+FKFq3ju84LdS/
	rC3g0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjehp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 04:56:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445806b18aso57275635ad.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 21:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788979; x=1757393779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83fAnkrveK9gQC9R/+BmmA0iOQTFfDns/UdMTMdybB0=;
        b=fl2K4ooJG4NTneQ/W8XPtxTztl7U0p3pbSCzo0NikAsYjRqwp/spp6GWe53RaJZ+T6
         fyaEKLSlK+qjMyNGlystt5ROhw01Apu+dbFQB0MwgxJFV4ksT2AqsXPyiocjUKPot9dJ
         bfD/VD7/Ybm7b+1krhLCc5cIcwZ5MlsDPQ+8ZzD5OOqzrJdZ9+cg56TPOEWzNOCC85Gq
         HzIluEOJPGI5o1kXIAT2ZiSl0U6nzrWNISQZ8mkgUQvlnKcDAaiAnqHXSHe5xk6FYtnO
         4f8eP/sB+wrNCsbUyXDkuBK8rA03bR6lKz39aGf76hZWqVgWMQXuNl5M/Dc4AALo8pop
         /wnw==
X-Forwarded-Encrypted: i=1; AJvYcCX3IzdBifk4LXWO/pPdoeOGWolm5ogluLtvRhMqgOJ77Rb9T9l3Wi6+rF4X1vzl9zF20TTdf3FC6zI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCOIZ1w658WAzan8PCAfSxEO9JR/BnwSoEAr95vJhaJOwq6fhw
	syg/i3SWufIlYX/MlOw4gZ8RzCCa3ZqsJpf91HfzX+073VZGwFydJYNBxCFUedXxQawk/PHJWKa
	9rID3QsMF4Rv3j81GixszNODLhzNiUyHPI46LR3vBzwtnZw26sQ0wcNjhDiXlRQ==
X-Gm-Gg: ASbGnctoKk/1bRYDhckdF9qbHSDyQodfh8eSPM3Nzz9gTMgePD7evCbQVCPSLRNHW12
	+cduY2dqOMA03JSoFS8bDp0jZLuPbtpe2vF2r+jM89/PqvuqFLMZNxI+eh/JMn2au2Mc3wKTh+8
	ebU1LVzx7vJYLN43Dc5heeXFHGfRvpPFVGCt0tWoFVWu0cfeZ+ETNkowLEE8sjiBQqPKOgcaBf8
	VlM68negIc39ld682JuWaaIXbB1VkfR97yEbfJH0ehvKLb4UzpmByAGoRJyxw8JLfqhvzRZE3qO
	2bACHT9+vImQw/huIT2Qyg249n7y69BAJm119K7IF635s2V6pmh0nRwi/r3SzCAAn+xA5G0Bj2h
	qcsVH18KXXGUaEQRDW1eryvY=
X-Received: by 2002:a17:903:ac8:b0:240:52c8:2552 with SMTP id d9443c01a7336-24944ae192cmr136873125ad.43.1756788978821;
        Mon, 01 Sep 2025 21:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjejh0uViNDEvhTaWcq9bv3V5Y7jPhdE44Q6k9Ox7H8xWnNvjCjQCM5Z2Mqif5+n1s8qZOHw==
X-Received: by 2002:a17:903:ac8:b0:240:52c8:2552 with SMTP id d9443c01a7336-24944ae192cmr136872895ad.43.1756788978349;
        Mon, 01 Sep 2025 21:56:18 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:17 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:52 -0700
Subject: [PATCH v9 05/11] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-5-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b678f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Z7Z0_U9Vu3oXptz0eRLwBvXqKoF5VSR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXwee0RQVAtADX
 9dhtuYmuUcVZs7mtKhpYMyNPh9VYNkGXp1HlgqNEGp3cs2Gx0AndRetSGn3kZtN4SOcwOHqHk52
 XaVQOsMfSxQE6rOCWEK0ixe1SBuLA5V3vvuD+StjP1F0q5AlV0Hdo7KyXxMxKawzfjDKipEVQpt
 5mpe9J0W2X8tSD0ZEW3YORhuCZh+L5Qx9J14ruO4Dxn8FbA4DNcpbU6YkhXwJloxHwp1C7ZHlCr
 pZFEOGfVRW+BlAmFzVHxzZic8vPAV+7PmlJRWzQAAA6q+h7JJ7EEZGlGWm6Z5VRSWex6Fvc7jcJ
 AHQwTpTmar9ri41TJEpp60FZWcN8Zc+1PczNnhQrmQNfTxIGRxKDXuWeckv0QnQSjVYGySfhHKu
 Y+nIkOn9
X-Proofpoint-ORIG-GUID: Z7Z0_U9Vu3oXptz0eRLwBvXqKoF5VSR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
additional buffer space is required to pass all arguments to TEE.
This change is necessary for upcoming support for Qualcomm TEE, which
requires a larger buffer for argument marshaling.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 include/uapi/linux/tee.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index ac455683ab5b..5e393080fda1 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -42,7 +42,7 @@
 #define TEE_IOC_MAGIC	0xa4
 #define TEE_IOC_BASE	0
 
-#define TEE_MAX_ARG_SIZE	1024
+#define TEE_MAX_ARG_SIZE	4096
 
 #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */

-- 
2.34.1

