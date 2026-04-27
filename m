Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2851721D3F5
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305484; cv=none; b=g6qxDW4gBC+Eqp43gJQXnea4xPshsP6NOf28Ut6DtvmMsBm9irWFIDM+A/BZaVt+u3WhSzLbirwVE3H85m2KO3VXW4vaqo1I1hjhYJffz8EOP217Wjkl9bYLkmMbw0501Bd4+8JOzy/U6JQuLVH+HBIlFE+3SWblM9zQyQDso6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305484; c=relaxed/simple;
	bh=WNcCv2dYJaAVCb27nOY+hxf7Ohx8wEqh/8daXbYI+Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RukD7ibJ33PYHsdLD/qaXuddNVwHOqNFjlkzAolUuvhdGWuX69l3JX2c3o6BJ1JxgyYbaDLx0ydZiGoCIeD1fPgpo0HVk87Ni9+dACFNjZ05gEaZDZQqyYJ8gknX1G5smCtjKTHfxf7sTeCnhFim9JmBT8u513RwQy+2y5hyrOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xLewC43e; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xLewC43e"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777305480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDtbus8CxHrwyQM3OMQxzeKwt9hPmc6cbwSAuU/oDr8=;
	b=xLewC43eXTp7cTNuezMPBEADJ3J7iL+BrYFniYehOCZGgKBxD6ZhQZp07xLW6DCG+UmilV
	IOkePLTdKPAeFsDUqJWTK6ciN34NHPccn51FnevfhPh34nyCSvwRY+ENY2bUVVvl6mVJTS
	i788J1u1a8TuefrI+2Erz7vnZpZ6rU0=
From: Lance Yang <lance.yang@linux.dev>
To: leitao@debian.org
Cc: linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v5 1/4] mm/memory-failure: report MF_MSG_KERNEL for reserved pages
Date: Mon, 27 Apr 2026 23:57:39 +0800
Message-Id: <20260427155739.1643-1-lance.yang@linux.dev>
In-Reply-To: <20260427123330.92847-1-lance.yang@linux.dev>
References: <20260427123330.92847-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Mon, Apr 27, 2026 at 08:33:30PM +0800, Lance Yang wrote:
>
>On Fri, Apr 24, 2026 at 05:23:59AM -0700, Breno Leitao wrote:
>>When get_hwpoison_page() returns a negative value, distinguish
>>reserved pages from other failure cases by reporting MF_MSG_KERNEL
>>instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
>>and should be classified accordingly for proper handling.
>>
>>Acked-by: Miaohe Lin <linmiaohe@huawei.com>
>>Signed-off-by: Breno Leitao <leitao@debian.org>
>>---
>> mm/memory-failure.c | 11 ++++++++++-
>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>
>>diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>>index ee42d43613097..7b67e43dafbd1 100644
>>--- a/mm/memory-failure.c
>>+++ b/mm/memory-failure.c
>>@@ -2432,7 +2432,16 @@ int memory_failure(unsigned long pfn, int flags)
>> 		}
>> 		goto unlock_mutex;
>> 	} else if (res < 0) {
>>-		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
>>+		/*
>>+		 * PageReserved is stable here: reserved pages have
>>+		 * PG_reserved set at boot or by drivers and are never
>>+		 * freed through the page allocator.
>>+		 */
>
>Not necessarily. PG_reserved is not a permanent lifetime property for
>every page that has carried it.
>
>page-flags.h says early reserved pages may later have PG_reserved
>cleared and then be given to the page allocator :)
>
>At least some drivers also clear PG_reserved when releasing pages they
>marked reserved.
>
>Would it be clearer to say that pages with PG_reserved set are not
>currently managed by the page allocator, rather than saying reserved
>pages are never freed through the page allocator?
>
>Otherwise, LGTM.

Ouch, I missed one more thing ...

Sashiko pointed out that[1]

> +		if (PageReserved(p))

"Can this introduce a use-after-free risk on the struct page?"

get_any_page() may put the page before returning -EIO. After that ref is
dropped, PageReserved(p) is not safe, IIUC :(

Maybe just cache it before the call?

is_reserved = PageReserved(p);
res = get_hwpoison_page(p, flags);

[1] https://sashiko.dev/#/patchset/20260424-ecc_panic-v5-0-a35f4b50425c@debian.org
