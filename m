Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000836;
	b=PUM6KJ2l9qDU4ec1jpXRFTcpHzErx8u09OME6luzWjN0Ra2pS2h/HKV01kuP06Tk/2+T
	 9kHtxoDB4eCU4Ads3+3VLka6TUQ/hMwXV5tP+BY7yEpA3Yg/9v8ihtwteW5183M5FlkUB
	 VCea8C4i9zz5kSG5Hnngff9CEYMbdpb1o2Ma5e7XatZMZflScu6IFTW6/4ckMg5x+o3jk
	 bsrMPlmhd10SQ55GqLwJiDjKvvainh97IEEc9n9U317HIC8aW4SY9ziYEMc8wd2jGEJVg
	 hM3gNNF3WEHRU1Q66s7Q3MJvZEXapyOErgYhtyeSdFpy40YVsUrykvLFgIZT2b9N6Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000836;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:X-CID-META:
	 X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=efvClWXmzSCJ2hWGmB2r4EDae9BDwVMUS1T+/Zenuoc=;
	b=L/vVyJNsEHrqtNsRA/ZvrdB92QjfDZxk36an/Ij4ey/2wNGwY5kbHuaR2/TTF26FaUTJ
	 TFQXTwZBWKC4uER0ra65H4D5/WvJiplDTrEMXh2NvoJaq7FSrNlYGXpyD8uwpLN5PX1aV
	 zH6NBftEqAGbZDE6qeH1dAcTsBAk78lk63a3dYwnNhtyjI2OUeg+bRu6o0qR1KqvrwAV2
	 UmpJBNJuINWplb/fVizrNHoupyAmCbq9AnKYlK0sB4Rpdya+qVFKkgh1FAenw3x+1QGRY
	 +zPNc+HKf4U780iL7ynuebmXIiP9w3Wk4fgFGnmFakAlFoipNj6lkOiBmi83w6SSJ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882B606A327
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 07:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E882B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6fbdeb0cd11111f19a56ed5b684f684d-20261026
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:aa9a0a8f-2a65-4209-83bf-e5d80d96e8ee,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.19,REQID:aa9a0a8f-2a65-4209-83bf-e5d80d96e8ee,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:7db8b62,CLOUDID:4a10ed235e5d1ca5ec8e33e3e9b6f124,BulkI
	D:261024181021U0XYGX9T,BulkQuantity:4,SF:17|19|64|66|78|80|81|82|83|102|12
	7|841|865|898,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil
	,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6fbdeb0cd11111f19a56ed5b684f684d-20261026
X-User: lienze@kylinos.cn
Received: from [192.168.111.179] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 654595180; Mon, 26 Oct 2026 15:47:04 +0800
Message-ID: <dd64df01-da75-483e-92f1-8a19a995f610@kylinos.cn>
Date: Mon, 26 Oct 2026 15:47:01 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: hugetlbpage.rst: clarify HugePages_Total in
 hugetlbpage.rst
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
References: <20261023100859.70744-1-lienze@kylinos.cn>
 <1792998249167036.77.seg@mailgw.kylinos.cn>
Content-Language: en-US
From: Enze Li <lienze@kylinos.cn>
In-Reply-To: <1792998249167036.77.seg@mailgw.kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Daniel,

Thanks for the careful review and for building the docs.

On 10/25/26 9:25 PM, Daniel Pereira wrote:
> On Fri, Oct 23, 2026, Enze Li wrote:
>> HugePages_Total
>> - is the size of the pool of huge pages.
>> + is the number of persistent huge pages of the default size
>> + in the pool. Pools of other huge page sizes are not shown
>> + here; see ``/sys/kernel/mm/hugepages`` described below.
> 
> Hi Enze,
> 
> Thanks for this, the current wording is indeed confusing. I checked the
> new text against mm/hugetlb.c and have two comments.
> 
> 1) "persistent" is not accurate. hugetlb_report_meminfo() prints
> h->nr_huge_pages for the default hstate, and that counter includes
> the surplus pages: alloc_surplus_hugetlb_folio() accounts the new
> folio in nr_huge_pages and bumps surplus_huge_pages in the same lock
> cycle (persistent_huge_pages() is defined as the difference). The
> HugePages_Surp entry just below already says that surplus pages are
> "in the pool above the value in /proc/sys/vm/nr_hugepages". So with
> overcommit in use, HugePages_Total can be larger than nr_hugepages,
> and describing it as the number of persistent pages would be wrong.

Good catch on "persistent" -- I forgot nr_huge_pages includes surplus pages.

> 
> 2) "Pools of other huge page sizes are not shown here" is not quite
> right either. The Hugetlb: line, a few entries below, accounts for
> pages of all sizes (as a total in kB) and already points to
> /sys/kernel/mm/hugepages. What is missing is only the per-size
> count.

On "here": I only meant the HugePages_Total line itself, which only
prints the default hstate's count, but I agree "here" reads as the
whole /proc/meminfo output and clashes with the Hugetlb line.  Your
wording is more accurate.

> 
> Something like this would fix the confusion and stay accurate:
> 
> HugePages_Total
> is the number of huge pages of the default size in the pool,
> both persistent and surplus. Counts for the other huge page
> sizes are available in ``/sys/kernel/mm/hugepages`` (described
> below).

I'll send a v2 using your wording and add your Suggested-by tag.

Best regards,
Enze

> 
> I built the admin-guide/mm documentation with your patch applied and it
> adds no new warnings, so my comments are only about the wording.
> 
> Thanks,
> Daniel
> 
> 
> Em sex., 23 de out. de 2026 às 07:10, Enze Li <lienze@kylinos.cn> escreveu:
>>
>> "the size of the pool of huge pages" confused me, since it sounds
>> like a size in bytes.  It's actually the number of persistent huge
>> pages of the default size, and pools of other sizes aren't shown
>> here at all.  Reword it and point to /sys/kernel/mm/hugepages for
>> those.
>>
>> Signed-off-by: Enze Li <lienze@kylinos.cn>
>> ---
>>  Documentation/admin-guide/mm/hugetlbpage.rst | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
>> index 2075f1f14a42..01fa9f61c9a9 100644
>> --- a/Documentation/admin-guide/mm/hugetlbpage.rst
>> +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
>> @@ -43,7 +43,9 @@ The output of ``cat /proc/meminfo`` will include lines like::
>>  where:
>>
>>  HugePages_Total
>> -       is the size of the pool of huge pages.
>> +       is the number of persistent huge pages of the default size
>> +       in the pool.  Pools of other huge page sizes are not shown
>> +       here; see ``/sys/kernel/mm/hugepages`` described below.
>>  HugePages_Free
>>         is the number of huge pages in the pool that are not yet
>>          allocated.
>>
>> base-commit: 3fdcce698abd9193752ee89fb1a440cdceb1b74a
>> --
>> 2.56.0
>>
>>

