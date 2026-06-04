Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34284342524
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586965; cv=none; b=ZCg/jFhRgee2Bo/OL4n5SVlPCEMSESzcwPZxI7ZvulprtgyePKIemBV18hTCATFzkia4d8+zHi5mxR9NtFROYUDWYXQIFcf74JtJOuoQi+B6KrwUuT0QoOjpYe6VhWecSBdXegYcwtzTgW68GNvRhrfY70VeNC0BjUVfSzWFpok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586965; c=relaxed/simple;
	bh=UkMauGVB26yFY7UTIwWOcgIzL97oaXwcfIInVZVnp0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ks+glSKdpb7oerP/lEx7WWDmIsUqZLKJsUrtCUwVqro54p1+/9Jwg/Z76FCbpX8W9ampwTkrsF4J1rTFNUlE9E9LSOYrUH2HMleCjYAhcvYHXxweDnUUJDw+cYHYiPC3CJ7CcEoHWi9s8UNy7I74/745WGvhosncLmVpUaksjl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qlncft6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilYChW73; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qlncft6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilYChW73"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EKxKj1132273
	for <linux-doc@vger.kernel.org>; Thu, 4 Jun 2026 15:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=; b=Qlncft6Fwh6BKW7n
	ka795Z+gVHHYDdEefWUmmoQD4RgUPeiGhHV8SLohswSyxQA7tUpBQh5QJy+w6cUx
	nthELcj2CqKsQtu8IWnnUGVBvx1B4CcqQbh0/tJI53DobGxPsWEKB0olLTomoQjJ
	dKokvTmQAdHSd8V/mrQrqOhm7qnHT3NPPfKphB5f08Ld+jJ4MMnuk4pGoYKPsYNR
	fBUyH5fUfYvPA9cIOWGy6Lhda0l5bMpg0n4kcqegrR9PrsGt3p4KFs11AYqkLbIx
	DPVLtwnic5BaEo8QCGinJHUSHwKzz5V/qJ+gTP541f0Kvr7AYVrKVIkHTnW2gfBI
	ME5ykQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wshpgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 15:29:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137f81004cbso3586390c88.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780586962; x=1781191762; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=;
        b=ilYChW73DD4JVlwf36MDUbIxRVgOyS/x4M+pk/YSoF4CFShn3QcVjT7yuhLbqj6elx
         GIgZON3eOgFVYNPwfq2aCssnAKBiG2EOwLz0jGKfLeV5orEzfa1ocBlPQ+WRD4pOuHUZ
         nDjxuNwkoRZ69kgRB8sdCYtLoLC6klk0IohQmhLgNlAHnY0ydj7r1dNnO87kawOJmD0a
         xgoF6yE/KApkQoD+wORsoMHDYbEajBq63BM12BNVCEgrp42f5Fq11xieSh3EB+ImJWPX
         cjEftxioWbf9VS0XKRHPz1tK+KufGQ0AB34pD78LtyEgMXJVNFpi1Z2CvfRvUcg5Dckt
         Fojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586962; x=1781191762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=;
        b=ZMqvRSIC7zSzX/wIDAcOc5DstbiUAprEhpaeP5rPnZai4K8kf2pbKS9BhO/XjBFMlp
         S0jhFRW0YXpm1Cp83qoDdQMZYItyYHS6R/gX+xaKdKMn1oZM+ew2uy0c527akcfzZoVt
         P32N/fQ6fY8W4os5kB1lFrEjBC4ei/rwcL3or2kE2U9VpCrJEslPK/SxVCRT3wAIzfkg
         jSniKBCtFm3NE4wOPXD7PHLw6nenCVO3pJ2pJJ5uIxDIFFROMUQsHgIO+IKUyd+B5A6B
         4HyjvOmcL49il4tIdEP05HgVZBBQWT6B9HIq/4fejLxOsa1ekTMTjbuoD1qqEGidUf0R
         N3iw==
X-Forwarded-Encrypted: i=1; AFNElJ8rhdboXUeaVyxYm/NPby5f1ccxfWKDwutvgjoGxLc/Pt5q0zO9WOy+XiT30nlnM9FmLCXGM8NRsv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2g9Jy/5qSc7YfQkqouzwdcjsj4Ayr0Q9nvaA9WC4F33DMwSy
	qjcsJ52EqBL6+CQ4DtimyqN64ZXB3WsjTFwZUVJL+UHuHDp1r6qBH0khZnI3X/NDxm2qnHVeCOs
	M/bHZpfk/APgnmWte0esVjx/APzoK36tJE1ahzqRup89Lb4Wf/byt9D+/L90FZoY=
X-Gm-Gg: Acq92OG4PjsrHFsvM0NnXV6lvwtMfCrqdjBJSNjoaJG9E7Z2XwO1/oVcdJRQhfNP51O
	VYAbnrplQL2AAdi9MxJkB1MKWknQ9fFc//gGEW3rtadH8ERqyfxnRTMi56BQ4L2q6bR1XTqkv91
	KqyPYYCXdAn6IkOkmdKNaHqJXNxS1Whqzd33s/K1lU0beOKUDsmiBFRf/e5pi2oViAXu9CPtskX
	8aFys/67Jl7dsTDAZ7S685N1vyKw++9KjRmLWoExjHyBa3jClw+FsqXnZmf2HbDcQXk99OsXUMD
	w23qUaZa7ZPkDTO4IHq5G5/w3kzAY8jIx+oKhKGwiyTIHSTM1Unk5ibKTcsbDw5psulaureauCi
	cUL/hSz4wpG5FARF4xh/QHGq0jSI/DZ3HSMRPe7JJ4w==
