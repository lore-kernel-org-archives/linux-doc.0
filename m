Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256FFE54B
	for <linux-doc@vger.kernel.org>; Sun,  8 Feb 2026 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770569257; cv=none; b=HZeTtiBcAaiqzkrFV00riih2IN1NKdwvhG9xfM2hWlPShmPnEUA096e2TA2JL+JX96lYJHs4eqkb82sWQ/p06ijT0EpZK3hxiz38DBQU+93NUnQ2iHFPj91IZtuVcxfWftI2Xd8vut1HmUndpfZdN2Imic+3EVlR0fjGHn9wKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770569257; c=relaxed/simple;
	bh=bSnmQpaf+lQZ0tvx1wkBHulRMVQrkd8BqMqO5D+VePU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuF6lr56/T4LQ0/RD/zQcj/6S3d0pVhLR5eDEFJ/hknaTfAd9lElyafmv3mmCetK2L6Yv/BCB3DOy+axrw2kVgiy17qpKW12kdeCXPLxhtUCjB7SZGcXcc2jT5M10a2hrsvgqIbPZ+TKaqg3Hy+zvSXzKZH4A35eB4erERi8HVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrOX0Yz1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtiXIsK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrOX0Yz1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtiXIsK2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618AV0tX711485
	for <linux-doc@vger.kernel.org>; Sun, 8 Feb 2026 16:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDesesvDITBTW+QHoO6lhx2X
	LpGHZwASNOTWWBigTb4=; b=lrOX0Yz1cG3aS0sWHSH63sRkj28qPlzqPUY2+pOu
	2fzzqzO/4/CumcVN5/P7OJLT8a0+Q7oeQkPE6zkEVajFqE0xVlXexf+2s/6aSR1U
	b4S8Vp6vOAJ4NXlEtRoQ3Tbkjs7pzfh6+RxnfDNjFclV7by9KDNILjFNU45RpSTy
	5bUNlCaEZ0Z4E/sCD7n6DtcJQBHKzaggxmyL5E3gXySr6N2Zhl8Dxg93Q+2Z16Ys
	OU2TZPY6CXBoIx6TZE9O4xAOvy7+oLFkvPT3K27sVy/1MAuKAehQV2XU93xZ0cHZ
	wQgpJtXy9JubWOXnBwSODPENvrIoLncGrGQcJWFyQP8M8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdetmm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 16:47:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b866e72c00so710448eec.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770569256; x=1771174056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDesesvDITBTW+QHoO6lhx2XLpGHZwASNOTWWBigTb4=;
        b=OtiXIsK2/Y85fBa41LYtFRSUgQxwj6UI1aJNYYRUpdTXMrH3KfHnhn/7jv0FUPRdKx
         8cpacsiv42hOxDXHI1N/eG0aWE9UD+p3Y+hnglvAKLFy6gdMH3o4JJr527VE+ct/s639
         hXStO7jItJV0FtfGDV375RdG5/e3GxAllTrG54wYUh7LXLxNlU6zlYWUb05mY3wOKYSk
         Oj6E0TuNr+xkDfrjT1KpB3Ai74RrGeCV2/pVCkrYXnV8g8tKc96ffs8kjClQepVuXjfB
         U2sLB7ju4pGLFbOENLi9weKJOLPkJ9y4c7HjqeOZ9potMA9mXtmtE3WFPiOpPKCr1+vl
         Zr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770569256; x=1771174056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDesesvDITBTW+QHoO6lhx2XLpGHZwASNOTWWBigTb4=;
        b=dr84Gtetug8AV1aR0IbFZ2H3gzIHPHew4qKJjG3TO+FqbiWcz1uJleSxz5gpfGcGE6
         qovmll2G5tXjKBD5/xo0Oy6F4S6ZS2CIJMuRvUjvqEoR+5fwvekQ1zaHHCrin3bqPxF8
         XXoYjm3Um2DP2FS7VgBcb3iEbCSFZbb5EBe+lG5IBjXUlCfqG7nhrC6beVDLXjrVEiXm
         cxQgOHuwomwFqGZzt1CdQWE6JUheWVyGbbxUkjVJ3B56/e//b7xVc+jeHUyuCTcj2aie
         wku9wqZ+FDCyPmg2Egke5MJX0mUSKvykI4NfcIP5Dz3em1BRI+PLKNHdyHPs/owEPvUc
         KhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhfdR78kKhiu2y+o1ovhvF7C9sVCNCepI8wNNc4hb2CbZHE6CtuXz5LAEf0waQ+2dNYm+AHW90yuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkkHxsqrJHElLxtffS+ACWEuAuAyO7GfoXZgbPoCsLBMTXn3LO
	i/97ryiotj2xIL68URN/IBxRGh5w4Y4FXtkCiQYxTn0otlVCkcYA6p5I5frnI31wpkZQ1C+Vrkk
	F5jl1kxQESmf8+IUfjk0VVKopYzTNuc81ORTnKjHc3eGMdUmh9Z4leu8ZpdhPsqA=
