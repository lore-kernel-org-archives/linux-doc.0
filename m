Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242216;
	b=bJ70jxRFb5z8zU9QMmh3+/IUQC9qZLJjdOf2ACmA8TltZlSVGTK9nCpEMkOvLGdF1w5F
	 5QG8kil1OJFXzr0MlnB6o1tlzuGyCCAuGvbom9Pc2NIttMKQxYb1hBBIFpCD2TpqNnxtX
	 yVZzx///QKfKrVMQEMZyR+FJ+QlCb+Qeqk48QlAaw1kWM5CgCzV26L82EBiob0MapQBp7
	 5WwRWBe3Kqja7oSSFB5DPPYglT6XWQkS7rNT7jXBxb8h9X1xWvU2dtxeuWKNxCYWGKVWh
	 4S7mfWAFg5I0nb3BuP+mDudzCHRdT8F3Mys+TfLxnQ3sDWBUU7Bn9Oo2czlu6U5HOxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jn9CEocg2zylizZLlU3oTB1VMEKBAaE2tCfugJNdHSQ=;
	b=ITUvVRNqWU/dAd1QXye0zgO0OrV/jtKgX6ocRnKMlTcY3UEsTISorRnAMWR4/MjlITsG
	 vcI+RW0MLtjjFpdFeciJJ9a6yR1rV5gojcLBNSVvUoDzLTuPmoCSq8rkRUg73UzxJs+Cp
	 FY4PTDfk/qerMdud6N4XREdKLqIn5hGyh/oOsIbC8eB86vCsEQ8uO9kTBJY542mAs5TvH
	 NWbr7tMhOLZ1zVqYN32PfdXdLNjaG6rwOGLG/frHn/F40V0amoUS+N9VpqrChwnbVvKO6
	 77M49NHADKXNAtem70DzJFkj0u6gDV5jD/1JzrT9rXGotZrp6LYR6l7aRfpd7+TzpeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=msfeHy88;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SLzHrJNq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7677260A6F76
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 16:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7677260A6F76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=msfeHy88;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SLzHrJNq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFG4C971366
	for <linux-doc@vger.kernel.org>; Mon, 9 Nov 2026 16:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jn9CEocg2zylizZLlU3oTB1VMEKBAaE2tCfugJNdHSQ=; b=msfeHy88415MBPwc
	L2uACbLQp0TEuRExtyxYzU291teu/v++InscGb4Aaa2Ur6ppwNzx450ymMgkJ6+T
	RsKi8GKr+ln9kS31RG1mwE7HLQ8zS9AkBTfrRvBIp8KaomUIGxjcbXLCcazMAs9t
	IQiA20uJJmBdCDwoT/mRRETRWRxdcF+cGqiUN7XjYq9Siu5kdnHVZgCVgIBcXc5P
	58qz5s4legHs7/U50tGU9KDu+NKv3Ldhtcbc68SZ+oTIE034fBt4Xb7K58F8UT/5
	3l8HcU9tCM+fn3FczPhTZAoOO0DYs/PpWqece//gUUofGWuBUeeGDlkKdyI0H3iv
	EyNxwg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm42me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 16:36:54 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so926458241.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 08:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242214; x=1794847014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jn9CEocg2zylizZLlU3oTB1VMEKBAaE2tCfugJNdHSQ=;
        b=SLzHrJNqf9j5xRb2SDpdSZWy9ypPctNtHh/7EXdgzvFa++3wgN9My0Z0FyHa6HzEbi
         ybxzf/ZheDp9c6tjd/YD+0WaEH4Q/noeLraKwN6ucjmmk2kFuMZs6tSQGZHEKjuf+uKy
         DcffWqfpNHMAgU0hcNtG2Ldm4bSF1X9eP3B0t5HsmFtP/7T3O49e9XKfR1y6X2HIsqmw
         ZxNN2VQ3LNjqEYMJb8Ty8PpmKXW1d1Dr6XziM7uW8vvK4TsDA3L213s7RaqUfuPCcVmK
         5Zs71CBK5k80iSOCzGdJQMJtsL25LvnrPuMVdhAAmwqF8UsNnTg+RjufFzS3Trm531sd
         aXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242214; x=1794847014;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jn9CEocg2zylizZLlU3oTB1VMEKBAaE2tCfugJNdHSQ=;
        b=i6ZmVMU0vHfJSAgBZuZZKk30aHnSe/sIv55+itcAoCI6k3lwDefL1ousCCPLR6F0aj
         Fb+5VDuJ8e3HmyPYgwD/6q4eP8fb245ABiJD/f4VmwB7yRa+7mv6bAnGngvJA0mxCHR/
         GuspukMSIVvSNBNex6clb8+8P4av4QduK9JT+cP/O+rqo34BK57Wmh7rZHu9NGljqCy1
         KO6JQVbhQM6Hzfk4z+c8H00naoFLLNTC4nCBqTlWT/0YaTCaBkdUxQCrf/h4VvMNlnj3
         dn/FIBPFdP/FKM5NK2kzIT3/mPuHo9LJRohkOAF6LtKfloKtopOdM+Wo1kdQu/nmN/yD
         fPhQ==
