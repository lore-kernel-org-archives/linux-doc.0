Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032599;
	b=3tG9qJpAiEou+UKMF7D35Cl0Uv6hBKPAyTTTd0YBh0PvHpFc7IeoL/FqgFrdWy9eJaxw
	 O9tdaIre0UFgYoQ4Dc2JJ2Q6JWR8pWsjoi70yuqp4oMoRAKNpvsepv7ZtGeOpyPC4sUJG
	 jc7IXD0GLcLcDwSMNtUmfmYDmQzHc2v3EQSBcsWTK1sXNYtkmyk8QSml92jh5AFQZVqeb
	 ZSp89DRp5GTH9x1OWKNA6eG7+u6dpqFmIkt1SfI08e1c/Zs81jUHD1d2xQPxcAmxqck5/
	 j3rT7CbONJThvyRkJ7ddYEAp53bEjS1MIV3ItIzTF95z/tiO3GIP+O/39XKIsMnH3Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
	b=MnAHUcxjJ0X8zXfZjQLGWWLslz17ygkeAAtlLglR482V2vayDok0CtMlyNuFytd5ihTI
	 sSmv7MTLIx5h/D4w+7qqZsR8iOe7+5/Q2P8qLPVnftYNzfGIFEk5T3g6btMa3S5RS6sTf
	 ZrDlg3KQ61wKlc0PtcuMpvq00OfUEU0GMVaD9BKJEtIZwWRnx+KZpAh/gMkufV0J0iH3N
	 CBJ9w/QyG0PGs2QN/YwsNP6ZiEeSi4p0KxTkrVGnLO5ZRQgYU741MHB9Va40SWeDgI7EL
	 4AdzwL+PqhYGY09iZ53yzsC2WfhXQn9IB3KdHq4lanw4K6dqWQxEQqLvfJNVq9Yzzaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPXpFQzU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jAxJEw2v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F96606A33B
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F96606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPXpFQzU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jAxJEw2v
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJN1Yp3700295
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=; b=ZPXpFQzUH6AbsOlY
	tF+ixoIdQ0jj1ae9RM7RCJctNoMbRbIbkMVris6T9wG50ovBmYKYEXHpBN8fVsZN
	B+hlLh1IKIylfzWhm069dLbohnT5QEkpRn/qgJP3A9cK6SQGxVDk4docSmvQgmFS
	gr8o1vTmh0hl3gwg7hmFk/7LjZnJcScYD6A0u13mf8wGY0V9bsaGY7RUV2opoDG2
	5qa8lXB54PX7bMhiQZ61HVmDa0vDI8jqXk8aTDUD3Lr5MHCTiWCDLbQF9VuVMZuj
	NBTRTVKCXtI9u6oLZabbjJNzUI7COsbnFQ1e4d+c4CDlPwuUkDU0gqrN3nXDozug
	mE1tTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etns82t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:09:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so256171885a.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 12:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795032597; x=1795637397; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
        b=jAxJEw2vw7mj84svelmur3y1n+7Hh73fck/3cfbjwdeSBBRA99sfVkwHwSJnQCI//W
         MojkDTZdQGggmER9wnpKxyDfcrudAljYmUfuZBpgnF248FzrcSPmkPSn/RIIGzI5jv8e
         nm7YuOxJwiDAlOaMNKQ2LUqXUn6tkfl8YwbXhxDjn2iJgphkTj7tdIlXGdKrEkmjD9ab
         LNZH+TzFdfOnSkY0IjOyjw90IjHKnA8gSyA7Ujs/+NAXnMom0VSui9i1Ie6naiFxwPWX
         9IPT2w/bT3JgDiWs5E1MkCSA9+wtO/xVn0jP6a3GUK5M6IB9YVkZCHJJqsRMW42Ffqx7
         liMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032597; x=1795637397;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
        b=YnKRVHL1+ftKpvfhZDvpkhFPaisI0ro+vfjFq0sn+2Qo5BUsrBlJjoqAf9GC49AoZU
         f6jDDWJ5tc49R+XnEOmyY3xL2lEIJBRFw6XUkpu4rA6O/s7YsGt/sgVJZa1jnaxlb6uW
         cGB/OKb5fyxfHPyhf6wlHKAcavd/NcEyzdpJkJBZH5SRvj3cmMwxmt+JTEbqH8bQB0Pe
         u7QrpxAlUZcSKpedVxhL9I102/G+AWtzGDrxImtgit8Fodh2esNfTLASTSSfLHwfL1+f
         JMvv1OsD7mAEt0peEeC/qHrhL2tPCsBnKeNO1AU2R3/sxNkQBQ5SG3Bj8i7Hi2jNm9n1
         Yqfw==
X-Gm-Message-State: APuU4Z9g9QYDzSJl8Nz9vEOdQ2ab8wolroSG2XLp7mn3qBcv4rsPLpK2
	9JhSOktPlnXRs+t2MF4WIhPMtyk73rhX4ymPn5a7eGslX7BqldIL5/DaMfRiCHVcdvXiCs+KygX
	73XkRKXJJmX6ZwYyvxetWaYVYGdAzIBsJQOc88iKxlK8K3tb4mk6aiAXc3MRY/BU=
