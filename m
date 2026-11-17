Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954607;
	b=kDRQjtEnr7qV8IjH8RPTdmuVJWns3kajY5MeROodhNufuGX75cl9pB1yNj69t9Xy3KbA
	 p7ug5Yf67mYEbig+Q3dTW8lz+6DzkgIG8LWmGLqTp7WyxcosWe0aeC9KIJCqDUYFummf9
	 JBdxCSVMhEg//k5yuMVU9BsDx6oFKmJksQymYnMMv3UfFS9laM/CTTWcPM8mom/SzSpOX
	 DvXl3DRAfh139u2KSwoW7nB56dhC+A/r9wF2vbvr6agNXJZ/0QVaIPbQ2Rg8D+znKszU9
	 ldpBczQSlbN3iXjM5mNlZoswaK79MjS3p1wfTbtfkwz9P4szCsUeW7W2e/XLjxIrODw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
	b=dbq67nH7NC63D9zsI6moPz6kc295hYL+PfQNMhNxEhO8q4/mLCAMUHM3nbMBo75gJ4pK
	 G+y/X862xaWTQhYUHGGZOv3z8/q3GjN7ZPdOFLB170MYXUbnvgv5gqZfF8k7UTpIyee8v
	 +n/yraXaB6fl50DF2x1wkzo1bRI7dkuhyqT8SrmH/BPBCLVx8zu7X+l+RPIu8Kq1CdArJ
	 4IYziJJLDQx3+NQ2eW45P1VeuHaGDEkWclumd1W3VYn8yTBCcwNJ80GpySGiW1Vmaaa3i
	 /xTt37j93nuLAnomY9y8kaH69L57/8RpK1D/v8kWS24RWPguqA2uQWCSouWRQ3Hi7Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bOfEnIBU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72D8606A331
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72D8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bOfEnIBU
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1xcv1933383
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=KyDWO0/aXgj
	9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=; b=bOfEnIBUXJ7bXz2NrfMubG5jwGR
	6jN9LTRddaVvweRF6J6poXO1rNj6AwMta2gKHOV3hwyI88N0Ig55OW1IcebZwrtv
	mc6yE82eh5XbzOd8B2PGTR28CGWx1oj9Ay/mzcEzSVSMkGfaG4LYgl+dpJWjuvvD
	V1ZmON0tX1Osf2Lm0wPDir0fCLzcZuRoYUsO1Iy4vMbA9POOA+6JH40mOWi3TCsm
	dRTW56gk4loflTT37NNmVrKcvR2hIuxQKe3hfu01wDEigH9osq5WP3LFJMTv0UCJ
	vUJBimgVSMDyiDFY/PodREJjfSxqnIOleJ/qCq82tGOD/cfLXNpVqmZmpEg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0mn0xt0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800 (PST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso165642a91.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954604; cv=none;
        d=google.com; s=arc-20260327;
        b=gSceDAym9M5qFzvF83hbclOcViycmXm5hyVF4sKC2LPWMlfDCaU4p3V86f5O+sORIW
         e1PBkmncYIAtwU1mWLec1SgGr1p8Q3Us982kWFE+6EECEXar5GdigMPpeAwxPHKXjjnR
         tCdvWxpkKFgvLoWouOqWadcvDeTNpuqV4ByvdWSqLl2Zb6c+xJeYNg3gd6yr+SPx/vTP
         aR8lilJp/WHUi+0bAH6XB6eQMqoYyLXcV/bNOsYHtXAq3d/YIOSv+mblYY7RFngnyz8Q
         szDZseFxWoEOavFZHZ43RPOT2Ncf1vMwsvE2z2QYSBYbbOnBNeuhc1dGx+s2TI7UxgNm
         llzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
        fh=Zfo77tO+t6P9G3sMGlgkkCpJw9rJLM4YiQrjxNFiVdw=;
        b=raRPuihY8nIdjp7IN1DpDPQTvbzHJld5NBsZDWLvsnt0KH0emPiojGvZkHf9p7l+UD
         CsBXiy5ME0pdACnyOm/nG7v11xqSMvbSSy+8+QXf46PWdG8EVZRvimWRC7xXKl8FC1Hp
         bwkc0EVrv6Ic61MLfFzQdhnJe5phb7CIqcPoaexBeJ+FccPWI8K9GXZxvIjyzpndRcCv
         QEa37zkVl2D4+p2J6dqAq2j5I7CwTxFQoGYa1zBBU2iOO5GQ/xcrL1u202u9CEK3MfSP
         9l4NGRxV/YC04yPkpl+TsbvwvFGgZP0IlHNdtfViKhB/5C80iX0fojMuhLbzwQXyoWmo
         QE4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954604; x=1795559404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
        b=CfHm7Hs2FKgK2qaRIc0w8J4+dCFAeR21QBJhqHiWIhDhzoysSmRkczeH7mXs0Dw+22
         fyf01zAFDCNNRvzgxpZltxtqqO7FJFAzdvyW/P1j06dDQzhuxgPxfFzN/VyTN7z1sLqH
         r/EQCmE6ylSvFlBH7O+N32qKcRYTyQdj29mEQvRLWmyD1NBnKSTaB2Smi9N6JOlFEBmr
         bQntDXSr7zIo7inC/ziqL6XHwGhf+pafndO0cQT4w15n5OuF8TvuOYRKUhkNScnuX1ky
         Q3wlX0zBYf+rFWCM0N0YsyczOAWobYW+nLv8U4FOUs910GM7yL00g+uFNzmUO6gtQuQZ
         pzlA==
X-Forwarded-Encrypted: i=1; AL+hErHgUIH/9GwLGUMS/KbCXRQS73CS5xX0Kkv9xW5hqIJzLg0OQ9nvo+heZKhR0A01Ztivzz6fnq5k9Ig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dziEA7ex8dY+aqm6bIjqhDoyb7XPHp3+4fPkzNc97yxO4CwlN
	gTpqx93NysmCwq4Yh5+4NxB7gCaA/C78seNowC+aGxvp7DW8pEGgnzMvkq/E25D3C30+sf8+fcy
	0d+iTPBIl/QQmLh6MCLrhWfIDY47yIHReB/bj1XmvpccD2egq7tRajbK3VlWcPh8N7evYZSn6T4
	kO/VxwTAcnN5OvAzVYnY3WAWg4xkghsiuVhfs=
X-Gm-Gg: AZFdTZfJoaG3pVJ6IwyODhi9qquWccyKHCAEcR09QY3I//9Ee8g4E8ouCQXB1vSPF2Q
	IQEw75ow2Rm6AB86toapLTYDOL5VqDpO521TpPrxoFkxmP3httqdk14rSKjVr/792l08TIAos3+
	Ze92n4SU8+Q1nTpgSMM/gCrq+tl0O9ufQti33vzq7eT9wpGVA8k8SKMRExG9Yq8kr9HDV5TCaKr
	KL+2YE7n921+hBbe0dzFI5n321KBl3rfmkZX3BfEcAah/rvk3M=
X-Received: by 2002:a17:90b:2fcc:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b3d07d93eemr814956a91.51.1794954604516;
        Tue, 17 Nov 2026 14:30:04 -0800 (PST)
X-Received: by 2002:a17:90b:2fcc:b0:3b0:b64e:1e34 with SMTP id
 98e67ed59e1d1-3b3d07d93eemr814926a91.51.1794954604046; Tue, 17 Nov 2026
 14:30:04 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-8-toddfreed@meta.com> <179471270091.2199510.4320994626979041884@kernel.org>
In-Reply-To: <179471270091.2199510.4320994626979041884@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:29:53 -0800
X-Gm-Features: AclHuK8ozq1AL-AsYPXNzCLCrFAtXWz49sr600reWw55cTUb-tnGMH92_LvEb0k
Message-ID: <CADh2yMwoR3ZJUwCSbUuY85qPN=c-TKqb6BZeB87q=B24tTTaRw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfXxBb/H1HW2hN3
 l9+fz1kpeDNnc12yf/x0glAMvh8KsSCFF4dr6oztUIoy+gEXxozIS+b/xuV/i9iXpyyYTzzW5oi
 9WeNx/eDCSkRKJZSVV5KFGbVZE8/pDQ6csd7MPiLE4+/44u3KNOQpGPI7AggwpG7hd8+qYRR9uG
 f/oLy5iDwEYG5bz/4/jFYlOpbHHJDSbiAYUZHVdklpBJ3aMJpJBvkFeibLlXqhLRQGhm6obR0No
 eaEQ7QNSbci8S/uLFArKDRBY09HSW7Bzk/1IBmhYiE0UoiM1AlVwyUnN0sCmqWIdyWRlvu1sFeR
 3oG7Tdney0+1OnvhUu+4YQKti03LMsKw6KqkF3/faB1KqzHP0U9Hyb+XIpWn+KWq9IO5AUfpu6B
 34IHXlFBkNBYvsfCapW8iUmeNFdb7FnLa+6Y8vAhYteiXtp0l3duxgI0E9OZtFeoDRsRYEsl5Xb
 9q5Toc+kMsQgZw6PXnQ==
X-Proofpoint-ORIG-GUID: pXxq7hV6OfR6m2GX-qA5rfHMpxldytYl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX74c/RHwhvR58
 pun+zmvzzejHiGGdWb0Um3O7YZdBBhQagNFO1feVthtOasqKJtDbPi4TMEC2ZUIo/elu8eEbpEz
 6/9f20hK8vbdz153wgzTmW37kigHqbo=
X-Authority-Analysis: v=2.4 cv=HcmB3SE8 c=1 sm=1 tr=0 ts=6afcd56d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=DLdrzcY1xBZ9M_96H7gA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: pXxq7hV6OfR6m2GX-qA5rfHMpxldytYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Is skb_at_tc_ingress() a reliable direction signal for every caller of
> __bpf_redirect()?
>
> tcf_mirred_act() only checks this inside a tc hook, where tc_at_ingress
> is always current. But __bpf_redirect() is also reached from LWT xmit
> programs. lwt_xmit_func_proto() gives those programs bpf_redirect() and
> bpf_clone_redirect(), and BPF_F_INGRESS is an accepted flag:
>
> ...
>
> Without a tc ingress hook on the host-side veth, the same packet and the
> same program get -EINVAL, and the packet is dropped.

Real finding.

This patch was re-posted as a Fix to net as patch2 in the series
"net: don't redirect decrypted skbs to ingress, psp time-wait validator".
This path is addressed there by calling tcx_set_ingress(false) in bpf_xmit().

-Todd
