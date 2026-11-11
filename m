Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357513;
	b=XmqEWYF7HjGHpHAlui0PwPKV+5PKfa4qFVjFt7bL4RKB3mUiCzUdZBfAn/lzB2ufESX2
	 BKLykSzsoC21YX5D56d2WVRPI0ol144D12cejRty63BP88ff4PY/hTADRZGAVfl8P/cgP
	 AC4jnXAcnl6J1Q1FbFzVda3VoWQjM94VvQhqczVX8+8p1jvIpPqs+4FwRZdlYmk+NwohC
	 cp4lKDmrbdHSsfFeOXSyYiwABLsFXVEq5dDjuTldELCKnPyd8fzYLOU9vfRGSoUPRe6+h
	 8jlQ0ORFw+e6MkpApfVQJPTAeaFY8WMIzqarTNxp4jBZ//s72forAImn6zVRlU0QhAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=;
	b=4XBWQkxPmc1zsb05FxHSB+2BCBzAE1EWyZ3OxAUo8jy+AOv3ibPVTbOIrU0KoVJ0E+iz
	 flDDCBqteCNtnYQ0yv49sviqFaaiwMEhkVUvNtg35haA1etETwhzJpBWJvAb3n7/iwHdE
	 SEcyGPCtZbCqH06/9kt+QRXZmgRVffDJGXaPkpOOkO1W+bM6xW23M+xkgnfpyPmLQOn59
	 x2FYJLciIClxxN2z0k0EQ1rFVt8AWbhwhQ8N8M0Q6p1rRXLMwU4zrZAbjkeQWkCOdqF2u
	 XwkvbMMqu8wgaBDhGRz7QtyBqpIBgXUQSMoKHyZLAhfmCZ5iybSdAmcA9A1UdDbRa4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d+WhPqkk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DqHQhAp6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A763E606A31C
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A763E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d+WhPqkk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DqHQhAp6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKdRK443775
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=; b=d+WhPqkkWHezj4wX
	2kdBBiWrMpK1/053nQziauJcW2KmfS6U5FwfbZNNHWdl1hx+JRCCIdZpSckqruQf
	68yBu+FqiQjApvultKCAoDsutMAFpoOGgMWlHnDCkjCxuHU4zR0GTPwT//DHnHAg
	bBCrAlwwzqRtsh/+3dVE85fzZxKw5UcINxAbROB2+MZtemTP5rH5FH+JTfFaGTC6
	tnMpHn9SZBu90E5sVb65QqXACCl6P5nl4aMNyycWEQ2th0Uin6Y3pJrFGitUgTQi
	XWMUusSay7go5ZCCR+GGZEb/V9wxS9LpVtWFlXuvlB+iTS9favHA5t8ZkxGgqlVY
	gEklkw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufuj4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:38:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so2079998eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357511; x=1794962311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=;
        b=DqHQhAp6qgGrsyhPwVUaKwbB6ARGK7wgP/3K2ihCBOcVwkTmkicdQJz5wYdJZnfTsN
         1inGZU5Cssw8qyVndS2ifwKhHnCgvm64aBaDwjAIAplftdMrYr30jZAnLphgCMNKgGA7
         rA9y2NncLeYzhv2iZlfpn69HVVeN4iypiLnPTzKWz3pDgfyRnusLpvCW7lqConfa+Yer
         NbYNKAVp9lNmO8OFxGGeBXGRZ+ONSZepLONptmeR6o8R87sT8ZkQSRzZ3Im+mCCjLXu6
         pYEYJm0Ur0c/KB7HIf2rdyFv5GBQqeQswHztwg6yA2x953u92R8HXsiCnx+xfK86lxdJ
         Zu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357511; x=1794962311;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=;
        b=lgcHQlLDZbSL5LPQIKAXIlY3z6tGwLFhDuin6cP2B3einAMrFl+S2AjahsOO6VhdS1
         Mgu0X4EyQTQeiL/9YO0lQtevszPz7v8EzsA2rDONPIaE1c/+OjoBdpTolbs/B1KJ0uSF
         QGKK+SYM159nh7Qab8HstTRNzJRHNvOPIKAw7jb+lwrTVoP8KXkVKaqVEXNGpQBzNuo+
         qI3R1sMlb59mR9/jNs28U8F8i/FJ5GvWizoyknRrZXQo90+PSBiI1+bb0uAVPp0oPIVc
         /kyxcR2NxUPhVSTN8ZafCK7ZJY+r/dNeC/bsDE73Z6DsXHVpZt4g5v/2IbYOJYyzzEf0
         P9Bw==
