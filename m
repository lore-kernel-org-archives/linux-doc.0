Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB520291C10;
	Fri, 10 Jul 2026 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783657690; cv=none; b=qeX4vGai9tTzLxUl7AgWNDpHVZjtgZKrMOET2llwDe18fFE93Fhc+ai7dN4wLEtWP9yDLoP4dpozEZIxRmFbpJilKhRrEei0fxo18gN7F1jH4ljuF734h5bEkhgJGpaSzPbKRk5ufTv+l7LLoCPAozqRByQe/Qu3rlGKDLqhzF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783657690; c=relaxed/simple;
	bh=/saN+go42/S1NHyt594LmwkZ8G5RKJSVfH/UKc/LjxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LO5p4qxUIFZrsIuhiUa1hN8MvFmrYZ0V+7WWjrDuJMFNSlJmFfNkiMLTvkEz2HDteK3b7CSktKuMf9aV4aj1UoN2dyit78YFcyEmtk4aIQPEvGBVgp7TSXmyoay657shRGSit2B1Lz358i0h8Rcr0xrIF0jCxmR9/QEEH5Hx+0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IK1E4AO5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IK1E4AO5"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nCsT3492618;
	Fri, 10 Jul 2026 04:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fIRhO0
	ADNyDLwQ/IZRvklRM1Po9CZOdkg0iq6pCb+Ng=; b=IK1E4AO5rS0j9MlW7HKEvK
	/eAr8LrXcn6NjQF/K3x3qcawDCFFysSSep8iQmAr+mzj7Q/t4plApMbYIOr7Kv0Z
	ByLBveFwRh/dRIwmA4tidwEcXhUVAWCLJ03FRVXfSLvErtORvGMDxlUZt9Aa12EA
	CVIMUE6ojHEqznKjGR9mG8cBVr+d6JE0MnBm6BKUe2VmeKEy/opWs3rxBrIHoD9g
	POmOwSIj0MnUpNUHKFioVOLNnovo4W8HcAIl9zUx5BvvqNerS4wQCJCKjQXPqAFE
	6kVm55KWWTF8rMAoDVsyHaOVRQ7OTAHqx3ytQycjoejr7+cpBOZJ5j9Qc4Ybxx5w
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6rke57ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 04:27:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66A4JdwK023387;
	Fri, 10 Jul 2026 04:27:49 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvwghe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 04:27:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66A4RjWK42860906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 04:27:45 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 917A820043;
	Fri, 10 Jul 2026 04:27:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B06620040;
	Fri, 10 Jul 2026 04:27:38 +0000 (GMT)
Received: from [9.124.216.30] (unknown [9.124.216.30])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jul 2026 04:27:37 +0000 (GMT)
Message-ID: <82e9b5e5-e19c-424a-933b-c6e351d44605@linux.ibm.com>
Date: Fri, 10 Jul 2026 09:57:37 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/12] virt/steal_monitor: Add control knobs for
 handling steal values
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net
Cc: tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-10-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260709215648.1246821-10-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a5074c7 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=F3ZZLrnZV5QeUzuNjWUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAzNiBTYWx0ZWRfX9+cwuSyZRzgN
 ShYRY+QN0k1xjtIGeLzInzNAq4RBLUCqY7QNFSsOanUc2TJPOHsHlcl+E0ZrWnoQRsv+Ih3zYGo
 2+DLyeHrzFoacyi/fCOGvwea/I+CpBU6XuYVrW0mS7hM0yzjhuhkhcaOEBJrNVyugWCIiNPWPSI
 P0RWs9wy0hXw0NNKsUWlBdlNhfQsEC5RJKhCpseaVa9Y7Fht9vdIUnq5IcK6Vhixa66nr8q3Lwe
 sjefvarOLAokRJVFwtTUZxGPDcDJecop++d9TY9cyyxj1uUb5vGVierqrQegdqZbo5oJqYhYByW
 0DV2aIy1qfT5nd/5fL7P+PsUrTt4a/FWTpSUKRPnCPldwNjc8LyX5slc47xcDYZkd4aGZjDqATP
 5RDkFmIsRj0HeNC/SG3rp88Y9szHDztFbGmlPQooG9+6Dwbhef9IY/XUSqOiAIT3hmBXSG9al8b
 czUSPV8Uuzhg1YrM94g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAzNiBTYWx0ZWRfX9zWMYSnRZDx7
 mo20SyJuRtEu3BCDUoj4YReHGCrVq1tmaFHSFMaAffKxD68xJxW/wZWsv1h0MsgqX4c7iQg+Fqx
 EeEh7NS0Bvae7VtvaM7bYDuKd6KdLPs=
