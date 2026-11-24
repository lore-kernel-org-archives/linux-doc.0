Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563776;
	b=Mop1o8XVVilITF4cgoVdeIbBnmOUQrCgq9wk6nZ/lLH65pIlbH20vgGQ15F8tSqwMcf5
	 8SrPiRuIhrKeGBwvHTgZX79nhu9xetEP0Cth8TBw4DssrUbCKuJ6u/Dpg3ZaplwbnNbXo
	 jyYgn+NV8aXx1bRBhkftmbGTrWJYICB+ppDbFJMllEptXPlR6OiLC5AHZx5d3rSyZSvmM
	 9k99xWazC9SOvGYhd/ITkXRUgVejwGXTSGk3kfCAc/+UbmDJ+qbqiYpeWukS11IUcIg6q
	 XXAoR82RzahJRv+DNNw6O7Sj38wqKPywtSTGUMhc24/gxGULhHpxjz2hhUG1nBdasXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
	b=l04QNeAMN7lS+oOYPJWhO8XZapzLPL8BWk3smHialwLQrq4+kW/ECeW2IjUWvz0lE+Gt
	 1TzT9dSfWLifYIcOK/L/T8AeMTGb4NKDmUVHjL4kI2b38yPCXN65MKTuJ82ufaLvdZLu+
	 zakO32FGPqQvirfqxIGBs/Srx6t9EJlwMUBJUTnz1Gbg/9seS6Fuid+2nxjC0a6upgJzU
	 XUa2kSYKAOhOygQ2JgTRZIsiHWvHlXDVscaocs3Eq+fwKOsK5m/96+zpbKvxSfIHM0STW
	 fUsp1KJSYF9He+xt/jF9ueBgoqOjMbCZUvvMAKboK69uu25h2cu3QSbn3iHcRMiep5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DaYzFZsD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0jaRQl0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499A606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5499A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DaYzFZsD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0jaRQl0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMakuF2287410
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=; b=DaYzFZsDbHmhOPgW
	ohtf7O2aDR3j1uhYhMagM5N5PcxjpIkbO40Pq7BnbIgf1e127zOT1h02zjV5U6GW
	xYvNHWfjdKIJ5kiai/qZl4H0diuC1W1cF9+cxzxw4cdGGr0Y+FnU73hxfeMQ7ESE
	u24XtZtnOmmihO5/z0C036Amck2Dw7QLHjck+M76h09mMjp/sWvVDHpl59OzPIsI
	OBnFKdD+8rOuMuRzP061C1SOynYs2dXCc66sqM0M3lbIdLZixX3j/6qJPEpc27/O
	TgMpIiOK9c01OVBZKoZ4hfpHhQTU3Im6jdupwHoA5gLKGfkIHMDj0F1TNophSXh3
	0bv8cA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs9f5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:42:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so5481251c88.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 15:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563773; x=1796168573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
        b=R0jaRQl0n2REaxPdpJy4m1Z7afJYQ5eOdhUiKac4OzFikfrv23chVNXbiwqolt2RUi
         izvgE8sAZl3i6ac2h2rrhWpNnuAWk1RnovP3cqV1fqsXFxyeytWgrwvYEkGI2983wxM9
         7+2Ss+D0/8BrP3CpMvaJ42zJyILbGgk5INAz3EzjnAVmR1yi4YSTu/EUE+qMYjtUy29I
         30Q2PaplARbfBuCp2npyFg2JKwL9Zyv4Rhtp9RWnExszYh6ZViU3IbL11jMX8U+pifS8
         JZend+fre019BLna7kf260Ff0d4g6sky0cwKH04nRS2QVD3HHv2mYbBGBsv84wHCm7gh
         jPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563773; x=1796168573;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
        b=lhr4viKz6kbnBc32VeHM0n124D9CPRWvT80GrTefs3RqYVx99oKc7RTMNuUGY1YMY2
         w8AC4STeUeMzP0bI6q3cBJrYJi66tJsyY68YUb5QwX15PvewJ88CZ8jvjtO++Bl8IVgo
         dyv79knue/GwPCI1iyKhbCEa9Po9zvUTZPrhc+54LTtyjh20Aicwg/3inN73+5TzirXa
         DVGBlBNAy5HXXQ6/sriD5tLuWVgO9kVTozxjdAEcSoK2d8wVZOVArtgwlnvozcxFSbDQ
         vPKUbMaEdx0U7NNlunyqCixK+OyPvFT8K6H2k5mVBfEqW7gt3gpYCGV6si1w5PeCRBOX
         W/ew==
