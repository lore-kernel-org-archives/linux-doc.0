Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355B92580CF;
	Fri, 10 Jul 2026 04:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783657770; cv=none; b=YrLBli2eSwJM6C8428CSuqW+gSBTHluUjsCD3HqbxcEVtzhVCYVaH+71rxlou7QGFvXkRXIruUh3OhXLbK9oB8YqGuCvrpfB+B6CnH3vafaQ+R7IMB09Z9Lhv9qv2Lr2X75IZyYyfw+TLodZuBwtVqPyA2gBu1gvUtPwBMiDIN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783657770; c=relaxed/simple;
	bh=qPGMCaVw4ZAV8vcT8UAmyNEbkfvKqtDKLAyIn+7cQRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nx1o74Ztg8X25n1NGIPnxLaeU4Q0Tb0hZiltcMLSS6bLoymSXsjXZXb3i8lPDvagmfuM5zcLd6fLnPs6JImumVq21XamGwX53kTtwl7CrBGOp7AZch5tvXSkAYhcYtB40CZhu3dg1yheLJm8np2ylN4vxBkxiKo/46+7kyD50vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kB/jRAY9; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kB/jRAY9"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3o8Gs3217281;
	Fri, 10 Jul 2026 04:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Glp4ab
	zs2otteQYvDF5xWC8vSXNgnk5vpEwwDo3cfWE=; b=kB/jRAY93/IuAxhM2t/YAe
	Gi0fIH9M08b7XWuHNOvN8mnBDRSrnnq583JYiFrwA7srJ+sO5LeW3hE6E65uvgj9
	zseuIdT4pPEdZlupwwdFs8uJTZTkdTY75M3UDjJaWhESMyg4GGQPpI1tHxdI6tYf
	BOOEZyYWTKdfP+8Hb/Zt2MznApDPP8jzLayQEKlwL2uHn176wdlvTfSYsBm5bwmS
	o7vNQ1hwtYWYax0Bi9l3U+SCrKhbc8C5kWuGnMIilNGwkMr/Qs+QNpaREpt0XCj6
	jUqMrWHaf/OUuGP3igIA0Ajpgn1w3Z9owD85x74rhwrybn4n5P/DulPBzdIX703Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6stt55cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 04:29:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66A4Ja6L005459;
	Fri, 10 Jul 2026 04:29:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7f6yg10b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 04:29:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66A4T6wM47579586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 04:29:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EFC620043;
	Fri, 10 Jul 2026 04:29:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E4EA20040;
	Fri, 10 Jul 2026 04:28:59 +0000 (GMT)
Received: from [9.124.216.30] (unknown [9.124.216.30])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jul 2026 04:28:59 +0000 (GMT)
Message-ID: <d1a8acf4-4a37-4d31-8df2-c9dd7e6df1e7@linux.ibm.com>
Date: Fri, 10 Jul 2026 09:58:58 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] virt: Introduce steal monitor driver
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        mingo@kernel.org, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, yury.norov@gmail.com,
        kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net
Cc: tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-9-sshegde@linux.ibm.com>
 <18366430-144e-4d77-bab0-494d7102475a@infradead.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <18366430-144e-4d77-bab0-494d7102475a@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: GMSVA06h1awGrUiMEIZ1OWpmrfjEqV_J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAzNiBTYWx0ZWRfX9xXCiI1oH1Zz
 aq92qfD19sYtWVLDL9cpXWUvbtqGG4fHCILcIqwVE9YyFtsV1QtEwRHod88isk/vKZ3GBKv0m24
 7Zu4HVnMjt4N2NSm4CuLX7ftw5aZeYs=
X-Authority-Analysis: v=2.4 cv=DKW/JSNb c=1 sm=1 tr=0 ts=6a507517 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=PVSof8F86aff1v44Ds4A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: 749SGtLOJY-MpdXNhQ38k27Cqsa3wYw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAzNiBTYWx0ZWRfX30p45vWri5Kn
 ASU9g5GQEjnOsGdLP96OrbRZx363OWeatIxmx8JR+2jEaduYanBbDbWvZ7/LKktnRV0FqSQY/F9
 vSwhxxL4JUzX8ZL3KrQVdx4cenydoYXLvzIeQyINfodtnHwgRHlCWjJ+2j4joT3FL+Wbdq2dHZJ
 0UQVHSu3RMmxjeTYzHClbgbzG2fCS40VKREIos7WrgaU3cSyBhxuOAjjapb1GwLJ1LIFY2lecWy
 kEN6LNDGUE869Q2Lk8GkhOoeKTnHEn3y6GnlJhxtaknbHpMQNgg1KY/1WLkElix9ghrUai5MW5z
 5i05wW9awuVnOPQvcYvJ+FQWfzdGjR6T1NbGkqFclgx2H6zin1tOE6/key7TlfxBmv7jL0X7CSg
 vVDHAY24KnfSk2w7HA3fv3dHoPl2Vxp1QdXfzXV/66JY31AThISieZHURBNvMJeoTix7ZRUh6/f
 hHLe/GLffE4kzrKoKyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100036

Hi Randy, Thanks for taking a look.

On 7/10/26 6:57 AM, Randy Dunlap wrote:
> Hi,
> 
> On 7/9/26 2:56 PM, Shrikanth Hegde wrote:
>> diff --git a/Documentation/driver-api/steal-monitor.rst b/Documentation/driver-api/steal-monitor.rst
>> new file mode 100644
>> index 000000000000..94f4aa1aaa7d
>> --- /dev/null
>> +++ b/Documentation/driver-api/steal-monitor.rst
>> @@ -0,0 +1,111 @@
>> +.. SPDX-License-Identifier: GPL-2.0
> 
> Insert a blank line here, please, to avoid this warning:
> Documentation/driver-api/steal-monitor.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]

Ah, same applies to the first one. Ok thanks. Will fix it in v8

> 
> 
>> +=============
>> +Steal Monitor
>> +=============
>> +
>> +:Author: Shrikanth Hegde
>> +
>> +Introduction
>> +============
> 

