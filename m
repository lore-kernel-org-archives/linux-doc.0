Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221863;
	b=vxrkSdJYKrlJI28M1/o2wLORlaZJc3VGDdvrQ8KTZdLWxDJAGETxX77I244cSOzvELG0
	 7sisxDmQjv/sWbNaH8MH0A/mHxzoXI/NSofBdCum6ZN8rLOnSd3k3u2qMLSnSdlMETsXY
	 2+2zq1orzq0rH8wfF5xXcHi2gcQtD+wCqShuSuRAWx29oNM0JmsgSZy34wfT6iHxTi2bC
	 J7C40pDstDk6WQT532wfnsmwFVWoah7WkM0l36oqDfejwWKlqJUJMzL/S1o7y53lj/XKg
	 c2fqqG7EoeKg6zLy9gBT6B0KWbhG9BT3hyGahY4R6dr6wHO60kQrMuFK7UGRGa+Q3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=;
	b=GIqpSh7p5IIKN7PhovsQHILbsyLuCVfGZWjryuW5/Pf27vKjq6HNsyMbgdoSl7JdutP7
	 FvLceDgGaAec7WYuLM2fy/P3N4zptYNTrVU2kWtWofr4FtUtz5WrG3AMqIFv+a33raFSL
	 VeYGclkG93LH8migWgXnDKLdt2NguqltlFN+ZxliO1p8T1TLsLosJYznpwkqeqNTPIQzb
	 xKe8g/EGJbbh45PMRTHBW4bc57D2n4jRZu9Fi1sUiO7kbrjnyqrlI8Vg2veC6HwZCzGGR
	 cLUen2x3q1A0h080+hM+XJAc30vV8ZRw7Jfy5SSbYMDO+FdpAfOKgOlxsAnBQJACV0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEXaY4Tg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAG4r1X7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A3606A6A9
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 00:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B2A3606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEXaY4Tg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAG4r1X7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL0BJXG2912946
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 00:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=; b=QEXaY4TgrqclYeUG
	E4U3L6SY4ofnwsAYJHj/1j44DLSySxjEkq8E10NchzmXvmkdTzi3itIkDLr9BFmg
	DdhPUBwDW3fqkTp+JHB77K7X8PSurKwy9/KdcyQEmcHErDcJYdS40+X0rSSf7ukO
	8WA0y8jtPdTKauky4CIpkQcSqhWTKVE4Bje6FpGzf1qwPipQTPGFdpRmRRI1wIw0
	mS2idhhFwBKArx4g1YVrlssKLd6pl7iSBNoXie+LR6VuNCfrw6+r0HG8VhDm2+yb
	a2k9ieYhV5hLLWXX6uMGmxvdME/vpecVUhBhx2gtJd1X81nM+Nww2fuemP1o330U
	WsIspg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2tkn9exs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 00:44:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1609876eec.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795221857; x=1795826657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=;
        b=FAG4r1X7F0omf7xzLm/6V2U9a8CJ9xxuHYXocvdbCKF/KvCaeyZxmOBfFro2jhmns8
         BYrjXcTRjipVpXgAbsAroJEr5FFAHqoz0EAoUR8lV9wCoNXsuB5pSNvH+FpPV7RnX9eA
         V3bH3Uet3kymFWSs5CHdmdEZ09bDiYLyW1BAeQG8qFs8SMG6u5ZDxcUGxkmhMUBFWKA+
         JkOTgRqDuvILyWPXgMv5R9MhtzqHQBgDOiTy63guaKGkQ4zRV895HV2rrHa3QBcoYufX
         kwoq3O7/U7S3P5q0D0QZfDctLNWcx0iDNOZAYhJLBIFAIDFjX/Fl6951vsNcLgJL8Yod
         2Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795221857; x=1795826657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=;
        b=n65bSoFvC5I9OPBvjqF6sg5fTno8K28hCT1N0nmHnZyfFET4XLXH919Yq7DTbeEdQu
         fxHXhY3IGTzsgHVTEnKfBuOz+lK4PCovd4XhGvmxoDFZ4oCZhhef1FNI7REQXxA5doxn
         LmazPdzxDNrLBj76disb0ioIUtXvaKIBWwZGn/Nhd6feWsrapC5KFnUCUYnOwN5Zv9/4
         RT89tjteYyTT1IsEKMuZAIO8laQmvZId5abptKBJvf+Zezi9LWhPsRJCg8ekrl+8mNCN
         BvAqETuGVYqFKE6YjTVkWUvELJh4BgoP5UBszH2ANhHnjqRTonQRESLwxgOw5inwVC/U
         foqA==
