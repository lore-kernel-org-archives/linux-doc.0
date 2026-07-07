Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B983A7829
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405919; cv=none; b=Vj/pETaiQYttGNUUDvnicpTmlNHhRZoWZtKImZpFeUOd/4i9iCmep/MMbrnJXcNFHBe+lySvkM06/RZ1XTJsKlwinUtzmwyh6Nay7CmGxr4Bs7YkNdgI4hF6In9ulaVIDqINuuycn5MsQTYGHqwyqmZjiWl4WU6ssS31JI7h3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405919; c=relaxed/simple;
	bh=xOzpNGgz/35s6AhmYZGg6Bzw6GoK5tJz7XKF83z9SOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/G+VQ9Pw/2hRLDi3WtSHhW6DNzw2m7ot+cAf6mHORgE8Nk4jJVvYydlbu3qvYpVtqrv7h2ONLJ6kGrz5+7Ero5kJcDv4pG3kjkwvOTLNz+OkuSdtp02aE9zMzAKuKCH3OY7I6Nvx+wEarOR1P5GzKEZOijYhXpEHT2MBI3O2Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Olz3loFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REz70Wkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Olz3loFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REz70Wkb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749AOk2526856
	for <linux-doc@vger.kernel.org>; Tue, 7 Jul 2026 06:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9LSO9pwN1mu
	hnQIbpJa933nRtnrUUSNFdL7pIcWwb4o=; b=Olz3loFVejUIpEvp4bvY2LsmGFt
	13nhc5lzgxUJsx9Y/AbjJhjLPYj3hlkiRGsvAPHvJ0Mtn82LXGJ0pCKlkDvJJnSe
	uY3EczA0NZjxcaytS9uwKD3q3dyerQ6fi5Z/vG7izEXyQeBvWQinhQDvryAjlBfR
	a7bBu4vrYkGU9tDmQ1xOjj375JR+eYweawXO+DvT+0clE/6AsExjQlQZLlD1wDY5
	zXj/JMDMqxvuDRhFbyHhhOET4sBJKvaOvSUGna9Rr6xDNOFGoncaQ7SvkQf8/+oo
	UH1EB2T2fK0a5F4B5t/72eF/wmdbH1nSAZ0ceb4Y8WvKfO6OjNsjsc8jSTQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98mcek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 06:31:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so320219a91.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783405915; x=1784010715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LSO9pwN1muhnQIbpJa933nRtnrUUSNFdL7pIcWwb4o=;
        b=REz70Wkb/R5MZFabWDhOxo+806zenYltRZh7YqJ0rm8WS1EtJoDpbMXxPNsRCbhzMZ
         Yc5HcXq7U4dZ/1WI8Dvxnm2830Gfze9dFaYYnugho/s9IxWCHjrfeWK5qP0ojv/P7cfr
         rGSHyu49Y1BURqU1mnCoIH+wQoUsYSEEQl0mG2+2n5rJ+8qfpPgcesrBatBH0uiamrXx
         wnesuMheyjnnbeRtg2Dd0wT21Osmv+eRz5AlatWIMR34FsBOYIjIjnWcJRlKiQ9sLjy8
         /Jqw+s92ri7ACpmY3yLA4c0dUISZ+WzE6MDLLRatGClQqarvwAIa+M3JveI3zz71lpw3
         OCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783405915; x=1784010715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9LSO9pwN1muhnQIbpJa933nRtnrUUSNFdL7pIcWwb4o=;
        b=l/KA2dwybZYlw1IG/2UDLKxAThnT0GU932vLh7HtyCBrDBZgSilT4yied6tYHI26ef
         3Izz/uk5dV+J3AimtploBQuNVxIIk/Yk6xSFZvGUl05Hw9We/wi2XXI7sQrkw/rE3pAC
         +bzRqks0uoZDygi3bIUQXvqoJ2DsUlI0MeoB/61yHQAyP1KmZV3lVvu0YaIsqC0+rpS2
         3A9gf5A4BQoHh1l4JRKVIwUpLSm3IQrGmQwBmmsnRwF4u+GI8LCwKH5poI3h4Ap3MNtD
         XmWbDUipw6IOKsh47bNGENMTgGYX54OfA5uOJ+PAm+2DDKyCrOCZlz8dbWAh9X3NOZ8n
         Rf9A==
X-Forwarded-Encrypted: i=1; AHgh+RrQcSvPKWfmesLPw3zDdz2omaiPPBi6RNcfW7OEazQEPCjqdbGBZYdh1egkj1Fmrr7KPI4KPhJ522E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRljLX/PnmVPDUmNym0icfu6kiWS9hCvZ8+l5H0fWkpMikpmGb
	VYDXWcGB9/k2AAjeFdbJKaZ5aLvV5MKuZb7jATEse/xJLbwVXtZQcbzq+hQV75QWGM4nTB4fdOh
	2OkZCIkFk/WBgOSXi7vm8EE06L77mdTNkd+MgW2LuPEfInrzUH2skU26WcfPKyug=
