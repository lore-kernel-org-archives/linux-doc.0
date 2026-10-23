Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775888;
	b=OjBgCg7tsnoM6K+d3Zfu2/nSGo27OE4mRJpO99qequ5vDnOnZbJ1hrm/QIgGvaGClldW
	 1WCiw8wACsiJq2KPgBlBuTbrKHEgCe2qwXtpif+LGKCPWbiakXpJI5jO34Ius5cFC+nVK
	 mATIsod8cNS/BKKyj956nIAx+C7CmDdOs2u4ujDtEB1yc/GXkpO94NFhy5PPZnod2fpAJ
	 qgnLLl+Nnr4XdxWF97lTkzeOUXngimfVJys4mnXvnPz+sXoC4FcBsMdTtkcoACAJaGVqD
	 MVxtPsQ1xJ6MBSlNi0PWSrkmuOXHXyx7Xjko/BC9Bkzczz2O7gYrZXzOWnoLHCHMvBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZMEl1ZvfXo6Wbrob9hc0DbCtcYILed43sPXM8KrPWi8=;
	b=fLEY0l+yqjrJgB1BzTc8tMnqPwUsZA+R28VNMAPAu1YL4Wsq/Jq4bv7lAxrl9maZRg97
	 sM7J8npE1Eytr8bGBBQbQq4FC4pUSim/1y1lhmC7ogzMGyRD8xvTUJnRGrLhCbRYsOBn4
	 d3oCmoTAmCzrP+MlGfboJbK+xCQn1X6V0U1K6ASbnfvhcBM10qw1rH5QxxbenBZsEIbzB
	 afx9hCnFb5aVztLIIyeTv4Uxs1glJmpdO6EmRxjI7vk76TREiu+YQvF4WaD9UDTI5w0Gt
	 hNqgGKFx1qzFAuE9QHBtWht6foK67PZdc2rSQqy3pEPF49MyZc9gn3FxsN0/s1OfSyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGJfnuK8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4P8uJHb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F4460A5BFC
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F4460A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGJfnuK8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4P8uJHb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE67xN3019023
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZMEl1ZvfXo6
	Wbrob9hc0DbCtcYILed43sPXM8KrPWi8=; b=YGJfnuK8lbXkG3AECT9VuaOHy4j
	vRZPDzh4J/M0b3ToazSyEwNOhZnUwz6BGEhBLPr3UpBVtXsz8mIDg74NZbnVLo2K
	gXuoNsANsSWfyJ1uuqsW4k7km950MyxrBXg9yNI/N4jPbdv2jD+lL5pVrxDazkuE
	OqjSaHp5v5OLsm532Nzid0hDHb7BACq+inG7OL2lQozhdBATd9MLEwOUDZSg0gcp
	QkpPI0bzyP9EY7l97TljeB4PfmVPiUDjdeIvmU+cVO+0/++Gj+lX4e7Cw8mhuxjZ
	paoMyWpgmtqzFZOvjFrRh17u6sqJEQAeiqt0SsjjcUgl2K1QpQUWcHhc0bA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykc5w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so187987085a.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775882; x=1793380682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMEl1ZvfXo6Wbrob9hc0DbCtcYILed43sPXM8KrPWi8=;
        b=P4P8uJHbfGjw5/oVvHRIbPk+AarZWY1rb/gTKZleI+/1yBgInrpJZG65HWKHyH2Gd/
         1hx5Lesi4wu5AX/IhPOl0qVjONSLQxOXMafdZ4d+ciBczHR14b5dHWbEgB20KM1CW7D3
         s9BSU2pDiKWN+quTJiVYTYXvjZlBtb3LjN/AGTif/jHwvFQE+FT5aytNgpAbcJFyFDWo
         0wyq2ALUPYwsmViMlPTJYDzJDLqmqAk4s6dZFoisn2ujx8Q16Rz4gxvKE+CzkaP4Y98/
         c/V33S6wQTOiOh0UGJTFspVAWzpcAvUYQiPAoUWi8tbb9QVEgBAYPv1f0NM3FkMQ6UyS
         UJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775882; x=1793380682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMEl1ZvfXo6Wbrob9hc0DbCtcYILed43sPXM8KrPWi8=;
        b=uXTAQWFssqGRxLxEW+i3Zarh9Gt2l2XqDX0UOiK93H/N79piHB6cv3Q6EiT8A+/F71
         PG+udQfb/8xsfqT7GSQmrTf5yPKJHMsTuYsGkjYZV7+Gl3jPuWEN8Fm63DpkX1hBPI/G
         8v57EmNdsgC5ROBkjNMsjP8/Qdc0UMWMzJfp2AAHPc77Z41c+Kkt2Hr9mH+QUaXRLeG2
         4/23JRiQf32VtOJdDVwqq2TFyxpoNe3EaLtNmQddTxOHTOcnN6RIwF0dyhwuxBxEKKzF
         BF9StUk/De5Q7A6vXA+QYYP1WBa/WS5AKFHUxBJErmZBNUBm/QWYZWasl9PIniRS1ydG
         vqpA==
