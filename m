Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634418C31
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440473; cv=none; b=dnCrHMyKUzf5Z/2YCLyNyZNLUN+91ijit5XpaeEseaspSylfbVWEBy26aywI8tJ11XO1bvgSjNhKbYbjPSz1WtcdJFh2uQp1T/1DyNCxN/5GSNK90wkjy4uUh20ymaYeU352G9CCAQ/HnKb3ZfmY4DmXNGPVcfQvwUZnsAI87aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440473; c=relaxed/simple;
	bh=FG/JzSMGgL4uZxzhIPE7NmY+Cm5lzWZgROtbT8zLswk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwixS4bMxBdXjCWa1sthH+qfrXpTrNa5A0i0xq9hrGkxDNrmMQk15N0QwpJNqsfbdvMXuKEzV7xwTZFD+VRe7DbNy4yNijbCsd2cttiaiBPNEV6WgT5XtF+TR3ulsC1WRiFspx5upJOwCZIsAIvGrxDnMGu87iC6YJtZe37/wnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZWLV6/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHfoKado; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZWLV6/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHfoKado"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALR4kY212586
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iidZ6t9v0OpycyHAGbJSN9L0jNaWnZWJx8xHEveAVG4=; b=eZWLV6/iK63c3SSo
	VZ+k09dMjoXf40ZGp4RKmQeNKv5loSOoo/WwTZGP5kz2iv4EnbxXxvbAUsLS9mf/
	s6eiZA11blZ5MSu9o7aHBcjlnjnQmdoC/SBwUnRo8DH4kBqlGRB3jHelECcp1azX
	vuO4Vah4qOlstVn/MmPpAhvPXVlBrNWDKWvxFV2tVo8Dnsw+Ms1IF8rhmP/nYEXy
	tvBhvlirc8qKFWSzAvQGjlMQRWtDfJmw3IEwupuoxYAltrFu0mpxnmlhG2sX/NkY
	AT77bXXdPjrR93m/4fle/gDuFeE6K5sRKNJcWD0aiNs8IRpaDh3WasfdFAE2/Uag
	FMf1tg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygr89hr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:07:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so1426503b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 00:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440469; x=1766045269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iidZ6t9v0OpycyHAGbJSN9L0jNaWnZWJx8xHEveAVG4=;
        b=aHfoKado8T0SysUsfNbXGXqzCsm3HOg0nafeRqhfhRbF2B6iFUOp4U6eoJZrV6vO+J
         5uXSGgwuvUccb279Jw5JYA77O/ZHits7TrNUzseOoew4CxddknXVySj2RVx/OZsKOFIh
         px2jDd1c4GUHmgYp/ZdT3TpCtaHVraKgjuyHPhopA/+AIbrQTtGbZrKx6+jUEv0c4vUa
         gEDRVuXScowjDJzmptGRhCPcXghHMmXC2EA4iEAPcYfzpxVS7VNjWZYMhc3ZDl05Ezdx
         s8/XZbEgn2G513EaeS13tjqTPh7g2sEfAvc943zJ7H6GKnyxchq7Z4BOF4bncspGHwMl
         gjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440469; x=1766045269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iidZ6t9v0OpycyHAGbJSN9L0jNaWnZWJx8xHEveAVG4=;
        b=r54kko9k+N6XG3b73HVE0C6zmgrGGA4+m/luMZyTUkkCYvO2/FLAxCo204ayOK4cSm
         ZC0+vMzWZUK/cbyINCDDdElIXupBr+Zf3gJOr9ZZfH4p+ceNXk90B6W7NxPxYIX1n4IX
         vr0gS2mzF7PxYiE/3QTS16MIjd9wVj43aEvZJ00eN7uCw29OkKyE4BMbAy4TP/5+MOzT
         RBIPUAs+LDqW7C3eSrF9igwJCRyGSidK0bw/OQDVwTS5xrHhPwooXXCejp8NxXI2Ba5m
         yVM+MHyE1jhQuAQ9de2HIR1r9kMkNv2L3aKNYJnhwj40M+XuJii32gBVsks6spEJS7HO
         jqbw==
