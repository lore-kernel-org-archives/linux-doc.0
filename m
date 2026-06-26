Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441953F58DC;
	Fri, 26 Jun 2026 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782481055; cv=none; b=PbmTfj3Y56irwRnSJQ4nAcdaNUVLwLhIGyMW0oFh47cpl6RrsYnWTMpMj+Z53kLIhQ/DcU8wHuoeAn7Oec+PEa4a5k/aplhWlV/DcXJFeTU8etMnoh7mbTNRqJLgdAkXCxYl5P7AyLmYm/pd3pTNAE8W9IBV4hMqCx2kAYxwDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782481055; c=relaxed/simple;
	bh=Ewj4Wj+Vj2oEjaKKEsqVPy1ZOxoaBNPbxJ9bSNnnVqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6uN/CLqj0y+p2ZOPC1jgzyUvLrggKYuQazejSWGxaAGLjg8e4f8g1yxpADFE23J/1Xrh+5GvhzUYUomJvms+RdAWxZkaRUx3H4qaTPrPnhGJxEO8dxsUxy/5ffzfrYfAO5YL/nuFKxUU2eE2abqNIi04oLuLIt+BlxBeqB54p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AH48Rg4A; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AH48Rg4A"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAIVkR2720488;
	Fri, 26 Jun 2026 13:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=khYsr4
	YrUbMusFSZ4RtSaVl3gwICZGR+hHf5BwCZeg4=; b=AH48Rg4A6akr984rKqaia8
	q7H9+Eh+1/ipvRrpR5OLZS0Z75ExnVoJPuB/PgCqLMnTJ/Yg6jjZxxg1lnSdefo2
	26Mh9J4b8PVpSVJR4JVteO5OQPH5llh946lMAGACCxym079BCl4ESTenLlVIzsDh
	QysHA7OOXD3hZ2SLHR49KnhDDbIuw92+xfrx3t2wXD/JWi9wbFbuh5kb9XR4lMw8
	FOy/9+6fSZUoPYvgZc+sr8lmjGEu4JBfthdaU76nZr2PREY84YRqS1xiERAz14Tz
	M32woxeVPqjofuYf53hkiPFnjbzQVCy3gafiDKH73TJkn8XTQuEwjxs8/qDyWn1Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjk4ya1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:37:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QDYeaE010912;
	Fri, 26 Jun 2026 13:37:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66kkaq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:37:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QDbBwk61735344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 13:37:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93DEC20043;
	Fri, 26 Jun 2026 13:37:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8418720040;
	Fri, 26 Jun 2026 13:37:04 +0000 (GMT)
Received: from [9.39.23.71] (unknown [9.39.23.71])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 13:37:04 +0000 (GMT)
Message-ID: <f099e7d7-00cb-4bfe-ac08-70c4555e092a@linux.ibm.com>
Date: Fri, 26 Jun 2026 19:07:03 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, yury.norov@gmail.com,
        kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
        tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
 <20260626093414.GM1181229@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260626093414.GM1181229@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX/4ZX7Sql9THD
 n7qfNvOkGkaDQ31tRqg8VJ6aRLi1DJ38X6jI5yawHLo397Q2g9BlJ5lKK6gjH4qP5NNQGi5FZE7
 xjpNz7iL8C8w/zF6jUiIpM2bDf3YUeU=
X-Proofpoint-ORIG-GUID: l1thRBvTCKWvrWoPsYWyUApf5XMHxzwL
X-Authority-Analysis: v=2.4 cv=Oph/DS/t c=1 sm=1 tr=0 ts=6a3e808d cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VEdCq-UeGgiu439THxAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX/q3dS1MNkE0p
 +fN2PWym+dFuVLjyGu+WhCJpCuO10JvVSrVO95ZvhFoCN/HXnUChUqGgU5ofBJVGH5toBwnvzXA
 lp8ebkrAs4XLi+yrBWe/G3SziWlDAbdY8iMyBhuppHjcPpls8bxq5mnUR2ym5lpCcMWORr/uEck
 onwVDZ0DKtUWZG53Grr0XKJaulxLy9/L+1+m9XXP5hHu1i0KOSx4Rw/0K6J/weLN9YI4WE7oVbf
 q4Q+g5s9hQPFl5JtM3WBKss3A/uPiFh0vJJxW7RXWM6PIpM76/kpyieyJfOeRdcTFfvjdN32D8r
 FYCi7cGv3uph34udOjsrPDJoX3anILmoBCxTxZm3Xq3kwLmxfoI0ah48LLSZfVJHpE9NiAQQSUy
 xHhRuApig6J99d5ksxReF23vQgv3o70rK5UBy62EOky3+TSsXhCirwxGtkX3ltugvNjDY3kFuU+
 zkV6Gtf0zy3x6vJqpaw==
X-Proofpoint-GUID: Ukzaz0czktA5f5d4RmSDCuBO63QobsKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260109



On 6/26/26 3:04 PM, Peter Zijlstra wrote:
> On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
>> This patch does
>> - Declare and Define cpu_preferred_mask.
>> - Get/Set helpers for it.
> 
> There is a blub in submitting-patches.rst about how 'this patch' is
> basically a red-flag for a changelog.
> 
> The changelog is per-definition pertaining to 'this patch', therefore
> stating this is a tautology. Further, it is often fairly clear what the
> patch does, but less clear as to why.
> 
> So the suggestion is to phrase this like:
> 
> Provide cpu_preferred_mask infrastructure (definitions, declarations and
> helper methods) to facilitate ....
> 
> 

Ok. My bad, i will update the changelog. thanks for catching it.
