Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D764F3E639B
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277431; cv=none; b=uyx4xqjMOwmLcu3OIa8aEqwQNBMFnnxgVy3QB2XAv4cRRPJgG/hg3UBDSfnoRLo1mIYSKZwCH94PbpaKJVW9pfZCrUoH+Yg49gAbaCK7m9JjroXohl/ikO7DM6oDhggED+I61lVcaDJXEfD/7i0ZuObFT+bti8Tn0DcY+TzGrSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277431; c=relaxed/simple;
	bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1iqWcVQch2tlKDD+hDYOaMyabRH7Jd02xyxA2rg+LCgvy4IDVqX3yTDLX/YFjedxd8m55wJAOJKlGtMkE2nFMsl6X2Oh08uo9JPeWe0y5Eyii9Gen/6DYulix5hTVfVwQK1kqyxmXuD5t1GH1QEAxXc665ZI12FGPcl1BOW/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gd6Nqypy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAsis9Qt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gd6Nqypy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAsis9Qt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRfb979777
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=Gd6NqypytLZD302v
	Qkye35x7Ez4iGwBsGkaOpzVIqSM6n9IMWBmrgmNApXQzSz8zGkX+WD/mspKT5NwJ
	+kmC9KugKd6XrQ4KD3Jw4mN21uF+mgtq1JaCnqQLxHf42eaXUYOhDxzSY19xHm3z
	8eblrpFCprgqAnWlFCRrTdd7z9BplLjyM77gCPOdta7e0TwFy1PtcO04dwhRpthd
	M1tJNDQmVmraqbATsH0y0ujmmHVIRvoLxkKKgvhUFK6Y1+Qu7XjDxfq6Rx15UM/4
	acOYI/f6x/7kpXnqWYiYVvE3Jnz9xsoaGbjUuwECiWG+g+WC3Zzy7lvc2wROAzdT
	v5gdFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grerd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so13239581cf.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277427; x=1784882227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=GAsis9QtKDpw94kolsdIPZIWn0khNqQlpWNww8ELTT8OEETizp98XP4Xi4WMascG7n
         Y8sUE0VrjiuCoCfh+efyMLwdpBBoOX/o33VTXCG9SiIAKZHSSWShhE5EKuoCYWORFdEi
         b/yHTKGvCo8zoBABuEcAenwgMf5X/pB5DH4nKwqsjswSCtgT4FTjNMps3/Gikoj3Zu54
         HlP35WPXvtTCx1UGDeFQu1pk5pgyIAqz2PyQrNQrfsFez17tjcB5DRorDM04/x643Zjd
         1CbiqM5AcMJIJqOVaNt0EyrROmWKsqUjQzftR5KIWglr3gXozNT0LNKxCWFYPnuqF1Qq
         kkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277427; x=1784882227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=S0pzrCyWuRDVf9lPpIHAAa6VNaZ4Kg2/izO5mB95m6rLqe7/YCncJ55S1TDfE51pQ4
         75n3Ms4plxeI7hzzkyGCHmNy9Iexhpjh51KACSviCGNpTn/h+PhvnAkKi7h5RXzBa54E
         Ei2M0HvdyEjlSCBCLzVKAh+JY/RIEYE8d6eKfs01eZIWm/nOrzHu9IlZmpKa1wcHlWIH
         ZEnvRl9PnMQf+XpGgKUjx6eejdtBQLT6sJOHbffuJaxZ3/+EMRK5TtMi4Ut1nIcgWqQq
         kjjDqUeTspE2tfk/8XrT6QAqiOurwTIobHbGBRqFDe2Q/r8ZyXdEUnbEfXGv5BUKOkv2
         TPzg==
X-Forwarded-Encrypted: i=1; AHgh+RrAdvzYb8tGqEuGUighlVzHg+2HxHU5iw62FGT/4/cCrGyiEJu4l1FmpxB5FdKWNqSKemRlpTxWSWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1oivjQv0tZcoGGPinHsZf7frViQvlNhONTdHqDQzV8fNXCu/A
	gqxKKow/mV3u4Ax1eHKmpFHP7xI47MwxiVoSu9lneFqWAyjRGORfIhE69nuhLBN6z7Kw496Tl8V
	ZIkRy/eFstRuqudrcWPt17rvbH8tB08N5zBowHZG1PCpJWJh0mKfimWwbEm31bY0=
X-Gm-Gg: AfdE7clpjtDrJrUKDOorZz2zpzfDLrFhSLraMSKy+YSGpr/HTHHOnLaeYejxJ7CuLXL
	NPNRpjryKpMEj2ldGh+0dpZZ/9FOxAyTW1clXf+mEV0L+ifyIyFRmwy9UXsprAmuhLqVJwknL1q
	sgb+KW6J5mK2o3fSgnk4iqzfa4mULqqIT8lIrZyjSR8WUEXPPNsVJ+zpgT6V6UJYkes5Z1IzwNk
	ALg+1RTPAee+lDXcDGbxPCKE+7lumsps/nWlGoHH4H9NQEudOotS27DFXeVxM7Me1sRKo752D0H
	DJSu0ubO1jtxfrbGicEzRmvs6uxOcPrIlv64lWRC534SVw6wkKZSyauAmHYE9ZZi4aHWmEHCfjr
	99OUscjMu1nyMMGD0V8eVDGoK7msAxg==
