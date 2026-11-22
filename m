Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364111;
	b=P8CwfmMzL9kkylaTRu0n7q6QE2xG3ttS+RTNf+2npFtI9d/w2N29lJ6qj3juB/ckRxh3
	 Ucaw4Ce2ZZL8ybQj9JVrIdi0pijtE7034L/OTZ8x6vWDk4wUUoRGAdsA3zXEltUgrcbeN
	 d64ou/o+j/0kZ+WED2ifoF77hXC23qDQz1zfxeoCHFprObGiNBxoFkp288bA80QVxpV2W
	 153ZYwOT/4jNjS1yRlgnekn+wKh2UiO2/F1+gmr4ebqVq8T0BaMD7iSCtvhp6z1RTnFwH
	 /GenGbuCEtaCeIr+7cXJHLHeoDDX3O+BsNsfcCwx2UrvTLqHtYFCS+cXZyF6l44nSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5z4Ablit6pC23zEnkKYSCYAF5WTDtAoAJVgPlJ6vnXE=;
	b=U//70zmviXcJty+ZHdVp6djptfDnYwmkc35IAJLjCBFEI/eO0S/+mCg89HzcMQmywgn6
	 +/Upd1q/uyV3fA+rVxPIY5LMXiy9gCPqRY7JxiBu+FU3+Md1X+v+iCO1YlB6vN+HVqtsa
	 WLj6cLJJ3hzGrrDuh2G0Y1TqkSkEdr1hfq4YNDVvRMSEXIrKhS8gbwslDY8PbNLhCk/hb
	 h1Bk2bnCIBZ3n7oBa2sUaxuGdH7RmDLioKvZ6HSEBtn4Qhtbil5sbP9P2uW84/B17RIE8
	 lAlNrcEdFcFAxZJy5vCEbUWYup/8dg64Oj9VopxgRFPBAjwinpRzAhbuqlwGKht33Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fowX0o2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TGOqxT6h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E83E60A5BC8
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E83E60A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fowX0o2r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TGOqxT6h
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFR2o03853568
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5z4Ablit6pC
	23zEnkKYSCYAF5WTDtAoAJVgPlJ6vnXE=; b=fowX0o2rGlVMjMKHmvN5UUw0r7Q
	AAQZuMEqtX4lKSxaeheSbp40R8681kWFBiGPgxU8y2+gw3dyZ/L78fN4Aw8Yxs99
	yeoZkqbC06VLn7KOkOwF6ns3uqTkLw5RuZa704xT1yKj+xwlR9FtBgl5XN8wMKm0
	3yNdoWWO0O2pG9lmBbYUKRJ/YqLC2wWKaMgPy0ntvtxA3YuP6HBVafNTbhghDyYR
	/0l3em3bSd8MReRKc+0517hi8MdMDbYa+Xl3jLsbx+wP00rsvH0imSLqscRpgtpe
	zPilAnvmYPB7k+tPuqeHuNKVGNV6tKm9AJD/RClbu3CXxeFeQby9uvU49xQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3r1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94970ad532bso409357885a.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364109; x=1795968909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5z4Ablit6pC23zEnkKYSCYAF5WTDtAoAJVgPlJ6vnXE=;
        b=TGOqxT6h4s0gio684wAzeXjSQpFjLdY0FiJi/w95ZuNMuxh5U38lMm8U/OJUpVTmmy
         f/DVLy0pZSkLslnxvtQMwgt9/10wtmz2GzEvsMB0TwMrDNddHytlwbP4A7BdwhNYpLbS
         aU7iKpiFS9tkb/cLbzuEYf+YVoleIualiriM7/x8AxbyDU1VFi0H307FYgmUaFk5VA7j
         250Pp2w+51oFcAlSe55Nhh91lsjRZvgHv74DycWYh/9Bh5DYP07kISiptMvrnBw2vgaC
         1Jx0YbZsLmi7Qx2bqqCRqkSaa5NEWp3KMjgq2OyKxcCG4TTBJyp2iDgVDbdmtUwDfJAe
         uPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364109; x=1795968909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5z4Ablit6pC23zEnkKYSCYAF5WTDtAoAJVgPlJ6vnXE=;
        b=VRYR4bOPkwbtf+4q8RTBzgjyht+t1Ni23D+Q4AiNrIvsKE9SytDK9iRW0Y6/G/T/m2
         NjgeQf0EF2e3HHti7if/DeOUUXT6RpNdIondyzKsiC3HOdekza3uaiha1PZ23wu7w/04
         BWqn4/Qs/nouMS/widVE0X8b1jzO5bCpXu/422/R16TSxS6o0XfYcShFftb1wwHHo/ag
         nlzIvbV1TDSpKfeCjtZu4qNI3ZQKL3xq3rjVCbpKVQQnXpKm5k2+h4SgUjtZT/BxwkdU
         oFWEkAi0tStgCx/Rc3/5OF5vcB9Qeg3O6W1SnI3O9MtUHxitI0l3rySLuBXqlfPeF1JL
         zRuw==
