Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417336;
	b=HxF53AVKpDoumzjSL6plI6J6lk9I0smLiU5QYqG2HA87VZTmsQMmzqsFPtMBa9ApO46w
	 qw56ECuGm2FaNNBAsXHW54O5vkFohZbGVctKPnoJC59NUJiPfm2yBHeXBw5NtASAGMaIB
	 uzq0Ds30juYRbjIhd5ATYTPKam4QYelbWz8hjkWWfkG6BNha7Hi7LOIR12LnEWxldO6uv
	 4Fx6o9TOXMYFnggWL6euYAKOORkHYnDLxjJMdfCghGTt/lq2GMzi3P+jZ50xblw5lWJIV
	 4OM+judvWEl0t552wTgozL3ZCRAZlGo5LyqWXGVIQ2ma4Cj9wUWb2VzUU9ZVqmh/fEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
	b=UbrPo2V1hIm1TQKqhO8VicUY17Oq1mRSgxN9z3PTlV0rv1R5/xLkInbv4Q/Veu6DDZBc
	 Vkq/40NXCdatGHCsbG0R1UsxRHmtDyPByW6dv9tR3Dqwl2g2E6XDWJH+5BX1k6NPfX2fg
	 dETN9N4Z2vZCo/5XBIWVdI3njV9kA/ObLBX09oULWK40XZ1tma/b2I7jXxMk7F85Yd8NT
	 CYLCfTYGDGxwZS/eU4r3garfwItDotkfhImegPjyJK1YWgYJIBPHeWE9PzrD20UiFEyVD
	 vCAkQxM2dyTvsH4+r3gnH+Syl9jESf33gei+70Mbn+ct3dfwYyoi05loW0bZam5Y86g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pyEvdx8T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XcDDrPgv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B860A2604
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437B860A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pyEvdx8T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XcDDrPgv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6Datn1490188
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=; b=pyEvdx8TkAh/8ger
	ZxjsoxlIAuuAaXkGtM4sz4BZxg9A2nUbz8LVl8reFZLc4odKnOq9xwwneriE91wU
	gtg4Edua1WKbOp+iBDd8abAYCULQYHMDGozVGbS8x0TkMl+uMnKfSgCFly+j6vBf
	VFhsqUCFQafzCJze24GqRKfVCBoIEU34/aTG5+FjIPrWCsSg8oLUs9zymP9VyUl0
	KGlA2ye2JQQlubljzcl5f8yAcTnC1Z8Zbwl5Da+cJK5RsHCP6Edvm/lGP4djbpfN
	fabsOIoPm0n0H2cUVfoPP46UUUVF9EeYpWmw8oDOtZbzZByKmhcGoAuEEQjXPBKb
	Eojj/w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k05h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:15 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4db3db8687fso3972181b6e.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 23:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795417334; x=1796022134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
        b=XcDDrPgvYbRjH+bLPE/TPb5MVKmSIOSnzqsn2XZNFi8nyMkDl9MSiQS2auPyyXojs3
         OGVyBYJNq1VjHuZ6ApeNaeUJRJbP+0ThaT6Bo/OsrfjFsD+DBSWpXheKTWiivpJ23X5t
         d+LYqGcY1/667okOVvH7RkqwByi9DIxPsoPN8qau2SXPQVwCBnBNx9RmAddJNMXoWzFa
         f4mnx0tEUSostDgRsd1FBZtjEFXuXFEepWu6TyhznhD89Wzm/OIpzAe6ZWqVvk7k85Br
         TG/33z7NKDwD26PuTXmjSMWIN3VDfNuRlMViZsCzQAbeWXOOBFF6LNvoAvpD7BDxMtCw
         8L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417334; x=1796022134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
        b=EtPO4iC1fu/584EoQn11NZ8hOq/I/3xJKGXBlWXSIh32LCsozQwW0Htvdag3Vl9lMF
         kh50Q1xfcX3nbb26CPXfaAilj7On12kR0JK4JU62m5fjTEGR1elDlIPmANBMC8s27pqK
         mz9HnXPrf1ZAEbKKhUjZwpXXXDhFK57wMs1az2PJEoDCWtGB182sPVL/xW5sffEy5oHf
         Am6Fguy7k1Yb33wxBV4MM4QQ1NaBGyQYRVrchPuyX0FIvWSWneocDaNyQKcCTczPat9i
         nc7RJEj3g3wVm+z7ar8s/KIeGHB2DpAqYGvKrswVwMQRAOKyNdBSmME7Y7DHoPTR3/hs
         hHPw==
