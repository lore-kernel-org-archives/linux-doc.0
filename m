Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277D24A047
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756300; cv=none; b=hae7chp9/KPlnvGtq/wo16c4mqi7kCr2sGg7Vfs2FXYYag3kvtxKcFYzKpmhuC03cIdrDdmOFIDv0EAhCAlwDIPApNCp5JtPNfY5PwPKna5Dt5E8k76cRJVhp6X/UOcHSGzkaq/9FzqHyIvxDdwboXNz1Q/Kucw0tIrv58lALjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756300; c=relaxed/simple;
	bh=6dN4XjHr+6OQnOzxmGwMll0VZH7PW0q5aNlxk1E5+Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W62zTxiDjYstXzP7prpEEKy8YBm3oEviqdzwEglNHZFz5yL0U/n+xtwHQRB/c9nIuYT/JNL+MVWC4QdxnjR+IjjLJMAtmGQc8rpvFD//PpUNbvhozELtoB8hq5rewOVW7HsfuMWElATWSNEXHAwLYqEC9lz1acWo8TlJyuAz9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liKAUSj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKBlu6t5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liKAUSj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKBlu6t5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDRdkJ3295185
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=liKAUSj0fGhwnrdz
	tyZen0SYblevWbWtazQX1DnMSZTXAhXUXUwWWOlmvS4oQBzMlB14rIHZVQE7sFrj
	hD2nrkDFohSZZxM/7a57YJMXtujybwEw6LDfEqSvKZ1GOnVd90Ig5F0/933LjkET
	pOGASoW9ZTP5O9ABV1rETkz2CLAsZiu+nrc1UXSRRucdW/ZE/Jop+EFVFukqYOs4
	3bno5WTqr8pgWVTsdXK6dgluusSOQjPVmkhqdUKoTkBNGRD3vX7L0bJPfKFHQ6/i
	X0J+sGY4k8kqKE/KEEu7NI/eANdT2GjWfS/XyxdGCApfLUTZy9CGW6q9s55QhwPj
	IxHpTQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy4acd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:04:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffa0b00da1so8388877137.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756298; x=1774361098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=aKBlu6t5kh7dBoFBIZ+0LGMPxemAQZrr//qCeh7JUDVl9BrHjCy1rqvI04OUQI5pJN
         65Eiey/uyjm5j7lwzrrAyGKx0rl6h/TQQVzY6PGdw9dzleWl+UNa8LzwSJPek2A4KYZi
         9B3o+0plQ/zWcfSVBPyBwUtjFmadmfmlT+1pFX5tEXyE1UlkGdnbh47Iq18Cn6JX61Iw
         LQACSV2vaCRthmqBpJwCZmIirdQPKc6OsxAkCFQqP0S2pu1IlqBK54Wil6lt/3uk1eGT
         RCp3QhdeBZSyWrITe9rQ1aDxzzbBZhUL4ZV2HjvhNPahqKtFZegdEp/0xzjuU8Xi/Eq2
         JibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756298; x=1774361098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=Kf8sgCxWIKl5nnYNXj0lpdtirkMT9LMFB/B/j6GPz1PcQN74yLs284fs/0hNgiQVrW
         ReiWCdwpUKHD1E10w7LYF+tsSOIohStXsFlwMSH4sXy69O2zHCqpF9tQpISL3Ww3GJ1g
         RZtHpMj+wDlARjaKozxxeDoiCWReLEzSrRQVp1NHdvQsHlkc9T0UHNrcz4ntC3fWaAnY
         5j2cc5XrO21X2AhpMQNSbx/uZZ8vA+TmxInXVFCfWSGMNHf+75tVtjY+tCsN9syU2jqQ
         YjK15evthGPpLxmj0cXFJurYHMAPaxYCQ49YNdzPaF4Y2UnPanOWsCyW3wvAxB1dsziK
         tPaw==
X-Forwarded-Encrypted: i=1; AJvYcCXYSRT08hWu9/eMrE+tckqw+4ZRnwRrRpJF8p8FSsqBXDUomygHSSgut5EH8UAUkz6uAc0UFATOKPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX02xNiWRS2XcLHV0gt75mGhthTg13Y3u0dL9HY5MoaJRxgkyu
	2CLZjp0OrjGK8uTTX0LVrdU4J8JBZui7StR0uRF9tFj/uYaAvoNyI8N9ZJBbDfPjC7Y/CmstG12
	Xbxgm9ENlzSTGh6TAUCfPrwwrnEWT0aOeUuMHh9GZ8ktc2sP69vJHY1E1l8AChoI=