X-Forwarded-Encrypted: i=1; AL+hErF43n3mRuUneCjeeGWhOLJoggH6c5K0L5TJnd5wg6i6PMSuh/DpYeUTIk1esknKpTbgPA89B4Z5evA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F70WWByqtyj8GjW9QssZ0B0LpLd220FoAd8OHndgxPYuq5DPi
	nSvIPQGChJMPIQkY866wu/vfCV5ZWCC2mbq0fv6YCstDDhURctsY0enJ7C/ke5AIPTrDEhZB63K
	0Ku+1A4ywTefNYchEm9FxESxcMGtk38h4jtRQoLPuWnyU8MbJd/QF9rTMcZZ1mnw=
X-Gm-Gg: AZFdTZcM+3M4wN9407Lij+a1kYV2nxMTffwE8KforCY07yCvQ6kZy34JAjuqstwUFl+
	9nN2e/Hzp6GazTOTkWFHONlJvtC3rDosuqdVtN2BbNAkRgqVXntan7QvvaBfByw8iTf5+kk+Knp
	eG6ngyOLBiQuWGIs7TcBsIGafxGzBz83PpGzdJuTn49xutfI3cAePF0bEIwRUC0ZufiN+wLEuJq
	Hkn93q3w/HUcLFXJ1uznxmRHtQ8msekNzl8Zu5ZzElQJKjyA2jMnt0kkGkmjop5Q6HnHryXeghE
	32sBdZlYSDg2+VpqSb4FAPVcKkbfYaYGj+d4MLJ/a0zD/l4Cp1kchngKGs/0wT2f329RJwEmdQx
	GR4A8JrxINRyaol0yjg7WyRW3jaMd02q1rGm2ILZtCdw65weMR9Hk3qGgYOikrPGA
