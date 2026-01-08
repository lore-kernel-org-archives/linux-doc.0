Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C643D3A0E99
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865857; cv=none; b=DvmbJzSn8mvNZQZtMdNPFzD4O/L4+yryJFdYhrVG4XFAZTa7g4WKOi5rkEv0/67GvkWojwg00StRQKyeFnUsqiP1POoL7l1bObQlSQvjpxNeyUxehoWOM7BWXqUQ0NWBgpXA6pEfxaYWPaOs7pwW1KZ8Ms7B2g1ahG1yjGXQMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865857; c=relaxed/simple;
	bh=qXV6DUNbL+f+Th6TWepsqauColNIWnAgX/5uLK/gw4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cz5pnf+q8LcRhAd1mLi8ksw9cYvnB/Bfn9Njk5PxY8AkitRtfYwtkt5KJ2jwwEOtkgqWqzdkzT4iFRct5eS33RbHZIZW8+sfmgtldyWD0W8jCSCtZSSKwY+ZrUfG8khmfNGDQE07o6ZLjQbaijfAZhdpCd4v/jP/pTQuABIuRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRk99dkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGSLAuu7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRk99dkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGSLAuu7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VNE11837903
	for <linux-doc@vger.kernel.org>; Thu, 8 Jan 2026 09:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNULNEG+nkj8J9wiTGy8bu7sRj2DD27akkwqGJSkd+4=; b=GRk99dkSQ5gWm1Jw
	gtg5AMwZZXU64BmKoZ98mDnPWRfpCMX5MXBDvsLRET1g6onYWjD/Uf1VPcnVBhzR
	04gss8ZZOuTKaSiLkk7iG1zQlbftTtiBoxrVzTYal4+Bfnit0aOAcM0GoTHPrMwW
	o21zNdv2p3O+n148JqKP05S8dm1tP5c3XccPR8Yx6idqJnd7EiE96i31bLqfN5AM
	7KgadEntgR8Ki/s2lStHaNBtKAXTftF4GvXnSupOFhUmvfdO8tInMOqTy9JNbX0/
	iR0K6ZYDaHTvAOKNuN2TiXQm13b87QUFdUOgxjKA+nkY1DT04YH1ngNTPVA5rOMO
	Ovhp5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8920e68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 09:50:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so966734985a.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 01:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767865844; x=1768470644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNULNEG+nkj8J9wiTGy8bu7sRj2DD27akkwqGJSkd+4=;
        b=cGSLAuu7uAA0pwZsRBcaoyMy68IdkgiV2qE/iTd3MsTG7KTaqlxS2/GMTdRSI/HgGq
         rCxl4II8PA1tRxrYVkB1mjFk/5aXC1bYUKgstBqXO8SJBjPnGzhI+i0HNN6XucCLqKj0
         ann4JyDyrBUFTMRPHc2rs9sJQSMRYlFdeL+ny8bA3wrfM5aTk6uAvilqAv09lgbi8hye
         nUTc8hG4GhzXSx76eMJsW5tOVd1tn2p9rCC5yLDb10X24gVwsyEmPsd6SnwG4kSl4ejq
         HIhZpZFU/II9QCRrOz8AIBiGasSz6eGgbQhNyGKJV+WB6UEs/eBITwXeVHSxawkZXsV0
         awgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865844; x=1768470644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNULNEG+nkj8J9wiTGy8bu7sRj2DD27akkwqGJSkd+4=;
        b=g40KtCoyuPj81i6W0+uyXsmcDm1zPH5elfks6H+LIwJN6tFTxnQsJjMGDD8c7RP69Q
         h+iwGD3gnloOPDwxOCB2lb+VustWufZtvhFZAI7DNTtzu4DkXwjZwehiumpUww4md4Ef
         VP562zCXMZkLE195i4Xu5ak8wMDSvY1+Ldr4yRKFVNtHem6m2NU2iFqRqfQKdRf6bHTZ
         qGMGsUp8iUMb6YivAiL+CsxcmEja4EbFnu9+mEs+xZIsZe3jSbgz3hnl6grvnIyHX2Xf
         5MEM2OP134oe9n1IADHpEeE9wJLW7duDm86HJo1CH+UEYMiQFpYd8q53zGRciqeq3Sl7
         yzxA==
