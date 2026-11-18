Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022792;
	b=2+mkGaRSE98Ke9mxH1atbZ0dx+FNZ2nSbZrFocfK/K8Nzq6vnZbKBXA7/w5Q0KLsS2kb
	 qwuQZZf1/F+zbiqd6ANrCtebJROzstF6HJfui+kHXLPLN0xwkxIpgTugixYaiUoa6rnk9
	 Lss6MtCF2M7s58lIZpRT9S8zstZYCWACuFQuY3ER2FPYC7YaSHRZzY7+P5MU85o3lzVK3
	 IrHsn2di7MnPz5RjC0RyYtbK93yVUjQgc3ka0Wq+wykoaLtsSCE7PIJcXNvZwshZ6K3Vz
	 mLsKcZgusEU2/dqjJyw6YVtGehKl6fDcIy9J3/Fjh7mTcc2rfeSW1yFnh7szkOZkGxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RW3VrDJt2jwVTxo1IxmYUqwi3Wi45tGK1TjCoqfFq0w=;
	b=Wl7qGcEqc1coZIOPT6M0gy27zGt6dsXe6lvSEWMHL8p8RTvjsVpY3/YyZXATr1f6+lgv
	 rb1PfdWyH5NGA1VK/YIWERulramI8g9tIMLBgrj+KOkObNg8e8TBtbaKwZp3JdjvTp+mJ
	 T7Q05eQhLx7bzL0CcKh9NYWekwx5/QXw7LAueJ0g1IWA0xD9j16WYdsd8RXnN8Xehrgf+
	 N5tuEorV0zJBXdDRdKqCI9st8qvd9dladNWn+kUf7aFRjFqU6c3Wif4JEUIN2sGDATqrm
	 NRvGsDJJRRZwQEB2jFJIOORu8PW9nG7zgCR0qFtckwKz1Jl4Yd2bJZ8OTshnovUUhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQar5ru2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XAfrputA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BD1606B5C1
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BD1606B5C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQar5ru2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XAfrputA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHHLpq895121
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RW3VrDJt2jwVTxo1IxmYUqwi3Wi45tGK1TjCoqfFq0w=; b=YQar5ru2ZJRA21yd
	iG69+sbMplKpJXo7wVX6UP5PPD90Cy9ibfd4l7ZuEFKY8rrHN/VDBNLpHiAu9rlZ
	YbOlLg9l44mCmgjJhIceUOLa+lJsqxPbLFWQXDQLhKFxKlo3atLqau/bhX8a9iP4
	SxJx4lIrxxSLitIRlth7Tkx3SUsJoyg76ZqxKPWaPhQceejykdeNC38wiARdwfi4
	6dEHZY/fAwZo9Wwg4prbO4Wu8xnUBaqVpq3v+Y9Tv+kc6wmQ9pkK1fgaBTUR3dhH
	suy9pn/N4pcvvV/mGyl1ZaRnK2VrBhf2geRafZTZ76t9TiiXXStrGO9BI66kc8QN
	8KBbuA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p01ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:26:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383f2d05c73so122236eec.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 09:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795022789; x=1795627589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RW3VrDJt2jwVTxo1IxmYUqwi3Wi45tGK1TjCoqfFq0w=;
        b=XAfrputAOunWowo8og+wxsxbwygfqgaGe/nx6T4xz5bDI+Q3g1pkgaAD7NyDeTBEzw
         e6cBizyEfE/NMDvxxs226M8NG/BY+4kNBokJvUeVqA6Y3jLyIeEkw90Od/PFCMGBA9al
         PZNe0w4WZhNhZdg9Xqjtt+u2epfQhnXJbQ13bCMyUkCXuuje6v9kFu8/eBDWbJJd+73C
         jzTUQzasVB1RpzLysN6JATPXCixiqecLr2iV4naRv8MdBrxXFTbeLpvUQir+BfKi6DrW
         mKtMymyRnPZkW3cc+y2KNV834ZvhEyqb1RGBCqLduF9qOoY0wP0S9InP+UaDfElNYsCQ
         wGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022789; x=1795627589;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW3VrDJt2jwVTxo1IxmYUqwi3Wi45tGK1TjCoqfFq0w=;
        b=jOl/ksiUhuRWrVLkdRMjN9z5VVZVHR+gyh3iPvuTCpbtykIo4df2sDBwuTkSFYeAaK
         hs+3evPS/uNjFyRyJ7cslmW/lVTP3c4Rl5tQuOlwzSIvjulkuxihGVMGQq6km2+ZoCkY
         R84wXDGRnOf0aNC8Txfm5QsxeNG8fDZQoicVa7dfjVdvSKAuNb+E++t9o8vdx2cEtYSw
         AgxNTFgxOQCkguURssYEl3rfWg7d7/iEmwDJ2VYqAK/+7T1PsD1wD2a4wIOmUuJVqDqp
         mKFn056W14T+XWn4ZCVsD2wDd0mvyd5X3+EQVtGcWnQ+RIkp/IVYi3gvz1JLZHStRfCh
         adyA==