X-Forwarded-Encrypted: i=1; AJvYcCVT+srjJw5rXGlPxMruoGkOoQ3PHWPouOF4LHo4t886EDhcGEhE4TUMJLtro7ven8OdYBBtJ6EMOqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YybYx4FIxPnyfkEshNjcxqkYlOB/HBPMKzOimnkf9PYZoUzqfYt
	t78arNwFFwK/EfU1nfzMJT7K6U8M/kYSfrdx8S19s861Mjl4+8p8Dy1SKOpaRI0bU9fpaggQJ9U
	kiYkFgIDHuAf2k7QcY9TvOfglawjSlNzq2Bf+h83AlCDCekV+Fef8ipBE0RVHREA=
X-Gm-Gg: AY/fxX4zEmh0yZWwv6O5V4b3IylCT2DcCISEHFWmQMmpH9sOWgLVZsl88ehHTMtfFHL
	Hv4exWwDql6bz3FdMhVIoXE3bSHu7Lj2QESdBdkmsW66uyZLrGTy/rDOWqRF7m23rJxR1zAFmUU
	le0fW5vHBkUChroQSkcnb4/X/vUYEz8vz+IlnP1yGcnUVmG2d+Lv2WeuuFl49HChHtm//nPZfeB
	HCZhBn/O8whitaz1eNCsHKH4DtfIIy3DeCyPJd6WCMlTmhQgV5smULZerZZJwNwVmGwjbh7zUkB
	5io5GLEnZuY8XiNUHrw2lwDJQjmkvkikOwfd6gixuVCMh3ksRZuEemGqfIRfDFUR2jh84kf2wuj
	4NQqK96QzbE/QunfhNwocYj8O8f0SwSlRXg==
X-Received: by 2002:a05:6a00:1490:b0:7e8:43f5:bd24 with SMTP id d2e1a72fcca58-7f2301c45ccmr5419518b3a.57.1765440469177;
        Thu, 11 Dec 2025 00:07:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9Cx6y8uP13Ikw1vw4vVQay4UNjLSPnosVIPhdgzqLBVbSZrppTah8VFOPVHYJ4m578xyq9A==
X-Received: by 2002:a05:6a00:1490:b0:7e8:43f5:bd24 with SMTP id d2e1a72fcca58-7f2301c45ccmr5419489b3a.57.1765440468695;
        Thu, 11 Dec 2025 00:07:48 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:48 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:34 +0530
Subject: [PATCH 02/11] bus: mhi: pci_generic: Add Data plane channels for
 QDU100 VF's
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-2-d2895c4ec73a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=693a7bd6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tHQqvTiQzOQ45HI-0IoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX4VNn5MqWbww8
 Jyg9dTUQO1mCJGKSmxTniOWf33ELVVx3lBl7Hh9GbBk1hK22u2MV7se8AeIrzmG4eDI9/YDl0nQ
 SSNfyL/IXV2TxSVHl6KYG0vAMbKoFerwhm2var95cIwok9+BhBl59v8wwfJ01eHh0rKx471rW6r
 vWq9DymXg6C9GT3OMtYdjeeC3lUcSUOTnR1ci+Q9AcwirYhh2Xq9XaqkufsBhjm8ifyP1KEJ5N/
 T8xaJeLBIgE8Vti/tNpv9O0ptB10SUCH72dstoTao10gbcvKX8yMO5SN2wbJZZWMGu9teOmsqsL
 N1DgUO0qlur6grqdcJWC74YX69KHwWVdT/fXP94X9ipEaJRMmtxkfHnNnN3tdzCEpUzczeUUxPO
 dmlkzC2ZlCfEGzjqypwrEodTVS+jrA==
