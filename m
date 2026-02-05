Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7F241C314
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303398; cv=none; b=nW+8uOoVe2TqGK4HAlVMn6X6J9+87wxnmg0KcjSKwqrsy1wDaMOO/5aGjPzxPjPwcvcRdRSYXoOvpEIP8lRCBYyFCtbeE8lAetMWVCWCiEBCYf9fgOoylAqsHeBlO2itJfjLPGAM/oqMqstkt1RWmZoHOBYgUFzlQUjogxZbL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303398; c=relaxed/simple;
	bh=atub9o0Gb6IvRtnk8EumK9kYmYXe/E0BJsF031KmnIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV7dkZETDq4FLJoV4IDzi4UGFPd0+44faa02iJzKE9g/wk3lexosnjU+7I96T2hUL6y2EZvF6RL0gGTcIr1FHOpWG7eymckBxJxJWx97iKxQSPhKHhvUP7eP/E5ly6vmB/HjBmLOL/nm2U78weZQrf7969CV+GURDEPtRjOOsDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/rALWxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxBugaCd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/rALWxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxBugaCd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BedF02158155
	for <linux-doc@vger.kernel.org>; Thu, 5 Feb 2026 14:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9g6+zH9yTy+gqiQg02/erDU6
	iT9X69ZdnysU8cGq/4k=; b=H/rALWxp2l6X54hT7X5f0Pe16GD/FTZddeL+7ndP
	GO5q0vqJu75qA6yRtJITBurImTgWxYB+/gvSu6b/9irQ8rkIsWByGEgYcvp2/wyc
	m+wuWYFG6gewptipkrCkvPZCIpWipejGYymc9JoFDaa67mKWFS7CIh1VoLGexZFM
	hDzdMogstPzZ3fUpyd9boZoux4r5NMUsgP6MIDNXDFIH8jBM5UFziM2Yc03RE8dz
	EQ/yHKTJKeNBoI8c4oDrQyUYhZbQimMZ2G/+aADOv+U7tPD57nn702DYknUI5WR+
	wAhAMTvyNdncZyusJpJJ4KX96WOTSySErcv/cY11Uvv2PA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4gyntagh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 14:56:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124627fc58dso2034582c88.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 06:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303396; x=1770908196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9g6+zH9yTy+gqiQg02/erDU6iT9X69ZdnysU8cGq/4k=;
        b=PxBugaCdkxqaG+ymtjD+Q/tSkPUMRBfD08d06sZhsS+wK+MnlJDkOOBneYTWLbxj3O
         SwDfqJu0Iavan6eWLAM2n9FlI/JeK/Rxlmh4ABZokI72TQ84R3/LWv5I9PjI7b6gR7h/
         Abz0GTySud8CNK/aW5wT18M38f80HKdIj95VgdR8Nl39iEEc6Q+bi2FAS1VkC30AyXP3
         xHj//Z+Zt8DSH8aW62pPZjSQzbN6HbPdiYsLK1PtsfmyVkPL4XyVcSSXR1UVxkZ6mEYm
         BIGQKA0XzkYyTX4bRDqhdNgXEA9dn6SGVks1KG6z2FAH5blbAY+5S9iCofIONqXHmN19
         mcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303396; x=1770908196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9g6+zH9yTy+gqiQg02/erDU6iT9X69ZdnysU8cGq/4k=;
        b=AWpX33fuoMzAVGR/uLdTGAMYc4OhVfuvgzXz6U5w4A/ca6bZTT9Bc1YpuEw+u+U5Fx
         QCF/EE71Ladz86WNddfn3F14pHPWdmub9qPtSDOG609eVj9T+E+J7d6XRi6gduxCTknl
         /eO9q0KFi/G/FFxOuxEYSKIeDEiQymymUTImt6J0914SytE0cTXl3MofIZG3+dOXPyVC
         +BSQzzKPMpvm2aRvX298x5sTQ+58IfumD0yiZmYse58R+pabV0/6e3DvVaUKZPanEWWG
         e+IO4bZoMiUANlZKfLLN1NZuKiZXntVPE7sUk70XSDBtqt6mmmg/J/5CrhwgtdM13/eY
         Jlow==
