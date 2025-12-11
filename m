Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871682165EA
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440491; cv=none; b=hqNSkFdZhoNvGsF7Kh3r2APvXeWSHxoqRhw9ZqZAyph1mNm+cHAy4gr3NPTMAzdQJzg0keyRLnsELiCC3Rhbm6z//HYsQQad54o87gz/t95lexH0CbwZaoHA370zWGIrzEeXhLk0KcvLtuj9vVgP2GHMw9GTPMLTSJJ+G/sLgPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440491; c=relaxed/simple;
	bh=r1dgzFXv0adBb2kXX4eYZgSjO4M/Wakct1U6I89VE+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPLh/HJ3hDVAPbCb0Aj+7ygtuaEVhSU9UnpzIHmkF46u/UQGAMLbQVsQsVFWmTQd58FfMFZ2zYnubYtdk1Vogq1DZrYwCBuqaxFtP7p2rdtrD5hw3yO48RxF2gkoh4n8u/2t1h8eYPfLqNPw7ku8umribI9ivotarOY9kOF/OHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6qSWSVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBzgtkiM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6qSWSVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBzgtkiM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALVKdQ4061675
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLC9AKIzTPo5A0hcA9nTuNNa40XqXMlTf9DM5xLPSZU=; b=Z6qSWSVViE1Oic6q
	s4vfwMBd4+x/U/K9o1UDjSQHV4VbH7LygP1abfPxp4pvN1d+3hQ0MOgex6fXF461
	tw0PDllpYLXsbKIkE3YyCPopYnXiMib3sY28yFKLNfT+aHJqpdGD+hynr21lBgD5
	F+O7u+vfgTy2WC5+5B/J+dJ7QAjQ8+1HTslaYBbu8GC/+N9L9G0Mh7cwpCD5kdNt
	Zxxt5Jzwf1qX6AdUnkIwk1QzzNWT0kZnuHWXRdflisJAib+eqmj07THVNydZeroS
	vWzXFpaw59+DNnsoTonjRAxb9K8M6JUYPl32N+rg45fVPgq5DHLKmmeyFinBt6YW
	xnToqQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayguqhg4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 08:08:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b80de683efso1222930b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 00:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440488; x=1766045288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLC9AKIzTPo5A0hcA9nTuNNa40XqXMlTf9DM5xLPSZU=;
        b=FBzgtkiMkaa7JSwZzMAdLRIDgPbukT5/lL/DmgXjk+iA66esJCVYuqKnD8gnD4lcwX
         lFGB6VwtLP95hjZ7mqtHc2GOgMeiAZZZtREHzInvNsfh3ywEEaIeD1hE7Q4KQ+kf81Ue
         z69rhXQ6cF/0GgqYl0EEzqCA1dAp4rsBzk40nSbJxx1ev/g7lXNB/d8vRNfnDjpSZpGZ
         akhouFXJoVRTksEMrS/FM6ltr/2EFUxFniFg/CzM/+0cm767HVWjWYhUa3/oJbFRn92F
         zBw9+q0pN4N+vuHZME3nOL1Q9u7LoEm+UYXw5WwmeBMWQniUqVMuLM+RPHG0lPsjCPnt
         edlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440488; x=1766045288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sLC9AKIzTPo5A0hcA9nTuNNa40XqXMlTf9DM5xLPSZU=;
        b=tZjkRktk8PYHMWQaTF3QcQRDh4xf7PfMafpxD7gET72aOQJ/p6DRfqWlncSQoiLGYt
         eVDNcEItlFrwyPuN4V2kSPMvYw7MKdeVI2FEn6bLzJUY/fT0U+CfqQI6QTRQND4DC7ex
         OymEoyMrRfiGOAq2MWZBz/I6OwJB8LcxW3K7Jz9kz1ckEwU6AC8bppkOMy93xAmv8SGU
         aQlZV2CbsBasQVWbOVyCmKwifMUL0VZcumFvJQO3SwIp+dsEo3DYjYv2CU8ZxLnPtDgS
         3UwDGyOnPOeEUq7HtlVYZJ/sVdAgr5MA6m50B4M75Mob5/81kgo1ckVc3mEZ792EPHti
         uTvw==
