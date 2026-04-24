Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EFB3CFF45;
	Fri, 24 Apr 2026 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045379; cv=none; b=iR6tlmgGFChK6E+JWV+5ENrYs0SJ2wgCJJ4Y/G6EdKd3BGVU5ZxmfkMoMOZwQYk0O3RfPKodAXKBagow39HLvMJQ3usTB1HPktufd7XpI7F12GZM7iAuFqIJppjozMkypbfi6r03ROSCReJeSr4Oq93xl0b/8LI/ylBPPpMOAL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045379; c=relaxed/simple;
	bh=VmyuuW4BreNkPPOMqrGtbTE5hoLsOBMQFeVplDAHz24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzFOt9G8pexbs9Ws2eo14GhYkh3HQvB08yhBxfjJpuFow2yC3qRHh4kURnqDbugy48t9h9m3JXWxsGXATsNxXsbTFu6Glv5YO1PZmZzFAdOGiM+S0zUalP+zzO1YGmz4c9v5MwjBuSMZ7xOU3gt64Z0BHGxnAOdSk3HjXc3e7ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6ryWYr7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6ryWYr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA232C2BCB2;
	Fri, 24 Apr 2026 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777045378;
	bh=VmyuuW4BreNkPPOMqrGtbTE5hoLsOBMQFeVplDAHz24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s6ryWYr7VoiHmsU/LPEaQ8sOkbImRYH85BnfbLA/D//UNSCaO1+d1Z11op+4YpRTc
	 DjYiOy9e7HxQLvmyF1CEtEu8QTzBqrr+Z9uWzluXiEk0VUw0Rj+kYHhxGE1qS/44vQ
	 A/WthNXRAOeTJwN6eqWE+ZnAb9HW8giJB2DBYn5NmrLCPU1nR0Rmysrq9cTekCwTMx
	 WjWZv6QkQ+9OJOvZayC34Boy6gEsTxdVa+P6vRS/+us0IWy+XoQ/Jg2JXZskdaFZlB
	 sznsHHpLQkVlL/K1Xf6e2zDUkp1hLBdzHl2uf474/EYictMBHJFoAn5RDQIXC0Kuk/
	 epU9q2XEJSzPA==
Message-ID: <b001932c-e376-462e-895a-5e4a9c7c0dc5@kernel.org>
Date: Fri, 24 Apr 2026 17:42:53 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/7] mm: dual-bitmap page allocator consistency checker
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, akpm@linux-foundation.org,
 david@kernel.org, corbet@lwn.net
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, skhan@linuxfoundation.org,
 jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260424140056.2094777-1-sashal@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260424140056.2094777-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/26 16:00, Sasha Levin wrote:
> Existing memory debugging tools - KASAN, KFENCE, page_poisoning - detect
> access violations and content corruption, but none of them can detect
> silent corruption in the page allocator's own metadata. If a hardware
> bit flip corrupts an allocation bitmap, the allocator hands out a page

An allocation what? The page allocator is a buddy allocator, it has no
bitmap to track free/allocated state of pages?


