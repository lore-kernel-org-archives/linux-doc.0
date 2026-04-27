Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A1132F770;
	Mon, 27 Apr 2026 02:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257907; cv=none; b=k2SxPVT3j3NT/z6Hcol7F6xTau72bcr0EImn0cM5AQ+IFqxBxhw0vr7N2eqfTQvpwGOXZ1yzvJ10r5TU91dumfTCpMG1JA1JQngJhKJNpEaNBr06wQ2fG9P+FwFfgB35hztJN/6n0GA7lZvMA4tNkY8k4F14C0US2IgtfZ1GvNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257907; c=relaxed/simple;
	bh=8Uok67MP7EbWJODR59a3+L/ftclFTn41JLRc2Kz179Q=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=avuvZrG0W074HVgMNKZfQ9GDJm1m1ZZVQVMglt+JVYr0c4yFS8ZDrD8vjRCLCbQnIMAdM88bwaaSfzWYkAwfuv0ol+H1000GwTAHXNRTxft07bk/kPLKTw6sjJfEbGIGlrt4npzb6O9bzGcYUxz6jxSJeqcIAc37pjW5l5a0t1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=JaDKlWAX; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="JaDKlWAX"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XYl/EI6HUrKkXy66gKXetGu+BfOANz47rhqED+fRSzU=;
	b=JaDKlWAXp2AGsZ7JdIIvish4dDgPf+AXd1JZpzMRqxq/L1qudEp1YvSy+qdvVuWRLUSCuVDyG
	oiCEAOP/DnqWFtEsI4kZCdzKyMLTvJnUmqY/93+ZbK3BGpjQurWOBw/iZ3JHcmp0bWUxjt8aKgt
	Hm/B1QmUY2za+ndqvD6ISxQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4g3nn31XhpzRhR4;
	Mon, 27 Apr 2026 10:38:31 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id A905540569;
	Mon, 27 Apr 2026 10:44:56 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 27 Apr 2026 10:44:56 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 27 Apr 2026 10:44:55 +0800
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
 <c1517ad3-91d1-2ea1-efa7-0f29415d513d@huawei.com>
 <aeta8Ifvmqi6-E8w@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <5e05384e-740e-b374-2370-01f96d1dac9f@huawei.com>
Date: Mon, 27 Apr 2026 10:44:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aeta8Ifvmqi6-E8w@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/24 20:01, Breno Leitao wrote:
> On Thu, Apr 23, 2026 at 10:38:19AM +0800, Miaohe Lin wrote:
>>> are you suggesting I drop MF_MSG_KERNEL_HIGH_ORDER from here, or, document this
>>> will not hit userspace pages?
>>
>> No, maybe we should rule out or document above rare case if I'm not miss something.
> 
> Good catch. A buddy page being concurrently allocated to userspace can
> briefly satisfy get_hwpoison_page() == 0 && !is_free_buddy_page(), and
> that page is recoverable via the standard SIGBUS path — panicking on
> it would be wrong.
> 
> The page allocator can't filter it out either.
> 
> check_new_pages() is gated by is_check_pages_enabled() and is a no-op
> when CONFIG_DEBUG_VM=n.
> 
> For v6 I'll try to rule out the race inside panic_on_unrecoverable_mf() so
> action_result() stays unchanged:
> 
> 	case MF_MSG_KERNEL_HIGH_ORDER:
> 	p = pfn_to_online_page(pfn);
> 	if (!p)
> 		return true;
> 	cpu_relax();
> 	return page_count(p) == 0 &&
> 		!PageLRU(p) &&
> 		!page_mapped(p) &&
> 		!page_folio(p)->mapping &&
> 		!is_free_buddy_page(p);
> 
> 
> A buddy page being allocated must transit rmqueue() → prep_new_page() →
> post_alloc_hook() before the caller can use it. Each step either bumps
> _refcount or sets state we can observe (PageLRU, ->mapping). cpu_relax()
> lets that remote-CPU progress become visible before we resample.
> 
> A genuine non-buddy high-order kernel tail page stays unowned across the
> recheck, so the panic still fires on the case this series targets.
> 
> The window is much narrowed now, not eliminated — I'll say so in the changelog.
> 
> I also added a selftest that enables the sysctl, injects MADV_HWPOISON
> on a userspace anon page in a forked child, and asserts SIGBUS (not a
> panic). I've been running this in a loop for hours, and I haven't seen any
> false positive.

The userspace anon pages are already allocated. Those pages are in a stable state.
So your selftest cannot test above window. Or am I miss something?

Thanks.
.