X-Received: by 2002:a05:622a:1f0d:b0:516:d612:d1c4 with SMTP id d75a77b69052e-5213c7e66a3mr12659841cf.52.1784277426923;
        Fri, 17 Jul 2026 01:37:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:516:d612:d1c4 with SMTP id d75a77b69052e-5213c7e66a3mr12659571cf.52.1784277426562;
        Fri, 17 Jul 2026 01:37:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:33 +0200
Subject: [PATCH v22 07/14] crypto: qce - Cancel work on device detach
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-7-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemc0P3SnZ9wy0mPwcL77Z76UG5IdlhsK5Sjk
 xZqGVduK4aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnAAKCRAFnS7L/zaE
 wxwAD/90AXSH9lEsDxj4Nft5qs4JSqVCQo3d3zYtyaA7pli73663N0ILffraQmkUAKEuXJzIOSD
 g2CWzgFUiAKKquupkKpdoEbUz+E9JreWCzh3S8khnVUD4uwPlOBf+cXqCsYj5peNHMdhFPPcEWL
 pbV9a9/W2/XTp3fuZbY9hiiICXIQcWSoZE72j/8+ZJAbpOBOmFsYlsa3LU6+Ij0AhczKZHs3j6T
 dDpugoE9xCC1O85mpfFSNTXb29FVneI+d5W1cnolXjwxe1291mFmyfhA/B9ct37/QFd7rDZ3I8d
 Q2QR7puFiZKlbc5edThli44U/iazMeW7737oRS8H7TpOW5wx4HU5cMl066iguW4GBC9VkbTRFgL
 9YnaODiC3FgMEWPJirJufbeA3ZYvZe1kBUjT4sGWw67FoGBAuZkQWs8RWEp1CU8yUi35NbD2CDl
 Yl8pnBXco/flloL5BxbaOtoAVec0+yMzZdMjOUlfd7Kw1C1lLCmgsuFX6yODNaU0wjGx9IPe/YI
 gq1auddOs9yTTRD/9+bP7OLfY0OTdikVhqTAlGvMlgj8P2pgO6eP6Y+Pmf4Fvj2EvrqAsiEAed+
 K+hS9lc7EHhEiylciEwaUXLryhTP0WDyrOycsb8ZtnmoSxIQ2I+hvqO1sH7l+vrcfq4zacJNzQJ
 dx1R7bRGxy60Bbw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX4sNdyh3uqrcR
 EXtDXhP2W57Y+CBw9mvUoGJ8x4YqzQAze8sqCJLRvAUnYjDmu7gKYkSplUY6YOTG7fH/RM1zADh
 L5TeOrg8yN6eEfGymCfotRKIKkmN/2Y=
X-Proofpoint-ORIG-GUID: 9S071nHEX9xUlMZMvjnyeuFVzlxV0D-O
X-Proofpoint-GUID: 9S071nHEX9xUlMZMvjnyeuFVzlxV0D-O
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59e9b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXyYN3TbSL3rNq
 h/TpHVMGgcvuID4oYQ1Dy0H3CuSj0BViRza+al9pMV7u27cLKCSPh+MTpymEtfxoL0kjOC8UHlh
 DbOTQ3DMXhJP1HYz25si+BPJOl5o9N2EkBdX52MdZFDWTydQnBMi3BJsP83MV6xEZEeVj8xLCxc
 r9FmzLw79STEjk7LIZ+2o9EkTjxCGASK3xNGeOma+bdC9mndAam1Dz6qwLn8H/tly+6w22uzqa5
 TFJ5YTwjthOB+AwxI3rUnz/bwJz6D8hwpzv0OHNriny+dQlRxojn3gsunAncicnnP8TWoZlGnU8
 NJIx50iJ/sspBVEnPUmnEM9/xy6WKFLVtTL86IAbIjqwMFFqbK2AhWgmWGlSJkbx6Y5ApSh8zQi
 7mwMKDxPA4TXfzVLuqVUv8WMLEfD35Fyx/eiHjQODghtZSGnn1v/tW/JBsdvAdknaBKK4V73GTv
 P4dmfEQvW1HqWkoR2ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated. Make sure we do terminate all
transfers in qce_dma_release() devres action.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 drivers/crypto/qce/dma.c  |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ac74f69914d6175b39ccde43f16269570fbcf715..b52a26ffff5ee733adcf4e8cf8bef75018dfa63e 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,6 +185,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -226,6 +233,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&qce->done_work, qce_req_done_work);
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	ret = devm_qce_dma_request(qce->dev, &qce->dma);
 	if (ret)
 		return ret;
@@ -238,7 +250,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -13,6 +13,8 @@ static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
 
+	dmaengine_terminate_sync(dma->txchan);
+	dmaengine_terminate_sync(dma->rxchan);
 	dma_release_channel(dma->txchan);
 	dma_release_channel(dma->rxchan);
 	kfree(dma->result_buf);

-- 
2.47.3

