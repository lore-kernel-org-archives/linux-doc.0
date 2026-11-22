Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364121;
	b=Lvcx/LYVfivW8FMFfObj57ru4hYSD5riojPwI0oI/VNQR3VOXtITyv70i/6Nsdd4FCRF
	 Lc+N7fddmBBaLGt0AsryiQcUBxkT0IZ/yWkEm6RHKL/EvBXglhAmysN41ZWnuN2o1iQ/G
	 er65wBufSZlLNvuVi/x+0VhnJ8A7JwBzQMqnWolXTwmqXvtPo2wetJELE7LuJ/vDe5ujq
	 NdbC3DY5oxqSRlLCAaNPHQb+Vz2gYalZXQiwM/oVmvb5V79lm/VzhWbL+dD7GfWj/y44K
	 Ric4YFK7zHGui7ZEoa2a1LpR/4i1nTFox/ZvZNnwN9S+z5pJeB4kfB7pAzL+KYmdq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
	b=cplVDrHXk7X5KE1F4qi8Cn6T9TVS0KLAiD3d2xPC7eqrbEEG6zTi4H5tFgRRIquZZfbR
	 UOOEhHcWPo0ti3svSbXTyF2eIfCX3+Qyeh975C5F4EVzI3/+F6N/nC+8JkHiFdRUr5sCa
	 cea3qnpkOW1ex0/hPNH6zmNGV33Z97YE/RVlFIQVjmFwP9ccozJAa/fjFfcLTuUHZr2kP
	 0n6U1mfO6M4x6I0CASMpe8tChlWyqMcYpCTS+2s/NRaMwrTFf39lhLkRehObPns4cA1wn
	 OB1QZloxBvf7Tlu35QeHvIkgrASQG0ugLorG28hjtTYrV2b3QTI2MRvCIi9+YEZS53w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XN3pzoI9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B25LNiG2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0495606B8D4
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0495606B8D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XN3pzoI9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B25LNiG2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQpp51248396
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iysdng1dCLf
	+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=; b=XN3pzoI9g3MzpnwybLHow8JiTte
	/qGsd9azDNcxVyNUWXgVxCRTRtWI94bFsgXFy6JGZTbQ58pR5+ku1OAMQYxttu6g
	tW7/CBws1aImrd0rp+J69hRW/POPgmG2IQzlLXuPQzpTLW4uNx1IDVImDo/WaFtQ
	/FaMXCOLgjusZhngutkNgEsN2PKkjFfKNeLvRHaCoNKPXgth6KFxbBJf9vtMzVyD
	XZt96YmWf//gaZV5dczYojjBIbdybMmCWKrUj4L+p9WvgM5VDJTwlXd747HdsNMl
	OmQ13e2reVxU+/2AWFywSyQdXRbNj0FiXTCMJNV30208p7hSBVBOjcTVPtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so404377885a.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364119; x=1795968919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
        b=B25LNiG2sg0/nIlv+40CfRZXIHSowjgCAJYtyw4wiu74yymO/oMFGZBndfrjfRLdly
         reaSh2r7DLfC6vJsMo8MuC5egxZ5bput6pj7b2QlC9Jup77lZt0h0hCf+OVs/N8h8n9j
         ulUo9HXfC0gNs8xddloPSZJEURzrKiB9ZJ9WXUtu7Kv9Rl+AOWHMYijWR+8cUNLeDFaj
         shubxX83ywjoUs0sfJK2kHzu3wGLBdM7VT6r2mVXA90/1T+iOoqu43ILdbLejmGBDft7
         TLMk1xzISSkR5kXe2I2hxRjhWtY/RjGVnRZpxlSMWNneNQBIgS+x/l0ulrnamW/uIlMC
         i81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364119; x=1795968919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
        b=op8MZ5yx/4jiZSNekTRF+moCeecA21HIiNBtxBhPAuM2j4dHnI+Y460aU5WNAZm/Cp
         mh7qNLw3ojQHRA18V/t3SDye7ZFgMSttSk45RSiFRG/aCpclaPpYuVk+rszzAyQyCk+4
         frKgMr1GFxN5IZl2ucS7NszP/YoeeiFF14K3E6TDgaHbXXxmDPd3B7YOxs/06pDpOag0
         0QBdO7C2BjnuYFYFfexa9hWPrkwyB86WoC9ZXGOzusQ5FkDuyNeAolQovOnD1JLfsmiz
         HcVqtfOuL4D1o/lIqlnd/Zx+tMfCxe/B8AlmHEyFe4XYoQMqz7aB4CddayKhP6vJa+gm
         qrCw==
X-Forwarded-Encrypted: i=1; AL+hErEBDPXkoZ4FWIQu2Z4/d8fK/IUx2QctVx7KWXDaIDHRoX/mx6pTJRhDcF9dzWtDMrfuHGWJ7dr912U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1q8jlEivsnFFPasDizhMDFJmj0HyHva8G/JrpisWKCdG7UFua
	ud2EY98HxQfY39NTkMt10+Fciucrd+rOmx+b5fCYf6/zx2EhsuNddX91UQHZfeLFMBY+kc+tmed
	LMzTl5NuN1L3IMedD0f3ujbLzBDdX0MIAcu2l60e8BLL7uedR7hhsIsqZhn5To7w=
