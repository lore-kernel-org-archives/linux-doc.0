Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695119;
	b=PVokxfbxqu3OP7zqxVEQO79z7C4EYBXoeY8LPP8h/WqBuAVKPisLc/SVobZwV6+TdPxt
	 eAMl9oyv4+a0k5XiFDeAh7pyltDWuQFoCaeTlVdRS77oek1T2tRs7RYf9G4xrbfdsJDey
	 uWzg3eXgla0vOlF9q7qmfIBkpuplt2qBo/gbQzjP6Ma9YqVhEoSCbVOKsWakYx1wla8Q7
	 DIVPzikSg57yHOuoKQ5ygwhI2dus8rEKsisNxmWuELMbs7O9yXUNGZxfKXTQAN6rhp5Dt
	 0RvRZ9Jchb6UxU1iyOl9XwfVzMlXFEID3+iZW1VGj8RfUZdjk1+rt3UZ1bJ0SLz8v8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=;
	b=sHnZWLUKYlnCG8Kt0I1cAimhbPd12mYoWBq7EqgLnxgTbf+fvrjkONksRHTeo6vOpkzc
	 ByLdQu88q/xiYAiqS29Uq4LzV7xsElSo/gLE3dUObnnLzc6R6Ti4OF0Nu6g5jD0LSwHl2
	 Dgm5hweHaf2/sj+OLELKh7H9EoWxo639+FkJ4hhvpZ0pdXHe1Kl5/nAg2azrVcDNwb9j6
	 47g37wY0+rEzuUb17IyUIo5/aLwhGljqEqPqn/DvUPqzeO9KY1ZKGdyYjF2pwYMI7GVYf
	 xTYhvNZEkw50f9GPG2uTQv22E7ntW17LMnXeSvqs939Q1bFJuNvaB9U5qVBbIgKxkAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nbyd56U3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVCvNa59;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA56B606A33A
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 12:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA56B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nbyd56U3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVCvNa59
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVNU23893637
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 12:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=; b=Nbyd56U394FEcm0A
	5AK/0bnI5rCiDxK1kRgxf1EFnMIYbBSq3cY7PUvKgnv61I8UoaKnCbq8RrKN+aXI
	ks8uaHQnFddA5OkIMEdYis9rIu1wI2HANgDqnM3DeCRa72abpzzl8OW1HuiS1SMX
	Vk1VGHKKXHubEZqvkY34K4yWrGmmWcv9pk0uLF/7bnb5IOIFRwbhyhfNTtgia4Pw
	0se4oUG1NrOmXCPJbY2BuSJdP16i6y7JD6MwC7wY//6HN82MSz4IIIJF8IK/CEiE
	BanoNMgI9xXLTwPM6niduhZxslJfMkEN8NVIBm8kEeQfoDtZ2t0P4LbD+dqYP70/
	wa4xYA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80rae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 12:11:57 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b155f4eb8eso89315187b3.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 04:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695117; x=1796299917; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=;
        b=WVCvNa59gvmNi9qUh0FXh0s3Kyc/csYxPgmGTZ1uSdtZHWlaU4DyyP8RL+facSn4xR
         zgQ5dzOxf2FGGvRTFE+paMyv8F6+EkerjiuS1VWMfnqbhOfCzkFWiuCj7HxUK2xnieMR
         goO89zjgtzL9fSA9K7jwzRfDpZctcrGvotKeurkKUJWXx8D2lqPLN7C9cecCNACTec3e
         bAQ0RcqfGD7pmBFH36gAGE3VTmXIy0ujaoxmqea84ir6lfaRnD036Q7ayzrWG3e3KmY0
         4CD4o99n2EaP1xW7OVRk+ttaGMrTwZkdIdgSgCwiS0UX6MjiXcGcmB5zv8A3xDlWhorJ
         CHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695117; x=1796299917;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=;
        b=xo5JwCapkdWPpZ/OHYG7TrkrGt2VtaNjkDh+n89Pgx+1EWN8QJaiLmG/u1Gk9zD9BZ
         drvs8ioqyKXnxdKr9NQtIE7tD3cM79Xt1wEnwoi/bkgIS/MBR/BC4tH+Wqi/dGi3oQvN
         E0sUKUscw3Cp0OQZoxkn6Fp8LANwI2molBAm/oH6ihvV0gocV9SzzUgYggnfoSht91/V
         1b+sdWKRSlFC+B/sYzMYWLtmyywErBXVs0U7jY8ga8Vo9p2FpgjN25IBeXEyEKU8RhPU
         CKTBcCxONEE9ySVnOvCEEFn3TDz5kDESaLrsdCQEaxyMk0XurXmqsSchWNe0DkY7jm4/
         ftnQ==
