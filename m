Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382B4E378C
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196718; cv=none; b=LQEd0SZMZTlx36tpSRHXIgd53QefBEgkiTPz4q4WjysjlkcEHYmm3yO2arIkZtGkUX8NPUks82QLenPNnBEi0GZQuRxwTPYrkOJthi/eG/26LEJxvhbE+BoBN4l5KHAJMBiGgRwcvXjJNFO18XDDsaHzvmLu3iWQyih2OPqWITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196718; c=relaxed/simple;
	bh=ACfjNn0Xmi0xAz9LfKtOCRm3C6QBMsK1YM4epEGgMH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=govgvD4tEE6kEzl/pjExiLHvvcmgB4Hriv/UM8A9Pf5xnMJGH8wxf52IXhmb/Ud95jZXoUSvBKHA4dIrp47F2OJDDy79JYgx2b4xtK0uqEK4IbjazKx7zln1xfr0592BuvOuYe8UGLa9lbqyh8I84KZoQR2fr8IMArNDueuL64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phvzaA6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6rHliRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phvzaA6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6rHliRY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCQ6pS1737124
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnYjXg4+G9V3/qfm1Rdkfn1Xa8dIu/5XX3bTDFJWAzs=; b=phvzaA6yv/M7JJ+4
	DtJZkpZRDrCEE7J5bZF9aTtClkuLwyVtqR0IJZHyZDRPfG8rULQwz9Ijvyec4+qv
	VsgrtpU4BUWO9bd04Gro+RI2QHIPEpH/cCUaijwrKSmR4l2pBZpLlZyZRPYZ8ocD
	I8L+PJbUNArCsfpu53CIpuAmm5PM3yPx4lyMEzCHv6j9nWq9Yxs0kfkK3sVzIRvn
	Vm9++8V7XTZwYOPjhTzPoB/qlL2ldYHeydJqpgsL+hhHe1Yb/vdSiSCPrv4WB+Lo
	5Rv4XiDE2gBxImx6XcIkZ7o4Gc2I7kWjfFUOzuseWgQPmFDYhXFk5VNjt5CaK35i
	EjODww==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju91jn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:35 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6ef62af1so9984618e0c.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196714; x=1779801514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnYjXg4+G9V3/qfm1Rdkfn1Xa8dIu/5XX3bTDFJWAzs=;
        b=i6rHliRY7f6jJK6mTUoKwmVt7pVGQx1SOa2YaU3FuJhsosoQFt84cfNeuPhTMTpTaE
         erkjbKlJB6plg3vCyhs6//ulGSguFJ23uWTd95TrsR3A5yIRgE0v8nxPpEKB0LowkDt1
         IuHJi9op6ewQGdVRJ1oaw9qM+fBN7+7ihL2Lk9rNyYPJ0dDijLmO7v2+BggN2vFnDiT9
         lN37Yjgc7TR1Vu6hfWGV3QbVDdw40zeSZO8pLri8Hm7+yNxurDDZcmQ+J07+H/qrassD
         jZowObe7cx7E5/ZH7AAfBRAww+Mn5bq/WBqxxNh9+PZwIFagCT4kBYcW4kFx/gtdCIeF
         zB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196714; x=1779801514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vnYjXg4+G9V3/qfm1Rdkfn1Xa8dIu/5XX3bTDFJWAzs=;
        b=mGYqYkTPu7Op2PMg+8na0L72KBCVGi/mhzhc18fUfawJG9nm55w2DZu4/z62iTbXsL
         VxKPxyp1Jh8t0hklPd1MbDhbJlCITKiOWrC1KM/Xujc79x44RocN75A7jmbiP+kn/1rM
         tvb22exB7FBgkyu0stlsLqTiJkkOsrUSMQgL69wx3EqFpuZ1/UC0x4LyLpohpTbjhanZ
         4qFiWifaoSffM+VS81YPXfbjx0smKIIncIS99+ctEHxn/Rj0bnAX+xoWKydFByqNEPxT
         UzpoXIViyOo0turXVxhvNO1YKbISiUPVIjXTyThiMoBv5oQOer0Bmc+Nidx5qHslLVYs
         JTvw==
X-Forwarded-Encrypted: i=1; AFNElJ92Yt1PQpAMWWqIzTCyIt+RZDre56csKYpYc3n6c4URwqhYyNENDq+QKY/71CvKW0n/1rRc8pBkwKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPoA21RFeLeu0u/F/gL4XFf3EaIYjXd2AT1yl7Fnx0EMY9+J3X
	/2apKmSXCCIcV7+yL9x6CP1z/Ang0F3nVby6Kusm0o6WLzWPzWj8hnsPFLE0DD9r+QVbG1INJ6E
	/Keu99XMSMcoDmKH0TUhHw9TQmo+YlTyZtEQUeqHMzquOKvU4VbG9tpVim9eUBdO0OrWJB2s=
