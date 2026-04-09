Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C313A8F7
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775766185; cv=none; b=I0/b78wKxcuI+J+4nWycfiviMRpoGwbC2tbP0Tt2WKPEyeynEwCRo/jpFiRFGMNALJKInlbr+olHJ4UWPwvQWfs/glveL3Kx35C5WB6KM819UFd/YQbhMhC/N/RrPAs8jaFaGcmaU0j9WWijZjL05gIWTga8iwUq3b+i7cK0Vx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775766185; c=relaxed/simple;
	bh=yBJ/NxVaCYwQ0igYQAFkgqv2zp6NSa5HyfEfoQwiFGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHAR5HBgz+64hFB36yeMssWbiUN8bGZMnpyjEuhP4qUW0dT2+sOXPzsBgXcI0hY0K9J2RMo9yk1v/qXqqTLTVJZpqodaolQaXyg5UbCkIHjBjmgjzykt2bzVpZm34Fhloi65cp2n/oIjtu5rsf474L6V6i2dyNViBj6iq+4XAKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVMVhu6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJ8riW3Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVMVhu6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJ8riW3Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdVKA2812268
	for <linux-doc@vger.kernel.org>; Thu, 9 Apr 2026 20:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=; b=SVMVhu6MyGcYZmHE
	B5pO1E/XFaKr6Dz9LBq4FW5XRQOCd4wPVNxtuhjXDYrD71Z1k0AcvzgmbDv0I/Rq
	5eSj04rDG58BVbn57k8aY0URYm0Ni7SS5nDX+WONNvBQJDuUcEg9x+lcWB7YSxbo
	vJKOjlaa+o5daZamgV1LNdush0ZK72uVmvBwWWbeC2XOpC1dpJG/JPOAD5/7FCSO
	ut24fZ8n2TlM27z4+rqedyhAd6KR8FN/0pDaTOod3ZApu1oniXiaYUMS+3K/yHzi
	0he3Hq9q5bzEIDRqv7ezGIJl5p3Splt+2qdc65QBE6Txp2+2wQo3hvzcZaKR4Nex
	sgxjLg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h9dav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 20:23:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso1526485eec.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775766183; x=1776370983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=;
        b=hJ8riW3Q+TI2hmFMhW8fCaGar5qmeAo1w4KIzJ1mBpwzzWIbqOeTh8DCzjsqD+lO+5
         2NyuD7tc3zDqhEpHj56VMj/4VJsNRXs0dSghA7H9nSF5ait8BaxOpPsnwOio6MYQUGX1
         qmCC+zSa+Mx8alkSaMtPNSgO0hpvPYV4GMhNdS0uzSXtEBv7fN1xdDXhpV8k5J4ZvzSl
         l4eo8Poufho9DzVq03O8GIf99ZFFE6PTpVBEgoba8Y1Nk7bcgtdQ/x8dzS6oyN79G22O
         ah3TnASOPpIvzSzxBdd6lEqKzWSGwwS5ydyfJ9gKKtGeJn6leLFAQPDwnsx8lQHH7MlE
         /+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775766183; x=1776370983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=;
        b=AYB87SvKNN+3YjL/Cy/Vp6Hk7fGbFp/cRQU9oo0X77/wxyWaCa7xigmbL2pC3ejfMn
         mLH5+zdLJv9ivV3Q13DJfsHvvof9R0nvRjMGvL2AZRh37UvI01ZcOS87FfqF4puZgq01
         SOr+dAIDIUYPucEor1ucJjfxjm6aEKLvCSelaOusCQVMDegBfQcbnL4nvKdZbi+doaqE
         fWrRBWBbuX4GUhBfJ/O+aO2cj8akjnxm6TuE+k6W/ZZ1fIQejA/gq/eFSbk4Sx5BWmIJ
         ShCsmGn5TuQr7wPFYBi+ykgaqlnNKPYxf+8IKicLMQ12dwNSVsseCXRnvGZI+yNcxVl8
         t6jQ==
X-Gm-Message-State: AOJu0YzvxvCmxkW6dlQaBX0qwEXw1kaY7CGyKwqwGKlhiGEn3PxeHLHY
	3rtR9DMTZlvAXNuPTh/W04CrJCeqQM5HT3XexHs27v9+D1CRy+4Vvgy3a36rfJCrze1KQTmAMPO
	r10NMYQ2wR6cw5LbaIElRpVS2gske+6NhFOayQTlwWHPW4aWZx4OF6NPEiRgy7AI=
