Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519861;
	b=HI/iwylW8vISlE0CFD1yIGSnWmUa0Wbd6hOwRFCLt4v6Z25Jnon8OfKQD10bBW1/la0c
	 VcdYpguXIHFkGWGwiCw8Grj7SJktOtx5LgF/KyjHm4jp6uVtd/7jUonpxypb/xLfeMfz2
	 a9SNfJ5LKmmErZbEOFYfQ+QvK1OI3ZTulD+deyxf3qlxH30jUeg+W1jT/vi7QoMyY0/8v
	 NsVv84OzdAkQd7rcn6/+CaOBxSgCNrFD4oI6oR/vr8tV/4/lYJvnld+TKiFkx2Mhn1xN7
	 ZTtFqJ083g6J2ln7TDR1y9BuKJHSzhkpozpQS7XKmNv5mhd5GZwBuLofERqeijvDECQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=;
	b=fXf4fJKZAFU432JR2ZAOZXt62kM7GdCac2zTHQVYhBYxXxnuJ1sdFsCsnMN+PJf9sR1X
	 ZQQNP42v3TbxqLeRWdMA0uaRhba5x07uQ38Lcg2PMmuNYotvBUQmX5fQYqMiDYZL8ZWbN
	 urGMokdGwwTxFaAcMXaR3jzrNq0gOekFlVsbHI6TVxaNRG9QTr08uMizVfCPFtiqqTTze
	 lGF56+YTD9T26avB7HmEWYBKUtTIl/NpMqqDSyKG8CfA3T8bPjYBAeDR9u2XNlopszQP5
	 rlaXQQndeqIY2z5CkvjN4k9hlKUu/FAfsA/NFqm1U1K2YuTZvr4RULsiRnuJVNFLEVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWGQudK9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAgLUXUv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD21606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 21:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWGQudK9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAgLUXUv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZhFf178931
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 21:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=; b=SWGQudK9aYrpfeUe
	qRTs6vz+IblA+g6HLzEh+HNTp1JWnELbXeYXlgSZ4D2fPe+3AlgY0nfJCmojVecr
	C+1aHyfw3yXogZgwWvUmpNvISQm8rSXicGpc0601ymsG3vVC0nnNzwu95tt4+vCs
	Bcbxjn6HZZ1X+cJSRElTcFVnvSQtwtYku8TUD74ZDphUWF3awQLaBdGsgW4AyT6G
	W7qzXHipUPiDrXYSvquV31srFzv4S58RZ78Y7ViWJZJBenOG9EhrEswCtIA4dsCW
	+blKhYiBYZZmgIcAWEdkgIczvQxR8YKz9apSBUid1wHdMvLOpVaKFGoUNnLABD8m
	RzxBcw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1aytj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 21:44:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso574733c88.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 13:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794519853; x=1795124653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=;
        b=ZAgLUXUvXHLfJwIUZC1/C8MgADJ8bUzvPkeTGkQgmRFBESKj86Eb+up/j8RDo/aGan
         hWTCNA5UNItE1z0awL2jdVixZNnuUSNZRDnNRbXuVs0fC6SN9vXM5H0w/rEL9QBXDvoF
         e931G5J8EiW0fEmBtyEODT5lweQLwCQ7+MU6X/Pzy49lGpPBuLRjVYwd3eT62NXEti6/
         M00s6UBc/B1F7oA5F5BBIuVnX8WQf3e+hkDxCdyDfEc7/GiZ0rYaHjUa8gelPpkVbJ5b
         JVkvvkOQNh7yi7xMfsKwWCBynT+7hj8XNgL9vRPLfPeRBIp8To0AFs9lnAoDpw1q5d7J
         lEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519853; x=1795124653;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=;
        b=E4Koq+S9K1lqRCGrLdKiZkj7McIav4vNUqSe3JXPk057IDT89pqS7uJHA5JgTeTG5l
         zhNZsHB9GK3bp+NPH58engwr8od2J0aTNUTmbuwqfN37umXnRCkIAQaBznSDRLsspDKV
         /42hK+5wtCv3prxcwcrmARmxv2Pn0HRyDF6N1Y29ceUQbltDBZEJC3HdbABZLavt4e9j
         k6QGb0d/dfK6pGqRLJMhPHVOu1yqh83QVR0XYmUq8HERI6O/abJ8ZelPb6pSytRWnIwS
         kZ7oZYLrsiNNoSoQTc8YO+G28i3UPQKEg/t/plhgMJBPNKFd58ye053KCeFBCHgGvixO
         dRYQ==
X-Forwarded-Encrypted: i=1; AL+hErGcCyhcLvJb7N3vc5ilWO0RIRk5BJ1Q+LQ0+66SgCL6pH+dDnjLIz/AWjoN39HxT3wc5CqCz5F5f3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z//0++5r1uoIAfZncIn4fsbux3fe1N1O2EA2Z1aWYYOSHblKUQ/
	NKiKGW2Ci4hXfp3xsIoJty7QSWBNcJEGFpHVK3CqGspShBf5Wc7kHVC5ththWmHrq/ggOTUJvsw
	2Ed5hajBZnq2Io9ACkIqY+JtD2ez74J0dxZrM6uNPZ3qYsK0w2p3K8/LQM189wfs=