X-Forwarded-Encrypted: i=1; AL+hErGFmGuom0NhGyIZyNbOr9rkpfAdvvRULljcz6GP24VXrar1k98pi35S3j0/dzabwH9Q4Mol/ShBcfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MVbdY9ue7glwlsS/s1pG+z9jT46GlXLR1J+IQMOdA0Q9aQalM
	mBqM5cp893bmohzQGJWLvZpmqpV+lN+3+2tJ8x9bJ8R1CKxcYPUvLf88DtnmjFvj9ea4E1B1yt2
	pCw3NUrztI+6KJ7nVQPfK15yv9Q86PCC1hXjSlx0MzhvNpwW9Lc39nv8yVou4cHo=
X-Gm-Gg: AYBFou19BBOnta0jxMXKhYehVRobt9nv0thF6YpJ3be5ZPFHsBesV9C2whlB3eiJv5U
	PXaqCC1cA+3fZHI5cghGwqlQ3ywaLe2MC0U7ItRgEbu9qMUF0cqddw2XQmadlsjmyl8S7xa8M5R
	40mroon68bTacD3kIOtCo2yWvV+sKxiwfi1ngm04CRWheb6kWaLe4kAEN/kk/QG5HtYW5Iir7Mt
	DefShhLutV0nhLXtDc3Vb7PxWrwehGQyTrrV5v/CL7JCVtjCuTYLanl55muuYVeULWgtB4nQzTB
	zriUny/5JecggZZGT0eKCcXG5hhQvJB1yJlswTwHtWjivW+Bi7tX3bDwH+IPkHf0xMhKgKhtQQ/
	EV2hXbAvnSh0w+k5dT/yIhWQe1m7BKV686JsKMGDlMCBIpNosQQSfSxZkbBLHooepg10bouk5Gw
	7nHRz6zsMudVA/3JnakhI44jH/60o=
X-Received: by 2002:a05:7022:170a:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b3c02fd370mr642301c88.16.1794357510838;
        Tue, 10 Nov 2026 16:38:30 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b3c02fd370mr642263c88.16.1794357510143;
        Tue, 10 Nov 2026 16:38:30 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm10623417c88.9.2026.11.10.16.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:38:29 -0800 (PST)
Date: Tue, 10 Nov 2026 16:38:09 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261110163809.000070d6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: hdQrYYJDTR_PdvejFnQLMPntG1NT2Nti
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af3b907 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=4wJChP4EGU-GPyPzoMAA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: hdQrYYJDTR_PdvejFnQLMPntG1NT2Nti
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXx9Sf05A1pgYY
 dyCgtdyHmMHGgxJFmVGHyaUvAUkgTPFyZ426ONtvs25G9iGP0W+ozSGkncWRRRexilJiI7iuTKc
 x00tC68aGbKnVB9WmiktKJ6Vf/JJ/v8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXytdZ2aokSRZN
 x2CU+ADks3G/cKSrA2lHNCx51GLU6sypa4feDezv0mfBiHTSIKU5npe/IjyDdtnvYnFH2EuOQqb
 ceuBRLgD0n9UMGdPTOir1GqiWbVmgJKh9KEBlOXiIr3S4dXSIW2T4TMDrPinf8YLV/C4gRjtFL7
 rP3BQ2teQOJ8oiCScph/Elke7kGQ4HB9b+t5Xvd57quw9qly2sIi31bTCrIDpD7C7eaneh9LLZI
 w/LXMuIe0/6A1Psw8wKlUAFr9DJH59tDGqPTBRp/CaTaM9ATO+THCz7T7CVj5Lb/+ws4rW4JUP3
 WXGvbD9+OyBOq+3aGkTqCB1boctwUrZyWmjpmFGHNt6CaGF+dqtOHIGRg+pMcblKt57JIKmHEKp
 MhGnE+7bwI9mmF88Q+QraOnAx0rv2UZefhoiNusg0Ntx1SPyAlOVTEoCtiaj9OUeimYppz0ZoHZ
 UHHh91maJaug17EVeTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110001

> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.
> 

Hi Cristian,

So, the main issue here is pretty much summarized by:

 28 files changed, 12801 insertions(+), 99 deletions(-)