X-Gm-Gg: AfdE7clFvmSzW6UfDCECBrh3iy/OiU5w+ut00aISssHEyomu5Sg7t64yfC25WXLSJw9
	Pj8jMCI4pVVM9mkHlSd/Ii3BCFQZJFpr1FYD1I+XP2iCf0haMlwEb0RyrWu2KeqGzwpCVW1X3jl
	2M2NESrPPYnEF0FabFKtR0qcCG7x+6eyJyV7fZI5SMh5kVN9M5z6tsWPE1wcTkXWijlozSrFbSQ
	yzMpORNQxzbLQ+UR3QdohMSb1/zzithUMNyF6BVQK6WgwutXXe7Zh0hzvofZl+PHw2vEN3m65NM
	mNdQRQ1y0Af9xjAmh1AhF8FjEQehCwE9yrR/NKiSj2J1Car/fJWMbJi+iskLme9IDBMCrz3dOEk
	mfgYJOO3Z8oeA2/NvhwtZ8th11/2FJ71gE0k1nN1gpLH2U9WvCXAPJX96MteD7hBdY+hzjRWq3i
	tOkpBPeIE+yv3S3s/IGcP5BbSF3XyoJjHUISM/l9lAEQ==
X-Received: by 2002:a17:90a:c2d0:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-387e2f3cfaemr1073911a91.4.1783405915267;
        Mon, 06 Jul 2026 23:31:55 -0700 (PDT)
X-Received: by 2002:a17:90a:c2d0:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-387e2f3cfaemr1073885a91.4.1783405914795;
        Mon, 06 Jul 2026 23:31:54 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483ddd1sm4661550eec.9.2026.07.06.23.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:31:54 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
        david@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
        kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
        kernel-team@meta.com
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
Date: Tue,  7 Jul 2026 12:01:37 +0530
Message-ID: <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c9d5b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=UIZCFarK5jCvrK1TzyMA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MCBTYWx0ZWRfX7wxMwjSDMP77
 jRN0rABYHkdypPvVAfI2BNPxxZAVaFI8e2ytmc0SBy/tuwxLC+qP1MTovkrVyzNuUsu3PLc/ouT
 VLxZmF3DW5kGA6LJf2rO5iZtVId1cE95FcsPibyJ+/jXVOoOJbNKR44IXELN9gJ7unKH8bWCL2N
 4wSpwpjuyfGaz0P22oWX4ZVmhmdP0sZkHPq99P+nIMv3WsIkSkL2NERESzu3/NNZ4y4fE/6jZdC
 vIh71ly4DbIq21P32EKsx0uSWVHkmkYnRaj2DLrr6qWpFOImKSBvjuK+hrcLOJ/7ZQl02SAaNmh
 Mzd8UwP9PvN+n08PhQfGPA7SH0BoRApPBj+/rIKT8rwbhMAyedvnYHLCazXGFgT+zJuW2odjOsW
 wSzPtyP95IOuZ15L28032uJd9TxSeCI7fVB3RQ5FkATrjqiSaOp9DjrhfurO8WGzknF1LVyjbOo
 I/12xA5w2lsVNvpbqew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MCBTYWx0ZWRfX2DaZ/rJ9MLDC
 XqHinQ9vm38td7NqID7yzlYj43AVy5VmdUI1rVnlaHhAlyXnzJWwv5aK2Afh+YlKLX9/qinlAmB
 GVMvNQ+hHrJlzD/OKr65jDgz2h4qnB8=
X-Proofpoint-GUID: DzO8_G7L5lJ8gMUQl07QoRjqVgYXBSRP
X-Proofpoint-ORIG-GUID: DzO8_G7L5lJ8gMUQl07QoRjqVgYXBSRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070060

Hi Cristian,

Thanks for posting this. I think the direction of not forcing these
Telemetry Data Events into hwmon/IIO/perf prematurely is the right one.
The cover letter explains the core problem well: most DE IDs are
platform-defined, and without external metadata the kernel cannot reliably
know whether a DE is a thermal sensor, a performance counter, a power value,
or something entirely platform-specific.

That said, I think the current layering is still too SCMI-shaped for the
ABI it is trying to introduce.

The thing being exposed here is not only "SCMI Telemetry"; it is a more
general kernel concept of telemetry:

  - enumerate provider-specific data/event descriptors
  - expose capabilities, units, data format and topology/grouping metadata
  - configure collection rate and collection mode where supported
  - collect samples with timestamp/freshness/validity information
  - track generation/state changes
  - optionally expose provider-private raw backing storage for debugging

