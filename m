Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED3539C01F
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157490; cv=none; b=YglKjyWG0Qjwo0L8ZZg4lleILN6Iz8ECavCqjHnyrMyqS1rm4w/QO0xm7cyqqukoSngXVPkuRMshBPrQvK3Km7LCFiydWBDq6GOztX+ExiLNJtKZLOrM+D6LosE7QfBFK0hb18iT5aiK3+pkbcYIIWYk88AGZPb+k5KxB9avd6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157490; c=relaxed/simple;
	bh=aUMoNrCGDXfli/Niiqe45turoruXO4WeijyijWZBwgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tx66F2F20doeqH0x9NuPgnqZL5o6E0NN6gkLBE5NDjCgAh2qkI/PyUXod6+k+sQvNX0j1e3j6/bX3u13ug7t7Gt54k7+Mu1LyJ1emzOwBveOraUh2hlqDlcoXLPXWd3B2hiCH6dFYVob1Sz0Zf1InHTVwWaHT/ikQNoqU0VIY1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ctd0QWQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFVTsFO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ctd0QWQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFVTsFO4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaW8Y3295832
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTHMQ74pG40cf2TThEo/dQpxpxcnmIMpmWq++2akSHc=; b=Ctd0QWQFetJCAMd9
	RKKESClafTTT7T+OyEeNzaYVcWM5LtPvdgZDLcYEyXHDZu0LqDGZ2zxbKjGOylUX
	CdrzchUj5NEPIEJUzhoyqM6egLF9WkT6+DOyZhT+3ap3fuVBWxP4SqVfWBjTxtIQ
	2/QOkZAWOC9qVYF9VBaNxha3TcqfYnwd80zMeUn/rlyh1owZwB434ldUy/u6ygM9
	eMUQ2LXBnsDYig85g6OTISL5g9BSujiCLvAyldjAikbhjyN4n9T6xwE7JXr23jVo
	lfIJscceHxLownAtMUFKY+DNPniz2HQUfuO0LZfPGmlQRs00w39qwopdZu7MVoLQ
	5e0sOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mskbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:44:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd76ff19d5so1775047285a.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157487; x=1773762287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTHMQ74pG40cf2TThEo/dQpxpxcnmIMpmWq++2akSHc=;
        b=CFVTsFO4U2Exx/TN+VN7u49EboLRtUSBV4TV8apbAXof9ogZp7fPelNedJalJS0Ijy
         XsmLPQNxVM9xe5BWtVUjETAvbz6uRCvZGoEJKb5QyCA9vyvoqA9H92uYeSvHBu3s+srI
         32ljta6tGgLX8vxGnKaTL2GMaE9oCX7WDeekGtmVmiOzt1c26uo4uc1zWspfCJwpmJJy
         IzWbIFSxSjAknh2TEvn/56aFVSg7FUBjooac05MloFrBc0Lbty0W8L0N0JTXQTRpU5y0
         eog8uRiSjJ1xC8bt0gGaNaxWqIep6kwIFC/UkAzYWajajHXzijz/4jOljy1j32pOgKXf
         YzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157487; x=1773762287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YTHMQ74pG40cf2TThEo/dQpxpxcnmIMpmWq++2akSHc=;
        b=c68OsVOWNtCEKL/upE3YXq9QmPzhnQMvf3yIi6qkd0IyLj/5lxI1kmJX9X2zUTTMAh
         AkBniC/WQVlQoUg9n+vR5nPNipOfhjhVmRGloNB5uoxxtFq8uKKgdHGtQ//Btg//U4d2
         xkC5yAyj6mB5GEIWAtoglDS21MvBj59B4PEr0mMrgxAViJMNLtJxrNqfB04vaIVcIvmV
         0BwIzUsAJLPYw2SweCCJmK1tno0zjMU0qgDq16kHMZqE3Kdo1Rw1U2K84Q6HPK1J0XA2
         S+8cPzLOSm/CW+lg37oEkEafCknJVpivofjg/eHlrbc4kU7LvUp/wSSfUDz0x/gzQCil
         XLEg==
X-Forwarded-Encrypted: i=1; AJvYcCULM3IFw9UQlxhtxOEuFpgeIO2Z6bOblpbSQl4X6Qk8Xzwz8e7O/gq4K7FhhJZY/a0DsexMQrwRPR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/cLL6J20YNeTG2NHSoLmsgq86vzABjSPEYey5ARDpjxHdfBU2
	D9kclwTiD+JQ8NnGblRg0XDzu4W1F90GFrIpO7m3p9hbBfeL3J0cn1wnAzX10Na9fZfal5jhsN6
	Uq5qTPG5ykT74YgGz07qDhwI7GYFkb1Qo6uWg2yU6TE8Lg0ILCU5R8hhSCB+3D90=
