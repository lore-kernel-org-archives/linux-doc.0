Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351452;
	b=RnkB42m8aE478/dw+w16Dkxz3rxgzRqxWDR6hchla8v/kM5lLHNEkUaB+VJQuRj33LSE
	 zSsowJIeuxiQvBUMOEej85z8adT2kT7E7HZfMk2JwR5GsgL0NjXdkcdjmfsWrv95R1sTb
	 hrBxlTZiJOT3ZsN4yIRFA6fNBhShVhnrzaqZbQtxr9RJaoGqlDLJx49W86bEXjHEVIPEm
	 fYNJNa8tHhE1/0ADrRS+dX41EH95AB9w+GtjO+E2lYyezzVsMCearktMQG902XnXLS/Qy
	 KI2QEK7QZF2U7AHcLAZpcfXpZU4hnngc61EDUnEENkqe+0Odk3kCpmSq2yFhwK8GJDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
	b=WCRIKrsp6OAk39TfWrAqeLkgqpvzHFeDapFF7l9TykQgHDwXedtIKw82Om9sMh2UCKTf
	 bOqc9FMcyeH2fEVvSqjQnrebJTFJGd2OKTBMM20Qq+zBT8Rz0cxx8fYupzQUe6+9NoAO1
	 1YaHNk/7WhTNyl/Cmg+bVcfcuASP3NxnNM91ed+rYXxJL7vb8noscdIeIMOf/cljdUX58
	 liYDQviWC2SaAX6dLtrfZDr70ecadgaSrx0y3yVpF9gIEwZAYLtDlLHF36x1Yz0wJ3Iib
	 ULLP6xOqUrklC13GKwaVTzKwCdOCyasnim7dEEIABJV0ZzSqY9gs7og5/rkTbU7UjzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Js6AusJU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISXlkT0g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B811B606A325
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B811B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Js6AusJU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISXlkT0g
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML5Kv1117090
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=; b=Js6AusJU1aJqM0Sm
	v85gNtaAorFofzWUIJj7Ha322GvPgEpTIeZVy1T9q4VzD4/LSFGttG0M6DoaGvk6
	0ZHvrN1ExCGzKerskWkckIa2bJKrCw/J57iuco6mbbfZS2DR4xwSQmUJNQwy6ASM
	5dsPklECATLC56/EJd6s2hg+aa7V7DKHOurFeqoV0m3SPrK2H9z6iz0Nu8+7ZyT2
	Co/GBipnC5PRTxKG3gonvMdijBtHI3BZOpJ1K4C5qYn694totCReBFyZ4xZ6Trn1
	EHnvY3KqFjffoFFWFc2vv490UPCKr42SksVLKistVAAVMyMZHmShPQLJt+RQc4cf
	Si6RnQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva4ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:57:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1238108eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 14:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351450; x=1794956250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
        b=ISXlkT0gdxS2LCoEVKNhs2+2BW0QEC6izaSBA9U9+id3U0YbvEauQtYDggoYEpbvDR
         gISrPnbIFNsVsmCd2leoL6Ff8J4SbE7NoRdmlHuwAoUBkxtn+8eN8QXRBWY+FX1WHxss
         4xcD1YafpDWonBqlm7qe9zRIa9opzo0ElI+EEzn9gR5lliT8wpbCgv/kBPpHwl5lAJ/F
         eBMQw33JrCYfJX2D2RDSoEV+rlt5T3LsIwsPdNZySXSbK75OQP2qY9rcbnsovSdCrvuo
         MNSRm1T9o3iUHDQVX2wI/qJY8D8ZBu2J5KGalUW18FJmLvrhcW4UUafnhhePV6sUTQmZ
         Gohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351450; x=1794956250;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
        b=rKKrvumeun4wT7N/vQKDlfda5MTUlMfQEz3K4FiZrGJGuqnioRzCxx6i/2XoBMo9G7
         1kmmiUlbqNTfkuqvIiUf5AgAQ2ZLR5p/2Bw1sZUEQhH8vmNnW9QfMnmEdoNWIfkPX4uJ
         W6yRuLkaTUL25liJ2KGrZ81xBzy6UzDIuEYTAEz93qOJ4KERI+PVqQQ9DWcdvwtvu7QY
         0b+0kbv69zfz6u7iNyYReWZ7KmUdQOcb+80TBtCzJVDaJE/wBR5c1rr9YE8pKfucRNnr
         wuJCrQRanjRY5aBuYsGT78fLnl7ty26OOfX7e3jbM3AX/3V5k/YpreTOjloHaiuFDHHL
         zpvg==