X-Forwarded-Encrypted: i=1; AKwUvBznRaoaTCLTjet/JWitF1qTv+qaosj+ipWtvdjDM5O9wKiRNxX2v5T74K206XQfI8wuLw0q7Gbmqm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2yzuFTcxeqZV7hLMsQzZz8+qaG5AY9mZoF+adeiziS8DhHrTE
	Q/aqMxultJYxdk675sEyFin7rcmtH5+f8iIz7iRJzCx2O5LDZSCVIh9G9VkzPLK0OtEU5zpIzo2
	ys3UkvAHoj32CyPZjcmR3GzorYUUDRX+M5L4DFpwIPZUKtAmWPxq7TbNHVkTjVNg=
X-Gm-Gg: AYBFou0ppj8Fs3zV9sE25EBpjyI8hND27yVSufDImrjBhPVyDbwJn4fLcqeNJFR8qzH
	BbMc1f84QU9WFyU4ShreVXT9iaYD+t5lwImUCNTfyjx+IB7lBYwfVXtf0uz+rqZTs3fYfxqugxh
	i5CFBfnX6dyIWWL+E8sBCj96GSWHFOPeowbIpN8H8oMYtQkKHGWtdo1jVpPKqNBPX2oLeIOqj2V
	mkaKvqI5o+sAYLYtPfbH8250XHDU1Gxxc/6Gx9Z0TIxUVM33U0eJkGpT0umGSV9PeDhgQOMMy3i
	0vaj3XXT3xsbvn4+StFHKfyxElJomAhQBQqRk0iHPjFp5ocQnRupkrIwOnCaxtoFxDxhGzgUftp
	1OgbgN6sZLk7V
X-Received: by 2002:a05:620a:690e:b0:93e:c12c:43f7 with SMTP id af79cd13be357-93f6f86e1c5mr485471685a.68.1792775881781;
        Fri, 23 Oct 2026 10:18:01 -0700 (PDT)
