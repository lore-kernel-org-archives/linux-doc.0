Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4454FC8F3
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698220; cv=none; b=dp+O4VQqkONRnEJOuzDxzU7CW5szOTyIoMeh9xTyRO2QC9EeJdir8oTn9+IPzGgCOgCwpb8pMHa29ixWELgi+Vs9qGk94RvodVHyXeGJm5kG67pxvnvN2ny5v6XzEyUnKWnWE/HU87FA9itypzCHGlAnLdBlQY2hpodcPpHLKqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698220; c=relaxed/simple;
	bh=KeqC9VQXrB3+4LnVZRdfg14afrTEwBP8hLl5Kyalv0g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NWQ9c1UtzqkhAK/l6VPhP6CrVUo3kJHsfE6BKRCbMSk8gZVVA9xNf8tNuHvLvEQ/SJKybxNWiDSRVUqxLt3dd6ap+kAdfWCsgkXizxH8t5yM3iC/oT8MZ2UiiLSWoibvQbysG2p+RaJMPnmsKuY6XS8irIRrVyJcF7xpR5Pd+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmJ/TaNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFd/2KE/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmJ/TaNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFd/2KE/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqh4X613444
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 16:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=; b=QmJ/TaNbDw+ozn+u
	9yy6hwUNlhl3CuoQ9RpIiupjF2ujDaTV3C/H7E7HAOGbiYXv/kmRExf9S61Tkfxu
	QrRmCiDQ+TFmaZNNgO/wjzrm/LLmNR9YXFWR0rX6UcwYd62VLLyyuWSXco0rFfbw
	zhuTXhw5rLjACGxdrSByOdJa+hg1e4Cdr+nBIGqeVutomoVGRnDEqWt4EM36UdQ7
	oZ35NNbP0Xg03yUqk1UkdXpvkXDKnLJX2/H8+cVTX2JGBLVRxkky3uwIUjSOQGbj
	Eo7Q9+5xBgIc25meQjENE6wkr/9ToMtugDaKGRAD1QxSp0G9Y8YlSGcO81fs6Hm2
	T63uww==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew3fv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 16:10:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so13234c88.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790698217; x=1791303017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=;
        b=OFd/2KE/TYlOOvf1JKnlMeXk32YcFv79Zlmcg4JI5CHY3IQL9PB69yUdz8xUSeZmpM
         azWi3w6JstGTNxykoqDXJZvhKtjkmkwcVkQD3EVn/ra9ByFTENFBe5ZXFE6WddKhURip
         KNitepjo89FBNAK3BTc9fiQ36rkOClFCMMWbljK4PotmPeco1L9D8c5GKzqP+jMk7BkY
         AcMHVMC1gOuE5g0Rl89Fze6dYlAoYWu4e9aBQqcfIQfBag8B+yfZ2EPx4Ur+6av3osnr
         bPDKTHXe+ufY9rZKLI/OPYpz/a63HCREnW+nVJtJQ15KW/l9++fVBdY+KRNwuI3VmTsf
         sWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698217; x=1791303017;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nZ5FtLuY8+oVQiX89WT/WoAXT+i4QfhDJec0aS0UqM=;
        b=aygb0dNvSj0zLMvYGZxEvP9tk6JuYkIxqK1ZOsNDaEJowUpDoYUzmwtKWTIDGnTExe
         dQHSzzazSLExZvpcz4tApViXoHj7JTttuobg1htzhDGrq4vUv3BaF2UBx19gTGw4U1ue
         fJ+t+9kFtxlCieasMLdSBdqncVL8G6uV1WfpgJAlHELCmUwyLaYDNIlw87sdNRRUl3V4
         AN4PDH2Z5ZVY0yhqf0SZUGIXTN81L/YupM8QzzemigzOXpmOGOfVOlAn4EAhW9gysnIF
         9/zMb8S4qzdMhK02lXAL6+3cv3Zhe2wHnbG+ZKSXDENWw0l0eV6dvZWMZCurhHZyXcb1
         B68Q==
X-Forwarded-Encrypted: i=1; AKwUvBwnZjf1OiEk3iaN1rEd9RKHNm6212pjqicEC24zh5E4vHvoTAgI6pPD7od1OCT1y1398frzOQPaNX0=@vger.kernel.org
X-Gm-Message-State: AFuF++mKrE+vuqv/tjAe652i/3aZU0dz/ylu+LCU0Dylr5UAQRhMkVZv
	JlT7NnCX6nZd9ueZg3yox1tmbVEYX7Sj88X68egFA+mY3ZEqvdez+Nw1fbXJVsxUXKgCHH/ChrT
	NE6VXODHP3Ni5cRssF717hfMJT6diyn9Zm1EqLoYtnFPIs+bjYyrHfSfdaCDNSoA=
