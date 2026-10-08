Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43EF30F927
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465294; cv=none; b=B8piZ1FCNCuAxC7AcyFUNV4Uay7awuycbfQBO/4wousT3S5WqxDglN4nHwC0Y+pKgXdML5PJwovOHrnZ62e9MVd9oFhFF4Rdn5/eKuaxjkS8AQ2WveNAcOVlmKs390bn0YcOY0wMZXEbqJrdebXxpOpch0cpkQZh09CJELXRFuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465294; c=relaxed/simple;
	bh=+9FF7vQ8/k7WpN8Vr6N/Heg8/vdlCSMy+u+GgLfq6Do=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oKXR32qV18B2sgXfpxhQnlrkurLzBHnvvMyElSmJKoFygsh4rzgKPzC2YMUPM1igkZbDx0uF+KbNrW4vrGT53/AYLR3P5Cat2qJSAPbGfFg1EdbCDoFqReSOWYeopAm9rpJ7Y0vb5ibbxCeEHvop2gRlTV1EI7Ju41khkTHTFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fF8nR+ND; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tzq0+AwA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fF8nR+ND";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tzq0+AwA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK7j12705076
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 13:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qXqSGRfxaKF+/oxVxM0Vor
	cAg5N4cAG4clbEEnHeqGI=; b=fF8nR+NDoM8035uniiYL2ifzgwXLtPwGJHCmGK
	M3zOO8UdIUVXAGLzAxVxeImR7riEaqTkSCKEfdJZrvsyqao8Zob8GwVla84Q8Kf9
	zwU/WGXcail2rG3V70iax4qksomUv+HgnTXc9+MK6f3lxKr/83tvuAk9oMh7OE3i
	GRUkUDHbMC2gYYst10XDEhkA9WE062YyH8oIdfX1t1qWdXXBe1Un9KSBzifFiunp
	+RGvtkaqkAZ2pLdW/R9BVqFql/1VNgxcqzFNWtv5vALfVMkJn7tVPd7doCxHLi/I
	BZwFrt0o22sGH2GdCJtCgFiIE1mHVsMkuTbmhBzfErpTnF2A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2u45q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 13:14:50 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988c7363ee1so4165685241.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465290; x=1792070090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qXqSGRfxaKF+/oxVxM0VorcAg5N4cAG4clbEEnHeqGI=;
        b=Tzq0+AwAFMq6Ny169OFrCnG+TffyqNN0uUl6uxgY3Qnswu10TVriu9y9tX3TiBEuZ4
         7V6QlcqJO/A41iITW7k3TKBBomIc4HXcG2OPtrceGMCBeLYmnuo5ECcDIKYLp4WxLS3M
         PSmLA/WzVByPADZXf4Sl9CZVeQWZgvVlhU3y64+ahvdnTls1VNACh+KOz03ZhmkvUFiS
         x42Pu7eB1KlehPWR+hwDFtX/hHPed6IxbXH9Kja9GlLi8PGjnOtvoQhZhG247V+AWqEr
         TAxL7VmtZOb9Yyqn0gXUHUkdDuk0YaQ1aZD4vqqzD2BaNkE/cuyaHe6HR7jXjgHtQYAt
         3gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465290; x=1792070090;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qXqSGRfxaKF+/oxVxM0VorcAg5N4cAG4clbEEnHeqGI=;
        b=KICDDE3m7hnNBl+3Jw47/N/2p62LsgMlx3hQoghiqOtW+KD19KZlIWf8FadBR9v/E7
         q7l299Fo4S9+4547POUf+BtALM6OBZLCOrA564hcL90H1pfQcqDmrSXTYDP13JPu9hAl
         N7vCar52L7bJsYQeSgCnCsGFL4hIc4q0UhnqXTqrR/YZ1tqy1PtBw2IAh396IOL78zr1
         nKco28IvZslS0ScTqTPEAkV7DL5jpecY99toKTk9FKtdRIqKypO5i790XBUTChQWlvOW
         NykFUXYVAveOEDM0tcWSVbi9BLJeFYdRgJDOJkp5o88VAE21zrz4FflBPjSjCJBruzSd
         8FUw==
