Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3BB4399DB
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122170; cv=none; b=FLobgf/lwjGS/Ek88Si0bu3ZY5gCqeRbDoI4RgvfWYFNjLROyv2R256O1ZjG4xWgV5KYWV4Fv8jLlc4Y4hkYmgn7wDPzKuxGn4zGaDN4af+9rnLNmN1malBYlc+HIrXtZywcHGXb1hamnLWcWtXSUwMqbUFPoMUkCWXQSI5gnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122170; c=relaxed/simple;
	bh=IzxSwCrhf8d9FMRhv0k7DfYYSIK+phpr001usHYVJgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipbfRymi/6he/8CvcjR34P24B8mMds78zkW+ixbMaYiBRyN/7yehjZREIu3awU5TqYiASxKwxiWT9HPWUEhsSnjk11lSps4fKrnFlBvMtC42+LkfjoogiMZECCf9CDq+2v+GA2+wU9k1jmuitL0FlpKforbswO8pt01/cyVHkzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNuMl10J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SACoaXIr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNuMl10J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SACoaXIr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kqBk3464050
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 10:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDweQGfiDsekOj0T2784PA2rCFWCh+RkBLsA7n7s2rE=; b=iNuMl10JnOkrBvNr
	n2Y5oDnpdHx5rpmFkY4AD9L4wOL2CfWozbGj6GhbcPVGy+3azf9v4cMvSdc4pIq3
	G+MdrFSluFt83raNUpUP0UgtTVrWwCuJYCkSKmR5HHMfJ32Mk5a/8vAq99sgNa24
	OlAjL1QV/kJHxZPM5dI2gO3EMkt48/QnighBWtrYMyabnjUvBmMRCzBPpzw746T/
	q/aZcrQFU7Aym4wZYhN35EC+JO2ecMJLAgFgpUBiMWRU6fhkUoOqBllIpKAW2P0q
	idi9EplvOYdiRzaWbWdDanAPxindBPXXbxi5bBb+ekEoF5vZ/mRjM5Ciy3m7oWz+
	WLnm6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr95j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 10:22:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so154404585a.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122166; x=1789726966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDweQGfiDsekOj0T2784PA2rCFWCh+RkBLsA7n7s2rE=;
        b=SACoaXIrGHa2sGPJhpBtPnYViQrWLdGLuqYnXGWJ8UFnZS2XajKywt6qJwzk6WET/B
         PKaly8t0BtQdQzhOgoIRNhXGPbB6h2h96wdvr3jmqk0Dq0ajq5Gt9rwaiLxzmS6HSRYA
         F3+aiUoxnYAJzc8Z/KG1+mc7ZSCHi7oL6N/9CDJouWJ8e5hNcs1nyFik9ny/ZkcC8NRA
         2MEYv8pvmPd/2DPK3aYD2dR6uNMXfN/W7c1s1iqQ9wXekOxwJmn5D0c5n4qmPujtKVLR
         vZ93F3LnnNPwRjN6skPGQWVWNSGUJ1bLLiIz06Q9nTJpI6tl6EqtEW3gip8cyVx+aQQ2
         0W/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122166; x=1789726966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDweQGfiDsekOj0T2784PA2rCFWCh+RkBLsA7n7s2rE=;
        b=VZ2SAa9+kQJ1qEp3LqbdSTSBSmledJrCdCA3YjGsoL2qnT9PRjtHQ1PAQlBGfzXzNP
         HjiEL2D5czB87w8322IJGRnf/zk7z99Vy0W45tMmN8Szljlr8exDE40JFLV2cPkd6u1L
         7eQGKaGJIUaSjjn9cKmNTLs+MzAGGGL3TdZz0GwJWl0/w9jcbSmlTNajcpTnYPcPfxo5
         rMBfFUSXOB6cT8o3KU2HgOz7JYCsoR8WkcyHnBOnbeHxnmS1iOdyoQfxVc2R3r4BpsWJ
         GuM1VdDLDUtSTVEk6Hn5DQNUBC7/0vJJ5SZ6mwVzZ/NJcouGaOSXmYc5GEUCV/Stfwhd
         KLeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMJkG8QKYaWASnZHMTuSHOJTOOvwNXdd9M3WoKtNdbnUIdlcA5GBn4v0UIx5A7n7OBSDK0djgtc9A=@vger.kernel.org
X-Gm-Message-State: AFuF++lhGr/2di+b7JiNyj0W/spy4ddbW3VRwCs+8Md/Zg4NR1QtiXFy
	iq8G6WWiTKbmTstd0BkG0xIdS4paAfiNd94sdEsCMDiBq16h7NutokarY/wAXk4h2uWr7L+fJZW
	WGBwnWSCivoN4MApfKmLzBiktGpOD9ASjH7DvYdJTUqx++kBfPDKz3mgGZkITPYE=