X-Forwarded-Encrypted: i=1; AL+hErEVKxAuBTS6xd2b4+27zfGsySyfumDpitObnVGqXr2kAJsWknn3DBtxmENfnie+qnmC0TuINWlB/Ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KUHe/OM6LCE24bXR90e1mpyUvcSzjt0EYaWBbzzNVVHDHtI4t
	yJo+gYn0jP2H3ZtEYJpzDRD6XaJemFbERHtAYTPUvodURBlMR+MbvMWrf2D0kr49YlrAG/KXg4U
	m/27F25eDG4BK5qfgdNeIfldSyo7k6TFIJA28hhqryuSUKzZTB3gQDVomdT+mwxI=
X-Gm-Gg: AZFdTZfHwS07J0dqxeicnslQUW0Rt7H+brJvfxTOkrs4jD8esWBo5kfkFFgbItEW3Uy
	8+MqH9JX07dGoXpOcwqdA90k6DufIqUPv9Sabt1w1BZWqwqNvdj3HaLvGyWFeQ9Z9QEubIw2ibp
	3uXnO5YDHEJXAyMMiR3pVjv1rAkkvO+f7fF+QeGUUk1RRy+yQSqx066rC+gfZY736WeQrxQgz2U
	RijC+ZdRt1BE/x0EQBPfwn6w6oze9cm7Cvr6GTFP//L/QIMhWbNTSXTLTtbffHg06os+yxcg+vG
	qdwThqzctLIfqtd3BeLoz6KFPCkzq00g8Y5gSuYpQex4AOS9G82wDubp3OujPyEdilrKxJ2H4Zs
	lPkFF9TIXP3Hn6Dx0yodigz2klV2hCqXMlj2rJ/H80v3qSj8Pcm/ae97BmkAUCtVSPMTYqrgtEW
	m3/nyLDpFRF3gfJJtF03Tr5CBsufw=
X-Received: by 2002:a05:7300:bc19:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3827f98ff0cmr3828984eec.11.1795022788958;
        Wed, 18 Nov 2026 09:26:28 -0800 (PST)
X-Received: by 2002:a05:7300:bc19:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3827f98ff0cmr3828923eec.11.1795022787802;
        Wed, 18 Nov 2026 09:26:27 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm10705697eec.27.2026.11.18.09.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:26:27 -0800 (PST)
