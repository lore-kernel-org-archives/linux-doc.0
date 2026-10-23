Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775903;
	b=JAcflA+QUVYMdaqRfu+wY0u0GSjthuQj4ID4qx1ePq1WYiV4PqUfSKRX2AVqBBbGd/Vj
	 hqGmNyvZVDMZijLyC1hQiWDpyP3alFWmqN5baO/v3hBwp6nApwKhde7Chr+EfdIZvrGCd
	 zNt5tij5IaacFstV9vewxaB89n7x2GBry4mf6uUrm+rD0Zx5cSXhEYziCp6KhXz7T7pPa
	 vcQjippO37eo23zg93O2vd6Gn/hFcQIKaMVQX8WsnCXZ8gawiKOsc5HyV/f5w02Vl9tTv
	 4kozef6VUSxfbVb9JbJMiUQrAAh1Ms6i9x4ycTUSehy/JNnKxyJa2j55Q+kbtcx/nmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
	b=OTj0jEoW5tz4sJIMspkxBzolJhdHZlblUNfnzO7OwslS7Y6VTM+3r2/wlN2X0+zhiqB8
	 0+aeUqeUUeVkz1+/h9Ns7g2s/dyKUu9vSGHbCmpaL10kqFq5j4kWxLTXALOt6OiGg0Y6J
	 InAYtOAcC1Hwonim8WM5ATE3Txkqz/kvP4PLhSDXKeA6Ut9uH66BujpUm1cNixjaftFnG
	 ZBvVPKwYiaB3ZpL+Y5uN5njKQOqCWzO1HrEkULuN8yM7jUkkkNFyjOZKwkXx+OLLm7/it
	 lclH3kuQcClFYU7HfNVE3/+DOysgG6S/rb4u5gaO/0OrOYYXyyIVipMIkezYNfZxeVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6599660A263B
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6599660A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE66Wi3018954
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M9b4xWrqlE0
	Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=; b=N7asCZYZQ/M79q0CDhsr6wTFxhv
	5sGz/fRJYD/XXFByGPOAcdh+zXgky2vNSK2rm3lRpd7pYj2ExswyOEA2f8R3C2XK
	+hTA/KAgPw2FJJpGe5yG4wBXWXP36bpn6cWbwiLQdmENul+wLYUoY555IG1nL4Bb
	HKMLAkPXc5Ev9C3UvoN4yjuZHy6jD4T6aR9DpKPT7YOXd8STzrxSHtxiMOvUn2ru
	1cNrs6UU9RXb7rTRMZna+CUlDhWy6A0Zy3+MSBDZ+UxF6nlcnwt8pCHOMT3i0AQ/
	i1vgalvn3sc3Xkc9hbzUyxAyc/xhAz6HJqMXQxXxHD8+FijP1GNpw2bXXuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykc5yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so203792885a.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775902; x=1793380702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=aoY4qbfuWYIAR8W9rBEtMQzfYepdax1UjkB4LVKkV5tzbmhf0kf+H/Uw3vshdnHMXC
         KvhCrG7XyBaDdYOK4z582xswZn7GcU/h+cGUcNVMDTXm8JHFisv9cIZVk7Y+elhzpgGW
         L43SIbkWwz5Sw37NQp3t/figIeyOfCZcxOxn0rLoYCZ5n4x6QcbjRZtNeWtJYIBZrU+9
         zPqabqsfv1wiqiLbKeZtkOqpe3qrOdaTPFoeaQFBKv1mCAquJHLHgZMdziN3pj+bCiC8
         lI8KX642n29RVhDfk7O7fw4CN40kMN8LRZH/LPbyuKaq/+zNTGHnTMn9etno0WY850mk
         qemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775902; x=1793380702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=J4+uwHeZp0g2Kf7GNGAiom/aBO1Dr4LC8wkixUG3uO38NU/xeu3t+LCQXeIeSoSFmX
         82PzflVNsLOwKkED/de+TISFmjF4H+m9AXNKBeO72iltDJ1oE3mYqBzdNJZEgGhR2Bvs
         XFi+1oBrcPADMtAZwdyYZCJw4NVwOyrxOqoV49h9+9iKbTvSuwJD7kf+wHfrSFYd+Hnx
         kl8OvCzVmCkYtb4AbGjn+Sd2G0vibq8SoBsIGH2X3QFftjNtqy4uAVmZXjLtxFZ6A0C/
         h62+kMeuAk3K2awNR2RhjLyV74Jyvw1d7hOZoyVA+q8tqp24/sKML+JEqFZK3XVZOZ2R
         49WA==
X-Forwarded-Encrypted: i=1; AKwUvBzF9sbIqrSToqrV/Dbj1JSIyz5oVdauq9qUHISvjTBjZuxG1idTEOAEGs93r5N/FwSdgMN6B5L8lTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrUQ/9PGUnqcg2d2ACh3gfwsLDinjBLg0o4U8K17XkOAzljGcQ
	Qdburs2LDti+BTKWlQxgjui7GMU7F3MOP0XHTXyZFazNhCJdCYVOt0AyVSuTj4uEM15Tbud3CKs
	pggXGlpDkIOb2QjJpy4K68NMcPOcqzHxN9j798zEE082McGWDn/ZVf0796xHbvzY=