X-Gm-Gg: ATEYQzwEQZpz+ghYNHo+9Zo7Gw1LiX/6J51uA+obyJpsCiPdk8mduRolXtQX0wZhXbf
	NKvczkiO1wLOKWhH9gUK/xy+mKSBvcqFKAcmYTHj1XM8dB3GPADy8Oo9wKkBPjerOVTz/wc9Q1A
	8Qz/5QUiD9VGuCPiCOTchp2fqEd9FWutJvRHFy32bQIzSx+bfIeNiugSrVW1t9YaMx9ra3zqY51
	NRooXIF1z0uIekdwPdrfKMP5vaMYoZ+Eev4pZxiN/J165Og12PzBvjcb/pxAJFDH5W/rbR9xarQ
	HdmlPl0ewyeKkTm1n9BmnmeFdgaQZB1u06ptHiMjxuMUqu/ebMwb7CvAnRUj2Yxf6SKinfPs5O6
	reDjBzfTHUhhPAVLgnMgS1fdjSPe9upoXCsJcCUMnVfDywpKC7kKt
X-Received: by 2002:a05:6102:1626:b0:5ff:a34:6ce0 with SMTP id ada2fe7eead31-6020e220116mr6681459137.12.1773756258998;
        Tue, 17 Mar 2026 07:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:5ff:a34:6ce0 with SMTP id ada2fe7eead31-6020e220116mr6675040137.12.1773756174174;
        Tue, 17 Mar 2026 07:02:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:14 +0100
Subject: [PATCH v13 07/12] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-7-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV73iujZQ5OmYbLyGhNvpgHfkyjrM4PJIPIUX
 CAKWC4U0W+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable9wAKCRAFnS7L/zaE
 w+CkD/46HMPC12W0V4MTUjE7Rk/IgkkBeNhNdo/H3IAMjUsoEi7JvMB4HcgQgD97k+fm29N59JX
 aR46Vp6Z5XGMc8x4qg5SjywfxX/wosezI64FMejNfgWypWlunTqo4Q5EoEcGXQQV3Cn3G2KuReA
 GAkucWdzOyWNm+mhxJW+QTIazutS0Der71WjtfY3DJt7b2ts7IGKqINU+gmNOzUHMfS9tM9G+KG
 ENczoKR1rdTX+tUx5T6MaLirm5YOMZQhMJk5pV+pNjpTdV85MyPoL0n2WEpPaBCtMOzl6amLI8s
 1LmcSKvdKjwBfG4ckHRQGyMv/yi9m30GNWdno0b48+qBe5UG8krkd+c6BXvVP8qXDVEjmB8ljBi
 kjeJvZsANSff142+RajX+M+NnkFB6Feoj9lx6cBwB0EuQHwQF5NFWznzcQmlDvfTfHN1bNl9PfS
 lbSl7ygc2fBRQP0gIMvlrebG6YBL7SirsGgi/2cGmD8rchSa+wISYcGInFSPjQzPAoqkY8qoYc5
 YuVXBzHSRFd2yUJElUxCcgV14jGksbPVLzg2bqXHtNLeZHcjZuYM+b4nWAtNPGWp39XE2SnrYMn
 MIyilz4aIrmfIHg2KbiFLMGIB/yMrCDZ/YpJM2CXwlVynf74wjunpjLAONagl+SW+5JE296iY6I
 igYbF8oUxNjwwWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b95f8a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfXwN6CQkj1POcU
 B4nh3/Pape3WlFIrAc9G5i0dkftfr8D7nnZvt459WBG3ADv+U5WL+cIa/EAXKluzYUMYd6uAqSN
 wTEy/LIwcRfBYd7xQwakbu8rnXUT+nI1FWSfWNpnfa9UObhEZNQn8PaBwX6Z72WW0QauiexNJfv
 iWWwfcqplhIZFfz9jlWabuvYe95+/rsf3HKi04+5nDib7kooEz6fkZe7rRR5KYINjXqshkGjJYv
 L7Hn5u+0U9YBbaaLgsd72M5zi2a5imXnLrZurxAmHKyeXRFnbk1ZCLKpi+yN+EX6Rd1PoQOmPLa
 uCCKx6UFQq4j+bPtHpbE6oqPf3W9t3q0djXCWXIXCVYM9qU6XZotA8fgOTxtfIsf/55IKFtdtty
 6LbQlbISTzAuru2hv0wpHNbMsAQnnG23QXCP7/SY14PP1ci00Z931Abi4csadSLNwfl2kJ2zcc/
 s1sogRGfOsMSpZMLWFQ==
X-Proofpoint-ORIG-GUID: bme15nyopMqLhmq3P4zovnxHua9_c1_J
X-Proofpoint-GUID: bme15nyopMqLhmq3P4zovnxHua9_c1_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3