X-Gm-Gg: AYBFou0hitWFk7W66dHQ84CdxOOu//DtFOUsucS+D54VSK1VrecoiuepMdkEFYm3Zfq
	X/KLLcooM/Ed3cV6Xi6nDW/+ol3dokrFEhpdbmuNhY9Dri4Nqp/FndU8yuE8cPJyptreS7tP5Cc
	TTg6zPrfq8CLhlz2Hzl1ekc/w8R34kEq0VmlEC2r+LlrUbL4nXpE2iYSB5aYN1+RggzPHdwlxoL
	rg0nBSXYA3k5qlEJ3NWVqzDwIIccScSjiRoIjouP7yM7dnMFi0gGwKIdfJzCOy9vbcJF+vwxtln
	dejxWxfiGwSQYF78Rx7wUdq+aZNUBCKKHfEP/ESA/+6vJavG8ERTrG9cd0SzDq4D3GdZ9rpjFk0
	CHyMpuGQ3zeFCe4PY+nS+P2N67Ktuq902+PEH9YsKdsXuXGMkEzzcdQY7PtsNbM71NtIQRga3yU
	BqgDG3B2gjLGg6mt8pA1rKr3JU4T8=
X-Received: by 2002:a05:701b:450d:20b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b50315f88bmr668907c88.43.1794519853007;
        Thu, 12 Nov 2026 13:44:13 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b50315f88bmr668878c88.43.1794519852364;
        Thu, 12 Nov 2026 13:44:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm1541771c88.12.2026.11.12.13.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:44:12 -0800 (PST)
Date: Thu, 12 Nov 2026 13:44:07 -0800
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
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <20261112134407.0000457f@oss.qualcomm.com>
In-Reply-To: <avYe37QP4Upvp51c@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-24-cristian.marussi@arm.com>
	<20261110144635.00005964@oss.qualcomm.com>
	<avYe37QP4Upvp51c@pluto>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA4NiBTYWx0ZWRfX6DV1HnCFxSqm
 R8jcMMj1ZjwuiHsNq32zZNzGTeNi2uikgV+xzOBmRvk86G6Do28C4xbl0RLT1Xie5g028gyI82a
 nOow+x67vJcu/+51bOulz0Tt6R03kB+ZigX/JJw3WlTayY4n2gE4CXz9mNkrGk9U7/HNfTD6lxl
 lQ9LlNN35fu+LYqSKzTXGc470oMSNISx6dIAq0Zt/Wfrl0Y/GZNpIvJUI0TWyROgZS2S2vMpyP9
 QTBIVn87gzEtRVf8l3TergO1spHl3aS3tojXjwVk1Kx7Am/GZOme2pZmVldLqvCuJtueGxAAbkp
 tjRhzCvaA8aATAIN5q5Ks7C92EwqbbXAxerH025cimne3ly9WzNTyQEYF7tW38sIeNLrTBKwBOi
 PB0R4nGfS4gu7gO/nUJFSt3aMknXisO65CK3mygNSQ9NOUeou0YQ/lOxqmk97Fggf3RZ22VHYg2
 JI4NZmZ/1AbRq++avZg==
X-Proofpoint-GUID: WmeZBARnji6E96zbF6VwwuCoElL6AXi6
X-Proofpoint-ORIG-GUID: WmeZBARnji6E96zbF6VwwuCoElL6AXi6
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af6332d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=reF3IxvR5ta2O57t2W8A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA4NiBTYWx0ZWRfX0FZNXRgiBs6v
 9YBRqaXy1XNaKn0p3s1f0iXlOs3xnk+dl+11O8gw+hf88IfN+z42G+/HUTibvu7hvS4poAdZ+XD
 zqPdQLa0znWiqrFxN+crQEc8KX2hZP8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120086

On Thu, 12 Nov 2026 20:17:35 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Tue, Nov 10, 2026 at 02:46:35PM -0800, Jonathan Cameron wrote:
> > On Mon,  9 Nov 2026 09:12:09 +0000
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >   
> > > Add a per-instance generation counter to track configuration changes which
> > > uses the common telemetry events framework.  
> > Why?  What's the usecase for this?
> > Needs some more information or I'd leave it for now.
> >   
> 
> SCMI Telemetry is specified and designed FW/Kernel side to allow for
> multiple readers and multiple writers issuing configuration changes:
> give that there is NO HW/FW/SPEC limitation in allowing such concurrency
> (unlike e.g. for a serial or an RTC) the telemetry driver does NOT
> enfroce any kind of exclusive access...last one wins when multiple
> acctors tries to configure overlapping stuff...none of kernel problem
> userspace should co-ordinate...and I suspect most of the time having
> multiple apps trying to concurrently issue conflicting Telemetry request
> would be a matter of wrong platform configuration/setup (similarly to
> what would happen by running together all the lovely varied network
> configiratio solution on a Linux box...)
> 
> As said the Kernel SHOULD NOT care, going back to the networking example
> Kernel indeed does NOT active policy netlink access..you are free to shot
> into your foot...
> 
> Anyway, co-ordinating access to the Telemetry resources in userspace can
> be a pain, so the the generation counter is an optional mechanism to be
> alerted when some of the Telemetry has been changed, so that userspace
> can spot that something odd is happening (if it was unexpected) and
> avoid to sample and analyze bogus data...
> 
> The generic event support upon which this is based, it is meant to
> support future events like relaying notifications to userspace...but
> given that notifs were NOT implemented for real, it is not present (NOR
> the related ABI...)
> 
Ok. That explanation makes sense.  Given it effects how userspace will
be written against this stack (maybe assuming folk don't just bind a single
daemon process to it) it does have to be there fairly early. Maybe
a follow up to the initial set like the stuff for already events.

Anyhow, add this info to the patch description!

Jonathan

> Thanks,
> Cristian

