Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE13019DA
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138919; cv=none; b=gEzFulQF0sHzxRe62mU27flfvNA+TiN633TsbZ3NzoWBn7K3BPqe9F6Hxnezk9ZzaWo7e8knRGAcDahS4ElrikBKE8u3n+TQML3aAvvQYbLqFTdDph6wHdKBd8UcEZ+fQUDCFSOB/Tid3+1l1BVIdK5rZS3mQmOPITZlKqm6kic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138919; c=relaxed/simple;
	bh=6dN4XjHr+6OQnOzxmGwMll0VZH7PW0q5aNlxk1E5+Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUIntnfeDKvBHnGVwPGOQbc6/sCaaxmQn8k8jWGa7eqkctTHwDrIOdK+RhN0R3oZnWA3/Fy/eNYwR8PPbMCPjJPKLXM3G5/ptRwu2mU8y80ZyQIiwWgBLPXvohwS4oJDC/aSR7wBe2iZqw7RvNABy1tbX4kzsETBQFDxPLcljTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5fqXN0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBmrq6KK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5fqXN0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBmrq6KK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c58E3318932
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=n5fqXN0Bv1w+8CH0
	/TZ9HkqZFss7Hx+yvZ+KsSGXvs/aHLNvPt3++hLfdXNAz48ZTDGjn8PmdRIBYHVb
	b0IkYSx41HEH3I7DkzPodrPATqntLM3uZEmhwYEjcCU9jgZ8SJpVZ7VYDKUY6rll
	5KidemAgIRLq6nZJREjPG18Tg9jD8gWQ14LLP4PusBkKr7x+wRiowIGDIKPT5Qx5
	8KMHGb3MRF5czPTeCJSdWQeDJK8ZpRBoKDpibS5y+ppqmbq0Mb2GiuHJvEbr0MfM
	HyT02UPj75GqzsG7mDLsXa7Juewyo/R18JEDYTFTZZeuOPTO1eVFWxHHAlgM3wSB
	1WvvaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2et7cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4ab58098eso19695981cf.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 02:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138915; x=1766743715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=VBmrq6KKNxm62b1tuNzd/83a9KO19Jxd7bhjI9qS8Yk/gJbL45W+XQ3PNuCYyX1AK4
         YUODTzvIqYaNdAwVy+SWpHWYX7PuBkv/wo/fs3i9ywDfU7sfpqqwRPsh4bBr3ZTAdNhD
         qrVl2VdveE3Zxyu8EaAG/e18kby7vRzp/WxdK05Rh3a0PxMJ8DPXEg5Bg1GwqZrQHs6U
         h9JQW75+dUy/0ZiqMWooMN0NR0uSjsVoMu0F+7TgdbKU7qnRu50mxLo3KshtuX1Ce68/
         gh1E3tE2ax2khAopOh9pOdfrib7/VhhuNCz6VrOfiqE8bDRoRtq6atn4CFGiAyzR7+21
         fPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138915; x=1766743715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=p3LeAlQKRQjsD2OF6P4tnhCqCYzWjkkcWOFr9m1hT5WngXcfyqzCqxN8J7b5qMwLgH
         csCXxNeEE29tZCC+oz8DV8zwRDalMugprKIyck+m5cZ2sIjvStK7TnXNa2FbxW7r4VJr
         LtMmntzSyk9+Fv/6doQaIgaboPY/OaGfhogFLd/xTV23BrjqJFMfkr5SwXAsnYLuvkVB
         NwL04lstmfka8bhYw+sggsyCU71uBZ0Stl28JXUGC0Z/yPs19L5QDDk7h4f9CHRsKDGK
         0MrnM+S9Qbop8BI9N4v7tkN9S3d3iHqLALN7RJ37M5OdHwhPRrAxJLRvW+cZgTTtgaN0
         T8rw==
X-Forwarded-Encrypted: i=1; AJvYcCU+OVShxbkiNFvpaHHowDFemvdT4xXca2Y/Feh4p9X+HFmBTzkuj4lcSL4EviqJkeQkNGXuWFc0pqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTJ1qx/qzwGNEgxe66VcRW0pStoZSvJhxC42DB0EA4blUt8nba
	7WmuDwKofpDPxr9uRu/53jii0lv7Csd4mmYQro5/P8bXNS40qe3TvuGqucc4n4mvopXuVDnR3Kj
	D5XSkr3cKjmF1Eng4YlJ0sm6OMOKHXin+nkK5svKxbKjXIFxqTmAXcYUgynPiqFM=