X-Forwarded-Encrypted: i=1; AL+hErHqFKa7nITPFCvVrMhBqMDPEwxfokmXqCD6l4YyJtO+wQV1ncXmGTufjMze1n+OFqWKp7FMvHe6Qu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hbETH8GIImYCWUlM9eWPvjsCJogon/NyC1XugnHly7PYfbOKG
	RvLm4LxBoZ3DOPxQYWwU0lHHhhNk9Lgjs6SrPpls2J7IBd6XlATu1e9C6mBNXwbq7fj2uFIhUWh
	QuhP6vStr59EzfWPttjitSUrHBdTzuULNU/kx3+rg8WUinhFbxZqqFxkzeuc4wls=
X-Gm-Gg: AYBFou1qJe65OaQsDxYLjHE0TV0Hae7PozDzMHvJ0dlGlfJdY2n9scO/xyfzZBA1G1J
	ljktPiMmPmPT/JBJ8HKWbuDKmCJtrB7Y1EggBasukkHRKipUIXnOPuHWJ7w1o0rO197tJon/mNV
	YYJUEE0pCISBuTwC9PMOE/aehY4p6biAl+7+3liKbPMrWRUZOtzojWpb34Q565qMaaw3WPrkHxb
	CjQCMKCy59vnRyz3HPss9Sq3ZxBxl6xiuHI48T/oafjAbw55lV19KeSpH/jb32lAzcrW5mz6mfB
	Bxk4N/4fAPd93tIjGD9ZBtZi2z/muwfeLVg9qlMGVGr9tnUgHEsznVFpYVi81m5OucE0cCW83w3
	8tLHLUOx3zUuYDjxrOHhtBQb8Rc09eKFMdcq84hxWxXf0GOzhY+w18VDjT+7lpfLcmYshnWwh+2
	qLf4oJfx2hApladBYAQxV91eX0G9xa7vu8qw==
X-Received: by 2002:a05:6102:390d:b0:7d2:cdcb:6b4a with SMTP id ada2fe7eead31-7d301120897mr5311137.22.1794242213427;
        Mon, 09 Nov 2026 08:36:53 -0800 (PST)
