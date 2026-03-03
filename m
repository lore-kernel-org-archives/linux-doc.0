Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F106322B83
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569128; cv=none; b=SALQRqQ//orR51ueGpV0i5o9i/laHkFOayjeU6CCEqG2a4VuE41aBat9Z53vHhCUZfNP/VRkdiVp4IbbpDExLXJdN9o7rXkoOG7x/HW7XDDKgVf5DI+YZuiR9tCL2vIbqDYaUPIlia1HnITR8JOhhG3NwIn1uaIYiIJK9ftK+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569128; c=relaxed/simple;
	bh=XP5EL17iKgU9V9WW00QNpjGSzNhaRGr7w+/GGq/JKNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oRfpXh3vLs7ynVphtB0TS0tZajoN9Zf93CO+fmkuPN8feD87kL1BHjwUUf6fnoWtBw23Cb+0ImBGYWLu7FVcXcPxFPZPkVX3Uv6e+E1iw1oaunq0TBtLNlVL7VhSUx5HJVZRzSUdIifw8An+WfCDcuM5Ro9twWvH4ZqKAJnGuCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9ITdesh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeHf2wqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9ITdesh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeHf2wqx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H1GKf728215
	for <linux-doc@vger.kernel.org>; Tue, 3 Mar 2026 20:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OK+IIqPNLkgbz36+VPfXuCiJ
	Eyq7012HaDlxd3sHfXY=; b=G9ITdeshOZZ5t5O34VTKAFmPzigux6+UB8CdpDYB
	/dSskvXpGRAl/Ovl/kz9QRZhCw4TYkqQdTq+/JnmcRndNyb/RWcOYFeuOkUch8zU
	PFVzYKrWH2XHRaPmQe7Mliqqkb421nMTy38bmDc+GSubVukvRiU3/C4+bvi9QngO
	xcFf9bncm8K5JKMrzo9KJLaAh+78MW6TBhzMMjtp1raLIC49tRwF6oBPgmThRzeY
	LRrsGOhXLoCoivM3MU+7KS1P2yQXqtVuKYosROicOAUqZ3hak6cMpWA0gDaJayKR
	jCfvrtZgHBWeEwdJMfyy4IFQ+DNra4V6mG68p9Jr7Qhx+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fu1ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 20:18:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso3939065485a.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 12:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772569124; x=1773173924; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OK+IIqPNLkgbz36+VPfXuCiJEyq7012HaDlxd3sHfXY=;
        b=ZeHf2wqxEqxCvLc378fTUyqw415DfFmBX79coMr/Gv4fAv+Xe8rJR6ykqq9lrHOEbF
         Oy4nceSblK7IBdpKYFqqUqxy9dDRN4Ey7nheeoQEAoAFVEBBQfK2dX7vpACdHMWCce8D
         6ovnDuElRcAkOT3tkRW1aWEHOG6hgpR3Ec5RzSJ7ZSi8hK/fsg4Cv7MoWQQsARSwXIv8
         pihnDP2di/GC6jU0D8obpAKXWMkxdRX5SbnmglcezBvVGgzns0ty+nlVVVtVeaFEaxOF
         ST4CJ2QTopJdd++lrlpVUuGGd34U8Do0x/SudE/Tc/F6t2TKzo8LTr/7HLTkXpbPOnr1
         GF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772569124; x=1773173924;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OK+IIqPNLkgbz36+VPfXuCiJEyq7012HaDlxd3sHfXY=;
        b=PpuLo9yKpiFhGCel/kT5m2V3hkMmgkWhc9eYYEZpBG4wRCZC/v+Uowi4k0eGDHVJMx
         QuvnQYOO596feX27byg8tPdyVnBDR57Ag1sIa/6hEvCzbuGTriGlkmIrzHf5CLhnpKpq
         jKf9oL8ZwV69baqTQZs6M+3J6cNeiuxiPzSr5nCLVI9K7wga4gR763AQ2ibwbJ9BtgTp
         lVRlR/lnD4JmhAiGElAry55AoznCBoOq2iz14YQ678CDf9xKRTTFUoXCO7Ohw0OSHkNf
         ubv0cxJNFhP5HnfLOb9/WpVADa1aj55MLDEqyPU8ViWqxIrW+jZE6jnnZahrLyssH4s0
         CHdg==
X-Forwarded-Encrypted: i=1; AJvYcCXVuVRMTuS/kSl1cxwsENuzOEYcMj6pU+6ulUAESuvkeqtF2LbpqcMxHwRwNhK3HP5AYe1vCTq+VWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpc5f2EpZXZTzptn1o5+l6lyu0SsxWyQS1KElcZ2AlTZegR2HO
	uvAO4XcMQmZYIsX5HkvSkPDiX7qTpMalVJSzaj/qWhbhP81iuswKP+zplAhH08H3/izIGEZYSV7
	3+Bbpd6riw0w8T1lxxgUgGl2nRxfMUEG/UTFRK7KXYRGZDF0h4AksjAuj8TXPzLo=
X-Gm-Gg: ATEYQzzXcG94MfEBvCOxTAKnBPXBWkfQz8l2nJfCyvcFuuEZrnGE2KOLOUVSqNldfUh
	gZ9deANaP13oN0o48UY2afMJp9WOuMHguGR8N5LDJW5MrulnqG95fXudIjbZhcdgwFW+razk4SG
	y5rIDxkuwNHY2cbsjL4YYDCLq/PCXKWkKWSpvU/uLuxMnNO3AIvUA+6cH+v4IOf5l3/Ssw84K/l
	wLhrC2u5Ms1QEcfY03ubh2VjkxkvqSrSum251yxn3hq2IIYbmIJIfTkmgmSP3D0EnNHWfBBQv2/
	usWGkYsktH43cVJQ1CMvNPMho8FvS87/gmKinnDhFQ83Lyrmm2zY3EHrhz11Hm+MibEbR7YlPX6
	65kwnFdchYqiXakpACS2OQ70qL13tYBLIcXYdsw==
