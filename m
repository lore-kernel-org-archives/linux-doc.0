Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E0B2D7DD5
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440479; cv=none; b=mPtqBYy3at9qIDlxk3EEnrZqqgym5wf25tAthmX9b0TZfYLCvUCg3+i7DhuBbiSTcxL2uE219BkvRcNEvvlK4OwZ2Iq2cqpNvAE7AdQViyLS9AWu745YJ9Gt44bpVRJOx91gExhMcIi9Qq/Qz0WRwSwOfh1RxO2N7oBDcYsBY1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440479; c=relaxed/simple;
	bh=YwRYwlT/5tfVm4v4+QRSkVb8bWyUn40Z8NTxXHlxQqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyxyEcluJtb4SBiLBGpeSZJk0jRwiGAmJElEjVmmSDDuM2cLlBehlNbSG06R8OJcFQPLYHTmWMi4Bai7hJzD5tg+FQkVwUAKIJNB+7XwspA/bc7jpVKfqlHHsJLBYHYtpRAUrTo4tVoBPNPb8vtaROSrex2yLhpaQgziPvIrp6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ha2NaYCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQfGFlI6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ha2NaYCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQfGFlI6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB32sap3683323
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=; b=Ha2NaYCbL2/nS4Ux
	+G/j5mRPqFeVVK76nzztteRTh5yUkWJaZIBS3axSoFF7Po1KdVxGOgYbvLR7jUCl
	KxLkDJBAqiuAQH4Zq6OVhIIAGCBy7jCROHnU0tdyC4YWRGTmX8bgn4oFtpREWsoF
	iMpmQVC9goywilc+KYpgX7909nsQgjvDeMn8VJXVMfneXW8bv+vpD+BLyCcYck8G
	G+qKujQkfDrRBfowbSHnLjjtxIkvHBodEoMMjGJV1evCGQBJYlBA3D13zAjw3LMZ
	A0Yrd1jvFY8yMEHn8Vfk6yetjFrZjU+WrA2AsYLNivTPWG4yf/ftbYv04bZ0jZgw
	s5kSeg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvrs2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:07:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so850340b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440477; x=1766045277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=;
        b=YQfGFlI6KV642TFKe497kSFQMegoC003WMZyTmJjQQrOjThbnnAY9dggawYjKrx9Au
         EjK/7DarZeT1G4/vVNWe6YfTNQ8/qeMmHF//oPuJVVBe3wCD40WFaMLsBrFSVThZSX9S
         +lysh6803qhWduVwLGompjiEQC8stjRzYktpQT6neczOU5v6Oamnd3VAr8IGbAi+hXld
         zX1A0hcE3gn8yq8OlzRqCOVQQ6Qo4JlpimmOQ+S3OPQFVf9wKEMlNGVM8X7+7/kq565H
         WPRfRvUx31QvVqwuBjNsKyr6Bmj4wsSyR2CLC2BN73I++s7zhP5amlZy8Q2vXi4OQIW2
         pTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440477; x=1766045277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=;
        b=KAfU7mg0KxaqhodLSjpbHQ59/vYjOTjAhr05kpqfp1m55ELrVX91SVRnyPZZtX6X8E
         Bg/xpo7fP2KVuMnlQ4q3agqTf8+U8eyF1dVS9BuNC8sNLzCgsqEsRjhsFGRGvGKwRrqB
         0F7d+aa2scNMvqjTiGjUS+CYWiC6IVW8tPn448aFuEvlZsXok5Okm3RdsLEy7btV2gGL
         nDlrnePKsVhG0CK9gLppQV4r7fapv9kZ9m90vF2gyY2WHig8cXen7p3S9flKwXUFmIpW
         mF4hzJhVOxWh8tY2kneILK6rmeYrz2B0q6eUgBirVx8hSA6c1S1LkIJ20Pk7x4rjWtJ/
         rsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhEIqyWQ5x0YHxp1NpXYOv3RXJ/NGqCIxUV8xtxsl0bXSYh2GfVkRTH9WNUTd03qNi6QA9TbjBDn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxCMPqqr0+pH6kBTgrIUqdhOgOyoq3tp18jXnCOjN0dEsukNj+
	ykboq3bmNS/fb8UEJfyPC65RYaqucl7r7r4hjYYtz7NxwddeJszZVCagOYQ6C3BjvUcXWxcsxzC
	Z2DNIN66CrJyKg5AI0YECa8tm+5Y4jZ2iFFxC3FgY37oKy60Ytyv3ZM/qo2pIBIk=
