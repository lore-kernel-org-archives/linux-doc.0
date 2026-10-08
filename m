Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715A4A2E1B
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465296; cv=none; b=VTqzHm9VSxpBLpZm05r6QkS79YGeIzPXMJLE/F2HneUYVe6NhuWp/1LWj1gxQ7XCo7d6sSzar+ehhv3D/iyW/SftTSzgF1KgB0meclinF4zd5iQEViPvHtIX+rBm6AxMkxK8mnoJVnWcqxdKMKr9C19D47LgMzszTn4mrr3Ta0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465296; c=relaxed/simple;
	bh=D6Ku+N6JIzYkp6Cj9FfTJ7DgLhDCSoLWVqdmmrAqB0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U/vEm90qun3T8t7YDqUAJZ6vdSRLhaNxxE3FpVqOF7VLliP/AYt7xYSjc3mfizDbG6JTXX98RNCijzLqbUuV1HE+WaqLH8vqBvpYa+GZT21WPHL7VjRqqvYIPZcl58nyQQg7M5IQS1K3jwnIbDA6vanFsTI1K2sukJKrsGS1K9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JiBwMqqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T801KnRN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiBwMqqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T801KnRN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKQa43225211
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 13:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeefmzs9LhzY5+EVSVUwc7I2W02AzJRIpvFvDzODvew=; b=JiBwMqqLXOBphoa/
	aCjANvLZpvmQFpAb1DX0nlP+kc3Tlw/+44f+aUPdA0PCOTf5ZXGOtny/HpHoGUaz
	9zJvoKZ4g3E7w45VQg85KLUigp06bSfGnM6tfBTqN1sBG3ERSJsve0DgMrTxZU+a
	NTL5fIJTn9ZjvFLTi0XDrfb6Y8G6yPIzehx1HPcXpj3v/w8IwsjoZqSqiNmeubyN
	H5X3p3v/jzxHWknyABt+pPfOQyK2LWgqlPCVU8SJBL6AAkWZFxLK+wl/CBQBn04h
	jpj9BKUz5/YniKvx9ytCtr8s/yl9YvpSJpbZbu9U8sx87E2uR82zvRifdVL36Btq
	/1LqDg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe431pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 13:14:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7be85823dadso837711137.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465293; x=1792070093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eeefmzs9LhzY5+EVSVUwc7I2W02AzJRIpvFvDzODvew=;
        b=T801KnRNApITFnLU6z/po69H1aYL6OicXbCbB4bFmN3FyIBW11TEghqHfZk/xVKh7o
         MbphsSMdC/5QbwYdoVPq2ICv8PK6V5O8UTihBAq5RWYiNVDLn4OrP/w6X0fj5JS54h0H
         h47F3C6C8CxlT68w/gSd2ujzZu00C/I89yyry2em8DnVF6NOviq8gEYtsAW91/2RL4Wc
         71WzVSzuTueyz48mopEkkJipSfZ5U56yxpr9FIrOyfnM+ujXVw8evKXITB3OzvKhkyN3
         vSBotwPmaIbtjPce8+s1+wsF8l1HbPabTSa82lhehPGaogSJbxrrkXYdAjRRcKI0IlM7
         VODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465293; x=1792070093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeefmzs9LhzY5+EVSVUwc7I2W02AzJRIpvFvDzODvew=;
        b=cM/44jtR4M3nBLOARi094xE0yH8TA3c9D9E7RyaLMFvMiv4tC7724+ISru99m2n9cc
         CbPDnQuUrZB937E1OM5C3IEZlcepx1I7ZeBj0T2vtoKCoJ1N/xNkuL2xTqRfVXtoz994
         n/mSalHepKUrugzlCbwoks+R2cW+s9JU+6F7Rhfrs4cuLXeeSp4TX+0fE88W7tZYhbNe
         Wm/XrB2BRfY98ed9xL4RbU1XkaVIvBwW4XDSiGn9jprNQMWQIJ+XZLc7PzCGzG+Z21BQ
         2/TOKGEszyblANdUtvay6w2bWHfPNbqR2rNqZ+AgIjcTDPy6eDXUaAbIJvSLLkVNCMM1
         re5g==
X-Forwarded-Encrypted: i=1; AKwUvBxxkdZ6sltvD2nvpA/vm4Ypqb67tTMUt44K6bGM9zSFYOU8zotYuZ7eb/ovaOToK0XCLJlsau2IoTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZJMGLYvpMxqssbEH/OD99+3h02rXr93ob6K7iryaNys8Hd5m1
	Na3BUKiZJYRlGjSz6k/cbzTUQEvolq+Jq9yyGUAKWSKWIlbrwOnZG0jsQnZD54uYCeqj9Tfifik
	gBqdEHVDYYR6a+LySVSLjHO/GZIgjnYjoK53FN0Bxyi5T147dNj8de830JfA1mGbuSsXdBao2hg
	==
X-Gm-Gg: AYBFou1EtHHlwXLSiLwjI7w5CyJJhD+My58MxcfK3Vcyp9evB5UmWWsFWZdGIQqdUsY
	B4VLJH34GmNUj+2St46ZHkJrUHNvitBNmTKw2UpU5BQY7AaoTImT5H/ntuRvYvaap7kIw1EUpex
	7MVJhqFeK/dPwR9vdJleAj/VE4/3PK+2DbQ4Uii2Dm6k0JLWaIaDgulInzjzt4k2+XL2N+ygUJz
	kYL0jwcFV3kPyRj3F1xK8FJQqsE6RxF05mGJ9BleGv0zMVNk3X1fd7AIY9ZgrloK8PX4/2G+GeX
	rUxjT6unqa0ZecfgKLFm+1VuRlT802nWjy0I6ZOPVGLV/FEv+JUskblSt+GlQae11dQQYCJzMVJ
	Uykl2dfCdN851n1Zhw24RfJVhiZsJhWT9VK0W3nehq0LgQHgCUvauxBQu8a7ydGGd76esSm+WIh
	Lu7IWv0S85LT76
