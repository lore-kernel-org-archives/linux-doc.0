Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2F8403B10;
	Mon, 13 Jul 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944048; cv=none; b=aW7rUEu7/q7aygkTiQMmhgsvGCrEMRi2P5QuXCQjDA+GxhL8Gw6lUNpy9J8Yak3PIXeUIYCcTcY9SEo8XBnV9pCisvLMgXyPwxJDCysT4rtyn7w2xx0Dh34c6wrD9lhSlDX4xEtvlOdNj9O780i0qx1x1X+mjU6Y5vBOXJjOGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944048; c=relaxed/simple;
	bh=AjTwqd6ELhRIInLO3vm9PAMmAG/GLq24Xg9SZjAPcGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKdRwTiqtUpb/W9X04lJaKQ6eYgxYI1wAmbpekhJzKNa8j0mzaRFOhRtWfAO3vHX47jYlgic7OpLxYnHcmhfakI3L9l7RjJaogTP+8q+hhDfwAlcE70jAIXfcP8k2nXMaSCsmrts8jnK0+Pb9dMAwr6DDvmHcN7atKyhselP9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nJd/65Ia; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nJd/65Ia"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6gLej1732660;
	Mon, 13 Jul 2026 12:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZIdEMg
	NextqeBzkcker7LLgTn7rAgkFit/JtQT5lsyU=; b=nJd/65IaG5Nde3FsBdwXbV
	3pFqPrM9+AMBePKbuArKGrbm7luzPEhv5RA/Q15L20iBTWEf6NLuFTzAnHk0y3z9
	ogZRCHpVL/kZMJRITNxkkXfqga9yhEbtpTUV9GrS7QK8BJ4gNQnNw2xgfkVlA3v5
	wd7vqkbq5Yd4WJbTzz21IkNnm9GGuZde61hoph1XOC+LzDVhUU2wTtOt7RE4dk/J
	whJlSgqcqWUgef+5Ii0hvoEBPzwfx0uTC/gFSOVNaZkUnNwcK770iUTqdhx7AEc/
	W614cV5yhURyq1nadMu+OKrB9qyMFK3drehF7HoMmL4oGB5dhUu23W0kyK2JsvEg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbegbg4ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 12:00:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DBnaM4027135;
	Mon, 13 Jul 2026 12:00:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fc15jngcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 12:00:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66DC0MWx49873330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jul 2026 12:00:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89B1920043;
	Mon, 13 Jul 2026 12:00:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E99A20040;
	Mon, 13 Jul 2026 12:00:15 +0000 (GMT)
Received: from [9.39.29.148] (unknown [9.39.29.148])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jul 2026 12:00:14 +0000 (GMT)
Message-ID: <78f2d247-04ae-4a7e-9598-1865a939ea25@linux.ibm.com>
Date: Mon, 13 Jul 2026 17:30:14 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/12] sysfs: Add preferred CPU file
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
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-4-sshegde@linux.ibm.com> <alESuG6IYZCRESJY@yury>
 <adc1793e-694f-4531-ae61-b6b3eef568c5@linux.ibm.com> <alF7r_dWfUHKEofx@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <alF7r_dWfUHKEofx@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=fOcJG5ae c=1 sm=1 tr=0 ts=6a54d35c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=YhfCWV1knJ7e2zyInvAA:9
 a=QEXdDO2ut3YA:10 a=UzISIztuOb4A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMiBTYWx0ZWRfXxWpYSVpuZON2
 lCppbNfUtSySZoDEREnAaGkhKDnOsKQ+YvpGFSiOq1AGLN1CZkdx3X6lY9YAKgAEH0dsVKE4isn
 1nFUlWnZx9uNKCbOFkWVYY3lwiEA6eP+sCIaWtu474zFwPIpXt4+kxEHjWC5WKW9Pl2K7VwYKU3
 YmR/Oy1dkb46jNIEpKUFq2GB1Zgy/CD7jcLcaIZHU3MTEodwE5MMXJE9uF2RyIatdVIkLLXnUwK
 pILwxPg6SG+W/lI3f4s0msfw3VdG9rdoEHUst44bqUhW/MDpdmaolUc/A6LXxWz+x2/uVPisdrc
 nBmHUi1YdE0rJsBmXMOp/Y7V1fHoPGLkQ9uBwf5Bmb1sd0ABJflBpaDkIgYWSPse9dzRpHaKXkY
 fxGQBo4I2/ZGNPnqlOMsJYrZKfGYnerQMMFxHFrlPZBVjaMeb0zvuRuUhWOTcqwzapvKK1CBzcR
 NRyC3AUf8VU6qEtRMUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMiBTYWx0ZWRfX14WlpC0ccF4H
 VWHsdvOPwQmDf+q5fXcxM9od/W7JA88Cjup7emx/UXcoE+VUiv6+cnK2ZAY+yP6jJvb7Whk26Yo
 a12MN4Djt+7ms0WAnhs7UAUADRRpK1M=
X-Proofpoint-GUID: b99YXKCjvOaFj0awmAQtMG0BhbCsP8NJ
X-Proofpoint-ORIG-GUID: fcax0j5Nmz6Rw9BpGEMe3P9OP1L8RDNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130122

Hi Yury,

On 7/11/26 4:39 AM, Yury Norov wrote:

>> Not needed no? It will print active CPUs.
> 
> If I didn't enable preferred CPUs, I'll be pretty surprised having
> them in my statistics.

Ok. I didn;t think in that way. I guess issues mainly would happen w.r.t
to ABI interpretation or feature enablement in userspace right?

I will add ifdef gating for it. i.e (#ifdef CONFIG_PREFERRED_CPU)


PS: I had a dental procedure done today.
So there might be a delay in response to mails.