X-Forwarded-Encrypted: i=1; AKwUvBzIOOJbkSk86WFPAlrpCjMr3OasvK7WklgSUvXTExhQkuYZGJ+SvZBue2Zc9u/6X3nw/tIIwTtBy1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZBcsQbF5khxlu3I+OCy4f9dcSF1WWFCPHwFPz3Ty7Xvq9Dq1O
	5sGIHusEv94CupsKDPT3SgbYppo5g0PaXBU7SJP5zqYBoTy64rwTyobfBk7AYGw3SzTb7D/MmEl
	CQ8rVL7/iJqF1ewdVH95mdk+pzb0ZnWuFjashrrw7z8tsS1vXRaCp37uXYm6NOgNYymfSUCSX5A
	==
X-Gm-Gg: AYBFou2Ja4HoCec7RHovn0DN8Fc93p8oci1cU19rNlQA5vO+kcCQshjcprtx9RGvkuu
	ekMBiUsRuX1cPYr0KDq9KsQY0PLQxyUNuyUfdq4hBrkaYnlEgcwuCryWnlnkVkVIRLv+HdrYNt0
	gWM1WRcdaPJNUrtQugCT4bkixSYdgO8WNtL0ydlzxcpHpcilcBU9DDSQ4Af2Ix7oZbtIBU2LUnX
	UcLLdMGXLDbZuQjBcyPB6NCPZbwV8d/pEGh48KcPR2TY7iZ86qZkX/B/6rDKL3RntOpA075Sg90
	X/Ynj97OB3IJbsXubfuIBBafe/u5r2A0dudm8WQB3VHE7frZZQ5Q1tpjbX9zJTMmM4ERqwXbU43
	m/RWNDBBmkQiry3nGzhmumeobDu23HvwBTiABcnJoZ7eFPDkGckINrN1vSnwKWCBd99V4uSCVwI
	tlHky+jD5lOk2n
X-Received: by 2002:a05:6102:449b:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7ca38b3a689mr1858077137.16.1791465289742;
        Thu, 08 Oct 2026 06:14:49 -0700 (PDT)
X-Received: by 2002:a05:6102:449b:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7ca38b3a689mr1858067137.16.1791465289234;
        Thu, 08 Oct 2026 06:14:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:14:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RFC 0/9] drm/panel: add atomic state
Date: Thu, 08 Oct 2026 16:14:22 +0300
Message-Id: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC6Xx2oC/yWMQQrCMBAAv1L27MK2JFq9Cn2AV/GwxlVXNC3Zt
 AilfzfqcQZmZjBJKga7aoYkk5r2sUC9qiDcOd4E9VIYGmrWNdEGB47yRM79SwNa5ixIfutabsl
 556GEQ5Krvn/TIxy6PZz+0sbzQ0L+7mBZPrVJPLJ7AAAA
X-Change-ID: 20261007-panel-atomic-state-05948a804545
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3151;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+9FF7vQ8/k7WpN8Vr6N/Heg8/vdlCSMy+u+GgLfq6Do=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqx5dF4UdXo7V22tCGOX65pJsz5XA0Ma19w2j0z
 bYsIstcPuKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaseXRQAKCRCLPIo+Aiko
 1TgwB/9RkkrfScNezYEAkSOlYYjBKqowE+7a94RCyLegifNZfNP3c2tBHmDyKx0NPlP5ClZV5Gg
 vax5fGlFIv2QGJmMjznP88eo/x/PuFnrOk8/KM+Pd3bA4tC7LodhfzrQ5PcqnBI/cNL/XelnAP8
 kj7POirDs9ZzLwyWL2st6GAvzrX/qINFqIwnmNGn98zY6uaOhmWz/wR4pU2O9+kww6BYByzw6/k
 mov0nrzSS8nLnsovjI9h2ZU5vsxEBRvsqW0OtEHfLmM9ansNyPrrqQa4SoZ+rquRqCVI7ofqZi9
 CcGahd42swBx5ZUgMY8GU36+X58tQcPYH6tloHx72mZO1Y/p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac7974a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VBylRfG56Bf4BZPIeVQA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: AGSMSI54TNcs051HGWNX3BY8KgaK2x9O