X-Gm-Gg: AZFdTZcE/twllIIelc6Xs66pC3w2RjUOmsIcePyeGCNZoV3CwbQlV4Kb5N76XEG+F+E
	72wsJf0m5zlkGeSVvQ6vWkHaHELAU4bpN0+RhvUp7//Yy8U0U9uT2fdcHjja+x33AsqPJkM+mWr
	uo91cIhsiVJpgjlPdA5b/lJWi40mrAPJpkxjdqXPt4ftwIMGAWVGey0p/iG0IQBT1a5x6dqrkBq
	/h15v91eOFOExfjOpV5uKwrcX078WLLBUkelMFBBP7necDD8NVd2J1508NqeXLOEm+Me8F6XFfG
	qhR9Q6iIECNwtjWfqa+xrFYwQcxrMO9+TvihFzZ6h+/kgohozsp4qUbG4jnDOFD9hFT5U97pWbl
	4Q1sgA5lYHrZbv4XL2ZSP5oxvWnyf+HsAXtWZ5CAeyf44o3tYU+o82ypb4PrMfXjp
X-Received: by 2002:a05:620a:6481:b0:93e:592d:f5a2 with SMTP id af79cd13be357-949ba823313mr1496326685a.11.1795364119075;
        Sun, 22 Nov 2026 08:15:19 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:93e:592d:f5a2 with SMTP id af79cd13be357-949ba823313mr1496320485a.11.1795364118528;
        Sun, 22 Nov 2026 08:15:18 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:17 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 19/24] ASoC: qcom: audioreach: add speaker protection calibration state control
Date: Sun, 22 Nov 2026 16:14:32 +0000
Message-ID: <20261122161437.5994-20-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXzH+Hg95X7Wrr
 6QuugURHSx/cfp3u9x35eKt2ZlBNA9vGlDExwrxz5jNQ3s5nJfAtM5n3GCjuGcTK9Uvm6pLIFqf
 fqzcujAqxdW1qIwSiy45hgK3oO3c59QKENC0JWKq8kOLIGPhjpruJFeGji1Puw2REifWmsRVNUJ
 P3wFT1ayZMV5k2YvyuDC5Ko0E7MjALvWenGi7FnU8IMbXTSLnk6qFH3o3fnT1OvSvZiBDHB2tim
 Ulh+1zFnTZeqbqzN4G9FTIAzioMLQSMEBejnzshp+YqgLEIAbQ00+fDg1vHNQE6suBYfKlLl7gG
 TA4y7xZAi89W9F7tjQtXM6IzdO3ZwfC85snH1UlzrlCC+qHJuQE0XWKEdt75sX+cwVOiCTpGizb
 zs/Dd3G3qLEoiuJWDkao271XnvB65Akyc2PeficXlE9CJARGEH2l26+46knwafD7zkEp23WJB0L
 S+ejDI/7tt/Ps10GBZw==
X-Proofpoint-ORIG-GUID: p0ekwuMTuS3IltfmBioWqYyp-E8-tois
X-Proofpoint-GUID: p0ekwuMTuS3IltfmBioWqYyp-E8-tois
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5O9GSSJT2Hgt
 MRGhlnOEeVZkM2VbHKZ2VzxwcfqGd8DUtfTnj0EFGzohZa19l5OQBvNuQkA4od/TPOOakjfKHgZ
 o2vdg1uRzuWCRfjMGtPIXqP2bNd/EJ4=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b031517 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=w_sgUqFDBmVKUPfu87UA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add a read-only "Speaker Protection Calibration State" control with
each speaker's last calibration state, so userspace can follow a run.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 60 +++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  2 +
 sound/soc/qcom/qdsp6/q6apm.c      | 15 +++++++-
 sound/soc/qcom/qdsp6/topology.c   | 63 +++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2bb56933b9de..f1e454062ece 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -22,6 +22,7 @@ enum sp_vi_cali_state {
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
 	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
 	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+	SP_VI_CALI_ABORTED,	/* Graph stopped before the run finished */
 };
 
 struct sp_vi_r0_result {
@@ -31,6 +32,8 @@ struct sp_vi_r0_result {
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
 	u32 seen_states[MAX_SP_VI_SPEAKERS];
+	/* Last calibration state per speaker (enum vi_calibration_state) */
+	u32 last_state[MAX_SP_VI_SPEAKERS];
 };
 
 static struct sp_vi_r0_result sp_vi_r0;
@@ -1657,6 +1660,21 @@ int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
 }
 EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_t0);
 
