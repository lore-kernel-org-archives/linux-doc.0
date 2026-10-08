Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7306C4A3D50
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465303; cv=none; b=pV36GxxQP3gTK8Ghd0At9G5iqi6phCvcE3XY94o6fONOX9JPbSF0/lHiSdUDGEwsv9Hb894aSVoBAR129PWU2XJGK2HHDlHe7XKPyOaASAwBON8wnANQQxK00FzE0X5HMg/PQyn4KP4tQKFrqUTvP/wYP1gkLSh/bU/00gc8Db4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465303; c=relaxed/simple;
	bh=C7K0x2PDL4mXbbpidAxqPo6vZ2ktQLhh/Ny8cKcMzuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpFQoG5FI3+SsxSLYVj4h7MO2Ag0AZNzl/vOC70d1fWNm6VbwN/h67rtHL79hjEvx5P7dtmXwIMswLuWLlWphwRhDNsiYB8TX3bTqnweKjPNFTUlihPc/s2/VScwi/m5j+xcUvFLotXwj5RIKFEHhCdrkSKfEkBQWPadtRawQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lm5FvxkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOuNJd3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lm5FvxkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOuNJd3d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKDL71269585
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 13:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULsdr9EtHW4nby9+oSfQABjhp0vJRi4rQqPanDn8yPA=; b=lm5FvxkOJ9ep9y/e
	ig/jtp5ufi7GdUDrew6o+i3AE4S9T7NUxk6TBrGxmaZa45CEHxjZy3a4LoGSO44n
	qaFQX8Mi5wnsDYqYSogpVLe/k0r29qCaawTxPqBf/7pOR42W0EJyCcWwRaZhyEVj
	wYaPHPAeTcR2s54iCgGOO9MIkAkvYJY7t+uZt/nlshpLebuu8VTCE9zePKn+oNL4
	uNfkzXDTAXi1Q8HTGUV5H+yfestm9gNYFLL0CEn7Y0aNA0mu3klN+aSmAPPa3kaW
	+OD0LZTtxZjQAxC2b7sfsJyFG9e5EGChaDma0H0t4NWReQ20qEhCCd6g6UYbfWUN
	cJLgLw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32xhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 13:14:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9195c59ac8cso130682336d6.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465297; x=1792070097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULsdr9EtHW4nby9+oSfQABjhp0vJRi4rQqPanDn8yPA=;
        b=HOuNJd3d1rv479u2ZJ+fBEF8ogkOFntgKMBlxKvaXSwZJGnt9+d4mY35IXvc1GRfDh
         Mupnlx+1C0/LqKMFF8JdMMt5oK2OlaJDK6TR5aKtDFrnPnwrIStzU9RpJEP8BXBceisl
         grM7xRsb0+/5U6qtpZYClAarIGgjmsK0p3c6WUcxBvMChDph/lUUcNJHGDpvtS7Pn0eu
         MYuIdA5kaKir1umUeVpIrENrQZb6bcLwiHiV1+T/654yEnoEr5Fg5ZlJnFCD1GZr9kYn
         sOAttsw9uwnrQ1r+EUdMAP0XjHMBj6AbVTWHyDNk5VhmHI09HFonXJqsbTHNRTrMFdRc
         a7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465297; x=1792070097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULsdr9EtHW4nby9+oSfQABjhp0vJRi4rQqPanDn8yPA=;
        b=YiI1NQ7y7RICFULGsMWUTPzcCZhyXz9qlRh7NPerqiWJyV7Z7B+6EyjcQ6iAmf3mPt
         pumFZuDEhbXLGps+OHEvmnT39bXkIpe0xwuof3yhkwoSXrl9sWlZfAsowKOpW/5hYffy
         K8KU5KJKMF28YM1n+BH2Z1h6RokS70qCzoWbVPvVaRB/jEHJwPg5w/cq5TiYkehZcYzX
         K2od7JbKGHtxAyLoM6GJOIrzIp71jA2c1Kj4sZTIpwmUza/4HzlqQaSdhvOoqd3kAJxU
         QZhCCIg6ECxNfh86fdFMbsU/OvwBL38waoZV5wQC3avUH/aoRMNsLRXVkScQUCj9fjEg
         2LEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIL2nPehBve0R+1WPWVWu/txznZ/0Oz4LND1p/8mF9diPHK3WZImN3F60at0Jw6ej+Pj4GOZNAFYk=@vger.kernel.org
X-Gm-Message-State: AFuF++lAIO461wjL2JE85P4YpH69N5r1wnYYHssRpt8oMR9KWAtnMAlE
	hugX8DB7YviJG6R5o7rH2HarZZwRmoFCz6dSuhYNiaUudm6iFoFEE9IfH+Qzyt97HaFRWPai9mc
	MaRRGmkrxrHIg7FCC01RHdNUO3Z/0RETbKq3LHyRuEOLzvaSW5AiEZwfTOTLEtauJ1UZQRraYKg
	==
X-Gm-Gg: AYBFou2ieeWr4cR4xJmyUAFHaudLpbAKINfYyyhr1f/WRl408PgohtFNuk9rzsoU9K9
	57gcYbD86yEmhHEIbZDkQT3Mk51vNfO3E53kQKYlQBm+/T59rl1QPOL0Za6LSmyzKv5xlEr+G9j
	V057uUvtm3FMF8uaGAMuHy35FtRqnTnA+5ZOVas+MFTZ3z5hq4IsjKv67Gqysx27vawZpQG/HE+
	hFQQ/4kyTFmBCBywXp802ok7vCwNLjr5xPI3Q9KL2wuQWw/O2t4y2X2zFJg2HrwIvJQKDFqsFN5
	HPErc72TLFhmhSLaQ2n/aiUV0OPX++g4fyRBqV4VlVoJccMJDkZztWC2jWVefO9kY6KfIpNP6wi
	bV3l5amwVBNvS03+4Gl6G3U089vs9NwSC/5Z4iHhqPIBD0ZWoa/v410SrzwmA6Gevi/XxdsKYVP
	os7AW8aJiHeifP
