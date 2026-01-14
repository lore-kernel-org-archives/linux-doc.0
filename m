Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D83034EEE5
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422881; cv=none; b=Qg9pq0mJPNAtJUZ5c0nVzISSH5qoewkQzJB2isZEmn1Qk68qnNi8Uz30253z7LoFXLH1F1urDaBp7/0MjnrqQCibBD/wZofhjMH54UrknbH6QEQATObNuC3kOwL0yQ7SiS0V08rFPEZ5inrwduw/iZflhJEqvIYIpg4/Gsg1OxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422881; c=relaxed/simple;
	bh=NY4GbfVkjwy7A5J7O8z8rR5qsvbrg1pfkeZuiGygh0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsZhL7oepUeGWJ7/VXn8L7F2yDgCFJHlSlgWc6gQQ1UQko1/gPwLNfxf4bV7ehFmSt7S3vr4C8TNg1bcTS4lwF1UvKH+712iPyK+GDEF21CdQo9tGb67M8isywaeE+O2BRAHJPuJheopk6ciD6f63QiT2c6SRCh1Xk6M9T4QC0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ns25+uld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QojVEQ1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ns25+uld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QojVEQ1R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHeZlP3296325
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=; b=Ns25+uldQ1DaIQeO
	HjYOpkWlYYe3g8JDT1yTh0ggWSEOBdKUP7IQQdK/m6u87EBdlAiyjM8cVcsUE/ER
	wH/0zS36jL2yIJvdkx4ZYA/rFXr509YPvxYMEi0fqXFkyGs5VvrBom6he7rDfAPE
	uSmlPi1gYIFCKBxlpIQfchkYhqywZCRH4JNI1eeIJ1bo7Iwiq3lqAcdv4gl5TfL8
	g8vFo0OQBtaq1h+hGfP/SwSS/Ev+hcNCbDqXzEjBggdUrATyNPMVAUOoCQjwwgJf
	MltwdO4xzDo7m259cDcvpBWOxx4P36NmbW7DgQer7rb8+1Bk9ox2gnaTFLF9Vt1N
	gIZurQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2t7cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:34:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae546fa935so1928022eec.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 12:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768422878; x=1769027678; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=;
        b=QojVEQ1RdbuZCsb3abMX3o3MGxnXP8ilmlqPwkML8RNNjjhHXvFv+Q2kPOtPDX2PIV
         0SLY4rE+QnZuwYLZx+x1tZGiB0du89guOcz4xTvf4durzu6LomTYNivJ/oKs5Yivqs4A
         3yzs6QVnjvctqvv9C28AX/mlNkYD06zpM0g+NfeT5HkY7SA6D/Wp6jeFNxFeNtj2Au+q
         siP/zWRaKnLIH+8OaBqm9iVMS1CIdYtloJaQYtPYxmQbNQ1Q/8FVnQg0iwj9APyR7aWH
         z+F2J6wZwC5aK8NcyJUUB2AvapxifCrRqpprQQswIGKAGVURGJVy+tAwLtaPi09b0XvO
         gJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422878; x=1769027678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=;
        b=RmsrKp9b2iVJ+eAXGhPkxSEDIPhRBV/m4dgfu6MuGjMqJb90lGhk4Vl6TXMgNw7mt1
         gcjsKBbrsSTqUfg5gEXtCcLxBUQ0pODfKLeZk5Z9PlXVekszSeB3nbRcEKf2rEla8DHI
         9WtNyJ9uiiTJG8sGV/ZIkTL/y76PNJjKt56dmc9viGTm7lGYMKUwugNpPDO3LZJsMfcu
         UhcOtQoN+7ARdTQpgKQZ0OXFhDH3VKOzhWxkwjOkOYvGd20zS/WyEeqEwbsOXFYRVPea
         bV4II+E1NNLqXgwJil/2fp7ld+COFeq2WmWGv4a2rc73bzTBKsOyoum6NVzQ1ZbWapEr
         jPJw==
