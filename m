Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4ED37E2F3
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753132; cv=none; b=DfIxsz0t7qhurJcqJe5hFwBn3a9mcbZqH+QB/escOB8cEAoB4FBEMuw2VbAuxEhv9HNR6oY8xXE8TsYm+JTRIaTrkgkcagrHXR9Zn0TVgx4oue+wErFUnV1IQ3Cn/J0JLqDdv4J/coTcaycDb8f4c1lItxEEngNFLk+qDIbIz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753132; c=relaxed/simple;
	bh=YQodrxLZXGti3XmvW8nwU9lpi/9j4ifCS2HxijUaHDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDCPqBN8caLHFNnaVP1ogrKRcxwcCRAhVV1dKV6KUPJ2DumMlEXAPmVUeGXIzH+cX1SQXyZfQf/vCZPcjoFyL6vKKgq8oRlmNAgMvNS6zW9ZQsP72bez9QtRW+bQJheoitnJZ3oPFdm0xAzGe9W5jdO6VVjnW0l24jC2752RRZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu4Jb7gB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbIdnpCd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu4Jb7gB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbIdnpCd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bQLQ3957180
	for <linux-doc@vger.kernel.org>; Mon, 3 Aug 2026 10:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=; b=Vu4Jb7gB3declPWK
	TI3ECB0a8FvuRnE+D/jzRkJmWnbzJac120CngS1IhSZayxc7b9m4tP74KA7HjzI0
	+Hr4EmydHJ/DbcOv5kOQ83iOgtoNvmG06zuFKdriQHYHbp1PSU3aENjow4ucZbmg
	DOidSr8lKRiL8ntegXqq0+5mO0vfXX6G+6pZvhhQQO/38cQ+JB8Kht/drncw1GGJ
	+kWFiQuNIvA0+o773xfVNWk3oNepwb9E151S+Ji/WULvobiHMp7evIdT5hIBn+sx
	4AjzSC2+A1KUEa0UKvSnu4sYplS7jMo07ulsrleYdoBQayosyJwfNMx8AlFfhFyo
	jHfApA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnh16n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 10:32:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso3213741a91.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753128; x=1786357928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=;
        b=cbIdnpCdJdN60W+wVZCuB0cFQzbgYAr1ZjxF7W2lJuF3RhmJWtipwTtFi5jE2HkKEK
         NNbZb4DGAKPnf0/PBRLNXi8KQ5XvDl0KlMq4J6Wo9x1dAqt6s3d5mB05e8ib3AzIE33s
         qLLoWTMOdWqDkZm7yrgwmsrWc8mj5COoP4zLQo4miVdp9Kby9147Jv7inAnYhZaiTqQ0
         iU+JJ/B7LorBsMw5W+4CU7XAvucxU4I843UlOBuzAOgMn/Z2amTX+LGTB8Lu2MtnTbOf
         MHlFYOzzsZn6xnW+itjyBt+PQkquoJtfywPbf+ALq9yueIr1DjWzWgvG2ijvZ4aNJf1K
         YmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753128; x=1786357928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=;
        b=XIXdiJN3HCUtFNt0v+BPZ1aX/qJzR2c43xk313vFLnndO6zuXr+4hekbci/fb4whJC
         hmMclqqlMgE8WuQV4n1mInu+Ursk8314K15YI/eNzuW3yh29xBkyQBnSW9ZtyIpXZJyI
         9Ry8LBubHyckt6yUA2Rwsm2UmUozBMbTcxHck6V1/6ZtEQpwkoaJUbnd0T/aDbNx4YVQ
         +V10zfXV46PmslHTY00pThISFPb2bf+MnRJhu0I8wHEc4xdw53VVAT+ij13VQ01av5z7
         IJQyxanbRkOeGvODCoIhnQacDSGf2DsFMh6e0qrApTbgBVFSMfPaTndn0I6c2wuyrbIX
         8OhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIIxaGF8/x0XhysRKJ+1IfnBxUgix7j1fk5q+nqMHYk6swM2YajZsCJlMBnGg9UMMmymhdlH48g2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YweqtSspkf6PVYgVHDwKDPvAui2oR/pNeXht3iPXSQ12qqp64Og
	eht2WNkA5zP4LAv8nzTjVpOv9+JcGnPEMeOoJ6JutOW7e1tVqaIO52bVgDb/kChu3MjSK4g/K57
	HMukD15pnmff1A7zEoJFvavP8Cmrvy1uzKDducqUYOiRCgO2uykBN6qDBy3qveJA=