X-Received: by 2002:a05:6102:c0a:b0:7a7:195a:1b29 with SMTP id ada2fe7eead31-7ca38f21119mr1191667137.35.1791465293053;
        Thu, 08 Oct 2026 06:14:53 -0700 (PDT)
X-Received: by 2002:a05:6102:c0a:b0:7a7:195a:1b29 with SMTP id ada2fe7eead31-7ca38f21119mr1191650137.35.1791465292302;
        Thu, 08 Oct 2026 06:14:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:14:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:14:23 +0300
Subject: [PATCH RFC 1/9] drm/bridge: terminate the lines of the bridge
 state dump
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-panel-atomic-state-v1-1-b157fddb8de1@oss.qualcomm.com>
References: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
In-Reply-To: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Val Packett <val@packett.cool>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D6Ku+N6JIzYkp6Cj9FfTJ7DgLhDCSoLWVqdmmrAqB0U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqx5dGergeBof+Ir1Y9fpKadE9sSryKVAMLgaX2
 1O19H0XINiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaseXRgAKCRCLPIo+Aiko
 1QruCACJxFBirr4cm6jgNgadta5LicAFfvDIC1fLiPRI1gBu2qCmyUJv1C67jnGMz1wWszQaMAR
 RSJq5Ys/grTuLG83mlU9qB6RN2BkSIRRjrwCr4ZY1f6heDWMJ3Vwi/V+DIL197fCH/MpyBptGZr
 19IZzGBJUo7kHsxcypuQoICyRmggvbsB3KVIDmQpPHIS/2YytXRYyAzJisX8x9eT5gNE1gMspzG
 tn9X3fcPDKw33G562Ve7Bw+iCzGpePQmVOkgZPKim6mE/iFiNubnpPnF1YeT+JFLFucJkyIz25S
 0lVIgZ14Y3/Tnsy7dK3AMrBh5+jrJuz/DLahtLTUlo/dNUYD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: rqrA5pXxccYoVXZAxZDtzcMknR15MxB5
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac7974d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=aQ5-ZW0w08Ed3PgdgAAA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX2h1JVIpErVBy
 pqDSQoB4tWAB655e/y/N/7ySyxlHB1NwPsJFSm7ISb9VDcKsH33m+8vHnx0ECEXeS3fDPdhG4zV
 62qR/qCxQKvKOnP2a/3+WZBoHGC6ePA=
X-Proofpoint-ORIG-GUID: rqrA5pXxccYoVXZAxZDtzcMknR15MxB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXzfA0tLFBCvjW
 2YYR/PyWlf8/U5bjdsvyqZfML3xYsp8g/m17mW/E2CoE7yo82FBZTiJYwsjYqOs+di2o9vf51rB
 OHGJsGWA9cOKo3m1I4vr4x41jrV4ti1nSNti/FxDaSRdvPG3iTcpuQVIAw2hohEokex5sxYlHFh
 nmPCMJCIFKxXylJc4XTv1QdzJ2crvd1OrR0S8UtqsSTfoRsIiRWFWzY292vOScWFHO4YvbFCuUR
 lbxS6AD3FfsB2OEscod1hA9i/+EdIQ6d0dAYaflHcElS7n3+aRPmIA20FEC9wbt5GTTQG0z+pam
 TA4QEtGVfZm+DA/AtUUcLc5TCIAfNNPy2xu8SS4Qkp34gtj/t+iIKA/J0nNd2nHJIw82+tvVxMU
 /1UaNM/pRE7nicplGDgJzzhPnThH1YXwE43g4OCECiSda461UmMPRi0hBq9fvjMZAA4ADrkL/ks
 b5pQJ+jm15gAMNQjAKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

The bridge state is dumped as a single line: the bus configuration
headers, format codes and flags all run together, followed on the same
line by the state of the next object. drm_printf_indent() does not
terminate the line it prints, and unlike its other users
drm_bridge_atomic_print_priv_state() does not add a newline to its
format strings.

Add the missing newlines.

Fixes: 4a7a146f1cc6 ("drm/bridge: Implement atomic_print_state")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..0f37e3ade016 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -565,12 +565,12 @@ drm_bridge_atomic_print_priv_state(struct drm_printer *p,
 	else
 		drm_printf(p, "bridge: %ps\n", bridge->funcs);
 
-	drm_printf_indent(p, 1, "input bus configuration:");
-	drm_printf_indent(p, 2, "code: %04x", state->input_bus_cfg.format);
-	drm_printf_indent(p, 2, "flags: %08x", state->input_bus_cfg.flags);
-	drm_printf_indent(p, 1, "output bus configuration:");
-	drm_printf_indent(p, 2, "code: %04x", state->output_bus_cfg.format);
-	drm_printf_indent(p, 2, "flags: %08x", state->output_bus_cfg.flags);
+	drm_printf_indent(p, 1, "input bus configuration:\n");
+	drm_printf_indent(p, 2, "code: %04x\n", state->input_bus_cfg.format);
+	drm_printf_indent(p, 2, "flags: %08x\n", state->input_bus_cfg.flags);
+	drm_printf_indent(p, 1, "output bus configuration:\n");
+	drm_printf_indent(p, 2, "code: %04x\n", state->output_bus_cfg.format);
+	drm_printf_indent(p, 2, "flags: %08x\n", state->output_bus_cfg.flags);
 }
 
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {

-- 
2.47.3

