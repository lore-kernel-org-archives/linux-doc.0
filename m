Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1314499F20
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824617; cv=pass; b=X4Pb7HViV5pYUB5tfhio9jseIdWELchVfwt0lq46nVBtbc971X/xjKUkK5e58lpVO+4V9b/SBr4KiGdRwIHc1twhfCC7tLCtG1RX1JycPEkgnmCHNO+xDItgHc5ePrKWghU+bNNjkSWCswuxnAC3cjafQzj8l+QVZ0xWlTXorwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824617; c=relaxed/simple;
	bh=dKfvJtGHZmzjUIBowW8Kzn+l9RBuWlUzTORhD2jZiOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNAFzMGi1dl3mcZxE/VRO91ystoU+StLd2HQ/tq0Bgum4Kr3fS1rSdxjny0bEY7WAc5vuHLgIq3lm4Jp4IRy4o0TRWsuPWQvOKNLDAoyFrbVlsssYm3yQ7z31V9fnmEabHVEXX5fozYKuIM2ZZ0pSeYZmtDTENJm2W5ww7LB0LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAuM4byR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amcSxPlI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAuM4byR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amcSxPlI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFesFW3851239
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 17:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=A4GClre/w4vdaRAqEfHfWYR6PD2w7avTQzzpljHZmM4=; b=gA
	uM4byRfyRQ6OxvKWIKp3THc23mdB+NTJVIPbnaN3IWktVLDG2tOT4JlHZ8KjcYah
	7G4bdveVl5QKTGFNGjRQUj5oj984gNtTi+tZ4RTnkm40BIf37Z/fK/JGvzureTBs
	1/TvXAFTaKhRc/3RTa58+rcIKq99HJH7aaxcuSJI+cpKbNhHGI418Rac0AniAqMk
	61GRMt4HsWgu2pDkvswTk4tmZn9UVLPLeeYYap7ABZSDOH+aE887WGUELNXtZJOj
	sCL/zgQ2ZK1h4E+RSwb9uWYU7znbrq3xXKpyeLwUQHuhjvS1TsSIaq5oNqZ41s+r
	JCok3Y1ujz6ftBYZISdw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9v9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 17:03:34 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0a28d6acdso13772427b3.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 10:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791824614; cv=none;
        d=google.com; s=arc-20260327;
        b=T9aJxeRNMz7vrq53IpsOaiZSCOWms7FtLZ9B9/1wTHvFZucjqwQQIZkzy3ceWgN3cE
         S0dbajOZLQ4wX46ROzu2dmT8u73t3o/TQ7sQyviXT1W7nMIWAL+EX96o5fQRdCoJrgby
         55OJNl6wc6zQgGF9K9uGnylfWs+to4gpZ+kB0mTAux4Z6IOFiwUqYR348iT7kWnrt7LF
         hEn7iBwgtq4glBcl/aZZ+D5vOIrltJl22YfZg8VGUdUciRuee3gHAw+N4ndBNypQEEU4
         TY/FBMX5d+9Nh0sY/9O21vwb3Fww04dhA3zM4TvZp90nDHTp/m5UycBoAcBlFtmbKW7H
         8HbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=A4GClre/w4vdaRAqEfHfWYR6PD2w7avTQzzpljHZmM4=;
        fh=HLGRrNlyiqlir+bvq6i/RZBFQk9b4IGOX2z4yw/rxDc=;
        b=SiZchEZ92jqJ10br863BFc8P3qjoDM7qj8/mgfsMFLTrxHygn7KTbYsPWSNpuCwaKH
         im5j51wWEfVOyt1czZ9Cu7hPZ9ladeoSdH9reH3tSjK/tv7LXsFJiWJ9LQeu0l8EfN8U
         gUXwhU/bJ5oRvIb4W1LSGG95qWXnpBSBCvYmon2uVlERtemCA3eEHv9Hcqbf/Jooiw+l
         srrLeJcSmj4lIkde6xpVnsbcNgveMQvsTgzZfQaiYuV7kj+rK4olk16Z3xJSXUPU0He0
         6HPuqaJ+u0tJvjeVambzZwAFwzLNT6g+IZc2a187MCi8ob40vrdBj7t2N2jAPdzSHjHY
         LWbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791824614; x=1792429414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A4GClre/w4vdaRAqEfHfWYR6PD2w7avTQzzpljHZmM4=;
        b=amcSxPlIxztVFROzNJvir1BaZpnFHGq+AvAHzivo6RQnik/3RNZspdm0u3UvZ43vz0
         0kT3YI+L2amr9CTKaDwhE4lyFms6HL+TdDoU6JTn2H9WA2INZTgU4AyMfujFKjUIM9M8
         Vv/uO4xZcFxEaGeaQdE6Qz5xOLQ0gExLCX9lZAhI4O8SawOLMWAY9GmC7TljboyTAgqV
         3qpKfRY/3N5ZvI2OoW+K+LE4KYMi1yYHnkMFehdcBLmEPGpE1f+f5/G0ITXvXVqHrQwi
         XK8TrER+LGQ75Sf06tCZbl3rF4o8QKVHfVkEReyfcuhVFJKvAtcY+c84YaO7JYv9ZQh/
         i48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824614; x=1792429414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4GClre/w4vdaRAqEfHfWYR6PD2w7avTQzzpljHZmM4=;
        b=St8WvsOroJQa3qG1Y5xfG9YWIdq6JRx7RPHkfX/AdsjH6FqxY2bT9RFqWbJN+wa6ta
         vZBjdKAKd3YGFQaKWc/sOM1WX1n17MlJSFC+STdciryHcHhIFUpVwlQws/V+CUarTP0w
         Nlf1cr+RwhOu6k86NV6uIBV9fNzHdLmBQ6bLYXQ39ezZlCHH+BTpnbM3GsiEp4i58SxX
         Z/yGb3d4jF2t96z+8s9Dk2lBMRvf3o8yIenedcuuTdyv/RwkwAjV/qOGdp+SpoY+rqj5
         MYyjteXJ3KMDqMlU9OjLrqLMp+78S2CdskaNyAI94oU5v2Ymwf6k9S0IlmtFLmeV6ktE
         p2MQ==