+/* Latest calibration state per speaker, 0 before any event */
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	count = min(count, MAX_SP_VI_SPEAKERS);
+	for (i = 0; i < count; i++)
+		vals[i] = sp_vi_r0.last_state[i];
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_cal_state);
+
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
 {
 	struct sp_vi_r0t0_cfg new = {};
@@ -1743,6 +1761,8 @@ void audioreach_vi_calibration_event(struct device *dev,
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
+		sp_vi_r0.last_state[i] = state;
+
 		if (sp_vi_cali_state_is_failure(state))
 			success = false;
 		else if (!sp_vi_cali_state_is_terminal(state))
@@ -1805,6 +1825,46 @@ void audioreach_vi_calibration_event(struct device *dev,
 	audioreach_sp_finish_calibration();
 }
 
+/* A run cut short never reports a final state, close it out */
+void audioreach_vi_calibration_abort(struct device *dev)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (!sp_vi_r0.armed)
+		return;
+
+	sp_vi_r0.armed = false;
+
+	/* The DSP never reported on this run: keep the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
+		return;
+
+	sp_vi_r0.state = SP_VI_CALI_ABORTED;
+
+	for (i = 0; i < MAX_SP_VI_SPEAKERS; i++) {
+		u32 state = sp_vi_r0.last_state[i];
+
+		/* Slot never reported: not part of this run */
+		if (!sp_vi_r0.seen_states[i])
+			continue;
+
+		if (sp_vi_cali_state_is_terminal(state))
+			continue;
+
+		dev_info(dev, "VI calibration channel %u: aborted while %s\n",
+			 i, sp_vi_cali_state_name(state));
+		sp_vi_r0.last_state[i] = VI_CALIBRATION_STATE_INACTIVE;
+	}
+
+	dev_info(dev, "VI calibration aborted: graph stopped before the DSP finished\n");
+
+	/* Edge-triggered: the mode auto-returns to Normal on abort too. */
+	audioreach_sp_finish_calibration();
+}
+EXPORT_SYMBOL_GPL(audioreach_vi_calibration_abort);
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module)
 {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index fb3f2f61e2b1..4db93c7f8829 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1141,10 +1141,12 @@ int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int
 int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
 				       unsigned int num);
 int audioreach_get_sp_vi_t0(long *vals, unsigned int count);
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count);
 int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
+void audioreach_vi_calibration_abort(struct device *dev);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index c410e2f6e6a3..35daf763287c 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -815,10 +815,19 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_open);
 
+static void q6apm_graph_abort_vi_calibration(struct q6apm_graph *graph)
+{
+	if (q6apm_find_module_by_mid(graph, MODULE_ID_SPEAKER_PROTECTION_VI))
+		audioreach_vi_calibration_abort(graph->dev);
+}
+
 int q6apm_graph_close(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
 
+	/* Covers a graph closed without ever being started, e.g. on prepare failure */
+	q6apm_graph_abort_vi_calibration(graph);
+
 	graph->ar_graph = NULL;
 	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
 	gpr_free_port(graph->port);
@@ -854,6 +863,7 @@ EXPORT_SYMBOL_GPL(q6apm_graph_start);
 int q6apm_graph_stop(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
+	int ret;
 
 	if (ar_graph->start_count == 0)
 		return 0;
@@ -861,7 +871,10 @@ int q6apm_graph_stop(struct q6apm_graph *graph)
 	if (--ar_graph->start_count > 0)
 		return 0;
 
-	return audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	q6apm_graph_abort_vi_calibration(graph);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_stop);
 
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 0e28c68c735d..a19efbb889a8 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1548,6 +1548,45 @@ static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int audioreach_get_sp_cal_state(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_cal_state(ucontrol->value.integer.value,
+				       MAX_SP_VI_SPEAKERS);
+
+	return 0;
+}
+
+static int audioreach_info_sp_calibrate(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+
+	return 0;
+}
+
+static int audioreach_get_sp_calibrate(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	/* Trigger reads back as 0 so alsactl restore of a stored value is
+	 * a no-op; writing 1 arms a single calibration run.
+	 */
+	ucontrol->value.integer.value[0] = 0;
+	return 0;
+}
+
+static int audioreach_put_sp_calibrate(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	if (!ucontrol->value.integer.value[0])
+		return 0;
+
+	return audioreach_trigger_sp_calibration() ? : 1;
+}
+
 static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 	{
 		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
@@ -1557,6 +1596,30 @@ static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 		.info	= audioreach_info_sp_t0,
 		.get	= audioreach_get_sp_t0,
 	},
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection Calibration State",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		/* Last calibration state per speaker (enum vi_calibration_state) */
+		.info	= audioreach_info_sp_t0,
+		.get	= audioreach_get_sp_cal_state,
+	},
+	{
+		/*
+		 * Write-only edge trigger.  Writing 1 arms a calibration run
+		 * for the next (or current) WSA playback graph; the mode
+		 * returns to Normal on its own once the DSP reports terminal
+		 * state, on graph abort, or on the watchdog timeout.
+		 */
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection Calibrate",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info	= audioreach_info_sp_calibrate,
+		.get	= audioreach_get_sp_calibrate,
+		.put	= audioreach_put_sp_calibrate,
+	},
 };
 
 /* Kept apart from the topology SP controls, so FEs have them without it */
-- 
2.53.0

