Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794457822;
	b=UPeBQlR4hoJC03h2HHfGeyl+4squ/AbKSx+XExPLTcHIKWift3jZ0Re2/q4qSrKnVwTZ
	 PtZgLSg5w/iDbpKkN2YeJVYbMAQV76FuerUo5nfpB+RV0gP71YYiAFA2nZAZePUbswO/3
	 nT84uER6GAV8t/O+gy6GRGaIRvlpd7VQucVkxTjeMBo8IcT5Fuh82Qy6jK3FtaAAbQXby
	 MdEXbyffERqT4jeg/x9QS9G+i7OJphhlHxOK19rZCbgIZBlkU37wmNftk372yC6lNeUDE
	 4JE3OgtEt/PTow/TA2moj8BUe+RRlgMEHpWrBi7b16hHAjK7R+WP67PBe+MCgPsXamA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
	b=KmnMaL9Iegqz6IB2kXCcaalKeoTY+Kn0FbAluiXwT0Ay27nQFV8iV3GnMuSJgexLuTpu
	 8b5oSEymJFf/+jaSE6+XiSpo9oPhVuVCWweH80kEgwGIPz5NGBIHh9wcKe2yDyNckc1SV
	 e4vw+O5V4l/VXAb6QWNvEj4jCV924m7R3YyXkdvm/yYVNvW45C1S7457NtjfHmvQA8NoP
	 3ihjLNeKA2i8akpYn90olhXQIu20+skE0TjAafz2/UFp5LjTUFVsuI0cFYdelro7sr3ID
	 Qm75eHtI2nQ0hRyRhFYGQMGJ/OG2X6VzbQqHTdU6mnhRV560Vj5zCKq5dH/VKbsbPLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pswg6HdD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgtBl6UU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FA7606A324
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FA7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pswg6HdD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgtBl6UU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zcfl597383
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=; b=pswg6HdD47FUDh52
	oBdstQdQmPzqZoDfnsLVUQkhDmuqumK9WAGLA0qD+js7fngSxDth9PNvL6KHjjzt
	sR6ppFEGfdpTKsX4bFQx2FWaNjaJ6aFty6JJRXbR48b4uds93geUlJVqadIXh52b
	mCmoM2BSvmeVsTtJxPIBS0KXz5oyWR3hSJ44pv4dFiA3gw3eFeN/s1zz0mSXLtXQ
	Lvmbh+H5CQIG+2zvxPF4ikFXpfYekR7UBzNDMeCuep+PBTMPcqiof7ganY4OIWpU
	n30ajMI8Ca7UgJxOdRpxlQalowv0ABEgPYDjZ00tv+nZG90cDYUwqcZ4dpybgmiQ
	rUEgxQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1530eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:30:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so7545588eec.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794457819; x=1795062619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
        b=XgtBl6UUE7fDhQp+6BhX9mz7rko1w0JN4FPddIWpj1WHAc6FRETmz3E3VX6ygIe9/2
         xsQ9p/rqNVtWZMxQLdu0LoT2Z68piTE4fdvhY4ODDS79hcscClEhoJgDSbI/V0Zizkod
         rqXQt1OFBxyMkWGuFer5B710euqDm49CfnxAGtlMg+HZLCvPbaMejFBm72V7VX41EZry
         Y3eAtuzNfMsMZal6b6RYw3Ern1lbRXfbPjtH849Gsa1ToPWz1RY3cf0+2jgBjsllaJXE
         RB7ogCpH3r365cEQKY9D+jEZl9PQC9HG/eopOVWFiVM1PQTB7lMFNEIB56Zzcwo6Xvz9
         GwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794457819; x=1795062619;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
        b=sshmrTPfGr4fiS32T/6nFoLNrKgTYoStHqOaTvCCuQbsO3IC2BAiAoWJtZcrM35dlr
         OIdiMWWj5qNTnmTG6oIVX0QqGHeJHrdqOOFtpWOvFEp9D5WGSnrPZVB2+dz4P69LN8uK
         K/bUXF+0RelhZ8ioNIH95+1ktvtkB6qKVhd+eVaib5X3UuQAA+jBW2nQUX22SqxeKBat
         HcWpa6a23enDm9idRAenX9MJcCrZRmmAoPthityIDde/WnUU2v3nOIqfM9iANB10QHOn
         LTJEO/L9LIUm92w0HrZp8yRq2qYtNWhXDdm2pOs7dMA9h8xKqzR5pMRoYtSQTRCMtp/a
         sYwQ==
X-Forwarded-Encrypted: i=1; AL+hErG+DVcg5VyohHEnz99poDnZ6yMRyuqmlqk/ggWayBnqS1IHMc/YFeHKmb6huH1+9MdJpSFu+APhovg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+niVC6Y+MfG0YtkVEsEeT0owtwn+FF7UMHwuE04ACFGIOUQBrP
	X2lfyV4SF0GRWK9Z6myAKMoH+vxHxhegEvNBAjCQi81k1Q9h11eJT0Wb7yKTGZS6SCH0eS3WwoZ
	AD93ZD3EJ7e5KjtNmp7PvEW7OQhP6+w4Z+GHj5sSwKEVhUxmcMRmD06m03Qc+xTg=