X-Forwarded-Encrypted: i=1; AJvYcCVUVplsy4vqHB3AawEFE263uAx5Rb7WvQ1yhMuqUEwUm6+TrpqokmWGnH2ETQeJ252AUDcRL4AA4kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT7FcT3y1z37SjZKMeImXCFMRmVg6+q+y3E+GKX4SFBZ6hBIVI
	CmB0MXaUjVk4zK0bDyMrQbt+XuSRRkzeK3u3KNNXf6Qalm0ywWp8HCbQllb+NRXYsn1I3KArWgW
	smQZPBBSfus0PYi8zQs1TGoSCw7pBC0Pv4WEsEqfJ4Z2rrQ7XL0APCn8WZytCK5M=
X-Gm-Gg: AZuq6aJAG/SgRVLjC1Wiri6y92IQ3KlrMLwU7k6G28Eh7eX8QJj+KyuocWDOo7Y+Nic
	aKI2W047bLsROayejvByndAL//RY7XWyoS+YMT5KpYXeaHDWN/8juqsg+ThvyJt334gka1imh2W
	GnaXFjKJOea4Ml7l8I8mG87omKIET4+U6wdcGXOel1t6tjZau65Q6h3fJnKbkxe00fEfOKRrape
	scK/q73B7W0wx2gEwu+wUk98PE+ExkvMj7tBfyLukZye3i6x5UiKLwNE28b3YJQUeNNuGkW6pP2
	Nag+oaRXAl9hyZp+UJjhuFGY1ZNUGEVtd/j7+gFhx+DMzaqz1swcRuRQb1g3CqnW7hlXSk1a2mT
	BbkvRNTFL6Y3dDMOLqYE=
X-Received: by 2002:a05:7022:f90:b0:119:e56b:98a1 with SMTP id a92af1059eb24-126f4780c3bmr2575067c88.8.1770303396094;
        Thu, 05 Feb 2026 06:56:36 -0800 (PST)
X-Received: by 2002:a05:7022:f90:b0:119:e56b:98a1 with SMTP id a92af1059eb24-126f4780c3bmr2575043c88.8.1770303395516;
        Thu, 05 Feb 2026 06:56:35 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503e5aasm4543164c88.14.2026.02.05.06.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:56:35 -0800 (PST)
Date: Thu, 5 Feb 2026 08:56:33 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Support runtime configuration for per-VM's HGATP
 mode
Message-ID: <vgqqpqfqin34stqyd2gdqxiopw6vornjpmomuyctx7ngbtjj5t@ly4avedudyrx>
References: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMyBTYWx0ZWRfX3KDrV4KN/tfT
 AL8xmAJgBf/Pwibtiq/JE3L7fz0V53A/4NXErLO0R9bE4QQ16Q7YLjIpDig5VyKINy1NWg7yZRW
 vSC7gyGHVNVkV0mx9w3ubNhuwnImsEsoj50PqVN3wyOgdj1FLvdzw5Haw9kBQX9iDSNkbXMUYZ9
 UL4Qf9vOwUqgBc02iXVcjJ/MkZioaUvp814cgXFLeSYKjCrOzrL/9rICZf0IdyNbX6oj2/nSHUZ
 XwXO6CTqMlS31RA7ok7rDy0++mLEAIYT48IbxzU+dQeXS1YiuEPsOIY3VKMs6qi9qB7d3bdPQ+P
 gXJzpEyxEc1TZD8AzdymALc3T0l30Q53jKSjRCLBL4G1HmpLAvQ8TQPn1N8nPoCAB+SYBysr32V
 uzhGaRjlIIrMzDQlu0epAr3FPYkkmjnfocU8xg6ahcwQQQ0QK2UeFkccokVdf+0BnNws+iqdpGn
 gCa7R8dAdd5w8TSgneg==
X-Authority-Analysis: v=2.4 cv=GdcaXAXL c=1 sm=1 tr=0 ts=6984afa5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=pZlcIiJjb0-w25zZ6xIA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: XRZmjhCKJTXrxxverHUyzAP3WlzlZ0rF
X-Proofpoint-GUID: XRZmjhCKJTXrxxverHUyzAP3WlzlZ0rF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050113

On Wed, Feb 04, 2026 at 09:45:04PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Currently, RISC-V KVM hardcodes the G-stage page table format (HGATP mode)
> to the maximum mode detected at boot time (e.g., SV57x4 if supported). but
> often such a wide GPA is unnecessary, just as a host sometimes doesn't need
> sv57.
> 
> This patch introduces per-VM configurability of the G-stage mode via a new
> KVM capability: KVM_CAP_RISCV_SET_HGATP_MODE. User-space can now explicitly
> request a specific HGATP mode (SV39x4, SV48x4, SV57x4 or SV32x4) during
> VM creation.
> 

For the series,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
