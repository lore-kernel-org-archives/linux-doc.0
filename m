Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040462DEA74
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089550; cv=pass; b=LjFdAHGmjSYJ3eBlrvJZmr6BtnxeUExExrshpybKVXNLI0ewXVCjizoog9sQ2fhRRWvY5Xe/kbL0yQsUEbBQlwFfVi6I++2xfzcknBocVZ+Syv2xLascGp63ZjxV4+52YzKTziyXZmF1xi19OPjSDkVA7UXq6Ya8psHyFWha8Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089550; c=relaxed/simple;
	bh=fthQwGFGcr3v5gbtPCMZp9gFbRlGycmeGJ6rhMoXyYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll25Avgb4GDo/XVqpgiMJjx6+LPhE+Vrn+AcN+L56pPU4QILO6ydzWJoWHAeSmTrJ/O60rdFtcBAEpuus/q3xkr//1uJk5o0TZP9KlSjKcBfpAVDeMoLG5ihvpkcDyKEWCUHbyXrw5WjKfETA+ADQ7XPUAroEenv8cdEDm3kkxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpSVHs9O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCAYBsR9; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpSVHs9O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCAYBsR9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4Usp43225940
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=; b=cpSVHs9ObcHsKfAX
	3ggqKxAEXUPS1VD3qshQZ0rce0/Ew6L8IPvz9t5w4UaBOJI1vzlU6M8/T/FpTp9W
	sgHBIp6RGQQL0oYuASc1K1r5Ifq2e/jT8HbmgIPhNhxF3l9U8llkr/n9Y9Pp/FFG
	l+CaNPpRgdpkwqyKA/bMPHCQsdtWdsxSNZDu61bxcHRjSLfcRbeLzWmkPhvwci4q
	ShFWsBp9qM2MUlI9bAsIpcS2O1HfqpnPp1bDBjsHiaFvk7wdmVxdKCzHc5nrzU/E
	ses5Ly8RZ59i0kL6FFcn+6sRqnM5fTkFxWROQAiNJvBGcgohyjyWMS8yV70glr2m
	/XeO7Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjdph0n4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:05:46 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-66308f16ea1so4024368eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 23:05:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772089546; cv=none;
        d=google.com; s=arc-20240605;
        b=RItgWyHVYmIuwnAp0MY2qYdqqhrD0G29za/sZ1akYfMZI47T8WzHh8FL2saJ7AuHsf
         2mYt3r15XssooU0/b4EGe9JK+sDnbpr4vp9Vun/PswSkKm9G199w+cQ1DKwg6E0grQ9y
         /gmBdVknd99cm75US7ekcD3dh5NqJNGrQ4W8w/9xHztlhQMv7uMhmY8lMbx+MiqCIaGD
         0pQxmYSz78c2/TvaS+RrtDs65Eim16VvaPGDhaOwFR7yx2RJuBAXa4Qijok4BxYmFSHQ
         5Rw3cBVNlgGOzQdR9XFykGrUFr6lMzxd+iL+x7/Nzn0Ke+4gIaohLsof9KYXZ6oHqPZa
         fGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=;
        fh=nXOAfCFDzFA3rB9vSaw9JpR3u5Lai56YOqp28SB1+/c=;
        b=i6vTczavDKdkTzJq2D6FemGOHcWxRVcY+tCNlm2WQE4gf2MztlgyasUOGDQANp32gn
         5gXyIyzOg1DrWuiBOvKsjEhA7w2gXnOopRNN+5bWswNoRDbO1vBAwOkH0enD3naIaMum
         FLH3LFuCOe28Dyx6Yu4Gn9/Bzd5mlO7nUn2Y48c1eVHNc6LBzwUOg6k4gExj9ps3S3mY
         OKvsKME+74Hl1s/2MkYKtCcnovjzDnfSOsp54l/YjJECgVrx+l0/cHQzc1OzQBaIJeWg
         6aQm+P1kJK33bQUq7Y/N4Y6mXP6LsbNKgsO24ItccOkQK0uCt3ZnjQFa5Fr5kypo3Ybi
         Qz6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772089546; x=1772694346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=;
        b=eCAYBsR9nsrh8HWI5M6Yi880xAjH3r8+RXU4D4n/Zq9GHf3Cme1WZHljy5NKnWVK9L
         j0Y2jL646uHn67krOpBxnKpWLrnxfljbe2hFANefxKgLjY5RXQ7/+Tsy7cHH/HqOKK/n
         ii9LFcrUFnvFuVDO1uWoeKHdVqqDvFdQJczpJddWoJ3rIp9P4goBhZdVx7OhTvtotlto
         PzmbMT304Tn8K1HSoV8xw7pp6Qilks4IXaO1+T63J6xVJCjPx+E/5eNQDbFS5t0zKBhG
         Iahmip/D/4oRSXaGWZ12FaBKtZQjPoe2Cb1lgTVSULRSQOqCpnu55OY/gVGViw2OhLYC
         Hkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089546; x=1772694346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=;
        b=ZHoSxshCF5irg781gPt7Sy4OHhZ+bC9gkes0hvFYV/pjH3Tfi7sm2UgryDHouH9TLJ
         MIgJZg6/y+RzAPX3DsEXOk+N0rHewa9bimmI1+WrGsQoMMmOIv2SX93ZdCdkiQGtas6+
         fOsyD2takSffUuA7VdHSj/UWNe9y7HaSpAyjFvmY1Fkd8AciJuLA3lq67MuwWcT4T3+e
         F8EYxvedvhyjVPiIw3Jrh+GMnonojQRuu0hZzVDV1Kl8FjFB9ctfygDwSdrx9I7Od3GP
         YEoCT5rHzGMXUoYXPT/NwF9S7rLc/w/54h6QpxmCs0v7kjYj/fU/73yzHj9j1x1wIbK9
         zpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQZfkSAiLp3IX6nHUnoLt144fY+ttoFnwbofqbBpNAuUn5bPw8oVw93H7WdcdO1t22XxL2FMHgyjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzElZ0dFkhE0wZvVzcKd5Dl+zl6/8svtlQJWZoNjuXMwnhE85Fa
	JrjVEan+N4VJheglEfgnZheJKy1iaY486kxUu7Dn/r3KxcUxCEHCgYWwIht/sjhC1CBcNWwi3sd
	CMlwLpLiPVQ0hJ1+ZL01WD/DB7NEFN9ytj2X/3vKdbboOrggbhPHMy5HCsS8ESIwVq4l1pFKfGU
	vOIjihixedGXnsah7nBRXW7uMiHi851WoZYBGn7A==
