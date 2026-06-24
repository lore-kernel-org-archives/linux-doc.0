Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59956BB5B
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320260; cv=none; b=SWKXamRdNXe0NkNHTu9o/0v/KDpqEVq3RsMXzTAXneBLJGykUfzy2s7oqZQS2rKUsq0Ch4fRlYlzADzcviYP8V9Erj+RzkLCaqslbdLQG1xEytZoW03DVzWEeBgbhqrjPY49lHxYQng+H60iO4kpkIQEdTC6wjLigsq8n5zyCP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320260; c=relaxed/simple;
	bh=fOxQ4jE7u3TCnvFlOC2Ae6Pnm6PbYqfhCIaubSW8KQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pw+l+70MnHRWbIIfWR3LRMYSwEOnlJfucaCGK76LzjcoV5J729DmuBJ/Pbf8EWsIviRx1JNPznp6RjJzLPTt64DGqLyL4F7HRBLwaHGHSdZjyiAzJp3mfTA7flEXXcGORdC6nGZLEuyrrru3VcGlSlvi7yZerACx5Did0YLghV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2EM5shB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2EM5shB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616411F00A3F
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 16:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782320259;
	bh=Pj+zfe+/Q0BE8fYRnsp9PT2NFlf9FSAYTLWiogZWvR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h2EM5shBKdP3kHyvAcDlJcwpMMK7wevCutenACazD5lMtA7WiTsBSAdfwRfg2uO+W
	 A+UU/1/Oh502boIHFslmjDhIdw7ffNNktyq9NIgpoDhH/VcmkptIachTPSQPvRX05M
	 eFyaNMJ7lZoYWnmfURBMS2Hs1mHEiM2Oh/g4V3xLGOqe3zhAHvc+iUAZK55WMkf+5q
	 0eT/Bx6T3RFXMdf/GeRaNQNAECknJeqy9MqezDTyTUS0+v5d27ShNf94anTas16bn5
	 zPF5nAa7tv+PdhNHhbmkEW7T8U7vrxw/PbUe4mInTcA8Dc6hD6NMhqTOAnvPIAAo7y
	 muJ4A28LM0N4A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c07ea058c1aso40490666b.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 09:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UzeX1kp7BM4RNoI46+yWNrjp1GEuVmtqo0hmmWM3eoXRZazxVwazRjXko18LEwi8EgomkjNAGXj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+om4cY9QrH/Mm+odeNUP2lYIfJi4W/8DbDbWQ4tNzTH+k4l0H
	k31pK8Xi0uW5oZXkfPlcbnCwvra/Pm83RzVhSZw+XuPB+NQUpIifNzTWZrwUctgO/F1PR+nx/9J
	3QDAK3xjphwhq2pBzmDM0BPariH0zuQ8=
X-Received: by 2002:a17:907:e110:b0:c11:f6cd:e120 with SMTP id
 a640c23a62f3a-c11f6cde17amr86990666b.25.1782320258297; Wed, 24 Jun 2026
 09:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-2-jiahao.kernel@gmail.com> <ajnB8IZrFZwbIr9P@google.com>
 <d0f05c35-457a-4b2c-6faa-7a83d4bdec01@gmail.com> <CAO9r8zMgaqP=n6rmhnMU+qhp1Www1Y5kdbLTLX1v=fj_ybHyiw@mail.gmail.com>
 <057ea303-4c27-1a6e-08de-cce26c699097@gmail.com>
In-Reply-To: <057ea303-4c27-1a6e-08de-cce26c699097@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 24 Jun 2026 09:57:26 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMmnYkXocZ9Fb9DL_rdAHt5xtT_FLMxJD1bHcM3B4wTFw@mail.gmail.com>
X-Gm-Features: AVVi8CdkRvxUn8N-b2cW1L0eOPe_x3eeQiW3Dp7mX95Wjv4nFh_2RObAbBdbFR0
Message-ID: <CAO9r8zMmnYkXocZ9Fb9DL_rdAHt5xtT_FLMxJD1bHcM3B4wTFw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mm/zswap: Extend shrink_memcg() writeback capability
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"

>
> /*
>   * Scan up to @nr_to_scan pages across the per-node zswap LRUs of @memcg
>   * and write back the reclaimable ones.
>   *
>   * Since the second-chance algorithm rotates referenced entries to the
>   * LRU tail, the per-node scan is capped at the current LRU length so
>   * each entry is scanned at most once per call. It is up to the caller
>   * to handle retries, deciding whether to scan the next memcg to complete

Nit: "whether to scan another memcg to complete.."

>   * the full iteration, or to rescan the current memcg to drain its zswap
>   * entries.
>   *
>   * Return: The number of compressed bytes written back (>= 0), or -ENOENT
>   * if @memcg has writeback disabled, is a zombie cgroup, or has empty
>   * zswap LRUs.
>   */
> static long shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_scan)
> {
>      struct zswap_shrink_walk_arg walk_arg = {
>          .bytes_written = 0,
>          .encountered_page_in_swapcache = false,
>      };
>      unsigned long nr_remaining = nr_to_scan;
>      int nid;
>
>      if (!mem_cgroup_zswap_writeback_enabled(memcg))
>          return -ENOENT;
>
>      /*
>       * Skip zombies because their LRUs are reparented and we would be
>       * reclaiming from the parent instead of the dead memcg.
>       */
>      if (memcg && !mem_cgroup_online(memcg))
>          return -ENOENT;
>
>      for_each_node_state(nid, N_NORMAL_MEMORY) {
>          unsigned long nr_to_walk;
>
>          /*
>           * Cap the walk at the current LRU length to ensure each entry is
>           * scanned at most once per call. Referenced entries are rotated
>           * to the tail for a second chance, and this bound prevents them
>           * from being revisited within a single call. Retries are left to
>           * the caller, which can choose to rescan the current memcg or
>           * move on to the next one.
>           */

Nit: Make this more concise since it's already explained above.

Otherwise this looks good to me, thank you!

>          nr_to_walk = min(nr_remaining,
>                   list_lru_count_one(&zswap_list_lru, nid, memcg));
>          if (!nr_to_walk)
>              continue;
>
>          nr_remaining -= nr_to_walk;
>          list_lru_walk_one(&zswap_list_lru, nid, memcg, &shrink_memcg_cb,
>                    &walk_arg, &nr_to_walk);
>          /* Return the unused share of the budget to the pool. */
>          nr_remaining += nr_to_walk;
>
>          if (!nr_remaining)
>              break;
>      }
>
>      /* Nothing was scanned: every LRU under @memcg was empty. */
>      if (nr_remaining == nr_to_scan)
>          return -ENOENT;
>
>      return walk_arg.bytes_written;
> }
>
>
> Thanks,
> Hao
