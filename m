Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC035B144
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831020; cv=none; b=FYYnpeBvEQZoRUL/UefOfGm/2Fs8o2Gl1q2Tjd8fPFAkARhP+Eh0I3B6nrskNqdea6QK2mwLA9xDMy36wjTW8NPl3HyxzfxgLo/5qV/0eObaWE9TzcTUqmo8di1GSNeTTqsRv74RsQN2DocgQSzXKGu6uaml9JAuDodDu8sfG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831020; c=relaxed/simple;
	bh=uTifstwqcxDe34MVSGSAa6Bd9avK6jnPS92qPWylIuI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=pyyEM778WGe1d5U+/yr7rWAJHMBJEu5AW1AwoqvNY/bbHFHiQXLO37fo3KiUbtiluoMGvft9MfAROi3216ySv1qBRbUWxcSqDGiFia7BUx4wEwLZ0bYdabDL0YO9eI2ZQB1bqt6UTPgzU7vj+WIBwxZ50e6KmO/KIGeyMCfCO9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArzAWxLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzPfDYnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArzAWxLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzPfDYnx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAJg0I1531138
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 13:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UbL31uTRGt8/LXTIbFWHOufRJpptJFeRKcwRPHZdYLQ=; b=ArzAWxLG2+NyXBFe
	Cb9DXDSAbb/37WkBnLF/0v0z+hur8mwZsy6s5GgflucGBw74NnX1MIqWYweZqVoi
	CYTPNQBiXFn3YWf/9AnjdUslkV/1+BoYuEOsgJL+/uVUQ/0+kfhBPOn8nGvX/hG2
	L3Qc548DH3Z+laJGdVIx7SAHiVWfRfqbK6mt1bPGqt8VX2XZdIWux6Gi88Y4otZh
	VdZMqvrzyXZLxfHodoSog4LP1vZW8cAjD5BLq7rgY8RhweLjDzMWSNWIbjRWuoSX
	87QUzsstPy/0dzmWLacemLsS1Q+QLVBBtLff2BNE8qyshIXHn633HvtZbJHVUQPs
	vL2Kdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxrjny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 13:56:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b4058909so434817285a.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 05:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768831018; x=1769435818; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbL31uTRGt8/LXTIbFWHOufRJpptJFeRKcwRPHZdYLQ=;
        b=NzPfDYnxWbQSgx9lGIuy/gBGMhzpqhQxiR678b1raDaDdOCgb5dC90tUk2VZ6sCCtD
         o0XeoKYrCMfkTTMdx9yi2DQbouaTKkjPcosOajKGenRKgD1pyc0iG0ZAdp8VMIMfazeW
         0eZtPjAhpVxAXRVaRjTLiQpEYXbB9la33c3UIYbspSq50GvvXqkLmmcfGLUtkakZa9t1
         PoOadzMMJuadhD7LfSucI/t7nyrJm367OMQjoNs4w4NafSKHJ6KvgqLodUr/HsXipBCu
         DUQ0PNVkzQ84JWr6cY2lMSUeVDy82wA6KvmtC4wJEuck/sHxGWy4gC65KB1e+HOMUA6K
         f0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831018; x=1769435818;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UbL31uTRGt8/LXTIbFWHOufRJpptJFeRKcwRPHZdYLQ=;
        b=M7LL/CjT9e1YFGs0rXNXfqe2a5ps262GFUdpmzd2IIcVewTRLAr2NN52HTOnsDZRkz
         PgrO86lhofmtADYbRge2X1CUuIp0wXL0SH2mvRCv4nxgtuCjqGA7dA+ySwo3Ao+LOm7g
         i60re9wIjqZgtlXp81olsElUW0g0Y2vR4If0ggFmDdWf5ExNg2tFNBWNGoKLDsJmL9uL
         XN1CkD2qlUd8kukTPEzIPjNAmvMigzM66OgetC+QLNQb+Zdmo772wsAlCFP96tj8WIh3
         5s768Bx2W6gN3Xnx9nT63s3VtuwvnEVp2YtTTxsbNO+hKhlzaOBLP22S6eNLwUWUIHLB
         kUEg==
X-Forwarded-Encrypted: i=1; AJvYcCUGCT3+686DCQwOctrKiHmjXsB+35mWRsWYZByI6ipgY8Vp2qIfuqEDlGnO+//dWnO8vSav33k7L5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YysV7Nt1ktg7eK8Lz3COXmFA1VV11d9F6DlYGFsRWcLBXNgaKXS
	eJx3ZCteE9krb5e5yEinlah7bgvQPH215l59pERzsOHZ++NBYtzM4VvndVV5CobiTNKl57hoYwT
	xlDky3t7CX+hbLGKZ7OKbJOX82H9RODiZbJzBfqh2sOV7nUPJ1lK73hw9n+pAo/Q=