X-Gm-Gg: AZuq6aJ9Rtb2rd8VsMfaLe2XqxWxFUbpxEhjuVNU9Ukelc7+yCdcUspLSzJAfStU/El
	bLRuTGtFwR5JLEQ7Vs8E0Soq00EQswZPTE9/5hmsPUtUOdI061fGg6f4dWMOpw4LkOxqcWyY0C5
	9+lnTiGffgX7COdBoByHzuLNN25ttN20RcMWk70vhpP+lsM4oNpymxcvEM/K9ejuLyGCmSjGTpt
	Y20mKCcYlvsSzAllAiW/EZIQ6KsNjyEjuxjRmPmi8ppqiCpiSYiHQGLcngqWEZigLIzydbnvupb
	8/PzWypIwcRkSxdj/cmcBuv6SMzJFN/St8ec9CiittnIZshQZeJHvFKyp7kLUgMfcv4rbUR3teo
	zExyCyJL8YRSY/Cv8VIQ=
X-Received: by 2002:a05:7300:80cd:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b85647b8e0mr3090498eec.12.1770569255661;
        Sun, 08 Feb 2026 08:47:35 -0800 (PST)
X-Received: by 2002:a05:7300:80cd:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b85647b8e0mr3090491eec.12.1770569255110;
        Sun, 08 Feb 2026 08:47:35 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c7da4esm5749797eec.28.2026.02.08.08.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 08:47:34 -0800 (PST)
Date: Sun, 8 Feb 2026 10:47:33 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/8] riscv: hwprobe: Add support for probing B
Message-ID: <k3riksgjci3jw7tgqf27tu6vrfxfs6e7jo5jinwwadyruyqgb6@apqyim4zdcqc>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
 <20260207-isa-ext-parse-export-v1-2-a64d3a8bc20a@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-isa-ext-parse-export-v1-2-a64d3a8bc20a@riscstar.com>
X-Authority-Analysis: v=2.4 cv=Ddcaa/tW c=1 sm=1 tr=0 ts=6988be28 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=dSXBePox3ueF-X1Up24A:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 1dVMXKTeYG6J7pbPnkqsBphwJNUzimHb
X-Proofpoint-GUID: 1dVMXKTeYG6J7pbPnkqsBphwJNUzimHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE0NCBTYWx0ZWRfX31avMJZpSTwi
 uWOCk2McD2DKLQN68XUnlrYNRj+j3IOo/My4CTrrqZ29dUTU1l4kzpHuoZtLrXrUa9uxLo1Ql/1
 oJ3PVrmLpnZS3pyTxuENUzpKbF6zWA7fHzrtnI1KRIXpoKVMc7fM9tRtGr4PBQ2bkDhvcLTpAV2
 vyf68I4aGC9BDifyeGSDtWQqMN9/FihuUJYHCv1853sb7Liqg+uHrBFoTFUV832K9yKMx3yTLL0
 8CJmsD1FDjKKGxC9ToS2ofJgNU1AuMCRuFq50nYBXbK8x2NaZiW22828wiCteR3zQ+WcyG7RrQZ
 7I33Tt6FJ3yJrhOwM8YYZUP5JLySvW/3aDGUkyQcXsnsBN9e1jSB6QxHzNsiaW2WByvmTSPV8Pk
 zXwt4hAXha5F/6ISBBMF11JlC01cI7ddRJgg6zNjPF8c2HGAHrgTxEUZDxiJMhEslU+jg4qhdBu
 O2SR7/PX2kVXUHjUDoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602080144

On Sat, Feb 07, 2026 at 06:27:56PM +0800, Guodong Xu wrote:
> The B extension is a shorthand for the Zba, Zbb, and Zbs extensions
> combined, as defined by version 20240411 of the RISC-V Instruction Set
> Manual Volume I Unprivileged Architecture.
> 
> The B bit is added as a system-wide check in RISCV_HWPROBE_KEY_IMA_EXT_1
> using the global ISA bitmap.
> 
> It should be noted that the kernel already exports Zba, Zbb, and Zbs
> individually in RISCV_HWPROBE_KEY_IMA_EXT_0 with per-CPU granularity.

For the rva23u64 base behavior rfc I opted to not add a B hwprobe
extension bit because Zba, Zbb, and Zbs were already in hwprobe and
because I added B to hwcap. I realize we have 'FD', C, and V in hwprobe as
well as the 'IMA' base, so I'm open to adding 'B' as well if that's what
users expect, I'm just not sure if we need it, especially with adding the
rva23u64 base as a quick way to determine B is present along with all
other rva23 extensions.

Thanks,
drew