X-Forwarded-Encrypted: i=1; AJvYcCX2X3aZvO6KsYM+5WMfdsOcXJ/+FctGtW297rdcLrs5kEbhOEt20hJzQhMcdjWq0o9lHemIlqdll0s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3wLxswwXc851v2BUjhYfxB9YRyZzCKFlhYkYMbmcLcIF4eFe
	n6p//Ke/v1JneEzNTJykjNG6tev5nDP8Uev24AOsLuCNS4pqsPgvjU7ns5nudlqDOFLpCwDPKm3
	vD40o9BW3HDTCpsft/YW7+f/Pth9/kuxqN5SDKMIYRVmEuyRHP5dvK/sX59XMIy0=
X-Gm-Gg: AY/fxX7BRHTou4AiftYSR/QTysZo1PLdttRuHIDH2VPXBaqa/UP8IKmM3//mh5AEk/R
	Lth0QR1L8aYNYXlnxhaFU18LNlm5hR6Nx0ovX/J8YEJOwNo0MPCYO55SnrdYxN0fnlLO6EUFlbw
	cQLlLKp0SYSBx4pnHwL54bzv/bFa/IUTZr5jlWryIdSqoAMLDbNfAfCgGkkh8ZCPeG/NUROKoxe
	g0S4GV0aWxmCYNO98O241SQVkJDU1PGzXED/UnTq13NuXP3Z+7UxBgPWztotlR5ODgKL9UbXrq0
	j7AFqIEi7LIiVNMiVJO8bIEa2glpHtRqhBrlmcbje5kjezVuUbH++qcVgRwE2YGPRvDhQNQhz/z
	rtCGPKbUuB8IRziZ6aS4=
X-Received: by 2002:a05:693c:2c15:b0:2b0:5bfb:86 with SMTP id 5a478bee46e88-2b48f230681mr4714327eec.17.1768422878236;
        Wed, 14 Jan 2026 12:34:38 -0800 (PST)
X-Received: by 2002:a05:693c:2c15:b0:2b0:5bfb:86 with SMTP id 5a478bee46e88-2b48f230681mr4714293eec.17.1768422877702;
        Wed, 14 Jan 2026 12:34:37 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm21242064eec.5.2026.01.14.12.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:34:36 -0800 (PST)
Date: Wed, 14 Jan 2026 14:34:35 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
Message-ID: <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107162829.416885-6-joaopeixoto@osyx.tech>
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=6967fddf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=8nJEP1OIZ-IA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9CwZglbhEJm_Vmq__6wA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=VxAk22fqlfwA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OCBTYWx0ZWRfX6boSJjrqSzDp
 T9OsSH1yeuKz0y7z2ed8D6mVixt73JvhU9iYdoN8QdSxEs4eA1b96SetffuGEK/4qQup1kCZCDI
 hw+v2MPSzGDSUqfvqygNCtat5feJeKhTpKLl3HU+qgnG+9N19Kmiug2r5ahIUVrjXUhJCoIjRn4
 wx9fQAlY2IL+dXPyMiPWKpovticWybhbRVm3AytNC6WEx7QcPl3LLbApzPPy2lKWbYLRYOfZ/yd
 p23jsUXkvqtUO53iq4fl/Gf28UnW5i6ac7enx/7q7+zz8MLWamFiIoDWXwA3XBvJ51w+qIodQVf
 7dgqeP7Lo/nKNrxPRO+Iv4E4MkNUNKdwD0UKTJID5B+iEQbc9ojswN0OqYB5tNduDEOgel/PEt/
 /0S/+0yTfFsxsLVZJ1e/xkNkN7vMF3vjlTTIHvh0+0Vb3RqoeH0RN0Z/16Bwb17ksBQOBjqzmwE
 NA7Zq2dR0JNLmnDA4mg==
X-Proofpoint-GUID: y0NR0kkmL1TTDjkHNVcdtp6kunHELhDc
X-Proofpoint-ORIG-GUID: y0NR0kkmL1TTDjkHNVcdtp6kunHELhDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140168

On Wed, Jan 07, 2026 at 04:28:28PM +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> Move the IPC shared-memory hypercall ID from architecture-specific
> headers into include/linux/bao.h.

The series should be rebased to have this fixup integrated into the
previous patches where the code is first introduced.

Thanks,
drew