X-Gm-Gg: AY/fxX5mMNYJ6t0ERQX6AJSKH90kdmicbORphVop6MWR0owqDWzK3Ov3wx+gOv8M1u3
	pxMhX/l835Jm2B0pUwzgwvotifo4yywhn5MEwIrN3cfeGKOt2ernoG31zm9ChDXrrBRVKgArted
	K2QmyyOFdP/wwoxxgIfgYf7kZmw1baUC2yOkb5EUvy/BigWasDi4swBscd0Yyc1kf4YXfmYp69H
	6l4nJ+AubTUqjGXtiDXOmEIa01qPqe8h1ywXMYQb5/nWEYR2AVJ6BJ5KVJWQSJLxHDwkUMI+NRX
	xoP1H945XaTPQdVG26/YBm7qFsiNvueUXJiuZHOrxE8jfe5UuFHrsJST0FvnMUS+nnzfCMYsim4
	7dQzqD9uGu3DP5cp9CLvEIhP3jvULSrYRmJLQKPYsYaa9Va8p
X-Received: by 2002:a05:620a:3953:b0:8c6:a5aa:465c with SMTP id af79cd13be357-8c6a676df81mr1514904085a.55.1768831017645;
        Mon, 19 Jan 2026 05:56:57 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8c6:a5aa:465c with SMTP id af79cd13be357-8c6a676df81mr1514901485a.55.1768831017126;
        Mon, 19 Jan 2026 05:56:57 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e86c1b2sm190952425e9.3.2026.01.19.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:56:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 13:56:55 +0000
Message-Id: <DFSM9IHXY24S.3W4T39VHEH420@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>, <rkrcmar@ventanamicro.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
References: <20260105143232.76715-1-fangyu.yu@linux.alibaba.com>
 <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNiBTYWx0ZWRfXxyEClPoGt/Ux
 C4KhW1TOgMmXIvV1EiGZcNT1Cb3w2e2azU2mlRCRLy8ViIPbm4y6sBaccyY56tvTj05a099gf34
 w6Si9RqikIbgiwyejX+n2iobowsONU/1Qsi98cPCa6YhIJRiHQ9vtlMWqc37Y25rMEH+A2Uvs7a
 bze7VOisBKWPuag2ToaiIrNh6dsAmccsqLrUipQgxAm50p0PgMqXFIkAQV3tG6ZbHmxJUTFjuaL
 59+8YY40I6PU1BrPz9dmULihwwFerz7AbHiPYH0GtVMyu21NkBEVwqGQmg9/UX8iqtw/TLef0+J
 S8w1kgjN4zjx+7MkH13hyi2ifhj4HLNg6b9cwDe5scST4wvt/TyhpWnHh73CuNiltOWiKM53ij9
 iUh669bjZ5+5CBohOBTPJQnVr3lFJDRYdQ36clRvQhUhVz40L/KM7sraWu2ZaY6Vcu+MItJBNAI
 jtEjgIWncnhkARqLWxA==
X-Proofpoint-GUID: 7dFogm0IUfLJiUGFBujErUt3mVafVGPw
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e382a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=kNzBq6KntmL7tATRjgYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7dFogm0IUfLJiUGFBujErUt3mVafVGPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190116

2026-01-05T22:32:32+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> This capability allows userspace to explicitly select the HGATP mode
> for the VM. The selected mode must be less than or equal to the max
> HGATP mode supported by the hardware. This capability must be enabled
> before creating any vCPUs, and can only be set once per VM.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -212,12 +219,27 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, l=
ong ext)
> =20
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	if (cap->flags)
> +		return -EINVAL;
>  	switch (cap->cap) {
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
> +			cap->args[0] > kvm_riscv_gstage_max_mode)
> +			return -EINVAL;
> +		if (kvm->arch.gstage_mode_initialized)
> +			return 0;

"must be enabled before creating any vCPUs" check is missing.

> +		kvm->arch.gstage_mode_initialized =3D true;
> +		kvm->arch.kvm_riscv_gstage_mode =3D cap->args[0];
> +		kvm->arch.kvm_riscv_gstage_pgd_levels =3D 3 +
> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;

Even before creating VCPUs, I don't see enough protections to make this
work.

Userspace can only provide a hint about the physical address space size
before any other KVM code could have acted on the information.
It would be a serious issue if some code would operate on hgatp as if it
were X and others as Y.

The simplest solution would be to ensure that the CAP_SET VM ioctl can
only be executed before any other IOCTL, but a change in generic code to
achieve it would be frowned upon...
I would recommend looking at kvm_are_all_memslots_empty() first, as it's
quite likely that it could be sufficient for the purposes of changing
hgatp.

Thanks.