X-Forwarded-Encrypted: i=1; AKwUvByBmtRIGiiaicCFqH0YKsV4msYiiG+IEBVgdd915ss3n2gqPxffCZQt26zRnO25VaA1nO1YjDculVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWyenCmHDSJrnqCNRBALD7l2+hf8rmpzFMwmyfXEYoQ2NRoCqN
	+URq27qtNBZ6ENGknem2Kn6HtUeuGGoLsouQUu9k/KtfCLFq8DfJ3sMqhqG4soE4+LAytWmKFpx
	d5LKYmB4UBw94h/Yf/3vkM0m1116Ng0Yf/WUZ60gedltPQU2z0w2iA7nSzKsi2l7/xYcuFXDD8D
	KIy0Fw04lkvN96ypRecOaYnvtqO+ieMfc9lYzX51iCskJMVfT0VC0=
X-Gm-Gg: AYBFou2qU02GCXTw1pwTFwu5dIP9DaS/I4cYAQeLIfQVapi8SBxDHDmM5f9AekDbqFb
	P6lYMO/VUee1CFLKu/eHh8IZdlKrcl/OySmTCsyLW7vEvZD2JJW4Za5pBxHb1q0T48fxfotgfMy
	D/OYvnOA1eUYsSOzLzy8UtjQmJyOiTwFCUJ7sML03Iu920t9k/47odVXDQ1/A=
X-Received: by 2002:a05:690c:e3c4:b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b0aba3ab6dmr8912267b3.37.1791824613801;
        Mon, 12 Oct 2026 10:03:33 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c4:b0:8b0:aba3:a3e2 with SMTP id
 00721157ae682-8b0aba3ab6dmr8911907b3.37.1791824612923; Mon, 12 Oct 2026
 10:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org> <20261003-dfustini-atl-sc-cbqri-dt-v9-5-52fd8be98dcf@kernel.org>