X-Forwarded-Encrypted: i=1; AL+hErHtGWG+nvwLDWsHAQEUdu/scTs1YScQp6PG53u8wyqu7hTLjGO+BMTXLe54xF7gHyKsoh4kY2pi0NI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tIrmz/nfY9u3E1zCr+TzYzVf0cVM+zVrsLtNV7liF5ix+f0hn
	FjLUWJXsMPdqyyq6YfhTdKs/oaQUNspQdIkbfv2u9n3QQSIsREO8a47S2LhTAEyqqKnm/yvgvLa
	qD76EzCwpI2nmiETIlhT+rHuE22+blAiy5ANdYdR9AXrtDvE/AlBt+6KTFT1+HF4=
X-Gm-Gg: AZFdTZfQfMSmNHCCRdyDtv/4i5jNFmlRXmOEbyYmbQt9RTr2ZAS5zsNh4K+zdukfTCH
	rm1sWIxkktVa6ZMAFd9I8hus3y3pH/dKXGK+GYQO5lHWcrpq+P5pd9dZArG9zBPzRNEkzbVctTX
	uk1s73gCIFH6tz2yFObHnjkXiWI8pgd5MmrUXfVWl+zhfZd+2yn1azJsGzS+wtR8CUCf+n7wyqW
	CYigDK+w7h/wfonWEMpqowlkG319v76WKYqPE7Ht/6WOpiK0ucIe583tvo5JIgmSsTNzcLuwmKZ
	Nzqr2cjh5swnT5XRwJnVjH9C1Znd8+ISoEHSSLvgmRvixjOzFVkcJRSY4BpgiwB6ZVBQz9b9iar
	46Qm2AGk+nZpvS6hyWWHwMPckfiHUaJSvPbHNXkyJyCSidvili53DGSU6xVdtB+yQJUMgSrVkQV
	k5pXr/4j52Tw==
X-Received: by 2002:a05:690c:e3cf:b0:8b5:6bf:c396 with SMTP id 00721157ae682-8b52051dd1dmr79066547b3.67.1795695117117;
        Thu, 26 Nov 2026 04:11:57 -0800 (PST)
X-Received: by 2002:a05:690c:e3cf:b0:8b5:6bf:c396 with SMTP id 00721157ae682-8b52051dd1dmr79066347b3.67.1795695116506;
        Thu, 26 Nov 2026 04:11:56 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202cb0b0sm85825557b3.23.2026.11.26.04.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:55 -0800 (PST)
Date: Thu, 26 Nov 2026 07:11:51 -0500
Message-ID: <da5af153e664e882654e7f6068ea7105.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v9 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
In-Reply-To: <DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
 <20261109-rva23u64-hwprobe-v2-v9-3-ae846c5c7178@oss.qualcomm.com>
 <DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: GP-rb7xkZ5-b5XLrfudNWhvYXNOi65EA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX+XDeIHXSGq5J
 Qckp9vpbkvGHQzUQ1M1GMVTRinhk97b+czq2DVYGFmwX6bttT4UWuh9nfrqAAbcDdm00DKMcl86
 vVvKovjhl1ZMVQN3q6lR2s2OiWmGLMs=