X-Forwarded-Encrypted: i=1; AL+hErFJeshfe3S+5aKSXYJ6JsX5Q0QW+XXrdnm6DaJ+owwBsDvyxRhN9eIfKcuV5Ygm5R057ZFH8cqLq88=@vger.kernel.org
X-Gm-Message-State: APuU4Z87cYyyQ1r4KMuwva2XkdpuNRPH5IF7sfBr6aPeLT713U68Xqkz
	IphwgEFATBOpBLN/Hy2ULh+2T8AtIcK4+42/htWZrBRG8mHPnq0qIoK60vgQZFcIRpFjtCilNy5
	KiSp9iPXJV+5Vm0k0KusyADOW7oALq0a1dOmYcFISKN3bC7sIfevG62B9P2gVA1g=
X-Gm-Gg: AZFdTZfJ79P5Nr5G3Ih/1ZXfuDwfThMBHjKbodbWica9hV06b0UcHHN0Zs8ttYVQ3ZD
	rqVK5KQDYYgS6gnl9YcwuFaUeQWZ+54ZowT5AuK55zRScKGzG5B+QqTeZVQ37UgFji7B2Kqmwqw
	NIQcp0n2V4HRtUSiNtpMn+c6kcFODBt8y/4OBl6H1UBAIUr7cRedX8krNsdcUJqOqauHWpjOiQK
	ieyNHtHN4PV7vYBDs6R0ZxEhJsxVnkspxMiLiw8zduTlmww5RpHYG+s18baxmquYU4KRKf0r9Jj
	4bl8XKftdTnI0Wtgq2SM7Ck+TlNfR3/UQv+MZtbr2dzmDeGxO2iTGTjpxmX+BYjyjG8lOM+XIhr
	nK05UXeDKpbGYPbLjScZpjkTHnf5mGKPqTecI+U3ZGqZUm7OiRXKCdbtLBfDnBpI/Z+vTHjkBeP
	YDLalFZMa8GXFcVZNJUdFyPDqpxg==
X-Received: by 2002:a05:6808:199e:b0:572:f8ec:532d with SMTP id 5614622812f47-57a0a927e28mr11458626b6e.23.1795417334493;
        Sun, 22 Nov 2026 23:02:14 -0800 (PST)
X-Received: by 2002:a05:6808:199e:b0:572:f8ec:532d with SMTP id 5614622812f47-57a0a927e28mr11458602b6e.23.1795417334124;
        Sun, 22 Nov 2026 23:02:14 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8817213b6e.17.2026.11.22.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:13 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 23:02:05 -0800
Subject: [PATCH v3 3/4] leds: rgb: leds-qcom-lpg: Add mutex lock in
 lpg_pwm_get_state()
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-3-f911edd40a31@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795417325; l=812;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Bnb2so3/IwoLbKEtelemwhyUAsH+oEhrfqUv3ro2zRk=;
 b=BWcOshcISQpzbqHudIE5kDAuvxuIyaC3/EeLxUN1kmCnDJUgGZ1U5To2CRAeVXdNzlWsPeS3X
 0ysWKD+WCQZB6eDMl5Tk/3ZcOyDsxRKl1Lzd3t6cOAnduEBFnaUAKod
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfXx/vBd6fWxSVc
 KU3SoIf208lnavLTpfQwbM3eX62wfG4GnsIv+emYw0s7f5XD5+dz238nHsCkUiRCdf6FxMLt6YF
 bUqrt3RNLOSDrcqcR5ZJP0h3UYWxwPk=
X-Proofpoint-GUID: EO2Gml09_qROGJTUAPp7kTZHfcmU4xEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfXzyYH2ws7a0hW
 X/87NXtJUJegMKwSEC6n072baZ80OeG9ZRoMWiwtmHGToxn+h2EvZhVWgoF9MAeYpBLCF8wYP1Q
 S1+NWq2IozrHmDnUIYVlE+rD6le2m548pbQ5Ui6K2tbdMweWClAXBQGOHC2UZcb/U/FDfURwYU7
 aEJdwKtx38/yX/OgvsRl1AGC/t0wXus1k47Er5eL7W79/iR08EIrSq/jFsPVbh3Kej6cDD6JPa7
 1lqoH8wuy7rra/sX5Z5yznwhh3a/TpxflFCR0lMbH4uxMYe4dF5DvMeO021uhUT8NNdyaahMImb
 adx21ZvDQKR63RV2pctowAZAyAwzHTF+ojtzxaBk+6ROcaKfccaVWgQY8SZR6kpnz0TmwcWn6g5
 S+PRkWR3LvmAaiBtdH1jMCq5bhCQEmHnAvnuaAaKxKBNc0klQsPgknr+XQi05d15ODbG5VRXeDx
 rleMovAogPTebdRYWrw==
X-Proofpoint-ORIG-GUID: EO2Gml09_qROGJTUAPp7kTZHfcmU4xEY
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b03e4f7 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230027

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in LED callbacks.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index eec942f2af6c..06588cd0b3ae 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1470,6 +1470,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;

-- 
2.43.0