SCMI is one provider of that model. It happens to transport the data through
SCMI v4.0 concepts such as DEs, groups, SHMTIs and TDCF. But another firmware
or control-plane specification could show up later with the same broad
telemetry model and a different wire format. Call it XXMI or YYMI: the
protocol mechanics would differ, but the kernel consumers should not have to
learn a new in-kernel and userspace ABI for each one.

The common ABI should therefore avoid treating the DE numeric namespace or
the wire/storage format as the abstraction. The useful common contract is
closer to:

  - what is being measured: component/type/instance/name;
  - how to interpret it: unit, exponent/rate unit, data width and signedness;
  - how it behaves: instantaneous, accumulating, average, state/counter, etc.;
  - how it is controlled: individual event vs group-wide collection;
  - how fresh it is: timestamp, sequence/generation and validity/error flags.

So I would strongly consider inserting a generic telemetry layer above SCMI,
with SCMI registering as a telemetry provider rather than owning the stable
userspace ABI directly.

Roughly:

  drivers/telemetry/
      provider registration
      descriptor/sample/config abstractions
      generation tracking and poll support
      common userspace ABI

  drivers/firmware/arm_scmi/telemetry.c
      SCMI protocol implementation
      TDCF/SHMTI/notification parsing
      translation into generic telemetry descriptors/samples

  optional provider-private raw/debug path
      SCMI SHMTI mmap or dumps, if kept, behind explicit privilege/debug
      policy rather than as the baseline telemetry ABI

With that shape, future in-kernel consumers could bind to generic telemetry
objects and capabilities instead of SCMI internals. Architected/well-known
DEs could later grow adapters into hwmon/IIO/perf where the semantics are
clear, while platform-specific DEs remain available through the generic
telemetry interface plus userspace metadata.

This would also help avoid making the SCMI protocol's internal resource
storage part of the ABI. Right now the public protocol header exposes
structures such as scmi_telemetry_res_info, scmi_telemetry_group and
scmi_telemetry_de, and the chardev indexes those objects directly. That feels
too tightly coupled for something that may need more consumers later. I would
prefer copy-out or iterator-style provider ops instead, for example:

  info_get()
  de_count_get()
  de_info_get()
  group_info_get()
  intervals_get()
  collection_set()
  collection_get()
  sample_read()
  reset()

where the backing arrays, xarrays, lazy enumeration, SHMTI mappings and TDCF
parsing remain private to the SCMI provider.

The sample side probably needs an explicit common result contract too. A
sample is not only an integer value: it may have optional timestamping,
provider data width, stale/not-yet-valid state, partial collection failures,
hardware-fault indications, and a sequence/generation value that lets
userspace detect races against reconfiguration or shared-memory updates. Those
details can still be backed by SCMI-specific status codes and TDCF parsing
internally, but I think the stable ABI should expose them in provider-neutral
terms.

I would also be careful about freezing the raw SHMTI mmap part as a baseline
ABI. It is useful for bring-up and high-performance tooling, but it exposes
firmware-owned shared memory layout and TDCF parsing rules directly to
userspace. If this stays, I think it should be clearly separated as a
privileged/debug/raw provider facility, with a precise mmap contract:

  - required mmap length
  - vm_pgoff semantics
  - page alignment
  - VMA flags
  - cache/coherency expectations
  - lifetime across reset/remove/reprobe
  - required capability, if any

Even outside the raw mmap case, telemetry can be a sensitive high-rate view
of system behavior. The ABI should make access policy explicit: who can
enumerate, who can read, who can change collection state, and whether
production systems can restrict sampling granularity or intervals
independently of what firmware advertises.

For the stable telemetry ABI, I would start smaller: descriptor enumeration,
sample reads with validity metadata, optional group-aware configuration, and a
generation counter/poll mechanism so userspace can detect reconfiguration or
partial re-enumeration races.

One other point related to this layering: configuration appears to be global
to the SCMI instance. Any process opening /dev/scmi/tlm_N can change
collection mode, sampling interval, DE enablement and timestamp state for
other users. That may be OK, but it should be an explicit policy decision.
A generic telemetry layer could make the model clearer: multi-reader with a
privileged/single writer, or fully shared global controls, with instance-level
locking and generation updates after each visible state change.

So my high-level suggestion for v6 would be:

  1. define the generic telemetry provider/consumer model first;
  2. make SCMI Telemetry one provider of that model;
  3. keep SCMI/TDCF/SHMTI details below the provider boundary;
  4. keep raw SHMTI access separate from the stable ABI;
  5. define common sample validity/freshness/error semantics;
  6. add generation/poll semantics to the common ABI;
  7. make lifetime, access policy and configuration concurrency explicit.

I do not think this invalidates the protocol work in the series. Most of the
SCMI parsing and resource discovery can still be the provider implementation.
The main question is where the stable kernel/userspace contract should sit.
My preference would be that it sits at "telemetry", not at "SCMI Telemetry",
so that SCMI, and any future XXMI/YYMI-style provider, can share one consumer
interface.

Thanks,
