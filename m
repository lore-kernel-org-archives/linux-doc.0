Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417333;
	b=xl2cwhA/ZYX7xQjuKdBB9mOpzbRNWqrFbMO+XTpegHzPsOOKKOdxKIPSwpFcgi1p8eHx
	 8VNkhvWPsxapn3QB86TlP8ZYZto4syP+LPE7k+SBIU8azJx3lpUdUjIdAjCvhmrQEjIn9
	 FtDZDfGV5OtYVtwczZEmtKcIahB0g9q/nJpbCqlG7PNxH5mirbufthQG9VbEjrOhXkabf
	 PxPJhpKsgUh3EGAR8yQ/bEokDf1OYcfo+a940qsvvfzZEJsmwTgEoiAXJMZtumP/kvQEq
	 50xNMKG+SEFyx408AKPXPzg2RI9asWIQMwR2+zNWBHKqafFHlqt2Wh8GKmqgnZiwqrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s34EkJs32wO3DdHzMO9GgyjprBIWK7X2DNNYTXJ2s+s=;
	b=RpEo+sVpjoB5MZ+42EuV+zIN8UldlpysNZMzQWHwVAMxY5RkdF2xXvVl3C1s6obzdR6k
	 OQFgf2Tv4POiCWmeUWqShEXYjn3p48DQLBFuP4+j96gYDV0CvAMmIXrBviZn6uR0ZXlUr
	 O8qt6EfuJs5xqSbkDvbnIfT4/r2QleN85/zf3TKUY9GWz2QYJIyWV+dPsUBVr0lrFbmuM
	 p/8W4Zn42305/l601BO1Iw9grM6ZMm67pM+RGo2n0DRkKE/i0MdnN0hBNAGFSJS09WLg9
	 ARmtObYTmm0pU72an+fWBiUobVntV1DFnqSVTIywm4bGFo7veKaW3Al7481tI2h8qOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dQZ/GscU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4hdXhNt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC07606A338
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC07606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dQZ/GscU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4hdXhNt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN683nF1126535
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s34EkJs32wO3DdHzMO9GgyjprBIWK7X2DNNYTXJ2s+s=; b=dQZ/GscUowrSYYdi
	LwTWdlG14P9zKlUhOeTDjgdYNv1xGQEF9kInO5F6x1ACJ+AgJDhUu/p3V26GAN4E
	X+7Lub/1EAOTiRNBPheF1R3AnbN/nNSGAGRuv8rKcKTUwgXPQNsidvu9wGLeothI
	aEgf6BAludDM41tDBAUyspzZo3JlMrwuH7zt0TUGWATUSlcEz/W278kBAltJjWL0
	gPTKfU2biT4LYt/5320t6GLk26O5/CflP3WdD7jVIGlwiUPiZQojiM+fk8sqfIse
	bvFEvrSrndw/QiFczZf56rYJdYXsbeZ/xzuWQHbd6/X61QkxCJp1J+iiICSbcXin
	uhjYbA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy0063x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:11 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dab94dc3e7so7206410b6e.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 23:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795417330; x=1796022130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s34EkJs32wO3DdHzMO9GgyjprBIWK7X2DNNYTXJ2s+s=;
        b=S4hdXhNtEnFUWGKb6B7l509XleVWSVMTS1N9l4j3hqFrH5t2YpQIYWNgoVJ184gmHH
         iX1NQK9Hl06GjHr1SIRaU06UbTjQ3/OwD5Jca1Fw6J63dW2ajTf/5/g8X1/lPvrM2jzW
         HikScDkGKcrrmvaYao0ygeVjPPCxwHVP3VVTDcuboD5G1AIFmXzeGfxDNj8woEV/1HBN
         MqIYZLqOKwPHprJJpM8zqyjW7KaKHasZGAeCeTwhSb7Sr26en9M++tDO54VN/bkiZtEc
         YBCE79LXRSW74z0NwUbhW3jusGI682LIUzO+aiwIwDUn5GFspguzFC49FjMY6CYYqA8b
         FbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417330; x=1796022130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s34EkJs32wO3DdHzMO9GgyjprBIWK7X2DNNYTXJ2s+s=;
        b=HBLBn3q/NmNa0M4jdduopLj2DLUCnNbPDZxmPNlElgLzSJYWoyXlAwCs0PYM/e5Rdx
         MuiPRGd4xbhE/x59nrD3GJ/kxELxVjL0oPaHyH+CEA0OhjX402A88SL5luMpPhX8E7Gf
         5cZv3gSoP4b3MwVEVyGNbyJSM4RpnKJNB5VK0otHFhs0whxW9WSPLCHI3dnOacWhjXxN
         /mPP4zMzyaWLyYdtVXubeDbrq5xN6q0MZnBEVhIYxTfvFosbGEQrcloDKwWXps+H3XXa
         HRl3vLHmfE1n4cX85E9Vi85ktN7/anFsl4GprDYMmMDnjW4Bbwu/f01mp1BB0Jgpvn6a
         KOcw==
