Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F964A8FC0
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465312; cv=none; b=Y+zOnc37sLeIhUni0lhONqQD12rAcWJz3CJS9WP6fgFCbhS149Aod7y6BSlAmNu+HX5KcNdSreBRcWQs7icSoLrdcNzaQ7K3Ub6hgIwQV4XFFkucz8t3gKepRWFzwS+a0f8V07jY5/ogepR+2DXuZh9S8YVNyk+aFUcJokRthrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465312; c=relaxed/simple;
	bh=8Vtfc5Vhy1+cySlmiGbXt3R0OZFZEbN5OOD72ntakHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcEdyHuUgEfUCe8Vg5Em3xkYJ9SbMXHfPt+ouJxyox6x0ByN76utUlc6lbIhrTA0u8Oxgs6jSCoeWEy4kGOgC6KzOOIvQJRaBKixZb3BLtkhH9ACvRabhmCQNRXBtIBsPug5q/imLMVJWVOX7CbFtIIYAG7n7INMkEGkC/yEC3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=la2CDEXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZFizvnI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="la2CDEXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZFizvnI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKAdc1269515
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 13:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csvfm07mHvVhHKbV5agBPH0uNXrDO4Yl/0BBvYmp7jE=; b=la2CDEXk2OvSLWVx
	anXfqjh3tzEhtm865n8TYn0mD3aBXk3YIyChQsL8DBO6blAvGCGe/gVK8YFW3/G2
	k7G/6Q+MtpL7wWHwxWRUHl+Jhu+NKP1vKy7nV8yFgtIfzkotB1V/FtrMIAh2fF2b
	Q7EyQcY4yOf+z6+KvbwVy/7/GBI8TN4Bq2cAiznSYRh0ZzOElGXpR33x6ofQODRM
	mf0Vda9GcvQrt0JCp+di8V4+/qesD04T5m1tdKKENRc1DxieeREsNt64jm4oXYWy
	scYtzdJSAsMvHXqdhHs/pVOxAyu+L1/lKi8UWVuwfR2/QkhKrmNfAfmeQG1Zp0Au
	+wv+Hg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32xjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 13:15:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c10b8abe29so5008720137.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465307; x=1792070107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csvfm07mHvVhHKbV5agBPH0uNXrDO4Yl/0BBvYmp7jE=;
        b=cZFizvnI8S/RY5OMh3sYxJSpKXH2HRjv7ByjQI9hAdw1V9WEiclFCdsUwbAGHU/+Xh
         hRvmJERLkehTo8cU0nFLWjuCSShHuNCwdaj7XHesRBTGWwkrmxJydFJL1akz1XQYeN5z
         b+93tWeFAtlX+JwuLUNwQ5h0lwoezX92IFx8W478PjJ9P/suebU+yWK/Y8zx80fRYQS/
         hMBba2l3876AJMvJahAXQKJXz12k2B8ZseE2mORgEr7hkCLcWl0LTbw0VLOnS4EgtzUg
         4sHNuID3qrfmbIn7330SaubwflHrqBMH1yC4YSwBsg6xTktncmWJjNpR+sBJkh4fMlgN
         p/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465307; x=1792070107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csvfm07mHvVhHKbV5agBPH0uNXrDO4Yl/0BBvYmp7jE=;
        b=i1xrUWnM3aMKSBxGz0qXNHvV5qjMT5oI7SG82zoHmIqTdOPyCyFLog7pcHorZqOMlz
         FXJlUvDeBWLCvJimPPVSo5nI8A4i+0dHbJguaJtuhC9B0/ZPOEnPsp6NiABmseTTffO/
         44MaxXkggNQ6+1KZJxK9QZnA7UJ4rP79W4RNHcmnScVV0MIJ7h4IBcbEE995uj3xsols
         +uQWHTuMHcPlNMu7nML2Hy+Iv26xmz6CLh/X6Iu1FswCpcgxY5kja3X7Ne0KSstFDJ7c
         iEOGnAvEnomTFKF8hizPk/ARpHdZb5SRNsIlpDJ+lUVbvjPe8nZla1xZxUgJmLaGZLbl
         Lf0g==
