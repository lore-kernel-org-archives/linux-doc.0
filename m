Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E951F3876A5
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772088281; cv=pass; b=PwsbrXpMs/4GF+ORcaCsAIxmJ+q8+2RiSXowcLiMDgtZg7xhP15J8ixgJHDzuaVrmJDOCHFAnHZ6zRHO/erAlQ+QsN0sAE6UOhOfYBif7UhaXjRa5YEaJBpGbWkU4nfI/7hP9C3IJXo0HVutUrpb7WZ14ws+oShoZn46v4c6Oyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772088281; c=relaxed/simple;
	bh=pAU3JAU84JmGKm87jtWoCRvQvPPVCrmccbK+z53wNO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sO3Edr+Qh78xQPqsrV5tpBRQ66D9OgB2pGAFNA8EauT8xSpKnZdBOzj0lwWngMoBd79hVBlwBlvVgFiqu+LtSFw5YTtdLfy4peq8qQm+zptMR3MawbaAohDG7wJrcK4Z7c3UyflRF8dwUbyahQEXFZZPnbPBcxPcp7J5K+Mni4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXyqSEwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tgzt9bo8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXyqSEwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tgzt9bo8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4UoKb3433484
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 06:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=; b=LXyqSEwCxTLss82O
	KGTevmugKHsamOfer4V1RKk1N+rnb8x4W4EpbCeyBwJo059YXIxwKS9h9vPsme3z
	35pbJiCgB5E3GBpsjjmwXzXmbX6E3h2+JKAPgk38ATFgaa1GYqztgV1XMe6OjNkX
	VHFwUFtgzR/SfB4KyIPNNeO8V0cpEoL9bHtP+XGlC87iM0H+m8yNA+WKF7YPgbm/
	REetkHs/b2ZQUJu+FGGR2C4a/sWgZqmVR8K6+pBjzJyBBOazfgPz7MGjcPwOOi3u
	8CUfSLEdsPoXWRGL8c8QMNt8TRoLv2OnZKoe6DcGMXLoAvTjKIjjWKWTWxxwraz1
	HBXEQA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0g8uae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 06:44:39 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4d668425dso6570511a34.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 22:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772088278; cv=none;
        d=google.com; s=arc-20240605;
        b=MCv4hNFHAIt8wCbpaPhiXJil74/CMwHkGgL08tn0+oFdSkAbW4FcZTyOO2CrJf730J
         klqNHOtNuBhqdVo0e7KLlt4ES46lGxWGuY6rh5ha5PGYJ5h8EpQ2vMEJ/Nef2DhhLzBY
         216ViTDNFZo2wOoq0mRBDkhs4115vLqmJvGR4SZQslOsmyX2h1Zf5ZHKbopedhvgTCe+
         Fyf83wSmBjsgniQrvTy6qWbVqFr7XumZxkZloIoGiS92TojQo7qpkDROFRlyXoLyJfq1
         9FaVC+0mBmhbCySqJuPIe6DBo1QkU85zpnYCd6PnQpRwJMRHOjxQf/nHBFUg5adWHpuc
         2cPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=;
        fh=W/GaDk/jAMqGCbHEbF+bk4o05IUzK1PPtxnvzXImR1g=;
        b=Dw6ChR9eXYPpPpPegH4yyMxaXLPdCqJNg0FoERBQ2n1o2jz4chipv78r9u7aNhhsCb
         WYLTUZorNuetN4EDWVrqmdRlW/HA+H/hLR+2Zxudz1DhuopHFqycWu7GYVt1LAozlZRg
         GHnM/hzliPASOQVci77Gom6bEJTw0wJTA7bIeZzb2QUx12DkePN5yumwiYE3ZJ9kDSU8
         pt5294jL/8TBXs2aR1P6+J3HAfJOyTfrfDa4tNQbS1QPviSYif1PMofRQAn3eK/PvmY3
         K5Pn58mFforR2/s0cv57BzjWY4JmrnNHC1FDFYjZadjIlIfbDUqXyq+OjDI0o/4kv8nY
         OWAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772088278; x=1772693078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=;
        b=Tgzt9bo87XPUdl0Ue9MvM40TudIZ0Wl2yBiWGD60JxnOhX0+JarV81wsyIOjLjaTgn
         jeRGDAGkPYWinj9oRN4HltE2hR/BZziErUzs75dgqif/C0D2VPyyphqE4NSQn5WZMYhe
         wfHX1VMnFyDxK8zIx6ifZTim2ZbCGtG7ruWi8ET2wNTv5ILx0qPScS7/UMzx3u44LI1Q
         ixEVNbz4gVz2kfyEKbtSpQ6CrIev/GFOdtjx/ue8c0JHt8Ssq6qV3HltDQoUf3o+9Z48
         B1+znb8VFxbSKFl3hfCLwQsU3tvsYEAdl0R+UZdzjbFH3Q3TF7Q5aAbQ7VQtAf2LqOX3
         T2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088278; x=1772693078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=;
        b=ntFUrj/JeSjOTIOLKTJDrdLvhioM6XXigANJKLckbdbO3SbTlqb6N0PWybJbh5jUir
         hI2hKlZBN6VQHImDUqgoQCPgAwiPbgNsX23QucKr3nGOXS0ngnrFKCkLme6qs5ae0zHD
         WM28O9BtYMyT6XPUsTV9qQrGRkWVXsT2UUbFWtW1Hv5ry0NRaT7/TzAcTZ9XkL5VpGVR
         U8lboq0nJERa4Ejy11NWmzuFmysb22s7PhRWgUGmY3sx2X3Hd7vI2P+OtAH1oRVXPhX0
         rXmvtZ001pMesMsXtu22gJjAHH1d+Y/9s8AoOR5m0IOXDRpQ6GPUUkav6JoyMSuCWjd1
         AuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4Kuo5URswQDP5F7ZuzDZmbaUClPZoqmd5QHDAA5Y0b/rTANb9MgQYR2cMbLNSpttW0lEpFwmJBLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNyZBGdfbbxRCzHg0QDPS5f3brkx5RL7kWcAP3xOkx+LDx3jQr
	cVsSOD6YW/d1DK9QO2Sj/486HKz1AIpu7oI/T0RUwILO+qmBF7Lt5cUOEvdimCfTCu2vkpAc5yH
	pp1ho9JaAcoLmwLDi/IwlQfJYgDH3dtewdCxwgeLisnGmaiPliQeLJHheDfR+IWsC7c4HYzwPlz
	gDrIXY2lZyA2gcr6fG7fDT/DufdilPPq50C9hWow==
