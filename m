Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775877;
	b=mulIhE8q3S9NU5iH5QF2COKV3yioG2d+Wu6J8rPuAe5YWIo5u4L0oVucueFQUsMHNhUi
	 QS1ySjuqzWnkyNgJ8VVfrD+w/BBSfXbqEMsCKGkobqLhjf2934VlaNUgVU92jo8orl9gV
	 rVaClQBnRio8j10mAGzB4jMex7oHivteEn9r26ERU0nlVdCZOQy8+sMurLl63Jpkhdn5i
	 XSzLP4fT4S6Rac8Q/akHOtCducPrkVwQeS4rNdmWg1EeqSFrgLnFUaPPjVry3b59K7lRW
	 oAZ+j/q/TZooaU5eF0rx1Xq6Tv4sdQ7rKwJKbN2Rd0euzdBhgVhPtjyR1O0PXqJEXgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
	b=zT0VCC/qg9rNan/LANmsaEIjWOt2UD7VgzTaQ8DA/GmZ4Cb4pyEbq6hzzDspR45XEHbl
	 w/XHkcXFyOv2wjRsss2IphgFS/aL83TgVMMOqtPjcdfekhxEhXJov6C85y/6vdHTWyxLX
	 B6yqAkqVNv4qpqD7tw2bO3yuhT7iMIUKO8rHDkckM21feR3Y1akXUKnoKuL8ZpvRrWFXa
	 OvmzvGwaDSO8454b6WNxd3d1e3FUtEOVWXM7nRNqTRMYnrT3gW22YCD1Z9yV00TVh0zCN
	 wIb2QCTmpxujf/G2636pYprSkpWoq7BQEQleYYu6f+977GJBPA2GlnzCY+yyJlZ5lJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i2U4hhB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDBA60A262C
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCDBA60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i2U4hhB/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5x6Q4072871
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k44WZ0y2BjN
	G6OHV5lN8787fSShc67v39pliE/OY8Zg=; b=i2U4hhB/VXBPwwFTdMKtAeyEP4b
	db0K+zAm99lAe4dN4O+Mho+bRynV30T0EeMxPx3IqpuWrfro5rKzgWAtHJ9j68ud
	P+H42h8cazW451uiTZTxB5tLz+kcEK8bUU0mKxkbTuK+uhhpBkBT7KPRNEHGDPTM
	CwBQSjbD+ZxOxeRm0FCwU8nn+/ehsiarOEs1kcHIsUOsFD2aOcOHTpsdf+7dtC9T
	p7nI1UjHH5XBzZoIZAaVtNhU8c3BUdnmfL54bHx3avq+w06LG3HkBoXhk3n9Xl6V
	jq8Ag2oD+hg/oykT5HBbGVsF6kWp568ObpOHXds7+9qATALopz8KvvMUhOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so203693685a.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775875; x=1793380675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=TeEMfGzcqO98vG0GPuPD55MCkwA7vIpcSwzQ11AQjDzbp08ypEDZ/dw+B11sqHjlvV
         uyYkd8qSZ4e9AMbxfO21MG9cqkhpuoWHlYVxgplnGsq9fFQlW0PjO4xDyUmB9bOMRZJF
         tbJjcY6lhiEx/u9IbAtUCknbKOWefxqoWTMwfrTuL+KzPS/KkkezCy/Nzx7sAievPrrO
         KzRq9puwIaLZ4ckaczrFXrhYPqEwl0sG52immISiTvvGaXWTEol9DkHu1DIlzQmALYI/
         UEuNYTEoOAN3p3YSZ5Jro1OKqanXNLlKpAeIE4Awf8j+O9DmxJRcBwf6kEBKkJcdDmUu
         BW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775875; x=1793380675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=XH7yeG9d6U4SUCL+OmOLT96X282ouTZyG8qxI6Y5JPmoFMX9S3kZ7Cp0qPfxPpVHh3
         H1edHiNNub4ORaVfxFnXyR6uth0rKNWYIZosWq1Eu3dQc+JrigR5oKtQKSXUuDmuaa5u
         MGfxY391MFdhS91VLNEVN9jUErhD/l/kMimk5RqaPhK/7P6wcUhD6NGkeINSa9eVdhsf
         PENO4fhYAMpoojhiTr+/Ihvptvsads/ekNshdojh0EEJqC+98qr9DI5J3UmZfSN3Zqg0
         tixpsJaEJ9II0h8+JFHBjMWH+Xa5pvYjUBU9DflYTymD/RaHt5GdIc4GFZUGy6SOes+d
         oOtw==
