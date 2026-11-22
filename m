Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364119;
	b=2kbXMpD2rff4IeMEf6+d8jnUVg8o+3Pc3wFzijZ1fyCpGeZSc6/Gf+gpAYUCdlgwlXhP
	 nt3RJEb52DR0BisuBQ7rAXUjftYTd/tHM6zmtRWAZ4gRUmgIToiEZdQfzmIqkfpJqHgoU
	 wc07dRdBBY4Q6aVmh9lWCzxrnuYqS20Xnx+mD+t61JU6faXnQbFKdjmmHo96aFMwLp8if
	 Z4NhZAKW+N99l6cy3gNnacoiBguGGK2nbgC/stfTy6yghAf9HInczA4erRGRgO3mhhheC
	 GKIWSl0AMxPEOXXNl9PNhYgwkGXzFo25pId16kwoptL4RyHG3rmVym/Atpy7LZlvFxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
	b=EFyBC0c5moM/KGi0IztAcZrVzf2z7CflrOD06wzBVOF2bMotfPJLEkiF23X9XAZVIOHu
	 ZnjVHLq4+09E/EGkBFMSsvWiQ2KxSxE5yOW9m0Mc3ZtwXoGk3DANGM9s6Ox+boFPmo48K
	 BMTovwR+F9m7N0TQonVMDlvgtQChWlDKK2ThqUUFH5iv3MYQ59UMXInJH0jnICRuoP3ks
	 aK/SJRDvQIgKbJG6D7sTQPZPZReINlhb2zmp8OS0MENSWuvGwWBA06gZo5+Bo+RFLx+GK
	 7TTda+jo0PcEKQChLfhsjKq+bgkeG84xWXU1RTTSuQNg5hcWTSqMjLl7FYrPZ20iJ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E7860A2621
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E7860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQObC279532
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OJ/t3yJRSO/
	I8Krm7cGvb9xURXfceDUgpjT74EYPghA=; b=mnr3WYf0RMNGwAS1YNEC2qcMZvo
	ddz23yc/mN33i1IAq9VcyeneKk6iYtaqJnOUdLuit7biAar9ZasMSpxBpW2pGokO
	0XG9aHzZwcLo0cJi7R6VschHqq0Jn1/GHYLOXqRNY1a6XTB4ia9EAso4YFmflJXa
	wlyrCnlZV8CWnjtPrmuS8mvcRL2Pxj8bS4BTUxsvDemaDSllCnkjQ3qOohqsLmXW
	anqnPAl6hs6vlClARhyPZemiCf17uaNlALmvAdndWoe0u9zJ7BWXWsSpIqR8bIdr
	Az8ZPnjXOtWayd6XXWh4v508JaKRajOatkt7reQBhVMex0F7N9EOT0S1KIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ktg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so435153185a.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364116; x=1795968916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=D3l2cn3LhL/fO+NgI2ydQfHPum2bBeFF6S6SzD0DuXBbPrrszCCsvWkJFEjiUjOxN1
         /+GUmZUO3UTcDYnQwkzweV5hcImxX+Et/zioQvouwnf/IkUdZQcccKkGfn6vPQ13SYMW
         S0YSlxSv4z39+8itLx6MPzmolh7b8XRRWb9Dbmiu2HjXZbdyb7t3MMzq+SuEWwId0hqk
         t00INT4qYNVbaZubFuiJprTpUgpZCarwiW4gPP88sj2OE/to/SU1B+42ma9iu+OyiblG
         4JStK4KTQooH/i5Y3O45OfJk+lx1D9PW6ink5BGI8+a77try5lSMYg+7DDT7+7NCp1cF
         aC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364116; x=1795968916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=2ySUOvoxWzVUC9SVhD1rrH/uNzFXal2uL7akLktRF/GydvsE9sFsBtiuN+Wk+Sgh+s
         ifu2sfOoYtU52sY7ueO6Pyki+yaNhSufHquReIQHk76w24T8TQXB0Xq8bD7XgjDdjYSB
         jouSvOa4c6Yks3OQmtoaTAfM8jOaotJt583Hy7wOoeBOjRiHeVrf6SHtf8MQhQ6QCUHm
         jJFmxSIn6nyXYxqFWabJnyXCt2PklaQ35Jp0DbFBDoC83QcP2WLq1Wqv1D2Qnjj0EGaf
         9U/8V/XY2SyOTlBwSGC71a4Or28byDxTGPlYN7nq13zJEXnuB/ikpLT7ypxyyHb3AecN
         TbwA==
X-Forwarded-Encrypted: i=1; AL+hErFt7NKnzWLFimF1c1Bc56ebTaSj/2bKc1QprAcd4BcOTJZ5irXKBl+4CuUt8m9kzR6wFT7eNb9QbJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I+0nMLRiD4wMlY5FWrjmBe126yay9iiIegs8bFGLeQ+6LRCKF
	lWOwK53UXprYjM9ULkcYpXo0tIJRqYgZ84vM2tZt5QjM8h6i8agI8/Ov+m6WSfQUvGcTiAHlHG+
	Y0YkELOUbynlqo1BduGBzIIwWhrlMUzAJVdfIED2wiVGtU3d9ha2+hPIPNT6+kxo=
