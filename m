Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF245D925
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932973; cv=none; b=fCCUS+otPB3omHzTwDo2jPDCwyS4ivcm5Jx9D+QdpdnfSLC7nrEsDPLoMi1FtjDrkgwFWWGfl835z/+vxdakT5keWalmn8SOCyBg8rePDA3+436EpcrZra9k1FyN3u2HQcQWm/MKuT6Kj7YFyWZ1K2Gt5krZ01ptXuw70MYcADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932973; c=relaxed/simple;
	bh=4SJLPX+kwQBXDmR7raZp5aqQUkMqAt7w1SUMljxgVVQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kn29Z01vVLH2NZPvSiQu+UiOQx8dHYVowYxsowFTyzF2bwfoDm2N2kLwwYpq/PCI4on8v3Q7s/aC8WSbxbp1rJe23rc3Oae4mG+9CIrgv086vPxlMVvKLHmQOKBfebWd4lXTKWWivD7aKlB/Zj5JYEk8s8sG64T4qMNIR0IDr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZchkmoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JotvRulk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZchkmoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JotvRulk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jgGV438895
	for <linux-doc@vger.kernel.org>; Fri, 2 Oct 2026 09:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=; b=WZchkmoIHU+qjvdF
	/Z4KPTEmCXryerWgvQ5fMse1US/iYI3wSkEpZRyO9WGoPqieh/8rC8ZVWMQR53lr
	vVUFk2iL9fQeVLXDEmpuSo2Js7cVYiLeHQqNpb43C20c5ZUmXn2YarQfNNEkG68t
	+7SQlclilqHXNy9DFUlBTX1FjK5EJXg4SQcaCzFuK26QOVxPZ0AbXZP7oWjPQD0T
	01n7maRnfDajUkzt6JUfyhrzIJ+C0DdXjqnhRFMAOXFoHjGtujKRYPlcgJxlaRpz
	HFuP6osAGmZzvF542wWwco6DJXMEycU3I/dZwr3M6huYJgtvbMSyVIwZTtx1OfDV
	dEaXfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcku7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 09:22:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so7814535a91.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932966; x=1791537766; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=JotvRulkHjiHwmmf5l3/c617QtvlTcGip8bt7YIUfvxl1ApTVv1JjuejAipLH2BYY+
         JK+12a1EO4FPhBKT2sekbfaxZB+Tqjmz7GZw04+G5BzggYWU0OY+9lCrx7vPU4AVrIT4
         64LHumG5YmNeFPYdthcFth22KGT/DiVEGci4lWKQpeyKHX3ImATs0Mw1RY9KBM4U0hYR
         MhPWJyWcSS8LAXjEVRqjFOzbHcxGDV53XK2DKy8Aw5Ef/sJ4hHTGx3+rUdyEInwF+NIV
         asqCs0PbPFrTfJ2VwB+UUo4AIqVH/lN9tZ3RwlAWyoHJ1B9ULurjXR81nQNzJwxg8b4p
         N84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932966; x=1791537766;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=EPgf6lTkXbyVfPHegFFvJEVdy6P04Ze0anaCU4B7G5EIT0CmnM7o1gZPZ2Vb1fkwrW
         G9vWZSb/IgFsMy3UResm9GkvyIbQ4kXxVeJNcK62bMBLGc950joaeiF0h8HXFkPsuEHg
         dPra+MxvzmFUOFN/frRrYszw1YAQgVY/5tio2NMdrleLkXvIulsPgtb75qYdFwfnAXAi
         C2/kdYBuYdX7tB8gw6Hr64b0AcGnfnYU8GMgWZcKOZd9vnYcV9UscwwB682fSpZJu0Rd
         +4d2H5LTfPFWumT471IkWlcJfrN5xvoTvEN1e/BFIsiswDnWvJAa1KrCRYDPQn2eag+h
         Jwow==
X-Forwarded-Encrypted: i=1; AKwUvBzJCb4hSO5dPoe2yBspuRRbRFfGzXx4An0WkrIp0zZnw8tM2NoV3m8Ft+GynmkOJYUO1G0aFJ6S5nE=@vger.kernel.org
X-Gm-Message-State: AFq9FYICU26rZ6JvOFoFyMLJTDU/LBqk7/mlf0sgYlreA9/x+BBDcvZ2
	wGUF9LO/u/n8Tgm8JmDBLkasUjaL1f8o1WxuJlUlUCmcBxKSEpH31+LckHpJmQAUUCtQ+UedoTi
	+evlY1yWoeFhXVb0mi2c1h7+gBSEBNnnjqefL4I952TaCtDA54rDNFJVFYSFPLYQ=
