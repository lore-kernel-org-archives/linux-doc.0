Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275646;
	b=aU5kw/mqdHbJr85ERtmpTl/khbnzvJuyF3IhXNGrg8Iidl8/b+pjD2qQyQ1DjyagcuN7
	 hKMSd94G5D7Nay7W1T9ULYcRtEOAgh4aMhzWR60zdX4Z8VIyw5+JhGmZNglDh840QOG5F
	 5UsNqmWQm7sOpo22FV9CIqa89elTYadkA7lmCXV9rjhAwbr4XtSeEq8Q2f6tcINL5zQRw
	 6lcjOl6EvO1j+ANg1PKrR5XIVd0zmkH59wV4X2VUTHMnkQgY66a7OZOBLKHZ6Y2AP/KQc
	 cHlk2qCxYA6lUWBXs8q/WFwFJY1WlZC27ywSA+WHWrllZrNkvG8PvmQZbG2Yi7/FRDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
	b=gp1A8Mt/G0zx7OwcH8f4ENDnxFw0vB8zvmolYimf6XI4IYrq0R0zROcwuhLzBp2BENKe
	 WV283++BlIIFJHuIslb2toOt71Bnq6Fan0uDXvVRXI13hdAIQ4vTAZHraX0qBYgnXXAxa
	 QOym9zzK4bFQ28TesEcxRoznsWodxnoUAUYCSbTm7F//3bg/VTnIpgWAX5AAPPkP+P5cS
	 oeOypPlYfpgVOe0ZzeqRBzYq3I0Mlyd/kodE3SdnymIQ47wvvKKJg4HMWnhfL6NE3AMtK
	 fewpjG/+kGlnEUMovH+IDUM5u3jku3TIuiXUnbEw9B+n1TQscwWr2/AaeoWnwcxQF6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbGuCeg+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2siSvUs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A7A606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 01:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbGuCeg+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2siSvUs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j7Dk1853829
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 01:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=; b=YbGuCeg+OL8arg0D
	FQid+FuWjDgFl5JcYyY1kre2UEvasRPLKD22+ZYrNj51VN71fTosyJvCDHzRyPc3
	HD//TPeMyhbJmdlkcSMVsBMYECh7xaGi9cUBgs1sJHH6bx8IctqcQQ7KkfvC//2c
	KM2vUrPstmF97uhm8q1XP5zphDdR88bDTLjlDkzu/afuccdPWIe0YLyXAU/iT9xn
	gF12hCOt/h6KimzcP3mJonCKASNg0MS7Cfor5JWlap7AU1NF5eDbLE2/xOMt1Rht
	WxFxc2kS+6+RWiV7//ykBqhqoS6rMSzTEYkMxQAxTFRUMdkWSblhZ19brlHfUFqs
	w22a+w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2md8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 01:54:03 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so417328c88.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 17:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794275643; x=1794880443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
        b=Z2siSvUsituLbs/AluxyD3nUh0bgD5uW//0VJ7s83+GBDcDvxvrkukW4YY+aqS+vw1
         sgSdHStTdkfdIrHSHdsVp3oEkNNbiohr6/+DlgmvVr3bq4bQDm97ncFWQ6hLLdmRgemZ
         Yoq0SJGH012wGU08QkZ2+gXeQvzqwpPzk4ZqcQvFfR4zv6gKhfE3oKiqAWqpd5nbDsFe
         5X7PcM+1d5C1NGdm18V9Xb6bZt65bN9s99ZHRgRdUBfaGsuZmfvU3ik0soGN96NoS1ZV
         As+7Pw4KzYz5LjLf9txjg4+R44yyjT7nuu6Xm9VH2hg4NeC/cVhVtfhQgKI7ZTGDVGLT
         udgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275643; x=1794880443;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
        b=vbzo54zNjZLCyMW5EQSe+eMmySgFjAElxkZ9fBEybadH42PZ5Y6DajRpxjMkaRgvgc
         /gB5ReLBoXgx6nfzgv8P3ziwbGJ66pm3EfU8bjjdEe94dYZxT5dZGP/SNM3FqXXgiI0Z
         x8lcnF35ff8YQo972pC9bcUAxmGMxE8DWlvQlAPTyvNM5PsClZr+FtRI6C11qNE7cK/9
         dzd8gFoQC3Dshwv3sX2w3iv7BlNpBbZX41/PLhTwiJjQwcW70DzOrHw6xcqd0mLmZnax
         nqu6/1q7cPdgCFyLDpujtRLqJFb0ZxwUuemHsjAd6QS5Nr/oz+vAQzl/pxeg88s4Ay3B
         g0NQ==
X-Forwarded-Encrypted: i=1; AL+hErF4rtjLRRE529mU4wjWcrc2Qns9p5vGyq/1OMa/JSu0R3Au277Sxpb0XSiii+I2JWACRSMe5fMhOfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z92OOFNVBvGiXJKgqywnh9tzrHBCoN66SBWjLPjhdIMpTgvYicN
	xLF5hE/PPIjcOjmGgubu5QdFZR6TJkNZwHftOsMgL/9qHTsxqHRtTmasdE1Nz9tStTKaBBzkZ6C
	k8k04skLDXfgTUar0HKMhoVZfY8T77U5YH4D06HRDPp4yPnXJ4RyoL+EoygFWTLc=