X-Forwarded-Encrypted: i=1; AL+hErG9+Xx6q+E96ZoTnrEu1kGLwob1n+cQXPvNj4uFMsbNXXeZQ4iLLtmUnHXRcxRtdIQoHgumVOl2obo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u5s2rSupcFkMQpNMmIcxmsDM7kHzYabdi2ne1f7COTVjCBrUB
	+PRhSQivbfNW5Ahsb9rAVkwG3tMI8NVZNHAqwY3vWc+G3nFD1xWmJaDgdyyM1WDYjzClBnYDKdc
	Hwf3oHzFECJHT9X/PkQd6GFsCa3buKZwLrLWrtC7RBOvcKa1rumLzCpkB7DYBopo=
X-Gm-Gg: AZFdTZe1LBX1GFoB17jQGeEsEcrrDVixsAv6N60TuzUt5yrYbOCqQ03SF/25HI+CTIu
	CjQCtPEhh4afRybonhl9z1jrKykQr8gvU7hZVSw51LiWH/p3DIILIqVsa6682LrXBI5joNlprec
	OW3y51GZrxJpVlbwO1A+Brbdd7ShaVF1fA1Nxhe9i7JlQVnpGszo6HazcvA/ntVCSBWNpeXUP6q
	9sGTdhQ5MoH4n14iA5UUcVLinSQnxihOVxVXk+u4Rv9uLm9DlTkOy9YtU+D823gF9IatjXKzy6k
	4dT9h4tYRS11OlfqBkR81v3OhhBnANSwT5SNPpacMxdYBZ+vC6sqki2wnyrYEK/1rK1Q9AuhI+B
	kD43IcnL9i9K8QQhS6XBAu9nXOJEil5tqukH1nA2MQpMAP9MWcyx9nIuzivIYtKpPf+vwV/wyHQ
	enTBeqYAjO5BnvZKC9Z8fM8qBvRw==
X-Received: by 2002:a05:6808:244e:b0:539:a2c2:aba3 with SMTP id 5614622812f47-57a0c395580mr11804367b6e.52.1795417330208;
        Sun, 22 Nov 2026 23:02:10 -0800 (PST)
X-Received: by 2002:a05:6808:244e:b0:539:a2c2:aba3 with SMTP id 5614622812f47-57a0c395580mr11804354b6e.52.1795417329762;
        Sun, 22 Nov 2026 23:02:09 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8817213b6e.17.2026.11.22.23.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:09 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 23:02:03 -0800
Subject: [PATCH v3 1/4] leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-1-f911edd40a31@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795417325; l=5001;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=0b88jzm116e7jJtW/EtAHgm1TcoVKY1b0T0SPhhhz20=;
 b=rlEqAIOIRPLLL/zidnJFj/mzFkK+lMi5FF/6F3rLmt4IHVGA6dfjwI6gWNV2YuNeqfmeVq7eH
 p6f6BUZxu9fAFwyMiQbVlT0bN3LlrlrYm0XOAYEJX2HtBWX3P5i7bcW
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX0FjOn7eI8Ohs
 /6ZoKJPwU8PBXfDJ43uVaP35EqgZ+qAnv05wuKaUWC+5bLmNwZuQ1dpPS+Wm7JgwcIx6nAqvqqu
 1H/aNV1C9GBWIw7VB7cknevE4CZvJ68Q0xpyqMHMPgbNbcRjwj2UX5ouxZzlmPG5OghIl2bj2Ci
 yVeI/4GLS+SHE5FgrT2uiMxKyvoHryu3V0+nAp17RYUBojC+6FpIeYeYWSWaGEJPxfGEfL+ICDB
 RuNXpAf0u7dUJb5c8cYU4YqF+V5N8HN38ITqDgMKipXQIN7m4GNwQMvcCJEB+hWeTguc816oK+n
 5MbxTlSx2BubYEmxG54DLC0/k5kXfsXG/bmFpzQo1kQ6qxrM9AlCZt6UoGQ965itMgUpqIJysnx
 9ja58FoEPp/AAdxXWpPlEmEAxwisFK66bsjaf3R8bWVd6JJ9KXutFzULe3KFxkEaxA4WRkqdlnk
 oOlwfb47hGhbz3vK3eA==
X-Proofpoint-ORIG-GUID: kKhhP-cbPD8JVv122aE2-hfu7ROxUZS6
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b03e4f3 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MAa_CHwBwOMXYDkmoIMA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: kKhhP-cbPD8JVv122aE2-hfu7ROxUZS6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX11Xi4EkgFavk
 Oti2RY6sNgjiZQA15/5wnVWlJYxlR+q910jInEkAYhiGlSMwnq+4+BsFWcaIh3Pzgy+2XQJocT0
 6+KOLjqPKUMz5o4HQLYE9peBARNDy7Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230027