X-Received: by 2002:a05:620a:690e:b0:93e:c12c:43f7 with SMTP id af79cd13be357-93f6f86e1c5mr485452785a.68.1792775879329;
        Fri, 23 Oct 2026 10:17:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:58 -0700 (PDT)
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
Subject: [RFC PATCH 07/23] ASoC: qcom: audioreach: add control link support to graphs
Date: Fri, 23 Oct 2026 18:14:17 +0100
Message-ID: <20261023171433.820092-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2zRbIE+XdzA8
 8yFBNXrGoWH5muW0OJx+tAFnpyq/NCDkDpJ9r7Lbj4fndomOExoMIiCzBCcumyJqg8LTkH6Ejq1
 RBqxfjpEYJ/Kirr3AzOE/NJybvxV8+1/pnGtgLl1gSbyIPwpWVsPRgfX2t5e0AkHfraqU5WeflX
 xyLWZtoN9Gi1XmzhHxw4jPO2HMI7DX/ykAy4PRjO+Qa/0LFCFLhd+Qg3XSOAfhFZlDaBTej8MHp
 Qqp9wi47F3OCYgOBwcS2oE65At2Lb0Njx1pJEU/N37oOo6sJ9ZvjEn/J8jth3+IKbh82qyF3JBX
 Jv13+C4To+inIkbF9Q/QtIXa9/PxW/qNMVR2lkMD3P+Fj4xcTdSsKh87aT2EOsNO1dnKrr5KZqs
 H7W8ZB6nHW0xS+H22yhMvxoEZ87zmSOZ1JKbNckUVokjjYqz2MkfV9MV9Yo1DeMZHiD14NWBI0B
 IpLKcPRw4hHiDEfz4WQ==
X-Proofpoint-ORIG-GUID: _XKou4DwZz2j133kKKFNWrii6-XPwL71
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzFaLdfl3WJaI
 jniMxZQw7hALeW/tmQTX7FTJnHA8T762kHchZZoBnY4N2EwjZYWTXy3wtJlM9miE8qdXQNCQXXJ
 66qJYRF94drfMEWaI+fFaoRTa167q0E=
X-Proofpoint-GUID: _XKou4DwZz2j133kKKFNWrii6-XPwL71
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb96ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8-O9kgZlvKaYWh8tphcA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

The speaker protection modules exchange calibration state over a
control link, which the topology describes but the driver never sends
to the DSP.

