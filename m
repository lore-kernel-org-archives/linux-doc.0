Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194942D7DD5
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440496; cv=none; b=AL6UETH9RjMWxyP4bzfnskK0I2w3/YiQD/rRHWlHYsWRCy1G78+p71jU3NuZNgmLyFCFpoFuY0LJrZtUufHV9DY2wGzu+7VvM3dSf/mV2ArRlR03NCm6dfkpgYjBmlEjMNZqQMv5/UwCKTMI+V+hnTpXDkrxzKzK83EkJwiq5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440496; c=relaxed/simple;
	bh=s+FNB++v7IfGmf57Pqig2HTWZMYlY6YEcAX7CTQhXX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qwzwf8GkGdQ5IcYUZIwWg14DhisqddNqY/JVfuKVVxi9QppIqWvRCFfZ5/Nq3xgLZV+GQTciZvT2HC49d7WbyO8yKS65JnZtCuG58v6BZOqL6xO9/pTlvlJUevdQQzDNRvS5qxrssHO2hLCPGmBjynMVfajHzp6cq37Iv/hK6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/5qX8T4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ln/QdlnR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/5qX8T4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ln/QdlnR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB85uUI212652
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	111IfXca0zE2+PdPVy3i5zCq9JodBmxBq5+evWFRlUQ=; b=Z/5qX8T4FLcEclx8
	JG8wMJ5nYYmY5bOsEEypymJ/cXbOPjpNUAb9AUiLyVrCNo7gqnEaCTD0rejtIdOe
	nZMotvjm+Mgu/kflqEBiDE1Adn3hvTx64FKWPlOi7n+JKD3yIkqZ/7CiXiWIRxaM
	nnAKSrR92Q0UgfD2PWy0N06WGL9UVcpTmflPz0T3/s8lwPluIETzQQ+UDVAXwOC8
	Cp2l85P9RuFahleqatPqF3Cqm1lPUyLOH2Jt+PB9lFFmadWD52o4l9lUN5sbxeSN
	6Lfy9uRkNeBCR0RTdntUHCv5PsDo/CCAbrHOzgHKnJmtnZqhMvzru+6NNTxpK9wK
	yLDs7w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygr89hsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:08:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba9c366057so2109185b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 00:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440491; x=1766045291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=111IfXca0zE2+PdPVy3i5zCq9JodBmxBq5+evWFRlUQ=;
        b=Ln/QdlnRuZKzcQDqmHwV65/HbJLyiTecbu6GeKgrBFpOU7mPNZtF0Ystc3I0UqVLDN
         BCrRJjsL2+H2XA1D54uuqcVzrIvGypZKw83ZCFD453CnZN5JV8QRwm1NIrhcyvMqNe2X
         sgI1TlTiU+zQU9m9mnM5dw+97XlnuaaVvyhLl7T+G+ZCg5YarDX7i1ZECHJit642ckxA
         TCSyBSjd602p3EgcNiDJL7m+hKS864vs+6kODr1fQeAVlpYAXRCixS9j06G+oYQyP9z7
         GxzcLxVKQdRidE7Shd9maJ9fc7+cOMSYFAYK1liBo3o5Is1FewQweEhaKfD+93NgJRZP
         a91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440491; x=1766045291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=111IfXca0zE2+PdPVy3i5zCq9JodBmxBq5+evWFRlUQ=;
        b=kwL3IMi4+jUs3PTPT4Fyg21FNeH8gjT4Bybygb23prn4E+S3/f5HPD7rThUkZP10uW
         69M7QN1wZfrwNEQZhthhQCQtgpxDKjE5yunbTDzeNYFvlZnRtDdTKGwc6dj2xs5ws34z
         R8Z7TQWZSoXiCxy+rhylKdzg/BOPpwwiP1WYW/uQJVsTFDJVh99od0gcFanRP9erzo84
         89hihbwWt7M5NFqds6433s7789ufFmzPQZbcCwYQwfdNA1HTlOYHfwzegasGyFWbSh4Z
         kcbyn2q+SWPfgBX8VGhhAQ2ds0Ew935l7wgYRrm9l5PYwFjBasXhELitEaff8twQPKR9
         E/lg==
X-Forwarded-Encrypted: i=1; AJvYcCWetpnAsv9y2wqEsAsZtfy+PHHB4u6n9ykwB+VLKIBaHu7Q8ezEmxPa0Is/8RS/aThafVjfcessQik=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYk81HCctvsh7ta5wkEXVn/8PeSM+A26SWn1H4pnBkamS0bXvy
	9OIrQhvdwvy8Ta13gxv8Cs72mXfFiG2hxYZexVofLMjxvIbpUYc+IL42CGuJmFQq8F3CMyWxAcu
	uGb+fexiNIQRvKhk033Uc4FY7OzT2KlMoF9+WtXgWmzDrntviprgkc/Zla8bkfrM=
X-Gm-Gg: AY/fxX7S3sI2ycaSzunUXAOS3t2omFLdETRT3QOPWUmC/5RcwS0aaxBxm0oezdhNJVB
	LzJ5kO2QVnoWz7RpAqSB2IZw6eemFKFCyMo3XuTBa/dv+fzr9zNamIQ9YnpSMhR3OuTwhQ6N+kY
	rqjfAzSlE10hVgOBCs50P2swz2j4Rh9YezqPb/IpjjlkE0Bu0QfTN7JMLfwNQyT3oweECxcOl0j
	3lREWGWggCVdVnTG8/0Vp/odXHLQpZef08C5/EZ9xgtat19TdGOE47qT0GdMg+1e5Y0C6IbTrQ8
	o+6vyqRNm8TKgqPgsgS4eFikuY3OG8XgFusYU5o/cTezLfT+ZFNMzeLMySXy0+Iw+YPyK73fWt7
	ABuUX20XoWkJQshYzQDaagFi7JaIxvqt1Og==
