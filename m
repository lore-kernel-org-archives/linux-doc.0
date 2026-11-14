Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676931;
	b=dNE1TmS52hGS747uH4rr1VS2Y7XYwqBYRgwyhR2FRMk1L9cZCot1FG1fgI7ce1yUBoQS
	 ZizWx9u3YDuovtrF4Oz8pC7bfeu4GgAYjSFLgGB3o1diD5d4kAndgrGm3HFeYzznLQsYu
	 nBvQYYcWwx9UYrW1CKriBvphmBdKF9M22L05wGkA85GjepX8SYRHPnzBdP+I91vfTJd2r
	 wP9D5e2HoGgTaCTey726EyM5sPEcJ+OYt3RLZfnhPwszNtYLppagrj4jiSkx32RiuFVGb
	 7MysjEI8qt8+gGFCzrJvM7U5Jq1adzLrmbx/VoVKURsmOJa2ZtGqeS0dFihlYlozTdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=5rHSD3+ZQwKzYQnxgJEPwedfPYdnuIPpqgShWvy752w=;
	b=wVxnrknWCSd8O/h3XR1tndjUd+VGQux0taiVObgicSBXH2pwqs51SXmEF1+fD2iFRHiw
	 xZ3sKHxNFv8xyTGkLIRtTjSe8y3tKQNqbv0b6tUCH7Yo2qjNs4dUugyvPqXS58bMuSH7a
	 U8P62wQnWZQqdfHJ0fN4SpKVHAcer6YnSk1iI1i9v9sL/c2bd+tTA1lMca8odwnVMhcxj
	 55y66BFP+XXrM5Hx8rYPEkz6j0dkZsT1Xy4WSOTwAHMR3lyEvio8fT0AZEh149Jiw1k+a
	 tp6niiuix7DM9/Zq88IUmNb+odLOtoaCt7Lcqcu8K7NeyROa2VvChPUAAri3g6oB3vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=M3dO9xIM;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A620606A32D
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A620606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=M3dO9xIM
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ef011e338so32564356d6.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794676930; x=1795281730; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5rHSD3+ZQwKzYQnxgJEPwedfPYdnuIPpqgShWvy752w=;
        b=M3dO9xIMIoKOnSnY2bPPCeRzDdaqWK0koUHopx51iQpTcL5qZDdVMjrpau4qXjCHZx
         0aqVEF7JmZwgkfZ1M/1iegCnfNHx8yU5lqQw1LEdQ3LTGmmxSCdgVXCuHbuHlbAO91wc
         CkKhJY2D9fg65YvvUmXNRAaPm1a/DfRrFiyjaQzSZOlRb62XcaTxkeILljWSoLP+ZyqT
         vo0F3rbVU6rDmpNA/DIZn7r1b2RlPg6T3JDYWQPnFAXpVYelQC76bmqaz3Ld9cuDboJj
         8QYZBb/STklP5hQ/c1TlXQ4QjluIGkqOnx3IPF4S3E630p8juWmdCNrQB8L7mMQ6sp6O
         N68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676930; x=1795281730;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rHSD3+ZQwKzYQnxgJEPwedfPYdnuIPpqgShWvy752w=;
        b=NSts6VOpcjKzEVP/4fIkuko1vK6AaYrt5ZlCQEOHnfScv5Srssi+BPa/Q7P+1edfeX
         eM9WFD8kaGy53DRrTthbreVgt4uspzopk0QYjx5CxCUKDvd50XBo0h7ekdMc44geHeAq
         yzeHGF4WS4wwXzVi6oYan3Qb3Y13t0JfSOpYJFku5s+rEGwLw1lNxfHZvxa6sBV16TOC
         ZHvSpGcsxgrc0yw5jX+rfwT8WklDhKuHOZqx9F6wWZCMf0ts81UWnKuPu4xU+0HnIZ2F
         MbB3QU/GxJ/t1ons/355BHOIyk5cgTHeseGm2l+sbdrsP8jPOkoMxekYXrb4/+qivEEw
         ZRMQ==
