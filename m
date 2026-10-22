Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792629124;
	b=IMI3GNvrx+7n/GqO4qpLkOsRwds/c/GUnHaJe6b7FmIgX5dUOciXtRkXyZ5MVIlSUpoL
	 FZrEF5xNPYy/tDQBZCMtrYTFAjgHPvrnjWNOcj0S+XUyeCMYPqzVrCnWlCqUztKv4CHpf
	 dKXPVD8hHV7JIcPYBVHp2h54MRemfa8AjhC6ztxmwjYG+IpFV67AOd8Vt4qdLzG1DcdtL
	 2gF90zK+nNpeFpmrZgdjpqhQf7UpXGJldjEKf80mrT3TNucV7qhjaCjl1gf2baxy6Hbdf
	 YgmO91ad/SG6ACna1qECPeUPwDwzdkiiPSSt/6lAT9HbYbCX7fKI6Z+XSYozRLCygrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792629124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H/opNow+kHytu3G/NcD0sUoEO+o11bnVvWNwj42+U14=;
	b=dTJLcx3Uu7eedTUn0uHZKfMAi7Gadpt/ApQdANERhsunqOn8CbfI5beL0cP7n24T119h
	 gn6l1RmkI9ubAMARqMaQdgY5k7kt+useSjmMEe76PtLR5dpJR5mDv1G5nF15Vj5BJ6WT1
	 +GIfwhugKx4ImFBpT6mrqaejw7AbXXUriJKnkS0exvh0UQRtJwBjkzScghnDq6vYFLJWa
	 gfXq+ksOVJC0RwvRz/Thv0XAGCQZxBcUiP40uR4U+I8oTPi4BEXZfSBNhGE9NzmHhASal
	 f/yIwczx/SIotHxStNq/Cwf5D8av/BrqaWtxMYeK7OKEYDBsaJ8UJ6SkK+9Otn1YdOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKTmObd9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIR6HdNq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E92606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 00:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E92606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKTmObd9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIR6HdNq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M0FrjV2122835
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 00:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/opNow+kHytu3G/NcD0sUoEO+o11bnVvWNwj42+U14=; b=CKTmObd9EYBRD8Es
	JW8RP6hHE2nV/jriTWLFK4Tj07MD2YQ/d+k3krx0ltsunPU1Cqkd265kNM9yKAU3
	GEnCNnmIZVqdzmOaFvqwUFGMkR3jhOrDwVbvYrdhKxx40y/3PqS6OEdz4Y1mzA5r
	nc8kaRtBDStzSfIldolLvF/dk667tyPSl7AI/LeWGSrXbgSZl2mpo3K30Ew21v2d
	6hYLTLvPXuNcUx8Ous6bX1zJ4wVog4riLz0NNXpV98/XnWjGQDy4Iramm7tFASVm
	hQQeeHZq2uT1zz50gd3ihZtkQZ1hZa24QON53S/ZDK8f4lAV6Lzg3Nt099ldullS
	qho3Mw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf2cq17q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 00:31:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36696c9f55bso370580eec.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 17:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792629104; x=1793233904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H/opNow+kHytu3G/NcD0sUoEO+o11bnVvWNwj42+U14=;
        b=jIR6HdNqTF63nilx6rQNHNbkHx/2OBdxpzLFM2ElyvxXp6JoqqbPfMcENXyw5S9aES
         PiS1I/T74ojKqPdXTTPR7sVfYn10GOVAOjr608P4vl9bPaDDRFuKC3rX1SwSv1aao/Xk
         Ndelszb5jyO4liWF2w7CmhdOc9gfOCkOojeCE3MP+ToOSu2gJF4ktcIAfFHsmKA/p3Wh
         kIM4NLSUzYj1nkiIXPn0LPxomMzxyywlgSIrg9BxuD/ChoOSFv6QvyH9XG48aI3Xmay1
         M+CGeqzGXT6sCro6v49jlKHJj40yNSuTKA2r/XLsakDNQMyjP8Mv5C8muAYjNqR+bhpP
         g1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792629104; x=1793233904;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/opNow+kHytu3G/NcD0sUoEO+o11bnVvWNwj42+U14=;
        b=yydCAAGx+OeZHVdhU2YAQzbZLY86YMq0avTls5yQ8lyxuWsI3WNifpJKiuijlPE5A2
         fa02lfOQXDUgnXeT3X6QJqeQKdTnkrqskTM/PGzNHbIiJ49dtGs95USyghILvbaPGh5v
         9eW+13xLIunIU25CFoYEPVgujKBmZ2os8Amx06xhJPYBOObGPP/qLK3dW0/+jEKk7vHl
         N7udGruyPs4C6f5id89h0DmHTRVlak9+K/i9S2gJ485vYomWI2r3arE2TqhL8aYuca/5
         SlOY69t9UWdSicARL+qBuxL7We7BAcscgKLRcDRvt9S3BI2Pjbi/6C4JrKZkDEI1Xdsb
         r3ww==
