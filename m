Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906844;
	b=hK7eKatw1EN/q3Ypcn+Cm+jt053pVEqlXg61Ah4i8UWlbVNphkkp2mdg+CWdtf0sm0Fj
	 T8Ex2eOSDtg+nhSZuRuCGS8/syksxQ5NrMKdtLbZk3MwedylnYRWRkR5IdvVAA59JfvSa
	 72jiWkdSAQ3YRd5X24r29Dkc6mZ/oP+fR3wFMjOoZPjR2LSNZKCeFULeWiyfkKvmivvlV
	 i2+TjkbWrrn01rWZwFmbTFAMU9OGEsRXg/TNQ10BwFTwe4AwOWVEO5hqEGcrLT7pqHcoT
	 YvrlcPU+Ua6e26iRhspZdN0H9x3O0e9xiFzPk2cc3jkrwZNNVsNQiO+iJ8uvP70d8IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
	b=r8ULuDILzBN1kCV23+f+oI3tOxRb/HKkpGOGEI3pbXZi5u/QzvD0y+adbHxBdkTkfi+R
	 WUzSHE5Y+3IR+EfWnOiLFON4LHiMkxPe/2v8nWZv6jYj2exL7Lsv9K7ejNs3QcKmftfMe
	 FBW+FFOY7DrWvnCsYD3GP5FvWUWDjdRZWcCdsQcaQ1sCt5xtKWptYt/VAfN4gIsT1X41m
	 ZSxnRmkKu+AMQHYVY2rnNt1fYFyTLAVhsMd4EPn0lNMXaV8glaxU2EW4GaPh9yRDCH4uk
	 cQAHSlHWyZEToo/ojTImlOL1LXWHA/lgRyi/3Pjh4MYQiCEBRQvbcORucwwYZwn16OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hZVTzDz/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1639606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 09:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1639606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZVTzDz/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8tNjN200038
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 09:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=; b=hZVTzDz/XtTO4viP
	FrXqnBfgsXE8rhjwexNMBxTEZozKv8tMrH9ZciFDgdjBJeW0OI5F4vcxAM3iAaDD
	hY3okPvDHyjGDImGxeNQQS3iUZ0ma49hba1JTDK626caUjM8zBPnWapjKZfdaIZ1
	8zXvVZh0Wj3LnI+WRwFFkF4HatLVTCXSpkFllwN4YGcGkJ3M2gumTxv4Vv1hW0lF
	v2epjszqr7uwBMeamodpZMdfDmrh6N9WhAmhhnp5Yn48G5YjJ8eVQkyWVeM9OFUD
	71kUTgeM8sW2j6YEq+v+9Ldo53x6nQbrUN+uy3Aq2fM7viIt0xwrA+slYyiTT0a6
	gpVXCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mc083-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 09:14:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so806269085a.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906842; x=1795511642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=TBaXqZMRTpNeSO6OLDFX8q9T+ai5snOlWnNAmVZEQyFoz+bYoleAHGWIgAQvaYDbV9
         NzXKpJz6e76UoZC18oS4AEv0rpHZRE04Ym7cGA6qF9iEm2ylCUUc37bM6MVPoaX9wS5e
         8KLxuHxhtk0JUmWmTLBcZ66eIPwm7tyui/OvBFrvSZhU8O8+CxlJcpxn5Y2KNcnEDrW9
         c8R8tx/bCtSCHByvR2kANqxT+ZSnFn/9w0z+HFTi1kDKhp8bTdLEMQ/15Ez7gCB1C2O6
         OcekxhrC3Z3YOGSsZQD64BH0UqV4dt8rAK6FSEEGOdFgwoJhyjRZCTtXPBixJjc43Zox
         dQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906842; x=1795511642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=DY3MtNIN55Jiy0jPN4bKgzafK5HpF8OI/WxPIQrARgS9wy8vr4ZYTzeR4E90eCxe3T
         gkb70okAyz88QWdr4WQaIES/T1yMunKyXBuYCCCKVicKvW7F/hE2Eae2q1ll687udJzH
         ai5Ix4Ce8ELsEHZ6R6l9+PmqB8x6Rp+nnZFTyB232DVFGDpfUm0ZxUvOHBCFgweWW6Rt
         UpQ1doliquamDNcsJHR3FAwTATEXO7TxMd04Z6ROsQm9XSVt9BYH7nkH7yb0U2kP0BrD
         nzb8y+c3jn1oFKF2a2IbUD102rDYDSOmWXe0dGdr3s8IxGG4Ul5wHwLgHvSIxXN045/1
         ipyg==