X-Gm-Gg: ATEYQzyH9XT9h3+MsZTpijk+QbkOVylVGDVbqBmqHerZRcBbrCcyMWDmCRnp68KII84
	rG0+wsbvTG6AKFPEiLCP41mMhH5BxLuIWUjTaKXb35drnXUmD1Ip54mF77x+DtTrAAHIMdZ6bJ1
	wdh3gfnmulVKVuj3N3RyD56rmGmuLNK2m3+T405uKQ0X2sAjf9oTqV+SzijnuuHFjXp1OLkFJv5
	NmPypaOlIUqWt4AAvLN2DrEFTSNj35499imA2HZ7it3b6y+Bz+OkkPVQMNdGPIbM8BD0+ko5/rm
	l20gW+Q2UaTROqprLVY0zq/TVGZlQcePBngLtsFJ6unBlP78gVnVT9dBrBSGdb8LP/xDyTjdqf0
	uzN5pEBrYi817VQl+NjoVMBQ9vAEt3OxKN7qo4lrLnCqh8ztERuyR
X-Received: by 2002:a05:620a:4156:b0:8cd:942e:82de with SMTP id af79cd13be357-8cd942e8666mr396525585a.7.1773157487475;
        Tue, 10 Mar 2026 08:44:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:8cd:942e:82de with SMTP id af79cd13be357-8cd942e8666mr396521085a.7.1773157486975;
        Tue, 10 Mar 2026 08:44:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:15 +0100
Subject: [PATCH v12 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-1-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aUMoNrCGDXfli/Niiqe45turoruXO4WeijyijWZBwgw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxfpzbSkPVeH8GuqwtDjU20JoSJAxWLVFA0I
 mQrecpEKTSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8XwAKCRAFnS7L/zaE
 w4sREACIA03KZ/CBJdia1awbSxWwi7n+erMVmVCcbDu/vG+FMOdUidu05QmYoTjGqfMoXdCdXxJ
 rcYiXl/sD8miZQHtKA0HRRvFxCi2YqMLAh3gF4FzPKQkjMUiKoUCNa3aVF9iN7K3bdJIhoj6ndN
 eUKeMLsntE2yBGua7kAGLZlUClD1p0D00O7bXVg30uYwaNf7eeUxgkHqg3odnYmW98E/9oyrarx
 D2puHRcSMsjtZuqU3thklNrcBFmtQ59wI1pBohrI1JwVhwEAuU9sYrMP1aFYoUYNo4sORQX/Lo2
 CxKVfIUVmQGPKWTMUTmauELxQBjtFuTYyUzizOI6Q1lpWnH1C40djj4P/5fFt/oVsDEkFsz6hjK
 e3WgGI1MrXbtENuV5mhOgrvpD0rAGS81d7ZR6Qwx7o6Y6P/q6JyPc/jKyX+rCFlMb+fGS4jlFME
 4DcickTC1l10RsqAQrq0QvhOI2Tl80SuUNo5tbQnEOvonIWuFp3zyrsCg9Az+AsK7eG7LeBZCEm
 VZC96igNwdZB+8fgQHU6HzIzuSkiM/I2gC4ZirvMPK1upYp+0EekQNlfeJ/Ri5l2innh2eQHl9Y
 OU7Nm8HFyMlzCD+fR3snB7DQtrddKHmEQ4xsyyyi3nB3s5vwK6Iuw2vN0FP6Wvj4D2vANS2iz12
 LRCPWsxm4P1XLpw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b03c6f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gZ7R0apoZwbJbspVpeWSkS45Jcemo-2y
X-Proofpoint-GUID: gZ7R0apoZwbJbspVpeWSkS45Jcemo-2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX/Ehm6/VrY83s
 jp+oiSGuT7CTNKl3W8FF18Gfvb0DV5d47X0G/Ec5pRIZ4ZZ87ewQM4RWNaabPHVIub3CG/tX6Kl
 zcgP5f+tI0wsAtRKlWfg0Q/rz24NPSq8P53oEHI35Qs94mf4HGoiIeA2X5f9ejiyz9Ans2cQF2w
 g7VTvxEA4bl8wRj9G0LFqZv7ze/1dY9MjxdkvSf0AmG+NvKehBpL4diKH3RiI8/Dvan/+HhU585
 6q4YQseEZMuHP+aX50GcZ101f57LUe/DBMzmTQvBz1X1imR7W46cYaFM4HZmTA/9wMdwSXKxIbh
 eXzbjct5MXQd6Z061inVQgWf57QminDh4gaSHQVBjnWCpEsiyCegfEJ+s4YQKDRoHDSN8/8217/
 UZgKAUzOh8Ctpekwlpebcauezhtf1pmVXNMh+HLFWzZwQuXyxpxKsXinvywRKQ3xbYn0fUEOby9
 nYPObLRWk8IBlTX4Irw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100137

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index b53292e02448fe528f1ae9ba33b4bcf408f89fd6..97b934ca54101ea699e3ab28d419bed1b45dee4a 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..92566c4c100e98f48750de21249ae3b5de06c763 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3