X-Forwarded-Encrypted: i=1; AKwUvBzdO6wI6cgPPzXqg7OyuX6as8wGo13057mw8DLD4U1T04Ggo5wnb5dNz6zTJ3hW72lpl3fi92InIRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDKd3vsVjCMR5+nZ3lckNnAV3n7xH2wk8VtpBA0ywt8eCgx5DA
	j0okOVkQB3pzBdPo2XYIXdS30Pqjdmw3N11zRMHTc9zEna6xNSNyuedLn2d0N0vAgFbdUPzBHzJ
	TGX5OFwagTX8a6xR0QtnAU/X3wtkaXtEGafJDXnxJT8UjhuQMmdCgyipkpM2HQtA=
X-Gm-Gg: AYBFou2v3O2rTK+iF640O61DaQdUJonNmGyCPVffns1jhQgsQNKg/TAbZEQ1m37uGKL
	ReJfYF40ugdkS7urpYIwIqUhCT1jd8wAOqNXqvXq2IpxTuHIn34DmeBvCYzV7FUWwVlJWRaH7U1
	pXLYNFdMuMr22+0md5xPMgbgk3KTu9dhYD3c5WmgQiCt1eNbiKFtA6fnoJRHthMrNdP96YwSuUT
	XOKGH4DkCYxSfENdWDIOuV80wcsSdEreAWEVP9BDnWNujEmQ1liV0sThvNjcBziZtDMtfL7/3ot
	t8IlVVd9pVoVI5vz6gmg/hmrtFecEpP+FG21E9LpUGc608tasn9MUcCb18NIGPkSCHwfPqWQQ8o
	H//pAOlRrY7S2MJtW48bPT1CZJRX8JvDyfE6GXihAgTaQaSyo+3Im+w==
X-Received: by 2002:a05:701b:4192:10b0:143:808b:b178 with SMTP id a92af1059eb24-192f5c29bf4mr1174147c88.26.1792629104456;
        Wed, 21 Oct 2026 17:31:44 -0700 (PDT)
X-Received: by 2002:a05:701b:4192:10b0:143:808b:b178 with SMTP id a92af1059eb24-192f5c29bf4mr1174090c88.26.1792629103886;
        Wed, 21 Oct 2026 17:31:43 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm8819002c88.6.2026.10.21.17.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:31:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:31:16 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev,
        Piotr
 =?ISO-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
        Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 15/15] efi/arm64: Implement ARM64 DRTM in the stub
Message-ID: <20261021173116.00000df9@oss.qualcomm.com>
In-Reply-To: <20261021233909.GX3008132@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<20261021111115.00004c5c@oss.qualcomm.com>
	<20261021233909.GX3008132@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HLhWhYtv c=1 sm=1 tr=0 ts=6ad95971 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ikd4Dj_1AAAA:8 a=j7B8HJC98GV4A_3RkYkA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: lUIIN9O0-VpDADuCqN4EWxo4Lkej3Sk4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwMSBTYWx0ZWRfX/gSgVW2rdHCX
 52c01zS6w2J4OEH35LDedb+jax9vweLCakMnbcafaagk3W4XcJ+rHKVxZXVgdciBnUoDP5lSjlZ
 wQ9BQ167q4p9WYcMPEL7MNJw2NjFq9k=
X-Proofpoint-ORIG-GUID: lUIIN9O0-VpDADuCqN4EWxo4Lkej3Sk4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwMSBTYWx0ZWRfXyva7AjcyEJtJ
 KzVDP3IMOT3NkxK06msnAPXqLvOooho6V5rI9slW4OsG60n6jW5HH7EwSmd6LpsYD85V6b8zrjW
 EDP3P/YsHezaCwdJ2lkoEnqcIwy/QaIIPa/C4GNwNzLMKIWOrqs/BPiHcRysj4J9W/nrRO+3oiK
 GnCK2aLbsl1KF82nrMuegbplb4MbJr6m3/jXVSgFjKRTdSsUbO5qiAjVn44MwuZ9iGHiYgupzJS
 bKYv5Gx2ask02L1u2JoV2GyUHxcFEb8MaNMC9jCbr1SOXCZ1wFwRKte3QkB9b8wZfm++AmqXWar
 VT+9KTfcKUcNpMTN8rl0djSlClCvi6VBjZBik7Js+Na0sZbZNgqaFFQyQ9hb2f4NYkyW1Kb5HnS
 ZxQglG+CAIxPpt23+XGBnkQgj1g/e7rygXqNC2CQu+CPTQHvDSfA3FVmP8ikMTFCH6SbejatO8S
 FfIB2MuRn3040dPQVCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220001