X-Forwarded-Encrypted: i=1; AKwUvBziYNeJKOk1D9JAyos+84TMt3yl85klbVH559uDO6Ui3wlTw7OfuAizSNGy19UJI8UMSgGtB1XQtEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvUTwDTsbzprliEfV3hoB0jDKGCS/gODUzJBYj+ne44j//g6fI
	A8MrnDsb6n3LERjrghZEW4Agltwwha4o4merPHC/3kjv2I2Y4RGFaZEgCVTz/slT9+3u3VsAQso
	Q6cBuYrw79JqFZBlwrLP2vDMqKaH4tW0JDEUGxDr6eM2sJ4IoZebBusXsAFeF0Aqcy0nbJgbrSw
	==
X-Gm-Gg: AYBFou3avptjxQy5u97zUSADPmqemP8XUHasGis4IT6YNephWfERULJZjCHlOlpicwi
	Z+JEadtvSTnRNuAAlIa55XR7vfVO91cBt0KiJNruVyiYcrQJ5zJ+C9p7WztgqZo4/VjmL/9eay/
	6Fuim8txfY4HqKK0QG3vrNtLSLwM59b4pWgdXDFaMu7nV+eLwofOAQqvgEeVP5P//hQoecQva0t
	MkGcVsX2Adv2qIn+trP41gtYc5HUoVbdOmZc5JyNh8ZMKR1ZlRvlfbfNisJ4gjFCnJXru7TAGSV
	2KJk+RVnnWlccHU8jjtquIKUyxsnu2gvTX51wn4Pak79bmBHmbJo6f5KFEYAqZ1/5uOG3f9ty1F
	le59sa2ONKLCymOIU6A9y+0x5kJPE4UO9cHw9YIkRW4oesEmH48xjEGN5hwPwbAtHr/ZZtBCxev
	Y4POq8fox5g24H
X-Received: by 2002:a05:6102:5124:b0:7c4:5129:8e17 with SMTP id ada2fe7eead31-7ca38f24bb3mr2010572137.31.1791465307301;
        Thu, 08 Oct 2026 06:15:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:7c4:5129:8e17 with SMTP id ada2fe7eead31-7ca38f24bb3mr2010556137.31.1791465306755;
        Thu, 08 Oct 2026 06:15:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:15:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:14:30 +0300
Subject: [PATCH RFC 8/9] drm/panel: add atomic_print_state callback
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-panel-atomic-state-v1-8-b157fddb8de1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Vtfc5Vhy1+cySlmiGbXt3R0OZFZEbN5OOD72ntakHM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqx5dHkhcl/dRf92UtqStXhuyjnMMpcO7OTegm/
 6IelH591c+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaseXRwAKCRCLPIo+Aiko
 1c5lCACkvON31pjWuwjbQjdxOf7Mb2UoJz7PCeluWDNicQbjHqBg5RyMTSBfQzOjsD9lSrdMJAw
 0Xs7pTYCm+HS2D/mlwjV7f4UMReB+WK/O6HAkY5UGTuCZVcAJ0yU+Wd2IdrnQdT8oHYXuPfisvc
 VDXpP6PpiZI9px/CDDHDID/Ff7sn1xGPN7iia3tzlPJc84NH5S4aBfoaJ1PNUuXjhkCZzx3tuff
 9huScJAmaCo0jz/o341FauA3r/SgVRTamSPkZVdboi5OrQiMrQzzWB7hcyrykrpwsU307RlOQzP
 Cl2rxTuT3zBwhMscKeQ9xcz36NH6Z6xTNwemC1eaIz/84KxF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX1eU82kQUJGIO
 8i7hHkbdPKkyliaIz06vJ3DVcIyUiy2Pqk4QvoqkO7aBsziSXkf73tGAncU8Q+WhmKpy/tWF+Ap
 /JBLgvDSmXIo4JQnVV2AO6MSXqLOa0L8UXZyjxVHZxUB95QjDgKxfdX5391NIOLQtdQD6mBvhrD
 9ypNsDFsHvc00xMra+yPhOTflcyRXQ+o9cXtLOW3S3rI+v2iTLhLWqstm+sTCoILLQBPnR9vTsl
 WzB1J1EuzeXrWnCTT7gGvIZtG+nw0AxA5dBX3eSLZKax4plNTFCVe9OXMrzXIzWNIIvDdGkYCyU
 9Npfebx7/ZPNaW8J6Ie0Vdj+kAw3wBKjkppGJn5hYbRknP3tCr7ZXGoz+gKMR9GRK6hQZg0X4pm
 2QNnfSuAd2gbs4ZJ3NHmufiGTgcsyihlzR3DvwEYTGst5krACZfT1cQPKmgYLaG2fxde3bjnoEb
 F1kABG/V2O2gYmW180w==
