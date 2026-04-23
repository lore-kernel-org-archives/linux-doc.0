Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAC63B9600;
	Thu, 23 Apr 2026 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776911907; cv=none; b=YF58JN1Y0aImrOqlISlA8O5pUP7Ny162dMZOuAhM37wFHr/9MDmtwnWVLsR1Og2hGv6hdUoAJuu10BhwDbPuAAoXmhWEM5meaq99/s7MqJ0k1G8OPDVy+7gFlNEqouIIEtTPuBBH0pmlymxPYxTKFfV6MSeuB/FpCM/UBvyiREM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776911907; c=relaxed/simple;
	bh=G/6FKypuPdLEisAdFE/26qWKf9kWVVBAu4YLwTDrRCA=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=i7JVha/qKsjxEynm2Xf0atSTR3GlvCVprvcm2LrLiy940TT5pjJi7nKcNCVvDthsZShrGcYLK9ZkJxPFVlzI4tvQCgkuorO6qGUNqhPejI5NaOCgLD1TnLefVWqLdl7U6M/6mZ3TEcPwvqYG3+U1MG/SNxb/jp3IJ8QzAeOFiuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=I/pgPLJU; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="I/pgPLJU"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v1ZCldJUqPagrKZUWrG+NboOlQsoZ4g12/Dizpsb8AE=;
	b=I/pgPLJUVDr8KWasTwuUZU4tGrFXkR6KokcAc5AwsCkwoFdu50RjLhjQUQYd1kbHjwGc2y4Rq
	dXEgsDz2ZVIhxJ6y/3fjmq7N9im8PCuGXvYsZRJgUqnK2NRymRTCJtvOA9kLIGeR6bbAxvTCkaq
	gbTZh14/YWX0MOoalvyiWH8=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4g1Kpx3ZntzcZyN;
	Thu, 23 Apr 2026 10:31:37 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id A9C9540576;
	Thu, 23 Apr 2026 10:38:21 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Apr 2026 10:38:21 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Apr 2026 10:38:20 +0800
Subject: Re: [PATCH v4 2/3] mm/memory-failure: add panic option for
 unrecoverable pages
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <20260415-ecc_panic-v4-2-2d0277f8f601@debian.org>
 <6b505601-747a-0812-7544-63a8ab3cffce@huawei.com>
 <aejlg62nxcF_5g2v@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <c1517ad3-91d1-2ea1-efa7-0f29415d513d@huawei.com>
Date: Thu, 23 Apr 2026 10:38:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aejlg62nxcF_5g2v@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/22 23:21, Breno Leitao wrote:
> Hello Miaohe,
> 
> On Wed, Apr 22, 2026 at 11:36:11AM +0800, Miaohe Lin wrote:
>> On 2026/4/15 20:55, Breno Leitao wrote:
>>> Add a sysctl panic_on_unrecoverable_memory_failure that triggers a
>>> kernel panic when memory_failure() encounters pages that cannot be
>>> recovered. This provides a clean crash with useful debug information
>>> rather than allowing silent data corruption.
>>>
>>> The panic is triggered for three categories of unrecoverable failures,
>>> all requiring result == MF_IGNORED:
>>>
>>> - MF_MSG_KERNEL: reserved pages identified via PageReserved.
>>>
>>> - MF_MSG_KERNEL_HIGH_ORDER: pages with refcount 0 that are not in the
>>>   buddy allocator (e.g., tail pages of high-order kernel allocations).
>>>   A TOCTOU race between get_hwpoison_page() and is_free_buddy_page()
>>>   is possible when CONFIG_DEBUG_VM is disabled, since check_new_pages()
>>>   is gated by is_check_pages_enabled() and becomes a no-op. Panicking
>>>   is still correct: the physical memory has a hardware error regardless
>>>   of who allocated the page.
>>
>> What if the page is used by userspace? We can recover from later accessing.
>> Would panic here be overkill?
> 
> A userspace page should not reach the MF_MSG_KERNEL_HIGH_ORDER branch. The
> branch is gated on get_hwpoison_page() == 0, i.e., folio_try_get() observed
> _refcount == 0, and that condition rules out a live userspace mapping, no?

Sorry, I didn't express myself clearly. What I mean is, a buddy page currently
being allocated could reach the MF_MSG_KERNEL_HIGH_ORDER branch. This page might
be allocated to a userspace. In this case, we can recover from later accessing.
But with your patch, panic will be triggered instead.

> 
> are you suggesting I drop MF_MSG_KERNEL_HIGH_ORDER from here, or, document this
> will not hit userspace pages?

No, maybe we should rule out or document above rare case if I'm not miss something.

Thanks.
.