On Wed, 21 Oct 2026 20:39:09 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Oct 21, 2026 at 11:11:15AM -0700, Jonathan Cameron wrote:
> > On Fri,  2 Oct 2026 20:31:52 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > Provide an implementation of the CONFIG_EFI_STUB_DRTM protocol for ARM64
> > > DEN0113 >= v1.1.
> > > 
> > > First, it queries the FW for support and collects all the
> > > information. This is needed to compute the extra_size, which comes
> > > from FW reporting how much memory it needs during the launch for the
> > > DLME Data and DCE-owned data. The generic stub ensures there is
> > > trailing memory after Image for this.
> > > 
> > > Then the DRTM_PARAMETERS launch structure is computed using the
> > > offsets in the efi_info.
> > > 
> > > Finally, the stub does ExitBootServices and calls the actual launch.
> > > 
> > > The feature discovery process is deliberately fairly verbose to help
> > > debug any FW weirdness in the field. Enable it with efi=debug
> > > 
> > > It looks something like:
> > > 
> > >  EFI stub: DRTM: interface version 1.4
> > >  EFI stub: DEBUG: DRTM: TPM algorithm 0xc, TPM hashing unavailable, PCR schemas 0x1
> > >  EFI stub: DEBUG: DRTM: minimum DLME data 73728 bytes, Normal-world DCE 0 bytes
> > >  EFI stub: Decompressing Linux Kernel...
> > >  EFI stub: Generating empty DTB
> > >  EFI stub: Exiting boot services...
> > >  EFI stub: DEBUG: DRTM: will launch, selected launch features 0x0
> > >  [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> > > 
> > > Eventually the launch'd kernel is going to require built in crypto
> > > libraries that match what the FW is using so it can validate some of the
> > > information left behind during early boot. Refuse to launch if these are
> > > not built in and build in the most common ones from the ARM64_DRTM
> > > kconfig.
> > > 
> > > One nit, if the platform does not support SMC then using drtm=auto may
> > > crash on the SMC op. As far as I can tell there is no way to discover SMC
> > > support through EFI. Learning it from the ACPI FADT is doable and costs
> > > about 250 lines of code.  
> > 
> > Ouch. Sounds like a must have if there is no easier way.  
> 
> Yeah, maybe so. I will include the patch in the next version. Though
> I'm not keen on it and I don't know very much about ACPI.
> 
> > > +/* True if SMCCC 1.0 or later is available. */
> > > +static bool efi_arm64_psci_smccc_compatible(void)
> > > +{
> > > +	struct arm_smccc_res res;
> > > +	s32 status;
> > > +
> > > +	arm_smccc_1_1_smc(PSCI_0_2_FN_PSCI_VERSION, &res);  
> > 
> > A function that is meant to check for smccc 1.0 is using the
> > smccc_1_1 namespaced calls?  Maybe add a comment on why that
> > is ok to do.  Is anyone actually using SMCCC 1.0 on systems like this?  
> 
> This is a good point, I didn't quite get all these details at the
> time, but yeah, technically we have to use the 1.0 calling convention
> due the register clobber differnces. The other reason is we can't use
> the kernels 1.0 helper since it is an asm function not an assembly..
> 
> Fixing everything I came with this:
> 
> /*
>  * Discovery must tolerate SMCCC 1.0 clobbering x0-x17. The EFI stub cannot
>  * call the kernel's out-of-line SMCCC helper, so issue these calls inline.
>  */
> static u32 efi_arm64_smc_1_0(u32 function, u32 arg)
> {
> 	register unsigned long x0 asm("x0") = function;
> 	register unsigned long x1 asm("x1") = arg;
> 
> 	asm volatile("smc #0"
> 		     : "+r" (x0), "+r" (x1)
> 		     :
> 		     : "x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9",
> 		       "x10", "x11", "x12", "x13", "x14", "x15", "x16",
> 		       "x17", "cc", "memory");
> 
> 	return x0;
> }
> 
> /* True if SMCCC 1.1 or later in the 1.x series is available. */
> static bool efi_arm64_psci_smccc_compatible(void)
> {
> 	u32 version;
> 	s32 status;
> 
> 	version = efi_arm64_smc_1_0(PSCI_0_2_FN_PSCI_VERSION, 0);
> 	if ((s32)version < 0)
> 		return false;
> 
> 	if (PSCI_VERSION_MAJOR(version) < 1)
> 		return false;
> 
> 	status = efi_arm64_smc_1_0(PSCI_1_0_FN_PSCI_FEATURES,
> 				   ARM_SMCCC_VERSION_FUNC_ID);
> 	if (status < 0)
> 		return false;
> 
> 	version = efi_arm64_smc_1_0(ARM_SMCCC_VERSION_FUNC_ID, 0);
> 	return (version >> 16) == 1 && version >= ARM_SMCCC_VERSION_1_1;
> }
> 
> efistub can get away with this inline asm since it isn't 32 bit and it
> doesn't deal with quirks.

Smells plausible to me.

> 
> > I a bit surprised we don't have a common helper for this -
> > I guess the version checks are often explicit in a particular
> > driver being bound.  
> 
> The PSCI stuff in the kernel is all very early when establishing what
> the channel is and is done only once. Here is a bit different
> since we only accept the smc instruction used by drtm..
> 
> And even if there was a helper we can't really call it from zboot..

True enough. I was just hoping there was code to compare this with :)

> 
> Thanks,
> Jason

