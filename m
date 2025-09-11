Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CD0263C8E
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562099; cv=none; b=ZEkZ1ulYOvkx+gvY+10EbzQvAgH72ZqMbp7P4kbK2Kjc86mD0jcuNWCvuILz7rkqqg1wP7inMs/64wKJEbTKTGEwjx6rYbwanTI3XN5WUI9k6FPNNHm6sbOj3fqaMWleFFrQ6/8Pi9YMctQfvXaM4YRAOYvkWS1VNU22NxAkAkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562099; c=relaxed/simple;
	bh=/lv6U+EjPMeafYia+qKbji5Tbq552Q5xbMPIUY9qAiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rE/+TbrEjdqk0uBRDmm8lxVHP5lChF8Ugh0IjYXY7e9xYsyE8oDmh93lQmzJSpzKRWd3k+AR01jwGjOiY2l2BpdWbma57UthWzHXimosqr3FplKqi9uVxBSUei1XfYz6OLB2AkcRGK2vP2tPXFT1boZK4GHeqRuhbKymFhDojT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lD81zjBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lD81zjBU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2ItNi002634
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YP1F2mKERyMRZBFmEs3SVcCv9UXZBJL5UnDFWST/l1c=; b=lD81zjBUQ40u8W2l
	UmBOznX4JfGe5Uc8w5e1E5ljITBKS7BsvfJadjMBZVNwmuJjs3maPhCIm1VeKuP2
	Ao1EYPK75Vl1bjpsY8ngMmzHKZJMqg/kyUOs/mM1gVHTBPi5vPIv4/Paxkp1ZtxD
	erCgNiZIJKFbKYts0VENwvk1WpXjnCiIhIvm2W8cRSYKTHEOHhy2H6YbiYeorEPc
	mVWJlM2tuNDJD/dNAzbweTL2u4WH/A+eNML53zt6A93mQ/ODNh2m3dFV4BlIZXUV
	vUwZV8xUkxkTnof9CAQsHGV1o6qJFJVmtH1RPcOpFN4jaTpyQGbzTVipJ5SsgssL
	SIU22w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwse9vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24cc4458e89so5555855ad.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 20:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562096; x=1758166896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP1F2mKERyMRZBFmEs3SVcCv9UXZBJL5UnDFWST/l1c=;
        b=S7V2p2wHaGNc1AIs74UxXkKbZA0iGB3HeIhWcSS2Tl5qwE01YXWAVgNepHXpgQ0EAd
         qd49qSQISiig4fr8gTW3Ib8A2JHPHjZiPnihSeKVAwQluRM2DsxHdrlbzXymMjfCZa4I
         92hYLAhvB1i6+OBP/6bMBR9pw46z+Wk2wVZ+nLUerlAmen7qUCmGzUI/hO5b1xKRc3g3
         qPsZI5vV9ik23CABbRmXARyWg91mjPN/Ry+CC7weo9xpiKz6biDsWSaMbydxziY+EiG6
         xOeLjf5T5GZWsEqf2EvTD/nvETgPlkHSpjodNKD4wku2ReYwIgiunRhkHgonUP57lBYf
         I++g==
X-Forwarded-Encrypted: i=1; AJvYcCXDAHuyeaVxv6xYB0zLNkoyiRmT8QbLYd/acm/nC3QABBCMPU2EDPfspOdprOCQb3l+w+fWdYp2OlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUEYzAYWnxTjeWlzSTAkiL5zbgSNTYs8lr7l9r2U1TVD8fIOtK
	3o6ofbs7yXdXy+yWXyHGAm+TSc/j/yGBGN+XXtP0vewNax1yd2PrGdNjkdw33efmX8KziTqtaLe
	9wFf3gbNl4a07YYNRw6x1C5m9x/jnjWOyQT3ycOwGS29r8O8ouei5Jqy0mztQjQ==
X-Gm-Gg: ASbGncsIvxGeL8y1jAGP60xtbnOhSZhx/JxgKTvA7rUdRXSanPBesiUNu/0cQpmlG3y
	XJ0T7WtkGeCmEBfEkSICpTWLfFtasYO37AGLkMylLNfqWpoXMCBSzBe0XKzcS/QQxQr/lyQegaw
	2ttoXfNxc2rNjJEV34WszUg38PTi9eELHC00Z6Zh7ih9AG5qeRe7mgXWCfTetGpJYEiL3L+oa5D
	vyTNhHF+0YJTmTDxjfRD/uzWfQx0lvuIHcMd1BLDyhqLxflKPVjWrMjyQ7rEzQU2p4AE62XP3xo
	llH6Ov3grq6K2L+36cNOBAcdr8hf8c0V5QIuKReJO1SaPeE/0ai6MYc5zlM4fo6ILjkoN/OTF2Y
	Bw7+iMgh5pboM5UR6G6gTV6g=
X-Received: by 2002:a17:903:2b05:b0:24c:ca55:6d90 with SMTP id d9443c01a7336-2517493a0bfmr195669715ad.61.1757562096052;
        Wed, 10 Sep 2025 20:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvQDQ9uOhNwBYBH4VDpBdDwefv3e3oaJPc/CzBPBFYYZmFclBHQ1LdmEcszkXBkPyeDRPZhw==
X-Received: by 2002:a17:903:2b05:b0:24c:ca55:6d90 with SMTP id d9443c01a7336-2517493a0bfmr195669425ad.61.1757562095433;
        Wed, 10 Sep 2025 20:41:35 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:34 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:20 -0700
Subject: [PATCH v11 07/11] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-7-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: QtNVJr1T2Ycxt_yzRnCG6LkQ9YEcD66Z
X-Proofpoint-GUID: QtNVJr1T2Ycxt_yzRnCG6LkQ9YEcD66Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX5apZImRAF6F8
 JNQmQ31rffjG2Sn6HLPQs69sRAAHqucyRvbQ2PuPabgfe53hynVB5JbAtUrRjn7nhIby8Zn+N1M
 qq0KMk2JDXX2ngXOX1Qe8d9AJKnbhAk9MV36wcdYjDRrbIF5bNfCWzQzvxMmqkO70Pgl+k5hM4x
 XyU7SRS7fKzrwUNFlmJs3qfpg0qz31IToOfENFwAsv/g5jmJaYyhsYAcWFcDn7CCwvuvZabb5QO
 Lcz1Eimm01eFew8P4U52pYrUZRiL54FRNR5Re7iTalSXxQKTIjsBQYl+viVERO/Dn/c54E6d3Os
 7xe2kvC1H1rFLmhtwzUtOWTNEOrB+xDAh70hg7ioSu3YBTUEXcbQBcpUPsnGHvZ1dnzy5IVb+xk
 eEFiDPBt
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c244f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

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
index 9abb0f299549..a5466b503bfe 100644
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

