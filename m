Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF5C4E0B6E
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471151; cv=none; b=LuPUb+qPUtFxIbmp4g6uVAGytKMtxcwDWmGjCqU1uDtyblfhd4i6D5kSGFOzQ8tt+5dF3gMixjrqcuZdPB1zIam0H9AXXYWwc6uujGxe3175scrJBnCxgNrwwBUn+naDGeb/NScmuDWg02PvsOUPsCvSs4VetRJXMP7C8UIls74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471151; c=relaxed/simple;
	bh=f7UgC/h70IbjkbEhISDmBS8SrsPHSkVGFtcsHrdgTXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeMSzd8xzkcfqMdR3CLfkYQCtQDDSHTsfegKi2NjPSWlnffeP6NdNEhPacJsFNd6tipRIcbWoBiDIRU2pO9kCvyr/XTba4Jzo6GlVF7LozDN3derLdCwBqUEalhqAsaxKYSJkgIoktOy+0BquldzITwNfCvlWxAt1/thxvDxmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7WtzRU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpkWvGfA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7WtzRU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpkWvGfA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVagP3641930
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 14:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=; b=b7WtzRU9DgBftKJF
	YYqACnn+AAgRSOAx9ZHUHDBR1bGmvFQ5eWD+tJtZ4qQmb/fatQPzHHPs27OPdXdJ
	UlS8wI8xPKxDaI4WEtYkxqv2KpsoQkr+NQfoJwFywdlG3wRXbQMqun0lRWSF3fxu
	f7jdjgT8NintvQSSFtQJfEt2w3BIz3CVa82qQ0VAuMMTTIbm/a6PBTqug3kXB1Ja
	yPd5tLnIKzdzt1OTRy+R/nO4qgQqQMzb7tdUtelbwxqADPpO51KiK1mv+spODvMm
	UzXdujQqpVDpuhMfum2H75aPMshtlfdXef49fkRksB3mttNuDPR2uoqpuC14QzaI
	9xjKbg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe43d7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 14:52:06 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836caf085e0so43445497b3.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471126; x=1792075926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=;
        b=bpkWvGfAbuleiafRArVXmebl165R77BgalP/gwREHsJFVmoUWQrjd+ddTNHBHTdF+5
         BMG5WxcTuVJs86MchcIKV1GvGRl11V/anMR84ycyuYyRuVxbp8M0HxH+0fyd1Ra6jjcD
         t3gFGiobCP5WvPfqJbFkrXAxE9uq17d43YOHfOCYt24/xQbFDY5q1jGI4P5NqBNz1uVK
         VU3aef7Y2N+SC001R/f4Z+7+aVUPxgHlr2KMVL5xfrlk+n84FjvNm2JgrusxehMSYF1V
         JeVdYgtau7jU5BgfvS/54u7kOxg3XnbldaX/WOuLo2lUcZ270R+g956qxWHhz3sfGopp
         7b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471126; x=1792075926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=;
        b=XDd2NlXE9KOSyrhAPs6zTwMwljtmmufdUeG7vy88PGff9aPuCTmwzFvfNCYSlE5eMn
         vEiw7K7XDW4F/zB8yw2gXEVrl75g3rRDt0MmAhz5ucXXRTeW1Hr0chfHNH+jSkOKwrDc
         yI1u16ReRGetnlGID78xyfs5ZDtWTj0gooVQhaimdCL2Q/slx33pKa0290DGR10htlUV
         wy9p6ncrRKVwhY3AGIN6M5h4OB6Sox+NDiAMHtZFNaPLcxNRpJ+xTVn2snoHsY32KfVa
         qcPg7Mx9Cq6TOOqetS72cQ8H2tKONtVe8MLP5SFGAoCY+WNYbqidnWGFYY8IazodIuF/
         Qf1A==
X-Forwarded-Encrypted: i=1; AKwUvByqH+ljAVHDgB2+MIPhLwDqxOzkjfCtZqfZ1pnPGXv0hCv3UhqUAlxa1jdQO6VFquml9szajwPX9XI=@vger.kernel.org
X-Gm-Message-State: AFq9FYINYZVu2voETybommb3Wt0erYEsPfwykmKj78DmqlKnBsW/BK1J
	ETSiDogpVyvdasSYJRlUaSSxKg/MebfId9xbc1d8Volcy8xAdZsZcTM5WtTNAlLk6BjdjymnqeJ
	DIX3f72f4tyv7+fm/frfu7yxAI2A4Af3vRl/vJcfWzREw+xi/zQqj047MI60PmXQ=