X-Gm-Gg: AeBDies5FnQqULGNwKew99mY0pAClYzang/HcPe6JfxJyV5BrilY9RMI4S3XmWPT5/a
	9mP6NLoK8QGNYDwXSs2wFh+ez4Ai6Diegizd8Zj9LqsbWioBhN/79zY2Yjh7HTvhJs4Xc/1EtRA
	7TXrovDAHmpiv2Hee4o6sOx6dhgk0TASadzxW5SfWnTgp1s80E+SymhQrBey6S6O+VY1x7MtdiT
	Qhv8uVyoNAH5fZK6jFbMe1PcMecC+8cfeQQxyJPGms1EfWFyTT0JAtoaRClPwHXyjlvth/9HABv
	3DabPGgwG4mTD0ml6x4pO7d5bw7o/Z7pf/nKa+lhiYCN9JfJgy0E4OBLzVzq+UEszzQDywCMuZv
	0eRH8O8La/URYogXtre8cZH+6TmKrEh/0Zq+lh43GKVaj9RuTdkhlGd2pjkSAgBfIOdcg00On3w
	0=
X-Received: by 2002:a05:7300:bc8a:b0:2c6:cdb3:bd67 with SMTP id 5a478bee46e88-2d5897690bbmr312303eec.22.1775766183122;
        Thu, 09 Apr 2026 13:23:03 -0700 (PDT)
X-Received: by 2002:a05:7300:bc8a:b0:2c6:cdb3:bd67 with SMTP id 5a478bee46e88-2d5897690bbmr312275eec.22.1775766182573;
        Thu, 09 Apr 2026 13:23:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562ac344csm1137899eec.25.2026.04.09.13.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:23:02 -0700 (PDT)
Message-ID: <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:23:00 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d80aa7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3E-APKfXKu7q0kj6aHwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jUZkg3sk3RCoKzlbyJL89gGm5qROvug3
X-Proofpoint-ORIG-GUID: jUZkg3sk3RCoKzlbyJL89gGm5qROvug3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE4NyBTYWx0ZWRfX+Zx8WWgantQw
 I4x+fuVlJuA7SRIMznS2dVesUApPysFbk0OIu6cff2yn2WIE96KkyfeI7rPjAMksLGRC+oz25fR
 kG8NiPZP/IVZy1yapa5r9Xcxxp9iC9kzKQylNalBdBEUhnklLpgldmN5/B8J1MqbjRTorSD6xSZ
 d4/9Z5WXGkEjUUxB+L07kkUhD0oHrjW7zFZm6K0EUK6fG3EZjwCo/PCJ9+tpVyH+QhDlJquh53D
 fkimQefy48xSF5fjWnx9SHp/1y1gQzisC2p1NfAk6RZrgRIobLyoLU8B7ahAs+pjFPpFcuMETja
 pweOVJm6GV/+K12qgWulbroH1RiP6zbDY/ZT4+k+eUiBKpf5JmZ70FZn4/Mh9qmne1p6SZ2OhiP
 FxND9DvYV55hYVckAnrgYSbEnOQht9V+dtZrKbonk1GPi3GL64HrmaaTEswMuHL0dzkrAnenjlP
 Q8L5JagDdaDxaCldb2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090187

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
> channel rather than a QAIC specific channel name. As a result, the sahara

"Sahara"

> driver does not currently bind to such devices and never probes.
> 
> Extend the MHI device ID match table to also match the SAHARA channel
> name. This allows the Sahara protocol driver to bind to devices that
> expose the protocol directly on a standard sahara MHI channel.

"Sahara"

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>   
>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>   	{ .chan = "QAIC_SAHARA", },
> +	{ .chan = "SAHARA"},

This doesn't work and breaks bisect. At this point Sahara will bind to 
QDU100, ath12k, or something else but not know how to drive one of those 
devices.

Just add this when you add QDU100 support, which looks to be patch 5.

>   	{},
>   };
> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>   
>   static struct mhi_driver sahara_mhi_driver = {
>   	.id_table = sahara_mhi_match_table,
> 