X-Received: by 2002:a05:620a:471e:b0:8ca:4545:aeee with SMTP id af79cd13be357-8cbc8df0a40mr2321998885a.37.1772569124310;
        Tue, 03 Mar 2026 12:18:44 -0800 (PST)
X-Received: by 2002:a05:620a:471e:b0:8ca:4545:aeee with SMTP id af79cd13be357-8cbc8df0a40mr2321994585a.37.1772569123830;
        Tue, 03 Mar 2026 12:18:43 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485133a933bsm21421905e9.14.2026.03.03.12.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 12:18:43 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
        baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
        dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
        fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
        jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        peternewman@google.com, punit.agrawal@oss.qualcomm.com,
        quic_jiles@quicinc.com, reinette.chatre@intel.com,
        rohit.mathew@arm.com, scott@os.amperecomputing.com,
        sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
        xhao@linux.alibaba.com, catalin.marinas@arm.com, will@kernel.org,
        corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
        suzuki.poulose@arm.com, kvmarm@lists.linux.dev, zengheng4@huawei.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com> (Ben Horgan's
	message of "Tue, 24 Feb 2026 17:56:39 +0000")
References: <20260224175720.2663924-1-ben.horgan@arm.com>
Date: Tue, 03 Mar 2026 20:18:42 +0000
Message-ID: <87y0k8r7j1.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a74225 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=kEJNvqoAXZf1GWF-TxsA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 4CGvfJV-wBcC7ixutFpBydBtu0TYwqZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE2NSBTYWx0ZWRfX1tsGskzBygzz
 LQCWYgm40c1Nha0psiht4Y2xHpu0QmVAgKt1nWZR9meKhB41dKs7kJpp4uGomUtFZvArH/eU7VE
 oeEBJf9lD9aLn9RO0lJYtFWyHFHs6uAe8BU1u01YN/sloDSDW+42VyaIrmNOKSXoIB0cu8crQ8n
 tLE2DoUVubUhJ1yQE+Yp+MTFwJTZ7HYNKdMOR0Qs60sRYSJ1yVik+vBezcJ0qqyD7n32CiBQtGB
 jSYnVt6VVptp2FMz9zOv9yeN1L26VWNCloLoLWYzCxozjcvyRKyGIFJHczfTA+aRBI2o+9qhloS
 HHopn0AULz/1OnCS8B626chsrc59IcS+wwuN9wr8UM2TlO/NWllVLHUPBb32+KLW8CSr6cMGMaL
 Z0PjuW9hw9gzlTjYwx5ETSYtVwriuJZrDOocKdRhhMOBRh17/wa+4vEoY+lEpayPWA0qxEvfKMy
 SHT69fnB6sJ+YxFgqjQ==
X-Proofpoint-GUID: 4CGvfJV-wBcC7ixutFpBydBtu0TYwqZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030165

Hi Ben,

Ben Horgan <ben.horgan@arm.com> writes:

> The main change in this version of the mpam missing pieces series is to
> update the cdp emulation to match the resctrl interface. L2 and L3
> resources can now enable cdp separately. Cdp can't be hidden correctly for
> memory bandwidth allocation, as max per partid can't be emulated with more
> partids, and so we hide this completely when cdp is enabled. There is a little
> restructuring and a few smaller changes.
>
> Changelogs in patches
>
> It would be great to get this series merged this cycle. For that we'll need
> more testing and reviewing. Thanks!
>
> From James' cover letter:
>
> This is the missing piece to make MPAM usable resctrl in user-space. This has
> shed its debugfs code and the read/write 'event configuration' for the monitors
> to make the series smaller.
>
> This adds the arch code and KVM support first. I anticipate the whole thing
> going via arm64, but if goes via tip instead, the an immutable branch with those
> patches should be easy to do.
>
> Generally the resctrl glue code works by picking what MPAM features it can expose
> from the MPAM drive, then configuring the structs that back the resctrl helpers.
> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
> counters are considerably more hairy, and depend on hueristics around the topology,
> and a bunch of stuff trying to emulate ABMC.
> If it didn't pick what you wanted it to, please share the debug messages produced
> when enabling dynamic debug and booting with:
> | dyndbg="file mpam_resctrl.c +pl"
>
> I've not found a platform that can test all the behaviours around the monitors,
> so this is where I'd expect the most bugs.
>
> The MPAM spec that describes all the system and MMIO registers can be found here:
> https://developer.arm.com/documentation/ddi0598/db/?lang=en
> (Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
>  This document has the best overview)
>
>
> Based on v7.0-rc1
>
> The series can be retrieved from:
> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v5

I booted with the series applied on an MPAM capable platform. The driver
is able to probe the L2 attached MSCs.

In terms of features, bit-mapped based cache portion partitioning works
as expected. The platform also supports additional controls (cache
capacity and priority partitioning) and monitors (memory bandwidth and
cache storage). The ones supported in MPAM driver probe OK but don't
seem to be exposed. E.g.,

    mpam:mpam_resctrl_pick_counters: class 2 is a cache but not the L3
    

It looks like some of it is due to an impedance mismatch with resctrl
expectations but hopefully we can get to it with the basics in-place.

Feel free to add

Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>

Thanks,
Punit

