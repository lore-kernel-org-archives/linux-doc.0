Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775871;
	b=135B1oMJ6YcqTjQBEyioHRT8xdCtdf1mOQApRWYJmdKumOWJeMk5ifT6sWDHDL0QzsTI
	 Gh+aqmMu9gPI3SU8fSxOcc72BGLFjvY2tzyYvSXkqZs0gVSliuLshFD+4gNFfOG8Jw8K/
	 wwqarTlMrWew7eKPuM0X6UDCEMp6G0Fpo86s+u+S71K9oUPSnLqhvDMLnRyClQqChXyE4
	 t+T1jrjP01PWH/tOzHcSpvGoSBfuPPM+KENMR4qMZeY0qB6EYIL4deeG5LToTcPk7wrk7
	 YyrdB6P5LJqyQW7d5jGixHkp2VdrFeL1w8LxdIOhKMon1s6esA6kRvakXcNIcPTM72g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
	b=pNl+8UtNmWbLzrRY7JA35lhkJAtYgRW8rd0KbtyIhSisc6+D2KropV3yCd9UjbNkhvXn
	 GMt6fGMMk4CWOldLLqZqII7TnnR4ub5rDi7PfMi69fzLMJQ33Z9Orr2NRk0ZLfNU4Qbat
	 E2pKRFzBoYZMokVn6gNT7e2lCCIBUUMdxIYXtW8xFQ9aTYfKV4zvrZvQuE/t6yedNTgsg
	 B5AmHwDXAumgYcHftsoWfC8WqM6LrELeanusWzKJ7Ocf3EC7JzyPzokMTxpEmEzTbOs6i
	 2eaaCudsmHu2wFsndYcYWAYzdq2zed9clfYBy7qiNL9RZtBOx9E+B7v1zjF6hcvvCTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9RSEIGb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx5sbuqM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B89606A323
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61B89606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9RSEIGb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx5sbuqM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DEK2462574
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGVXgr+T+Gl
	k6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=; b=f9RSEIGb3l6efg3ct1YubW/+Mbp
	E4BJtd+OgUBOIXCtz/BnPxff0NVNBXmlnMTQOSi+NFUpecTXNBJqz0qRRPrfBEcf
	6qvItVFESSaFmo0q86z35v2C0ByhPkrEuVYfXDouhkix91Ez65G2z3XshrVUef91
	WmBnb4Z8YEC9swgBq5FzGOAKVY5L+09/DmiadMe0ujltIXo9UyySieh/zrmkxfWU
	lAP1RJb+MFI6F5ArtWBCOUz5bG8iFysKfargUVPtnkgInNdLhin9ZVGNBMuJjNLp
	r9u7myBruqgM3xVjSW5MKdnOKApTIm7i4G+LsI6L1z0PCzjubOscoSM6iKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvsh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso141239485a.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775870; x=1793380670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
        b=Tx5sbuqMNpXn+GOVdB6JfnicWv3IWZMrsuyfNSih9up6eqqqp8alYKI/HiJbZ/zzDF
         v8YEWLTDhj7+sd/YEMDhnP1Ew+Uw7S2ycbAbTMvGQApXyKKO2L2411pqrdGWk1jZ5TBj
         32gJz3EtlYyNNrqirj4RZ6gPz9CgwmOEK6xcKWV90dIVL+HcuR1O9HbLsS8cuIDmv1Qd
         1uamnmxuUxh0fuotR8Ub6CPZ3NXkwe7jCUtrPTDK44mKXOaxJ50X1qIHsoftrnXjbSRk
         10Txxr8x2BtOHrUCjl2+LPsTW99vQulfP8utTWBTS7I6BYHUpkyASN+0P4U0YwHO4I7C
         5suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775870; x=1793380670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
        b=dqHN5dnHC3WV85YrZtCkgn6CHkiUgUZ4vSF/SgyzoX/OFUbvgewUuKFvSVRMNS2jjL
         Yhhxrej3XF8fgJP1otupiY3XdEF+cJt+KJOJcbut65i2SxL1YhiIYfuoCAGR0OqzLBpx
         Ln5+FbsV7PBxLa9egMLWGYQQSCbTUaAvGVLOJxcwDT0T+l8tBDzXtXcIj7qA5F6mB7Jp
         4Q64zK7rs6mPGX8anKcVWrYH9VKz+S+qZHj5GJxflxFUGPdzuFFWpcdx5cn/nGeZSQdJ
         BXRwQ89gqMgTXeeHAsK2KrQHDI1Sf3QEzCoCZnLx+Olc3/i5eEkgIvMPn3jGB7EXae6a
         nr/g==
X-Forwarded-Encrypted: i=1; AKwUvBziZ8DLiWdSrWYs74hTdxOmfvAN2n1Tc0JXNd1b1fA6Byuc+fdn8m3H2XJbVvWyhnpJl2X6mnjVlE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8kNTpqIy5CdQt4JMMOjVvzEhCuRfJ3eeOIkfERy8L/pBJ1dBf
	Nypp3QLh7JDHqloCZ5OQabFBgQ7dpnD/5JTyeLJ6WSWiWBCWiOHE6TzBBPRCEepF2KeFhIwy1xX
	qu4oh1F1Q6N5zW6DLID+h7XAnpAJnOnSB6e5Ha+7qDortNS6aeYYRPKqGp/T+3sc=
