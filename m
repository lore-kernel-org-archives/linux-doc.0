Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A38A1624DD
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454222; cv=none; b=FUhBUOk/pPOkD95pjpw/Yf9s+J5X97/MvULkMkiJ33/G+EEE0yaB4s3oURA3Rq8FBMNXRm3YAvOAoaS7Oj03odI5dN0PaCuzH8qkFZ1hcdEHWUeTpnq4WBAFtfA6F5+pujL7Un+h+Q4Clr7e/dGME3tDl46zAyUK28COAh8r7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454222; c=relaxed/simple;
	bh=6ti6WK3uD8rSgx1+MJL0OTBiXFAh+a7/YuzQpoRdCak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwIOGF8Ef944iJ67+36mutHlHgAe5kailcSAyssOBuj0YxBQxwbMqhFepwtqclH3nBrBT3V01rz+0EinbCTa+waJP9AX2s4nfeAYgYUE552Trvb52vuQCyXp3uA/r2JfES8iCaX3IKmLquVx9ncVkevvGvfF3wfm8bN0geggzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOO7aGet; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOO7aGet"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMDhUM016619
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=; b=kOO7aGetcaOOn6EB
	Dd7pX87VNVIXtpo/51n/LvG/uFmmmpkLbdVj7S/Y9a9ZhTOK4ld2Bjnjrzl6IUzq
	GmCpxnf/jviR9foVmIJj2CtNvPOOiyv5I36XiuGm5UuuwNghtWV/3KXpP+2bL4I8
	9nMzl2y+YLlDGgywqnKV+fkahjtIaZFOEt5tE8KTNMXuR35hlsBSYQ5t/yo04DrM
	IO7f6N8xUHnQZwZNzJ0ENlYTVkvLYObRtZuZ81+ifVBVv8G145g05Sy6wgiMBU2A
	5KkPqJx7znQLXJUtYZkC+7yKhEB8Nve9jrd704GrpVTfECzhUI1WfjdrDR8ucZpj
	o0+8qQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uh0aasj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so2937178a12.1
        for <linux-doc@vger.kernel.org>; Sun, 13 Jul 2025 17:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454220; x=1753059020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=;
        b=Oz1zM+TVrtWoUtOtP291IacFJyEDno6PvH36KGXTSMhwrs9HAYZk7nVonBhGYilg5x
         KhnHD/xk4gGYoxbQayZ9WwoL4CoCe0yf7XCV9vMtJ3MTcGpgj0Dh3YkHzNkSg//4gZoQ
         Is3yVyANOk8awkD3awYCFDG0kkR+jaErHMJD/vpRAMtX52DEyN06iumQ2RbrOsR9nEFo
         goztVjmbYYcCPjtv5eEsRFF5LlTLIh6G4QJu3Y5eUfCqIxedX+xBgmSTgq0kzDSrcpJA
         /JRxutKw+dwkA6xh/sHTiB1GaaOUwhTRTyLBZDvaZG/SPw6lC5B9OeBzYtKnKMt6uz3G
         blWA==
X-Forwarded-Encrypted: i=1; AJvYcCX+BYvRLWT4g4CmVCtAEx4Cae6TF4ojLtyZWNg0FY1YQNw5pQT6lEvg7EipNaSH/OJUsUSvJJmQiK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyW0LDkxm92KTXECFcclD8B/jsufQiC6b27IcviCNlc96fDnxZ
	JU6pvxxJkDPlB2hOv4W/yxnJfSunERGs8+0TuQCjEBJxogQXrDIqvKahqplI74S1vI2DG1nucNY
	kA4FX+jpep87thjlMKwSkVe3XuMI+4ruk08YB6d2ZmNanTNh4AUBu7SZAP/zifw==
X-Gm-Gg: ASbGnctKC7lJSr4p/Y1YAaQr4xHXbhAFSllAL6IEKUxFWS715agYd8S1gH/zvRU75AE
	FG2rZDF2CtjJ10mmozfPGrv4xKsyvRzy/BT6PRGFKDUJ0RmFh5VF22I2haA0wuCdaCCXRJ8TMuK
	Tk4UDSPF/kPV8WeAoJh7RUGVezHb0ccwTrupFuDW+YzH09DEvzG8PL1DKiVxgxy2lebJbE3mIc6
	TP5IsbscCg3j7Vm9YmA3FOsrkhWiK2TZJSvIl0FDV1SbkpBsMvKFCilwGDp71b0NKyj9LKtqc7Y
	bWBpwicadUTVVLs//xunGyerorHOJX1qRnC0IN0JArzeZFGSP1DfMn9bDB1AFZFZzZ4zy42ILRt
	IjVQBUhLlMrSyAWtB2aUZd2k=
X-Received: by 2002:a17:902:ecc5:b0:229:1619:ab58 with SMTP id d9443c01a7336-23dee0d9ac3mr181151745ad.43.1752454219728;
        Sun, 13 Jul 2025 17:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/mJiuun06sM2rMzoQb2znJePjSbapMiG5DW5Qq5P5rJEhFEAxnwJjdWQYDnBpyFcOi0O4OQ==
X-Received: by 2002:a17:902:ecc5:b0:229:1619:ab58 with SMTP id d9443c01a7336-23dee0d9ac3mr181151455ad.43.1752454219307;
        Sun, 13 Jul 2025 17:50:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:18 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:13 -0700
Subject: [PATCH v6 01/12] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-1-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX8ebx3KZK/IyQ
 if6eFoCckO90d19T4Kjj0iCPJDq/w3FfQXQxi9XWW3TqzEwXgh1Xfj27XTGFbKM5kFw3efkLnFj
 +6lrfwrmeiEWdJOWe1P89uptXWQjqlviBNSENQjwarMTIZiJSv0Z/8lCPZEnIA/nX5SFJJoOGPd
 Peu6f26PRG2H4MQN+p7MuND44dI2cU8jza/R8BdKLo18VQGDHkzG3N2dNMfq8xcCo+nVbwdC9Mw
 n+lbPFOvC5EWHMx0prRu+gC7JfWQ2/lt31Qzy7JTea1judGQBH8Tnky+Ixg+aTuHlpbxAcFwkxz
 7WmLfH8vMdInf82VICWUNQ0DggkPo3/omT+VGXPqOeDkmhy5kl4MikPfEqapGAStPprTBSVSv2s
 J25Qqi7epDwYczIuERYMGe7N6kQf2Hz4/vtfCHMqxs82QdJKPgpZ4fh1vgbFnvPTtD6in86Z
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=6874544c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: n9XBIyvPuhgVnnsMKiQPfq0XfI2N5_5e
X-Proofpoint-GUID: n9XBIyvPuhgVnnsMKiQPfq0XfI2N5_5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index acc7998758ad..133447f25065 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -889,7 +889,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

