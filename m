Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9C45DF72;
	Wed,  5 Aug 2026 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931866; cv=none; b=RqnBINrUcoQx4lkndsgw7iyZCijz/3rJX7AiNqcnYmi5vY/EuVQSwGgnEuupFIlF7KJS/Np2x3rQKy5KjmjZvvl/MrOZBd4bOhDjpKtUxappgsuMLIZv+FxFPt1U98FGwkPQkeDLmEFi0avPrfthqKzya/IEf8mxld1oJwpVGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931866; c=relaxed/simple;
	bh=twU09U2AXTt9eiOrS6G8pM0oe6puFH+tRx3kgXAZoA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pntSpNPJ9HvVea0DYXqhn+eqar4uUWVHFJirHVthdgaomYAwh2XdN3p6i/O9GQoKEVe6n50c0vBvv7XweOi2vHuMNkQnVYb/sih4VxB8EDfYhfTfC0vzXzuFGEn++zb3wb8XzXmi7IHsryQg7PPohWQK7gqY84LIL6yxFaN9qvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VUDpLX64; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VUDpLX64"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758ll9Y3437976;
	Wed, 5 Aug 2026 12:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BqHqdw
	w3sXV6f7AVmsbr9tVU51GCfsbqYBpfBXOVkus=; b=VUDpLX64E5rVOLl0NYAsxm
	xo2rin7qQ+P13h9wZEiIwBMaPSxhBWOBwLxBJnraWqPwyp4UBb+0fOoziX42ztC+
	63JZIMHSUpxe0FKU0aCCYiOuW7f07bK6o4XCNsrBfSUZ6Xmp7EU02U+HffxIHmkK
	2VllCIVKl2nVtfXhPjqE2ua0MZ02knyQ/nHqmn1yyJT77fP5KFsRA3kVQVXvofPH
	U9gyTIREG307OVGtlZLRvayuCaX0/kCFopHJ/sr7EDjfGT7f4M9KzKSpN+VPH8KL
	zQN8/vh2H8kRdPLJYu5KNHoiAtnv7gtkFBX7EwquKocMrIXegrUF3ibEXkU5TzRA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8eutc0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 12:10:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 675Buq6P029059;
	Wed, 5 Aug 2026 12:10:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsv4k6e4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 12:10:52 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 675CAo3P28967324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Aug 2026 12:10:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A24B820040;
	Wed,  5 Aug 2026 12:10:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDEDF20043;
	Wed,  5 Aug 2026 12:10:44 +0000 (GMT)
Received: from [9.39.28.63] (unknown [9.39.28.63])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2026 12:10:44 +0000 (GMT)
Message-ID: <cd4891d5-a152-43b2-9c41-aaa2c0524476@linux.ibm.com>
Date: Wed, 5 Aug 2026 17:40:43 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] Documentation: kdump: Add arm64 and ppc64le to
 encrypted dump target support list
To: Coiby Xu <coiby.xu@gmail.com>, kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>,
        Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Jonathan Corbet
 <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Coiby Xu <coxu@redhat.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260729033654.311541-1-coiby.xu@gmail.com>
 <20260729033654.311541-11-coiby.xu@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260729033654.311541-11-coiby.xu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 7sg6_N6dz0gktGsG-RLv3e0JCykR5YHh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA5NCBTYWx0ZWRfX5tTZENXKirIN
 n9UoJZOoexg7jPdhcdQBnwLi3/g4mrGG5wCsA8uKeXrNPar4Bc2iSSDhki/gWx8XyOg3QhrEjWc
 Qm4pCAIbqN+zT8WltUdn1lJ+M4gKcaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA5NCBTYWx0ZWRfXwlSWzVwVxSsZ
 +Vw1TIGCujNkm3mxYOId9Km1vIEDA5VPzFkJEELk+keCL75jFmeOlh5QR5F6g5ZXNVZqzEKVj34
 J9xdvsEJ/J3jmuabZO0A1gBSdkRI1iDQpWOHfg/RYZ2V+g/q6tlA7UzFnFI/TcmgidFfBy9lpd6
 C26Zoz/hZKlG+peK8yC6MRhDGHRojSVWC4UcYazioxv0vlT0DooIkUXWd2FwiawmONIA2PLXyhB
 Rg3Sw0qckPazb6RHtuL3xEFdGhsBs5bG1qlpPALRaA2kknqz8pME+bSg3CUAvKIH+c0LoFw6tZk
 QwhUq1XT9yNRZLi35YrFirTTEak4fpllbfy85zYOTNVTJ3gJsyfQqzrapSfx8FcjhvTpOU8Fnqv
 eFkkaL5WMcYWDd+gDPvL0gq4rq7SGOxtLNlLpbC2q2xIArZVkCow5HJ7Yn7aQVGEW8QWDjHkA4a
 cmyJnh+6vPZeVXQShCA==
X-Proofpoint-GUID: z_1zROsg1DSoDR64Q4VoBX_5XebgOPLf
X-Authority-Analysis: v=2.4 cv=KfzidwYD c=1 sm=1 tr=0 ts=6a73284d cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=UuZe5U_PLi2WEnV2vBkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050094



On 29/07/26 09:06, Coiby Xu wrote:
> The encrypted dump target support is now extended to arm64 and ppc64le.
>
> Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>   Documentation/admin-guide/kdump/kdump.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
> index 0bf2eb100a05..36ad6125c670 100644
> --- a/Documentation/admin-guide/kdump/kdump.rst
> +++ b/Documentation/admin-guide/kdump/kdump.rst
> @@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
>   ============================================
>   
>   CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
> -encrypted disk volume (only x86_64 supported for now). User space can interact
> -with /sys/kernel/config/crash_dm_crypt_keys for setup,
> +encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
> +space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,
>   
>   1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>       # Add key #1

Changes look good to me. Feel free to add.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