X-Received: by 2002:a05:7022:693:b0:136:90d9:f204 with SMTP id a92af1059eb24-137f6bb4bd5mr3557181c88.25.1780586961863;
        Thu, 04 Jun 2026 08:29:21 -0700 (PDT)
X-Received: by 2002:a05:7022:693:b0:136:90d9:f204 with SMTP id a92af1059eb24-137f6bb4bd5mr3557156c88.25.1780586961314;
        Thu, 04 Jun 2026 08:29:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm4107408c88.11.2026.06.04.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:29:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:29:19 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <ug2cipududshcbv24ruicqpugzinujnamvdcuy6pubkwh67bfp@2fysrplz3nr4>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
 <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
 <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
X-Proofpoint-GUID: tAE2OzyptXV1tOCH9I4GBoizNKSDxnIh
X-Proofpoint-ORIG-GUID: tAE2OzyptXV1tOCH9I4GBoizNKSDxnIh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1MSBTYWx0ZWRfX5L3SyjfW15oi
 NDIMf5rTNVncFz1AADsvvT8qQag2/418nbxCnzO+rstze+aAlq9Szll9bzs9/1RgjV9BcMtodVt
 gD4ed6jOtC8cb5Fe+0YRMW+p6bCL/ax0cTYMlX0ZRheWTbVovGNFn+xN5DhBtOg2Uqu+RzWC+yr
 sRMVI5td8k9i3uwUre6LjCYpludWaaDkJlmC7LBNzN1Z/iNzUrIr9EG2ERTUM+qFVn5aHvEFOPV
 HRQkQEthFH9FjQPDr8RI5C/vXGbkCHmPuj0zqd8R/ciP7SxwRI7/uxDMIWaMKI+K+vcSfA/kTRg
 TQ+9y7EVsihfn6W+CnoMEcE7w6F93shYb56E6VGSxVH2utCku+sWoXenIgVTsPbvM2ENlMeQnHJ
 ZzCLeF5s57D21VEjcojip+M8DUnegpJVrd6wD53R+8EFWYHdfyZNCjinYLqpAaV4z6hkdxJ3Bdg
 Tj4pn4QXjxggDNDEBSQ==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a2199d2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=ee_2aqc6AAAA:8 a=VwQbUJbxAAAA:8 a=-RU_IiooM-Ar16elnkoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040151

On Sat, May 30, 2026 at 08:42:29AM +0800, Guodong Xu wrote:
> On Thu, May 28, 2026 at 12:35 AM Andrew Jones
> > Sashiko points out a few things about this patch which I think I
> > agree with
> >
> > https://sashiko.dev/#/patchset/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc%40riscstar.com?part=8
> 
> Quote the following from Sashiko.dev:
> > Should this mask specify the individual subset extensions required by the
> > profile instead of the superset extensions like RISCV_ISA_EXT_B,
> > RISCV_ISA_EXT_C, and RISCV_ISA_EXT_V?
> 
> My preference is to leave the mask on B/C/V (and A) as-is. I'd prefer to
> keep matching on the single-letter, rather than expanding them. Here is why:
> 
> - The RVA23 profile lists A, B, C and V as single-letter mandatory
>   extensions; it doesn't enumerate Zaamo/Zalrsc, Zba/Zbb/Zbs, Zc* or the
>   Zve*/Zvl* subsets in the mandatory set.
> 
> - In current merged code, hwprobe_isa_ext0() is already using
>   riscv_isa_extension_available() signle letter checking for C and V.
> 
> PS:
> B maybe a special one, just in case anybody raise it. As the community
> discussed when I adding it into the bindings, because B comes later than
> its sub-components zba/zbb/zbs, so, when I added B, I cleaned up all
> in-tree dts files which declared zba/zbb/zbs but not B and made them declare
> both.
> 
> Link: https://lore.kernel.org/linux-riscv/20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com/
> [1]
> 
> Also, in the bindings: extensions.yaml, a schema rule is added which requires
> a node listing zba, zbb and zbs to also list b (and the reverse). Moving on,
> new dtsi/dts fils, a node with only the subsets fails dtbs_check.
> 
> One may argue that the schema check doesn't cover ACPI path. But again,
> shouldn't the vendor who publishs RVA23 hardware be conformant to the
> extensions wording in RVA23 v1.0 spec?
> 
> What do you think?
>

I certainly see a case for the kernel staying out of the extension
dependency validation game. I think it makes sense for an ISA string
validation tool to exist for vendors to do sanity checks on their
ISA strings, but that's not the kernel's role. OTOH, whether or not
the kernel wants to try and detect inconsistencies with the ISA
string in order to build confidence in using what it sees there
and publishing what it sees there to usermode, through hwprobe, might
still be worth debating.

Without CPUID / ID_* registers for Linux to be able to check an
authoritative source of truth about what is and isn't supported by
the CPU, riscv Linux has to decide to either blindly trust the
hardware description or do sanity checks / probes in order to
confirm what it sees there. Maybe we can assume that any extension
used by the kernel will trip over itself quickly, alerting vendors
to fix their ISA strings, but I'm not sure we can make that assumption
for usermode extensions that Linux doesn't use, but does expose
through hwprobe. What apps need to run in testing to exercise them?
How long will those apps need to run before they trip over something?

The more I think I about it, the more I think the lack of CPUID / ID_*
registers puts Linux in a tight spot. If Linux trustingly publishes
what firmware tells it to to userspace and userspace blows up, Linux
will have to share some of the blame for having misled it. So, should
Linux validate everything it publishes somehow? Or, should it at least
do relatively cheap sanity checks on everything it publishes in order
to build some confidence?

Thanks,
drew