X-Gm-Gg: AY/fxX74ZVeH2W3raXFmSlo1HuxCN7bOClxYW49dxAmqSJXUnag2ibJvUaOmj21Y7jJ
	OQJxWMk3p/UKS043w/DoCiHKUp0ZT9OyIDJcI1RkUVhe/SsH4B+q6rxA7g1R5wILyrydaMiw63B
	uGFH7iT1O6iGv1xPCqucj+fP0iXTxGY8fzAE/dPDdEqEm7vJcrBlmokOTApFXKZcppaJR+kvv/I
	Yfln+X33OaaOoE1vObrk0WZnS5BdJnd1LHfEkMNBjnaTDB8XtmqjErhMoCzQDcbyaF+e+yq4cSM
	x4V8WtyrUkHvtSy+WEBubvsdE5biWgtDaV4y2q9qvPNUqeWayVR9ufmeTkMF+gjrgtx+UQt4VpQ
	a0+sLXmqApCHk4a8Wm6oBovNgMG+4ahYFfA==
X-Received: by 2002:a05:6a00:198c:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7f22d20a2a1mr5351882b3a.24.1765440476753;
        Thu, 11 Dec 2025 00:07:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYJ+9iyQn9SlqYsFPXt6cpvvx5kDRMcqf2QjkFSt1T5jR+a+kHMx0928Hl2duDOfH9ol1+dA==
X-Received: by 2002:a05:6a00:198c:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7f22d20a2a1mr5351855b3a.24.1765440476279;
        Thu, 11 Dec 2025 00:07:56 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:55 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:36 +0530
Subject: [PATCH 04/11] Revert "bus: mhi: host: Remove mhi_poll() API"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-4-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfXwyCM9qRP6uRp
 Mtoy6BwvjlXt8FPTDve1z/rZ5NWNeautBnmEQoY9Vb9JiiCG+t3HKEBo/YPn6z3VCpqbLSzhzLd
 LkcFdJ6h0DPirzekVKeo3s3gBpC3mmySnMei2G7dEp4Tea+fN1JEKr4GibV3srLyyunsfgMgSGC
 x6RNjqp6FT1Nhp2BdPOT58bcddqGJJK9CNH9tuqIfew7YPnbm3vl52U+LPxFQhPtpwnovJs05zq
 NU7+6c5lEgA2fdLO5CNjCWJ1XBybQ0RTTVJ428JPSPgaOoYBn8Sh/zDrS9hQpt4mjEakdW/OdwO
 Ih4GTYCRpJIPyM1RoceXZ4ZF2GeKa/060FMzVhRKHKvoYyXWf6xKtsLXaKyzXh4wBy6GTAhfypB
 A3PH/zim9gSpdIPf00jZjoDOKDqjiQ==
X-Proofpoint-GUID: XeWGRn1cGiUtZwgr4SWkjkRCJD7R9eBe
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693a7bdd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oQAhVp1KcIWGeVV0ezEA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: XeWGRn1cGiUtZwgr4SWkjkRCJD7R9eBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Revert commit 5da094ac80cd ("bus: mhi: host: Remove mhi_poll() API")

Add mhi_poll() API. New hardware channel clients use mhi_poll() to manage
their own completion events instead of relying on the MHI core driver for
notifications.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 7beb848ca5c1..5d50f6ebf6f9 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1858,3 +1858,18 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
+
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
+	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
+	int ret;
+
+	spin_lock_bh(&mhi_event->lock);
+	ret = mhi_event->process_event(mhi_cntrl, mhi_event, budget);
+	spin_unlock_bh(&mhi_event->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_poll);

-- 
2.34.1