X-Received: by 2002:a05:6214:5d8b:b0:917:aad8:7e56 with SMTP id 6a1803df08f44-91997852d60mr99078626d6.35.1791465296840;
        Thu, 08 Oct 2026 06:14:56 -0700 (PDT)
X-Received: by 2002:a05:6214:5d8b:b0:917:aad8:7e56 with SMTP id 6a1803df08f44-91997852d60mr99077966d6.35.1791465296229;
        Thu, 08 Oct 2026 06:14:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:14:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:14:25 +0300
Subject: [PATCH RFC 3/9] drm/bridge: drop the bridge pointer from
 drm_bridge_state
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-panel-atomic-state-v1-3-b157fddb8de1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C7K0x2PDL4mXbbpidAxqPo6vZ2ktQLhh/Ny8cKcMzuE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqx5dG8pydL/rICq6oSSygX4yIznUj8DQFVHyS9
 5ymh0KSKsOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaseXRgAKCRCLPIo+Aiko
 1Qp0CACdcSztWd8DMlIRYIuRUMwhaj2vowoxVztZUpF2pNpOi1q3Ya9MpKntwa8MuRANIknXIfS
 LRbllo9IOl56qgLc0ImgqmCqFi0FtzOmIh6XlGLzjoYkRT086I2Sbu9n5sO/Of/Gart62PxsvTu
 KFK2+FXEOYZ2W34J8u/zohy8BsDsKcLnomu48P+x7Efd+m6hNuLZahrD7mR1gmBD8ArRWt7V9zi
 hQMY4AOmvTBinPF1n7CsEinGfvRg70cse9eXtn1Den7+aiMlszcOjLMd+AL1+dhOueZS9vUxlyn
 mtmd/IP4ABxDnB3EbMyk4xIysmEN95xpijUyFWn6vM6QfWH+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXxsWZnVRAX5/d
 kYmRUaxm5c0SHa3csQVZr6CtpLE+5pT6SXhcXa/+hMX5gj8tBzAPz758fP7ax1eo0Pw9y+euu82
 hPSe/xQfEzhFHvSFIR9sytorCweNDGkdAlbRCfiIxCz7P27/MOnry570nFHGVi6adKZgZ5DuwvU
 YJHE79JC/JtoTDLN5EfuYf9NWOKt0YYTiixXuN25cWxXC19LOZ5LFPCbdxGyumAj8gYuzF5gw8o
 DFBq9XPwqBatawPZjQtwS/xRonhf0nuXugMI3mh4UwRkv5wCELv/ULsHKe+INLnLvxTkxwAlLsA
 Tcre0maA0mEAfUfqJqnqQdsrvDoXtPnu3SWzFuQzh/A9xtqiC4d98gom5Th6JcnVfcWOiNnTErM
 vJcOw4e9jTbFBUVfCJlMRblVZK0666kPCChnPps2JWxybJos2D3+j9tBRrx7v2yTwdGfBzP3v9u
 Iy75S+ZYQy7v2RrVMKw==
X-Proofpoint-ORIG-GUID: m4FJF7XO-apF587EH5qU4bwvPjYjpRPg
X-Proofpoint-GUID: m4FJF7XO-apF587EH5qU4bwvPjYjpRPg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXzEZy0F9A+afO
 gAbE63UQS2LsRk2iKlhpHaDNaGtdUnO0dhOr4v/z16TSN+SY7MPbd95AyvVqqjJFA1IOKbGnuqe
 L8EQRjO8dj2+m2JraRGHpTFucIJlxkI=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac79752 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=IhB6q-WDNiCyW_00jvIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

struct drm_bridge_state carries a pointer to the bridge it belongs to.
It was needed when the bridge state was introduced, as the private
object state it is based on had no link to its object back then. Since
commit 97a1f01b3f2f ("drm/atomic: Add atomic_print_state to private
objects") struct drm_private_state has such a link, making the bridge
pointer redundant. Nothing reads it anymore, it is only kept up to date
by the state helpers.

Drop the pointer. The bridge can be obtained from the state with
drm_priv_to_bridge(state->base.obj).

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
 include/drm/drm_atomic.h                  | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 406157a3660f..f66937d7044e 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -759,7 +759,6 @@ void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
 {
 	__drm_atomic_helper_private_obj_duplicate_state(&bridge->base,
 							&state->base);
-	state->bridge = bridge;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_bridge_duplicate_state);
 
@@ -822,7 +821,6 @@ void __drm_atomic_helper_bridge_state_init(struct drm_bridge_state *state,
 					   struct drm_bridge *bridge)
 {
 	__drm_atomic_helper_private_obj_create_state(&bridge->base, &state->base);
-	state->bridge = bridge;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_bridge_state_init);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 3ae35b09c0cf..095b9db145b7 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1381,11 +1381,6 @@ struct drm_bridge_state {
 	 */
 	struct drm_private_state base;
 
-	/**
-	 * @bridge: the bridge this state refers to
-	 */
-	struct drm_bridge *bridge;
-
 	/**
 	 * @input_bus_cfg: input bus configuration
 	 */

-- 
2.47.3