X-Forwarded-Encrypted: i=1; AJvYcCWrta4+PDsvghMxK+j6SZiKQgWGzFzUAdIXMN9Bsx8hyw02iORB4Tm/KO9egxkva366b8/bv01lU1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28vv8Ff2hUfGxs+TNDGEOOHwfAvVDm0hieGGsUgJEO+RUNc/U
	NmHiP83dK0n7f/xrxkp/zQjL/Skess8vX+t7fHhcBuLB1/X8jzzd+Y5gxUyRPGExT3ezZ053ZG2
	4NCaxRSCb6Eu92oSfwqKnBVjcZecEfxSwZoYbIdZH/mdSbNHFW7GGEJ4ETkD84K8=
X-Gm-Gg: AY/fxX47/ZzKKcJhlIHyqLFFBwAOt4Cz+aUkss57m1uAJxpoKl1wKY5AAgss2Z4cNdT
	znmp25kwgxC4GQg12lwVHZyYTLye/YphTbooWAWWvaMbJkuaj9C2cPJFHHNfFL7NRm7NoTx+mns
	Yffhs2MjaIr9c3F5RDdJKna/IkP6twV92yMJgnVO5ZQ8rPgnbIK1QMwCvUH+NG6vSYDM0LoKkkp
	dj9Qi4Jqxz8DGLWGUWPyPLUMLQsFQGYfpKu4QIm+ukBwE4jXwRmjV+UzX6rBYvoHl1F+NPfUYdI
	7IMKknLZAtfZOn2HfNlMI52mSYPg3T/HfYi0TmH9a0AgMA569p7ypwbcBjpV2Y4qSCp9eN6KD8X
	/leYevHbTl++y5U12lFbeDbeKTFK8fU2Lggytr0Q=
X-Received: by 2002:a05:620a:3703:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c389433d04mr713956685a.90.1767865844307;
        Thu, 08 Jan 2026 01:50:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5PF1XE9kRdd9WKzyEqKwPSZ6OfIZCL3efK7ZQ06VKG2/p2eNsnDfGHq7rotJOePmBdekGzQ==
X-Received: by 2002:a05:620a:3703:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c389433d04mr713954785a.90.1767865843822;
        Thu, 08 Jan 2026 01:50:43 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2dfa:dbd0:9cb3:22b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm15308360f8f.29.2026.01.08.01.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:50:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Documentation: gpio: pca953x: clarify interrupt source detection
Date: Thu,  8 Jan 2026 10:50:41 +0100
Message-ID: <176786583791.10451.8759479946329178276.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
References: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f7df5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RKIkRNZpZs9Xr75-G_0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Ktra2B7_h-7NemvNgHQmoHmwRxlQGifZ
X-Proofpoint-GUID: Ktra2B7_h-7NemvNgHQmoHmwRxlQGifZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2NSBTYWx0ZWRfX3gNN2mShERuO
 I8Td/vg1hWQS5EgpXrYmz+jOuPyy4R8bmqaFwxLLolQROo9ShrXGRdsVkA1L2IHVBOJHsTWSdiE
 mLpYk5pI9NxKwFSYmFbQpLVYZFDadP6ZV6wVJHTLgsFr+2wPFjuHw7TnYF2L0u6lSGD0LVaj8jm
 U2KdYksFABI/rMka4SeLRM5ak568/TmwoaKvuxvW5NALkg4mbHTmJEUc7FTmJKe8J2jLDv1O0KR
 OwyLcsPABFFgwfCV5tpjyHKufqw9U134oxyT1tXQdm2PO1t5a8vRH3EC/ORMnV4O5qVErTaWEbs
 7flK+HOwUF/w+z2o0PcE6GQ1ccPH62dMlPNJ6aGYtPQbV9iBbimfAJ6xJzozwMksyDEZ5kUGW97
 Fk41ORra8/MdiuLBxxc/MnM/qEdew5QkIVSZjSwOti1TEWaGjYlElNwRhfHdn2a1qHmNVej2wPf
 p3nhupLwKbn9D2HsWbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080065


On Wed, 07 Jan 2026 10:31:22 +0100, Ernest Van Hoecke wrote:
> There are multiple design tradeoffs and considerations in how the
> PCA953x driver detects the source(s) of an interrupt. This driver
> supports PCAL variants with input latching, a feature that is
> constrained by the fact that the interrupt status and input port
> registers cannot be read atomically. These limits and the design
> decisions deserve an in-depth explanation.
> 
> [...]

Applied, thanks!

[1/1] Documentation: gpio: pca953x: clarify interrupt source detection
      commit: 8ba379879aa3e8cef871fed4a509d4f0a6370e6c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