X-Forwarded-Encrypted: i=1; AL+hErFpEMZPpLkCVx7tTUk006bGZhZK+emfGSjF1Fb40AqFXZMoLtWFJesol2rr+Df3L94pjHPnlULNC4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C/cqlP8+rDi+Fr/wtjFXsLgQgQDSpynDxlsWJM84e/19mfccR
	YG2Qkr5+W7fzJP/HDVIFJnTXe/S7dr/1zzK5IrmcJhBrMfgVH49wcY/SKJ1tXcNvZwiKS2ewxAG
	MFss0O4keGon43LqH6an8+OJZgPMznvq5aFuiUGB2bmaYWTbqw53A4FoRpkBaXHk=
X-Gm-Gg: AZFdTZcQr+qys7CM/D4oaoQh0eO8QQ/FLUOyWgS0BizoFAr3op4SjAf+ocAAcs/3ef2
	YvMGP1l2MwP6RsPQu45JcgzelEsLAl0WVg5edePK2nln0AGGIk6fOyCvUGE563v3ruXwXO8mnJI
	ZkGF5lxRoZOKJjQucnCuO7BYXx2guPXLHDS6AOxE2SgDg8xNZwhHe33qjB7f3u7WAc+I5eFzGe/
	oeBGYWkhZUX4Zn57Bs9vmL2eaNGpp+JB1DilLxQtlyEQeIUStUVGa0LxhOyk4DAF9F/mtCaQcs8
	9rJplCBQGbd+AkkcjJG0VI4irEEokP6sFpa4c0397OLQZYZ0P/LDqfNMbdiEn/x/wP1+U1fxGN9
	529SkSyLDFmxjv3mgxMJ2vN+kmloUN2ArURLG52qTfilh9RKzXErxvw9uJQINHMZdhi5Lxd7M10
	iXnn4Stk+J/wyAHoDw4LlUE86sp6ceen5cTeMxOLkDBbyGX5YeefM1lpbaPg==
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr5777416eec.31.1795221856783;
        Fri, 20 Nov 2026 16:44:16 -0800 (PST)
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr5777357eec.31.1795221856211;
        Fri, 20 Nov 2026 16:44:16 -0800 (PST)