X-Forwarded-Encrypted: i=1; AL+hErEHSZSmAmXRW4akMmdB2dMbI7kxcSJiCOI4LuPRsRhiFSePFtJTINPDgD8doAwnqs1We1axMIgToBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0vdzHS3KLm2AKctZ3fDNBNRdKh1JSK4Gy2tuMZjA0mIJTN7tG
	ZaLIOYTTKYv9HbzmDM63pkcZE4PnY2TnpyRrn79W1tT1DmH/xwzfoRg25uMTxK9MbvOCJ5zCwYl
	AEkrG8hj9e8kZ7VtPazpkS/iDNghPf4+5A0200m8RBsfGgwCIZP/0qBZzg3MsmEA=
X-Gm-Gg: AYBFou0OraMPU+e6QzQgx5o8GlowmksEAdgAHM5u8T5ObRLS5tE2AyAhVFstbVTI9Dw
	Sby/YQ5fbMoDhQr3DeKCXab0kj7uAsORBP3MUgievAwL6NI5W5OegPQQa3mAmQNdka39wEfYfco
	BAsud/Fqo/fFjtj7L6Asi83NqANrhaiJdgCD4eNPyo/TfX/OW5C4TdrnNGRNy2xR8ilwOSuChxw
	Xly3Yjg3ORGyqCa+lkImE3P6ChDkxv1GoDvVqXawaa3kjpJUp6GGpClgarRR6X+3yyV5T6r1zYi
	cns91z3N7sWvTzgCELJf4fhZq/W1IIAcQHkxl6ykP60x7v0zREI52XLC4ZwR0QHdnaq46qL3fQ5
	ejWp5OG2tNSlzCXsrsgMJ0qJXu1noJ+6ot+Pyy9KjNk7+4w/dorbqKNDoecgmk8deOO/32AUogB
	c=
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398323785a.75.1794906841981;
        Tue, 17 Nov 2026 01:14:01 -0800 (PST)
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398321285a.75.1794906841503;
        Tue, 17 Nov 2026 01:14:01 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4dec730f7sm1177496f8f.11.2026.11.17.01.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:14:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Supporting LTC4284 which is a negative voltage hotswap controller
Date: Tue, 17 Nov 2026 10:13:58 +0100
Message-ID: <179490683060.18860.17025405055140807603.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXyG/u+Njj/q5f
 1MCxstqzbxCKZyBX1bQQcd1VqyswePF/v8O9cuMB3xDbsSP7etzG+s3Wy0+04qEsJ1GXhgk8685
 qG5/j/AuCkhy66wi0Wa6L8fPJ8OIMbpHCcqD3mG6dj6553dMbH4VP5FW3ijrCYY5uHE/DEMUQ5f
 wCrporspeIuaBu6wEc/NhUiAlWP00lKc9yFJOvvHpwrkegmP09UiqpLz2pAdIDFx3Ef4TD6FsqM
 kIQXgSNXegbD/p4i73Axe911IIagqK8InCkoXk9X98nWON8ta6/gV8lqeLLrk6ErVm+ZPLkVIZB
 BZqwzLaNSxoYZF6anp0lTU7QTidsv1+fbYBFvSqTOtkt+odCtxNf0fs8PoUGIH672J+6PXgaxGE
 OQ5f7eV1dzTOH8XAuCrpJS9/YoG6BlWHGAJ96iglAu0M+k6oMU//AV7WNDvYBank+8h1JOIIk13
 ejlVHskJYVqfQ22M0ig==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc1ada cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6zx4bRIOlK1EkWDDbbUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: GXVUE0vVH0_Vauhk3O3dbaSxb07xN2me
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXzjkHe6+O9O7X
 u+Rksgw6He2kIFeRwaa5sC9LlXBWSRL5b7QWV/jwuU2+MJ6RDrH8s5arHdXOQ8lSSgx2XZIHMwy
 JojIpWjMM8fF2NShVTeSu3ItMdqC+QU=
X-Proofpoint-GUID: GXVUE0vVH0_Vauhk3O3dbaSxb07xN2me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170036


On Tue, 17 Nov 2026 16:26:47 +0800, Alexis Czezar Torreno wrote:
> LTC4284 is a negative voltage hot swap controller that drives an external
> N-channel MOSFET to allow a board to be safely inserted and removed from a
> live backplane.
> 
> LTC4284 is very similar to LTC4283 but for higher power. The device features
> programmable current limit with foldback and independently adjustable inrush
> current to optimize the MOSFET safe operating area (SOA). The SOA timer
> limits MOSFET temperature rise for reliable protection against overstresses.
> LTC4284 also has up to 8 pins that can be configured as GPIOs.
> 
> [...]

Applied, thanks!

[3/3] gpio: gpio-ltc4283: update Kconfig description to include LTC4284
      https://git.kernel.org/brgl/c/c6d8ebd7324cefda867a701b4341605b681aa3f5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