X-Gm-Gg: AYBFou2SaPHTV4ShCMkjBvS7SR4qoi9WYfLfZ7+hvKMzOi8DKv3HxYNQKUtYMXNrbZA
	/3sA+RM+fmz7N9vWDyfUX/YYJlt6UObI+fuW9gumxlIojyhOz3zJ9pR1Fdnok9pKrb1uz3najjq
	UxQeZeCdPUDSIUB6ibVTWkPqHU63xZ14pbToSrMsXuG4Zt+FHryk6i1V88M+IR9y6dewWnE/6vC
	s+RCrkMJ4td2GnbNFRnNrGetmxzun1uzgUPJvmV+IAXlSzUBeI2IT/TUVRcH38UMqnOvJsBLJ4X
	5PNbDRQQ2tBikGclz57YL/TZBtTEFZHmHipOwOoF7OaTokPItsMxDq3v+RLbPwm17DzrbdjU85K
	5WQW5dJpEYWoKEbacIFSDEm5MhEK2HshkNC7tyjbetPB+JGMOKnWV41pz5KS5pYM=
X-Received: by 2002:a05:620a:4482:b0:939:c7dc:8712 with SMTP id af79cd13be357-939d7eaef14mr1043306585a.15.1789122161337;
        Fri, 11 Sep 2026 03:22:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:939:c7dc:8712 with SMTP id af79cd13be357-939d7eaef14mr1043304085a.15.1789122160909;
        Fri, 11 Sep 2026 03:22:40 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60a8a89esm63701295e9.1.2026.09.11.03.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 03:22:39 -0700 (PDT)
Message-ID: <81b9d76d-6036-45fa-8dcc-c180d102ef64@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:22:37 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] ARM: orion/dove/mv78xx0: remove all board files
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Stefan Agner <stefan@agner.ch>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade
 <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Ethan Nelson-Moore <enelsonmoore@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        "David Hildenbrand (Arm)" <david@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        Alexander Clouter <alex@digriz.org.uk>,
        "Jeremy J. Peper" <jeremy@jeremypeper.com>,
        Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
        linux-ide@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-6-arnd@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260908152808.3928630-6-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GeGH920RSvC2qyayHLCdrJYjeLkMif0Z
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3d676 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=P-IC7800AAAA:8 a=qUSviUioAAAA:8 a=bcVNC_F_AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=_jlGtV7tAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=LCLTMPDaK1Elu1LaZkAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NaVVo_BLbmHoeYVcMpQ9:22
 a=XlnQEC-7T2amSQPCFme7:22 a=nlm17XC03S6CtCLSeiRr:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: GeGH920RSvC2qyayHLCdrJYjeLkMif0Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NSBTYWx0ZWRfX6D99UhGeDhH4
 NNo4MgUHbNzR2R+IN9qdzO+VLvWgP0b8aZrBmEsUaIQRYqX1M3VMuxzw+GuLom2jembwzukR/5v
 iRONfoZPWFZjbq850cml1Hiwq6Siaq4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NSBTYWx0ZWRfX3KembtwIRbB8
 9YaldYfxfg1Zn7rOUMfrIDy9aNHdMM1scwTsmGM/tyd24dJfDAEr+DueXPsC0xgIDioR49FIB6S
 7C6E122THhBfFqBsGVcP9t+9QYBPutF3RTHBMenxUlpwuNChtQvdN+WurofP+b11BrO8y0uLXX/
 AV4oJt3Yr5X33w5sHHWyTrJQN+faE6EUXPXUdA2KX7BVS3RaFTR3H2z7mu0eZ+SV8K/fnURKsSI
 cS3fRoLWnJNYXdXwktTuWiD1HxQa3zH907m2uehVrjFM9Is3RYSTz32GxysyKWHJpTJoM7kWRlN
 n5jTqB3p/G9jiKXEsx8yYMUSk9vuPAuYzPbh1qjwHPa8HnQG3loIsPmRjmcnORHtCPj2ulFEt1m
 /sqG8wsZbbWIFSBZK5tNDnLR9Z0ZdNr0Ue29oTaRImmirzRdHFFUC2sJq+59qzf7XmDZRQ27xt6
 eAaItgKLLMol7IZRcWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110145

On 9/8/26 17:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The 'orion' platform is the predecessor to what linux now calls the
> 'mvebu' line of Marvell SoCs, and originally covered orion5x,
> mv78xx0, kirkwood, dove and a few others that do not have any
> upstream support at the moment.
> 
> Only a few board files remain here, these are the ones left
> in 2022 board file purge because they had some level of support
> in Debian or OpenWRT, mostly for commercial NAS or router boxes.
> This distro support is now gone, and nobody has converted the
> board files to devicetree, though the orion5x and dove platforms
> also come with devicetree support for some other machines.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Alexander Clouter <alex@digriz.org.uk>
> Cc: Jeremy J. Peper <jeremy@jeremypeper.com>
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: Niklas Cassel <cassel@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Thomas Weissschuh <thomas.weissschuh@linutronix.de>
> Cc: linux-ide@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # thermal