X-Proofpoint-GUID: GP-rb7xkZ5-b5XLrfudNWhvYXNOi65EA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX2Tyvm9i8ls75
 Q6BwqWtweaLhUY05w3d+7sMHezhvRLUlIBKe3o3uPNlDgPKd+yJqGDhRnGLY24G0y471A4mGw8w
 I/SkFbs1aEGTRwfpuzFCWTnaYPpB+uFwH7/O4PlMD+vuOthGsWwSauV238Ea/F5njWXyDkf6v5n
 BOU/HEpEwkmY78mLu6sZXCMKJeCS6dxhnTxV5kxc+x0ol5IXuzfNSzoKh5d+6MDI0vL4tuT5Aux
 K/zx9I717hA6F6vfx4LUa1ElvmwN0HzN/4cW5MpMyWUEiWkqXMFWT5EbfMIEhJ1XM90OQlMRZIn
 M0LfgYKkrjPcIB7YqMs7XB2Dv9RVPqd8R3X5pCKJWjORDRXYEpq0q8JuACth1cPhCiWI+LnZnNu
 c3B9gWplncH6trLH1JUlR8/Hc/oqrDLcGrFFn7ddGLZH+z/wk6IVWF7Aav44yEvsz+i8MylRI2o
 1fOe75KWeIaA/AMHFzQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08220d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nOXyh_yiW3yAi_GNl5kA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

Hi Radim,

On Tue, 17 Nov 2026 13:09:47 +0000, Radim Krcmar wrote:
> 2026-11-09T07:47:36-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:

[...]

> > +static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
> > +{
> > +	int cpu;
> > +
> > +	/*
> > +	 * F, D, C, V, Zicbom and Zicboz are RVA23U64 mandatory extensions
> > +	 * that the kernel enables for user mode only when every hart has
> > +	 * them, partly because their enable bits (sstatus.FS/VS,
> > +	 * senvcfg.CBCFE/CBZE) are managed across all harts rather than
> > +	 * per hart.
> > +	 */
> > +	if (base == RISCV_ISA_BASE_RVA23U64 &&
> > +	    !(has_fpu() &&
> > +	      riscv_isa_extension_available(NULL, C) &&
> > +	      has_vector() && riscv_isa_extension_available(NULL, V) &&
> > +	      riscv_isa_extension_available(NULL, ZICBOM) &&
> > +	      riscv_isa_extension_available(NULL, ZICBOZ)))
> > +		return false;
> > +
>
> Looking at the condition, I feel a bit uneasy about code duplication...

Thanks for the review. I had the same feeling, and I agree. I had
considered moving these host-wide checks into a static helper shared
with hwprobe_isa_ext0(), but ...

> > +	for_each_cpu(cpu, cpus) {
> > +		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
> > +			return false;
> > +	}
>
> Could we avoid the isa_bases here and just report the base as a function
> of other hwprobe bits (and the awkward PMLEN)?
>
> I think something like the following would directly make use of any
> fixes we apply to the detection of hwprobe features:
>
>   static bool hwprobe_has_rva23u64(const struct cpumask *cpus) {
>   	/* IMA extensions are required by the kernel. */
>   	return riscv_have_user_pmlen(7) &&
>   	       hwprobe_ext0_has(cpus, RVA23U64_EXT0) &&
>   	       hwprobe_ext1_has(cpus, RVA23U64_EXT1); }
>
> Where the two RVA23U64_EXT are hardcoded bitmasks of RVA32U64 extensions
> and hwprobe_ext_has is tweaked slightly to accept a bitmask and return
> true iff all extensions match.

Your suggestion is better. I will take it in v10.

One small concern is the two hardcoded masks, RVA23U64_EXT0 and
RVA23U64_EXT1: a similar exhaustive list already exists in
riscv_set_isa_bases() in cpufeature.c (patch 1). Merging the two into
one source is not straightforward.

Then again, RVA23 is ratified and the list will not change, so that is
probably acceptable, unless somebody wants to avoid even that level of
duplication, which may not be worth the effort.

Guodong