X-Gm-Gg: AYBFou2zMvw6gWVPxqUEtPH5Zm4+pOebmofXZosy50u6Otmvbiygu/gCZtD8DmYqxfp
	2S8CM3/t3os3j5pJUlPNTqF7Dw1V4P6M4CO/yZPWYUirnUsLU+Zqqojo6m7XthlnpQK0mh09yat
	ciAXdIfrb5DDkAvGt7wBA+0/aOHQZDg8jUQEZzmy37XzjQ1l4gRwl3xBHH5YnCjA7CU9Wkk571B
	L8ZA1clxW4FJVY3426vzTqF3y3mXV6n46AVIoOGv3pz2Kx4nmi1k5oaxX6RhUrrDGCgJPdM+KcL
	xTbvfh41F+rub8fhgQ6iesTvk20D7tQvPOAT4ddpbaSDWGWJ4cUG6bnOItqW9Zg2v/MbPTuqIIp
	MTvgqopv5l2j9
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922232285a.23.1792775901754;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922228285a.23.1792775901279;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 19/23] ASoC: qcom: audioreach: keep the last VI calibration result until the DSP reports
Date: Fri, 23 Oct 2026 18:14:29 +0100
Message-ID: <20261023171433.820092-20-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXxVdBRUMaCNLN
 FoYhrTcKfAxkt3hkATvOqkVN8pMqySwkQg3Tcg6vDjyOgP/Kj2Y5ZihlOJP9sIP6h6QTlhtwWVB
 eTCQtNFLwP+C1WOhAB19dG5Kq4cI5sYtOjEf00Fi5lDC/2vK/BuKI1G+0+cx35v1Y7ykMYYjPfv
 UivraQLby9W98KleG3GHUb1DiwFocBhTOS4UQUoU48Y9MxnJewvRgLZ3ORlQc8gwVn90jlwKvJn
 mDM+nZe+SLcC2iUM1LYyZ6sMMDQ3wkvqAHoeSzZG8Jpwn0gbvbeAYZp2pD8KdcVdByraNVA6jEQ
 0bsxCPHO37aTv/7iEsl9BKnjVdnaO9e8bPLcF3dv3mqZvPggxT9m7KkWukLLfTY8Gdqu9ZLH1yT
 EH1sgJQNkY2b1uW5yUWxNlJ1chzwIV8LaoWJe7UK6ItjS5eEPrsZh49hxdpwVRE/Qt1otFpDOfy
 wES2DZj59m6tj2KGSVA==
X-Proofpoint-ORIG-GUID: AsiryztdXuvkZ-vVsZsL_-NOMYVcm1PW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4zqlAKKgersq
 DFKxSKEldqscDn5gsDv6e0QRIkp2LWPVzsi+EX5+0xtPa6hjohRdhdbdmHsZYJthhHc+a1N1Isz
 AuhFBrwQB5YH1Q0R03Uo47GUeRkZsFQ=
X-Proofpoint-GUID: AsiryztdXuvkZ-vVsZsL_-NOMYVcm1PW
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb96de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IK27QhZfs67nWGHMqAUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Preparing a VI graph in calibration mode cleared the previous result
straight away. A graph prepared and stopped before the DSP reports, for
example by a sound server probing the PCM after a calibration, wiped a
successful result.

Only mark the run pending when arming, and drop the previous result
when the first event of the new run arrives.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3eba0a9a0372..e996be54c42e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -25,6 +25,8 @@ enum sp_vi_cali_state {
 };
 
 struct sp_vi_r0_result {
+	/* Set when a calibration run is armed, cleared when it ends */
+	bool armed;
 	enum sp_vi_cali_state state;
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
@@ -1707,9 +1709,16 @@ void audioreach_vi_calibration_event(struct device *dev,
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
 		return;
 
+	/* First event of this run: drop the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states))) {
+		sp_vi_r0.state = SP_VI_CALI_RUNNING;
+		sp_vi_r0.num_ch = 0;
+		memset(sp_vi_r0.r0_cali_q24, 0, sizeof(sp_vi_r0.r0_cali_q24));
+	}
+
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
@@ -1731,6 +1740,7 @@ void audioreach_vi_calibration_event(struct device *dev,
 	if (!decisive)
 		return;
 
+	sp_vi_r0.armed = false;
 	sp_vi_r0.state = success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
 	sp_vi_r0.num_ch = num_ch;
 
@@ -1780,7 +1790,13 @@ void audioreach_vi_calibration_abort(struct device *dev)
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
+		return;
+
+	sp_vi_r0.armed = false;
+
+	/* The DSP never reported on this run: keep the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
 		return;
 
 	sp_vi_r0.state = SP_VI_CALI_ABORTED;
@@ -1844,9 +1860,8 @@ static void audioreach_arm_vi_calibration(void)
 {
 	guard(mutex)(&sp_vi_r0_lock);
 
-	sp_vi_r0 = (struct sp_vi_r0_result){
-		.state = SP_VI_CALI_RUNNING,
-	};
+	sp_vi_r0.armed = true;
+	memset(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states));
 }
 
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
-- 
2.47.3

