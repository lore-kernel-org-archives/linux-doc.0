Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350085;
	b=mB6fY7TVNL3FUxS+73JbTwa8quh6i/71ubFQP2uRVXPOl0eoltFz3+1Oc1T7Lrl1IUlt
	 jEGUTvp6qCEDUVHrNiCQZSsQ1sEQr0GFe80DUBF294l1PZC3kGyaLNJ3KTE9BMfsNSnFQ
	 KRW1t5FFqEgqyNq3Cb331loT3y0VKmNGOQztc7Wx7wkJujH4LdwMFFa17GjWafXuqTIuY
	 HFEqz2PdPKlAV6nYrQWA9S3tAkHbDgEfsjFtknsX5kL/3jyy4sLgwcX7Hd7gMKa7qhe8T
	 xR/qMwbTvUncZ//vVxkWDduPR50zwOod69jlKcKAVyE2A8InOqQjYuvGP+lixnLJA1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
	b=G6NLqxv+f1Jyw+/1SiDgYwhWw0t9hxFpUzesmlXQ4hu8zouVykhDaXlcNpHHmqtQmzhm
	 oSmrld0sLyWf/824lYPf5VRDodxx8nwYA8+ezMxFyql/TH9+e2bMvXj6vrLvpNtgtMfXQ
	 geuxAFadLEs6JploqzXNqqH3lMxKWELiFa2DiQedYSp0i6pmAZhfhvRHYt/p4iVvPfH3Y
	 u6mbabE/yf3K/XmLcsu5133tOnbVVeqOTfTwQ9K9UQrY5ApB/Jrh5mKSS7WVkyzbrt81q
	 vr/8Dc2l4Ewn1fNU30i2rCb9ija5reuf6Y/g4PzqnUvgZftpaKOH0QSclhkdcTrTdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAZ4n8Nf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPAF4IC5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1AE606A321
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB1AE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAZ4n8Nf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPAF4IC5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKUJI3714898
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=; b=DAZ4n8NfveJRN+DB
	Z6DoHMAXwsKCwN+7FUx7rhjwPSFRNim82pOhUdcoLn7/CnwHW/ITl3U7Ee8i/Mwk
	e9wk7mWcjGShg0lOfnvU35X0c9Vl9imrcTkmwZ8BHmLXK2Zdkmzn0rNnnUMn5fGB
	l8QV59zgmOgU9IQbJsTfTBvIDdCO1aUWxUuVpeXY5vIIooYlKxJXrUuMIjRzeO4e
	YVG/XR0BEo2w8/AdnVdHznhEBbdv1JNdXjNxjEOOV8rRzuRV7VPgPPFK85ddBF+R
	byTC/t4ZBoxSqgf0drJaTfjdtqprj+qaJEYs2XrCVJFxcJuiJ04rFBmljglIHI0t
	biJ5Dw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4b6t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 22:34:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4115389eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 14:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794350083; x=1794954883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
        b=PPAF4IC5WFWPoax6gEDSaw0qDTp7ldi6HPYFAwsFYt6mmwiSqIs8jLELd7dYLgIxpY
         FC38XwYmIHVjR95UQJ4zDpbBYRthtA/sDQ9CMfpNeFUQ6qt28mejuxfZTIEGUD2DaMEw
         JlE83AeDFGZZFLXXbV8xzJPNC7XtWa/kN3UR5e3LmTImyL6Q2+fUTc2RqL3jDdScREpj
         i3BBw4cIs5BcTmMnr+9w7lkRND7pjjLjpONDz6RVIEcWo+sI7yN8Es1JxMTkSA8dfKZE
         p5H/kfmiBh5R+CWl2Ora1kjIz0uJMfEQvASSrp+AMZQX0OqyEvVXhz2LrSkLcddzobul
         AKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350083; x=1794954883;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
        b=pYy7X4MUQJKEZnrZA2jKiYPut8c5tMX2MeWQmfOR8lWdFSDVXHMFWreMad7AWAXNUj
         +4peqby14+c+dy6lCnR1bl7OQmxRjme6WBJxcDA01pgtxrsGUK0EfsTz11SUQPBGCRYF
         cgMv247iThEjsD6Ku61ahhsyzwqB6Lbk3nA05qJlaOSGiwpMhCUJ64LKjIrNimnjo3OI
         K8omsS99Ieo2g0kwk8S5K5U2/Ptk/Bs/qKlDB5zrR/21l5jklSkRpVZNx7fxd2hIjWkf
         vnJ96bdNzwpD8UdLlx+wctR27Wha/rmRDZKCXgKAnczGxdGZEPw9TIRTsQnuvJqA9Kyg
         jdqw==
