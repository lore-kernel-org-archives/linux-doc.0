Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2F540F73F
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234412; cv=none; b=D0FLy1YZRzXDpHQAeVp5u54IGBeHj9dsdXA/gcbubBuTPL4HD4DH+lmpL1Vk3qBsQRWwqTvcjjDQES/5MjwF9WW6ejK5agaUIChtUso/9vyEuPk+EDCQT5364YY3ABd/hEa6NRvKv75KwaWzbv6I3UMfTtWM45g4OS+Uljvq5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234412; c=relaxed/simple;
	bh=GHHMs0wM9MmiRMNcNEelwZhzqNS10q95ZUYc+svftEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ4/1MDcVul3v8kalJnthQ5RExaif4prPOtKvR9Fl7jdckpvTQ9fsp627YoNU+ar/tENS4i57RpONjdPibHCODbcwqIFhqqtn+hSYpCYFcVYyJ2RAzJbNQ1YsAJ6bxZOJ3WSO/nTVPCrczfzBRTuIpMXygEHZ8UpW0mJClNHipY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ous+ukrS; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ous+ukrS"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso1716661e87.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234408; x=1790839208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4viioSB1Cdhru9S874ZQwRNPODne/nPyQTptgVZoI4k=;
        b=Ous+ukrSKYKNVCz+tHieApuBuIfSbYX9L9MUv1X1E+g1UuwdYfuBcx+/+/4q+iO8KK
         ExgpZwbIg11R8P9igE7ToqQfMi3uYKB8jTgf36LCG9Fg24D0eGUVdNeU9fbbuWQ8SJG5
         U4g5VtB3pBeLJ/LEeQUofStcLfY6lYhcw+RIKRS1QnUqSDlFe1/xB4w0DrNInTkRaaq2
         VxdHi8w2tG1uD+Vo8V7p8xIm4luVJUkNUERKPdtSwu1VgOYt+zg0ped4YsIy2Js1espo
         2Xj330Lf2gO60zKWmInLxLS2i4oT5/yuTmBXoeFmve3inADcyV4HvKIwFrgh6G6NE3Qs
         sILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234408; x=1790839208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4viioSB1Cdhru9S874ZQwRNPODne/nPyQTptgVZoI4k=;
        b=mDl0/Ktc5TU8vBpr66myJqy7sK7zYrp8jywxfRmIwhSZpK8IfW7CFr5gLxxBgigCIa
         fiYeOT0TALopaBzuQM5nAHCUoIozm+LP9xSVhgWV6CGJO2e0tm9NA/kGaFp9JgveJr/w
         8rp7ygl2GGAYpCHoG9JlhvwJitH0SmKJ8Bz6xU762lQ7qDHbFV6NKssHgqndAA9bzBp9
         kNxbWlp7NrV/u68PfV9EE7ukkvusqevN20S5OOWfJjDMazlTYDJ7Tz0qsqade6C4lfMM
         g0k+GtqPX8UyShYJLUpczuVDZt0mGBSHJOaDNtLMrSxNRsdxuBZW5J1HezqTF3BaPWf/
         7dmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIPge6VdnqIa7jGl3voNQP6g8ukZW3N84pPfcqY5VnNeOg4hxgsYn2S4HZgwfqNJ3rpW58HufuxQU=@vger.kernel.org
X-Gm-Message-State: AFuF++kaDiBdJL4xsSkHPSeCDV+ER7KbIq4NNsSKXXvzIYhlUVGEz/rp
	QfyscKVwAxYAcWN454p5RBQQZuDua5veAjE6gfuUzoHupG4b3KzAxUVT
X-Gm-Gg: AYBFou0eOjkVg/opKiR0drF8iYvaabJBt8le7VQ6HH2ZDkr0eRhnVfAuRYunMeeAZrx
	/uDl7EAo/lGtoV652WnjYh11YUHBjkggJ03yMIuw51TSNqZRq9VN5cn2tApE0bNq3apTgl+3IdG
	LonljrwuSKptolmDUunRxE9v5zwpKzUBqTMnZmSfuTormDOoEpXQeBxvo1P9S6SygrlpNk5pn/m
	Dc/u3L6aJwjQBNs8IXgQGXdCkpsxKy58zWERdVcz8FXh8Jn5XfoCxvdpSwfb2ENK6QgYC8j0691
	Ez9CU8IPcuQcreV0EhEcqhq0x+0nRgmizwdrFM2W76ElsvqsC+KAjXkjDmfIHkkJckaFi93MP4T
	IOC+kFYorDp6bkHAMslvJa6IPDybjGHauvTcMQ4JnYLIrqqKjO0IfFTgkQH5fao28hltaIdrTKW
	HgcFvjuvFFCfbdsOlhWMUrTlLVaiPXAEBMjuVUFkbIXPH+QhQzT5fqGsB2aSW1iM7u8sGCxJUZ7
	T2LpGCPlGnnzxpmAlu9PlVfHU7P