X-Proofpoint-ORIG-GUID: LJJj9UxNuw34RUhDUzsHZ0SyqkevkAgp
X-Proofpoint-GUID: LJJj9UxNuw34RUhDUzsHZ0SyqkevkAgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add Data plane channels and event ring for QDU100 VF's. Disable
IRQ moderation for HW channels.

IP_HW1: Control configuration procedures over the L1 FAPI P5 interface
include initialization, termination, restart, reset, and error
notification. These procedures transition the PHY layer through IDLE,
CONFIGURED, and RUNNING states.

IP_HW2: Data plane configuration procedures control DL and UL frame
structures and transfer subframe data between L2/L3 software and PHY.
Supported procedures include subframe message transmission, SFN/SF
synchronization, and various transport channel operations.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b64b155e4bd7..bb3c5350a462 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -253,6 +253,20 @@ struct mhi_pci_dev_info {
 		.channel = ch_num,		\
 	}
 
+#define MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(ev_ring, el_count, ch_num, cl_manage) \
+	{					\
+		.num_elements = el_count,	\
+		.irq_moderation_ms = 0,		\
+		.irq = (ev_ring) + 1,		\
+		.priority = 1,			\
+		.mode = MHI_DB_BRST_DISABLE,	\
+		.data_type = MHI_ER_DATA,	\
+		.hardware_event = true,		\
+		.client_managed = cl_manage,	\
+		.offload_channel = false,	\
+		.channel = ch_num,		\
+	}
+
 static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
@@ -278,6 +292,14 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
 
 };
 
+static const struct mhi_channel_config mhi_qcom_qdu100_vf_channels[] = {
+	/* HW channels */
+	MHI_CHANNEL_CONFIG_UL(104, "IP_HW1", 2048, 1),
+	MHI_CHANNEL_CONFIG_DL(105, "IP_HW1", 2048, 2),
+	MHI_CHANNEL_CONFIG_UL(106, "IP_HW2", 2048, 3),
+	MHI_CHANNEL_CONFIG_DL(107, "IP_HW2", 2048, 4),
+};
+
 static struct mhi_event_config mhi_qcom_qdu100_events[] = {
 	/* first ring is control+data ring */
 	MHI_EVENT_CONFIG_CTRL(0, 64),
@@ -294,6 +316,17 @@ static struct mhi_event_config mhi_qcom_qdu100_events[] = {
 	MHI_EVENT_CONFIG_SW_DATA(8, 512),
 };
 
+static struct mhi_event_config mhi_qcom_qdu100_vf_events[] = {
+	/* first ring is control+data ring */
+	MHI_EVENT_CONFIG_CTRL(0, 64),
+	/*  HW channels dedicated event ring */
+	MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(1, 4096, 104, 0),
+	MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(2, 4096, 105, 1),
+	MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(3, 4096, 106, 0),
+	MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(4, 4096, 107, 0),
+
+};
+
 static const struct mhi_controller_config mhi_qcom_qdu100_config = {
 	.max_channels = 128,
 	.timeout_ms = 120000,
@@ -303,11 +336,21 @@ static const struct mhi_controller_config mhi_qcom_qdu100_config = {
 	.event_cfg = mhi_qcom_qdu100_events,
 };
 
+static const struct mhi_controller_config mhi_qcom_qdu100_vf_config = {
+	.max_channels = 128,
+	.timeout_ms = 120000,
+	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_vf_channels),
+	.ch_cfg = mhi_qcom_qdu100_vf_channels,
+	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_vf_events),
+	.event_cfg = mhi_qcom_qdu100_vf_events,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.name = "qcom-qdu100",
 	.fw = "qcom/qdu100/xbl_s.melf",
 	.edl_trigger = true,
 	.config = &mhi_qcom_qdu100_config,
+	.vf_config = &mhi_qcom_qdu100_vf_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.vf_dma_data_width = 40,

-- 
2.34.1

