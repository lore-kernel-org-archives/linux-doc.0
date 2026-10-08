Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AF24A5C3F
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465312; cv=none; b=WL2FKYVWuMMA75kxtgURDYIjDoBwiWiofdQhDJFRJwwIALiLzXifKrH/CNKLKS5P0mGI+GJv4x3T3Khce+bs7dj/k4CRRRJ2ecxlalIMpc7ZPtj2+28WB+Y1n6JZ3e+WeqnCaxmXHFHd7vua0boypa4xo4izJWqDnGU4yrJMdw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465312; c=relaxed/simple;
	bh=WxoSDtesfPtJ1QyZHA2W6JfIGP8oLsOW8aCQdlTEVVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hs/VeWOiT1XmOZfIghwmOqXbPB2R+5TYX4JG6zj68ta+Clrlhm6Co3M1IjJ1w/wXFXI7S19b2Q+7pd6RGtzl76O4PxXo/fcTevuLwEM54KjS2GbRgsIL+7ezpK6Erl8PwxB6HQesI/dehPGkr6w3aI+kz96Xz5mKb4LT+YLSGcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5jFROzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hS6nCczb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5jFROzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hS6nCczb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKB9A1269545
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 13:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sL0PcIsuT2lGq78xVWRMAbUxXJs+OS2DfhPwb0cXcfU=; b=F5jFROztkE8lXSuV
	2tKioY6sv3yWPr4xawjqi5G8tkn/BcaZnunodzBMtvXo0//4RptuVj7KdJvboRkB
	oroqZLl7Jzz6QpdPD4ccJ6l+8/G16/y6LpScULhQyCJq2GA3x/L78eo4OA/ktDI0
	2tbuDdIi2UmpaB9vau9hu+jX0vFWvZDczXSxkFFiWJIiOgZ4j/kFphf88kDwLPe5
	rq2IIoer70ueNRYS8rvxC+E/gdbSWxm9PQZ7RXW9GW4EuwwG88BYfy4ui5upm/SI
	7uaQue3Mn0f+tqtAiWQP/Lbr3abF5ReKMumhLiV2bTrPnVBVzxeBdrIcNs7dHA+I
	XICRWA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32xj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 13:15:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf67e46ae0so1010957137.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465303; x=1792070103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sL0PcIsuT2lGq78xVWRMAbUxXJs+OS2DfhPwb0cXcfU=;
        b=hS6nCczb6UOiSqo2h6cz/MaTMLv/V6mpBY8/lJwvSx/1exVvh+OwCbwUaT8mFNx4vm
         o5Bmmck4JJjQG/cWwD7IKydBMIjo/TJsd5uVwRMiliru+eyoX7aUwkgFzUdeQ4fOpiRK
         9Keb7w6UqBj8c7A1h81I6MSrO6XOG+mcpQRpKkDAOLBfDR+Pff5K6+SZWmWkpPHsJHFW
         HTqVTercYOkqs7HkVtGrvx41XQHLLCIAGPswodJ3swjduepYqhAiauC7NCHz2/y2FtJh
         a5IGBD6kIaxccKDigf5WNA8+K7NRHAOw3hz0VB9dYSQiavw//39WOqjGAq31svneK/u5
         ONjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465303; x=1792070103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sL0PcIsuT2lGq78xVWRMAbUxXJs+OS2DfhPwb0cXcfU=;
        b=rbSuGgV1FMqtNMzwu5jUHg/ttloX6LxolJdBEvFelhzguOnDBQltOT2tsywz/Af2tb
         aQdgMeIrTFD5rNylOfQjttmyyEjFu47J8uwNGZWEIFRLcoF5lLSXQYVLamRbthaAuMiO
         3RNWLAtykCJQ/+OpIh1JXpKc/vzQPqcQcb8TqQSd7yFNgZpAX136kVCXxGrflmKUqH5Q
         jR+f/lm1URhzHdkfUivA6EG9MDOk07haC1S+1KqIg9f+OEkkdQPmB+XZ0Sk45TfPk5lD
         MDzI1CfMdk7tim8lTn8SrUbF2wMGDILlx3Fe43cv/FWu+P1Vua02ZuM7Yx9v0fTjiivS
         763g==
X-Forwarded-Encrypted: i=1; AKwUvBydM4uaB7NSbqHLD2Z1raOGV1J7wFQh//8lfNQEfpngiST7SXH61cI7Ea9c6Al9BEMQR08JIJtEpVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKGd0IvQpW6uUDH3kApkWw/v6VOwyUnTUZ71fnS+uQb65+MeMJ
	KcQbiPVkvA9q4vY8NvbhaTRnQAIWIA7OnFllu5LJdSzHiHZiokRBff4K5AhKlnc0jmiRc2NPjq6
	ouEuuopeqatj8KBH508IMKYKBeJtlzk5deBj4N0qLLHXBmNOW8PLTFiU3FSE2pIAg9ErfUuJ3Nw
	==