X-Gm-Gg: ATEYQzz+n5zdhQcBdcDRgD1eYctcs058AvEuwzxV5KIV3DMNRl66ERi+C1M+vTMRHZx
	a5VFiay90Rq1A5ywalrINn7iDkCtVyMOHCD6ZECJH5jxQJ/NfKDJpL82mNLiP2tEK6tnb37npy6
	G7wRV/6xIc4Drjc+oyK1Q/IgJ07DEXXIaGPLO9akD1ORusK1Sgq6CT2z+xNynpyrbDU3WUUAk1T
	c/pGoo=
X-Received: by 2002:a05:6820:1786:b0:677:4fc0:a852 with SMTP id 006d021491bc7-679f3d28624mr625360eaf.34.1772089546218;
        Wed, 25 Feb 2026 23:05:46 -0800 (PST)
X-Received: by 2002:a05:6820:1786:b0:677:4fc0:a852 with SMTP id
 006d021491bc7-679f3d28624mr625343eaf.34.1772089545831; Wed, 25 Feb 2026
 23:05:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:35:34 +0530
X-Gm-Features: AaiRm51yZ89kZv0f4gE9xa9boBW5MZ_Co37QxpUC5GHdKH2lI624cxTwISy9vz0
Message-ID: <CA+Ht8=a_fw-u2PLEf1GY7qYLT945OaJ0LeW6K+X2SvSWLqsrXA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] ACPI: APEI: share GHES CPER helpers and add DT
 FFH provider
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
        robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: P8Fo7kEcZ72ReT2_STsY5iaKLJMi--tm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MiBTYWx0ZWRfX6RNsEAc01UXK
 nkSs1CwgVGRwlKoSpFtHv6j1B9tf9KtufdZhfNi+QpcMNmZJrjtOSRjEwfCGvjINQMaQPY4zs87
 fijj14y70XGz2W6KbdaEV8Ge7uNYCvUPAkboA9Sf8zfE5gZtvr1aU13dcSAv+F8uO/MDaVYZ63f
 Eb04JM67YqTFf8t5xTGON86T4LKvXyPdrElONnlU4kA+glHnn7O9gsIs32lF0/wD/B7b1k42BzS
 fhWiFIkvGxGlmgq9xJOfssf8eJFNYTfRGB06MAeTedaY4TeSBuTb/E60s7JCe2V9DMcIDgYQKk/
 oUuXb0HX9CrPD+r++yCXl8KFNveweWXf0ZleqqQL3uK6lM5zm7wV1BuL159DN7eJWN9isuoQLSx
 i1VX6qm5wPcJutuPlt4FduHB3X3IPb3pVCJtZDjazAf3xLw2tFBKgqKDe1mddtIY7HkUZw7lXMt
 mF7FZ85Vq3YhFKjl19w==
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=699ff0ca cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=2-EGK2xgfFmwblvCShkA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: P8Fo7kEcZ72ReT2_STsY5iaKLJMi--tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260062