X-Gm-Gg: AYBFou2+3YKhWMOskRzj6wvkNxNp0PA/+/z8dQx0M0AzXSDnmxi+tSqyG9Z2HmE5s7h
	vPmBSHBmZXyjMthwfKadCuCfOdVPXR8ZYQkidl7lD0zDaSbQnbRVrDikWnbUx48SNDOfMgVGNrO
	oxmMNHjiFCtAaiQ/eq/zpPc6LjCWj7b/aZcQZkvH0q0XmEjK0knRhgKjVDxSePuXCUVweSZ5QRU
	X3HKCZeC+iYfKOrNHx23oP9vSEWUIxL9a1NYmIvgHaiWIb8AhchLdCU/ldolL67sm7QidU/NO4Z
	KzMR0Frt4W95tPVp4yM6ZB7Fn13h6DkqnUiCiOc3StBzbHmXDQ5NTWrGsdOo0GDlp34CNGlkhAp
	hTh+OLFZxjAReLeAaYPny3qlOdaX5eHq8NNFXF4v78K4=
X-Received: by 2002:a05:690c:c5a2:b0:8ae:521e:b3e with SMTP id 00721157ae682-8b05b07f2f4mr28435987b3.64.1791471125721;
        Thu, 08 Oct 2026 07:52:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c5a2:b0:8ae:521e:b3e with SMTP id 00721157ae682-8b05b07f2f4mr28435777b3.64.1791471125014;
        Thu, 08 Oct 2026 07:52:05 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:52:04 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:43 -0700
Subject: [PATCH net-next 11/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 counter debugfs support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-11-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=6180;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=f7UgC/h70IbjkbEhISDmBS8SrsPHSkVGFtcsHrdgTXk=;
 b=wuap9unxYof7C0T2ucWWZklA15SI/9X2QkntAkaUt9ntWiHUgD/rMEhKFOb3gYZO/O0RjFrYR
 T90Hgv6EFvnDfTy3agnV1lJaAm0oudZ8g1O6zdq/XDzOBn1BPu5dw6q
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: kAQ5y9EuPta28OA5DS1i91udMBF0chUY
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac7ae16 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=76TLMYU0KGnaRKKVPX4A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX6bM9VF+0M3a5
 mnTRQ/D2XAolCNN4Q8XKot0RzymxU49G5IskTpPiygjXTUwBA/6WoLJW1ObfMVYdz2BCS56/syN
 970fAdBFi6qzT2iXYmwdx3ffYjf+ygQ=
X-Proofpoint-ORIG-GUID: kAQ5y9EuPta28OA5DS1i91udMBF0chUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX3HmLOmy6gerR
 PU07t5D2YjFWSVm5Nju2527JexGhfUg52vsAc7qCrR1ytCaJd7tCVN9/N9u8FxzXsImyj/aLPT6
 XXFmC0daLBsHOeztVT8nyZ9K7LvDKk6kSrU0LhAmvEu6facCXaJWUDjfDcGbdMx4GT0z3nfp5hH
 lMoG6TaGoBfd4mQDTkxEEimEBwvc/tkiTAjX4vSdkQvObVUi/VNhvOBi4RZTkJyCHWzztmQms0z
 w1cmuGQQi8Fl6X78mSWZmF9hKHk+sJsforLwxqKYvZL+0TpBF4S2ijL2rPyyfSIUepD467v6GlD
 3+Q2eRsFisuEdv7TlNrmMvBKw1zIXYXYxf2pIJ9hLtYIQryUP765mu02jliuV2yiPqEM+4oStGO
 LGLrfxu/EvFniiYALFJMqTYy84nacCiprI2cT8r2LRDt+OeCK7NYcZyy1m+Dz+dpaRNM318PuKq
 9AblL6SnOHrZ0Go0RGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

IPQ5424 has more BM ports than IPQ9574, so the BM used, reacted and
overflow-drop counter tables have more entries on IPQ5424, and the used
and reacted counter tables are located at different addresses. The BM
silent-drop counter table on the other hand has only 4 entries on IPQ5424,
versus 8 on IPQ9574.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c | 14 +++++-----
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h    | 36 ++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
index fd959a76ff43..8d5a6fad8337 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
@@ -201,7 +201,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 
 	seq_printf(seq, "%-24s", "BM SILENT_DROP:");
 	tag = 0;
-	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
+	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES(ppe_dev); i++) {
 		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
 		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
 				      &pkt_cnt, NULL);
@@ -225,7 +225,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 	 */
 	seq_printf(seq, "%-24s", "BM OVERFLOW_DROP:");
 	tag = 0;
