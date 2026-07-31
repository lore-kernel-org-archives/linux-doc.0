Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422F30C158
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489740; cv=none; b=pmrjkjCUdGh415lP9V9UtyuV7F2MUrbMqxs6+WMsbdww0Z+xOm6LtzAyvc/w4LyiqgIpvk5o0aUHrYfO+Cyk6zLZROWRxA7bXlKQyGYnAyE6TO71GJZbAOUOKByS2regxs1Tjv+24jrT7Jv/J81670D9UhLOqPO/uQtF43m5kR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489740; c=relaxed/simple;
	bh=qSlvGHWZWW6/evFQX46IFv/qhBgxIsSaU658wg0MkhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LY3OHTtjOD/1IMyXaAXQ2+k+R/G6Mate+ij/g2FXBYyFyKLkdRk57Xns0sJdXyNye2XkdZRIYUmRDHvYHd0fskSEr0BrVas4VACF41r2Ndb93IXznAxPHMPBvnCTUPbsJPwUBOOd8UvX8JMhpKccAl91Q86BBYXt3TO3+dw0I64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RIWeVDZc; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RIWeVDZc"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qSlvGHWZWW6/evFQX46IFv/qhBgxIsSaU658wg0MkhI=;
	b=RIWeVDZcfB7QcN/KVhMXS/D58bsGhcwqHHUos29pJKtdQ+2xciBgLqJb3SjJIR9Lo14rrLvZY
	claWtnADQERFYXshOkHkfovEADJyWSbfCKgBa1p14K97Nw1FAhU1UpfalU10KaNcrpgI0XuiTUP
	k2PKsWpP9+CrsNJ4itQuW5Q=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hBL235H6jz12LDV;
	Fri, 31 Jul 2026 17:12:43 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 739274058C;
	Fri, 31 Jul 2026 17:22:12 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 31 Jul
 2026 17:22:11 +0800
Message-ID: <f1f5c486-f14c-44ad-8285-a9df437f7974@huawei.com>
Date: Fri, 31 Jul 2026 17:22:10 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: ksm: fix typos in sysfs knob names
To: "David Hildenbrand (Arm)" <david@kernel.org>, <akpm@linux-foundation.org>,
	<xu.xin16@zte.com.cn>, <chengming.zhou@linux.dev>, <ljs@kernel.org>,
	<liam@infradead.org>, <vbabka@kernel.org>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <shr@devkernel.io>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
References: <20260731083526.3953421-1-tujinjiang@huawei.com>
 <20260731083526.3953421-2-tujinjiang@huawei.com>
 <d9236dc0-3332-4fab-aa26-e74d10ad0cda@kernel.org>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <d9236dc0-3332-4fab-aa26-e74d10ad0cda@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/7/31 17:11, David Hildenbrand (Arm) 写道:
> On 7/31/26 10:35, Jinjiang Tu wrote:
>> The sysfs knob names in mm/ksm.c are "advisor_max_cpu" and
>> "advisor_max_pages_to_scan", but the ksm.rst documentation spelled
>> both as "adivsor_*", fix the two typos.
>>
>> Fixes: 0710f38ad26a ("mm/ksm: document ksm advisor and its sysfs knobs")
> I'm not sure on fixes tags for documentation stuff.

git log --grep "Fixes" Documentation/

Many commits in Documentation have fix tag.
I think both are ok, since documentation changes are needed to backport.

> Change itself LGTM
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>
