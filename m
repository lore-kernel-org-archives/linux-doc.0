Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670211;
	b=w2SPpJHNl3OzAVfqrrhoGcnijPiMZfmObaRfIzvLYfCtIyPpVnfMdn8EEGInnD/GIGTI
	 5nMolnFObeDWBYoMrGI4N78tMAMpoSp59oCgc6tgZrmtgnjWt3JK6HlkG/fKvepKrXRHW
	 41rvXt1V17zsnHA8dUvP/y3Kf8RogKBq6vwrxUYSM2MZa7G2oR1AsF5OcBMQ1U9CHWcNE
	 6+DrK9U/TprVAAnBG8p6PsduuG/3BVe/9PJTPYgrq4JxxLNePzPmW3F+zifu3Pb9vEfGd
	 pqdu6tmxfZnX0U4TfZKA1FldE4eNriZDwPRa9ME0QdKyAChaRLWXPS0FLHJgjKsMsUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=;
	b=5PCfPH51wtPSNf1SDrZCAHBWpoKU87AMM8Ssu7fVK+5yywqYsx/Ta4eWb2FQ9oxTfHOO
	 211EWZJtWS32Ycsf/155BmIv1kIkSllRRatXoXS24xOmFY1NhTc/rDgOfmcDARSpCxyjB
	 VDXFOIXzc+0/hr7L2t3fpeGZJLY66Cpz6kex2bdglz5UVugC9/Jf6K33kX4TqRCbQB4Ce
	 sUzpZYzwsDkXBHDxokfKxswAjA3m3RC06GNf8/AOPIgCcDdUDZ1IIVai1+NDQ6kC9IjEC
	 q/hN6tTpM3Mz+syiroDHz8MdkyumaQfoDbhtIakVP6Q+dzv8XBzdqRSe7ZMIgWfhUqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OIt53Uqc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5yl7FDM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3695606A31E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3695606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OIt53Uqc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5yl7FDM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36XAL1158080
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=; b=OIt53Uqc1f+vMeFJ
	KhHrCNpnqug7fCwdv3e7ahd6S+nqP2n8UKF6oPdTH7HEy9+u2GykII0kC/xArNQL
	S+VnvJLTgqVkdjiEV0fq0dpmqrq1rVlrtGoE826TCmDV9+oZG6Sbm2HXs21xdcU4
	AbJdkOhUNHt6f5Cyd9esvXBSuHdEFHfF36o6ddl/+x96WcR8KIBFwX2fQevVaXDA
	5XL+HP3OgfKqHJKegjn0pu2ev+Qoqzt7V53O2VenYhLZU04AuTDziRC6PJnpIC1Z
	SVzfqfP2Pnj30h0nTfPusHTGccI7r0Ad1NNbJDW85o/Nqsj7wx+55jvpzxrSFfMj
	Pfg6ow==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aejgyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:16:49 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6768601940bso11428098d50.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 21:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670209; x=1796275009; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=;
        b=D5yl7FDMf9fv8+guvb7NM8edWjQYAxjWFHoCpF9u3BJZk1aiquebqHpZcNuPaRsxET
         eOtDr0SM/Nn9GMT+8Ja3I6P0LZ/I87g/J8y237L3N+gqqy35tbj2TFfwi2pnQ9sQLHmY
         fQNbdXCKJOu2vyGs+8SrHJo6IQovJ7dVydxxWrsQOHWEyPetej7myGPzxM4/220aNsif
         gSGv2yCETSjyZZIamvQDjq00WgpniogclcVwTKrA1ySJUUt4dV5nd8rM5VE8ttFEvPry
         n1mlPPmjUDDp7d8381f0dWbIE6z0mQwy8X5ULUSQQ50FmxYPPa6DudDUTNPLpkxBwL2L
         tMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670209; x=1796275009;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaqMkxiabwZdmuz6/DvNe8PnwuWFIWBk10f+JA29jq8=;
        b=TnDZ3knWOQwFahzh77ZLa2CwCxql8prnYtuSMR0mHIyjyIvzdTz27jcvWkd3otsKoS
         pQcOzR4hTv8B1pwkgxC2/nE+D9C6Lb5i7N/Qt5PxNzjZzrRs02XOgV3s1NSGIXJFdZJq
         +GIVid/nYDxxVv1eysqZRjrj+LkCmbXyvs+Yne6nsjJfHd+Y7vOhPcd+1HcGAWwW+WjM
         XAth3hx1K+HB3gP6kJluY6QS2Fry+BFDLdhytlhpobDkPBgC0nxKz1CWBg0+53g20Ivr
         cnK9LwKB5zJTnDm6wlasJQuhzniHb7bOkM08Nz/eZAb2Df2c5iHwW7j4S2EW0I+r1SFI
         2Xlg==
