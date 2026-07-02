Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793E3537FB;
	Thu,  2 Jul 2026 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976635; cv=none; b=WhV/LK416/xQ4VePgZU/c2hADuXFmFiW0KkM7miZjnSJS6iAXiMfOpBgetTk+4fkSntu+7e4CAjEb8wfULpA+MToCcrFPkmfkg3tzsXS85QaeUb8mHf5lI9iFlXArg6gWagjroNq5874fGg+a5duGN0bXeWcoWPTXPirqbRn/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976635; c=relaxed/simple;
	bh=Uy/QlGHQnR9SpLSXV9vl3VGew5qXfgwNdbBLLV4evEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=senrVj3c22xXPPqRv95qXYZJPnq7JSNgpmxhEo7xZ426n8cLMMdA2d/gWtt7WmfQeRvnOe+SuMwgjmDAJ38R8Aux96OjxSEcihm0CHi2QFpUDZpwvQbr7UJKFW/e9x+JhZdemCUiCN+ce+8TBJZRO7BG9fJdlFb15V24MZlEma0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sQnfyMb1; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sQnfyMb1"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KS1e2509568;
	Thu, 2 Jul 2026 07:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NMxqwD
	fbOPMmZa/hS/UrnheKWDE4bVv7G7Mv6hB/TIU=; b=sQnfyMb1lVR4/Va9ZnEv1a
	ovnfveGN0cCwpECb65hif7zqbgVxyrTSD9SorxuOdipUULJx8t1Xo4pzMlTChtKM
	IYhl45uOvSq+vXBs5E2qLlyFSdlNGq6dSVuLyuExHQeGX5sas0aoKhVKQ0mnpSL1
	M2rDG+6seh8K+ELHqiNS9QGpNKw6xMyXFU3ojQnNiaHXIWcApn+3ZFh407koXUHH
	xUuHrGVfb3+eNcOgRTOr9FXWOSUYILy4fHauQdzkpyGDH7R485e0OSYPUfIndC/o
	lMXiM+Nghnnrk6lqJ3td4SrlV/c3tlR4e//yI64KomoNNUZsvMvtBm2AQ94rf4OQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe8q6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:16:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66274gtM012172;
	Thu, 2 Jul 2026 07:16:49 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2s7wb0s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:16:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6627Gi8n20119846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2026 07:16:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB8B42004B;
	Thu,  2 Jul 2026 07:16:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CA7D20043;
	Thu,  2 Jul 2026 07:16:38 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jul 2026 07:16:37 +0000 (GMT)
Message-ID: <18153767-1ad8-4495-98fc-9e1fec9cb027@linux.ibm.com>
Date: Thu, 2 Jul 2026 12:46:37 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/23] virt/steal_monitor: Add control knobs for
 handling steal values
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        huschle@linux.ibm.com
Cc: tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
        frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
        christian.loehle@arm.com, tj@kernel.org, tommaso.cucinotta@gmail.com,
        maz@kernel.org, rafael@kernel.org, rdunlap@infradead.org,
        kernellwp@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-16-sshegde@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260701141654.500125-16-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: AxUWb-oniC6Inzrb_OSxbtLXw2k9dWbb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2OCBTYWx0ZWRfX3KO0DVXHMl5S
 bcMFUIMMJJbrCTxo0lgI+/+aALXsxqbiIJRGfiWZ2qwMtL277Fmcy6ui7qtcFpzzYri3Ynr712h
 WNUGT/McxiPurDX3xaB9gx0xANBN3Lg=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a461062 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=zBal_0PTNrgQzhutHD8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2OCBTYWx0ZWRfXzvjZrlvMfUr5
 cOID85F0p/mKTyx4dUQwU0sLVd4baWXkhMeHXzqr9Sm6pOoqtcpI0jnI4uy5beSYCPK2Afm43+a
 tO5DLde8zaSBw8Ns5vWiP7ZpyPR3sJJcmHtULAOqdtsmXKSjxkoOFFUr1LWAWECyo12QQdPefJJ
 0DhVLu0IJQDrBJEuP1u8TVa7q1p15NMHZV4QsoDUf6yka8NgZZ8X8XT+4x9SG2BKowgYqpTqnaM
 4ST9WRl3aWWOTrnXd5ORS6sDGr/PSLLocapMuoq7uP7iuQ0k+X2hX3qEdolz85ttKXcYIg5ig/4
 XmtiXvU9d6WJS1nNFjQqGb0vE+3r7sLQtQ688OGvZBjnLlukZ0t99kwjty/GOR0OKmJ8gP9tnwN
 uCOTgJCmdOEMqhrSEtUHUsF+o482irR2WKN7LY4HEfQTzH/ZOk/2reUGAMzwBSEjib0D/sBPq57
 ydwPKuJy4XQeIpzMe1A==
X-Proofpoint-ORIG-GUID: GkHJ9IT811c75ThsZFBBy6Y6VfiuiZuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020068



On 7/1/26 7:46 PM, Shrikanth Hegde wrote:
> These are the knobs to control the steal_monitor.
> 
> interval_ms:
> How often steal monitor checks for steal time.
> (Default: 1000 i.e 1 second)
> 
> This controls how fast steal monitor driver reacts to changes to
> the contention of physical CPUs. Since it does fair amount of
> work, setting too low will have overheads. If set to 0, on next
> work it will be set to default.

I will move to module_param_cb instead to do this.
This will address the WARN_ON issue as reported by sashiko.

> 
> low_threshold:
> lower threshold value in percentage * 100.
> (Default: 200, i.e 2% steal is considered as low threshold)
> 
> This determines what values should be considered as nil/no steal values.
> When steal monitor see steal time is below or equal to this value, it
> will increase the preferred CPUs by 1 core. Having value as zero
> might cause too much oscillations.
> 
> high_threshold:
> higher threshold value in percentage * 100
> (Default: 500, i.e 5% steal is considered as high threshold)
> 
> This determines what values should be considered as high steal values.
> When steal monitor sees steal time is higher than this value, it will
> reduce the preferred CPUs by 1 core.
> 

module_param_cb for these also will impose.

1. low cannot be greater than high
2. high cannot be lower than low.
3. high cannot be greater than 9999 (i.e 100% steal time)


> Also available at: Documentation/driver-api/steal-monitor.rst
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   drivers/virt/steal_monitor/sm_core.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> index 92d5a0e3d8bf..1ba638224abb 100644
> --- a/drivers/virt/steal_monitor/sm_core.c
> +++ b/drivers/virt/steal_monitor/sm_core.c
> @@ -14,7 +14,23 @@
>   
>   #include "sm_core.h"
>   
> -struct steal_monitor sm_core_ctx;
> +struct steal_monitor sm_core_ctx = {
> +	.interval_ms = 1000,	/* 1 second */
> +	.high_threshold = 500,	/* 5% */
> +	.low_threshold = 200,	/* 2% */
> +};
> +
> +module_param_named(interval_ms, sm_core_ctx.interval_ms, uint, 0644);
> +MODULE_PARM_DESC(interval_ms,
> +		 "Sampling frequency for steal values in milliseconds (default: 1000)");
> +
> +module_param_named(high_threshold, sm_core_ctx.high_threshold, uint, 0644);
> +MODULE_PARM_DESC(high_threshold,
> +		 "High steal threshold (default: 500 i.e 5%)");
> +
> +module_param_named(low_threshold, sm_core_ctx.low_threshold, uint, 0644);
> +MODULE_PARM_DESC(low_threshold,
> +		 "Low steal threshold (default: 200 i.e 2%)");
>   
>   static int __init steal_monitor_init(void)
>   {