X-Gm-Gg: AYBFou1Sx0p9R8Fh8LxyCyJBgHaBo91s4OPYIPSm53GZO/SzDtef3wAv00SPMxtIXXC
	NuMcnoeSgEAzm1JvaTGnjqwbwNNcFeIEWdviPEYgwaNOSDEA5pbYeb2R/ipjPaQQbwaDW+yHCDc
	NJoN478FN6ox+6fNeEvjq1/zeXqc7Dz/NFHsP/hwiisuUnlRw40NagMv/PAdsFIP+l9AEaLncnj
	G8ayHAkkT7SUJ8s1Skkcm/izVKRopCk3m9OvRhO3p7lZGup4MYYOtYw0IXpiPSzZxGyIYGcsuZX
	H1Va8G0qlWejMeDRI7giGSzxERJFNP9nXqCwd7olt9anzNqyJ4yNpbxJexZQX5C5H2vGTr0WTbq
	ke3fmfscXkGzU
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834275a91.61.1790932966350;
        Fri, 02 Oct 2026 02:22:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834240a91.61.1790932965653;
        Fri, 02 Oct 2026 02:22:45 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm616096a91.3.2026.10.02.02.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:22:44 -0700 (PDT)
Date: Fri, 02 Oct 2026 05:22:41 -0400
Message-ID: <2f143e2e0698daa43191ff3463e604d2.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: "rkrcmar@qti.qualcomm.com" <rkrcmar@qti.qualcomm.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: TnQseMbTShCS7MvD_PeQ1zoX3jjwSnxI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX8Sq9GSXyFGqh
 ojP7udZIP9Qg2M1jwzDDO3PZEleIrPi2/QVqIEjeiaKoqfAr517rGrPmN+qKnSt/gxeX12a1tId
 ZDcr9gZPTb3fcJRCd2IBBc4LhX76SvM=
X-Proofpoint-GUID: TnQseMbTShCS7MvD_PeQ1zoX3jjwSnxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX8rPQaI4oLmim
 HwTX73fPzCBEChBnca/T8hnvGZILBftcDmiEIaVzTxF/l1ICzrrJVG+iNBkWrZ6xqmqPc1JouF2
 6LsWcGptCX128wnH+uyiR1p4LRcCirnMe6pVRD/QdQ59gQ7HpWOjmTZrSfihGM/1B2NLdTDL12v
 Yu3K8MZPecH9hcqEiznWIbKT45YkijSQWg/E9Sstn/IiHn3Wcr3jeSiQaAwDBLQJfTLi4sVXq2U
 7c+qlXNDt6n1L8O9subxrICkXLOat2H/XwhMB759wuDcatthgywlqjqQ0zvIZeEcLhKClciyED6
 bKjiCKcC5MGKIp3GoLl3vWV3KYbd5bSif6GQgnupXaVjGC4LgGPd353L2cGV0CAE8BM7FjzDgDp
 bsQCM/wyk23PlaePdR1IbennyuYS1YPjhZX3eA7KHBqPHF/BMatpvIHJiqgrInk9tlWtdSPGcXx
 GWpHPUPSRF5ndtgEtVg==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf77e9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=xvfqbYfxAAAA:20
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=iwpyHwDBbu1AC0YlxIwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020037

Hi Radim,

On Tue, 29 Sep 2026 15:12:36 +0000, Radim Krcmar wrote:
> Are we sure that B will always be listed in the ISA string when Zba,
> Zbb, and Zbs are present?

For DT, yes. The binding requires b whenever zba, zbb and zbs are
listed, since commit 0cdb7fc1879b ("dt-bindings: riscv: Add B ISA
extension description").

For ACPI there is no such check. But B is a ratified RVI extension
and RVA23U64 lists it as mandatory [1], so any serious hardware vendor
should respect it. Right?

If the firmware does not advertise B, why should the kernel correct that
for them? This came up in v2 [2], and maybe here I should quote what Conor
said in [3], which I agree with:

" Part of me wants to know why we should be going to a bunch of effort
  to cover up for inaccurate devicetrees etc. Garbage in -> garbage out
  and let them keep the pieces."

[1] https://github.com/riscv/riscv-profiles/releases/tag/rva23-rvb23-ratified
[2] https://lore.kernel.org/linux-riscv/CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com/
[3] https://lore.kernel.org/all/20260604-decency-salaried-4cb69e1c9fa9@spud/

Guodong