X-Gm-Gg: AYBFou1YEZKv3d7b7ElMX9C2YAgELYkLzFBIxcCf4jvpLdCpkQtlxBnqc0OIumCEn/1
	rWLWgJttpRvWE6DERmOMy+eK9a1UF2gLtyrbM1mae5NTV/iyx+rk4/wGjpB33tpR6jT7/faBZH6
	hs5mFIqr33ddrwW7ul/fnwNVS+lPHl8ahYo/wXZPciPixzo8xrCtudGzdFfQbuHLzOpLm5yhYBM
	bubdgACnx4ueau+RYk4fYHgXHcJHHfBoe9ur/xDQalfcCfH8TMXw0Nvb8qqV0yiNvm4lAvVZ9jd
	iF5uGlG5qUwi2fyw4olLuJxzjhVLddQ2hLfCR3s4TI2W6/9jwIIxdag4/AZ1cBKf/acH27PO+3C
	1h3PmiylvQAdwA0LhiVcvC5J3PJk8wVqwSjPxVRr+rMFyX5ZR8XWL8WLn3nB6K9MjbacS6q+BSk
	8NPgvZ884m94al
X-Received: by 2002:a05:6102:dd1:b0:7c3:a6f0:99cb with SMTP id ada2fe7eead31-7ca38e1cb0bmr1393313137.33.1791465303291;
        Thu, 08 Oct 2026 06:15:03 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7c3:a6f0:99cb with SMTP id ada2fe7eead31-7ca38e1cb0bmr1393305137.33.1791465302799;
        Thu, 08 Oct 2026 06:15:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:15:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:14:28 +0300
Subject: [PATCH RFC 6/9] drm/panel: factor out the panel follower
 notifications
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-panel-atomic-state-v1-6-b157fddb8de1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5677;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WxoSDtesfPtJ1QyZHA2W6JfIGP8oLsOW8aCQdlTEVVM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqx5dGHeavSd/b4PpeyyXfUxEH1TIPxnfEh8B3G
 VlH8VwWUlqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaseXRgAKCRCLPIo+Aiko
 1WQ/B/0XM7HDpkJyCpbbBkf0e+jtRpKLvvFTv2bgnNgaj+DL5d/xqkhHfRb03L1mnZa22eK2LHb
 zpSXB8z6AAB/fPeolS2dv4ODFVAZBkaNRUalcHaVeyhDaqGuclgsMMLr8+PdRSL8w584jMdiiuO
 NzG/AJ6J07spCeaxZRXjlmtq8VaO/msGBK847NySXBrzOZVD7asb4OSV8hGf5YIOFImMpnUss3Z
 FPuYpd31xz/p3qcQjTdOLuW1PX79ySHamQ5Ro+f12Ctgj2WB0VSzo3gxPAuiUFg5yfaobmVDeQu
 J+TkjdEFVjMqzrLw5Ccha29LTTjMlN8EdMn+S1VcA2GoHWvV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXz0Ii1E9pm4Pc
 K/yP+daytIpsrvEeVo+e8Hmju2S8eKkp5TgQnfVUIw5pEDNIaOGBzzn6X7tpSut5IeXo5Ez2P88
 8roM3XdsaLbwrV9X+rWFPW7cpe9YgbaXrTyUJsnPnaC2zSGQWIa/60vtVR09Q+daV8Kd/kak9L7
 Y+1/l/s5bf3Lzz8/hxpk7EVJU1Ye8CGsJNNKbumoJgk47KhctpG68dIIlzwDYA19KCr6j+Hau72
 +bczjaCT9DxDp+eJcab15cpGIyTcR5xH9r+hQgdt5Yu12SmkrStfpvkvaG5z73iLZLJiYGhcyZO
 SF8XFdzL/g3dGcA9svdGbYNs0FVkqbcOQVHvQvfaGE/Fgf40c6wyThe67WZr7K024J6n2HMICVN
 CYXDRSHT7iaYPTtheUtw2VO6Fn0f7fM+gAOOXFvwt4tjysY37FAGC/8NzDDA4UbrNlgM6z9gFy4
 AzZimPuCJeMPu+SXM8Q==
X-Proofpoint-ORIG-GUID: J-0Ez6koskSaI2gyzdlCHBXfYUOwHrdG
X-Proofpoint-GUID: J-0Ez6koskSaI2gyzdlCHBXfYUOwHrdG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXweOATZXTZzBf
 dJFZzc6/SmYK20slUsTcAgSCwwvsEQ0co8S8tniVa8+45rGt+QJRB8qNi5LFnrHfxOdkB8X5KlM
 CNdOJAeQ5cL795NPeX0Y4NmssS/50bE=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac79758 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ehp3mkkGfunlVMu3AX4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

