Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F3370AFD;
	Mon,  6 Jul 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326288; cv=none; b=T/f8yXlICbVSYvP02NkbMLzirOCZJJa5I3adr/lQgu8Z3QJY7GKB+pC0I+7BL53mGi2XcRwxmpg+JDjJr53nKu+dpXcLgum1qZU2DYlyHYK4uEKwrSHDy8pHFfKWLH3rqp0jo51wT0iY5lLMy75rw0dqC25zGpkh4MFCX3/SF8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326288; c=relaxed/simple;
	bh=nTpxGX9dTFK0QW+2bjIJanW7jnFKGJ2k4RA0tFACOGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9fw7HQ9h8jbW4D0nvTjSbw6HmIAcL6KcSERLWt2kqEQK2c5XFMRPxlhtRlJqACiHva+FFC53Rwj82XbM+Tc4wz8jRrOVWKT2TpIUX8bVGiImoyC2krlOREr6D26TMZI4LEx/AZqQpIHT2spi8NjfOWMxXvo0vn2guMlQbvX0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tKFqNh1I; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tKFqNh1I"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665MIYnc2198087;
	Mon, 6 Jul 2026 08:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EKBDS1
	FuWLc0D/uosvOSNQHKPd/mu5vgtB848rKWpA4=; b=tKFqNh1Ihsg+89YdX8PN4r
	oV11wwMLy0NgQ3phccySHZiezjmp0HHT1p1L6pbFq/ZdmcgE82+3kaHlBKsEHyIj
	4dXoR0MJUZj5gUJDIhQKoo7k1OzVJiwu2nFUWvVdUsidCmK2BTIkJgJDzsNY1Pv6
	amQdSoG+le7p0FRp3fJrCIlbceeQuWSZoBmrAJXM36H0CtGAZEyF+rtK5slxlnWK
	c9S3PVfKbcCJvZgcBLx9RxqFyd39UactdC7A6R1rf0YDd+Fl/9aQESMm3xldYr+j
	eFK3N6W1B6uWYW4N2EtCWAU23jG8l4H4wmj/cV4LXFF4U+AAXjm9kqnoN/jsbjVg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw4gdvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:24:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6668JdPl016678;
	Mon, 6 Jul 2026 08:24:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7f6xvd63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:24:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6668ODai48562572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 08:24:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5078920043;
	Mon,  6 Jul 2026 08:24:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB2352004E;
	Mon,  6 Jul 2026 08:24:06 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jul 2026 08:24:06 +0000 (GMT)
Message-ID: <ce2b5699-8e22-4eb4-bd55-c3df5ff30f74@linux.ibm.com>
Date: Mon, 6 Jul 2026 13:54:05 +0530
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
 <akf_Kg3jaenNbb-g@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <akf_Kg3jaenNbb-g@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: FLNpqZBnB4YYYeIJVWptxWLRCLxg-jBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX6BAbvGNlB4eW
 qm1GtqoP28Sn8//t9d84dYfO4LA/COrtwOEgyCqNVrrhiz56dEpohwDGY4ve8BvApVurG9Jd7UR
 rYhrWDZ1PbnzJmqYrtzhSEjLkx44RNIPR5PbnOOb1EwflJcqDksvC0oonIL66bwT/soYRXRnbQH
 t9KheSbsCwrMardX0R49puLjwhuuyvqpvyV7ttnnNwDi7+W2DjIOy/frDkIE50GFc+cMo5QqXSA
 rli/qATIHfk9ysO2/WVOWN6Q5WCJzZaHpqCcHWh9+6BV3ESyHWA9b0Y+DmkAFUg619QGOoARxE6
 29YGZm+UpmZeHU6OmCF0J1jppTK4pE4RHeIAC5Ha2GzSXcxpQZt9be8RoDd+I6zIjp6U1q3kAl+
 JW3FJzJ5/6GnhNegWGv/P5BYT69sBiaIzhez19F7dxc5yzJ+ReRc2nOQ9i+bM+TdUQpF6UQZzFo
 GpKDxB4BIoAc3PoMg6Q==
X-Proofpoint-ORIG-GUID: A-9P4aFmCtdngnqVd5VoCodHw6Hri8ye
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a4b6632 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=uXM6aEYcthE1n8yYxcMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXyytUlg5gpSD2
 bKBOJSYrfnFuj29Jmrs+D2MfB4+9f2Ll0ztLzOnn4ZT3qXOG5jbqfi4Fcr9NuA0RQVDab7NaMcB
 07Onx5GItxUNNU4qSIj61XwKtgSYq1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083



On 7/3/26 11:57 PM, Yury Norov wrote:
> On Fri, Jul 03, 2026 at 02:20:32PM -0400, Yury Norov wrote:
>> On Wed, Jul 01, 2026 at 07:46:43PM +0530, Shrikanth Hegde wrote:
>>> Introduce a new driver in virt named steal_monitor. This driver
>>> will compute the steal time and drive the policy decisions of preferred
>>> CPU state.
>>>
>>> More on it can be found in the Documentation/driver-api/steal-monitor.rst
>>> Introduce the skeleton code first.
>>>
>>> There is no new kconfig. It depends on CONFIG_PREFERRED_CPU.
>>> - If CONFIG_PREFERRED_CPU=y, it gets compiled as a module. It is not
>>>    loaded by default.
> 
> What if I've got my own monitor, and don't need this one? Please add a
> way to not compile it, even if CONFIG_PREFERRED_CPU is enabled.
> 

You mean make a new config like VIRT_MONITOR depend on CONFIG_PREFERRED_CPU and
make it as default n?

Can we defer this until such a new monitor is needed?
We will in state where CONFIG_PREFERRED_CPU=y & VIRT_MONITOR=n.
