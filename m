Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B613A1E7C03;
	Tue,  2 Dec 2025 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764673800; cv=none; b=g+5VPOKG4jUWLqic5DvIzwTdXWEmLUU+dbqiZTiXRZ6rRerEtDBZ/DP4mXHOMm2OZyacsHkNjdsjgmsYEWZxgCwnhDltdR+P2WVCe2Qrs5X452yBgc5SuOkvxDwHxB7u5YWDoeVBTRhDVcV8L/uWsuy7KnyrVoOG3n4XcDD/FIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764673800; c=relaxed/simple;
	bh=NUvfwWwI0D471lVrBHXy3OOf20x2Bgx+jTZnuVt4B2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lhJIk9u+jNCCQkDWeY2GPiCRykZSFSpOor2leh6W09ZZs4jbgHbGHz9hxUeYbR/BRCbyjdhYGMgXc94n+z7hUgRvOobCRl4Vf1ieTU+IIT5f9v2SH+LN0arYP2aliR2anq5F9UcQv+dXlwsW/sUsCDvp2G05UHh6M9+D5Ic+RCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fn2joewc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fn2joewc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F088C4CEF1;
	Tue,  2 Dec 2025 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764673799;
	bh=NUvfwWwI0D471lVrBHXy3OOf20x2Bgx+jTZnuVt4B2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fn2joewcmYGvn1Q6tt3QuSfBi6NG/OXseJjRdnBQlgwBmvB7S0xyefKzVXfzswJ7u
	 xRXBlYA1BF70k4DnAGXCk4lvZsSohqycAE9CacsarpZVTu/gx4mx6MMv6YAU2wCFxu
	 WAYqSHDIZj8EoTBaDN8IyoQDO+mW2dYqw+XfWCvChjivS49SMtaACUl8OZlWD/glFh
	 LG8WI7Okv+kUgF78MS1NRQpZ+ZBue0vzrbWBSoHOW7NJ1Abv+MNIyCEkKiTDnNKvhP
	 vO/mGTdBgA/eS5k1c1x3F2Fed0gwpFbHn/IaKTFEeynpIz8SadtTOPGvGMv8wYp7WS
	 yn/u/Jb8/CuuA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3] mm/mm_init: Introduce a boot parameter for check_pages
Date: Tue,  2 Dec 2025 13:09:49 +0200
Message-ID: <176467374051.1009192.13862809250568196121.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251201180739.2330474-1-joshua.hahnjy@gmail.com>
References: <20251201180739.2330474-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 01 Dec 2025 10:07:38 -0800, Joshua Hahn wrote:
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
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/1] mm/mm_init: Introduce a boot parameter for check_pages
      commit: a29b922955aa2bedde15876707532b982dec183c

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: for-next

--
Sincerely yours,
Mike.

