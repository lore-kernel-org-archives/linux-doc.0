Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF09302140;
	Mon,  6 Jul 2026 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325439; cv=none; b=fLqsxXKFPViSGA+tT23YZpJmH3auGSLAiBiGDb3oidussrZ7qOwiy4L583+9CxZsdWxR/ZI3bUd/Vz9sAkBYZXAtasM7/lS62A1SC+xl0dzlft0JNRiMyvMP0uAHO83gGGAODtfzmVjjwXgI1aiDta7EaMB5lrGYDsQCuUlm/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325439; c=relaxed/simple;
	bh=TT3fncQbUQptCxF/Z0hHX0Zfr+WnRqh4fEu5SfiSaqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lM7R+lDCarFdEkfBxlK+dwyhLfVkEVRMifSMCuZpyNiqgw/bO8pP5avRJyMvizXlDm5tBEC/6qKG9GjhUppPvhxV+to/M1B3O34FO9GkkscfCijUsqS2ZkK1RFZdACCmok+vQAYTd3WkU4fSOgPFwfe+emU7l0/+4JuqZ3bwIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hVrCTmyT; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hVrCTmyT"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665MIIWY2250511;
	Mon, 6 Jul 2026 08:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bj87bp
	x3hQdTC8O57OrlDQrhSmQUaLC1hI7RZn0K71U=; b=hVrCTmyTu140IahXM6QYKy
	RkVCxcMQLfIpWTwpzJUsbDk/Bsej0O/SP31hFz+IHKsRCbLh6EVh6x1p0ANjXT/D
	esdOomUVtl+4ntlR5r37fVib3NemE/XwsY/Y+VbffQ0xu2h2tsouEmvP/Jl+65GZ
	O+jzsWi1GWb/yULVYxPhFiPR3G6nqAWgjhouioDEVXIvpiEAyFuybw97CRxfIGHz
	n1tr3EyMoUZ2SXgGNShMAXb3BeYQRwTesgO/bWXuxeZq0gW6J9edncXwPyR0O3Y7
	CrHrLT70Iq0iI/LTlt/j0SgCONgnJYdzZLn5We6Jxoz0a5KtuBDoM/3rTNisaL3w
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qkn8gvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:10:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66684oTK028387;
	Mon, 6 Jul 2026 08:10:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgpvw5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:10:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6668A6t648562618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 08:10:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B36BB20040;
	Mon,  6 Jul 2026 08:10:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CE1420043;
	Mon,  6 Jul 2026 08:10:00 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jul 2026 08:10:00 +0000 (GMT)
Message-ID: <b1f03a02-b573-4779-95e4-c65e6b50c03e@linux.ibm.com>
Date: Mon, 6 Jul 2026 13:39:59 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/23] virt: Introduce steal monitor driver
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-13-sshegde@linux.ibm.com> <akf9cE22wvPeYNiM@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akf9cE22wvPeYNiM@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a4b62e4 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=YAZr8UVag6cMWNXRMNQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: nhUtGo7YDboIzobjwgAyXsbjCMBchH4G
X-Proofpoint-ORIG-GUID: 8efDjAWiaW1cO_ghQRn05SIrYAUb21Cr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3NyBTYWx0ZWRfXzyvGvSOscRvT
 hl8N/HkaQ5z0SxAIoGOWrTbdHlEkoZyrmI/H0e4y9cKdSJEXDLcDBPjBojIaOKfwXyETK55SVot
 3ag73LSc2q4e6KdQiaUqvofHGwtWf94=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3NyBTYWx0ZWRfX6+BjiduiASla
 aRRCnqwPOGArX/zvtjcfwSWWVfWKinVvst1+ASV1GnCMFk/akxx0tJyGmfcubz/iq8IHYntdPR+
 f3bjfTuxVTSnO35cnMRUXMpgD++n8vPbuFA8tPJuCnJW241stSqzSiymO7Pu0r5gmKCWCUKivjP
 3cuxwGi4VVPe7/wxL7d35jlJPRAXIXBF0ZuT1t/RGpZUyWAmZCCbL5Rx+2zaJ/iPrwnwjXIPHXd
 VInbC8Ep9zVuvYoDGMgkpFEVz95VuExOI2/JfRPexQboNws72ZI4TFBG6/JuZ7aMOJHsjdQRZZ6
 SIWKIJ0JxtxF6A0f+AzLysMnXnwu+gyXTxtKkZtrrFxXJpTE1JJBHKxIcXhrcWWrIRtbYzNMANo
 Y6TXQOleVPEHBFjFyY2jXmJMMIi27bAg5pzVZsH8v5ay+RT/ba4jrG/gU5e5zglRmzV9n+ctVvM
 11SMKzlHCRDVlvNF9kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060077

