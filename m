Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686F3F54DF;
	Fri, 26 Jun 2026 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480948; cv=none; b=XNN3AAPpqGf8ASZTwzJ+6qUsD3j5QrBNft9jSyrnfREYuDbxDophTl0xWePBfJ2HPKzr2q6SZWfzZ6EBKdU7k2NhbxzIXBlFC9qm42p/Z/MwSsfBQ+jog9E9qkh7ibPUpm/cR1pJ7WyW0MUgwjgTzAvxYh/KA4TgnCgebj30BjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480948; c=relaxed/simple;
	bh=O2VdmuqQ1Xnnz/pp2EMAO4aV/ahP6y71kPTrGo8+t/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLQ+g3U9cecBxfYG8Vs7yQSN8PHRdzuec2/LPG7/4izYKdoCjIXYNMn1diaf+VfXRJhLoIDlyBsVOZHwCib2gW7cwG1jX3stKTs1XxFjiMaPswNWig1u+a5u1Rrt3h250QL5K8YM2FtuG9ZHx75QeMJACj4Bix17g1YuK9FUoXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=d/sUJJ2M; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="d/sUJJ2M"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAII462760979;
	Fri, 26 Jun 2026 13:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PhHYHC
	6elIw/wuCrA33KhDZip0QAaJROGvlrCFoTgfM=; b=d/sUJJ2My9uyCGp2IoM1A2
	QsCluOA8nPChDQ15ak+3TbZhV7rQvzPQL8rOPdARMky99Tx67iVE1EnIS5Vc3WBS
	EtfmzkmfXS3ijyx4QPQ0PbimiqfWPWXssAyqGQaWfFnAC7CE+hkFOgKQ3d5c8W6W
	O6j0sCj4zfdvUNcgwY+Vy5LVgnWY+FZHkxrT1uWcL9JvsvfQVsYGBDIxQXLaSxJt
	xWivayUam3MVQ7wGtKGktsb01jFJ4pW0tipKi528NitWPZ053KaDdox6S2bY5yJs
	mWBQuDIdfxBm6L2WoMMdq65KAZr6/BTfk33FBrPr8va6ed4Tqo1JZ99jbUAKjpGQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3ybtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:35:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QDYfUa010917;
	Fri, 26 Jun 2026 13:35:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66kkah2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:35:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QDZM0B16777550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 13:35:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 414B72004B;
	Fri, 26 Jun 2026 13:35:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4360220043;
	Fri, 26 Jun 2026 13:35:15 +0000 (GMT)
Received: from [9.39.23.71] (unknown [9.39.23.71])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 13:35:15 +0000 (GMT)
Message-ID: <82df9015-37db-429c-92ae-854cb2d4f5b7@linux.ibm.com>
Date: Fri, 26 Jun 2026 19:05:14 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/24] sched/fair: Pull the load on preferred CPU
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
 <20260625124648.802832-10-sshegde@linux.ibm.com>
 <20260626100043.GP1181229@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260626100043.GP1181229@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3e8020 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=J1G2in_c4E3h1slrROYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX5I7G5NLuN/WG
 42/v6J5h102nbU5pHMWtPih5macZOpGWdR1Qe6TZJvOdpmC6/0oONzsw50m+mjj66EgUeZ9hBjL
 JuFUTheFqa/pYWktWYZZkNS9wrtwrEA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX7DsBvpR6b0dj
 cB/X3Wuac6VpCVyiHkkJcVpKTeJ4UwFREIgeAB/d83khsKojeGb5qUJyQUxEJUwhmm8swhH6Jn9
 ZNJZBY3mo81FC3XxhGfWXMXZ5W7Xu+O2w1hdyHp6RsLGBR2tzmYuhy4pB89dd3z349LxfjwiQ2x
 3sau/6M7toyc2FhYVjWGwraeZ0eqTdy0nhGc7mB+4+7Qx43ln3OoFlgt2OQ96RiDtBfJ69d6Rz6
 nyFGRBAaJWFtVVLr9sHtNhZa+E4RlJJE7+JIbjirFUHDtJRJzyMRPqQdznpHp7K1VlBF87/uxxn
 IXrQLxiHshH1lBFaoMe27k4keBZjaMxnzGM4j3WWBIzfUZMhglngSm5NJJxyKXNFg7b44ZJjyZA
 SvgcCMsAqNCORb1xNoOJ+/c7mAQilMwnEr/DEC7Z8N9VSXkznyQC/NWtot8noL1iXZt6x4/xEdV
 3SRUqUcXDNG0p7XPTHw==
X-Proofpoint-ORIG-GUID: aY3ReeV2mBkdToo0pHfAlKQLyr7GAgpv
X-Proofpoint-GUID: WSKpjBMzRyzeD_uIqs9GKnGPQ6tTF5Me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260109



On 6/26/26 3:30 PM, Peter Zijlstra wrote:
> On Thu, Jun 25, 2026 at 06:16:33PM +0530, Shrikanth Hegde wrote:
> 
>> @@ -14375,6 +14379,10 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>>   	if (!cpu_active(this_cpu))
>>   		return 0;
>>   
>> +	/* Do not pull to a !preferred CPU just to push it out next */
>> +	if (!cpu_preferred(this_cpu))
>> +		return 0;
>> +
>>   	/*
>>   	 * This is OK, because current is on_cpu, which avoids it being picked
>>   	 * for load-balance and preemption/IRQs are still disabled avoiding
> 
> Why not just replace the cpu_active() check above?

Ok. that should be fine. i will add a comment there.
