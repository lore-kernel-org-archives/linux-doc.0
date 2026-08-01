Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFCA2DF68;
	Sat,  1 Aug 2026 00:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542585; cv=none; b=X0Xc1HHsX/hStKUSF2NL/IuGvqez5diZqiJwi2DtElUi24PmLHRfYm/BhDyhb21izTffdkCX2nLEbguEhcqZhJoXFCBRu5WuKetqDMfLwG8+EfskXx+iPpMulbumchP9ApN4NL2mi4Xrs8hY75puTymJGc7rqGErY7B1buxUFzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542585; c=relaxed/simple;
	bh=ZL1LE6RWrRR+TxEFNCVtAINo8B15XbU3517wESnXWWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLuC2XAyIU+oTTsUub6iPIh9mB1ONlRfmElDvwNsoqd1vlnBIullBPJDcWBxd585GQEFIRAeEr29Q5C84h2cjltiiYUFyjE3MsX0deKJvh5mJhb0V3RNQtAWL+MtulDpWhvkrjBnUU07cFPMC8lgHVpMwzXWQWnS7deKuZe7GzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCVvSJdV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCVvSJdV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9C21F00AC4;
	Sat,  1 Aug 2026 00:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785542583;
	bh=kKe36ovYx0ZIRWZyBdCD5oqQviaXIOCy9RWreiRdHts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BCVvSJdVnbUQEK77KUzBs/Bk2LG9oTBGvBRgRHfTrvgrnx2HJbuZU0F6/ecmMh3qN
	 GArXeBh3QnH2IRie6698xUPhpXwnT5Wmw6vu0qrBvA0HP9P0acjTvCwqUkfY0VfQsd
	 8qEsHGHpinbA2essXEKq51osF507kZmLvbHxMCh9Z31YST6OMTGtyo87ydZcpIcgX6
	 pnxw7kAtkEK7eeT2uoXhC2f0U+/FyPvdxy4u9eKSm0VnPaBEJuEiWYpowGxfnoJNsf
	 T+r9wLz138TXlZf85JV97U8TSEdsRkple3QL3Y/AKW78kIuDjLtimQ0p5QDhg5jDWV
	 TUOA7g75W9oJQ==
From: SJ Park <sj@kernel.org>
To: pratmal@google.com
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	corbet@lwn.net,
	ljs@kernel.org,
	skhan@linuxfoundation.org,
	anshuman.khandual@arm.com,
	gthelen@google.com,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	liam@infradead.org,
	rppt@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Brendan Jackman <brendan.jackman@linux.dev>
Subject: Re: [PATCH v4] mm/page_reporting: Add page_reporting_delay_ms module parameter
Date: Fri, 31 Jul 2026 17:02:53 -0700
Message-ID: <20260801000254.77032-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731193705.2902728-1-pratmal@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Brendan changed his mail address [1].  I added him to the recipient list.

On Fri, 31 Jul 2026 19:37:05 +0000 pratmal@google.com wrote:

> From: Pratyush Mallick <pratmal@google.com>
> 
> Free page reporting currently hardcodes a 2-second interval between
> reports. This rigid delay cannot accommodate diverse guest workloads.
> 
> This patch introduces a module parameter, page_reporting_delay_ms
> (default: 2000), allowing users to tune the reporting rate:
>  - Lower values enable aggressive memory reclamation by returning unused
>    pages to the host immediately.
>  - Higher values help batch pages during spiky allocation/free churn,
>    reducing hypercalls and nested page fault overheads.
> 
> Setting the delay to 0 is safe and execution is strictly gated by:
>  - reporting is only triggered by high-order page frees.
>  - expensive hypercalls are bounded by a slot capacity watermark check
>    before proceeding.

Looks good and making sense to me.

> 
> Signed-off-by: Pratyush Mallick <pratmal@google.com>

Reviewed-by: SJ Park <sj@kernel.org>

[1] https://lore.kernel.org/20260729-email-change-v1-1-666ae7c2b7fc@google.com


Thanks,
SJ

[...]