(obviously there are tests etc, but it's still > 10k lines)

There are relatively few reviewers who would even consider taking that on.
I foolishly thought it wouldn't be too bad (and I review a lot of code).
By about 3/4 of the way though, probably much earlier, I know the quality
of review went down considerably. Honestly it was probably a waste of
time continuing but I'm stubborn like that.

So, unless you have a path to bribing or sweet talking various folk to
deal with reviewing this with each having to set aside multiple days
to do it, likely repeating for a couple of versions yet, I think you've
got to figure out out how to make the first patch set more manageable.
Probably don't split it up as much as the mpam or CCA folk have had to,
but you have a lot of colleagues who are experiencing the same problem
at the moment. They may be able to advise.

So it would be nice if what was in that first patch set was 'functional'
but I don't think it needs to function on every systems or support more
than an absolutely minimal feature set.  Just fail to probe when you see
something that isn't supported by that minimal set if that means
the thing won't be functional.

Once that's in place, over a couple of additional patch sets you can
get to everything you have here.

So what if you choose one data path (shmti perhaps), no notifications,
events, maybe even simplify to one of the readback paths.
Maybe even drop event groups initially. 
Possibly even drop timestamps.  Definitely drop things like boot-on
support and debugfs (unless you are using that as a cheeky 'functional'
test ahead of the main userspace interface.

How much would that slim things down?  It doesn't even have to be
useful, just testable.  Realistically I think the hope of getting
enough review doubles if you can halve the size of what you are asking
people to look at.

Anyhow, gut feeling only but the code felt like it was in a much
better state than some of the versions I've looked at in the past,
so I think the game is now how to get it over the line!

Thanks,

Jonathan


> In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
> runtime the set of Telemetry Data Events (DEs) available on a specific
> platform and provides the means to configure the set of DEs that a user is
> interested into, while reading them back using the collection method that
> is deeemed more suitable for the usecase at hand. (...amongst the various
> possible collection methods allowed by SCMI specification)
> 
> Without delving into the gory details of the whole SCMI Telemetry protocol
> let's just say that the SCMI platform/server firmware advertises a number
> of Telemetry Data Events, each one identified by a 32bit unique ID, and an
> SCMI agent/client, like Linux, can discover them and read back at will the
> associated data value in a number of ways.
> 
> Data collection is mainly intended to happen on demand via shared memory
> areas exposed by the platform firmware, discovered dynamically via SCMI
> Telemetry and accessed by Linux on-demand, but some DE can also be reported
> via SCMI Notifications asynchronous messages or via direct dedicated
> FastChannels (another kind of SCMI memory based access): all of this
> underlying mechanism is anyway hidden to the user since it is mediated by
> the kernel driver which will return the proper data value when queried.
> 
> Anyway, the set of well-known architected DE IDs defined by the spec is
> limited to a dozen IDs, which means that the vast majority of DE IDs are
> customizable per-platform: as a consequence, though, the same ID, say
> '0x1234', could represent completely different things on different systems.
> 
> Precise definitions and semantic of such custom Data Event IDs are out of
> the scope of the SCMI Telemetry specification and of this implementation:
> they are supposed to be provided using some kind of JSON-like description
> file that will have to be consumed by a userspace tool which would be
> finally in charge of making sense of the set of available DEs.
> 
> IOW, in turn, this means that even though the DEs enumerated via SCMI come
> with some sort of topological and qualitative description provided by the
> protocol (like unit of measurements, name, topology info etc), kernel-wise
> we CANNOT be completely sure of "what is what" without being fed-back some
> sort of information about the DEs by the afore mentioned userspace tool.
> 
> For these reasons, currently this series does NOT attempt to register any
> of these DEs with any of the usual in-kernel subsystems (like HWMON, IIO,
> PERF etc), simply because we cannot be sure which DE is suitable, or even
> desirable, for a given subsystem. This also means there are NO in-kernel
> users of these Telemetry data events as of now.
> 
> So, while we do not exclude, for the future, to feed/register some of the
> discovered DEs to/with some of the above mentioned Kernel subsystems, as
> of now we have ONLY modeled a custom userspace API to make SCMI Telemetry
> available to userspace tools.
> 
> With V5 we adopted a pure chardev/IOCTL ABI approach, refining the IOCTL
> based interface already present with the previous FS-based ABI.
> 
> INTERFACES
> 
> For each discovered SCMI Instance a character device named tlm_<N> is
> created under /dev/scmi/ subtree.
> 
> The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
> available to enumerate and configure Telemetry resources: Telemetry data
> can be collected using a few different IOCTls, depending on the required
> granularity.
> 
> Alternatively it is possible to obtain a list of the file descriptors
> referencing directly the underlying SCMI Telemetry SHMTI memory areas and
> implement in user space an SCMI Telemetry parser accessing directly the
> SHMTI, while staying in compliance with the SCMI TDCF format.
> 
> NOTE THAT from v3 onwards the firmware interface level NOW supports ONLY
> the latest SCMI v4.0 specification [0].
> 
> Based on V7.4-rc2, tested on an emulated setup and AGI HW.
> 
> This series is available also at [1].
> 
> If you still reading...any feedback welcome :P
> 
> Thanks,
> Cristian