X-Gm-Gg: ATEYQzwa1GSQ+7y5ufRwIvO1SNEgYSyiQkvjx/tQH0QfiusiVFaRJ4QbeU0ggXrot3I
	ocKIwsnGVWp/2928frIkzrOrKtPgpGlgBYd1kqzpeUCKM6fTj4yoEVNNcOnYbgRfHazRJtPAU+d
	o81miZ7CmjVSV/toY2ESQNGX6tM/AoYTtjNK2/FvXSGVtChShZjhn7QL+zBNBlFfEh4nCv1si06
	dJr2jQ=
X-Received: by 2002:a05:6830:2a17:b0:7cf:d819:a2d2 with SMTP id 46e09a7af769-7d52bf512camr11500528a34.31.1772088278237;
        Wed, 25 Feb 2026 22:44:38 -0800 (PST)
X-Received: by 2002:a05:6830:2a17:b0:7cf:d819:a2d2 with SMTP id
 46e09a7af769-7d52bf512camr11500510a34.31.1772088277848; Wed, 25 Feb 2026
 22:44:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
 <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-1-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-1-347fa2d7351b@arm.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:14:26 +0530
X-Gm-Features: AaiRm51ZQEVzQPuSNRCFd13Five9fB0P9HahXQ78_EQWjVuCiTnlrkcRyhMOVfQ
Message-ID: <CA+Ht8=a9a-zB_kEt1ZHFeTWSYGn4o3MRuHdXY9FDWWNZ=gc-Yg@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ACPI: APEI: GHES: share macros via a private header
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
        robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=699febd7 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=7CQSdrXTAAAA:8 a=el1Gr4cE1T2VXIUlPsIA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1OCBTYWx0ZWRfX8V1ftlc7OsOj
 vyVojCf3d8MMo1NrXkeHN9tXEqUeAMkdJX3zK/QFQTT873Ng9IM+vHuIQb60av8ZeX4Kzt8cQgD
 CLZHEI3oD+oQRU4SPYGKGw0pVxcIVXMEGEMZEdf/KF6od1gjyQNtYzzkAzb742sirWKuzWVrUOY
 xyLxrY+clGjaGKT2v/1rnRXagZ16IAH5Z8Vb+hStICFHhH4pl6TwM9peDFjQB+pTjGqdQZmkNNG
 7iDAIQNhlgaNttsV5J89iIRoKNVahmNHcrcI5oAoGKOQR/l59O+GmvFWNgAi+mVcZ0wN3CBrUnG
 YfrneLLgtc5fozvq4j8ijEfCGreX0lA0wl5zP2wBuT3X1XV9IX5KjYXlN7KuwZ9vojqr/eixd4x
 JPyJfpVmiPdEGfXtzEMC7ioJIGwWOkjqS5O3RCZjfnqTmzL/mS7FizYGtNTPMXcvdyH+gLOo3tY
 s+HcKQmgagmWCdUg+Ng==
