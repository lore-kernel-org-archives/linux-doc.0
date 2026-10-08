Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5E4D0CF3
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471130; cv=none; b=OP1UqFOztq26MV5exbASUsA269xX9fSkOCK7/9WqnhKsKxnh0EBb7kHdh0tl08QYYaPY+jYprg5+T+fx0dPCErZfjEYQuCYtDOreVlL+UDPoawMO4Oh0ouJAE7CNlMbQST9lyBPlioKMmu2YrYfqXrvMLAhjvzPKY6lHk/1UrsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471130; c=relaxed/simple;
	bh=Gtke8i26nRGP2m2Ls3Qc0BYfZlPjoKuLmA05KYTQJXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAXFRWvUzD+GUZd6TnoWR9Y3Z1QGP1IZlN5dLBJ47BxcrjJR7V/+O9UW+CrmZ4KHsayEPf99twp+4+y91T4MxvQfW33b3lfIA+FFFu4khsu5dErvsXZAAB5bctwdzqTKrVt+cmTUkFWKzPcLqXFIe39lhOwRfhriYNheKycZv/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFKl7/FJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvAQn6uw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFKl7/FJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvAQn6uw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVBs13017302
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 14:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7H8tT6FroUyF318yE6oZ9NGS7BiZzl43bbS0SsuftU=; b=fFKl7/FJ6qIB2hDP
	kHR5q88Kr7tv+twC4P7OhBYhlXqP3dyEChQ+ZX3A9FrkLb6ZoxlhfwvVARtKxJUj
	1a46Jpf9Kn7kZCPWHrQgjkxtDWwZ74D5G9U71bSJrlDA0Ke9AiPkxHsntZKpACq3
	zcqnI9xSpC2udqk/2eXYPCOb+Q1wu9sK0YiD3XQd3whqF35BDCfwuO/acvJKl6Sc
	GDnIcAGt7nycqWd2sn5VQhHG7q5IVh/hKqHpxMEuDLhTW4Vd25uvZqarNQxQcpwy
	urwJaIG2Ngc+vlDHvvw0BnLXdZPBJWQiutnC2bFCozsrENYdcP4/QDivPG+hMsRB
	vEEC0A==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kggj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 14:51:53 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8ab3dc2a7adso22763157b3.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471113; x=1792075913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7H8tT6FroUyF318yE6oZ9NGS7BiZzl43bbS0SsuftU=;
        b=CvAQn6uwhQW1BIlONP2+8WT5xFThG7YqfK6tRLfiw1ie3TWh1EuA/ZEwb7qcYLNbBU
         2nMb6obXw8nvYQCI1S+mpW6/eXZuIksLD683QabpcqotTBMoDzgUDOhm611xb3aBObZn
         3JzuUWIOxc4M3drXwVyk/IMTGsOEdFY+nf/hRlDA1MF3CZC1uANvS1pAH2lnx3rwlGFz
         BSbXehfStn7dR9lySokhoYoXkpSxfJFYrNOloM4+SrzZQRBlkfOtNHE/lIUhs+sZRb9K
         6Noin/RKS4XEE2id9DGGuUFFUY9A/EwTQC++cMq7Tg20nip8HkULhueJmFvENZuCsARh
         5fYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471113; x=1792075913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7H8tT6FroUyF318yE6oZ9NGS7BiZzl43bbS0SsuftU=;
        b=yqY4rkBRdK1MdqHfvwQPuwhT0AqzNaiEvKaVW9Kbi+Z2ACJjmwyj2cOg8xBDfNVmjv
         vjBAtI3EubhVAOYMw1EEQwSHeUfWXTCBv+mjrmytlTU8+hY1tlK0P7f1kqvhKZXxKMfq
         jPOx/cyrMUSJGXesiNOtxpL/FT50N59eZk93b298VxtfBTuBsMRPS+BiOqZRBzN6s6bs
         j7IcBfwh2+/Bs6gcCku9+MK6/VFth7eQzXO/qvlyA39nO2gg43CnKCq6CxWZKGa3M9BO
         8ir8MUX5wEI/f8tgEVIGCMo7TpzIPSLk1zGIc5N+CXlYNSl1K6NDgeGF2w1YETTj2iWC
         YQeg==