Date: Wed, 18 Nov 2026 09:26:23 -0800
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
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <20261118092623.00000cc4@oss.qualcomm.com>
In-Reply-To: <av1rTY1cZjRbxzD6@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-11-cristian.marussi@arm.com>
	<20261112100145.00000560@oss.qualcomm.com>
	<avYZ2t_GoT7BN2nU@pluto>
	<20261116133638.00006cc3@oss.qualcomm.com>
	<av1rTY1cZjRbxzD6@pluto>
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
X-Proofpoint-ORIG-GUID: r-wlvKUp8NWgwa2XF-M5-2GT1HXMSQXm
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afddfc6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=woqvtWepuCvEniIg8AEA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2OSBTYWx0ZWRfX3zuoHNAZfdb5
 iYDTCp/NRt3ytiWuAT6X3u3HvbxVaHhaRY/lpEfFN11+b+5oiZntB8b0HOioOZfbdD5eNwCyXtS
 jH38P5ZYQA0VClKdee5Xf2gf6bPOmSvkoKICD6/51feviLmae8x5/wm9KpBCpH0mSaSnrg/x7pE
 x2tRlu26IXp26zyq5eQ4a4nZESIsoOcWh7k5XVubgbLXtYrRmO6Ia9FRUFSAcG37Fz6AwZfQc4n
 zmbD5jv4KWq5GovUSOdzTCMg0elU6qoAvrXGUqfQmeYfo/jrt/2W9irVaR66VKocdutG6EcnyAB
 dbgau6CB/DcXZc5GTthjyMS2hrK34uH0BE9e2b44W6C+XZiuVPrA0pFYd0huU1KpTwyKEM0j934
 myJ0JafMV8DU33vNMmMzMHZGPnUlBmS3Sl88oXCoH8l67MOfRJqZ14YxhG4KylU7e84f/xFEIt1
 7JCFsp3LXn0hze+jHVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2OSBTYWx0ZWRfX4HD+f8rRgBYf
 qkvFQdgQS+wnePy3xw21MTFI+phn2pnLQs+nqmI4OQJy7wbr/S23unkk5yYPtO067hJrxq9GYqt
 KkkMUvtXt23SwdKl5L4ZK8BiZQswADU=
X-Proofpoint-GUID: r-wlvKUp8NWgwa2XF-M5-2GT1HXMSQXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180069

On Wed, 18 Nov 2026 09:09:33 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Mon, Nov 16, 2026 at 01:36:38PM -0800, Jonathan Cameron wrote:
> > On Thu, 12 Nov 2026 19:56:10 +0000
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >   
> 
> Hi,
> 
> > > On Thu, Nov 12, 2026 at 10:01:45AM -0800, Jonathan Cameron wrote:  
> > > > On Mon,  9 Nov 2026 09:11:56 +0000
> > > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > >     
> > > > > Add basic Telemetry allocation and initialization routines, introducing and
> > > > > wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> > > > > optionally using a lazy on-demand scheme: this approach factors in the
> > > > > flexibility needed to minimize the amount of initialization work based on
> > > > > the effective access pattern used by the upper layer ABI.
> > > > > 
> > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>    
> > > > 
> > > > Hi Cristian,
> > > > 
> > > > This stretches across the patch set but first elements related to it are
> > > > in this patch.  How do we handle larger values of de_data_sz?
> > > >     
> > > 
> > > We dont. This was somethig that was on my todo list initially, but then
> > > I realized that there was NO FW-side plan to actually implement anything
> > > larger than 64bit.  
> > 
> > Understood, some set of firmware that you have isn't doing this. I don't
> > necessarily mind not supporting it initially but like the other features
> > it is very useful to have an implementation to make sure it doesn't break
> > the ABI. I don't want to go through a 'move to version 2 ABI if you want
> > this feature' path.
> >  
> 
> Agreed that it would be better if avoided.
>  
> > Let's just say I hit this for a reason. Whether that reason makes it into
> > a production firmware is an open question at the moment.
> > 
> > FWIW I have both QEMU based emulation (I'm working through the process to be
> > able to share that) and the changes to fit in via what I think is the
> > cleanest ABI change. Kernel / userspace change below.
> > I modified this from my original proposal to take into account the
> > desire to add it later (even if to me it smells like papering over a bug
> > rather than adding a feature!).  See below for what that required.
> > Not only shmti is tested.  The LLM found bugs in it's own fast channel
> > code, so take that with a pinch of salt!
> >  
> 
> I skimmed through your patch and it is mostly in line with what I was
> imagining (not even protyped though), i.e. in a nutshell
> 
>  - an ABI feature bit to add MUTIWORD support
>  - a flag bit to activate this feature on all _READ IOCTLs at will
>  - a repurpose of the pad field in scmi_tlm_sample
> 
> What I find awkward is the usage of pad as an index: that will expose
> a lot of duplicate data since all DEs multi-words are now scattered
> through a number of sample with the same ID and TS, and a bit cumbersome
> to handle in userspace to reconstruct the multi-word value.
> 
> My non-tested-nor-prototyped idea was instead to repurpose the pad field
> as a length, so as to pack all the multi-words payload as the trailing
> part of a flexible array member (an extrnal array really being an ABI)
> and use a single structure to read a complete DE.
> 
> In this case the problem would be to maintain backward compatibility
> with the current scmi_tlm_de_sample.

