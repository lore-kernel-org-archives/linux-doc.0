Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65061EB5CE;
	Sat, 15 Aug 2026 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786784338; cv=none; b=MddmRxKP7fvLOCMar1Wmck0NDu8f8DhvKXTol4Aqglu3BxelZLcUQNCuwhm6IUZU4PJoe9Vx/Lwx1R5nFKFVlQqoV9zB1csOxvAX5AiYHzt26VpFoMjwqkTSSC6k1oQbrl/g/x4zCQIjgTGwyoK51Hi9JRiZVPzCI2ZXBTBs5I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786784338; c=relaxed/simple;
	bh=F681/FzbWWNhZsGn8SvtDmNcSWxLtiuVy43WjqvDpHw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SttyU/CNXmOKxJ7cuVlyjahy4XJbPfJAl50iYEYW1C10R0mcnASRtEopIxVS2SSCwxVGtRUW/i31Jwk2AzXorY15Qgt2lPa06LkQvr2csh2zknw6ucKdQYIrmUO5bzAVAGEtwJWrDwr6BZlIcTvf872O67YZoY0ZtEH+ntQ7P54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8757a842988711f19a56ed5b684f684d-20260815
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP
	SRC_LOWREP, DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:81c10f86-3d18-4866-af93-38883b8493ee,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:81c10f86-3d18-4866-af93-38883b8493ee,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:6f1d16ba5c230bba9e9d4b1eaa0da848,BulkI
	D:260812164107VZ003DXX,BulkQuantity:8,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil,RT:nil
	,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8757a842988711f19a56ed5b684f684d-20260815
X-User: husong@kylinos.cn
Received: from [192.168.1.116] [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 603180630; Sat, 15 Aug 2026 16:58:48 +0800
Message-ID: <2e5a06b1-1a27-4bfa-8a7b-57121d5f5025@kylinos.cn>
Date: Sat, 15 Aug 2026 16:58:45 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: husong@kylinos.cn, linux-mm@kvack.org, akpm@linux-foundation.org,
 david@kernel.org, ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, usama.arif@linux.dev, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Docs/mm: fix THP policy counts in transhuge
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
References: <20260812080313.330413-1-husong@kylinos.cn>
 <20260812080313.330413-3-husong@kylinos.cn> <anw8ASKdPWW9v86d@lucifer>
 <6e4aae7b-2c71-4109-945c-6481efde3636@linux.alibaba.com>
From: Song Hu <husong@kylinos.cn>
In-Reply-To: <6e4aae7b-2c71-4109-945c-6481efde3636@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/12 18:52, Baolin Wang 写道:
> 
> 
> On 8/12/26 5:27 PM, Lorenzo Stoakes (ARM) wrote:
>> On Wed, Aug 12, 2026 at 04:03:13PM +0800, Song Hu wrote:
>>> transhuge.rst claims seven policies for transparent_hugepage_shmem= and
>>> four for transparent_hugepage_tmpfs=.  Both boot parameters are parsed by
>>> shmem_parse_huge(), which accepts six: always, within_size, advise, never,
>>> deny and force.  The "four" applies only to the per-mount huge= option
>>> (shmem_param_enums_huge).  Fix both counts to six.
>>>
>>> Signed-off-by: Song Hu <husong@kylinos.cn>
>>> ---
>>>   Documentation/admin-guide/mm/transhuge.rst | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
>>> index b187d618452f..72e944f49da5 100644
>>> --- a/Documentation/admin-guide/mm/transhuge.rst
>>> +++ b/Documentation/admin-guide/mm/transhuge.rst
>>> @@ -389,14 +389,14 @@ is not defined within a valid ``thp_anon``, its policy will default to
>>>   Similarly to ``transparent_hugepage``, you can control the hugepage
>>>   allocation policy for the internal shmem mount by using the kernel parameter
>>>   ``transparent_hugepage_shmem=<policy>``, where ``<policy>`` is one of the
>>> -seven valid policies for shmem (``always``, ``within_size``, ``advise``,
>>> +six valid policies for shmem (``always``, ``within_size``, ``advise``,
>>>   ``never``, ``deny``, and ``force``).
>>
>> I'm not sure we really want to advertise 'special' testing modes like this,
>> sorry. These are not modes anybody should be using in practice especially at
>> kernel boot. We should probably stop people doing that...!
> 
> Yes, 'deny' and 'force' are testing-only configurations and really shouldn't be exposed via the kernel command line. I'll clean them up.
Hi, Baolin, Lorenzo

Thanks for the reviews.

OK, dropping 1/2.

2/2 is wrong too, the tmpfs count was correct as written, and the shmem
part is better sorted out by Baolin's cleanup of the deny/force boot
param exposure.  Withdrawing the whole series.

Thanks,
Song
