Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1442A7A8
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066719; cv=none; b=a27Fy1BXeWFbAT/DQPnobjocgkbXRFonmUIEVv1QPaEEDpBSDgiChWrDKe8jro9umdfHpUAkvXee7E52hD6K6caX0vFaKmNR3MMq/qKKmml4HPu80yEhtfxvFD+RtIHPEbFMAd/eqfGB8hMTgYWo4dS1X3J0UgH6vE0qXjGc1Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066719; c=relaxed/simple;
	bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzHs0Oj0FJQcByVGOHrKRFqtI3BfopdAt1bEJzBLfyZvE5tXet7FoHxXrNqCX5huOCY/KpDPh3qMVmRHW37xRarhaZLvKql0442/yyfrQwZPYx37ww2QnwDpW7zwaploxPFNKRAKwbCij4rR6jt6hBXREG3mdxpT8297pJEJQZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDiHSjJw; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDiHSjJw"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so14445825ad.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066717; x=1790671517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
        b=JDiHSjJwHZTGuhFG4Yb7PLcjNAdg2cPNH07nQl7euJYOZgF37nMxsEDqb4Pk+uFQMw
         fYZ6LwDyaJqqiVvkB6+WGwLq+bF6PYBNPQXuMfFZ16FcoA0HUmvBEDlWdE1jr//aK6b3
         g7xiScS9qW5E06jUIiwo8yvb7ITLPRobdIyyyCN4x9Jp4G0lKz3vbAaNSyjHC7KneFkd
         YgGwTz61AaWyGB+3fhvmdRVlcu9TWub1iZHiy+mmLovF0CVgTPRNJh3mhzBQrXQYAVDF
         aWDIK1yV2GOnovj1HQsC6SMATNU2e9BFj4tTRJeUMKXF1I/DdOgByd0ayAEblP51k1B7
         Z59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066717; x=1790671517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
        b=sFKBLC2Iz6+PtRyyslmTjZ2ElZEtXGQmXFkuR/UrkqZeOxHMWA3J4fQKw2cn4EdqJy
         nk+7j+tG9ardjiVNu1XJ6+DG0vcj+RpQYyIjCNuGWP/E7tH5ZXRZMeuapinkHqc6cme3
         jaO9YuqXPZe2HOES3rCLdJha/WMPS+nwtEREd/uePNzzGhGQwQcJTud7oi+N6mtOrEkH
         Z9q1V1c5EMuT9moUMPkgob2npk3KSFC+PCo4b07+aEi/LVa4IcU82lGDXqF/DRSFd1By
         IuUiZ/LWWJnplimY04M2cgBbqv0HXTk9Ihq8ONdjfGsH7sqlMs0N2+c2bsA/8Nrpz7ku
         ciWw==
X-Forwarded-Encrypted: i=1; AKwUvBypH4xhdkxR5fY5xK4Abl5tqDe7Sm2SF90GoGjLNYwxLrPMTvuNhm8GqBvri2gFKRb/a98hXnBYuaE=@vger.kernel.org
X-Gm-Message-State: AFuF++lE+q1OsB07IvQhZrRVyVFyJhtEySXUkszwqRxh972+i0Ub0G+E
	ieJMUEiJhyh+A/5Gdv4ZD8Gj1BzRIga8sXLYJxdvLJ4sBBvVSo3TGdFI
X-Gm-Gg: AYBFou1vywldkq7fW80F2H6TbsX5b/6jDAWJ642acVLClVlA92NG1zC3YhlkACRP5Jq
	ToHN28SQ7038Gn94A1FzEcc1etmDGajEmN+Ydsql6kuG8oEtlUnbpt87xVmci7I56QKLSvMVt8F
	sXGdtNrbB8w5VZOyJ2vwFmxQ65k9njR/tLeeoyf3TzvuDNwcuINLEKkg77MdG4ENyTn15UWlsn0
	mL+y+Pi0IwgZ9InzIU16zyLWvu3TJ8KU6CWD9Z2OdkibbxCVqIvsh9ahylLiQSbuq655jm6CRrB
	9NKWFRFgXHvH4/Wdju/KE47Z9AaEdI9sGHF7ygw2rN0Ufrt34LHlOhdFASa/RX/8pk/Ef4NTHmN
	RE6Vt8QJnzKHSfJqK16L+fISwiZidNQ8H1EQvvsAjallq9PFzvu+ZjbayosrGntx8xIa0ZldxLf
	2oGZCydEsRPdLEbFaL5s0gvYDAIplYKbO24RmaEH0ALo+C5YDOxokKMgClR8/Ljv0owq4RyaH7S
	gc6Cz/LmbOlHAuDjgiTscjtyBWTk32/m7GFSUgd
X-Received: by 2002:a17:902:e952:b0:2dd:c100:251d with SMTP id d9443c01a7336-2df60f2fd27mr3267025ad.38.1790066717422;
        Tue, 22 Sep 2026 01:45:17 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0588e9sm6100495ad.76.2026.09.22.01.44.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 01:45:16 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: Re: [RFC/WIP PATCH 1/4] hazptr: add shared-scan kthread
Date: Tue, 22 Sep 2026 16:44:37 +0800
Message-ID: <20260922084447.58084-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arI8KNUjYNFBwKf8@MacBook-0RXW5>
References: <20260922070950.4173245-1-kunwu.chan@gmail.com> <20260922070950.4173245-2-kunwu.chan@gmail.com> <arI8KNUjYNFBwKf8@MacBook-0RXW5>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Boqun,

Thanks for the suggestion. Kunwu and I will work together on the next
iteration of the shared-scan design, including your idea of avoiding
per-synchronize allocations with a Bloom filter. We will also run the
rcuscale comparisons and collect IPI counts for the lockdep workloads
you suggested, then share the results with the thread.

Thanks,
Lian

On Tue, 22 Sep 2026 10:28:24 +0200 Boqun Feng <boqun@kernel.org> wrote:

> This would requires allocation during hazptr_synchronize() and I would
> like to avoid that (it's going to introduce a "allocating memory to free
> memory" case).
>
> Mathieu brought up a useful data structure for the scan: A Bloom filter:
>
> Willing to give it a try?