X-Received: by 2002:a05:620a:4012:b0:945:fe1c:82b9 with SMTP id af79cd13be357-949baa0dc96mr1545919685a.46.1795364108601;
        Sun, 22 Nov 2026 08:15:08 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:945:fe1c:82b9 with SMTP id af79cd13be357-949baa0dc96mr1545911685a.46.1795364108051;
        Sun, 22 Nov 2026 08:15:08 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:07 -0800 (PST)
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
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 12/24] ASoC: qcom: audioreach: cache VI calibration results per speaker
Date: Sun, 22 Nov 2026 16:14:25 +0000
Message-ID: <20261122161437.5994-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9rM9aC0rIr3vY2T78_O2yk7oTHyYRLZc
X-Proofpoint-ORIG-GUID: 9rM9aC0rIr3vY2T78_O2yk7oTHyYRLZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX4n4dT41KFckk
 AsBLrtGBygEgbZb5Zo642N+1A9YQUs5PIMrIsP2jynBrjJI00/7rneL8oEuM9uj1CrYPNWZTY3P
 /ODAIsFiCX+40GRoDiGgrt8MMJwVJe+ZIoWAZji7IkeSHrujwI6JdZUNudG7h/PuDZ8jVER0PUs
 LG1e21+Xxf5TXOP3osHjxzzyT6ZiNH+fyfeZdtvMkrPgvPap2eE4EcwnK0wqfR9wdPB+Wrrnjr+
 M7DNJHt3wE/r1j/2F2i/zAzk2DmSlAwZ6aa5pOHu+vq5UAgcGvrGwUkfikuN/uuq+C6QKPqfnNv
 zcrXz5LuBbzgqxtYXa5yJuBkzgUOJelrJx+SALoqo2hHEqS3/rdUNb6ecSApIBPD1yMY7nQnt2w
 WuSvzq1FcA2WVc+FiTqt+1RU0Mglrf/6swgqIQIXuh/B0nZ4K6CinwIQxZUfAmrdBdBHHJCQH4Y
 9UZT0OXSshfx/9xlZww==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03150d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9ZV4jQrK44SIZejVWmoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5VUP3FYNwXXR
 R+8FChmFjjWvLAhWrNKgPXLQbcJ2rD/0VxEaxTPmgwgy5iUdFKGD/Cg3xZjAIGnpzjKbRMFgXhv
 kosDx0KASVFCj3S9wvUY3ALUhtBmWbA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI module reports EVENT_ID_VI_PER_SPKR_CALIBRATION every frame for
the whole run, which lets the earlier simple handler flood the log and
drop the measured resistance.

Keep a per-speaker cache (R0 and seen-states bitmap) protected by a
mutex, log each state once per speaker, and record the measured R0
once every speaker has reached a terminal state. Log R0 for a
successful speaker at info level and for a failed one as out of range.

The cache carries an explicit "armed" flag that is set at the start
of each configure of the VI module.  The first event of a run clears
the previous result, so a graph prepared and stopped before the DSP
reports -- for example a sound server probing the PCM after a
calibration -- does not wipe a successful result.  Turn the
pre-existing state names into an sp_vi_cali_state_name() helper and
add a Q24 formatter for the log output.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 134 +++++++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index fbb9e3c4b84a..2b5c083b8ae5 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2020, Linaro Limited
 
 #include <linux/kernel.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
 #include <sound/soc.h>
@@ -12,6 +13,25 @@
 #include "q6apm.h"
 #include "audioreach.h"
 
