Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8352E3D565D
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127349; cv=none; b=QQgqzQUrmv2JFTzk0rnQsPg8JwJ+xlJKScnSKxwOh36dFXVlnLMllDlWgD15p1MA/1RC6diep4yWtLuYqFh4+BAVaAno9L/JO7qhXAyb6gjLcE89eN/qXVSvCsjhKaOawz96rBUsOWVJ1KiQuEARls21sHgSBlQbAwThc7POdXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127349; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxmmZUjlAzgA/zRtDWCPdAUz8KvJx2n1xf1iIO9cAmWgtDOE3R4P6FEHekPfSeNWks865ewykBx4hQOwmmuO/8BW8UAwquyonDRxWdrVYjrTqSOOI8BOdKrEOerDUeQgqwK4xYWyj76bRqgrg8TvrEnvBBuVH9gX2Tt3KVmbTpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bE00zKg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7VDCBsN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE00zKg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7VDCBsN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EUXA2373270
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=bE00zKg82QpSEXAE
	sUs1tgKxj60OvCcicGr+h9SRIsymVM+bIeE+ZzpohQMX115+Teu1J3/TxLvSxX2R
	4teFSl2ZGqEpXBWNOL5B2hjg82A9yKGx00y99kvWsm2tjrUuaqrbuMhDwSCtVSUA
	sNZdcbMNJzutUticdx99e8ejvLsdwHrdPQT0okl+TyxnVQ2kM8PLSoJD1xVP50Lb
	QGAq3DOTY/nscC/ihSxVkhWcOIAAWxZ/tv6wkQtROLT12iEIggf9kA0y3MobxHH3
	NkhERxlQRyyXnnTcF9ku0QpHc/5P/LOE+BuvWj6s1AEkNx41NOscxDqSdctMJkMN
	OxCDHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkkd83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae50463ba8so480487705ad.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127345; x=1773732145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=f7VDCBsNDmcZpX98KMCuFYjEYzqB7ObYsVBmmfxIn52Mgug6UaJDliMY06Gt/nZ6lw
         F3Z+mZgEPI5XkgoF42k5zBLzFP+1RxKTd6VgUN6b5SVDAFmPoGh5RrO8WWC53jD5+bAx
         u2JshhD7eFoeFuqV1ScU0wVVGgKYKb4uluwWxidynUD2SPLrJh6tbyL9zwmCrPn+JBuT
         pONzwBNgR+qwtXZf0FEjz4OfQ9YBzBujjaYj/7oDhh71/es+v2tRO1DHt/V2i886EEpS
         Bncxq94+s1fxZcorn4iO0AudVl0CkBTLVUj3360bukJH2zhFDV9ZlGzNu2c8aiXQC/HH
         veZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127345; x=1773732145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=n1JlkNQxryOUSkeFwNV0F2exG0tOlzpQdB/tNKXsy+qU3WuvuM7aQVdorUSMLw9fnP
         yvK68jUOs+xbdbAwQQxPyQ6Rl3X4nk08fcSh2Aviq4ToedLHrLHsZh350t0HN7ELuYmp
         JwmMpUaZDc7ROtDlRCvwuxSfeclyLzfaEWKG6w71BPq9iXLVaNFX3X7k0JVaS6qZKfSH
         2Djnqe23flzK3scEB6rFWbD9xYMMor53ldI/GP9O9FzT3Nz6BuWTfJLq83c5duM2KDRE
         Prdl9Sb2lZsDg9/gMnht5kA3JlTrsxTlObrrjLnOOnO1NZnydM9mj9qw3s7xtcLGdTqA
         +x6Q==
X-Gm-Message-State: AOJu0YxGYEYRA6stVnJCv8djqc3LZM5JZLVSpVJGCns8ZPcmIOMwCHJS
	A1dFfzEN3bAIs9QTyBGNd9ltg2Wyi1rbmavN/yFQ+W2l6QkEJ0IlBklth6HbmBRTw17kVO+r6l5
	Ts7WpYu8mOpHh+1hbXk0Zi/LDw3mvsTapcW9ZqfGKHHtpa92eamNry3/uxLsbDLvItKMjSE8=