X-Forwarded-Encrypted: i=1; AKwUvBydanan2Md+KcresXt6jmw4YBO4EGQjXe7BaAIHiu4Z7HRDUjnHc6pB3x6OzR8+A2XHGggQTwnnW3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR5fnufxNAIXkR3R4TFtFRQzsmNlinYIt9q2Tvo93xUm7+2Try
	+ud6hSY3xhO4yquqpLneMfuirdAxpaipD0SaDJ+EzoyzLr1zyFO2hxSJUZAp6+aZqRTIvp9SXAr
	TzOTmT0LGeZSjJ5pvYX3tL767YJzpe7gvR6GBVpHlr6iSArx8NhDgY51Y2WihPa0=
X-Gm-Gg: AYBFou2Qu7aI5ZZSEyptg7HWyyXT+veZeV1oFpR1TS2Ad6kB19BLczSwUp5gGf3RFB8
	X/lJVID4HvD9v892MTMxUSf9YSXK/SFfI10PD9+XOWzHyvNZ1MCurWTEiSWT0gLsqugpSEkNjz0
	y5RdFKRW8el08cAmWmkayEVMqYCrIyBuWNimA7aYuCdirVIhVldHOtA/qGnjdzoG+2nGOyNqsJR
	n1LfHGMpZvwFXNddomP/ygOBxqQeE+NjMh9SBno1+2vFxTm2FyTxKs4fELIsiOPM2tQpBX9+nBE
	vM97NPozHnXp+ijqIuJ4N3TxNfBGA4ggND1pge+jS7x3spDmuqmzZxsbPnLP4s2ALcbK7UmcBOA
	9wjvFe8/v3cz+Csus1OfnV2BhwOZDyrHnr8ow6abotQw=
X-Received: by 2002:a05:690c:288:b0:89a:63bc:8d7 with SMTP id 00721157ae682-8b05b1944a8mr33573297b3.97.1791471112746;
        Thu, 08 Oct 2026 07:51:52 -0700 (PDT)
X-Received: by 2002:a05:690c:288:b0:89a:63bc:8d7 with SMTP id 00721157ae682-8b05b1944a8mr33573057b3.97.1791471111995;
        Thu, 08 Oct 2026 07:51:51 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:51 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:38 -0700
