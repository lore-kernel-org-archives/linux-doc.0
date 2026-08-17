Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B794728726E
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 03:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786936394; cv=none; b=LilIKHOdtjTdLdGkNYAZrogKM62A+siM5ax/9jmlfVUP1kVQTulzcz7Ucsgyx71yL/xyqaMYUwxPadN5/Ufmcqcftnxo6POMmEKBdLStEC67F752chtViJ4uwjWRVaZOoaVxXkOD352mbTLH/+MWsMMnrURJkNToylvvKP2dISw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786936394; c=relaxed/simple;
	bh=K9RrHuj78e6lhHBp+QLxG7+9nsHjR2YVpw4rBWkmnUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rj9OPh2rjOMtAK4Fff2iU6Peq3ZOoNjM06MRVOxFAdvM9DAJaEu7jK1DSqSa3Mrd45sjNl5IIKaOl9JMIM4KCNyn6kDJi7YpTJu6aUAeUEgbYxXBg088UJnASgiUYT4zT7ZkkN/C6VZ77QWwHKtUId2S9u3BJdNXnOephvY967U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=nOv0PWhk; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="nOv0PWhk"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2m2gkFnEIMedh4SD2cdL9BF+Y+jc08sxrvLi8/Eepho=;
	b=nOv0PWhkS5CZro9o5eu4i4FZs0VQ3eCZGJDSQDGkZORH/3rp2j9GpueqJpr/QjtRQUQJEWPe7
	EosiAhoILjeCBf0vepfTBWtcscZeq8UlL/n9PllBdmv5o2gOCATMmyZO6m55fFS2/mFhi9vsOZw
	/uLEvwnBPKpRu2wcIS5V3JI=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hNd0v02tDzRhVJ;
	Mon, 17 Aug 2026 11:02:23 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 1AFBC40538;
	Mon, 17 Aug 2026 11:13:01 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 11:12:59 +0800
Message-ID: <4b9293fc-82d1-4776-81d6-d7463439c1ae@huawei.com>
Date: Mon, 17 Aug 2026 11:12:58 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] docs/ksm: fix advisor documentation and comment
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <liam@infradead.org>, <vbabka@kernel.org>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <shr@devkernel.io>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>
References: <20260813031722.569983-1-tujinjiang@huawei.com>
 <an3VdkvUvLapWzmw@lucifer>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <an3VdkvUvLapWzmw@lucifer>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/8/13 22:35, Lorenzo Stoakes (ARM) 写道:
> This is a very bare cover letter...

I updated it:

This series fixes two problems left in the KSM advisor documentation
and code comment:
  - Patch 1 fixes two typos in sysfs knob names ("adivsor_max_cpu" and
    "adivsor_max_pages_to_scan") in ksm.rst that don't match the actual
   knob names.
  - Patch 2 fixes the description of advisor_min_pages_to_scan: it is
    described as the lower limit of pages_to_scan, but is actually only
    used as it's initial value, and the runtime pages_to_scan can drop
    below advisor_min_pages_to_scan.