Hi Yury.

On 7/3/26 11:50 PM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:43PM +0530, Shrikanth Hegde wrote:
>> Introduce a new driver in virt named steal_monitor. This driver
>> will compute the steal time and drive the policy decisions of preferred
>> CPU state.
>>
>> More on it can be found in the Documentation/driver-api/steal-monitor.rst
>> Introduce the skeleton code first.
>>
>> There is no new kconfig. It depends on CONFIG_PREFERRED_CPU.
>> - If CONFIG_PREFERRED_CPU=y, it gets compiled as a module. It is not
>>    loaded by default.
>> - If CONFIG_PREFERRED_CPU=n, module isn't compiled.
>>
>> File layout of the driver is designed with having arch specific
>> files in the future.
>>
>> - sm_core.c - contains main driver code. This includes the periodic
>>    work function and take action on steal time.
>> - defaults.c - contains the default implementation defined with __weak
>>    symbols.
>> - sm_core.h - header file which includes data structure.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> 
> You've split the driver code into 12 patches. It makes it impossible
> to review the driver as a whole. Please make it less granular. 2 or 3
> patches for the new driver is more than enough, I think.
> 

Ok. I assumed splitting into more makes it easy to review.

I will plan to make it 4-5 patches.

1. Introduce the driver (include doc, skeleton code, datastructure)
    0011-virt-steal_monitor-Add-documentation.patch
    0012-virt-Introduce-steal-monitor-driver.patch
    0013-virt-steal_monitor-Restore-to-active-on-module-di.patch
    0014-virt-steal_monitor-Define-steal_monitor-structure.patch

2. Add debug knobs as module parameters. (as it is slightly longer patch with module_named_cb methods)
    0015-virt-steal_monitor-Add-control-knobs-for-handling.patch

3. Add default callback functions (i.e implemented as __weak)
    0017-virt-steal_monitor-Provide-default-method-to-get-.patch
    0018-virt-steal_monitor-Provide-default-method-to-inc-.patch
    0019-virt-steal_monitor-Provide-default-method-to-get-.patch

4. Handle periodic work and act on steal time.
    0016-virt-steal_monitor-Compute-work-at-regular-interv.patch
    0020-virt-steal_monitor-Act-on-steal-values-at-regular.patch
    0021-virt-steal_monitor-Add-direction-control.patch
    0022-virt-steal_monitor-Add-design-checks.patch

Does that look better?

>> ---
>>   drivers/virt/Makefile                |  1 +
>>   drivers/virt/steal_monitor/Makefile  | 14 ++++++++++++
>>   drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
>>   drivers/virt/steal_monitor/sm_core.h | 11 ++++++++++
>>   4 files changed, 59 insertions(+)
>>   create mode 100644 drivers/virt/steal_monitor/Makefile
>>   create mode 100644 drivers/virt/steal_monitor/sm_core.c
>>   create mode 100644 drivers/virt/steal_monitor/sm_core.h
>>
>> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
>> index f29901bd7820..aff715cea42d 100644
>> --- a/drivers/virt/Makefile
>> +++ b/drivers/virt/Makefile
>> @@ -9,4 +9,5 @@ obj-y				+= vboxguest/
>>   
>>   obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
>>   obj-$(CONFIG_ACRN_HSM)		+= acrn/
>> +obj-$(CONFIG_PREFERRED_CPU)	+= steal_monitor/
>>   obj-y				+= coco/
>> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
>> new file mode 100644
>> index 000000000000..24cee55342ce
>> --- /dev/null
>> +++ b/drivers/virt/steal_monitor/Makefile
>> @@ -0,0 +1,14 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Steal time monitor to alter preferred CPU state.
>> +#
>> +# Arch can implement strong function definitions and override the
>> +# default by adding them in arch specific file. It must ensure
>> +# that preferred is always subset of active.
>> +#
>> +# It is always compiled as module if CONFIG_PREFERRED_CPU=y
>> +# One has to enable the module.
> 
> Why?
> 

Few Reasons on Why i made it as default no:

- Since it is co-operative scheme, admin user/root user will enable it.
   When he does that, we have asked him/her to ensure it is enabled on all
   VM's. At-least he/she will check other VM's kernel versions when enabling it.

- This periodic work has a bit of overhead. So enabling it by default, one may question
   why add it when user's don't need it. For example, in powerpc a VM can be brought up
   a dedicated. In that it is not expected to see any steal time. By same logic, having this
   module enabled in Host kernel doesn't make any sense since it will never see steal time.
   (If one compiles the same kernel for both guest and host)