X-Forwarded-Encrypted: i=1; AJvYcCVRPQVRUbh4zJeger+/+i4rElRk+n/BJH5bLcts9J7Ywcq8Jx1za+kDi+usPacEffV2RI5Tp4Mds28=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQP7kgn28oEv01m3c3wGFLG5l/RflDUXAz79IYSseVAY939tAG
	u/3OLccJn1qXnddOQwv4iWjIhZkSthJcq/uvyzLGpFdl2xhej/VvyfogK7ossFnDzSsNy7Z2Ehm
	/ovqXwj7vDTrzpJ1pmTXeAEK/Wy9dsIkPsxPUKaLCabZHxtwqgc+BB0iOQYFCmzw=
X-Gm-Gg: AY/fxX4uHF90a/zMN+vHw6hD6qxe/cl/jie0mMUM/FIYa4bulRLdSTnNy66xurONPs2
	mirLHsnToI72LZe4VCrGl7tdkyh2pcp1Zq9yhdOr/36lBYE+InMqdQ+yTL0gDvKH5AGyyt0YzYX
	TVsjrYVpHUXtsXht5Fjw/Nu0WKIpJPQ/NMBi3ingDK5gWjJFqbaaqkncdgkSr+Zv9I/c8MUX4yd
	rL2af8MwGGjbyNYUBZHJuu3kqhUW38ZtiQxSjIQjlcqsnG/UUjq17KrHlIOvqDk4Y9h0bjyaj66
	rGQ2Tu8g/S9gwLQcNhtkgns4eEOPuxhnRouVQlx7opeSoaRNnWX86OjSo6DbT8dMohC+7J3E5Ov
	VluAMWb7r1WsbuKjFKP6H/Y7rgf9ryxKFWA==
X-Received: by 2002:a05:6a00:1814:b0:7e8:450c:61b8 with SMTP id d2e1a72fcca58-7f22f907705mr5238408b3a.40.1765440487583;
        Thu, 11 Dec 2025 00:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFingzOIjru3J81q2erQBMyS2PWI3+c1Y5IB5yB+eIOJ0eOlN1+F/PswuqWRrS3BjNZ5xkmYQ==
X-Received: by 2002:a05:6a00:1814:b0:7e8:450c:61b8 with SMTP id d2e1a72fcca58-7f22f907705mr5238370b3a.40.1765440487075;
        Thu, 11 Dec 2025 00:08:07 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:08:06 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:39 +0530
Subject: [PATCH 07/11] bus: mhi: host: core: Add overflow disable flag
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-7-d2895c4ec73a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfXyBd2oxLFxBqt
 2YN/hj0stCO9sW+UM8BNAaWRtJLWK9sCLbkM8b4FI3+oKpnoX0+3zJ7HCp9uUwGtWN4NYnoZDMv
 werUdz7uhYuP83eGjmIlqRB0U4UVOvvWEnt9+Zcx/sIz8sR15odaXlUHyKI87kKtbRELEaZJGmN
 H2r01Q+L1ygIIGge1X7KXBanlS1myDOfJgacvtm3wweMHMF9dJhIMZWcxXAHsMsj8WvnGR3wycq
 djzzPCdnodlG9D6i5BwHgTyav77dA925peNRhbayVN4kOVURqZ78kcJH4BTicEZdxRkRNKiA/lh
 pA5GV7s92Jz+LGTsXB3nwM6jk1aMPrF0PDgKqGKZDVqZglIti/HFZbqf6SCmbQC3wMHDdakYewB
 8kPguuzNm7czAWiQNo2P2TX4c1QfIg==
X-Authority-Analysis: v=2.4 cv=deGNHHXe c=1 sm=1 tr=0 ts=693a7be8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CZodSWM9tNyhDDhyKpoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: WOcY1b9UW3sMe3DfCS_nR05DoS2emJ-D
X-Proofpoint-ORIG-GUID: WOcY1b9UW3sMe3DfCS_nR05DoS2emJ-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