X-Forwarded-Encrypted: i=1; AL+hErFjksSrRv16N/U4/V/K+RCxjrMq0vMSAShP4WCpeTXvhWk9UCP2zJHJ0/vPIzXHUEBjTB3xIuZMSek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bavY/1M85YFSwSQ5dNL6UYBZbPi78/jO7DT1bcmmaXVMFKZKr
	I3D7seOpX8TKvs1VDyGq6hIGlj8mdtOBAuBv368995eUisht8M2f/+SDGuUgW7GABvNuNQXNxEL
	dUSKKzuMrKYykwmRdg3yHCPhbsfBOgsHQlVvVPw57aDdnjNg04hvB27fUoVuDHYM=
X-Gm-Gg: AYBFou1cCD0NIGddhqcXnL/G0l/hXsM4ZVzL1D/OCNXF98x96ll+erF2BxRrOTSLCl6
	Vk4tf6r99THBO5y2W9Nf0zXFtjmYM7ZlkbVtGzf0GPz2QT3J0SVRA6tThBfZ7hJUUtiPUDQx5Na
	LO1EZF/se/h+bLxD9CoM86Yf23Xosi+n8Unsxbv5Msqhd+lPVHXisGDZyjR5EooiPl9IjsESoNf
	eIKpDleo9WAtZozVkYmTzDKLsWbGsG1zQWq61EVZRKSpytKSrZK5FGXoiO79yZdV2WGM+f3yVWY
	dgOGftX8hLK4pER4vEVGoRQXnthQyaC1L3kYTtzGk7wYWl/B11o51o7rOu2o5J2DHfprcTn7tyo
	u+EwGcYrbI/A6x41wM0q2LvLHN5NiW0YsNb5TT2lwSEz4TuCIQThaIvF8pZw1NNFmFXdcoSOG0c
	cAURRWRtPI0rDdOnpCjRgZynoYPNc=
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr1061678eec.5.1794351449656;
        Tue, 10 Nov 2026 14:57:29 -0800 (PST)
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr1061633eec.5.1794351449088;
        Tue, 10 Nov 2026 14:57:29 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm11561398eec.14.2026.11.10.14.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:57:28 -0800 (PST)
Date: Tue, 10 Nov 2026 14:57:11 -0800
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
Subject: Re: [PATCH v15 27/35] firmware: arm_scmi: Expose per-instance
 identifier
Message-ID: <20261110145711.00002217@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-28-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-28-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3a15a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=P0Bfr-jsjiM-HyT3fQwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: QD3ojobHMOAknHkXIvMI8maYih12XdAe
X-Proofpoint-GUID: QD3ojobHMOAknHkXIvMI8maYih12XdAe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX7r3B5iWIU/n0
 ad8BtNHqtlXghsyUksx8AjqRP8VFWLuLVqYEBI/2zDanua+MA3dsinFjujJE6UGC3YSQpevlDEn
 9jcXI9g804lDF64qdehFacSUkR/qmsk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfXwydNtDpVIICi
 Fsas4j9oUEdijlAHFv7PYDtPkmSYPibGIka0nlqCi4jVa68G1IL4ztFEMeeWHOP+C2bEOPDxGbo
 fhpXlimW0HMTiHba8r6I7rgfeGYhpELgtwXLvFAJkz6CY6teNb+CoqPneQQnbM8qkHwFxhUUADt
 nyg+un37Q9c0THaxHVKXGvI/HqCJqiBZSeCFQ24yHJGugeun/O0oPCu+1dZBSAcpZu+edbWcBkl
 s8wJBqFA33ZSfOQ6xiuZ00SWmkMQ0h79kVA3EDCnT99IHN+O+5i0YL9FZ0Wr4uO+Wtzs0hla4PU
 5ky2D5yzQUIbc6/64WNN541qko2BWTZ3jOnuLqcZ2GBDqV+0v0XUSIr/dUsILSMtToZ3FJXvMxl
 ZpxB8UTpgb3OGiRlB+RQ/+Aq/bfFNHgnxW/LvpbSwMJrBx/HMgMfq0wJIJk4Fp8pyaGQgcXUY/F
 DwaYGmD22uE/AxR7RGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:13 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> When multiple SCMI instances are configured, the SCMI stack probes and
> it is initialized multiple times: one core stack for each defined instance.
> 
> Each istance is simply identified internally with a number and such number
> is already exposed to the user to name the root of the per-instance debugfs
> subtree, if enabled.
> 
> Expose such unique identifier to the SCMI drivers so that they can use
> that same identifier when in need to name their per-instance resources.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