X-Proofpoint-ORIG-GUID: A55rv40GRjaBWhP_WDW-u_OK0JCqb171
X-Proofpoint-GUID: A55rv40GRjaBWhP_WDW-u_OK0JCqb171
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX/76hLnqPZN9w
 9JG+4dh9rFdwJbjEjh9o2g46CigoXXunWw/d88+ccMmK1pFOZbIjnH6Cbtn9C4OjGmTOXRbGcXy
 +3N0cA7HMjFOgQ8jVV+HPjUABaWHvYw=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac7975c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=10bbWnoWcBPEOdUi84sA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

Panel drivers subclassing drm_panel_state have no way to get their part
of the state into the atomic state dumps, as the state is printed
through the bridge embedded in the panel.

Add an optional atomic_print_state callback, called from the
atomic_print_state callback of the embedded bridge.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 14 +++++++++++++-
 include/drm/drm_panel.h     | 11 +++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index a2cd043fe146..9be36c5b1037 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -483,6 +483,17 @@ static void panel_bridge_atomic_destroy_state(struct drm_bridge *bridge,
 					   drm_bridge_state_to_panel_state(bridge_state));
 }
 
+static void panel_bridge_atomic_print_state(struct drm_printer *p,
+					    const struct drm_bridge_state *bridge_state)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(bridge_state->base.obj);
+	struct drm_panel *panel = drm_bridge_to_panel(bridge);
+
+	if (panel->funcs->atomic_print_state)
+		panel->funcs->atomic_print_state(p,
+						 drm_bridge_state_to_panel_state(bridge_state));
+}
+
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
@@ -495,6 +506,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.atomic_create_state = panel_bridge_atomic_create_state,
 	.atomic_duplicate_state = panel_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = panel_bridge_atomic_destroy_state,
+	.atomic_print_state = panel_bridge_atomic_print_state,
 	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
 	.debugfs_init = panel_bridge_debugfs_init,
 };
@@ -853,7 +865,7 @@ static void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		      !funcs->atomic_create_state &&
 		      (funcs->atomic_check || funcs->atomic_prepare ||
 		       funcs->atomic_enable || funcs->atomic_disable ||
-		       funcs->atomic_unprepare),
+		       funcs->atomic_unprepare || funcs->atomic_print_state),
 		      "Atomic callbacks require the panel state callbacks\n");
 
 	INIT_LIST_HEAD(&panel->list);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index dedd792d2c52..20e5b1e5f50d 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -43,6 +43,7 @@ struct drm_crtc_state;
 struct drm_device;
 struct drm_panel_follower;
 struct drm_panel;
+struct drm_printer;
 struct display_timing;
 
 enum drm_panel_orientation;
@@ -301,6 +302,16 @@ struct drm_panel_funcs {
 	 */
 	void (*atomic_destroy_state)(struct drm_panel *panel,
 				     struct drm_panel_state *state);
+
+	/**
+	 * @atomic_print_state:
+	 *
+	 * If driver subclasses &struct drm_panel_state, it should implement
+	 * this optional hook for printing additional driver specific state.
+	 * It can only be implemented together with @atomic_create_state.
+	 */
+	void (*atomic_print_state)(struct drm_printer *p,
+				   const struct drm_panel_state *state);
 };
 
 struct drm_panel_follower_funcs {

-- 
2.47.3