Subject: [PATCH net-next 06/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 BM buffer configuration
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-6-16caf43e44ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=11943;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Gtke8i26nRGP2m2Ls3Qc0BYfZlPjoKuLmA05KYTQJXM=;
 b=1RwDItL//y8Mi6CISaa4VBGIR7jIV47mDQ5Wsro3E1S4LU9haU11q9aH4yEhd/HzdNqXN/qJ/
 avSSIeEJBcqA+C5svQieog83dcM82AGdeinav35gbMJOa7+fVGAaWGU
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: RkhuFRy7DYKvEicxUMPwMcFk76Bw_sjr
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac7ae09 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-NNO_4AfKcGNjVo2GvQA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX6xWoEN9dBh+B
 wa1UkAXCcaTtvRzU/yYyBjOvrfHSnpfmuC3SBIPgOS33ec00K+QYzJ6fw4qicTL/Ww5qyfQIe4Q
 eP3DL1fedksPUqhCEQYdMnLxUtyjbwg=
X-Proofpoint-GUID: RkhuFRy7DYKvEicxUMPwMcFk76Bw_sjr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX/P+XjCX1uTAB
 D5TbNHQwFm3vpLfB6+D6zOKhX3JXl5gXoIvYkVfzWYRslLT4Zq+An67L8Tnyca1RZc2th6JqgVA
 yE3A3FfpwGyNrCV+COpYkc8ehohe972maUZoRj3SMFkLOBZWG1xAo3o5lEY5NjnJgeAxv/bnH2P
 rXgqY1FJkq1SgNwHgPZcRdazVr0jASN8y5GS/nYYP9fH2g93jsrP4XE1JKzHFXpqxhNLXhDBVx9
 DUADtI/tZd9iwGlKLxvwx1fJk1alZUJbsH1LN9SK0IkG7xzRj5mZSRgU0BASZGaeCBhWTZODMR8
 u342TeVDJ+En7yWTRhqfh52wYiA40lCLH4EXlG71mJpcXx8V0JOgshXatohfc7LZXYYoWkMH9dJ
 Nf3BsVlCARa/dlTM08gEfT+/ohmxHkC9bKduhqXVDBZLQUgV674SKS6nUo2lbXUjWhdrsoybptk
 rYj3DViZ2UyetusQrxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

IPQ5424 has fewer PPE ports than IPQ9574, so it requires a different buffer
configuration per port, and more buffers are left for the shared buffer
pool. IPQ5424 also has more BM ports than IPQ9574, 19 versus 15, so some BM
register tables have more entries on IPQ5424, and some of them are located
at different addresses.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe.c        |  5 ++
 drivers/net/ethernet/qualcomm/ppe/ppe.h        | 15 ++++
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 96 ++++++++++++++++++++++----
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 35 +++++++---
 4 files changed, 131 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.c b/drivers/net/ethernet/qualcomm/ppe/ppe.c
index f71b673b6f97..b144fd818998 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe.c
@@ -28,6 +28,7 @@
 
 /**
  * struct ppe_of_data - PPE private data of IPQ SoC
+ * @type: PPE type value
  * @ppe_rate: PPE clock rate
  * @num_ports: Number of PPE ports
  * @regmap_config: Regmap configuration
@@ -35,6 +36,7 @@
  * @num_icc_paths: Number of ICC paths
  */
 struct ppe_of_data {
+	enum ppe_type type;
 	unsigned long ppe_rate;
 	int num_ports;
 	const struct regmap_config *regmap_config;
@@ -275,6 +277,7 @@ static int qcom_ppe_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ppe_dev->regmap),
 				     "PPE initialize regmap failed\n");
 	ppe_dev->dev = dev;
+	ppe_dev->type = data->type;
 	ppe_dev->clk_rate = data->ppe_rate;
 	ppe_dev->num_ports = data->num_ports;
 	ppe_dev->num_icc_paths = data->num_icc_paths;
