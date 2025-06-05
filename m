Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC51EF1D
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 02:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088985; cv=none; b=iVHrX65FJCcbAQL3mEe6RBgl7uVqxbyQXuAfaIezAQNuk96BZi3fM0xOUD9BzEamVOu1z23DE+EjCToNe4telt6mJFOgTYLEyYcAoBUsd8VM1lTJ/zq7voa4FTACfYuNvRD7Nn3VFX4CSlf8o6edkf/u+lPgwVmHeLcfCgfEETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088985; c=relaxed/simple;
	bh=ow4aBWW8G/7Ua5mSHfY80BWWvLwu6nMr6XcAaN35fys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVOS9i5knaXEi4DYupPd1FnDAodSgMjenB1lMQeY1SytBlH6dHDmbhtSfd50dE2F4XwnvFVKoivhtT2L20Y+asw3aG63HltFqmfqnPoOCxjUph1iMINO1vUj3zT/pN42BxduDZ1HD7FNCSiUXIbifvgmjMINQfS+9fe2qwOtH+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VoULG3x+; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VoULG3x+"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554NJIAD017543;
	Thu, 5 Jun 2025 02:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XuQL5L
	EFqsb3M1hJOtXV9VoYyu7JOE6hQj2XnETTwuA=; b=VoULG3x+OmK3ZLz12WbyiK
	GHKGBB2FP4iBvNEbESkWEOqABzUHJusdyG+YJ81/0VLsILgpmbNON25o5dAhy63j
	nfxTVKAfUoXNHteGyeHEIxKeKv5/DBabIK4sbW3YU+XDqk4qzbPExy3qQ+7rm1Ut
	PX7d2j3f1mss1PqddduGMKC5cKlaYfn+fyn5G5x3RK+XJ8Y/bTS9ZlAxmFrMAtV6
	sbNN9I2XJMYB9JzmcKrcjrGR8Cel94YHRyJTHy2vwBuz7CknqGmBg8d3od8B3o8Y
	neojtDlwa72GxrDnR9BPEWD+kiDGZGT1F4uP5uEPxhw+Mr8zwSrrB3DW4pFm1kqA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 472fwunfqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 02:02:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 554NG9bT028472;
	Thu, 5 Jun 2025 02:02:57 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 470eakjcp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 02:02:57 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55522tvK31261286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jun 2025 02:02:55 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77A0558054;
	Thu,  5 Jun 2025 02:02:55 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5F055805A;
	Thu,  5 Jun 2025 02:02:53 +0000 (GMT)
Received: from [9.204.206.207] (unknown [9.204.206.207])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Jun 2025 02:02:53 +0000 (GMT)
Message-ID: <98a8a5ef-45fd-4b1e-a775-d1e1306ad682@linux.ibm.com>
Date: Thu, 5 Jun 2025 07:32:52 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htm.rst not included in toctree
To: Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox
 <willy@infradead.org>,
        Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-doc@vger.kernel.org
References: <aECkEJm6sl5cvcw6@casper.infradead.org>
 <98c88245-6368-4d67-b5a3-54a3d1e1a150@infradead.org>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <98c88245-6368-4d67-b5a3-54a3d1e1a150@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAxNSBTYWx0ZWRfX8/otqhRQsY8F UwzGOQPo7q8PbOj6zinfyP9YAsJlpUExnAhNvBntlKFna3+oh0QsmK7ihGKB0+6NyY3gj7Kooh5 Qjmpg2d/SCa9OiEHSl6SgdBpbtJckT1ROB8WttdfuHm582vhhpadRKSTipgeUuNwEMdKD0Vdv6x
 5sR9S8eqyB8dHd5zq+vlChcGxtU1esyQNyhPqgIq7K1J4RGSHe2D+G2txdI4jDXhsMETxn7vMEy CdQxbUQHvCcq89qzJ2LSnoBf/hPmToyeQJ9DI5XYPciK5WTWzcygJRQSR4rjvNFt6wHZyzHVgF5 k6pYL/jWJ4ELZMjUrtcpyX28Meb/YjFZOstxiU63zRT0vtC2797kqQkuSyYpqUj/i9kk8m6Szt8
 tw5GkGZHiPKK3+evNAdECTBhhLQMdbLow59bJ1TL6UgJ/AyEGInNwQgU5hz/O7mTyxbv3LGV
X-Proofpoint-GUID: qP1aQu53FLuG7TdS8A01NMhd_h1a95M7
X-Proofpoint-ORIG-GUID: qP1aQu53FLuG7TdS8A01NMhd_h1a95M7
X-Authority-Analysis: v=2.4 cv=QtVe3Uyd c=1 sm=1 tr=0 ts=6840fad1 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=wukD7SXyAAAA:8 a=p5n7c8odKLM_JsXYCcMA:9 a=QEXdDO2ut3YA:10
 a=n7THaJik3DRP1sDdJiGm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_05,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=790 lowpriorityscore=0 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050015



On 6/5/25 1:57 AM, Randy Dunlap wrote:
> 
> 
> On 6/4/25 12:52 PM, Matthew Wilcox wrote:
>> commit ab1456c5aa7a introduced a new warning to the documentation build:
>>
>> linux/Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree
>>
>> You probably just want to include 'htm' on a line in arch/powerpc/index.rst
>> but you'd know better than I would where to put it.
>>
>>
> 
> There is a fix posted for this:
> 
> https://lore.kernel.org/all/20250528054146.2658537-2-me@brighamcampbell.com/

Yes. I am planning to send it as a fix patch in earliest rc for 6.16.

Maddy

> 
> Just a small matter of someone merging it...
> 