X-Proofpoint-ORIG-GUID: 7cnRhXaHKiM9BOgtIjqOFDD0ZI1RUaE-
X-Proofpoint-GUID: 7cnRhXaHKiM9BOgtIjqOFDD0ZI1RUaE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260058

On Fri, Feb 20, 2026 at 7:13=E2=80=AFPM Ahmed Tiba <ahmed.tiba@arm.com> wro=
te:
>
> Carve the CPER helper macros out of ghes.c and place them in a private
> header so they can be shared with upcoming helper files. This is a
> mechanical include change with no functional differences.
>
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  drivers/acpi/apei/ghes.c | 60 +-----------------------------
>  include/acpi/ghes_cper.h | 95 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 96 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index f96aede5d9a3..07b70bcb8342 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -49,6 +49,7 @@
>
>  #include <acpi/actbl1.h>
>  #include <acpi/ghes.h>
> +#include <acpi/ghes_cper.h>
>  #include <acpi/apei.h>
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
> @@ -57,40 +58,6 @@
>
>  #include "apei-internal.h"
>
> -#define GHES_PFX       "GHES: "
> -
> -#define GHES_ESTATUS_MAX_SIZE          65536
> -#define GHES_ESOURCE_PREALLOC_MAX_SIZE 65536
> -
> -#define GHES_ESTATUS_POOL_MIN_ALLOC_ORDER 3
> -
> -/* This is just an estimation for memory pool allocation */
> -#define GHES_ESTATUS_CACHE_AVG_SIZE    512
> -
> -#define GHES_ESTATUS_CACHES_SIZE       4
> -
> -#define GHES_ESTATUS_IN_CACHE_MAX_NSEC 10000000000ULL
> -/* Prevent too many caches are allocated because of RCU */
> -#define GHES_ESTATUS_CACHE_ALLOCED_MAX (GHES_ESTATUS_CACHES_SIZE * 3 / 2=
)
> -
> -#define GHES_ESTATUS_CACHE_LEN(estatus_len)                    \
> -       (sizeof(struct ghes_estatus_cache) + (estatus_len))
> -#define GHES_ESTATUS_FROM_CACHE(estatus_cache)                 \
> -       ((struct acpi_hest_generic_status *)                            \
> -        ((struct ghes_estatus_cache *)(estatus_cache) + 1))
> -
> -#define GHES_ESTATUS_NODE_LEN(estatus_len)                     \
> -       (sizeof(struct ghes_estatus_node) + (estatus_len))
> -#define GHES_ESTATUS_FROM_NODE(estatus_node)                   \
> -       ((struct acpi_hest_generic_status *)                            \
> -        ((struct ghes_estatus_node *)(estatus_node) + 1))
> -
> -#define GHES_VENDOR_ENTRY_LEN(gdata_len)                               \
> -       (sizeof(struct ghes_vendor_record_entry) + (gdata_len))
> -#define GHES_GDATA_FROM_VENDOR_ENTRY(vendor_entry)                     \
> -       ((struct acpi_hest_generic_data *)                              \
> -       ((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
> -
>  /*
>   *  NMI-like notifications vary by architecture, before the compiler can=
 prune
>   *  unused static functions it needs a value for these enums.
> @@ -102,25 +69,6 @@
>
>  static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
>
> -static inline bool is_hest_type_generic_v2(struct ghes *ghes)
> -{
> -       return ghes->generic->header.type =3D=3D ACPI_HEST_TYPE_GENERIC_E=
RROR_V2;
> -}
> -
> -/*
> - * A platform may describe one error source for the handling of synchron=
ous
> - * errors (e.g. MCE or SEA), or for handling asynchronous errors (e.g. S=
CI
> - * or External Interrupt). On x86, the HEST notifications are always
> - * asynchronous, so only SEA on ARM is delivered as a synchronous
> - * notification.
> - */
> -static inline bool is_hest_sync_notify(struct ghes *ghes)
> -{
> -       u8 notify_type =3D ghes->generic->notify.type;
> -
> -       return notify_type =3D=3D ACPI_HEST_NOTIFY_SEA;
> -}

All this has nothing to do with CPER which is defined in UEFI. All of
this is part of the GHES structure defined in ACPI. Why are these
being moved to ghes_cper.h.
It is blurring out the demacations. If you are caving out CPER
helpers, please don't move GHES helpers. The better place to move
these helpers is ghes.h otherwise they are good where they are.

> -
>  /*
>   * This driver isn't really modular, however for the time being,
>   * continuing to use module_param is the easiest way to remain
> @@ -165,12 +113,6 @@ static DEFINE_MUTEX(ghes_devs_mutex);
>   */
>  static DEFINE_SPINLOCK(ghes_notify_lock_irq);
>
> -struct ghes_vendor_record_entry {
> -       struct work_struct work;
> -       int error_severity;
> -       char vendor_record[];
> -};
> -
>  static struct gen_pool *ghes_estatus_pool;
>
>  static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS=
_CACHES_SIZE];
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> new file mode 100644
> index 000000000000..2597fbadc4f3
> --- /dev/null
> +++ b/include/acpi/ghes_cper.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * APEI Generic Hardware Error Source: CPER Helper
> + *
> + * Copyright (C) 2026 ARM Ltd.
> + * Author: Ahmed Tiba <ahmed.tiba@arm.com>
> + * Based on ACPI APEI GHES driver.
> + *
> + */
> +
> +#ifndef ACPI_APEI_GHES_CPER_H
> +#define ACPI_APEI_GHES_CPER_H
> +
> +#include <linux/workqueue.h>
> +
> +#include <acpi/ghes.h>
> +
> +#define GHES_PFX       "GHES: "
> +
> +#define GHES_ESTATUS_MAX_SIZE          65536
> +#define GHES_ESOURCE_PREALLOC_MAX_SIZE 65536
> +
> +#define GHES_ESTATUS_POOL_MIN_ALLOC_ORDER 3
> +
> +/* This is just an estimation for memory pool allocation */
> +#define GHES_ESTATUS_CACHE_AVG_SIZE    512
> +
> +#define GHES_ESTATUS_CACHES_SIZE       4
> +
> +#define GHES_ESTATUS_IN_CACHE_MAX_NSEC 10000000000ULL
> +/* Prevent too many caches are allocated because of RCU */
> +#define GHES_ESTATUS_CACHE_ALLOCED_MAX (GHES_ESTATUS_CACHES_SIZE * 3 / 2=
)
> +
> +#define GHES_ESTATUS_CACHE_LEN(estatus_len)                    \
> +       (sizeof(struct ghes_estatus_cache) + (estatus_len))
> +#define GHES_ESTATUS_FROM_CACHE(estatus_cache)                 \
> +       ((struct acpi_hest_generic_status *)                            \
> +        ((struct ghes_estatus_cache *)(estatus_cache) + 1))
> +
> +#define GHES_ESTATUS_NODE_LEN(estatus_len)                     \
> +       (sizeof(struct ghes_estatus_node) + (estatus_len))
> +#define GHES_ESTATUS_FROM_NODE(estatus_node)                   \
> +       ((struct acpi_hest_generic_status *)                            \
> +        ((struct ghes_estatus_node *)(estatus_node) + 1))
> +
> +#define GHES_VENDOR_ENTRY_LEN(gdata_len)                               \
> +       (sizeof(struct ghes_vendor_record_entry) + (gdata_len))
> +#define GHES_GDATA_FROM_VENDOR_ENTRY(vendor_entry)                     \
> +       ((struct acpi_hest_generic_data *)                              \
> +       ((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
> +
> +static inline bool is_hest_type_generic_v2(struct ghes *ghes)
> +{
> +       return ghes->generic->header.type =3D=3D ACPI_HEST_TYPE_GENERIC_E=
RROR_V2;
> +}
> +
> +/*
> + * A platform may describe one error source for the handling of synchron=
ous
> + * errors (e.g. MCE or SEA), or for handling asynchronous errors (e.g. S=
CI
> + * or External Interrupt). On x86, the HEST notifications are always
> + * asynchronous, so only SEA on ARM is delivered as a synchronous
> + * notification.
> + */
> +static inline bool is_hest_sync_notify(struct ghes *ghes)
> +{
> +       u8 notify_type =3D ghes->generic->notify.type;
> +
> +       return notify_type =3D=3D ACPI_HEST_NOTIFY_SEA;
> +}
> +
> +struct ghes_vendor_record_entry {
> +       struct work_struct work;
> +       int error_severity;
> +       char vendor_record[];
> +};
> +
> +static struct ghes *ghes_new(struct acpi_hest_generic *generic);
> +static void ghes_fini(struct ghes *ghes);
> +
> +static int ghes_read_estatus(struct ghes *ghes,
> +                     struct acpi_hest_generic_status *estatus,
> +                     u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> +static void ghes_clear_estatus(struct ghes *ghes,
> +                       struct acpi_hest_generic_status *estatus,
> +                       u64 buf_paddr, enum fixed_addresses fixmap_idx);
> +static int __ghes_peek_estatus(struct ghes *ghes,
> +                       struct acpi_hest_generic_status *estatus,
> +                       u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> +static int __ghes_check_estatus(struct ghes *ghes,
> +                        struct acpi_hest_generic_status *estatus);
> +static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
> +                       u64 buf_paddr, enum fixed_addresses fixmap_idx,
> +                       size_t buf_len);
> +
> +#endif /* ACPI_APEI_GHES_CPER_H */
>
> --
> 2.43.0
>
>