X-Received: by 2002:a05:6a00:92a2:b0:7e8:450c:618c with SMTP id d2e1a72fcca58-7f22e48b131mr4569287b3a.35.1765440491183;
        Thu, 11 Dec 2025 00:08:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIAYwm+z0TOG32ljWatFrX0eU4zdDhayjbHFyD4F3Q46utf+Lqzc0bk70UaOPpXBIVgiVOFw==
X-Received: by 2002:a05:6a00:92a2:b0:7e8:450c:618c with SMTP id d2e1a72fcca58-7f22e48b131mr4569257b3a.35.1765440490686;
        Thu, 11 Dec 2025 00:08:10 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:08:10 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:40 +0530
Subject: [PATCH 08/11] bus: mhi: MHI CB support for Channel error
 notification
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-8-d2895c4ec73a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=693a7bec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H6w75S3OD7A-s3ocmMQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX9Q9ZzwlGo/uT
 v6mvIOlm9+XSLU6yloFHE82mAtBUPre9T9czIrG7OZDtZJZcPAFmKGT04FD9gUMcdzdgqyaBjQN
 B5OKjKPwv7QQ22e6gb9i5JhwaixxQN9TH8iP9c2HcIFQkSuDtAlBgRokK4SBu8Qzhiovae/Yopw
 NVUtTsUXeEKvo86iunMIJEoOCGFPtheoRolYEQVp4/LlDre8LXhQc6fnxHRFuRh9jtQDmp//oJ3
 Jgc25LdpijK+i2xuYz4Ik7hldvDoFWQcKpQML14A+c1EgvpA3M+3oki60sDUsQ9v7iXHANTD4IX
 e1/uWiZDP6wTcU5J7bnK04xec9jWearX7TT9IgDRY7wsNGjYsqqmfrkgPREfOoG9TXBoqKH/FWh
 Jyz6qw9Ri6VefygtjLj9fCIOWHJMmw==
X-Proofpoint-ORIG-GUID: urhR8a_IL5XMEYg2laD7DS0CZUsb85WB
X-Proofpoint-GUID: urhR8a_IL5XMEYg2laD7DS0CZUsb85WB
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

If a device reports an error on any channel, it sends a
CH_ERROR_EVENT over the control event ring. Update the host to
parse the entire channel list, check the channel context ring
for CH_STATE_ERROR, and notify the client. This enables the
client driver to take appropriate action as needed.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    |  1 +
 drivers/bus/mhi/host/main.c | 24 ++++++++++++++++++++++++
 include/linux/mhi.h         |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index 31ff4d2e6eba..3b3ecbc6169f 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -230,6 +230,7 @@ enum mhi_pkt_type {
 	MHI_PKT_TYPE_TX_EVENT = 0x22,
 	MHI_PKT_TYPE_RSC_TX_EVENT = 0x28,
 	MHI_PKT_TYPE_EE_EVENT = 0x40,
+	MHI_PKT_TYPE_CH_ERROR_EVENT = 0x41,
 	MHI_PKT_TYPE_TSYNC_EVENT = 0x48,
 	MHI_PKT_TYPE_BW_REQ_EVENT = 0x50,
 	MHI_PKT_TYPE_STALE_EVENT, /* internal event */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53bb93da4017..9772fb13400c 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -798,6 +798,27 @@ static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
+static void mhi_process_channel_error(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_chan *mhi_chan;
+	struct mhi_chan_ctxt *chan_ctxt;
+	struct mhi_device *mhi_dev;
+	int i;
+
+	mhi_chan = mhi_cntrl->mhi_chan;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
+
+		if ((chan_ctxt->chcfg & CHAN_CTX_CHSTATE_MASK) == MHI_CH_STATE_ERROR) {
+			dev_err(&mhi_cntrl->mhi_dev->dev,
+				"ch_id:%d is moved to error state by device", mhi_chan->chan);
+				mhi_dev = mhi_chan->mhi_dev;
+			if (mhi_dev)
+				mhi_notify(mhi_dev, MHI_CB_CHANNEL_ERROR);
+		}
+	}
+}
+
 static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
 				       struct mhi_ring_element *tre)
 {
@@ -961,6 +982,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 
 			break;
 		}
+		case MHI_PKT_TYPE_CH_ERROR_EVENT:
+			mhi_process_channel_error(mhi_cntrl);
+			break;
 		case MHI_PKT_TYPE_TX_EVENT:
 			chan = MHI_TRE_GET_EV_CHID(local_rp);
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 926a20835467..66fd83bed306 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -34,6 +34,7 @@ struct mhi_buf_info;
  * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
  * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
  * @MHI_CB_BW_REQ: Received a bandwidth switch request from device
+ * @MHI_CB_CHANNEL_ERROR: MHI channel entered error state from device
  */
 enum mhi_callback {
 	MHI_CB_IDLE,
@@ -45,6 +46,7 @@ enum mhi_callback {
 	MHI_CB_SYS_ERROR,
 	MHI_CB_FATAL_ERROR,
 	MHI_CB_BW_REQ,
+	MHI_CB_CHANNEL_ERROR,
 };
 
 /**

-- 
2.34.1