X-Proofpoint-GUID: ey5xN1VxSTOKRb2BcSy3XgbrXGV77oyQ
X-Proofpoint-ORIG-GUID: LoWZTcvQCznptVpLblZBroAFALXOjO8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100036



On 7/10/26 3:26 AM, Shrikanth Hegde wrote:
> These are the knobs to control the steal_monitor.
> 
> interval_ms:
> How often steal monitor checks for steal time.
> (Default: 1000 i.e 1 second)
> This controls how fast steal monitor driver reacts to changes to
> the contention of physical CPUs. Since it does a fair amount of
> work, setting too low will have overheads. Setting it too high
> might render the feature ineffective.
> Can be set between 10 to 100000. i.e. 10ms to 100seconds.
> 
> low_threshold:
> lower threshold value in percentage * 100.
> (Default: 200, i.e 2% steal is considered as low threshold)
> This determines what values should be considered as nil/no steal values.
> When steal monitor see steal time is below or equal to this value, it
> will increase the preferred CPUs by 1 core. Having value as zero
> might cause oscillations
> 
> high_threshold:
> higher threshold value in percentage * 100
> (Default: 500, i.e 5% steal is considered as high threshold)
> This determines what values should be considered as high steal values.
> When steal monitor sees steal time is higher than this value, it will
> reduce the preferred CPUs by 1 core.
> 
> module_param_cb methods are used to do the validation checks.
> This helps to ensure one configures sane values.
> Parameters values can't be changed at runtime. One has to unload
> the module and change it.
> 
> Also available at: Documentation/driver-api/steal-monitor.rst
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v6->v7:
> - Add module_param_cb to do parameter checks.
> - Make parameters read only after module load.
> 
> 
>   drivers/virt/steal_monitor/sm_core.c | 92 +++++++++++++++++++++++++++-
>   1 file changed, 91 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> index 180db424846c..4a03c14337be 100644
> --- a/drivers/virt/steal_monitor/sm_core.c
> +++ b/drivers/virt/steal_monitor/sm_core.c
> @@ -14,7 +14,97 @@
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
> +static int param_set_interval_ms(const char *val, const struct kernel_param *kp)
> +{
> +	unsigned int interval;
> +	int ret;
> +
> +	ret = kstrtouint(val, 0, &interval);
> +	if (ret)
> +		return ret;
> +
> +	if (interval < 10 || interval > 100000) {
> +		pr_err("steal_monitor: interval_ms must be between 10 and 100000\n");
> +		return -EINVAL;
> +	}
> +
> +	return param_set_uint(val, kp);
> +}
> +
> +static const struct kernel_param_ops interval_ms_ops = {
> +	.set = param_set_interval_ms,
> +	.get = param_get_uint,
> +};
> +
> +module_param_cb(interval_ms, &interval_ms_ops, &sm_core_ctx.interval_ms, 0444);
> +MODULE_PARM_DESC(interval_ms,
> +		 "Sampling frequency in milliseconds. default: 1000");
> +
> +static int param_set_high_threshold(const char *val, const struct kernel_param *kp)
> +{
> +	unsigned int threshold;
> +	int ret;
> +
> +	ret = kstrtouint(val, 0, &threshold);
> +	if (ret)
> +		return ret;
> +
> +	if (threshold <= sm_core_ctx.low_threshold) {
> +		pr_err("steal_monitor: high_threshold (%u) must be more than low_threshold (%u)\n",
> +		       threshold, sm_core_ctx.low_threshold);
> +		return -EINVAL;
> +	}
> +
> +	if (threshold >= 100 * 100) {
> +		pr_err("steal_monitor: high_threshold (%u) can't be more than 99.99%%\n",
> +		       threshold);
> +		return -EINVAL;
> +	}
> +
> +	return param_set_uint(val, kp);
> +}
> +
> +static const struct kernel_param_ops high_threshold_ops = {
> +	.set = param_set_high_threshold,
> +	.get = param_get_uint,
> +};
> +
> +module_param_cb(high_threshold, &high_threshold_ops, &sm_core_ctx.high_threshold, 0444);
> +MODULE_PARM_DESC(high_threshold,
> +		 "High steal threshold. default: 500 i.e 5%. Must be > low_threshold");
> +
> +static int param_set_low_threshold(const char *val, const struct kernel_param *kp)
> +{
> +	unsigned int threshold;
> +	int ret;
> +
> +	ret = kstrtouint(val, 0, &threshold);
> +	if (ret)
> +		return ret;
> +
> +	if (threshold >= sm_core_ctx.high_threshold) {
> +		pr_err("steal_monitor: low_threshold (%u) must be less than high_threshold (%u)\n",
> +		       threshold, sm_core_ctx.high_threshold);
> +		return -EINVAL;
> +	}
> +
> +	return param_set_uint(val, kp);
> +}
> +
> +static const struct kernel_param_ops low_threshold_ops = {
> +	.set = param_set_low_threshold,
> +	.get = param_get_uint,
> +};
> +
> +module_param_cb(low_threshold, &low_threshold_ops, &sm_core_ctx.low_threshold, 0444);
> +MODULE_PARM_DESC(low_threshold,
> +		 "Low steal threshold. default: 200 i.e 2%. Must be < high_threshold");
>  