X-Gm-Gg: AYBFou2RahvUJnLEekiMLlUeTUitNtpC5yOk87sRSiLQwFwTfnkgIfp80uAWEH+Z4EG
	tGZrk2yKewqP7cCOpceQJo8GCvodjsc5xbJfwrQhzHxF4S4JlpWAjd2HxwJeGfngcCStY5cFgb2
	VqdDnrBq5wtaIKUXxW40dFMYOzXGAtsqZMkjil935oGnXRtASTTHiYeSla1GzTjg+ZW34MbRwwV
	ayfa3fQFmlUMpf9vBTQctzpl7wylWxCuhSpxY06hJ5I3RMpi6P6Bd6F4xvovK+RkzINelDJRj91
	xiIdeGzZ0OUTYLBtvEIy3tYlBtFEiuoHI29ul+4B3lkKVnD7lm1b0yHW7BKOAj3CW5eOLCzdNxb
	AzZan0aeccF+fWvMu3pLjxBG3vexUlhyJqlUqa//3m9emjt+OsyHX/c4=
X-Received: by 2002:a05:7022:7f1c:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-149cfa49d51mr7719495c88.3.1790698216636;
        Tue, 29 Sep 2026 09:10:16 -0700 (PDT)
X-Received: by 2002:a05:7022:7f1c:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-149cfa49d51mr7719451c88.3.1790698216013;
        Tue, 29 Sep 2026 09:10:16 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c6489457asm350724c88.15.2026.09.29.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:10:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:10:11 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v12 06/25] firmware: arm_scmi: Add basic Telemetry
 support
Message-ID: <20260929091011.000076d2@oss.qualcomm.com>
In-Reply-To: <20260928130134.000019ff@oss.qualcomm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
	<20260920091928.2014972-7-cristian.marussi@arm.com>
	<20260928130134.000019ff@oss.qualcomm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX50hIJCejdB1d
 QCYzJdjI7+SL6BaqVAUaOQwR+IVmyF9omxfCuYMD4M4zRs+yvENuwLq5Oedyt5+3QMNXuA5/FCP
 bzgD9AxDq3Obj2slz74x45wa0cdPddM=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbe2e9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Usant2sCTZzwgyS8W3EA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX5e6lzsD1XfX5
 Z5kEZ1zZqE+uRw+kVj499U5YEJsQ6AN5biPGfTBD4dMpfAKyQBliaoqaETcdv08/f/abeCDm4C+
 /fT9W6+S0t3zLZR5W4sxZSlxGnlIhIC3OK9G6vlSR5fI4D0cZj2kwSUnQj2hGvmxq6ByDZ0oZYb
 heZA31MH/WMIDeM0vBqFjPeLBVIMXYgWzSARfay52MSh6B3M9G60ZqGCJXjdoY1b4CfC8ZiSsgE
 rSlg59E0WT0yLwQdvnaz2fer3T9La19+YVgF2zpE/0VQQ4RrguhfW8P3STlkZL/RXeCm0uzPlrp
 6JwtYgylPDsALx5T4Sc+Y6knSft6DFt7mmZOIFTCYBm1vp4dHoMQaTDZj4iibIgL8Rp1M3aWKHy
 wNGyrIFTFOJggbuTTnIKs9PTa3IseJg4haCodzGtIN6b4+rpDOyBC5QM02ppvkVVDOEXfEbQjHs
 hA5mO9NZCP1DIG+9KCg==
X-Proofpoint-GUID: 4_qn9Jsr_NvOsaS8PPlPi5UuNpK-zWkj
X-Proofpoint-ORIG-GUID: 4_qn9Jsr_NvOsaS8PPlPi5UuNpK-zWkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290064


> 
> > diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > index 5ab73b1ab9aa..2850b018da0d 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h  
> 
> > +
> > +enum scmi_telemetry_compo_type {  
> 
> I'd add some breadcrumb comments to help people find the sources
> of these.  My personal preference for enums of things with spec
> defined values is to also set every value explicitly.  Makes
> it a lot easier to check individual values are right.
> 
> Note that there are quite a few more entries here than I'm seeing
> in DEN0056F so I'm guessing there is a draft version that isn't public
> yet (and I'm too lazy to see if I can get via other routes :)
Ignore this one.   Somehow I didn't notice two columns, though I will say
that is an ugly style in one table!
> 
> > +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> > +	SCMI_TLM_COMPO_TYPE_CPU,
> > +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> > +	SCMI_TLM_COMPO_TYPE_GPU,
> > +	SCMI_TLM_COMPO_TYPE_NPU,
> > +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> > +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> > +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> > +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> > +	SCMI_TLM_COMPO_TYPE_IPU,
> > +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> > +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> > +	SCMI_TLM_COMPO_TYPE_SOC,
> > +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> > +	SCMI_TLM_COMPO_TYPE_SMCU,
> > +	SCMI_TLM_COMPO_TYPE_ACCEL,
> > +	SCMI_TLM_COMPO_TYPE_BATTERY,
> > +	SCMI_TLM_COMPO_TYPE_CHARGER,
> > +	SCMI_TLM_COMPO_TYPE_PMIC,
> > +	SCMI_TLM_COMPO_TYPE_BOARD,
> > +	SCMI_TLM_COMPO_TYPE_MEMORY,
> > +	SCMI_TLM_COMPO_TYPE_PERIPH,
> > +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> > +	SCMI_TLM_COMPO_TYPE_LID,
> > +	SCMI_TLM_COMPO_TYPE_DISPLAY,
> > +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> > +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> > +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> > +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> > +};