Parse the control link tokens into a per-subgraph list and add them to
GRAPH_OPEN. Both subgraphs of a link usually declare it and the DSP
rejects a duplicate, so send each pair once.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  11 +++
 sound/soc/qcom/qdsp6/audioreach.c  |  90 +++++++++++++++++--
 sound/soc/qcom/qdsp6/audioreach.h  |  18 ++++
 sound/soc/qcom/qdsp6/q6apm.c       |   1 +
 sound/soc/qcom/qdsp6/q6apm.h       |   1 +
 sound/soc/qcom/qdsp6/topology.c    | 134 +++++++++++++++++++++++++++++
 6 files changed, 250 insertions(+), 5 deletions(-)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index cf8ab6b85e34..7ab8e11ca5c2 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -234,6 +234,17 @@ enum ar_event_types {
 #define AR_TKN_U32_SUB_GRAPH_DIRECTION		4
 #define AR_TKN_U32_SUB_GRAPH_SCENARIO_ID	5
 
+/* Control Link Tokens */
+#define AR_TKN_U32_CONTROL_LINK_IID		50
+#define AR_TKN_U32_CONTROL_LINK_PEER1_MOD_IID	51
+#define AR_TKN_U32_CONTROL_LINK_PEER1_MOD_PORT_ID	52
+#define AR_TKN_U32_CONTROL_LINK_PEER2_MOD_IID	53
+#define AR_TKN_U32_CONTROL_LINK_PEER2_MOD_PORT_ID	54
+#define AR_TKN_U32_CONTROL_LINK_INTENT0		55
+#define AR_TKN_U32_CONTROL_LINK_INTENT1		56
+#define AR_TKN_U32_CONTROL_LINK_INTENT2		57
+#define AR_TKN_U32_CONTROL_LINK_INTENT3		58
+
 /* Container Tokens */
 #define AR_TKN_U32_CONTAINER_INSTANCE_ID	100
 #define AR_TKN_U32_CONTAINER_CAPABILITY_ID	101
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..9e45634cafbc 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -109,6 +109,26 @@ struct apm_mod_conn_list_params {
 
 #define APM_MOD_CONN_PSIZE(p, n) ALIGN(struct_size(p, conn_obj, n), 8)
 
+/* Control Links */
+struct apm_control_link_obj {
+	u32 peer1_mod_inst_id;
+	u32 peer1_mod_port_id;
+	u32 peer2_mod_inst_id;
+	u32 peer2_mod_port_id;
+	u32 num_props;
+	struct apm_prop_data intent_data;
+	u32 num_intents;
+	u32 intent_id_list[MAX_INTENTS];
+} __packed;
+
+struct apm_mod_control_links_params {
+	struct apm_module_param_data param_data;
+	u32 num_ctrl_link_cfg;
+	struct apm_control_link_obj link_obj[];
+} __packed;
+
+#define APM_MOD_CTRL_LINK_PSIZE(p, n) ALIGN(struct_size(p, link_obj, n), 8)
+
 struct apm_graph_open_params {
 	struct apm_cmd_header *cmd_header;
 	struct apm_sub_graph_params *sg_data;
@@ -116,6 +136,7 @@ struct apm_graph_open_params {
 	struct apm_module_list_params *mod_list_data;
 	struct apm_prop_list_params *mod_prop_data;
 	struct apm_mod_conn_list_params *mod_conn_list_data;
+	struct apm_mod_control_links_params *mod_control_links_data;
 } __packed;
 
 struct apm_pcm_module_media_fmt_cmd {
@@ -410,24 +431,26 @@ static void audioreach_populate_graph(struct q6apm *apm,
 				      const struct list_head *sg_list,
 				      int num_sub_graphs)
 {
+	struct apm_mod_control_links_params *cl_data = open->mod_control_links_data;
 	struct apm_mod_conn_list_params *mc_data = open->mod_conn_list_data;
 	struct apm_module_list_params *ml_data = open->mod_list_data;
 	struct apm_prop_list_params *mp_data = open->mod_prop_data;
 	struct apm_container_params *c_data = open->cont_data;
 	struct apm_sub_graph_params *sg_data = open->sg_data;
-	int ncontainer = 0, nmodule = 0, nconn = 0;
+	int ncontainer = 0, nmodule = 0, nconn = 0, nlink = 0;
 	struct apm_mod_prop_obj *module_prop_obj;
 	struct audioreach_container *container;
+	struct audioreach_control_link *clink;
+	struct apm_control_link_obj *clink_obj;
 	struct apm_module_conn_obj *conn_obj;
 	struct audioreach_module *module;
 	struct audioreach_sub_graph *sg;
 	struct apm_container_obj *cobj;
 	struct apm_mod_list_obj *mlobj;
-	int i = 0;
+	int i = 0, j;
 
 	mlobj = &ml_data->mod_list_obj[0];
 
-
 	if (info->dst_mod_inst_id && info->src_mod_inst_id) {
 		conn_obj = &mc_data->conn_obj[nconn];
 		conn_obj->src_mod_inst_id = info->src_mod_inst_id;
@@ -442,6 +465,47 @@ static void audioreach_populate_graph(struct q6apm *apm,
 
 		apm_populate_sub_graph_config(sg_cfg, sg);
 
+		list_for_each_entry(clink, &sg->control_link_list, node) {
+			bool dup = false;
+			int k;
+
+			/* Both subgraphs usually declare the link, send it once */
+			for (k = 0; k < nlink; k++) {
+				struct apm_control_link_obj *o = &cl_data->link_obj[k];
+
+				if ((o->peer1_mod_inst_id == clink->peer1_mod_inst_id &&
+				     o->peer2_mod_inst_id == clink->peer2_mod_inst_id) ||
+				    (o->peer1_mod_inst_id == clink->peer2_mod_inst_id &&
+				     o->peer2_mod_inst_id == clink->peer1_mod_inst_id)) {
+					dup = true;
+					break;
+				}
+			}
+			if (dup)
+				continue;
+
+			clink_obj = &cl_data->link_obj[nlink++];
+			clink_obj->peer1_mod_inst_id = clink->peer1_mod_inst_id;
+			clink_obj->peer1_mod_port_id = clink->peer1_mod_port_id;
+			clink_obj->peer2_mod_inst_id = clink->peer2_mod_inst_id;
+			clink_obj->peer2_mod_port_id = clink->peer2_mod_port_id;
+			clink_obj->intent_data.prop_id = APM_MODULE_PROP_ID_CTRL_LINK_INTENT_LIST;
+			clink_obj->num_props = 1;
+			clink_obj->num_intents = 0;
+
+			/* Pack the intents that are set into a dense list */
+			for (j = 0; j < MAX_INTENTS; j++) {
+				if (clink->intent[j])
+					clink_obj->intent_id_list[clink_obj->num_intents++] =
+						clink->intent[j];
+			}
+
+			/* The list length itself is part of the property payload */
+			clink_obj->intent_data.prop_size =
+				sizeof(clink_obj->num_intents) +
+				clink_obj->num_intents * sizeof(clink_obj->intent_id_list[0]);
+		}
+
 		list_for_each_entry(container, &sg->container_list, node) {
 			cobj = &c_data->cont_obj[ncontainer];
 
@@ -477,12 +541,16 @@ static void audioreach_populate_graph(struct q6apm *apm,
 			ncontainer++;
 		}
 	}
+
+	/* The dedupe above may have packed fewer links */
+	cl_data->num_ctrl_link_cfg = nlink;
 }
 
 void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 				 const struct audioreach_graph_info *info)
 {
-	int payload_size, sg_sz, cont_sz, ml_sz, mp_sz, mc_sz;
+	int payload_size, sg_sz, cl_sz, cont_sz, ml_sz, mp_sz, mc_sz;
+	struct apm_mod_control_links_params *clink_params;
 	struct apm_module_param_data  *param_data;
 	struct apm_container_params *cont_params;
 	struct audioreach_container *container;
@@ -494,6 +562,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	struct audioreach_sub_graph *sgs;
 	struct apm_mod_list_obj *mlobj;
 	const struct list_head *sg_list;
+	int num_control_links = 0;
 	int num_connections = 0;
 	int num_containers = 0;
 	int num_sub_graphs = 0;
@@ -511,6 +580,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 
 	list_for_each_entry(sgs, sg_list, node) {
 		num_sub_graphs++;
+		num_control_links += sgs->num_control_links;
 		list_for_each_entry(container, &sgs->container_list, node) {
 			num_containers++;
 			num_modules += container->num_modules;
@@ -526,13 +596,14 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	num_modules_list = num_containers;
 	sg_sz = APM_SUB_GRAPH_PSIZE(sg_params, num_sub_graphs);
 	cont_sz = APM_CONTAINER_PSIZE(cont_params, num_containers);
+	cl_sz = APM_MOD_CTRL_LINK_PSIZE(clink_params, num_control_links);
 
 	ml_sz = ALIGN(ml_sz, 8);
 
 	mp_sz = APM_MOD_PROP_PSIZE(mprop, num_modules);
 	mc_sz =	APM_MOD_CONN_PSIZE(mcon, num_connections);
 
-	payload_size = sg_sz + cont_sz + ml_sz + mp_sz + mc_sz;
+	payload_size = sg_sz + cl_sz + cont_sz + ml_sz + mp_sz + mc_sz;
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0);
 	if (IS_ERR(pkt))
 		return pkt;
@@ -584,6 +655,15 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	params.mod_conn_list_data->num_connections = num_connections;
 	p += mc_sz;
 
+	/* Control Links */
+	params.mod_control_links_data = p;
+	param_data = &params.mod_control_links_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_CTRL_LINK_CFG;
+	param_data->param_size = cl_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_control_links_data->num_ctrl_link_cfg = num_control_links;
+	p += cl_sz;
+
 	audioreach_populate_graph(apm, info, &params, sg_list, num_sub_graphs);
 
 	return pkt;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 587f14ce71d2..38b71aefd845 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -171,6 +171,9 @@ struct apm_module_conn_obj {
 	uint32_t dst_mod_ip_port_id;
 } __packed;
 
+#define APM_PARAM_ID_MODULE_CTRL_LINK_CFG	0x08001061
+#define APM_MODULE_PROP_ID_CTRL_LINK_INTENT_LIST	0x08001062
+
 #define APM_PARAM_ID_GAIN			0x08001006
 
 struct param_id_gain_cfg {
@@ -893,6 +896,19 @@ struct audioreach_graph_info {
 	uint32_t dst_mod_ip_port_id;
 };
 
+#define MAX_INTENTS 4
+
+struct audioreach_control_link {
+	uint32_t id;
+	uint32_t peer1_mod_inst_id;
+	uint32_t peer1_mod_port_id;
+	uint32_t peer2_mod_inst_id;
+	uint32_t peer2_mod_port_id;
+	uint32_t intent[MAX_INTENTS];
+	struct list_head node;
+	struct audioreach_sub_graph *sub_graph;
+};
+
 struct audioreach_sub_graph {
 	uint32_t sub_graph_id;
 	uint32_t perf_mode;
@@ -903,6 +919,8 @@ struct audioreach_sub_graph {
 	struct audioreach_graph_info *info;
 	uint32_t num_containers;
 	struct list_head container_list;
+	uint32_t num_control_links;
+	struct list_head control_link_list;
 };
 
 struct audioreach_container {
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b6b1ef6833b3..bb2f18a64644 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -885,6 +885,7 @@ static int apm_probe(gpr_device_t *gdev)
 	idr_init(&apm->graph_info_idr);
 	idr_init(&apm->sub_graphs_idr);
 	idr_init(&apm->containers_idr);
+	idr_init(&apm->control_links_idr);
 
 	idr_init(&apm->modules_idr);
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 9092359ccf90..96409075b294 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -67,6 +67,7 @@ struct q6apm {
 	struct idr graph_info_idr;
 	struct idr sub_graphs_idr;
 	struct idr containers_idr;
+	struct idr control_links_idr;
 	struct idr modules_idr;
 };
 
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 612d8f03e6e9..5de7e821e5f4 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -97,6 +97,7 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&sg->container_list);
+	INIT_LIST_HEAD(&sg->control_link_list);
 
 	mutex_lock(&apm->lock);
 	ret = idr_alloc_u32(&apm->sub_graphs_idr, sg, &sub_graph_id, sub_graph_id, GFP_KERNEL);
@@ -113,6 +114,51 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 	return sg;
 }
 
+static struct audioreach_control_link *audioreach_tplg_alloc_control_link(struct q6apm *apm,
+							    struct audioreach_sub_graph *sg,
+							    uint32_t control_link_id,
+							    bool *found)
+{
+	struct audioreach_control_link *link;
+	int ret;
+
+	if (!control_link_id)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&apm->lock);
+	link = idr_find(&apm->control_links_idr, control_link_id);
+	mutex_unlock(&apm->lock);
+
+	if (link) {
+		*found = true;
+		return link;
+	}
+	*found = false;
+
+	link = kzalloc_obj(*link);
+	if (!link)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&apm->lock);
+	ret = idr_alloc_u32(&apm->control_links_idr, link, &control_link_id, control_link_id,
+			    GFP_KERNEL);
+	mutex_unlock(&apm->lock);
+
+	if (ret < 0) {
+		dev_err(apm->dev, "Failed to allocate Control Link ID (%x)\n", control_link_id);
+		kfree(link);
+		return ERR_PTR(ret);
+	}
+
+	link->id = control_link_id;
+	link->sub_graph = sg;
+	/* add to control link list */
+	list_add_tail(&link->node, &sg->control_link_list);
+	sg->num_control_links++;
+
+	return link;
+}
+
 static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm *apm,
 							    struct audioreach_sub_graph *sg,
 							    uint32_t container_id,
@@ -348,6 +394,85 @@ audioreach_get_module_priv_data(const struct snd_soc_tplg_private *private)
 	return NULL;
 }
 
+static void audioreach_parse_control_link_tokens(struct q6apm *apm,
+						 struct audioreach_control_link *link,
+						 const struct snd_soc_tplg_vendor_array *cl_array)
+{
+	const struct snd_soc_tplg_vendor_value_elem *cl_elem = cl_array->value;
+	int tkn_count = 0;
+
+	while (tkn_count <= (le32_to_cpu(cl_array->num_elems) - 1)) {
+		switch (le32_to_cpu(cl_elem->token)) {
+		case AR_TKN_U32_CONTROL_LINK_IID:
+			link->id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER1_MOD_IID:
+			link->peer1_mod_inst_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER1_MOD_PORT_ID:
+			link->peer1_mod_port_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER2_MOD_IID:
+			link->peer2_mod_inst_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER2_MOD_PORT_ID:
+			link->peer2_mod_port_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT0:
+			link->intent[0] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT1:
+			link->intent[1] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT2:
+			link->intent[2] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT3:
+			link->intent[3] = le32_to_cpu(cl_elem->value);
+			break;
+		default:
+			dev_err(apm->dev, "Not a valid token %d for control link graph\n",
+				le32_to_cpu(cl_elem->token));
+			break;
+		}
+		tkn_count++;
+		cl_elem++;
+	}
+}
+
+static void audioreach_parse_cl_tokens(struct q6apm *apm, struct audioreach_sub_graph *sg,
+				       const struct snd_soc_tplg_private *private)
+{
+	const struct snd_soc_tplg_vendor_value_elem *cl_elem;
+	const struct snd_soc_tplg_vendor_array *cl_array;
+	struct audioreach_control_link *link;
+	int link_id, tkn_count, sz;
+	bool found = false;
+
+	for (sz = 0; sz < le32_to_cpu(private->size);) {
+		cl_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		cl_elem = cl_array->value;
+		sz = sz + le32_to_cpu(cl_array->size);
+		tkn_count = 0;
+
+		/* Module config blobs are not token tuples, stop here */
+		if (le32_to_cpu(cl_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE)
+			break;
+
+		while (tkn_count <= (le32_to_cpu(cl_array->num_elems) - 1)) {
+			if (le32_to_cpu(cl_elem->token) == AR_TKN_U32_CONTROL_LINK_IID) {
+				link_id = le32_to_cpu(cl_elem->value);
+				link = audioreach_tplg_alloc_control_link(apm, sg, link_id, &found);
+				/* Skip on error or already parsed control link data */
+				if (!IS_ERR(link) && !found)
+					audioreach_parse_control_link_tokens(apm, link, cl_array);
+			}
+			tkn_count++;
+			cl_elem++;
+		}
+	}
+}
+
 static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
 							       const struct snd_soc_tplg_private *private)
 {
@@ -617,6 +742,8 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 	if (IS_ERR(sg))
 		return PTR_ERR(sg);
 
+	audioreach_parse_cl_tokens(apm, sg, &tplg_w->priv);
+
 	cont = audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
 	if (IS_ERR(cont))
 		return PTR_ERR(cont);
@@ -1108,6 +1235,13 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		/* check if there are no more containers in the sub graph and remove it */
 		if (list_empty(&sg->container_list)) {
 			struct audioreach_graph_info *info = sg->info;
+			struct audioreach_control_link *link, *tmp;
+
+			list_for_each_entry_safe(link, tmp, &sg->control_link_list, node) {
+				idr_remove(&apm->control_links_idr, link->id);
+				list_del(&link->node);
+				kfree(link);
+			}
 
 			idr_remove(&apm->sub_graphs_idr, sg->sub_graph_id);
 			list_del(&sg->node);
-- 
2.47.3

