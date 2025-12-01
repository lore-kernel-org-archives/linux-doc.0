Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0342F6597;
	Mon,  1 Dec 2025 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590475; cv=none; b=SVp8rW2+JfMf9GmmUCLrnIhB+zY9WxHHF4vQ6A0k6/f0ebLtjBlbF4V2J/QMbec5Cr0tBEZVXZlRG0s8DpzOaRPT+lpXJkaVdh9p10LYLPnIDf1dncRFVmseE23Svb/+f906Zw2Ui/n5DwoXg7ke+6AHKwHkcBS66HQvTQxlQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590475; c=relaxed/simple;
	bh=qmFVDQl85en2au1F49ii0g6ewznUWCYtdQQliP6eUz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvImT8/7INvTsL0q38Ln5XgKHnvtQHDtkUcpGmCql9koiox4nI71l7YUuNe7Nrq/oYoX49bTVyqhAo1VQBSrLKblGjn9fPK7IGvx2TuZXxvNRkGFR59uCqYIBCbAAvC1f7l8UJQDRrkH+buv7pheeDVktOH1o0OSjKUr1OuiCY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4dKj9L5GZMzYn1v3;
	Mon,  1 Dec 2025 19:58:46 +0800 (CST)
Received: from a018.hihonor.com (10.68.17.250) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Dec
 2025 20:01:09 +0800
Received: from localhost.localdomain (10.144.20.219) by a018.hihonor.com
 (10.68.17.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Dec
 2025 20:01:09 +0800
From: zhongjinji <zhongjinji@honor.com>
To: <ryncsn@gmail.com>
CC: <21cnbao@gmail.com>, <Liam.Howlett@oracle.com>,
	<akpm@linux-foundation.org>, <axelrasmussen@google.com>, <corbet@lwn.net>,
	<david@redhat.com>, <hannes@cmpxchg.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<lorenzo.stoakes@oracle.com>, <mhocko@kernel.org>, <mhocko@suse.com>,
	<rppt@kernel.org>, <shakeel.butt@linux.dev>, <surenb@google.com>,
	<tao.wangtao@honor.com>, <vbabka@suse.cz>, <wangzhen5@honor.com>,
	<wangzicheng@honor.com>, <weixugc@google.com>, <willy@infradead.org>,
	<yuanchu@google.com>, <zhengqi.arch@bytedance.com>, <zhongjinji@honor.com>
Subject: Re: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from debugfs to procfs
Date: Mon, 1 Dec 2025 20:01:05 +0800
Message-ID: <20251201120105.23338-1-zhongjinji@honor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMgjq7DOPMp3Eq9_SxmxNhY7S5--3uf0PByNAJOAEne9hb+T9Q@mail.gmail.com>
References: <CAMgjq7DOPMp3Eq9_SxmxNhY7S5--3uf0PByNAJOAEne9hb+T9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To a018.hihonor.com
 (10.68.17.250)

> > I strongly recommend separating this from your patchset. Avoid including
> > unrelated changes in a single patchset.
> >
> > MGLRU has a mechanism to ensure that file and anon pages can keep pace
> > with each other. In the newest kernel, the minimum generation is 2. For
> > example, if anon has only 2 generations left and we decide to reclaim
> > anon folios, we will fall back to reclaiming file pages. Sometimes,
> > this means that anon reclamation is insufficient while file pages are
> > over-reclaimed.
> >
> > static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> >                        struct scan_control *sc, int type, int tier,
> >                        struct list_head *list)
> > {
> >         ...
> >         if (get_nr_gens(lruvec, type) == MIN_NR_GENS)
> >                 return 0;
> >         ...
> > }
> >
> > This is probably not a bug, but this design can sometimes work
> > suboptimally.
> >
> > Regarding this issue, both Kairui (from the Linux server side, cc-ed) and I
> > (from the Android side) have observed it. This should be addressed in
> > MGLRU's code, and we already have kernel code for that. It is unrelated
> > to your patchset, so you shouldn’t include so many unrelated changes in
> > a single patchset.
> 
> Thanks for including me in the discussion.
> 
> Right, we are seeing similar problems on our server too. To workaround
> it we force an age iteration before reclaiming when it happens, which
> isn't the best choice. When the LRU is long and the opposite type of
> the folios we want to reclaim is piling up in the oldest gen, a forced
> age will have to move all these folios, which leads to long tailing
> issues. Let's work on a reasonable solution for that.

We have encountered the same issue on Android. When an app is frozen
(which may mean the app will not be used for a long time), we want to
reclaim the app's anonymous pages. After all inactive anonymous pages
are reclaimed, the reclamation cannot proceed further. If we actively trigger
aging on anonymous pages at this point, the number of inactive file pages
may become very large.

To address this issue, I have tried using different max_seq values for
anonymous and file pages. When reclaiming anonymous pages through memory.reclaim,
we can age only the anonymous pages. However, this approach requires extensive
code changes, and it does not seem worthwhile to implement.