The LUT resource cleanup path currently treats identical high and
low indices as an unallocated range and skips clearing the bitmap
allocation. However, with a 2-step palindrome pattern, the high
and low indices are identical, which can leak the LUT resource
because the bitmap allocation remains uncleared.

Resolve this by tracking whether each channel uses a LUT separately
from the index range. Mark every channel using the shared allocation,
release the bitmap allocation once through the first channel, and clear
the LUT state for all channels during cleanup.

Also, avoid ping-pong compression for two-step patterns to prevent
programming an unsafe single-entry LUT range.

Fixes: 24e2d05d1b689 ("leds: Add driver for Qualcomm LPG")
Closes: https://lore.kernel.org/linux-leds/7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com/
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..5a63f3bc5dcf 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -111,6 +111,7 @@ struct lpg_data;
  * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
  * @pattern_lo_idx: start index of associated pattern
  * @pattern_hi_idx: last index of associated pattern
+ * @has_lut: channel uses the associated LUT allocation
  */
 struct lpg_channel {
 	struct lpg *lpg;
@@ -147,6 +148,7 @@ struct lpg_channel {
 
 	unsigned int pattern_lo_idx;
 	unsigned int pattern_hi_idx;
+	bool has_lut;
 };
 
 /**
@@ -393,15 +395,19 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
 	return 0;
 }
 
-static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
+static void lpg_lut_free(struct lpg_channel *chan)
 {
+	struct lpg *lpg = chan->lpg;
 	int len;
 
-	len = hi_idx - lo_idx + 1;
-	if (len == 1)
-		return;
+	if (chan->has_lut) {
+		len = chan->pattern_hi_idx - chan->pattern_lo_idx + 1;
+		bitmap_clear(lpg->lut_bitmap, chan->pattern_lo_idx, len);
+	}
 
-	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
+	chan->pattern_lo_idx = 0;
+	chan->pattern_hi_idx = 0;
+	chan->has_lut = false;
 }
 
 static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
@@ -624,7 +630,7 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
 	unsigned int hi_pause, lo_pause;
 	struct lpg *lpg = chan->lpg;
 
-	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
+	if (!chan->ramp_enabled || !chan->has_lut)
 		return;
 
 	hi_pause = DIV_ROUND_UP(chan->ramp_hi_pause_ms, chan->ramp_tick_ms);
@@ -668,7 +674,7 @@ static void lpg_apply_lut_control(struct lpg_channel *chan)
 	unsigned int hi_idx = chan->pattern_hi_idx;
 	u16 step = chan->ramp_tick_ms;
 
-	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
+	if (!chan->ramp_enabled || !chan->has_lut)
 		return;
 
 	hi_pause = DIV_ROUND_UP(chan->ramp_hi_pause_ms, step);
@@ -709,7 +715,7 @@ static void lpg_apply_control(struct lpg_channel *chan)
 	if (chan->enabled)
 		ctrl |= LPG_ENABLE_CONTROL_OUTPUT;
 
-	if (chan->pattern_lo_idx != chan->pattern_hi_idx)
+	if (chan->has_lut)
 		ctrl |= LPG_ENABLE_CONTROL_RAMP_GEN;
 	else
 		ctrl |= LPG_ENABLE_CONTROL_SRC_PWM;
@@ -818,7 +824,7 @@ static void lpg_brightness_set(struct lpg_led *led, struct led_classdev *cdev,
 		if (brightness == LED_OFF) {
 			chan->enabled = false;
 			chan->ramp_enabled = false;
-		} else if (chan->pattern_lo_idx != chan->pattern_hi_idx) {
+		} else if (chan->has_lut) {
 			lpg_calc_freq(chan, NSEC_PER_MSEC);
 			lpg_sdam_configure_triggers(chan, 1);
 
@@ -1043,7 +1049,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 */
 
 	/* Detect palindromes and use "ping pong" to reduce LUT usage */
-	if (lpg->lut_base) {
+	if (lpg->lut_base && len > 2) {
 		for (i = 0; i < len / 2; i++) {
 			brightness_a = pattern[i].brightness;
 			brightness_b = pattern[len - i - 1].brightness;
@@ -1118,6 +1124,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
+		chan->has_lut = true;
 	}
 
 out_unlock:
@@ -1176,7 +1183,7 @@ static int lpg_pattern_clear(struct lpg_led *led)
 	mutex_lock(&lpg->lock);
 
 	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+	lpg_lut_free(chan);
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
@@ -1184,6 +1191,7 @@ static int lpg_pattern_clear(struct lpg_led *led)
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;
 		chan->pattern_hi_idx = 0;
+		chan->has_lut = false;
 	}
 
 	mutex_unlock(&lpg->lock);

-- 
2.43.0