X-Forwarded-Encrypted: i=1; AKwUvByyT9Qs9RWaUMihgtj2QbB3D70HDu8TV9Kizkny/Gva4SYvRepkeFDH0IZNpiREqgHBjJ71Tq270L8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOB5ihCbiB90YIaA3mWoYg2BdtqWibSh33UUTy7mstXtKGy8VW
	vSD1BmEXUO+QPwNSRc+jrWHoYwGKvYIzqZunxpQ11eaw/eH05insa0+Lcjz4d9+TmpHyl+yP01D
	XNmPjJMqny3VeZAedYK8iata7dIONs+ADiv1SgvSyGMVV/lvSmmwPqtsEirT3mFs=
X-Gm-Gg: AYBFou25sA+pxNJY/2WUF7TjVIqtH0QDea5X+0cw6S7XNsnEeQXS2BihuCxfhJaP5b7
	LhA+TUTtaiMUNBfoVHNwxwzybhsw6PclCzF9G+YJ68+SDE6HxCsILU/L8AMGtwO3LGRHsh3pJdm
	YY30nabQbBkbv1Df6RcsfNmB3v0lBn9gmAdrcOEAJx8zRSpHuRKK5Az2UUKJOfwNXx/B0PzOXe5
	yStj8JJBPf+93S1VZr4G0uJU6jf1ayJfrS03nS6Qu6VchJkpNP966pLGHAMueWwetDqVf3P577a
	alUrNghN+j9guG+P9m8OdjlHqc0v7iESpxVc/kq7PubyKID8MQYKDtHeMF49sphiuZzwzvhJnTY
	+800TE9naafe1
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960273085a.34.1792775875163;
        Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960268185a.34.1792775874548;
        Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
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
Subject: [RFC PATCH 04/23] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Fri, 23 Oct 2026 18:14:14 +0100
Message-ID: <20261023171433.820092-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CCpeiVty5SrNUsJafBq-V3drIsqWTIEi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/Cc1s6/33o4f
 owEKgAPylYZesYPkF0EtUVa39iVPnQUVW5RCaV3VK8gzMY1V8gic7h+7DmLieNcA9i9rpdCC2PZ
 STzj5zgNriDt/ny7zXpQ6eqCLCJeieQ=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96c4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: CCpeiVty5SrNUsJafBq-V3drIsqWTIEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2JuVUjhghfwZ
 Vui27Zu9IK0jhRM1BOmcqyDbnj61Y2WqN+owmnzLdhVYHoTS9GKZvEZy9D4AvjOawr1OGCOmiuk
 kd5fqkTxDHq8zBNH7o0FVezIiGmuRDvuec5YFBfgg0AZ2km+B4sTkJTjKfP8uwYtIF69TdUCXcs
 t1J6KUOlm3gAQoYDiR5jvG+l0+xVTgxw6Q2+5D01gIK+Q9Skn2i6iBpUFj2jOEoJuO1GegPblC/
 rlP/64sGIK/OQAK2N8ITN+s9J83PrRZ/QA0liZOHnkyXKY2bjU0f0GXX/vVsPqHD0o4Aq8MzpZS
 y0MudfmkkeV6T34dQS39WAAl9BaU1cFSnA0p8bitVNyXHxJRejDJcG7ypameHsvJvkowXpZMEKW
 WpQd86mGtQVbZMfvV2Myrmcz8+FrkkQYxj2HgNJy0V1uZIc/xb0h/h/BETxEzg9QlV+mWLDNmlV
 b5ZaX+7VHIsIQH0y2+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.47.3

