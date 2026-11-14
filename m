Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678083;
	b=bBBCYPbaLuiIuTAwRS5mx/W+9S4zfsWPG0x4UTpns7zYuyu/XMAohZ6VHv4sQCpcViBz
	 0y0zE2NBgdzKrcYNstwldJvX71tlFNuuRHD2XiQQtnXV4p7PllDCTkM6CgzBE5Ay3F0jh
	 9GZMfOVEUv5typNxwhcG3aiWYzLrNpxmuB1ARhQMvKw0ECWlHK7w/oji4Ue212bpxQhQG
	 5o3XXOxYckHBKQnJnoEafYeackMgLz93IsbFfBRu6hD+RJfdoLDM8OKvrzLmLxjs8FrA/
	 uNxBp7eSPHHrMZxlPMnJto2LwqmRRP/JN74boC5XHbVtJziOenF0ufu0BNvCvP/Vuvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=Iwtan+mCqrD8UTQ6kqOmC1YvXcL9sNkfoLvCTyQCFDY=;
	b=4ABl0Meca31qjePzsL28pFUSwtPgIG/A9plKBYvuv0aAnIRJF7X3B853/NBlM3lj5UF+
	 hhEFmIljC0uCfzDOwwRhV5W5Y5CIB9JDQSVxjW1dtGm1S4f3NxJLHB/oLQTSEHAVA+1ua
	 ZS1ayLQYd3m0HhvxZ3hZQ8Co9d5efqS/G0+xxK5se4JBi1D9IQWUVHLTJweN2uOXyYT4a
	 D3k5nDzdHjqHG7Fn4mU1XKdaWg0rJwxytOSRLz7YllZlNOdykL1/bhXeeWO44fIe1yxAs
	 uqb4lztKbpMmhYfriC5sHeHaeyB5rsyVjTLjPpkDIa34mYgFrFyX3GBC+/73ZNTxhjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nmsXVapB;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F27E606A887
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F27E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nmsXVapB
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5430f70c827so32417781cf.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794678082; x=1795282882; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iwtan+mCqrD8UTQ6kqOmC1YvXcL9sNkfoLvCTyQCFDY=;
        b=nmsXVapBo/b3VTlqnGVeDoWVaDsumqpB9HGgq64GO9CLSGIDU355BUmbbedGNFBkSg
         NvFwhbaH07OzoGLHiR24BhJ3pXoEVFz3oDrflE1B9NZaXVBRHEhZ542PJp4M2aeCqlWM
         rxhH29lLTxT3zpnVsjVHNI9C03YGD+VDfccn9uQYvCF1YmkKnnvl6Pw/C9x+Xl9rkUSY
         50tpnEZo6ymDTKQoqkiYDciVnsfnJPeM5sUpQ+igHLiQ6gAfLTpWG2RkuZ2ZdalBnaRa
         ainPg0FbUx2E7rexFHQgIjuIwI6aHqmlH+5Q7o/SaWu/G3mcg4TtfQoUUeLYEH2t2CNL
         dAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678082; x=1795282882;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iwtan+mCqrD8UTQ6kqOmC1YvXcL9sNkfoLvCTyQCFDY=;
        b=hMb8DY6/5O+UOjpCujm2zngZT1gsIQmZKfdX9Wem/Z1qBlqIeoWtu28xIGtI8bApoC
         yZzwNYTwONvur5Uu0o+b6bTMjZ3KVRa2E0O/Xx/MW5sUuKcSs+5H5n82S0FSHrc6bwv1
         bVNR39seY68jpzk0F+AHdUOBAke1ayPpfFvU9iIB53qasLfydYEhJ+cFwJLfeVACKtTu
         dS/b5CaeM8tqjWdV3IayP+7dpBRE0Uca4YqMX5ixFwkPiX/1astmcybQLAGXtO/jSZHi
         CXaqb7kOsRIyyWvuLDZ2Zz0OOI6UBqF+NSze2YQB9NNTNOk5vdaqR64bAHpMy8lqRSn6
         FgRA==
