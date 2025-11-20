Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587022D9ED0
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763619129; cv=none; b=SZ/snFbICohow/0ULOPsZnO/LijulbZdT2UOgcbtZhobW+W1NtfVwOEOBR5CIH82/RzsSkia8OC6YHA8QWas50zCzBGESKV9AwbS0Bo407PWlR6SAvuQvCrll4CzJOkwNNOdPqJu1z8bd5tZu10Bde2EzXvwgPLJRw2p/9qVjKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763619129; c=relaxed/simple;
	bh=pyDm/WPAmz9Flk6qnMK5lVHCOsLKwooTzGtOd8kQ9ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KcdOvrOfrKI55e+sM9ndnlqfb8HkHOrST/6qYz60k/X6BKCUWLgBtIMYktIB3F1yLjGag8v0M7GfmlPcNqt7yMrtC7hkFwY1y3r+KGst62zfhx8bv5bSNW9Qfi0w+t3blflaesLLs4ta1VbbjWPhfKMj4HnvKW/+mLe+YBpHZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ixJRlqmY; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ixJRlqmY"
Message-ID: <91396181-1813-4ea1-a081-06f97e703be3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763619111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eh3iY/0Dx1yebP0GWfJ20Z3mrY3JQYu3VbYsy5OeNlA=;
	b=ixJRlqmYUW1hPKe2xcV+KHpM+JSSHkyJfk9zszG6yWhPbjZfGTICW8vMWpGZI9vjz+FI/R
	ALPqYtWd8htC60MUwW3NmoaHhXYj36vA+J8x3dEhu8jATndgvAxM14mSzfekV2fsaocrvx
	Gu2ajojAgC+vbqu80mUjxZIOhc0a5O8=
Date: Thu, 20 Nov 2025 14:11:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/9] mm: add atomic VMA flags and set VM_MAYBE_GUARD as
 such
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@redhat.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Andrei Vagin <avagin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
References: <cover.1763460113.git.lorenzo.stoakes@oracle.com>
 <97e57abed09f2663077ed7a36fb8206e243171a9.1763460113.git.lorenzo.stoakes@oracle.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <97e57abed09f2663077ed7a36fb8206e243171a9.1763460113.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/11/18 18:17, Lorenzo Stoakes wrote:
> This patch adds the ability to atomically set VMA flags with only the mmap
> read/VMA read lock held.
> 
> As this could be hugely problematic for VMA flags in general given that
> all other accesses are non-atomic and serialised by the mmap/VMA locks, we
> implement this with a strict allow-list - that is, only designated flags
> are allowed to do this.
> 
> We make VM_MAYBE_GUARD one of these flags.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---

LGTM! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