@@ -302,6 +305,7 @@ static void qcom_ppe_remove(struct platform_device *pdev)
 }
 
 static const struct ppe_of_data ipq9574_data = {
+	.type = IPQ9574_PPE,
 	.ppe_rate = IPQ9574_PPE_CLK_RATE,
 	.num_ports = IPQ9574_PPE_PORT_MAX,
 	.regmap_config = &regmap_config_ipq9574,
@@ -310,6 +314,7 @@ static const struct ppe_of_data ipq9574_data = {
 };
 
 static const struct ppe_of_data ipq5424_data = {
+	.type = IPQ5424_PPE,
 	.ppe_rate = IPQ5424_PPE_CLK_RATE,
 	.num_ports = IPQ5424_PPE_PORT_MAX,
 	.regmap_config = &regmap_config_ipq5424,
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.h b/drivers/net/ethernet/qualcomm/ppe/ppe.h
index 27458f0bc206..33b876d2e079 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe.h
@@ -13,10 +13,24 @@ struct device;
 struct regmap;
 struct dentry;
 
+/**
+ * enum ppe_type - PPE device type.
+ * @IPQ9574_PPE: PPE device of IPQ9574.
+ * @IPQ5424_PPE: PPE device of IPQ5424.
+ *
+ * PPE type is used to identify the PPE device of the different
+ * IPQ platform.
+ */
+enum ppe_type {
+	IPQ9574_PPE,
+	IPQ5424_PPE,
+};
+
 /**
  * struct ppe_device - PPE device private data.
  * @dev: PPE device structure.
  * @regmap: PPE register map.
+ * @type: Different PPE type on various IPQ SoC.
  * @clk_rate: PPE clock rate.
  * @num_ports: Number of PPE ports.
  * @debugfs_root: Debugfs root entry.
@@ -30,6 +44,7 @@ struct dentry;
 struct ppe_device {
 	struct device *dev;
 	struct regmap *regmap;
+	enum ppe_type type;
 	unsigned long clk_rate;
 	unsigned int num_ports;
 	struct dentry *debugfs_root;
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 8a553902ffad..3afa57119323 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -230,6 +230,56 @@ static const struct ppe_bm_port_config ipq9574_ppe_bm_port_config[] = {
 	},
 };
 
+/* IPQ5424 has fewer PPE physical ports (3) than IPQ9574 (6), so fewer
+ * buffers need to be reserved for per-port purposes. Out of the same
+ * 2048 total, the rest assigned to the general 'group0' pool is
+ * correspondingly larger here, 1650 versus IPQ9574's 1550.
+ */
+static const int ipq5424_ppe_bm_group_config = 1650;
+
+/* The buffer configurations per PPE port on IPQ5424. There are 19 BM
+ * ports supported by PPE. BM port (0-15) is for EDMA port 0, and BM
+ * port (16-18) is for the 3 PPE physical ports.
+ */
+static const struct ppe_bm_port_config ipq5424_ppe_bm_port_config[] = {
+	{
+		/* Buffer configuration for the BM port ID 0 of EDMA. */
+		.port_id_start	= 0,
+		.port_id_end	= 0,
+		.pre_alloc	= 0,
+		.in_fly_buf	= 100,
+		.ceil		= 1146,
+		.weight		= 7,
+		.resume_offset	= 8,
+		.resume_ceil	= 0,
+		.dynamic	= true,
+	},
+	{
+		/* Buffer configuration for the BM port ID 1-15 of EDMA. */
+		.port_id_start	= 1,
+		.port_id_end	= 15,
+		.pre_alloc	= 0,
+		.in_fly_buf	= 100,
+		.ceil		= 250,
+		.weight		= 4,
+		.resume_offset	= 36,
+		.resume_ceil	= 0,
+		.dynamic	= true,
+	},
+	{
+		/* Buffer configuration for the BM port ID 16-18 of PPE ports. */
+		.port_id_start	= 16,
+		.port_id_end	= 18,
+		.pre_alloc	= 0,
+		.in_fly_buf	= 128,
+		.ceil		= 250,
+		.weight		= 4,
+		.resume_offset	= 36,
+		.resume_ceil	= 0,
+		.dynamic	= true,
+	},
+};
+
 /* QM fetches the packet from PPE buffer management for transmitting the
  * packet out. The QM group configuration limits the total number of buffers
  * enqueued by all PPE hardware queues.
@@ -1413,7 +1463,7 @@ static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
 
 	/* Assign the default group ID 0 to the BM port. */
 	val = FIELD_PREP(PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID, 0);
-	reg = PPE_BM_PORT_GROUP_ID_ADDR + PPE_BM_PORT_GROUP_ID_INC * bm_port_id;
+	reg = PPE_BM_PORT_GROUP_ID_ADDR(ppe_dev) + PPE_BM_PORT_GROUP_ID_INC * bm_port_id;
 	ret = regmap_update_bits(ppe_dev->regmap, reg,
 				 PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID,
 				 val);
@@ -1431,25 +1481,38 @@ static int ppe_config_bm(struct ppe_device *ppe_dev)
 {
 	const struct ppe_bm_port_config *port_cfg;
 	unsigned int i, bm_port_id, port_cfg_cnt;
-	u32 reg, val;
+	u32 reg, val, group_cfg;
 	int ret;
 
+	switch (ppe_dev->type) {
+	case IPQ9574_PPE:
+		port_cfg = ipq9574_ppe_bm_port_config;
+		port_cfg_cnt = ARRAY_SIZE(ipq9574_ppe_bm_port_config);
+		group_cfg = ipq9574_ppe_bm_group_config;
+		break;
+	case IPQ5424_PPE:
+		port_cfg = ipq5424_ppe_bm_port_config;
+		port_cfg_cnt = ARRAY_SIZE(ipq5424_ppe_bm_port_config);
+		group_cfg = ipq5424_ppe_bm_group_config;
+		break;
+	default:
+		dev_err(ppe_dev->dev, "Invalid PPE type %d\n", ppe_dev->type);
+		return -EINVAL;
+	}
+
+	reg = PPE_BM_SHARED_GROUP_CFG_ADDR(ppe_dev);
+
 	/* Configure the allocated buffer number only for group 0.
 	 * The buffer number of group 1-3 is already cleared to 0
 	 * after PPE reset during the probe of PPE driver.
 	 */
-	reg = PPE_BM_SHARED_GROUP_CFG_ADDR;
-	val = FIELD_PREP(PPE_BM_SHARED_GROUP_CFG_SHARED_LIMIT,
-			 ipq9574_ppe_bm_group_config);
+	val = FIELD_PREP(PPE_BM_SHARED_GROUP_CFG_SHARED_LIMIT, group_cfg);
 	ret = regmap_update_bits(ppe_dev->regmap, reg,
 				 PPE_BM_SHARED_GROUP_CFG_SHARED_LIMIT,
 				 val);
 	if (ret)
 		goto bm_config_fail;
 
-	/* Configure buffer thresholds for the BM ports. */
-	port_cfg = ipq9574_ppe_bm_port_config;
-	port_cfg_cnt = ARRAY_SIZE(ipq9574_ppe_bm_port_config);
 	for (i = 0; i < port_cfg_cnt; i++) {
 		for (bm_port_id = port_cfg[i].port_id_start;
 		     bm_port_id <= port_cfg[i].port_id_end; bm_port_id++) {
@@ -1472,12 +1535,23 @@ static int ppe_config_bm(struct ppe_device *ppe_dev)
  */
 static int ppe_config_qm(struct ppe_device *ppe_dev)
 {
+	int ret, i, group_buffer_cfg, queue_id, queue_cfg_count;
 	const struct ppe_qm_queue_config *queue_cfg;
-	int ret, i, queue_id, queue_cfg_count;
 	u32 reg, multicast_queue_cfg[5];
 	u32 unicast_queue_cfg[4];
 	u32 group_cfg[3];
 
+	switch (ppe_dev->type) {
+	case IPQ9574_PPE:
+		group_buffer_cfg = ipq9574_ppe_qm_group_config;
+		queue_cfg = ipq9574_ppe_qm_queue_config;
+		queue_cfg_count = ARRAY_SIZE(ipq9574_ppe_qm_queue_config);
+		break;
+	default:
+		dev_err(ppe_dev->dev, "Invalid PPE type %d\n", ppe_dev->type);
+		return -EINVAL;
+	}
+
 	/* Assign the buffer number to the group 0 by default. */
 	reg = PPE_AC_GRP_CFG_TBL_ADDR;
 	ret = regmap_bulk_read(ppe_dev->regmap, reg,
@@ -1485,15 +1559,13 @@ static int ppe_config_qm(struct ppe_device *ppe_dev)
 	if (ret)
 		goto qm_config_fail;
 
-	PPE_AC_GRP_SET_BUF_LIMIT(group_cfg, ipq9574_ppe_qm_group_config);
+	PPE_AC_GRP_SET_BUF_LIMIT(group_cfg, group_buffer_cfg);
 
 	ret = regmap_bulk_write(ppe_dev->regmap, reg,
 				group_cfg, ARRAY_SIZE(group_cfg));
 	if (ret)
 		goto qm_config_fail;
 
-	queue_cfg = ipq9574_ppe_qm_queue_config;
-	queue_cfg_count = ARRAY_SIZE(ipq9574_ppe_qm_queue_config);
 	for (i = 0; i < queue_cfg_count; i++) {
 		queue_id = queue_cfg[i].queue_start;
 
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 746dfbb5a682..441e8e04a80b 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -386,17 +386,32 @@
 #define PPE_PSCH_SCH_CFG_TBL_DES_SECOND_PORT_EN	BIT(16)
 #define PPE_PSCH_SCH_CFG_TBL_DES_SECOND_PORT	GENMASK(20, 17)
 
-/* There are 15 BM ports and 4 BM groups supported by PPE.
- * BM port (0-7) is for EDMA port 0, BM port (8-13) is for
- * PPE physical port 1-6 and BM port 14 is for EIP port.
+/* There are 15 BM ports on IPQ9574 and 19 BM ports on IPQ5424, and
+ * 4 BM groups supported by PPE. On IPQ9574, BM port (0-7) is for EDMA
+ * port 0, BM port (8-13) is for PPE physical port 1-6 and BM port 14
+ * is for EIP port. On IPQ5424, BM port (0-15) is for EDMA port 0 and
+ * BM port (16-18) is for PPE physical port 1-3.
+ *
+ * The per-BM-port tables PPE_BM_PORT_FC_MODE and PPE_BM_PORT_FC_CFG_TBL
+ * are at the same address on both SoCs, IPQ5424 only has more entries.
  */
+#define PPE_BM_PORT_IPQ9574_ENTRIES		15
+#define PPE_BM_PORT_IPQ5424_ENTRIES		19
+#define PPE_BM_PORT_ENTRIES(ppe_dev)						\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_PORT_IPQ5424_ENTRIES :	\
+					  PPE_BM_PORT_IPQ9574_ENTRIES)
+
 #define PPE_BM_PORT_FC_MODE_ADDR		0x600100
-#define PPE_BM_PORT_FC_MODE_ENTRIES		15
+#define PPE_BM_PORT_FC_MODE_ENTRIES(ppe_dev)	PPE_BM_PORT_ENTRIES(ppe_dev)
 #define PPE_BM_PORT_FC_MODE_INC			0x4
 #define PPE_BM_PORT_FC_MODE_EN			BIT(0)
 
-#define PPE_BM_PORT_GROUP_ID_ADDR		0x600180
-#define PPE_BM_PORT_GROUP_ID_ENTRIES		15
+#define PPE_BM_PORT_GROUP_ID_IPQ9574_ADDR	0x600180
+#define PPE_BM_PORT_GROUP_ID_IPQ5424_ADDR	0x6001c0
+#define PPE_BM_PORT_GROUP_ID_ADDR(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_PORT_GROUP_ID_IPQ5424_ADDR :	\
+					  PPE_BM_PORT_GROUP_ID_IPQ9574_ADDR)
+#define PPE_BM_PORT_GROUP_ID_ENTRIES(ppe_dev)	PPE_BM_PORT_ENTRIES(ppe_dev)
 #define PPE_BM_PORT_GROUP_ID_INC		0x4
 #define PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID	GENMASK(1, 0)
 
@@ -412,13 +427,17 @@
 #define PPE_BM_REACT_CNT_TBL_INC		0x4
 #define PPE_BM_REACT_CNT_VAL			GENMASK(8, 0)
 
-#define PPE_BM_SHARED_GROUP_CFG_ADDR		0x600290
+#define PPE_BM_SHARED_GROUP_CFG_IPQ9574_ADDR	0x600290
+#define PPE_BM_SHARED_GROUP_CFG_IPQ5424_ADDR	0x6002f0
+#define PPE_BM_SHARED_GROUP_CFG_ADDR(ppe_dev)						\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_SHARED_GROUP_CFG_IPQ5424_ADDR :	\
+					  PPE_BM_SHARED_GROUP_CFG_IPQ9574_ADDR)
 #define PPE_BM_SHARED_GROUP_CFG_ENTRIES		4
 #define PPE_BM_SHARED_GROUP_CFG_INC		0x4
 #define PPE_BM_SHARED_GROUP_CFG_SHARED_LIMIT	GENMASK(10, 0)
 
 #define PPE_BM_PORT_FC_CFG_TBL_ADDR		0x601000
-#define PPE_BM_PORT_FC_CFG_TBL_ENTRIES		15
+#define PPE_BM_PORT_FC_CFG_TBL_ENTRIES(ppe_dev)	PPE_BM_PORT_ENTRIES(ppe_dev)
 #define PPE_BM_PORT_FC_CFG_TBL_INC		0x10
 #define PPE_BM_PORT_FC_W0_REACT_LIMIT		GENMASK(8, 0)
 #define PPE_BM_PORT_FC_W0_RESUME_THRESHOLD	GENMASK(17, 9)

-- 
2.43.0