X-Forwarded-Encrypted: i=1; AL+hErHnBAHPdJyQq7G1sQSaSEz5m/vGGMehI3NyMAS+kt/D72fygXMyRM+PnjwwdGXUPBbxnu7pwamqGnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bq/YRuqyuqnfpJFZOWC2BhZAXmhHnxniDlnOvKd6di93kM87S
	PGh+ImejYSaIqpsfdPZtCKqcbVr1pRXPkmd0A1C6lVnShxwLF9lQi+0fBdwVeKgiwXo=
X-Gm-Gg: AYBFou0mpl5QTu+2ByvnB1inO/d+cnHQcd7yzzGg/xgi0qkFY9LKDJ5EP1oFZIsnwvk
	cXdwIEX1YkFvAB5wjnf6rAjgKS9e46QqZNWrHCPbKeOMRpqinz3JQIbLMFqAs2jrd7Sqo2FGkLP
	rz+2yZG25zEIEwQiq7ajbTDZ0eszkWlgicDErSznzQ0C8LJ2K/QplnpMATfFLLLlAHhV/fpE8Rn
	IHf7aAheuB6iq9xrndf8RGy9g0hQnRA5n1XUvCzo0/lTvgy9OQ0warBm1E148ZG8hOxWGbdI97k
	gCjCvWDiv5ZXXjBEC7kRO9/MsE7wjtDkNqQ2cn5fmSgShP9asghjE9LGqfi7ZR1Vj8AYcd4e+nH
	jRT10daEq2EKBtDwCYheTLQwMiK+NLw/h2O4FchprqY+QO7yEO0eZWIx2vp5R5rFjJVwHQKjKle
	+4mpt3h+9IF0Ef2q1YzzycRg1NetpGVVc9fASb70D2g55n+ZzaplKtT0rWAYX2mXzsxmYx5najV
	0iBwdFmIbxgN78XDPQR+VvYGc8u6rNqk/UfuWgGOlubfLKGnjvzR3+mh3uV9sYpW+LPc+RJGxn0
	BK3lR8Ct821YqKHXm+jM98BQzCAjBoAsGXTQ114bNYUoF6+Dhhz5SbOCPNDN2dJt+/p68aCduwv
	1OA9O4trP0xf4VkSS2S0DXAzUZPg/5Q==
X-Received: by 2002:a05:622a:1214:b0:535:a5fb:645d with SMTP id d75a77b69052e-55ac9088a47mr98240481cf.72.1794678082332;
        Sat, 14 Nov 2026 09:41:22 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad15eb7basm44690811cf.26.2026.11.14.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:41:21 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] mm/mempolicy: limit shared policy ranges per inode
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
Date: Sat, 14 Nov 2026 12:41:21 -0500
Message-Id: <179467808112.482102.13365594235443107281.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 22:36 +0100, David Hildenbrand (Arm) wrote:
> Shared NUMA policy ranges can accumulate on an inode after its mappings
> are removed. Currently, these nodes are effectively unbounded (even though
> the allcoations are charged).
> 
> An unbounded tree can cause long rwlock hold times when replacing or
> freeing policies. Instead of trying to fix that, it sounds more like
> having many nodes is actually only a scenario for processes trying to
> cause trouble. Most use cases will probably only use a handful of them,
> not millions.
> 
> Add vm.max_shared_policy_count (inspired by vm.max_map_count), defaulting
> to 1024 ranges per inode. Reject updates with -ENOMEM if they would
> increase the count beyond the limit, taking merging, splitting etc.
> into account.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>


This arguably breaks userspace.

A single mapper that tries to set >1024 ranges would start getting
-ENOMEMs unexpectedly with this change.

Multi-task mappers were previously unlimited, but that seems like more
of a nasty unintended corner case - not a real feature.

A single process is already limited on the number of vmas/policies based
on `max_map_count`, so it seems natural to just use max_map_count
directly, but I took a brief look at some distros and most seem to
ship a raised `max_map_count` (>1 million) by default).

I tested that and even 1 million can cause a soft lockup.

Not sure there's an easy solution here, we might have to rework the shm
policy locks.

-- 
~Gregory