X-Received: by 2002:a05:6512:234f:b0:5b5:e2e2:5f2e with SMTP id 2adb3069b0e04-5b8df05906bmr513502e87.18.1790234407919;
        Thu, 24 Sep 2026 00:20:07 -0700 (PDT)
Received: from localhost (sol-eduroam-pathost130.ki.se. [130.237.96.130])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857f7edsm1229650e87.31.2026.09.24.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:20:07 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:20:06 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Chris Li <chrisl@kernel.org>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arTNdz2P4ZZZfruh@parmesan.int.kasm.eu>
References: <785353ef79844e81a8cd97e87b00ef1f785b15e5.camel@surriel.com>
 <CACePvbXZ4i-DsmbQdNtBQb79y59uwZC9J8qHD2wTWpcYaet3LQ@mail.gmail.com>
 <83539be885f15bb567b30264f5f62e718f4a9fd0.camel@surriel.com>
 <CACePvbXZQERwLF_f2FYTHsv--kq_-Aw2vVVFF+z+ovdnsHy1bA@mail.gmail.com>
 <arKbXe1Qe-FDCTMM@gourry-fedora-PF4VCD3F>
 <CACePvbWW4avTV2WB6iRU+LN5zqkMTg3UhBrq41R0iw91-7Ni0g@mail.gmail.com>
 <5a7ad159b2fabf377b7e1fc4248c433287ac11fb.camel@surriel.com>
 <CACePvbUtEdQLmmudON_qC2aKuLYCNktBuAecFKiSvDC6eTfXeQ@mail.gmail.com>
 <arO0RCCE3Woh_I_z@parmesan.int.kasm.eu>
 <arS6dvzAI5XLHuG-@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arS6dvzAI5XLHuG-@MiWiFi-R3L-srv>

On 2026-09-24 13:51:50 +0800, Baoquan He wrote:
> On 09/23/26 at 02:52pm, Klara Modin wrote:
> > Hi,
> > 
...
> > 
> > Chiming in as more of a user perspective.
> > 
> > On my 4 GiB BPI-F3, I can reach more than 10:1 compression ratio on
> > zswap during some parts when building GCC 17 snapshots. E.g:
> > 
> > MemTotal:        3966864 kB
> > SwapCached:        31872 kB
> > SwapTotal:      16777212 kB
> > SwapFree:       16638128 kB
> > Zswap:            280140 kB
> > Zswapped:        2859840 kB
> > AnonPages:       2927376 kB
> > AnonHugePages:   1409024 kB
> > 
> > While this is 72 % rather than the 100 % you asked for, I think this
> > shows that what size a potential limit on the uncompressed size of zswap
> > is suitable heavily depends on the workload.
> > 
> > I have been using vswap consistently on all my machines since about
> > August, and I have also tried one or two versions of xswap (but the
> > current lack of writeback makes it inconvenient for me). I really
> 
> Thanks for testing xswap and reporting issue on xswap rfc v3.
> 
> xswap has writeback now. I only built foundation for xswap, while
> writeback part was left to other people for collaboration. Finally
> I added it.
> 
> [RFC PATCH 00/17] mm, swap: xswap writeback to a physical backend
> https://lore.kernel.org/all/20260920072043.430390-1-hebaoquan@kylinos.cn/T/#u
> 

Thanks, I'll give it another try when I have time.

> 
> > appreciate the work being put in to decouple zswap from needing a
> > physical swap device to work.
> > 
...
> > 
> > My personal preference would be for a default uncapped (or very high,
> > and I don't think 100 % of RAM is high) limit on the uncompressed data
> > which is backed by zswap, since that would mean one less knob to tune.
> > 
> > > 
> > > Chris
> > 
> > Regards,
> > Klara Modin