X-Forwarded-Encrypted: i=1; AL+hErGfnbpnjtBNpaKXJqE8xyskGv7cQAvbIIvQVf0NTBt8J2c7lDk6Jgmfy20mwL5bW9oRTOHvozL7zb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CwCaYL3m44SGJY0oW+lyQgApfu860p2zLUSj5j8eOgqiVn49W
	GI7sxCoRbrZ9sL7+cmEFhOCZHh7tYTJ2TFzm8GQwPgyE+wVcCvJA0pLvxwcmD9wdJWUkN2NegzX
	5EKnkcknPw+k/hhp0PtSgr10HT08A0MmfeN/r7X0CQkETkLQmE7JCbxzPOJLbh0k=
X-Gm-Gg: AZFdTZeZPCuKqQm48sU7KoqigDuNR8gwY4M0W5j8ZpKsLs/oq6anEZby/DfzvMgfxVC
	3ZdQDpWpjLlsk/kUGjZrifr/kiHUuZtH/V28JjPNh/4xRFogKIPZI8r26Nw37l0Busf5CpxRQBm
	F3pg6U7EBFMVDT6fEaq5k6olhs/iBnu8kRhy5Bk7988GRIG8KHARna9IaIUTPR35oBkyZXOL9O4
	LBpSJD8zR97WLitAKDGcpACPl22bZh77pLgGOoKnGJo/zsNSfrW+rZ8dFUpc0wD2gIImwz5t8j6
	flN5xHsx9GluZiX9IuPiUINbqFcbm0xo+SWm/j1wYfApIm0SUp7oT0b/eMBVSHlSuJFa4qqcM68
	2JW7egiTCanlWfXl1e8y5nprd30G2/kI6o1px8nCWWGE85G9v3poEQ7SvgNK8UURslWp45H2CU4
	nLv1USqxr1FG2Wg58TA9LYMiqo6UJp
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr15272358c88.4.1795563772990;
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr15272345c88.4.1795563772474;
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm61388919c88.9.2026.11.24.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
Date: Tue, 24 Nov 2026 15:42:47 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 05/34] firmware: arm_scmi: Introduce a dedicated
 SCMI Errors header
Message-ID: <20261124154247.000075e6@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-6-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-6-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfXz85JLOqUzoPb
 8yCRBjv34vZszlG/6bFPBIT5rGMq3i/n8bkxuibVWsCaRHuIVWdNnFWrLy31/HJblJeAB/cFqvB
 mcow+q9u3NcOJr8YB5YJmgKWK8Try0YRDCYyYC2dsdg2Koy7oElVmSB3OSmFK2fkGy2i4Cgf/Bf
 mdkbf5hMTpYYt1AUkiq0/VUsqRR0fkZZuXawn4Vt0jl+NX7+LWoUomaEJtyFayBKFq+NAq4aGwp
 SNKcZRfgYXXNfWCUMsi/wRJfgbC+TKcBFjMvDrRrwITF2mH6ERbAPedTp1Xb0IKOmTF8eDFqsCY
 AsJ2wez9wh7cawdw7fQTXvcYXrfap8jLtel0vvFQiYtadmA2h6tKiPRMdAxPuecgDzCA5wF9f74
 hegF82+iUbVYbNTo7IpKZMHQydo2hpI+h31CCVGnHDqpO+uemNd4oOYCn6eoo2bKK5LBGuQ8ws+
 hD/tGvM9RzQhNxGwG8A==
X-Proofpoint-GUID: svaFfTYyZdbf4KgR-3hD4PevYazeK5bd
X-Proofpoint-ORIG-GUID: svaFfTYyZdbf4KgR-3hD4PevYazeK5bd
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b0620fe cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gAdJEDVPSiZ2okViQt8A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX4FCX0rMH2J85
 snw88Com3eV2L6e9m6MARf5OZ3L3+l1YCBI83NQYgq6pjKAsHlnD8mW1yywOxcLlGN2a8l9ysC1
 F2AwxVhVARrPfb/sCXR7oMXtuBpksl4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240093

On Tue, 24 Nov 2026 19:48:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a new dedicated header and move all of the errors definitions and
> mapping helpers into it and out of common.h so that SCMI errors definitions
> alone can be easily included in protocol files without all of the unrelated
> additional stuff contained in common.h
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