In-Reply-To: <20261003-dfustini-atl-sc-cbqri-dt-v9-5-52fd8be98dcf@kernel.org>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:33:21 +0530
X-Gm-Features: AclHuK_eAnoXLHNe9JW1H0XsgI027UTvmUTL3dvXmeTZJjwIqBd2LIFlaZxAhKg
Message-ID: <CAB19ukEMKp7iFHrTPawNj2dwf1n0D9VDBC2ycBPdCRbkGYN2eg@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>,
        Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
        James Morse <james.morse@arm.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Peter Newman <peternewman@google.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX6MSxToX3i6Bj
 pnI28CCf0gzLrQQUETbcOl/yDCTHjqPrrBXfdjjhRFBpRSWN9YwczsYQo+3c7uuL7RmOjvb/OKo
 BwDgYBuDTZa3tjQbvKZ2Cyzgm4kQs5i3AmuTcLMcyOYbx4ZgeF8rt1phoiLKWkWvohI+x10a2xZ
 Tf+Keqn7TqLz8aA2/222GYC1ODbKItC1ic5sJyiv2c8nQYCQDn4FJUQEphtzlwpwhv9EoadaoQI
 ePNIG8+AKdnlHK90R1vW+pU7yWBJRPJX6w9hpBbLFob4hMvGxh8RKnYpX8YLM0fxdbV+4wRxKYc
 bJrJ1hGjSURIUj9HCOdt3ngwrALZBZ7HzDZek4OzkwgMFqAbLjsVjGMGmSkJz2SCRIu/VCtCIDj
 sx0T6zxGzVbe3Hr7V7po+YI/1GU+N+ftqMQeKKTSO4iN1KyrJVhtUnC4aEq6jmezNWWzSWlgeIi
 Wjt4GgS83rZtqRQOSgw==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd12e7 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8
 a=u8ca8oee0k6j8m9lC0cA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX5VgHYyDT0kLI
 DgLUIUkkicmxepsTnYV/34JGKm+ACjDgPq6g2tMD2ZtzhZv3ho+KTg17HxqBBSnGzbNMrRDVK+q
 4iFx+Owo6gaVO7D3R1qqkg4mFnoqVd8=
X-Proofpoint-ORIG-GUID: XmNj2kI4qurXCNGE-21VPJ6PwzoRN2cO
X-Proofpoint-GUID: XmNj2kI4qurXCNGE-21VPJ6PwzoRN2cO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120067

On Sat, Oct 3, 2026 at 12:45=E2=80=AFPM Drew Fustini <fustini@kernel.org> w=
rote:
>
> Add a platform driver for CBQRI capacity controllers described in
> device tree with the riscv,cbqri-capacity-controller compatible.
>
> The controller node points at the cache it governs with a
> riscv,cbqri-cache phandle. The driver looks that cache up in cacheinfo
> and uses its cache id as the resctrl domain id, so the binding does not
> need to carry a CPU mask. The controller is then handed to the CBQRI
> core, which probes its capabilities and decides whether to expose it
> through resctrl.
>
> Nothing is vendor-specific and reg is the CBQRI register block itself,
> so any SoC that describes a CBQRI capacity controller in device tree can
> use the driver unchanged.
>
> Assisted-by: LLM
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  MAINTAINERS                      |   1 +
>  drivers/resctrl/Kconfig          |  15 +++++
>  drivers/resctrl/Makefile         |   1 +
>  drivers/resctrl/cbqri_capacity.c | 127 +++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 144 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c362d53ed355..00b92842ef12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23573,6 +23573,7 @@ F:      Documentation/devicetree/bindings/riscv/r=
iscv,cbqri.yaml
>  F:     arch/riscv/include/asm/qos.h
>  F:     arch/riscv/include/asm/resctrl.h
>  F:     arch/riscv/kernel/qos.c
> +F:     drivers/resctrl/cbqri_capacity.c
>  F:     drivers/resctrl/cbqri_devices.c
>  F:     drivers/resctrl/cbqri_internal.h
>  F:     drivers/resctrl/cbqri_resctrl.c
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> index 617b813b9808..689a91873d7b 100644
> --- a/drivers/resctrl/Kconfig
> +++ b/drivers/resctrl/Kconfig
> @@ -41,6 +41,21 @@ menuconfig RISCV_CBQRI
>           allocation through the resctrl filesystem at /sys/fs/resctrl wh=
en
>           RESCTRL_FS is also enabled.
>
> +if RISCV_CBQRI
> +
> +config RISCV_CBQRI_CAPACITY
> +       bool "RISC-V CBQRI cache capacity-allocation controller"
> +       depends on OF
> +       help
> +         Enable driver for a RISC-V CBQRI capacity controller that
> +         governs a CPU cache, matching the "riscv,cbqri-capacity-control=
ler"
> +         compatible. The controller's cache phandle gives the cache leve=
l and
> +         id, which the driver registers as a resctrl cache-allocation re=
source.
> +
> +         Say N unless your device tree describes a CBQRI capacity contro=
ller.
> +
> +endif
> +
>  config RISCV_CBQRI_RESCTRL_FS
>         bool
>         default y if RISCV_CBQRI && RESCTRL_FS
> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> index a7631712dba9..c8339113ef1f 100644
> --- a/drivers/resctrl/Makefile
> +++ b/drivers/resctrl/Makefile
> @@ -7,3 +7,4 @@ ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)       +=3D -DDE=
BUG
>  obj-$(CONFIG_RISCV_CBQRI)                      +=3D cbqri.o
>  cbqri-y                                                +=3D cbqri_device=
s.o
>  cbqri-$(CONFIG_RISCV_CBQRI_RESCTRL_FS)         +=3D cbqri_resctrl.o
> +cbqri-$(CONFIG_RISCV_CBQRI_CAPACITY)           +=3D cbqri_capacity.o
> diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_cap=
acity.c
> new file mode 100644
> index 000000000000..0670a676bdb1
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_capacity.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Platform driver for a RISC-V CBQRI capacity controller that backs a C=
PU
> + * cache. The controller is described in device tree by the generic
> + * "riscv,cbqri-capacity-controller" compatible together with a phandle =
to the
> + * cache node it governs. The driver hands it to the CBQRI core, which p=
robes
> + * the capabilities register and exposes a controller that supports allo=
cation
> + * as the resctrl cache allocation resource for that cache.
> + */
> +
> +#define pr_fmt(fmt) "cbqri-capacity: " fmt
> +
> +#include <linux/cacheinfo.h>
> +#include <linux/cpu.h>
> +#include <linux/device-id/of.h>
> +#include <linux/ioport.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/riscv_cbqri.h>
> +#include <linux/types.h>
> +
> +static int cbqri_capacity_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct cbqri_controller_info info =3D {};
> +       struct device_node *cache_np;
> +       struct resource *res;
> +       u32 rcid_count, cache_level;
> +       int cache_id, cpu, ret;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
> +
Unless I am missing something, I think you can simplify the code by
using devm_platform_ioremap_resource().