X-Forwarded-Encrypted: i=1; AL+hErGDB0Gx0bomFPDOG4Ufrz/7kTpchvunDZ7EI2Fcqmxl2qpWpaqzUReeYkKX6Lm6jzi5xTTz8xW5r08=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nzn4uF+yrKgcLH/xYpsDqWpmVQswjPcuuzG5U8uEwYuHdoi9O
	lMkctInMvtPBukbbbx4ypeb2vy5apL019eQNJD4Z84/pAUv2Tk6uU51DWCffkHt9fdXc6i4jL7U
	aaA3XThG11mXQ5RCT2k7/CGbhN5C0GP/D+6VIzNxSTSmHhloIzR4Wh02Lm8bGbRI=
X-Gm-Gg: AYBFou3CcUt4WX+5mZWNuaEh4DprTBsJv1pbwQkd2GmsL4Wg9V5LZWjNbmFXVggepQH
	rrZSS/jsyL8jThqW/TPOssR1285N/yVuCc1+0D4nOabQr8qCJGyN1P/lMTbPVXDRhTZ/wl2GiM0
	nkbeY2d8kEyBeIlHEwBG5bZ2A8Ce/GEQrIaDgTjHFqS1vX5IHBQ769CoPj8MP+HTN7fiYIFxmqy
	QfAAvUHt9JXNciFBVVmLqtlP2IBPPhdgAOrHrMDFjCj2HXrVyVQ/6b0kc5sfc/Swip72hky1bYc
	C901PjsHP1IDhdPPdgd6BWFR/TZEcLSaB7ikYuxGypX4LZSsbERuCKALe7/TuOUfMH2Bb5dorjg
	92Cdzbi+8r7LUHShUMvEzMhymb/OArKy3d+beUI6Ls9IdgpbtQDyBmknm1D40M7gx8EmNamcjGp
	d9tRmaEIlMAKKDqiN3V7N4rM5PmpI=
X-Received: by 2002:a05:7300:509:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-376854b98afmr1391393eec.12.1794350083189;
        Tue, 10 Nov 2026 14:34:43 -0800 (PST)
X-Received: by 2002:a05:7300:509:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-376854b98afmr1391305eec.12.1794350082385;
        Tue, 10 Nov 2026 14:34:42 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm10389393eec.27.2026.11.10.14.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:34:42 -0800 (PST)
Date: Tue, 10 Nov 2026 14:33:56 -0800
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
Subject: Re: [PATCH v15 22/35] firmware: arm-scmi: Add Telemetry generic
 event support
Message-ID: <20261110143356.0000451a@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-23-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-23-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfX0PTeQp2tw1hl
 XLYlJPsWGbp0MpZdNZ2CFa7M4jwF0h7h5OBhh6oEC5RiPwdonBKxvmPecLAhnpE7njBekHR/FQ0
 EJvZrJ3owujMrb8pposTA125ydbJ4icMZWFmU6j8S1vmfEmjlBwq7J9BgBgBpjAzhssQZ2B0zPD
 lGK2vkDucBF5btONa2541W5aXor1ADI0R0bB6uW6y+IRAK++tlTxXVEhSJahtb/dToTR76scMW5
 0r6w6X0ORG2zhojuBbC9+4GwnKG0Y+VoeUZeRQf0uROpDqzItSsx4yDRnlMYAgbaFLzxBpsJ7C8
 SfDabTSf6mt+l5/2xGSDD+KiUbxGhnvUJ3XrN9u5jn1j7O21J6xUiA7GT9il2GAFgWpJxxl22lO
 avSyc4OPhztWMc/wCzQUGOWQNHC26IBylGhQajODbtD19caJMH+wEKycymTN5O3Pcb37hD9zRxq
 Ldwx63ftgyXS9oYZsHA==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af39c04 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=phf3XAa3S0evUxb1xUUA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfXw+XlqnNQCDqJ
 RdS2Bez7NY3IL1c9kJcPaxa2WerOLIWKmpWl1wbGCQ9Ciz1XPPuNaUNZ5eYGNE5QAUFq7N87k3N
 xFT2RrILZS8t49018ZiE3Ita+/P0xoU=
X-Proofpoint-GUID: 3DXICTIzIoJs7QuabpJlerzfm7wcbXl8
X-Proofpoint-ORIG-GUID: 3DXICTIzIoJs7QuabpJlerzfm7wcbXl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100090

On Mon,  9 Nov 2026 09:12:08 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to allow SCMI driver users to subscribe/unsubscribe to specific
> Telemetry  abstract (non protocol) events.

Bonus space before abstract.

> 
> This enables SCMI drivers to subscribe to available events by registering
> an eventfd context that the core SCMI stack will use as a signalling
> mechanisms. Still no real subscribable events introduced at this point.

Adding a fake event isn't that helpful. Just combine with the next patch.