+enum sp_vi_cali_state {
+	SP_VI_CALI_IDLE,	/* Not calibrating */
+	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
+	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
+	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+};
+
+struct sp_vi_r0_result {
+	/* Set when a calibration run is armed, cleared when it ends */
+	bool armed;
+	enum sp_vi_cali_state state;
+	u32 num_ch;
+	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
+	u32 seen_states[MAX_SP_VI_SPEAKERS];
+};
+
+static struct sp_vi_r0_result sp_vi_r0;
+static DEFINE_MUTEX(sp_vi_r0_lock);
+
 /* SubGraph Config */
 struct apm_sub_graph_data {
 	struct apm_sub_graph_cfg sub_graph_cfg;
@@ -1462,16 +1482,112 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+static bool sp_vi_cali_state_is_failure(u32 state)
+{
+	return state == VI_CALIBRATION_STATE_FAILED ||
+	       state == VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT;
+}
+
+static bool sp_vi_cali_state_is_terminal(u32 state)
+{
+	return state == VI_CALIBRATION_STATE_SUCCESS ||
+	       sp_vi_cali_state_is_failure(state);
+}
+
+#define SP_VI_CALI_UNKNOWN_STATE_BIT	(VI_CALIBRATION_STATE_LOW_VI + 1)
+
+static const char *sp_vi_cali_state_name(u32 state)
+{
+	static const char * const names[] = {
+		[VI_CALIBRATION_STATE_INCORRECT_OP_MODE] = "not in calibration mode",
+		[VI_CALIBRATION_STATE_INACTIVE]		= "inactive",
+		[VI_CALIBRATION_STATE_WARMUP]		= "warming up",
+		[VI_CALIBRATION_STATE_INPROGRESS]	= "in progress",
+		[VI_CALIBRATION_STATE_SUCCESS]		= "success",
+		[VI_CALIBRATION_STATE_FAILED]		= "failed, R0/T0 out of range",
+		[VI_CALIBRATION_STATE_WAIT_FOR_VI]	= "waiting for V/I",
+		[VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT] = "failed, timed out waiting for V/I",
+		[VI_CALIBRATION_STATE_LOW_VI]		= "V/I level too low",
+	};
+
+	if (state >= ARRAY_SIZE(names) || !names[state])
+		return "unknown";
+
+	return names[state];
+}
+
+static int sp_vi_q24_to_int_frac(s32 val, int *frac)
+{
+	*frac = (int)(((s64)(val & 0xffffff) * 1000) >> 24);
+
+	return val >> 24;
+}
+
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch)
 {
+	bool decisive = true;
+	bool success = true;
 	unsigned int i;
+	u32 bit;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (!sp_vi_r0.armed)
+		return;
+
+	/* First event of this run: drop the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states))) {
+		sp_vi_r0.state = SP_VI_CALI_RUNNING;
+		sp_vi_r0.num_ch = 0;
+		memset(sp_vi_r0.r0_cali_q24, 0, sizeof(sp_vi_r0.r0_cali_q24));
+	}
+
+	for (i = 0; i < num_ch; i++) {
+		u32 state = cali->cali_param[i].state;
 
-	/* Raised every frame; keep the per-event log at debug level */
-	for (i = 0; i < num_ch; i++)
-		dev_dbg(dev, "VI calibration channel %u: state %u\n",
-			i, cali->cali_param[i].state);
+		if (sp_vi_cali_state_is_failure(state))
+			success = false;
+		else if (!sp_vi_cali_state_is_terminal(state))
+			decisive = false;
+
+		bit = BIT(min_t(u32, state, SP_VI_CALI_UNKNOWN_STATE_BIT));
+		if (!(sp_vi_r0.seen_states[i] & bit)) {
+			sp_vi_r0.seen_states[i] |= bit;
+			dev_info(dev, "VI calibration channel %u: %s\n",
+				 i, sp_vi_cali_state_name(state));
+		}
+	}
+
+	if (!decisive)
+		return;
+
+	sp_vi_r0.armed = false;
+	sp_vi_r0.state = success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
+	sp_vi_r0.num_ch = num_ch;
+
+	for (i = 0; i < num_ch; i++) {
+		int r0_int, r0_frac;
+
+		if (cali->cali_param[i].state == VI_CALIBRATION_STATE_FAILED) {
+			r0_int = sp_vi_q24_to_int_frac(cali->cali_param[i].r0_cali_q24,
+						       &r0_frac);
+			dev_warn(dev, "VI calibration channel %u: R0 %d.%03d ohms out of range\n",
+				 i, r0_int, r0_frac);
+			continue;
+		}
+		if (sp_vi_cali_state_is_failure(cali->cali_param[i].state))
+			continue;
+
+		sp_vi_r0.r0_cali_q24[i] = cali->cali_param[i].r0_cali_q24;
+
+		r0_int = sp_vi_q24_to_int_frac(sp_vi_r0.r0_cali_q24[i], &r0_frac);
+		dev_info(dev, "VI calibration channel %u: R0 %d.%03d ohms (Q24 %d)\n",
+			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
+	}
+
+	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
 }
 
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
@@ -1511,6 +1627,14 @@ static int audioreach_register_events(struct q6apm_graph *graph,
 	return rc;
 }
 
+static void audioreach_arm_vi_calibration(void)
+{
+	guard(mutex)(&sp_vi_r0_lock);
+
+	sp_vi_r0.armed = true;
+	memset(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states));
+}
+
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
@@ -1538,6 +1662,8 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 		return -EINVAL;
 	}
 
+	audioreach_arm_vi_calibration();
+
 	rc = audioreach_register_events(graph, module);
 	if (rc)
 		return rc;
-- 
2.53.0