X-Gm-Gg: AY/fxX5Ow3kqAcH2tq8x/nLXz8M9BwXUvADcAIKaiFkzl2p7JE2B4pfBFxbs0MHLuNA
	sxq7rpk6zgUC5fD2VwDfYKoMYIEEwQvEVAYqvdr5KgaBgbl6mHyXb98CbGUx0/drUtqFzQKhfmk
	cPXpeLe2CmSPzxF/DVtz8xjzi7kObM4puu5R+q09EuRrGGSvZyt9UrNfhZWrnObTugYqNdiKxZq
	U6722tnPH+3iPsxCRR5318/qjnbya3HPIbHdGaBmiGdi1ECrF8wJtrzk4JSQftPEGV/V53Powcs
	zM2kKPVtROMzWibUSytB8zFaefF1SC222+2OwtknUGDILuZpDfNVCN4lk9khuA7SRjkw1HYp/cT
	vx2UFCy9DNqPgkhaUrKao86zPJSGiwrflKpLJAw==
X-Received: by 2002:a05:622a:28f:b0:4ee:1ff0:3799 with SMTP id d75a77b69052e-4f4abd74a55mr29641231cf.44.1766138915315;
        Fri, 19 Dec 2025 02:08:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz4giQwH5X7LuypWLo9U1+fJMoHQI0FlkCPgyAR+B+nIDT3LsZmrmPqVD87xFUXXNPvdXU/Q==
X-Received: by 2002:a05:622a:28f:b0:4ee:1ff0:3799 with SMTP id d75a77b69052e-4f4abd74a55mr29640941cf.44.1766138914836;
        Fri, 19 Dec 2025 02:08:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:45 +0100
Subject: [PATCH v10 06/12] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-6-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQTefcv4cYMI1ZoHjt400fLY9Litr6ZG59Dj
 KtoJRtN6nyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkEwAKCRAFnS7L/zaE
 w7DzEACtc8xd+jyPZoQLMG6DPKT8itC99zs9zfVE3otqbuwsbLdmoFn6MqnzRMuHHe90IBhRJmU
 SY/l7zOg5MDp8BLANHlBm9fqc9xmcqg61MTrzKpM7nYYMJ710O48FZqCl9IDYOhIvETcDh+uqXc
 8oaFJ36UpnKHSoLaigiTalvVx15tY0eZFZc1XGV7O29DQ0gxkVEdl2kjfJBn2PdngFwVINmgJtw
 hMKhhj1reGzd3JaPZbQDjSnFh7mKKKZyP91JnfgXX+vapLLLQDFelirHCPuk4xK023yJkowrz13
 IbItlUbrupdp539e4nSfREzOJonDADg/NiIEwKAcp6dBOubSyviUnfKG6jQ67wguSHDtpW3wpN6
 i+OwT4XyRHAbViqW8isUIo+3mtIxqJnagIuiGWGnWvX/RbLDK2RP1qZop2sTyuY2CJeCyIpPoUi
 5kGt5L5pNb5Q9nSxq9XgZNNmu66T0RK4UpZ0wHS/SHlovNUy+v5muKAHw07Oh6j0RH/fsGHpz8w
 sQLoP+iAZiS6szgaCgTqE9RfvMe/n9W46ZJ84KA3HRzNpilp9zRxIkAyAh3L1w65HyUOdibwWXd
 AUmOIZlJQgL48vmGdtAvxN/HKzwaynU5XNMdb59kXzZ7/RkJSPFeiUXucFHbdnW2Zt4Vx6fPvfs
 t0q5Mk5/jOZHQ+Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 26MZq0Ob3cPesO2PJwfNWj_4tQEFYS-T
X-Proofpoint-ORIG-GUID: 26MZq0Ob3cPesO2PJwfNWj_4tQEFYS-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX2JyEto1Ns8lx
 WaYsqh7lTAW/FJYUfSa9DyjDdKjUTsdRC8lexleo90YFjSZ6HKXYEzSw6dy0+6pBje/ERVJMpJR
 60iuWM1nTLH5GeKcvsGPnnIBnyAUQcZLygYlLjPiqvESUS/I9r2aJqHcF5FuA2NX4LThMxAAR1V
 /5doSmovKZ6KEgebxu2sqL0CLsz3BWdGOLVKlWgTD/M8OwiIWnaStgpe1dHzbwq7drbREcE8PTe
 mqhFXsTVRlnVWkZmxNAgVlyg5IsTx+k01t5g9xJEo7lQqX2NeP7USJzPy3We4R2nYFR+w3Pua4E
 RMKTwvsXjRAMsThw0uvCSLXMyVMPl2DxqB/flAsVns2zHATaIgAOOgGtY4cX1AYmX7MD8L/pyhf
 V++1g+r3vkBu7Vdk5c4bBBjl/r0BtvKx10a5mTkP7LRFHzNZ8oX63tqbjTQqYOKDRdhpF3ix2uP
 rRdxUmDk9NZwRMohljA==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=69452424 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190083

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