X-Gm-Gg: AYBFou1vFiv4jDd9Y16zNy1Lv73p+tgMc/CNRgEotrCC2YOurNNBDsL5NBVAmiubavu
	gmgMNaenWWd6/opCyRiCv/mtKpuBaKPxlX1sMvoQ6i/+QD9RU0DUwAe7F4/UvpZCdVNKQYc/yKi
	b4cn9FUyRO51KulOeRTh9z/PzuJAJnlj0cVX3xpshtsBGcHGlcLqJLxx6if8OKZkjYVmN2rMlCQ
	qJN7t0imL9iLvn+8EMRdTs31FW4hx7UbtWyZ7rhfuDN0TC/DPmdI8mD+Y7aWRLMOsONCEp4s3AO
	hD+B+lvWUwjSbvUtMD+0uQ7qcqCixakNWIHYqLcY7B091CdC93MWpjTnpzockC3a3uBnuiRyg+O
	Dr+d2w13MLkqN
X-Received: by 2002:a05:620a:390c:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f6f954a00mr525153285a.44.1792775869559;
        Fri, 23 Oct 2026 10:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f6f954a00mr525147085a.44.1792775868977;
        Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
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
Subject: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on links with more than 8 DAIs
Date: Fri, 23 Oct 2026 18:14:11 +0100
Message-ID: <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ZoKOZlNiuk5k9p05MsAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: brGGlM3uLGfgwp09Bhx3GTg6CdNblnES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyMV1iz9RYLPc
 EreCFo0PrQS3oul1KSqa98KdiskLVd0wRG7RrPKJUBwKkgQyzxQ7I2nS5HaZ8FZutMnUdAUxMKg
 AHToriAZgwyKWfZQQ+W64rCchdU53Q1sdWyWKMiBSY39ypCzTpRov6TXStvkdETENGOM39b9RMo
 AL/h1vS/7FStc5DcodAyoLeZ6yh4/iVCWqdnZE9ax8vmrI6NG+F1Ew3C+pzr+G+cEXx/VrR4Cb3
 XxDEvPkTg+1YaatyBjzkAjAK5XKWube6RbVxVJfXO386VKPyL8EqvSyTidZyOQ0/bG/KBRWtc4C
 ELPJpX+OvjFeIia2xtt18Wrwyk5zljvdGB6cXGwyotBTWFCsaTstLiTb7aetdt2n+nq9GzyiV4w
 IpPvdPrtU2sj5Sst3bT8PdwVROmS/yDB1cQY9MkSb8xIuWtGviwV7xtywS2QAmPENj5BlaQLntr
 hgFAk8eibvcge+KwT2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7ZXEnol3JHmg
 PuPeitp/wM/USn3q0QM6XIkBgd1aWjlkveuwC5Xqm/s5XunuSy5a5OG5w66b20/IDWAB4KLv2Tw
 AxvacMkcY8baIGEbLTi32EgB85m3Hv8=
X-Proofpoint-ORIG-GUID: brGGlM3uLGfgwp09Bhx3GTg6CdNblnES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

snd_soc_compensate_channel_connection_map() builds the default channel
map from static 8-entry arrays and fails the card for links with more
DAIs. A speaker protection link carrying both the amplifier and the V/I
sense codec DAIs of four speakers has about sixteen.

Keep the static arrays for links that fit, and allocate a per-link map
with the same 1:1, 1:N or N:1 layout for those that do not.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 46 +++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 97269b4ee4ca..34d02a39de90 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 	if (dai_link->ch_maps)
 		goto sanity_check;
 
-	/* check default map size */
-	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
-	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
-		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
-		return -EINVAL;
-	}
+	/*
+	 * Links wider than the static defaults get their own map. The N:M
+	 * check above leaves a single DAI on the shorter side, at index 0.
+	 */
+	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
+	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {
+		if (dai_link->num_cpus == dai_link->num_codecs)
+			dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
+		else if (dai_link->num_cpus <  dai_link->num_codecs)
+			dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
+		else
+			dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+	} else {
+		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
 
-	/* Compensate missing map for ... */
-	if (dai_link->num_cpus == dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
-	else if (dai_link->num_cpus <  dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
-	else
-		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),
+				       GFP_KERNEL);
+		if (!ch_maps)
+			return -ENOMEM;
+
+		if (dai_link->num_cpus == dai_link->num_codecs) {
+			for (i = 0; i < num_maps; i++) {
+				ch_maps[i].cpu   = i;
+				ch_maps[i].codec = i;
+			}
+		} else if (dai_link->num_cpus <  dai_link->num_codecs) {
+			for (i = 0; i < num_maps; i++)
+				ch_maps[i].codec = i;	/* cpu stays 0 */
+		} else {
+			for (i = 0; i < num_maps; i++)
+				ch_maps[i].cpu = i;	/* codec stays 0 */
+		}
+		dai_link->ch_maps = ch_maps;
+	}
 
 sanity_check:
 	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
-- 
2.47.3