> +       ret =3D of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &r=
cid_count);
> +       if (ret) {
> +               dev_err(dev, "missing riscv,cbqri-rcid\n");
> +               return ret;
> +       }
> +
> +       cache_np =3D of_parse_phandle(dev->of_node, "riscv,cbqri-cache", =
0);
> +       if (!cache_np) {
> +               dev_err(dev, "missing riscv,cbqri-cache phandle\n");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D of_property_read_u32(cache_np, "cache-level", &cache_leve=
l);
> +       if (ret) {
> +               dev_err(dev, "%pOF: missing cache-level\n", cache_np);
> +               goto out_put;
> +       }
> +
> +       /*
> +        * Associate the controller with its cache instance via cacheinfo=
.
> +        * The matching cache provides the cache id used as the resctrl
> +        * domain id.
> +        *
> +        * Taking the first leaf at the level is sufficient, because fw_t=
oken
> +        * is keyed on the DT cache node, so sibling leaves of a split ca=
che
> +        * share it, and riscv,cbqri-cache must reference a unified share=
d
> +        * cache (cache-unified), not a split private L1.
> +        */
> +       cache_id =3D -1;
> +       cpus_read_lock();
> +       for_each_online_cpu(cpu) {
> +               struct cacheinfo *ci =3D get_cpu_cacheinfo_level(cpu, cac=
he_level);
> +
> +               if (ci && ci->fw_token =3D=3D cache_np) {
> +                       cache_id =3D ci->id;
> +                       break;
> +               }
> +       }
> +       cpus_read_unlock();
> +
> +       if (cache_id < 0) {
> +               dev_err(dev, "%pOF: no online hart reports an L%u cache f=
or this node\n",
> +                       cache_np, cache_level);
> +               ret =3D -ENODEV;
> +               goto out_put;
> +       }
> +
> +       info.type =3D CBQRI_CONTROLLER_TYPE_CAPACITY;
> +       info.addr =3D res->start;
> +       info.size =3D resource_size(res);
> +       info.rcid_count =3D rcid_count;
> +       info.cache_id =3D cache_id;
> +
> +       ret =3D riscv_cbqri_register_cc_dt(&info, cache_level);
>
As I mentioned in the comment for another patch, this function doesn't
need to have "_dt" in its name.

Thanks,
Sunil