X-Received: by 2002:a05:6102:390d:b0:7d2:cdcb:6b4a with SMTP id ada2fe7eead31-7d301120897mr5297137.22.1794242212750;
        Mon, 09 Nov 2026 08:36:52 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:8ebe:809e:5980:89b4? ([2a05:6e02:1041:c10:8ebe:809e:5980:89b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9a9ffsm11476601f8f.30.2026.11.09.08.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:36:51 -0800 (PST)
Message-ID: <ed4aac63-ac58-4e2a-ae45-ebf4da158228@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:36:50 +0100
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
Subject: Re: [PATCH v3 0/4] Make platform profiles firmware independent
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)"
 <superm1@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX+57pJJ5569D2
 +fUiQlbHUkne86OIldmlWPWdUIDMwR4tsV2wfbdAK6YfIhVk1EW7UJpwkhV5kIVIarLZKLDiXG6
 cC67K3oq7ym9/rk/Q9f5hG4z89usNVw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX2UwpiFDa2z3L
 ntBZ1FJstRLWVv4RFdj5iQJKxZ93HFPjlOhUAUVYljs0Soe6Ufw1NXa4fPKoyfmPt+yxNbWCQRd
 VDjGhSCVtnSQ0/I5Ra1gZS3n5/tTC8p7NeaSzw3EjmJsU4hZj43kvePpkngvO0NhWNs3QJMzpxG
 LCdcfrnxw9o2Za5eOD8Ey4CZQTkxOS4V3y40ZrpOC41e+4rgn/F5rUdbMebx2Ov5ajrxbcEeCwx
 CH3qOxKOUN8YTYHQfnvNNHZj3kYRqx47OiBVbFUSZ7cRqVvBBulu/JX37goMUM21pOgFXVLJAOn
 8d42uvOn5THXJJba9tZ7WHzu9vqXjM6p7P+Jn4X7KqhfrhhZ1j2fwaHuud7JzVuVAY7CtxKMxM+
 GL7+pp0IMmJI/m1OVr6ECj2NH1eIgAPhYrzrqy+DgSVwhWcGybyrvZCEQrc/GCo6HjkwunZs3wO
 3O17PzIrrJ46DjmrbVQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1f6a6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=I2DTqkVBWxGU35LqPC4A:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: EowArOCCem25RNMG0WVEgw-p1sZGMmnD
X-Proofpoint-ORIG-GUID: EowArOCCem25RNMG0WVEgw-p1sZGMmnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090066


Hi,

sashiko validated this series

Is there any other comments for these changes I should take care of ?


On 10/25/26 00:34, Daniel Lezcano wrote:
> Make platform profile selection independent of ACPI firmware.
> 
> The provider API already uses struct device, profile enums and callbacks;
> it does not require an ACPI handle or firmware node. However, the core is
> built under drivers/acpi/, its Kconfig symbol depends implicitly on ACPI,
> and initialization fails when ACPI is disabled, preventing non-ACPI
> providers from using the existing firmware-independent class interface.
> 
> This series moves the core to drivers/platform/profile/ and introduces
> CONFIG_PLATFORM_PROFILE, updating all existing provider selectors. It
> retains the tristate configuration and platform_profile module name.
> Firmware-specific discovery and profile operations remain with providers.
> The core can also be selected directly through its Kconfig prompt.
> 
> An optional ACPI adapter obtains the legacy sysfs kobject and is linked
> into the same module. The generic core contains no ACPI types or symbols
> and initializes without ACPI support or with ACPI disabled at boot.
> The existing /sys/firmware/acpi/platform_profile and
> /sys/firmware/acpi/platform_profile_choices attributes remain available
> on active ACPI systems.
> 
> CONFIG_PLATFORM_PROFILE_LEGACY controls the backwards-compatible aggregate
> sysfs interface. It defaults to enabled to preserve existing userspace.
> Disabling it omits the legacy sysfs callbacks and ACPI adapter while
> retaining class devices and kernel profile cycling. New userspace should
> discover and control individual class devices instead.
> The interface is deprecated, with removal intended after the 2028 LTS
> kernel once userspace migration is complete. A shared pr_notice_once()
> warns on legacy attribute access rather than on merely loading the core.
> The default remains enabled while userspace adopts released class-device
> support; this series does not claim that ecosystem migration is complete.
> 
> The existing firmware-independent interface remains:
> 
>    /sys/class/platform-profile/platform-profile-X/name
>    /sys/class/platform-profile/platform-profile-X/choices
>    /sys/class/platform-profile/platform-profile-X/profile
> 
> Non-ACPI userspace controls providers individually through these class
> devices. Aggregate selection remains available through the legacy ACPI
> attributes, and aggregate profile cycling remains available to kernel
> callers. No new sysfs directory or userspace ABI is introduced.
> 
> The original first patch, "Separate handler locking from sysfs lifetime",
> fixing the handler access race and sysfs teardown locking issue, has been
> sent separately as a standalone v3 fix. It is not included in this series.
> The base tree used here already contains that fix.
> 
> Patch 1 extracts the core and initializes it before built-in consumers.
> Patch 2 completes class-device notifications and registration cleanup.
> Patch 3 documents firmware-independent profile selection through class
> devices. Patch 4 makes the legacy ACPI aggregate sysfs interface optional
> and documents its deprecation.
> 
> Validation performed during development (before this rebase):
> 
>    - ARM64 built-in core with CONFIG_ACPI=n: W=1 build and sparse.
>    - x86 modular core with CONFIG_ACPI=y: W=1 object build and sparse.
>      Both CONFIG_PLATFORM_PROFILE_LEGACY=y and =n are covered.
>    - Full x86 kernel link and QEMU boot with lockdep and list debugging,
>      with active ACPI and with acpi=off.
>    - Firmware-less providers exercising common and hidden choices,
>      profile reads/writes, invalid input, mixed profiles, cycling,
>      partial callback failures and POLLPRI on the class and legacy ACPI
>      interfaces. With acpi=off, class get/set, notifications and kernel
>      cycling are exercised. Both runs check that no new aggregate sysfs
>      directory is created.
>    - Concurrent sysfs I/O with two persistent providers while a third
>      provider is registered and removed 200 times, last-provider attribute
>      removal and repeated provider module reloads.
>    - QEMU with active ACPI and CONFIG_PLATFORM_PROFILE_LEGACY=n: verify
>      the legacy attributes are absent, class get/set and notifications
>      work, and kernel cycling and registration/removal stress pass.
> 
> The provider API and profile names are unchanged. Aggregate writes retain
> their sequential, non-transactional behavior: a failing callback does not
> roll back providers already updated.
> 
> Changes in v3:
>    - Send the original first patch fixing the handler access race and
>      sysfs lifetime locking separately as a standalone v3 fix, including
>      the requested profile_lock protection comment and Fixes tag.
>    - Reduce this series to the four remaining patches and renumber them.
>    - Rebase the remaining changes onto the current base, which already
>      contains the separately submitted locking fix.
> 
> Changes in v2:
>    - Add the Fixes tag to patch 1 and explain how the mutex-guard conversion
>      reintroduced the teardown deadlock previously fixed in 041142d7d252,
>      and how class-device support subsequently extended the affected paths.
>    - Drop the proposed /sys/kernel/platform_profile/ aggregate interface
>      and its ABI documentation. Use the existing firmware-independent
>      /sys/class/platform-profile/platform-profile-X/ devices instead.
>    - Preserve aggregate selection through the legacy ACPI attributes and
>      retain internal aggregation for kernel profile cycling.
>    - Refocus patch 3 on class-device notifications for direct writes and
>      restoring aggregate visibility after failed registration.
>    - Update the Kconfig help and documentation to describe the existing
>      class interface and distinguish it from ACPI aggregate selection.
>    - Revalidate class controls and notifications with acpi=off, legacy
>      aggregation with ACPI active, and the absence of a new aggregate ABI.
>    - Add CONFIG_PLATFORM_PROFILE_LEGACY (default y) to make legacy aggregate
>      sysfs code optional, independently of class devices and kernel cycling.
>    - Mark the legacy ABI deprecated and describe removal after the 2028 LTS
>      kernel, conditional on userspace migration. Emit one shared notice on
>      legacy attribute access; retain the enabled default during migration.
>    - Move the legacy ACPI ABI documentation from testing/ to obsolete/,
>      document the replacement class attributes and update MAINTAINERS.
> 
> Changes in v1:
>    - Initial series extracting the core from ACPI, separating handler
>      locking from sysfs lifetime operations and retaining the legacy ABI.
>    - Proposed a firmware-neutral aggregate sysfs interface alongside the
>      existing per-provider class devices (removed in v2).
> 
> Daniel Lezcano (4):
>    platform profile: Extract the core from ACPI
>    platform profile: Complete class notifications and registration
>      cleanup
>    platform profile: Document firmware-independent profile selection
>    platform profile: Make legacy ACPI aggregate interface optional
> 
>   .../sysfs-platform_profile                    |  12 ++
>   .../ABI/testing/sysfs-class-platform-profile  |   2 +-
>   .../userspace-api/sysfs-platform_profile.rst  |  55 ++++++--
>   MAINTAINERS                                   |   5 +
>   drivers/acpi/Kconfig                          |   3 -
>   drivers/acpi/Makefile                         |   1 -
>   drivers/cpufreq/Kconfig.x86                   |   2 +-
>   drivers/platform/Kconfig                      |  35 +++++
>   drivers/platform/Makefile                     |   2 +
>   drivers/platform/profile/Makefile             |   5 +
>   drivers/platform/profile/acpi.c               |  15 +++
>   .../profile/core.c}                           | 122 ++++++++++++++----
>   drivers/platform/profile/profile.h            |  17 +++
>   drivers/platform/surface/Kconfig              |   6 +-
>   drivers/platform/x86/Kconfig                  |  10 +-
>   drivers/platform/x86/amd/pmf/Kconfig          |   2 +-
>   drivers/platform/x86/dell/Kconfig             |   4 +-
>   drivers/platform/x86/hp/Kconfig               |   2 +-
>   drivers/platform/x86/lenovo/Kconfig           |   6 +-
>   drivers/thermal/intel/int340x_thermal/Kconfig |   2 +-
>   include/linux/platform_profile.h              |   3 +
>   21 files changed, 255 insertions(+), 56 deletions(-)
>   rename Documentation/ABI/{testing => obsolete}/sysfs-platform_profile (70%)
>   create mode 100644 drivers/platform/profile/Makefile
>   create mode 100644 drivers/platform/profile/acpi.c
>   rename drivers/{acpi/platform_profile.c => platform/profile/core.c} (88%)
>   create mode 100644 drivers/platform/profile/profile.h
> 
> 
> base-commit: 8244dc8f69f0e73cb1789355260b7d68bf5494e7