X-Proofpoint-ORIG-GUID: AGSMSI54TNcs051HGWNX3BY8KgaK2x9O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXzKM8PuHNsiXt
 +3rsLm7xyNiYrK44cMCufw37I265EW0i89w+Ecw4msZJNfIrnGB9tJbr/Os77Zisemxh+5dKv4Q
 23IwomRz4yolU+zP7jbRUJgXEgQ15qY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX9svIAJPQiU1g
 Epico9aq0/qpDZDXHNA21BHYdxKNTfeWGh14Uks9Fiffn6kdNcV7BKvSrROTjUHiHpEg3VIMqcc
 AX+8zHd0kQroRmKGrN1ef7DMobQkPP8oEzuxYR4eQBTT37RTOMkWL9KdVFqOjykIo+XT4HJdOPC
 XvLNSm4UZHhJPyOXFV6bsUuog+J7oLq97569mYreOsT0c6Kmz5YR87r5C3ouSCNxKQEXmvlQoEW
 IbuzIX0PViBXty6HWAKoo+kQW5LWn5uAgDMRfZquwERRyCZ3U88VQFOyDyLWKjQWhWqP1Vz4Uaz
 X83ALSZ1QB4Uti0roowTg3Lljl8NWKSmJkek0+nQ0hCwLrF0aK5B1l6xyXSGgmvzL3ESupgxep4
 6uksQbJCXEM/FXhbJZSk30XP46e2kDxjThmIbn0n6yv+U3ZAmOY7SmNoBsjczlDAoN0nQRYrSCQ
 49nLqraUNSTcCNwNxkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

Panel drivers don't have an atomic state and so they can't handle
additional data to be stored at the atomic_check time or to be retrieved
at the enable/disable time. For example, it prevents panel drivers from
supporting multiple display modes or making DSC being optional in a
clean way. Drivers like panel-novatek-nt35950, save the connector
pointer in get_modes() and later dereference
connector->state->crtc->state from prepare() without holding any locks.
The panels also have no way to reject the configuration they cann't
handle, as it doesn't take part in the atomic check.

The panel already embeds a drm_bridge, and the bridge has an atomic
state which is property handled. Subclass it to provide atomic state for
the panels. The callbacks can find the state of the other related
objects (e.g. CRTC state to get the display mode).

The atomic state is opt-in. A panel that doesn't implement the state
callbacks keeps working exactly as before, with the plain bridge state,
so there is no need to touch the existing drivers. The panels which do
implement them can only be driven through the embedded bridge, since
there is no commit to hand over when the host calls drm_panel_prepare()
and friends directly. Those entry points warn and refuse to handle such
panels. There are still a dozen of display drivers calling these
functions, and the panels used with them can not be converted until the
hosts are switched to the panel bridge.

The previous attempt by Val Packett <val@packett.cool> ([1]), but it had
issues with the API design, passing NULL for the state. This approach
follows closer the path that was chosen for drm_bridge conversion.

The series is marked as RFC as it is only compiled-tested only.

[1] https://lore.kernel.org/r/20260425001130.233935-1-val@packett.cool/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      drm/bridge: terminate the lines of the bridge state dump
      drm/bridge: add atomic_print_state callback
      drm/bridge: drop the bridge pointer from drm_bridge_state
      drm/panel: add atomic state
      drm/panel: add atomic_check callback
      drm/panel: factor out the panel follower notifications
      drm/panel: add atomic variants of the enable and disable callbacks
      drm/panel: add atomic_print_state callback
      drm/panel: novatek-nt35950: use the atomic state to select the mode

 Documentation/gpu/drm-kms-helpers.rst         |   3 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   2 -
 drivers/gpu/drm/drm_bridge.c                  |  15 +-
 drivers/gpu/drm/drm_panel.c                   | 634 ++++++++++++++++++++++++--
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 159 +++++--
 include/drm/drm_atomic.h                      |   5 -
 include/drm/drm_bridge.h                      |   9 +
 include/drm/drm_panel.h                       | 190 ++++++++
 8 files changed, 915 insertions(+), 102 deletions(-)
---
base-commit: 5d7b464a4f517d1db533b1b231f42ddcf4e1dff4
change-id: 20261007-panel-atomic-state-05948a804545

Best regards,
--  
With best wishes
Dmitry