Received: from [192.168.1.72] (108-202-119-98.lightspeed.frokca.sbcglobal.net. [108.202.119.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm12974717eec.28.2026.11.20.16.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:44:15 -0800 (PST)
Message-ID: <13d32bf7-7f74-4dc5-a875-671167149df9@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:44:15 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] firmware: arm: Add Platform Fault Detection
 Interface support
To: Ahmed Azeem <ahmed.azeem@arm.com>, linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Divin Raj <divin.raj@arm.com>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>, punita@qti.qualcomm.com,
        jonathan.cameron@oss.qualcomm.com
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NBGQ-uQAE-4t91vkcMj8f-D3gyK5MPoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAwMSBTYWx0ZWRfX9Q55ZL64V4F6
 ST6WxGEdSbYlo8vcDoavnW/q0aokvauZUS+nevGdRucx4DFvpm1YWFiKRdEMw/G3oNRqpvPGt7b
 UAg+YjJT63+szrcYfkbq7pqfynJQ/TcNsncIF01ERKH0ciIoZLzHCvv2Dpus6NYgEKmClZ5cdiC
 O/A7V/BU624KFgD1eeczqPRvzjnUK/bB/8AmZIXJVkK+BjyR1mKoYhRD8BkFvWn2k7b2qqUMnta
 5q32SuQn6QL9+9160wkAythILai/xhW+nToJyKfxEJNDelCo2DYihoG327b+OD5jFS9VR2CIly1
 pmNKuQ/QDiSpFSgSW0b0hPw1q6kcMs5oLCActuavdcffj9L0T3wKOOsKwjQ7Sdofr5ENr4PNbn9
 4ya95dCfpG7fQaTD1Jx41ceZ9SnbAJi3wvLJ7s0risQX7TjB1SNNemu6CP0T4YoYQ84rgBNGXky
 48n3Hluagdy8kc/nODQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAwMSBTYWx0ZWRfX5WFoTsIBMwUC
 /65CA+nzyGtoGqSdi+V/WNriKcecj7z55gbHGX90l/8lk3uSE8G7CoDlpxvYSkojj+VmY8k1Wz3
 1x3opRXVKgd3oO7k0yMwGbBb+ahlGNQ=
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6b00e961 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=HIR1veyihGOKDQ4ymPDRgQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9AdMxfjQAAAA:20 a=VwQbUJbxAAAA:8 a=oK97o0Sx6ny3NbBOOE0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: NBGQ-uQAE-4t91vkcMj8f-D3gyK5MPoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210001

On 11/19/2026 7:36 AM, Ahmed Azeem wrote:
> Hi all,
> 
> This series proposes an arm64 driver for the Arm Platform Fault
> Detection
> Interface (PFDI), providing a common Linux interface for privileged
> userspace to discover and invoke firmware diagnostics.
> 
> We are posting this series as an RFC to seek community feedback on both
> the proposed Linux interface and the underlying firmware specification
> before the specification is finalized. This series and its validation
> use
> the PFDI 1.0 ALP0 specification [1]. The current public revision is PFDI
> 1.0 BET0 [2]. Feedback on the software integration will help identify
> any
> changes needed to align an upstream implementation with the evolving
> specification.
>
 
...

> 
> I would appreciate feedback on the specification's suitability for Linux
> integration, the proposed per-CPU ioctl ABI, the worker and hotplug
> model,
> and whether this belongs under drivers/firmware. In particular, is this
> the right scope for a common PFDI interface, and should error injection
> be exposed separately from normal diagnostic operations?
> 

Thanks for the RFC

I haven't read through the specs or code in great detail, but I thought I would send in my initial thoughts

Most of it comes from my experience developing/up-streaming a similar feature in my prior job at Intel called In Field Scan [1] / [2]. 

I think creating per-cpu threads just for this feature might be an overkill on a system with large core-counts. I think an alternate approach like below might work for this 

1. Drop the per-CPU kthreads and the cpuhp state; run each request on the target CPU when it arrives ... something like
cpus_read_lock();
if (!cpu_online(cpu) 
        ret = -ENODEV;
else
        ret = work_on_cpu(cpu, pfdi_op_fn, &req);   /* or smp_call_on_cpu() */
 cpus_read_unlock();

(IFS used an alternate cpu stopper mechanism as it had the additional responsibility of synchronizing sibling threads and related timing etc ... it might not be needed here )

2. Use one device with the CPU passed in the request, not <numcpu> device nodes. Use a single /dev/pfdi (or /dev/cpu_pfdi) and add a cpu field to each ioctl argument struct. That removes:
- the per-CPU miscdevice and pfdi_dev_data
- the per-CPU register/deregister on hotplug etc

(I will be away next week ...so my responses will be delayed)

[1] https://github.com/torvalds/linux/blob/master/drivers/platform/x86/intel/ifs/ifs.h
[2] https://www.kernel.org/doc/html/latest/arch/x86/ifs.html


Thanks
Jithu