drm_panel_prepare(), drm_panel_unprepare(), drm_panel_enable() and
drm_panel_disable() each open-code the loop notifying the panel
followers. The atomic variants of these functions are going to need the
same notifications, which would duplicate each of the loops.

Move the loops to helpers. No functional change.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 116 +++++++++++++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 3a154be128a0..ed0d16e04eae 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -84,6 +84,78 @@ struct panel_bridge {
 	u32 connector_type;
 };
 
+static void drm_panel_followers_prepared(struct drm_panel *panel)
+{
+	struct drm_panel_follower *follower;
+	int ret;
+
+	lockdep_assert_held(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_prepared)
+			continue;
+
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+}
+
+static void drm_panel_followers_unpreparing(struct drm_panel *panel)
+{
+	struct drm_panel_follower *follower;
+	int ret;
+
+	lockdep_assert_held(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_unpreparing)
+			continue;
+
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+}
+
+static void drm_panel_followers_enabled(struct drm_panel *panel)
+{
+	struct drm_panel_follower *follower;
+	int ret;
+
+	lockdep_assert_held(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_enabled)
+			continue;
+
+		ret = follower->funcs->panel_enabled(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_enabled, ret);
+	}
+}
+
+static void drm_panel_followers_disabling(struct drm_panel *panel)
+{
+	struct drm_panel_follower *follower;
+	int ret;
+
+	lockdep_assert_held(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_disabling)
+			continue;
+
+		ret = follower->funcs->panel_disabling(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_disabling, ret);
+	}
+}
+
 static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_panel *panel = drm_connector_to_panel(connector);
@@ -758,7 +830,6 @@ EXPORT_SYMBOL(devm_drm_panel_add);
  */
 void drm_panel_prepare(struct drm_panel *panel)
 {
-	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -782,15 +853,7 @@ void drm_panel_prepare(struct drm_panel *panel)
 	}
 	panel->prepared = true;
 
-	list_for_each_entry(follower, &panel->followers, list) {
-		if (!follower->funcs->panel_prepared)
-			continue;
-
-		ret = follower->funcs->panel_prepared(follower);
-		if (ret < 0)
-			dev_info(panel->dev, "%ps failed: %d\n",
-				 follower->funcs->panel_prepared, ret);
-	}
+	drm_panel_followers_prepared(panel);
 
 exit:
 	mutex_unlock(&panel->follower_lock);
@@ -811,7 +874,6 @@ EXPORT_SYMBOL(drm_panel_prepare);
  */
 void drm_panel_unprepare(struct drm_panel *panel)
 {
-	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -837,15 +899,7 @@ void drm_panel_unprepare(struct drm_panel *panel)
 
 	mutex_lock(&panel->follower_lock);
 
-	list_for_each_entry(follower, &panel->followers, list) {
-		if (!follower->funcs->panel_unpreparing)
-			continue;
-
-		ret = follower->funcs->panel_unpreparing(follower);
-		if (ret < 0)
-			dev_info(panel->dev, "%ps failed: %d\n",
-				 follower->funcs->panel_unpreparing, ret);
-	}
+	drm_panel_followers_unpreparing(panel);
 
 	if (panel->funcs && panel->funcs->unprepare) {
 		ret = panel->funcs->unprepare(panel);
@@ -874,7 +928,6 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 void drm_panel_enable(struct drm_panel *panel)
 {
-	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -903,15 +956,7 @@ void drm_panel_enable(struct drm_panel *panel)
 		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
 			     ret);
 
-	list_for_each_entry(follower, &panel->followers, list) {
-		if (!follower->funcs->panel_enabled)
-			continue;
-
-		ret = follower->funcs->panel_enabled(follower);
-		if (ret < 0)
-			dev_info(panel->dev, "%ps failed: %d\n",
-				 follower->funcs->panel_enabled, ret);
-	}
+	drm_panel_followers_enabled(panel);
 
 exit:
 	mutex_unlock(&panel->follower_lock);
@@ -931,7 +976,6 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 void drm_panel_disable(struct drm_panel *panel)
 {
-	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -957,15 +1001,7 @@ void drm_panel_disable(struct drm_panel *panel)
 
 	mutex_lock(&panel->follower_lock);
 
-	list_for_each_entry(follower, &panel->followers, list) {
-		if (!follower->funcs->panel_disabling)
-			continue;
-
-		ret = follower->funcs->panel_disabling(follower);
-		if (ret < 0)
-			dev_info(panel->dev, "%ps failed: %d\n",
-				 follower->funcs->panel_disabling, ret);
-	}
+	drm_panel_followers_disabling(panel);
 
 	ret = backlight_disable(panel->backlight);
 	if (ret < 0)

-- 
2.47.3