X-Forwarded-Encrypted: i=1; AL+hErEu7fV9HflGDKLFNknZgNGKX8ANgt0gFKjOV9LXZ9uOAk0IgSzJPwxnIrGn0hvqQCaBL3WWCVY00bE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tTiEVrNZveGM0GFhWuF6ov0R/esjCDvVkFSb/Jz5sy6Q1DOLL
	PxsPAd+fhYqKRCCSq7vZyKd1idRvg7VrXejvFYvnDhMysiToV1neyyGLdAYINzKSwkcWj7UB6kr
	vgFMGHVFouNxsHtfy82A5gya8gmAf8go25LROSva5gy+Y2Rts0eukF9Yfk4VBaDA=
X-Gm-Gg: AZFdTZekzicoxjqTQ0gyFVXUNvmI3cqTqAet2Fr8UU88+28+RybzkjTl2PxV/6ugyVc
	J3On2MV8rx4Kti4K22iSRsnLJxeGUrRLUc+8SH5xWE/wBFQHWphD7BlVr+VuWNiDXOxtOP7CY3+
	XkkN8TFbJuvqBC0rNm/CnDWEWco+USfFaG4Yj1VK4LWlPsqx9fofaMqsJbTtKnp1oCsr0dQ8apl
	uo1XeQPO1dBWd1dB35FSLqYkaetOII8hObeH9or5wLQ0KUFT221v8TGbT1lfVmqah00gFasLqhG
	OIuqlSCrzX4zkj3CJOqZeIpUV1xo1xyN2uwYDXVJs9jzaCn9klE2KIu/k2AeccsXIZNkREskw7s
	iQZdSF9ymkBw+qITcaZdLP8irH1atajW50bvcEHZTV2JCL37kSS70Oe3FW7nEwwhAOSZa/ErlGH
	u7d+R3NapPhw==
X-Received: by 2002:a05:690e:43cf:b0:67c:2ae8:dc65 with SMTP id 956f58d0204a3-67df44e4e20mr4709801d50.46.1795670208708;
        Wed, 25 Nov 2026 21:16:48 -0800 (PST)
X-Received: by 2002:a05:690e:43cf:b0:67c:2ae8:dc65 with SMTP id 956f58d0204a3-67df44e4e20mr4709789d50.46.1795670208139;
        Wed, 25 Nov 2026 21:16:48 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df31fa545sm9644255d50.2.2026.11.25.21.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:16:47 -0800 (PST)