X-Forwarded-Encrypted: i=1; AL+hErF+OwN66QEpFWDkCxGq1giQsJWs2VIPLe4kTnTBvnzzY7njwnPAVuYMdu37hFlZuD2kAf7MQLXYyCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I3Oi6OtooCAKFwfPxrLD+YWbOaGCYfC2xQqdJeK9U3+wYgVgD
	yxwlZL/0uiMrzAc5gI+XKk0+5w4+hMYLT7QPdSVP11+VY7f6g0H3QVw1iK4mX6fvnXo=
X-Gm-Gg: AYBFou13CejcpkRcoS4cMJEHpgWxs1uoKyhRa/U1YvtGPioS3DOta9M8zOT99t14XDc
	C8ePy2XiEH8Szfj5ZtOPFmwNsT9aBaV4C8TLCPldJ4BeYOA2wcnV/jk+FO+v24OvXi5xgDy9tWg
	KFvKIXiADQoMyh3OzoaBdtemUg/ZPIxh3QigpQYcPdKfJietGY6ZO+Zhww4XlYI9Z9dnkxdUjfL
	E361Uoa6iaeMUyGYFy9krKbkisBoky6DxoS3MB0NaN10oaLxdTMD246snwhM+u7oH8I0A5ChS6U
	+V285DbX+NxO3zWDIa80sDTJbk9wiva086lWozxOImv/yI3c1ogHl/Ka2ifQGRW93A3zHlyhA3n
	UQpbC2hrLdaAUslZp/2eunBj9wLBHMIU36EXQkSuMLmGIjbs3GHiXLOWA5/L0D3OnPRQAaiyaQh
	po7lcHSKBgCW7x8Ve5Kffi5rgnMkIWsV5Wd7rgSGlPeNC9A65WJnlVgm8YIXWtAc2vsbbvUkVL9
	dqNLYMQco4DvbThBjBG4jyDZ46ynKYE5e9uqsXnuEmI8NjrbJ/b5SF228ibAccqcAMjGXHOJK0K
	hTt74iMzuP1vx0+O0VbKoudxxXD+F/NyRIA81rCPVb/sBGcE/D39DsxvqYBqKTKDumyfKpnjdqA
	ypviI2Kc=
X-Received: by 2002:ad4:5ce8:0:b0:91f:2e4a:7993 with SMTP id 6a1803df08f44-91f2e4a79e8mr70102936d6.14.1794676930211;
        Sat, 14 Nov 2026 09:22:10 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d6193esm47177926d6.19.2026.11.14.09.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:22:09 -0800 (PST)
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
Subject: Re: [PATCH 1/2] mm/mempolicy: merge adjacent shared policy ranges
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
In-Reply-To: <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
Date: Sat, 14 Nov 2026 12:22:08 -0500
Message-Id: <179467692882.482102.17918264505505182751.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 22:36 +0100, David Hildenbrand (Arm) wrote:
> Shared policies can retain separate tree nodes for adjacent ranges with
> identical policies. This can create unnecessary policy ranges especially
> when individual VMAs cover individual file ranges, and user space sets
> the policy on these VMAs independently.
> 
> Extend the existing replacement handling to merge ranges with equal policy
> at either boundary. The existing replacement loop will then remove the old
> nodes and installs a single node for the combined range. This also avoids
> splitting an existing node when setting the same policy on a subrange.
> 
> Extending either boundary rules out splitting an existing node, so the
> allocation retry can only occur with the originally requested range.
> 
> This change will make it easier to cap the number of shared policy
> ranges per inode.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced some bad effects by setting a policy on every other page
shm policy across millions of pages - then setting a bunch of pages
individually to the same policy.

Base: merge never occurs, 1 range per page.
Patch: They all collapse back to a single range.

I was also able to reproduce a "BUG: soft lockup" when a file is freed
after creating millions of shm policies (absolutely not realistic).

I think this commit is probably fine to backport, but I agree it
doesn't seem worth it.

Have some thoughts about the limit in patch 2, but otherwise

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