On Fri, Feb 20, 2026 at 7:14=E2=80=AFPM Ahmed Tiba <ahmed.tiba@arm.com> wro=
te:
>
> This is v2 of the GHES refactor series. The goal is to reuse existing
> GHES CPER handling for non-ACPI platforms without changing the GHES
> flow or naming, and add a DT firmware-first CPER provider, while
> keeping the changes mechanical and reviewable.

It seems almost all the code is being moved from ghes.c to ghes_cper.c
in multiple patches. It is not making sense and looks like an
unnecessary churn.
What is that which can't be handled in a separate file for non-ACPI platfor=
ms?

>
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
> Changes in v2:
> - Dropped the proposed "estatus core" and kept GHES naming/flow intact
>   (per Borislav Petkov).
> - Re-sliced the series into smaller mechanical steps (per Mauro Carvalho =
Chehab).
> - Minor DT binding fixes based on Krzysztof Kozlowski's feedback.
> - Removed fixmap slot usage from the DT FFH driver (per Will Deacon).
>
> Series structure:
> - Patches 1-8 are mechanical moves only and do not change behavior.
> - Patch 9 wires the shared helpers back into GHES.
> - The DT firmware-first CPER buffer provider is added in the final patche=
s.
> - "ACPI: APEI: introduce GHES helper" is internal build glue only
>   and does not introduce a new user-visible configuration option.
>
> - Link to v1: https://lore.kernel.org/r/20251217112845.1814119-1-ahmed.ti=
ba@arm.com
>
> ---
> Ahmed Tiba (11):
>       ACPI: APEI: GHES: share macros via a private header
>       ACPI: APEI: GHES: add ghes_cper.o stub
>       ACPI: APEI: GHES: move CPER read helpers
>       ACPI: APEI: GHES: move GHESv2 ack and alloc helpers
>       ACPI: APEI: GHES: move estatus cache helpers
>       ACPI: APEI: GHES: move vendor record helpers
>       ACPI: APEI: GHES: move CXL CPER helpers
>       ACPI: APEI: introduce GHES helper
>       ACPI: APEI: share GHES CPER helpers
>       dt-bindings: firmware: add arm,ras-ffh
>       RAS: add DeviceTree firmware-first CPER provider
>
>  Documentation/admin-guide/RAS/main.rst             |   18 +
>  .../devicetree/bindings/firmware/arm,ras-ffh.yaml  |   71 ++
>  MAINTAINERS                                        |    6 +
>  drivers/Makefile                                   |    1 +
>  drivers/acpi/Kconfig                               |    4 +
>  drivers/acpi/apei/Kconfig                          |    1 +
>  drivers/acpi/apei/apei-internal.h                  |   10 +-
>  drivers/acpi/apei/ghes.c                           | 1024 +-------------=
-----
>  drivers/acpi/apei/ghes_cper.c                      | 1026 ++++++++++++++=
++++++
>  drivers/ras/Kconfig                                |   12 +
>  drivers/ras/Makefile                               |    1 +
>  drivers/ras/esource-dt.c                           |  264 +++++
>  include/acpi/ghes.h                                |   10 +-
>  include/acpi/ghes_cper.h                           |  143 +++
>  include/cxl/event.h                                |    2 +-
>  15 files changed, 1558 insertions(+), 1035 deletions(-)
> ---
> base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
> change-id: 20260220-topics-ahmtib01-ras_ffh_arm_internal_review-bfddc7fc7=
cab
>
> Best regards,
> --
> Ahmed Tiba <ahmed.tiba@arm.com>
>
>