X-Gm-Gg: AR+sD13ey2umydPco5t0/1pk2YvMUSe0QfJqGDTfZwxyGnrHByFJJZ3L3Ma1U/PSY/s
	XJU5GvLRBWMT2zjZbaEkzLXXHy+/ArzPX82EoRFBNIgAJ8tUZby3TyKGSQ7dcXvg2m/ER7HEZ3q
	mZzCoSsB9O7a25HDK4y4Q6GhgMP1Cs+aNd3RUlsgi5b4d6aFVqoBB1BdGVA+Dz5CMYS6Bp3S+V7
	hknQjLHB+nd0tpMxuRzmubxHwxKixEnDBbYDD+fgz2Wg0/kQAT7logIemLAe/B7/Ns5l3T//9Zv
	TuEkHgPpGtGt75fsSsONyxukzup3fWna1VcE3KSkj6sAtz06qXblV0/gxP62tUJATmzDYPtPbE2
	nmKG6UlBVoDzMGNcWKxV4di318w==
X-Received: by 2002:a17:90b:58c3:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38fbc4bc3cbmr8623168a91.24.1785753128274;
        Mon, 03 Aug 2026 03:32:08 -0700 (PDT)
X-Received: by 2002:a17:90b:58c3:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38fbc4bc3cbmr8623122a91.24.1785753127669;
        Mon, 03 Aug 2026 03:32:07 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:32:07 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:45 +0530
Subject: [PATCH v2 3/5] PCI: epf-mhi: Use a define for the DMA transfer
 timeout
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-3-c12bb05e42d6@oss.qualcomm.com>
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
In-Reply-To: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=1737;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=YQodrxLZXGti3XmvW8nwU9lpi/9j4ifCS2HxijUaHDk=;
 b=rcBxb1zUyIP4s50AcsJ6tkSwDs7jalf+WtVec3AVWiM+5ZsHiNUzXBYpOlzh8jiw2Jacuj4Ec
 tl6wkE1qXPxBIdwVaF+mpN3ZJYM4JlQEETY7EYgWiO8hxuAAq1WXNMf
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a706e29 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=K2uzCxK3BSS_9ZXfCP0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 2pbhLBgTpQ7m53X2fvCn9HcK0fGOuw2f
X-Proofpoint-ORIG-GUID: 2pbhLBgTpQ7m53X2fvCn9HcK0fGOuw2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX+0/t6VAbJ7T4
 SvkOm9pQBH4OZa4Djcf9yXot8TFyg8BQ3QTNOXOSP17vidnsUekyIbnygTjmTOIhK73J4p+0OwY
 xobXmGRIW+UqhsHSwah7Z477RRLiCXo4ncPgnyGG6RM60OpyDQ/V+u2KKTSZ8JfCeZ4eiFioHTK
 MtPW9R74QxsiPy5FAd3Ik01f7i4GuXdHTfqKkGlKLqqT57BlqQTxknYe8y3Ppnz/dFokC1CBoNI
 xvJ7tgaES2lNghi8NOUWRJu6lvoKsD4VjUhcnFQtZsyrrSN4zRPU34PLY4l40oENPjGPpyz6qhv
 RIrZVou+mlhuKaw4rUMvujv8s3dW0PR/KSxDlQ/cOqtOMcsFFAZMQaTfUBQAI67qrkHGmGn2oqh
 LsJNx7owkI9ncUUaQYhKAjNfZFyE1mooUSaPVRgk0kMoZN/3wBt1NjHzZ3T+FB2/gQ6dxExUPJC
 PN+U5kJ89BZ0rCaUjRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX51NyUFHipFJo
 xLScnLwbFqVAySlYFEvvTiVN1rLCic9o6JIF5Pey8zny+KXZA2gFmbEn1yhyKNvLwPUnCqqgltw
 sJ9PPUed1CfoRnLlH71M9KHN5sgU620=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

The eDMA read and write paths open-code a 1000 ms completion timeout as a
msecs_to_jiffies(1000) literal. Replace both with a
PCI_EPF_MHI_DMA_TIMEOUT_MS define so the value is named and shared. No
functional change.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index c3e3b58fb86cd75e175b69ca45530610c500b99e..6bac69fc84b472c5f1abbeede2b441b5db73c784 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -21,6 +21,8 @@
 /* Platform specific flags */
 #define MHI_EPF_USE_DMA BIT(0)
 
+#define PCI_EPF_MHI_DMA_TIMEOUT_MS 1000
+
 struct pci_epf_mhi_dma_transfer {
 	struct pci_epf_mhi *epf_mhi;
 	struct mhi_ep_buf_info buf_info;
@@ -357,7 +359,7 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 	dma_async_issue_pending(chan);
-	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(1000));
+	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(PCI_EPF_MHI_DMA_TIMEOUT_MS));
 	if (!ret) {
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);
@@ -425,7 +427,7 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 	dma_async_issue_pending(chan);
-	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(1000));
+	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(PCI_EPF_MHI_DMA_TIMEOUT_MS));
 	if (!ret) {
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);

-- 
2.34.1