X-Gm-Gg: AYBFou01mFFcLyVPlOvG7sCuuKclpcTh5oXqgXzISAUxGC+i4OsrgUFSwADPUEh9XaT
	6oPxfArXSGF0kUdZGAZp1+oFER7qRSfHGbPrZKzJKSPFw9Zi5Qr830R3U04YvhrLf25YbOs4prq
	MQHUgglgsO8z9AO4042Dbykhz9UkJydSWCmcVCc51RoFEMhcViZXv5ntakpkp+BOvXmqQ6F8pzW
	RpE6IQYMJsKZ7wfUY62aq4rYJIlNqlrpSehOA4ZqmXArBoHOdKivEB9QlrSzuwz5apy/PAkKCaR
	VDDKHSVFIfkzZI95zDXQr+fPf2RLHwJv1+eZVLovglXgFfIEl7M27g+4TtCb78jnRoogmKrOTu/
	W5jS4XL9m5BdQ8DN4yy9dBky6w14Ze529Zz/Lg8ViTrJSRR5G2SbVZ7W6cgxjHsYn20nPc2YmmP
	YUSNT3Ro8P9B3bxh4/dbOJbqboaA==
X-Received: by 2002:a05:7022:2521:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3b5fccc3emr2282457c88.12.1794275642818;
        Mon, 09 Nov 2026 17:54:02 -0800 (PST)
X-Received: by 2002:a05:7022:2521:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3b5fccc3emr2282413c88.12.1794275642187;
        Mon, 09 Nov 2026 17:54:02 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm3080274c88.4.2026.11.09.17.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:54:01 -0800 (PST)
Date: Mon, 9 Nov 2026 17:53:53 -0800
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
Subject: Re: [PATCH v15 11/35] firmware: arm_scmi: Add Telemetry groups
 initialization
Message-ID: <20261109175353.000008c0@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-12-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-12-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af2793b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=0-nDijDy15vjLcikf0YA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNyBTYWx0ZWRfX4R7SRopTd/ij
 RVnKuOGBs+yjnxbn7dWA3FeCa1V3iGnukR0o184xy+z0W+N93PCFjsBIdcVn+MvIIRw0fjDmyb8
 uCyeNebhc7mgovGoMrD2Y9EhAu+YNul2hH0EXl6xkwLuyRCep2MQlblDUaJ3q2mTcgkZ4OJ1Zv8
 bwuLBtyxb0o3FnxBPmNaF1Z/cKgyygHVA+3TYFlogjaJaPFrgVk0/rJEYF7LwVQqOG4T+nAtJ+V
 yxtpcF7O4+Hc2WIXDsd8rtKIxEvSOqlQokTvptU48OAF+YlQmtheGfNwgTLd6ZSZVWbmccdDZbt
 R0sCgSp7FxLEQxSoAvFwPwGpGniB2RjxDxTkjTf1SnwSJOoLPGCoUewcxQjOBQ+ZJWi6soegdMj
 /VuFd30uJcU1Z4IwW3+bZ5p+IrULZZZbTW1h8aj4EAYpuGKa6Z1S8FNEoVitj1KJWdcV9jCOyi4
 Q5nMQBkBJhkmO8yRMgA==
X-Proofpoint-GUID: 7Sy_jq3uVP5UXv2oC6OIXQBeIs1Rjgec
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNyBTYWx0ZWRfX6b92pn5Zs8sn
 KIMw1sirbWzO/QYPa4wRty6H28E8j9SyMM+WD01a0W2AqBaC7zatszft5r9wD3MHpEU1hE4CBMf
 NdoMY5eX/WvZgHGnRYsKszG0UJnMJqU=
X-Proofpoint-ORIG-GUID: 7Sy_jq3uVP5UXv2oC6OIXQBeIs1Rjgec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100007

On Mon,  9 Nov 2026 09:11:57 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allocate and initialize Telemetry Groups from base DataEvent data.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> +static int
> +scmi_telemetry_de_groups_init(struct telemetry_info *ti)

one line maybe?  I guess follow local style.

> +{
> +	struct scmi_telemetry_res_info *rinfo;


> @@ -701,6 +833,9 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
>  	kfree(rinfo->des);
>  	kfree(rinfo->dei_store);
>  
> +	kfree(rinfo->grps);
> +	kfree(rinfo->grps_store);

Same as earlier about reverse order being most consistent way to do
release of stuff.

> +
>  	kfree(rinfo);
>  
>  	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
> @@ -722,10 +857,25 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
>  	xa_destroy(&ti->xa_des);
>  }

> +
>  static void scmi_telemetry_instance_cleanup(void *arg)
>  {
>  	struct telemetry_info *ti = arg;
>  
> +	scmi_telemetry_groups_free(ti->rinfo);
>  	scmi_telemetry_tdes_cleanup(ti);
>  	scmi_telemetry_resources_free(ti);
>  }