X-Gm-Gg: AYBFou0PrEyuwgE3b4MNjT6YquT1HA6L6DaRb0HGqch2IVTtDCN6A8zSHrp825MevCA
	rhiFYNgSvLPLJwHYc22i/57puqFalDEMB7BWSNFMOAc+6cuJ0NhtwPRZARWNuQSCIXz7br5uJ8I
	RxsS+YVW8O7336vuKGo0HRtPgrXoaFhHHpM7B4MF/6clc8WjaDNHgPfSgxaAoyzY5VmBQ7qO1U1
	zSptWpMuAEf6zJdQvUVsT1hgCI77WcL/IcKUQ3ikKXh9rgbpKbzgNKhQr5/FB68CHLTxRffzEht
	ELqkxxzHvZNyc8p3xJca/BKARL+unAhCzGh/tndqyiG79hC2kTzs79+Yurp4hC2HOkz7Bopy6+u
	SkHIqJ3LVpE/YkIquURSG+HU7hxAvhHcgtW73Z5oSaLsifCF+eL1xPLQgnI4Qeh16nbEeHti8gC
	rIr5MX6mixG06zYUwbJLgRoY44dJQ=
X-Received: by 2002:a05:7022:7f01:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b3c030f6e1mr4080456c88.23.1794457819087;
        Wed, 11 Nov 2026 20:30:19 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b3c030f6e1mr4080408c88.23.1794457818345;
        Wed, 11 Nov 2026 20:30:18 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm23163630c88.3.2026.11.11.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:30:18 -0800 (PST)
Date: Wed, 11 Nov 2026 20:30:03 -0800
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
Subject: Re: [PATCH v15 18/35] firmware: arm_scmi: Add Telemetry DataEvent
 read capabilities
Message-ID: <20261111203003.00007e46@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-19-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-19-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxNyBTYWx0ZWRfX44GtmjEsHluK
 XxT8wWSX9EBFxwhahst8BdZEEKpdNEp7eu1a1kokUJZzSjzts1JTiLGWYNk28bkspnnT411lhX1
 e6L0hkGpge2IitfUc7t4D3GVs32+8LM=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af540dc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=bWY2Rz8DxC4JnhDb7tQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Oa-DgDA5z9wzVM6II-HMGseGloZLOlqv
X-Proofpoint-ORIG-GUID: Oa-DgDA5z9wzVM6II-HMGseGloZLOlqv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxNyBTYWx0ZWRfX7rNmlsKaUDKI
 MJNsq9ryk9zXo1SpbbjWmEzgOZsqLKrj4A/o3uPYbTCsC4YHDJs532DBZdsZtY8m1LyOu+6yDgJ
 /KsKIpo2ZC9eAKy370VlCz6ftKcKhNIIDm1O0gcUHsl2p5i6lqx31W51ehj/X4SXjbv8X1sac6C
 qB8jqY0HDRBEN2iX4+OmyEMzulLCQaX6TKmWFdjxqPAiAA+Z4cUQwhbv+0s6JMnB1n2tf+mZnOk
 7pGwtaMfCCwcVfo4L9eq6XDSxNVlXinVfVH06Osvb8Aw5g8i09dP/aCqhLjgYgZIIhKC/W0dUoi
 lWPT8J8v170kl5R7o9dTSdMhqv3ChgDcpd82VPlNTjqu/RR1CkdKOW9l84PoBJgW1aDbLzswQVq
 vmka2WCHfA3RUCnQ33T0NKUyXSVq57B5ayQBxc2ltK+nyMdXCDYO7pkapJhzTprUcLqtPlFot6v
 j+PGuPA/Z4T7rzuGfHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120017

On Mon,  9 Nov 2026 09:12:04 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for Telemetry operations needed to read DataEvent values and
> timestamps as single entities or all together in a single bulk buffer.
> The returned values are effectiely retrieved from the platform only
> when strictly needed, i.e. when no fresh recent cached value was already
> available.
> The DataEvent values are fetched transparently from the platform origins
> using the proper synchronization and consistency primitives, directly from
> the SHMTIs areas or the FastChannels memory depending on the configuration.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>


> +static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
> +					 int grp_id, unsigned int *num_samples,
> +					 struct scmi_telemetry_de_sample *samples)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_config_set *msg;
> +	struct scmi_xfer *t;
> +	bool is_group;
> +	u32 control;
> +	int ret;
> +
> +	if (!ti->info.enabled || !num_samples || !samples ||
> +	    !ti->info.single_read_support)

Trivial but I think if it's not supported we should return appropriate error
to indicate that rather than -EINVAL.

> +		return -EINVAL;
> +