-	for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES; i++) {
+	for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES(ppe_dev); i++) {
 		reg = PPE_DROP_STAT_TBL_ADDR + PPE_DROP_STAT_TBL_INC * i;
 
 		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
@@ -248,8 +248,8 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 	/* The number of currently occupied buffers, that can't be flushed. */
 	seq_printf(seq, "%-24s", "BM USED/REACT:");
 	tag = 0;
-	for (i = 0; i < PPE_BM_USED_CNT_TBL_ENTRIES; i++) {
-		reg = PPE_BM_USED_CNT_TBL_ADDR + i * PPE_BM_USED_CNT_TBL_INC;
+	for (i = 0; i < PPE_BM_USED_CNT_TBL_ENTRIES(ppe_dev); i++) {
+		reg = PPE_BM_USED_CNT_TBL_ADDR(ppe_dev) + i * PPE_BM_USED_CNT_TBL_INC;
 		ret = regmap_read(ppe_dev->regmap, reg, &val);
 		if (ret) {
 			dev_err(ppe_dev->dev, "CNT ERROR %d\n", ret);
@@ -261,7 +261,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 		 */
 		pkt_cnt = FIELD_GET(PPE_BM_USED_CNT_VAL, val);
 
-		reg = PPE_BM_REACT_CNT_TBL_ADDR + i * PPE_BM_REACT_CNT_TBL_INC;
+		reg = PPE_BM_REACT_CNT_TBL_ADDR(ppe_dev) + i * PPE_BM_REACT_CNT_TBL_INC;
 		ret = regmap_read(ppe_dev->regmap, reg, &val);
 		if (ret) {
 			dev_err(ppe_dev->dev, "CNT ERROR %d\n", ret);
@@ -723,12 +723,12 @@ static ssize_t ppe_packet_counter_write(struct file *file,
 
 	switch (entry->counter_type) {
 	case PPE_CNT_BM:
-		for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
+		for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES(ppe_dev); i++) {
 			reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
 			ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD);
 		}
 
-		for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES; i++) {
+		for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES(ppe_dev); i++) {
 			reg = PPE_DROP_STAT_TBL_ADDR + PPE_DROP_STAT_TBL_INC * i;
 			ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
 		}
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 089aa34b7732..d08ab02bdf79 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -18,12 +18,20 @@
 
 /* PPE drop counters. */
 #define PPE_DROP_CNT_TBL_ADDR			0xb024
-#define PPE_DROP_CNT_TBL_ENTRIES		8
+#define PPE_DROP_CNT_TBL_IPQ9574_ENTRIES	8
+#define PPE_DROP_CNT_TBL_IPQ5424_ENTRIES	4
+#define PPE_DROP_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_DROP_CNT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_DROP_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_DROP_CNT_TBL_INC			4
 
 /* BM port drop counters. */
 #define PPE_DROP_STAT_TBL_ADDR			0xe000
-#define PPE_DROP_STAT_TBL_ENTRIES		30
+#define PPE_DROP_STAT_TBL_IPQ9574_ENTRIES	30
+#define PPE_DROP_STAT_TBL_IPQ5424_ENTRIES	38
+#define PPE_DROP_STAT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_DROP_STAT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_DROP_STAT_TBL_IPQ9574_ENTRIES)
 #define PPE_DROP_STAT_TBL_INC			0x10
 
 /* Egress VLAN counters. */
@@ -426,14 +434,30 @@
 #define PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID	GENMASK(1, 0)
 
 /* Counters for PPE buffers used for packets cached. */
-#define PPE_BM_USED_CNT_TBL_ADDR		0x6001c0
-#define PPE_BM_USED_CNT_TBL_ENTRIES		15
+#define PPE_BM_USED_CNT_TBL_IPQ9574_ADDR	0x6001c0
+#define PPE_BM_USED_CNT_TBL_IPQ5424_ADDR	0x600220
+#define PPE_BM_USED_CNT_TBL_ADDR(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_USED_CNT_TBL_IPQ5424_ADDR :	\
+					  PPE_BM_USED_CNT_TBL_IPQ9574_ADDR)
+#define PPE_BM_USED_CNT_TBL_IPQ9574_ENTRIES	15
+#define PPE_BM_USED_CNT_TBL_IPQ5424_ENTRIES	19
+#define PPE_BM_USED_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_USED_CNT_TBL_IPQ5424_ENTRIES : \
+					  PPE_BM_USED_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_BM_USED_CNT_TBL_INC			0x4
 #define PPE_BM_USED_CNT_VAL			GENMASK(10, 0)
 
 /* Counters for PPE buffers used for packets received after pause frame sent. */
-#define PPE_BM_REACT_CNT_TBL_ADDR		0x600240
-#define PPE_BM_REACT_CNT_TBL_ENTRIES		15
+#define PPE_BM_REACT_CNT_TBL_IPQ9574_ADDR	0x600240
+#define PPE_BM_REACT_CNT_TBL_IPQ5424_ADDR	0x600280
+#define PPE_BM_REACT_CNT_TBL_ADDR(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_REACT_CNT_TBL_IPQ5424_ADDR :	\
+					  PPE_BM_REACT_CNT_TBL_IPQ9574_ADDR)
+#define PPE_BM_REACT_CNT_TBL_IPQ9574_ENTRIES	15
+#define PPE_BM_REACT_CNT_TBL_IPQ5424_ENTRIES	19
+#define PPE_BM_REACT_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_REACT_CNT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_BM_REACT_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_BM_REACT_CNT_TBL_INC		0x4
 #define PPE_BM_REACT_CNT_VAL			GENMASK(8, 0)
 

-- 
2.43.0