X-Gm-Gg: AZFdTZftXTGJlw+X6BfahG5QaEZb0GL3NpFUHFtf3+I+p5Psm/DUEHQq2Za/mjSQ808
	RTg8BkytB9qvJ1GmVkcJPOt0yJgU8woYJtzgyeppL1shNOI5BScldHtQO8GKMibOE44ECaKU5bf
	D5UO5Rq2tOznleCBThC0Qt7ifiDMskQkQwd7bKCcf3Ml0FsqqN3HabBNhLiEFVRDKMABeSwW+zO
	gWmvWwynkQIArHerCuX5l4GzdHSYgRlb3LqYOMirrcU+3Az8n3PJJa1KeUjRpBLFvjHKSCRQwcX
	2tICNxxhKTpNNtNrtMrphbhFaSJXw0PxKiv4Z6nMkLdwCAppRNdD3HNAqb6YTrIkbRTbP156hD3
	iInXP95BheUMjMWdzgHSvpXvJ1GWlAJCMtk5/8PktzNWF83dS7s5nltb9sYSuoJvM
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506517385a.40.1795364115987;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506511485a.40.1795364115542;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
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
Subject: [PATCH v2 17/24] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Sun, 22 Nov 2026 16:14:30 +0000
Message-ID: <20261122161437.5994-18-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: UZm8edbKVVL6E0TvBJecbCdDQFzH-prB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2zbS50HrxhOZ
 FOkXK6xaL/gQQAo/jxmDdBdatDeObReyZzcCscfPBVS/gi39FXgNQ3we/tjCIoAXH/Y88BMX2p0
 kL+UL4oVxSY1e9yMIURx8hbZMUOvJa0=
X-Proofpoint-ORIG-GUID: UZm8edbKVVL6E0TvBJecbCdDQFzH-prB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7GHqF6rjTLbo
 2VCvEvuPkitIX0+ytnbKPaFeHsa3/CgVsWhneon1e/4K0zHInUd95vVU2C3mEcoHDky+VhOfPed
 n6p8SsKlWa7bihunypFpPrC7lGyNxiTgPWzzRRbwDttiJ7XlRTIS6jgO6Yg9cAlliZy1cU0PIEK
 GEl+NelKZiB8USmUpjE9Ef0XbiXCvLYUShifNa/S9hZt5lDjaRD/br3DtPmXjT0LLJf80p18dCL
 QPQo/pCKYH6v/fySpis/fNXKPhVS6njANHyf0yWhF8EHR3iEtPfVQhowTH6pZu6BruSCB++ecfR
 WwCS3zSxu4uDBPw4Yklb8zt5NBJkV0Uxrb0uDRUdl0egh8xdvTUCua2df29rOgFq4fKe2sXvmiz
 +vfZFvVbXH7UmZyrTNXnwDATukkhJSaTmyRjcDNkmvT8BazwdJtmY1IIWTJemOHOICSAVAFv4r5
 xBUxTDWZ377qOFwQ70Q==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b031515 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

With multi_direction_codecs the speaker protection VI subgraph is
opened with the playback stream's parameters, but the VI module and its
codec DMA source always run at 8 kHz and 32 bits.

Use those for the VI module and the codec DMA source in its subgraph,
and keep the channel count, which follows the number of speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 436d33ea568e..97d8585a287b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2084,12 +2084,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
 	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
 }
 
+static bool audioreach_sg_contains_sp_vi(const struct audioreach_sub_graph *sg)
+{
+	const struct audioreach_container *c;
+	const struct audioreach_module *m;
+
+	if (!sg)
+		return false;
+
+	list_for_each_entry(c, &sg->container_list, node)
+		list_for_each_entry(m, &c->modules_list, node)
+			if (m->module_id == MODULE_ID_SPEAKER_PROTECTION_VI)
+				return true;
+
+	return false;
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
 {
+	struct audioreach_module_config sp_vi_cfg;
 	int rc;
 
+	/* The VI module and its codec DMA source always run at 8 kHz, S32_LE */
+	if (module->module_id == MODULE_ID_SPEAKER_PROTECTION_VI ||
+	    (module->module_id == MODULE_ID_CODEC_DMA_SOURCE &&
+	     audioreach_sg_contains_sp_vi(module->container ?
+					  module->container->sub_graph : NULL))) {
+		sp_vi_cfg = *cfg;
+		sp_vi_cfg.sample_rate = 8000;
+		sp_vi_cfg.bit_width = 32;
+		sp_vi_cfg.bits_per_sample = 32;
+		cfg = &sp_vi_cfg;
+	}
+
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
 		rc = audioreach_module_enable(graph, module, true);
-- 
2.53.0

