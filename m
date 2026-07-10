Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8373C360ED7;
	Fri, 10 Jul 2026 04:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783657860; cv=none; b=Qce9Y7eLrOoPWhklL38aE047hX4bPOErWr5+6+sF7gJAR5kqbrMtEdmBk392EeQNou18XHQc6b/lvuV5D6IQJCyHkL3pmgHSKRMSgtJGIrZcpyiCW+RgBoYBbxBpkZpDV4ZQbz0xspbvIlGfCUcR/dxIjqjUmNv/QXYgLzeJIEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783657860; c=relaxed/simple;
	bh=u176YLw504zL7hcTJ0UQ7SwQ2aaGrCaktLpVxAsg64E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMu+P0oPNk8gSC+lwJ+cI7zp0bwFvCuybGZ2w8jdtYttoPXvwEAR1a98HVPyJgHe9RkhcxaH7iPNZpXp8D0E585D1I2LtwFcYS9D0DWKk6v+2GaG7Ytc+NvK615ngVhQ/DmA1Q9hkOB29oS3k34JaBoyl59SLQWhLiec1lbmzDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rh6yPIpY; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rh6yPIpY"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nv6D3214672;
	Fri, 10 Jul 2026 04:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=u176YL
	w504zL7hcTJ0UQ7SwQ2aaGrCaktLpVxAsg64E=; b=rh6yPIpY5DnUDH5M5mib/o
	LDJMjPkf9akusz2GrkA71VZpmT09vPUQmFxO5Y/ulEfrJ+7GEVIgcPQ97KdUHmd4
	dzKvPRHBdbv1GpxIJg+lN3kM9I8R2uFRbvQ7vVCQMDYn0pKnPngjIKh0zjlKCUPI
	aiIYYxlOoGMmdeyIX/1ZrdvN1yj4mCb2K8PLWh7IqcGHY6qNICnsFKP9zWmRIkvv
	inDLGGJ0GAUY7MsOwlpfkju/gbEsWAzClqJuKqKUT/QFH04C6vhvJH9QAKAljnrj
	mP6jcmMyDuC0oYCj0UunruIbhEjPCxuA1wkG541/Tbh9IssZDB/C7MimdtDh17Cg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6stt55h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 04:30:41 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66A4JduE005788;
	Fri, 10 Jul 2026 04:30:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgqgjaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 04:30:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66A4UaRA56754668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 04:30:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91E6A20043;
	Fri, 10 Jul 2026 04:30:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF3C320040;
	Fri, 10 Jul 2026 04:30:27 +0000 (GMT)
Received: from [9.124.216.30] (unknown [9.124.216.30])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jul 2026 04:30:27 +0000 (GMT)
Message-ID: <e7fe1166-cd7c-4df9-a6fb-0ad9dc54afcb@linux.ibm.com>
Date: Fri, 10 Jul 2026 10:00:26 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] virt/steal_monitor: Provide functions for
 managing steal values
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
 <20260709215648.1246821-11-sshegde@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260709215648.1246821-11-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: IY9Pl5B30UJm0tfPLq2kYLq4xQDoNKEV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAzNiBTYWx0ZWRfX6uYNT8tcLEAW
 o3BBgFnTVm3gHziio4cMAe/o7+BzkBMh/Ha35uu9gyNCyI7VaviAEplnF+YtsD2RSWkoPJ29qTf
 cHgNYQHlBXZ8jU8tyvyYZoINt2VgV4Q=
X-Authority-Analysis: v=2.4 cv=DKW/JSNb c=1 sm=1 tr=0 ts=6a507571 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=FiPEHE8dWunZ-SBSaDcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Mc0uCr-_-EcNS9wLzcH2xoZKGj_TH3JL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAzNiBTYWx0ZWRfXwWReAcDT67Zg
 iefLZ6lh7EmFFBKcvKw75XEvTT5LtfAa/jUsarm5M6A+zF3wkwqLjBfb3R2sAEGVq0XjZQKmph8
 fSc3NlHSn8qNtsgHOzsUzi++p8ADH/cmOgRdoNw1RrDyFIkQkRZ3PN1fY+74PU/xTGWRLdC2JAu
 +ZW5rta2Dgk+zD74aADx6P+xpGO+FXhwiklkDjUrSCZGcmFLub8PgONdzTLzQUg51quHBqtmWkA
 dqaZfWoWtSDY8YXFJJZdQX+oCi2fdHeKrqen9q+8c+gOmZUjKEZMYLvJnamoTOY6xkTTvlPWU1j
 3xcbjeyovBWfpaxAY0KQK5SfBvFEfupj4VYL0nlxxNWFdCkQc3ppE4fkLYbp0O2riA4MMi7CiMS
 ZYZVWrjoGNdVLqbY8nRcokvUZ/tjDmEBQDqR+3dYTc7pSfCAvOs7E2HpVd0fYElKFjRSrRLCvc1
 QqVItSpsjs/L8ZCWJdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100036



On 7/10/26 3:26 AM, Shrikanth Hegde wrote:

> +void increase_preferred_cpus(struct steal_monitor *ctx);
> +void decrease_preferred_cpus(struct steal_monitor *ctx);

ctx is not being used in the function as of now, but i forgot to remove after
that __weak removal. Will fix it in v8.