X-Gm-Gg: ATEYQzzwnoOo8W8x5wTJzHXXEpCuHalp4oAPkaz/FOY/BwgfqfWvAUtT1KKILjF8D+m
	O2iNMpRnhxmgHUmGFtjV1MyDW6JkxBqRHcRwuupOdRXg592QRbVRt0eehUAbJyFCy9cHq3bjBAn
	qnnb2azlmbxWNaPjA3rKGeqSxToj0BMu9UCBAFSzT1w8b3nP+aYBjIexX/FlSVsg0yNgw2o4PvU
	tsXt/Jed92AdrjeLugH2V/6PEmUsxGxXsdi4FYIw9hhtEtB6czzY+FiwrY9tpe0+o1zpsP/GVHw
	Gm+cZ5m4+I0dhBE/R4eM3AaCMdzjumoj+YgRazSzeOTGsx3ZxvdAmz9+TWja+41sJFZ3ptq0qEv
	7EYGZmB+lqgqDmPyIJUuAaxfrk8GZ71jiT8WJOeNtoH4yUbRMARA=
X-Received: by 2002:a17:902:e94f:b0:2ae:4b91:8407 with SMTP id d9443c01a7336-2ae8242d12bmr146752035ad.34.1773127345323;
        Tue, 10 Mar 2026 00:22:25 -0700 (PDT)
X-Received: by 2002:a17:902:e94f:b0:2ae:4b91:8407 with SMTP id d9443c01a7336-2ae8242d12bmr146751725ad.34.1773127344908;
        Tue, 10 Mar 2026 00:22:24 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:24 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:00 +0530
Subject: [PATCH v3 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-3-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=JpWPX2Hky7cq3Nl6hLOjQzB7LEodbqyGjGzdh/B0/3SOpGWRzPC5Y7PbSt0UPu3GoyPubIzcS
 ufCXAQU53epBVWp4MW4wO6vSR7tsCwarDtfd8M7z7dvhGKxtoJf6jlW
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69afc6b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kFySLsD8YnwH6eXZIWNrVTRnkXVjhXc1
X-Proofpoint-GUID: kFySLsD8YnwH6eXZIWNrVTRnkXVjhXc1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MCBTYWx0ZWRfX9Pa88+lwwW2o
 ES/DQ7bh5F43w6c9TKSbtc7U9z4s/lqIqRtEflcFERzaRl7yxlNzbjwSbMcvfYvyNO8HPm2kUIU
 W+MOl7TVZtshQqAzgGr+Msn8vR/UlXUU3HHCpdMzEhg3mQYUPH6tVUr5hZXtAftYh+MiGIC9za+
 3nfnFPnlvfC1VadVMllNyzkGi7gLJ4UJAXJC3dvBq55NN2brUkFZqvn7QwktkNWsDC8cDQiGo1m
 ckGZtZ6v6FyCeFB1wKyQhVy4Ic1fcZJia9jJCqZg7DMagubJzDoG8U1D2pq5DqB9y5FkZmbD56Q
 y0RxcKE269eJ4LaA61xeqNoFdIHpMPBWY1hcHFhJVIFtTeHfr1798ZbjZxxvj+bI2AZLNbNY7Up
 YKqILFw32JqoJvivOnUeFZ5xTLdVMYOn65Q2Rwtu2eDDmz6eUI6DvULa22ibxy52PmdlwTGN1Sd
 YdOG/TxRvnMn9BtUSmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100060

Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
channel rather than a QAIC specific channel name. As a result, the sahara
driver does not currently bind to such devices and never probes.

Extend the MHI device ID match table to also match the SAHARA channel
name. This allows the Sahara protocol driver to bind to devices that
expose the protocol directly on a standard sahara MHI channel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,

-- 
2.34.1

