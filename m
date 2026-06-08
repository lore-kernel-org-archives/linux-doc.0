Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10DB39184E
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904267; cv=none; b=X7q6eMh4VFfxxsqOr+t3Gd+chKGj2QXv4JxovEi2o/lVuM+p1OHmXhW7Y/SnT05r55Tr4zh6LPaxisbvX6JgvOsc6Ak/xzt3XZ6KHNro2K2/QW9flqJ9j5D0VIyWU58KyJu8QX3Y9WPlvEl72e66CrdOlkmjIxN5WDmtyZemH/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904267; c=relaxed/simple;
	bh=Wsy3SV/x9gKjvdWcQFrp0CjrpEuT+cadsrsidaj4rB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aOD76XKsycz1nYrackwjXS/QI8yazh3qVu28j4sJz+KhQOnyTzNesYl392i2Yg0/xgquXTvboAXxZpwzKdIRYaQTfyRo587oIwcf5+7u4MHPUSmbdcC71dKQn+1QrW++ZJTY+YckRk9vCNz9yDw6deuCB5nCH/XyY88BCd0mvJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ak6sWILD; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ak6sWILD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780904262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wsy3SV/x9gKjvdWcQFrp0CjrpEuT+cadsrsidaj4rB8=;
	b=Ak6sWILDDx3J0D1mzuDOxeWn8ejkSI2YgDmzlNwy111F3FOcKNLITeLI7L5RS1mV3wHKKH
	SHYDnc4PExJJNYS6SWRZhJdtTLt84QeGYdYHR1KHKTSLnWprM08aXIk2QqdHZTt966lXoa
	/UgQul8jmc07M9P9KRQQLPUc+HzmVqs=
From: Lance Yang <lance.yang@linux.dev>
To: npache@redhat.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	aarcange@redhat.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	byungchul@sk.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jack@suse.cz,
	jackmanb@google.com,
	jannh@google.com,
	jglisse@google.com,
	joshua.hahnjy@gmail.com,
	kas@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	ljs@kernel.org,
	mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com,
	mhiramat@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	pfalcato@suse.de,
	rakie.kim@sk.com,
	raquini@redhat.com,
	rdunlap@infradead.org,
	richard.weiyang@gmail.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shivankg@amd.com,
	sunnanyong@huawei.com,
	surenb@google.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.de,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	vishal.moola@gmail.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org,
	willy@infradead.org,
	yang@os.amperecomputing.com,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	zokeefe@google.com,
	usama.arif@linux.dev
Subject: Re: [PATCH mm-unstable v19 12/14] mm/khugepaged: avoid unnecessary mTHP collapse attempts
Date: Mon,  8 Jun 2026 15:36:49 +0800
Message-Id: <20260608073649.99133-1-lance.yang@linux.dev>
In-Reply-To: <20260605161422.213817-13-npache@redhat.com>
References: <20260605161422.213817-13-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Fri, Jun 05, 2026 at 10:14:19AM -0600, Nico Pache wrote:
>There are cases where, if an attempted collapse fails, all subsequent
>orders are guaranteed to also fail. Avoid these collapse attempts by
>bailing out early.
>
>Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
>Acked-by: Usama Arif <usama.arif@linux.dev>
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Signed-off-by: Nico Pache <npache@redhat.com>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