As reported correctly by sashiko, below fails, but is a valid parameter set.
modprobe steal_monitor low_threshold=700 high_threshold=1500

Since low_threshold and high_thresholds are interdependent, I need to
defer this to steal_monitor_init. That's probably what yury mentioned
earlier, just that i didn't understand.

I think interval_ms, high_thresholds check can still be as module_param_cb
as they are independent.

I will fix it in v8.

Effectively diff:
---

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 09a5c3a299c3..38007791a2dd 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -61,12 +61,6 @@ static int param_set_high_threshold(const char *val, const struct kernel_param *
         if (ret)
                 return ret;
  
-       if (threshold <= sm_core_ctx.low_threshold) {
-               pr_err("steal_monitor: high_threshold (%u) must be more than low_threshold (%u)\n",
-                      threshold, sm_core_ctx.low_threshold);
-               return -EINVAL;
-       }
-
         if (threshold >= 100 * 100) {
                 pr_err("steal_monitor: high_threshold (%u) can't be more than 99.99%%\n",
                        threshold);
@@ -85,30 +79,7 @@ module_param_cb(high_threshold, &high_threshold_ops, &sm_core_ctx.high_threshold
  MODULE_PARM_DESC(high_threshold,
                  "High steal threshold. default: 500 i.e 5%. Must be > low_threshold");
  
-static int param_set_low_threshold(const char *val, const struct kernel_param *kp)
-{
-       unsigned int threshold;
-       int ret;
-
-       ret = kstrtouint(val, 0, &threshold);
-       if (ret)
-               return ret;
-
-       if (threshold >= sm_core_ctx.high_threshold) {
-               pr_err("steal_monitor: low_threshold (%u) must be less than high_threshold (%u)\n",
-                      threshold, sm_core_ctx.high_threshold);
-               return -EINVAL;
-       }
-
-       return param_set_uint(val, kp);
-}
-
-static const struct kernel_param_ops low_threshold_ops = {
-       .set = param_set_low_threshold,
-       .get = param_get_uint,
-};
-
-module_param_cb(low_threshold, &low_threshold_ops, &sm_core_ctx.low_threshold, 0444);
+module_param_named(low_threshold, sm_core_ctx.low_threshold, uint, 0444);
  MODULE_PARM_DESC(low_threshold,
                  "Low steal threshold. default: 200 i.e 2%. Must be < high_threshold");
  
@@ -172,6 +143,11 @@ static void compute_preferred_cpus_work(struct work_struct *work)
  
  static int __init steal_monitor_init(void)
  {
+       if (sm_core_ctx.low_threshold >= sm_core_ctx.high_threshold) {
+               pr_err("steal_monitor: low_threshold (%u) must be less than high_threshold (%u)\n",
+                      sm_core_ctx.low_threshold, sm_core_ctx.high_threshold);
+               return -EINVAL;
+       }
         pr_info("steal_monitor is enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
                 sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
  


  
>   static int __init steal_monitor_init(void)
>   {

