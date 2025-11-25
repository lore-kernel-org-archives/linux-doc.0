Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F8C36D4E8;
	Tue, 25 Nov 2025 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764033069; cv=none; b=b8Mxh8r2HTsndR7NMDKmaXctn6+k/eCuNvTAMYM+1VK1kLzn80ewc0ptgjin6gZAmJZT0X0cBb7+Chdpyjv94xR/rA3dQLA+ipKlhDRwZj0i6eI9umovLjEk4RQ6atkcH0UxnpkZHo2qAjBL3ORyaIRB/4gTBk7lB7EeaKgLeGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764033069; c=relaxed/simple;
	bh=nf94rCquJc8QNeFgFlkRJuDarMYsAcZXnLtUPJTYgJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmrWT/VEjpne3UDyz1CA4h4WDGXWZF1hEp4KJZUp4GPHsdW4Ekbgor15q2UCDVtdDGkjpY89H1tHaTczFib30yhvPOOBJKmwPQv11qNfNmItOaz8JbtX5OZX/zxo5tPkBHBrD1rPVBGQGGTqTo///LgpcrDqcmMDYyMloO8NUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2yl4AG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2yl4AG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E91C4CEF1;
	Tue, 25 Nov 2025 01:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764033066;
	bh=nf94rCquJc8QNeFgFlkRJuDarMYsAcZXnLtUPJTYgJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2yl4AG+DDuiNKAIq00L1ydlT+ob+tHWu6IoW8eaCQNKBU446v5PU5RoTdVkL7pK7
	 BCsXha16oPM4GNQghIHtRxWSYIPW+rCKuVWArSy1vJLUCq15l7JaeG63krPAp19JU8
	 A1ukokpCAVnGgGymDNhBIgDBUz1vb0wkH64MXvTp4R3gFwpJOHewtjyh+qhIcX3zEf
	 3QbhoUH+5uk9ADUrqlOh7kADfeoDvYK+Ve+9OSoVh8mq8HCmz5HYUAx5Ny8SLADEox
	 FU87babFFzF9nLmkQ+1Zik1QI2vjMDN6CrHQOk3Tza0sNj/qPwvcSr8Oxp2NRKPJSO
	 TMnjxC/5R6Nlg==
From: SeongJae Park <sj@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 1/2] mm/mm_init: Introduce a boot parameter for check_pages
Date: Mon, 24 Nov 2025 17:10:57 -0800
Message-ID: <20251125011058.74734-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251124225408.2243564-1-joshua.hahnjy@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 24 Nov 2025 14:54:06 -0800 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> Use-after-free and double-free bugs can be very difficult to track down.
> The kernel is good at tracking these and preventing bad pages from being
> used/created through simple checks gated behind "check_pages_enabled".
> 
> Currently, the only ways to enable this flag is by building with
> CONFIG_DEBUG_VM, or as a side effect of other checks such as
> init_on_{alloc, free}, page_poisoning, or debug_pagealloc among others.
> These solutions are powerful, but may often be too coarse in balancing
> the performance vs. safety that a user may want, particularly in
> latency-sensitive production environments.
> 
> Introduce a new boot parameter "check_pages", which enables page checking
> with no other side effects. It takes kstrbool-able inputs as an argument
> (i.e. 0/1, true/false, on/off, ...). This patch is backwards-compatible;
> setting CONFIG_DEBUG_VM still enables page checking.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