When the client transfers a large packet, the host may set
overflow events if the packet size exceeds the transfer ring
element size. Add a flag to disable overflow events.

Scenario: A device sends a packet of 5000 bytes. The host has
buffers of 2048 bytes, so the packet is split across three
buffers. The host expects one event for the entire packet, but
three events are generated: two marked as overflow and the
third as end of packet. The client driver wants only one
callback for the EOT event, not for overflow events. This
change prevents host channels from generating overflow events.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h        | 3 ++-
 drivers/bus/mhi/host/init.c     | 3 +++
 drivers/bus/mhi/host/internal.h | 1 +
 include/linux/mhi.h             | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index 58f27c6ba63e..31ff4d2e6eba 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -282,7 +282,8 @@ struct mhi_event_ctxt {
 #define CHAN_CTX_CHSTATE_MASK		GENMASK(7, 0)
 #define CHAN_CTX_BRSTMODE_MASK		GENMASK(9, 8)
 #define CHAN_CTX_POLLCFG_MASK		GENMASK(15, 10)
-#define CHAN_CTX_RESERVED_MASK		GENMASK(31, 16)
+#define CHAN_CTX_OVF_DISABLE_MASK	GENMASK(17, 16)
+#define CHAN_CTX_RESERVED_MASK		GENMASK(31, 18)
 struct mhi_chan_ctxt {
 	__le32 chcfg;
 	__le32 chtype;
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 4c092490c9fd..50f96f2c823f 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -340,6 +340,8 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		tmp |= FIELD_PREP(CHAN_CTX_BRSTMODE_MASK, mhi_chan->db_cfg.brstmode);
 		tmp &= ~CHAN_CTX_POLLCFG_MASK;
 		tmp |= FIELD_PREP(CHAN_CTX_POLLCFG_MASK, mhi_chan->db_cfg.pollcfg);
+		tmp &= ~CHAN_CTX_OVF_DISABLE_MASK;
+		tmp |= FIELD_PREP(CHAN_CTX_OVF_DISABLE_MASK, mhi_chan->db_cfg.ovf_dis);
 		chan_ctxt->chcfg = cpu_to_le32(tmp);
 
 		chan_ctxt->chtype = cpu_to_le32(mhi_chan->type);
@@ -870,6 +872,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 
 		mhi_chan->ee_mask = ch_cfg->ee_mask;
 		mhi_chan->db_cfg.pollcfg = ch_cfg->pollcfg;
+		mhi_chan->db_cfg.ovf_dis = ch_cfg->ovf_disable;
 		mhi_chan->lpm_notify = ch_cfg->lpm_notify;
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 97bf6a70b9fa..db00ede0aa48 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -189,6 +189,7 @@ struct db_cfg {
 	bool reset_req;
 	bool db_mode;
 	u32 pollcfg;
+	bool ovf_dis;
 	enum mhi_db_brst_mode brstmode;
 	dma_addr_t db_val;
 	void (*process_db)(struct mhi_controller *mhi_cntrl,
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 299216b5e4de..926a20835467 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -215,6 +215,7 @@ enum mhi_db_brst_mode {
  * @ee_mask: Execution Environment mask for this channel
  * @pollcfg: Polling configuration for burst mode.  0 is default.  milliseconds
 	     for UL channels, multiple of 8 ring elements for DL channels
+ * @ovf_disbale: Overflow disable flag
  * @doorbell: Doorbell mode
  * @lpm_notify: The channel master requires low power mode notifications
  * @offload_channel: The client manages the channel completely
@@ -232,6 +233,7 @@ struct mhi_channel_config {
 	enum mhi_ch_type type;
 	u32 ee_mask;
 	u32 pollcfg;
+	bool ovf_disable;
 	enum mhi_db_brst_mode doorbell;
 	bool lpm_notify;
 	bool offload_channel;

-- 
2.34.1