X-Gm-Gg: Acq92OEpJWH60sR6m+mMQ23gA3DS+n0ulv0YeQ32tmnViLbcGb12+PAoxrt3xH2Uu37
	LOaHFw06RsOyKD50c3SG7/J17L71Y9E+d6bgYXcF2Zohd6B4pqUxJ7qd1s7hXkx9mBcROMLXxFu
	86PFby2uFjpiSoIuADhPVS8+sCFOxnb45egshno8bamKACg33saw5OC6Lra0zEBRQe6G6Rfy4wg
	89endlSJ9kRwWtkbpZOh0Fipx/+gHNWEVyHICdeaA05+3UY3Wsuykykdk9YQQ6zoWY6xHpKPPxj
	3AjzAA3wnA84RNwPDkzF+1+S47so/3u1ilMvYHXTFrterG7jP6vwOrgd0PCZ4KpM5pzKwFEteqf
	VfDmON69pZj2q+Ne2A+P4BNurI6Sf9tRV7NVvzhFoTmnfG0VkmtQ=
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr4550020e0c.11.1779196713914;
        Tue, 19 May 2026 06:18:33 -0700 (PDT)
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr4549992e0c.11.1779196713486;
        Tue, 19 May 2026 06:18:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:54 +0200
Subject: [PATCH v17 12/14] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-12-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LwaqCPG1Aiq/Ip1gw5isqE52deYIfhKxJV8LsPZOfRA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMMgUZBXtAun1WVICmoDrKlYXgwNP/Vtty4q
 LAYL2RvuMSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjDAAKCRAFnS7L/zaE
 w+nED/wOXv46s4GX7vrYvm0ZwRQQQ0Y7E6zST/6NIODzhLlnL+vsiagdUCEyu4PFaZckHGoYQKu
 cNyOGysFV8YV6aI2YIpQTQ2M5sJKPtDd2IXy13as45HSwlRSRV+iULi1SnE7ZU3kaiKb2+k0NsT
 iJxx+NokE9zo0+0+VWFFmgO+pkulbP14peCl6UW4uS0+jC5Q5ND6Bhk9PeoTnHIlbY/a5oiIQqx
 KEHwGQmVoANRMbbaxaH9BzgehT9a/f7BV/DPcGvYfrluShfiQcMJ/ub/Ru4g4pyL1mdhbyETYfM
 YoXa2wI7M7zhA9Stvpj3JJ0Yu7ppCvG/Hck0QmfLvWyc7IVrXfMpJvexhzlTKRsNVZR8wbT1dII
 xtqJL22Rb6+qIgqygmyuzZiiS30nm4HEKAgksbwCTPg3gQM49BWymwUwg0PfbYCNlxVCmyPzNHm
 7WCt/CntNKJYpkGrX0oTVnq9wnHfzK2reZRUW9kUzIh52tm1uMfByu9Y7kCelBuxbrbXxEM3av5
 LvXhZLHGLzTHL9x+j7WR4U4kjyuPWig0Z5Jk8j8ydi5x/GupqP6Z4MIhM0fjGshN1hazJjTt1cF
 BAB3MCZQ9RuGBZLVfazkIJ6mtWx/joYdpNcs4LoyFwFqAN5VTiwkPzCs5/odP0Rp5nIRA9twd2e
 LAGPCYT0mvqtFBA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kTk0u3GSZGNr-c2PSP7YJwK2lfmJVr3-
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c632b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXxfkNTkUzT/Lr
 xgcqOWI85XNTBeQeQ6tg6lJ2j8UDmzlmf5anVog+fGI/tTCJjOf6DckAVEF6owno++phbRsmYBu
 n5UzVisqGz2syOQUYE6eQsd1o/hSK7NG95ymHaCFcKzbVrwGF13ZAbDdIR1ib1zoOX63yYUayCU
 LNIcxDRLBPqt8/Cwij5Gj/CfofFKSP8+4jPNDuoyYbRb9OUa6Lvauamce8ORdZsKFnXXBWJgR/L
 +diJ5HGRxScnhpJvsdCfX/a8lb33AkfJQ0ioNP4piJCkaeFWm2vKm8l7YfG7oLnE08P6gn3Z3eU
 +4xva977/zIfxKAx19hMESWVVa8MD7le4QecBSiv70iO7Itu4GVR5jNgF4DreRR6Jwq2TdV5+Cu
 yPS4OhGNepOs8b9xcDkXsiV3o9i/CQXoA5VWkXUMazll7+6XyQhi5ZMIy4CRY634GP4YPFMg5sC
 ENXb8Ax0cVEGersLKlw==
X-Proofpoint-ORIG-GUID: kTk0u3GSZGNr-c2PSP7YJwK2lfmJVr3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 90f44db6606173d8afbd295a6dadea177b7bcd11..92e551f4570c0c69cbbbb709a0752fbc16c307e5 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -192,10 +192,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -205,7 +214,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -256,6 +265,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3

