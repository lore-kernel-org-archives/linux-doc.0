Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6D23392B;
	Fri, 10 Jul 2026 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665335; cv=none; b=Mu0oYWyIhRBqs0I0J9V8q+x3cdDX7yDAJuymDboN1gvvAHKEX+f5RiZa1zde6UHByuWsACoaaMHi6VcS8BOnLQUITEgnYA8Fu/onyynhcE7XV8jL5Rcwqu5V2hikqwO9NJxtEZDLW6ixXaeUwZXQ0Q628tHjGvvAhDIKN4PDHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665335; c=relaxed/simple;
	bh=HX0+S3UJrGdpjL9XHwHkU58cROtDo6AFlvOfcNIsw5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+Hx+vAdUgLV0gVPhCdfwPMV16dD6l/4/dKwK4BJQ7DFsaBms1YTbNKVfAsOE5iY9PlBIeNsWvPtaQD5qssh3yg+cZ16ckTpTyQ3QDqovYUjerYbws9E9wov83RbAAeCw5AkUHQRgBDofdVeexfDsPQXcCureiqMF6YICSvF7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dMppCi5G; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dMppCi5G"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3o5AO077794;
	Fri, 10 Jul 2026 06:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=J7/xfC
	F6vmPqkdEJPIMXZnOE1pd2vcvNItJDK8fe7eI=; b=dMppCi5GcAZp/w7Hg04zCJ
	u2O/Audklq9GizLyAzb3LEu3CEdl4eByDJdg4WZjy4pe6RKVAu9d5TkbyduSs9B+
	HZeIMaZs6q4j0KSlCaw6kwwrfeRsoTA7zMyI9w4YKq35c/PcEkeugaWq4R/DNcf+
	0yg67vtmBMnGjAhgc0C15AM0i+5hf84HfDK2O8++f5oqLkT55uWYZh+d872Ji6/G
	1qzK9GL2gZ5FWkcqgbTPXiDzlC7ILZ27SRRGekG8xBK6qP1hwNVHO1001r+ePuVj
	z1kWBW4Q062qE6skVBuyT6ufGF5h9ve+2gK0UL1/atEFQYvTRCY0zsEEw3vg3wBQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qknvq7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 06:35:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66A6YkQ3015323;
	Fri, 10 Jul 2026 06:35:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgqgxw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 06:35:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66A6ZAeR14746056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 06:35:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6443020043;
	Fri, 10 Jul 2026 06:35:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B21920040;
	Fri, 10 Jul 2026 06:35:03 +0000 (GMT)
Received: from [9.124.216.30] (unknown [9.124.216.30])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jul 2026 06:35:02 +0000 (GMT)
Message-ID: <a9825ec1-fe62-42da-9a24-36fd30772700@linux.ibm.com>
Date: Fri, 10 Jul 2026 12:05:02 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/12] sched, virt/steal_monitor: Keep tick on for
 faster push on nohz_full CPU
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com
Cc: tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org,
        corbet@lwn.net
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-13-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260709215648.1246821-13-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a5092a3 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=3W3EUuIwW94Ror9ydsAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZlRdD4jm7bnXbMeLrpHnJ1SWxOZauAHv
X-Proofpoint-ORIG-GUID: -pgY7B6-a6uamqI_tZ-eFSonEM0n5b1A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA1OCBTYWx0ZWRfX7Oc5QmxfdXUy
 HpQuMsDROnhUaDuifFpAfRFBECH1/e74nUNXZbf+KehTzDaCQEpbAV+lz3prkSmOcghFCZN92il
 9VW8RVIRcr5qSc9OBg1o8KCLFoACA4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA1OCBTYWx0ZWRfX3R02Fvl9Xiu2
 cIv8kcUGijjeaj8QUNn+USaVcKnxh6v7ZI8tVZn/11CQOwXEsLFNoahHpFSuRkiMVReeDcHCmtA
 K6ZQYjXN08tNLd4fhgYTQOGY5bUtzkdQtTsD3QIWlGILpc+mjpS6kKwfQdKWIaVeA05CmKiUCvK
 WMIeMJLUn3hmcPvtAhNglZAe7IB/tkLL9Lh4I1NSDHtgXUjtrkUsHvJcNHB5qpn9u9rQAMNfgh+
 FCDDwfCSH2V3tkZxlo2Asw/OHQLw3nNZmt0dJhJ8Ge3irs5KA/3GVjfZLUz/lriLG72vw6q4eCT
 Gl8IMAaqFbbqGLr/twQnhSayP+Ccd+KnbQLj10WefeMc89w+VmOntbEyrhA0p4y7dVyTflEVOHM
 f5c4A6zNAJTlewVpK/0DJYHxWg8p89kgIoCFdSdwViChw0ggqeXsEc4xSFJByXwS1rEvE4KxOx+
 b60LRlpofhirjl6YrnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100058

Hi.

On 7/10/26 3:26 AM, Shrikanth Hegde wrote:
> Enable tick on nohz full CPU when it is marked as non-preferred.
> This helps to push the task out faster and in more predictable
> manner on nohz_full CPUs.
> 
> Steal time handling code will call tick_nohz_dep_set_cpu with
> TICK_DEP_BIT_SCHED. This helps to push the task out of nohz_full
> faster as push task depends on tick.
> 
> If there is pinned task on non-preferred CPU, it may not stop the tick.
> That is rare case. Even then, this preferred CPU state change can
> happen only inside the guest. So even if guest stop the tick,
> it may not necessary mean power saving since host disabling the
> tick is what matters more.
> 
> sched_can_stop_tick flow doesn't change if cpu_preferred. On disabling
> the feature, module ensure it restores the CPU as preferred.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---

I will drop this patch 12 as it is an optimization for rare case.

The reason being,
- If there is one pinned task, it leaves the tick on.
- Can't just the clear the tick while disable, that will cause break.
- need to know if there was one pinned task in sched_can_stop_tick
   which is tricky.
- optimization is applicable only for a forever running thread on nohz_full
   CPU and non-pinned. Such use case is rare i think.

and

- Task eventually move out that nohz_full CPU, it takes a few more
   seconds. Likely it happens on natural boundary, maybe a external
   interrupt, background workqueue or kthread etc.

- One configures nohz_full CPU carefully.  If the need arises,
   lets bother about at that time.