Date: Thu, 26 Nov 2026 00:16:43 -0500
Message-ID: <4ea9d48592dbf0e1120f7db7305aae37.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v9 1/4] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
In-Reply-To: <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
 <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
 <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX7SlEbD/V0nko
 VMM6ZviKMuGrLocxVMzCjsmzg3TTCdPghjEHVtcZTRNnCxqJmKqzrEiAEFHpSaJ/DiQGL6Nph78
 tAhqvaoaX9G/e6Y+gLuUFGVDkIj+FN405NIdOJSjRfcmCM+Co0XFUHrYxcaV3mmWAHQaebt/uQ9
 zSyvgjd71uH4qFAW3DzxXY9In13BGX33lhlX2RtYrOo/OEBuO/g0SMaUJ4EXMJJQAMgo9v6O7Cv
 /TLTIERk5vwd2w7c987SW5OHXJOvCq+L5rYN2q3kf8/v1o/JISlr6EnrO9fuWKxb1jJNJuqMFRN
 4DjQTrwbaj+ZpPMqvzDtXiQzZkzzSw1kbRqLVxT04xwbPoNW+6v9nwPpv0QxboHrXxQ/VTRUQWC
 OxBn6BBgAhV2JG2Hr3tIQQU/kmkMCsu2/DT8wMSRvQ3UHgMtNZg7dA4dA66wUDw5bLAMExL2CS0
 zSxcaPJtKUxRXPykifg==
X-Proofpoint-GUID: u8Srv29SlDdjUgEWMPb9owwgLd2-HQZ3
X-Proofpoint-ORIG-GUID: u8Srv29SlDdjUgEWMPb9owwgLd2-HQZ3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfXypx1JzRyFwEV
 Z7pypp/gFtkInUntxrct3qkBAEwCcaRl+vh5M2qfss9F+q7mIPrHuA/8W20odyDeDD6pppPcTYI
 dtWogJ3a+Wwvlnk1UWArCXwnAQHlfCM=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07c0c1 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xvfqbYfxAAAA:20 a=KF8kK5mtAAAA:8 a=OGjWj8McAAAA:8 a=IWwISAFmO_-9T5kqGVcA:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22 a=zNK5Gj0fNQ2RFkdt29ku:22 a=UYjydHh6ynBBc6_pBLvz:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

Hi Icenowy,

On Mon, 09 Nov 2026 23:56:47 +0800, Icenowy Zheng wrote:
> 在 2026-11-09一的 07:47 -0500，Guodong Xu写道：

[...]

> > +enum {
> > +	RISCV_ISA_BASE_IMA,
>
> I may have missed something, but would it be worth to add a GC tier?
>
> I think many Linux distros have GC defined as their baseline.

Thanks for raising this.

A single bit for 'RV64GC' seems to have no user to me, so I would
prefer not to add it. Allow me to explain.

G is a combination of extensions defined in the early days of the
RISC-V ISA spec: the unprivileged manual defines it as an abbreviation
for IMAFDZicsr_Zifencei, "our standard general-purpose ISA" [1].

I checked, and you are right that it is the baseline in practice: GCC
defaults riscv64 to -march=rv64gc, and Debian, Fedora and Ubuntu
(before 25.10) build with that default. But my understanding is, G is a
build-time baseline only. Nothing checks for G at run time; on a core
without F, D or C, an rv64gc distro userland just takes SIGILL on the
first such instruction.

Anyway, what this series intends to export to user space is the profile
level (RVA20U64, RVA22U64, RVA23U64). For example, a glibc-hwcaps design
can fall back to rva20u64 when its run-time check finds no rva23u64.

PS: In those terms the counterpart of rv64gc is RVA20U64 [2]
(excluding Zifencei, which the profiles mandate only in the S variants
[3] and which, as noted in hwprobe.rst [4], is not intended for direct
use by user space).

RVA20U64 and RVA22U64 came up in the LPC26 discussion as well [5]. I
would like to add them in a follow-up, probably not in this series, if
the reviewers here agree.

[1] https://github.com/riscv/riscv-isa-manual/blob/main/modules/unpriv/pages/naming.adoc
[2] https://docularxu.github.io/rva23/rva-mandatory-extensions.html
[3] https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc,
    RVA20U64 section, the note on Zifencei
[4] Documentation/arch/riscv/hwprobe.rst, RISCV_HWPROBE_KEY_BASE_BEHAVIOR
[5] https://lpc.events/event/20/contributions/2626/

Guodong