Indeed, that's what drove the just using an index approach.

> 
> At first I was thinking that we could simply introduce a new alternative
> scmi_tlm_de_multi_sample structure that is used in place of the current
> scmi_tlm_de_sample ONLY when feataure bits is available AND requested: so
> userspace knows that when sets flag.MULTIWORD it has to use the
> multi-word structure in input where pad is a length and there are multipe vals.
> 
> While this would work for all the bulk ops since they take a __u64 pointer
> to a payload structure really (so it does NOT really matter what they are
> carrying as long as it is consistent with the advertised feature bits and
> request flag),  it CANNOT work for DE_READ where scmi_tlm_de_sample is
> used directly...so a change in the current, not-merged, ABI would be
> needed anyway....
> 
> Then...I thought that maybe we dont even need this...and this part could be
> judged horrific maybe, so feel free to stop reading if your eyes starts
> bleeding :P
> 
> Currently we have
> 
> struct scmi_tlm_de_sample {                                                      
>         __u32 id;                                                                
>         __u32 pad;                                                               
>         __u64 tstamp;                                                            
>         __u64 val;                                                               
> };                     
> 
> with pad being unused and the whole structure that can be used alone
> or packed into a container struct.
> 
> WHAT IF... when MULTIWORD feature is enabled AND requested we repurpose
> the meaning NOT ONLY of <pad> but also of <val> and use this latter NOT
> as a payload for a single value returned but as a pointer to an external
> array of words counted by pad ?
> 
> The structure size remains the same, while its interpretation vary based
> on the requested flag when such feature is available.
> 
> It may be a bit cumbersome still on userspace for bulk requests since
> scmi_tlm_batch will contain a pointer to an array of possibly varied
> sized items, so item_sz represents the common basic scmi_tlm_de_sample
> size which in turn carries the sizing inside the repurposed <pad>
> field inside for each single sample item

Are they variable sized, or indirections?   Today I think
scmi_tlm_data_read() simply points to an array of scmi_tlm_de_sample.
In this scheme it continues to do that but some of those then have
pointers on to additional storage.  That's a more complex beast
to manage. 

> 
> ...so you can anyway check the provided user-input sizes it is just
> scattered all over and as a consequence also the user provided data
> would have to be a bit fragmented since 
> 
>  - batch points to an array of scmi_tlm_de_sample sized by items_sz
>  - each sample in turn points to its array of values sized by <pad>
I read this as implying they all do this including the small ones.

>  - you can really mix both kind of DEs in the same request: some
>    can carry the single word value embedded in val, multiwords can
>    point to teh <pad> sized external array.

But nope.  It is a grab bag of different types that happen to be
the same length.

> 
> ...mmm sort of start liking this hoorr...or I am missing something ?
> 
> ... O_o ... it would need a tad of documentation of course ...

Quite a bit!  And probably a helper library.

> 
> If you have not fainted in despair, I (and some LLM) could prototype
> something like this in one of the next series ... certainly not in V16.
> 
> ... thoughts ? insults ? :P

It's an option.  More compact than the index one, though overheads of
allocations might undo that unless they tend to be many line DEs
and does avoid duplication of the metadata and timestamp (if there) which
are guaranteed to match in every line.  Give we are trending towards
basically having this breaking ABI change (be it with an opt in)
it maybe comes down to invasiveness of changes in userspace that would
be needed to accommodate it.

Probably a case for a prototype and see what it looks like.

Anyhow, I guess now we have two options on the table we can conclude
it is 'probably' going to be a safe ABI extension to make in a follow
up series.  Not ideal, but I'd rather this didn't substantially slow
down the progress to getting to full feature set.

Jonathan


> 
> Thanks,
> Cristian