X-Gm-Gg: AYBFou2AoD3eyqS+0MGA6SdKIerK7q8bUrfAwB1xdLqhuHnzaCkcYB1s/gZ7zcNWjlu
	zJCsBzpgUAkY9jNHJ70nM0dQVTllb0kKD9YTMsIBwne+FpnbovaDM3tLMB/VIXmV2HzLUlSrJUe
	nlwDmrSlOYknWth2j1pb1i2J65upN2KgT640tUsQkazBB0l2fpq4yODmK9YRDmRJkSTS6f3XGOi
	ARtMM6v7vrlH56YchDUudsLycG0G+C2LU94v2UMKjFVhLCSmTHu3e89DmM4rTqVmACkutpysjC2
	eoqzwPGU5JOoXEV0J4k/UIt/eOCowLvc2Uy8YCkgHzljfwpoSvt69zROsXK+95aJx/nEM7BqMCl
	6XMwIJfrpLyKjHLMRKRXAc6l3AlOElWiZ30dDxx+2BGxcrz9dXCfFIgXwupE5pNZbQ3qValxpzP
	EVUm05wBeYyT0YJw==
X-Received: by 2002:a05:620a:808c:b0:943:b019:f011 with SMTP id af79cd13be357-9499965c44cmr677402685a.28.1795032596733;
        Wed, 18 Nov 2026 12:09:56 -0800 (PST)
X-Received: by 2002:a05:620a:808c:b0:943:b019:f011 with SMTP id af79cd13be357-9499965c44cmr677395085a.28.1795032596062;
        Wed, 18 Nov 2026 12:09:56 -0800 (PST)
Received: from localhost (ip-62-245-98-165.bb.vodafone.cz. [62.245.98.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656b1cfdfsm6840078f8f.47.2026.11.18.12.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:09:55 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 21:09:53 +0100
Message-Id: <DMYLY5JOE18Z.2CQQGB4INJ4RH@oss.qualcomm.com>
Subject: Re: [PATCH] riscv: cfi: parse riscv_nousercfi before
 riscv_fill_hwcap()
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, "Conor Dooley" <conor@kernel.org>,
        "Charlie Jenkins" <thecharlesjenkins@gmail.com>,
        "Andy Chiu"
 <tchiu@tenstorrent.com>,
        "Anup Patel" <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>
To: "Guodong Xu" <guodong.xu@oss.qualcomm.com>,
        "Jonathan Corbet"
 <corbet@lwn.net>,
        "Shuah Khan" <skhan@linuxfoundation.org>,
        "Randy Dunlap"
 <rdunlap@infradead.org>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt"
 <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>,
        "Alexandre
 Ghiti" <alex@ghiti.fr>,
        "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
In-Reply-To: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afe0615 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Sz50MssrUYSuVvM2sb41rg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_3qaHc-GLK8r7rxdq84A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HjDPT1eEMTNDpOEHvC2sVvIe1wdUrYv0
X-Proofpoint-ORIG-GUID: HjDPT1eEMTNDpOEHvC2sVvIe1wdUrYv0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX/l3Q4BJ1xmHn
 Th8ZpwzTWpdtQNGowqAOYtYcVvStVICjkrEBOzJ48ayXcz+CHAx7d1eybo3rwgIrHiFFyDp9nCq
 q/Gqg3ELsnhi4uP6A2HaMoFF3o8fzRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX0G+E0m7mnuwg
 Od3sTSAxZxHASolwr07XaUPWCdrbsrPQubkTk2dyATES9a/qgNAHpHsZ1tb4/wy9hu67wldXd5U
 ZB819ahxNOyLKVSkToT2C0EhGJRew6c+5aySChfA3M0+tyOhQXDFlic0qo3rHkZtfhcmXyThc4s
 ySKHGq6/IMUNLBhJt+vT+KumenlExDK06k4RzuGlrBm06vSzk0iEeKZB3UoFpiJijj7xscluVV4
 6CmecblpighBUXFaaM6gETTKja6fGTzbLRfd2jZutrAGCJ8z93/doB4gKahvgFLGHjTnXilAdoz
 PapYazmJXFGj/P8iKoY6OIxjPOCwwCXtbk5siQUBXSzqeAgswPxzWXvJeV7WQPo0rG+Qe7F0Cg6
 hYbLzpRFGohQk+6Ng2bYJNbS5eTXqgjKvYPxCRkRaPcwZ/Jb9M0STCAm4WNgvbacDCKafYsw44c
 v8xUU3DWaFkX6+CnK7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

2026-11-08T04:42:01-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> ISA bitmaps don't honour riscv_nousercfi because the ISA bitmaps are
> composed during setup_arch(), while riscv_nousercfi is a __setup()
> parameter, and those are parsed from start_kernel() after setup_arch()
> has returned.
>
> As a consequence, the riscv_nousercfi test in riscv_cfilp_validate() and
> riscv_cfiss_validate() always sees zero, and Zicfilp and Zicfiss stay in
> the ISA bitmaps even when user CFI is disabled on the kernel command
> line.

(I thought that was the intention.)

riscv_nousercfi definintely should disable the hwprobe reporting of
those features (my series did that), and prevent their enablement in
user-mode.

Why disable Zicfilp and Zicfiss in the ISA bitmaps by setting nousercfi,
though?  Aren't the validate functions just misusing riscv_nousercfi
instead of defining a clear detection mechanism?

I think the ISA bitmaps should consider whether Linux has the
extensions, which with standard SBI means a successfuly executed FWFT
set/get.

Linux can then use the ISA bitmap to decide whether to use CFI for
kernel code, allow it in KVM guests, report it as available hardware
feature, or allow it in user mode.

nousercfi seems like it should only restrict use of CFI in user mode.

Thanks.
