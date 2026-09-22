Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFF560AA0
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091837; cv=none; b=nyBl9TIbHhd9clCMbplDtzbbx2Ro+F/hbltAf22g5FKmb1i1VtsaUMbc3ffJr+3IzwlVf6SVpn/8Wg7sKhFaJ4cf3WdkGijuV6bXIjUzEXqEY05si5iaLe5olRs6u1hQey25O7ZY8Hqx+P7tjjMOeWc+PvVWV9LVK/GC38/Za40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091837; c=relaxed/simple;
	bh=hchzYvXQvWRzwu0eETo6eP63WqkiRtXrdlRjjzPyl40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRTUmCF1tm2F/EmEbe5kn8i8pw9GUvy5VIg10gtMZM8iBkvMolMXxul2moqGpaNRn1d8sU0zoUCnezhMsPqAhZr5IZMKmXwckeH8gyxJ6OJMm62GuQ3u8G2XSHHmTfADYCr6JVLqeHVZsvYzAuXOujQYzwciz/0VrlHKRjZQLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=IPm2bJqg; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="IPm2bJqg"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97eaa1155fdso1290533241.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790091823; x=1790696623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hchzYvXQvWRzwu0eETo6eP63WqkiRtXrdlRjjzPyl40=;
        b=IPm2bJqgan2bGO6w8DvJ0QU3bLlbkLxPRj584Y9iKd6/FPisDWNUfhsAbfveWrhE+U
         5p5e32HG0eCBn4dsR5Vifb+H6U1lEGFJCeUcrjoMPkRxsCGFe1I6riK+4tTbE5FD1uDo
         LEDSbE8mKxo3Uzy4VR8aYngoGRDvpCLs67ZasrXTBunR/mqIknlRNErG/OYfJf42b6ug
         av6yz/2ituu2QdpocnO6LzOHTsMzDfF7V3VwP/Zax4FSrsP8KFJK+BEsuJlpNxm9pvD/
         j1BSDdBkNHN7VmfxVTkBErrJbSoyXa287vmZNi9ONOKHmpqtysk65aww5mhvuZ+htApm
         si9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091823; x=1790696623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hchzYvXQvWRzwu0eETo6eP63WqkiRtXrdlRjjzPyl40=;
        b=u2wELRhorr4QBACK6iHZj/5zn+wCdOAExbL9C673+UTGZjQYm5lhjyi4nWqHi9iUOB
         v1FyQ5sM4AQfZq4c/jykNJw+/zaHJ0NKnufrv/NoUAf+HUvBRy+eBogToaHny2bYEFJc
         nkqNO++U0uQ99TmYEkTbr+9FFbibEN12ZzcHsQtgV5M6t1C5K+SRSlmaAlwp7GAZw4sD
         IeeGsfL4qdns3cMQTqdHrQsYphaB3C+TA4GfSeZbTIlM+dpXzWmQN0WUCMvzhuWxep33
         EDt0w+4y2ri2i4K34TJwC/MzeWsOtu8bMR/d9S2lFBnWuRGQGuc9KuROOOWUWIE3JvBV
         YNsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr6dyJqLAtLO4/7Y03M6dl70Z/1ZAXsb9+L+Ohd5pgoBhsdIyWEuF4GJCxpDCoi1H84PxLK/FT460=@vger.kernel.org
X-Gm-Message-State: AFuF++nibvoa6VL0vdKlNG1FZtaSJCBW+iDfheS6gwYbUDi7Q8poyTWd
	HqzYt3boLTf/N6AA+6KNrXipG/eRIfiv0nKHISeBTqtGQMrHWDsI4LS0co1WjLY7SmA=
X-Gm-Gg: AYBFou0A7VAwHRND9uhKx1GqOsmB1RnVPpEG/NVCx19ELqLYTKFMle+v6sfx4Bw6Hmb
	Ly7IA6jqsztECBPqgwgsQ6UNffol+77mDoP2Iruz/fCw3Xs3FL/BZPbkxNbubNs2XI0FB+R2l2N
	zIEJASDPQDUB6lfileFotZNKk3c6isQAslpfnRlZux+HBbYm6GHA2F3NFpke7W+uGTvEMtQ1hBT
	VHCLraoZ1bDKTs+D3MuKFOeRSpOjj8Ym+zVHyrBI90ZzbWwCSpoKrXVMbWLjRAyh3IlNb+X2OJ1
	BXgUGFWMtn/yNGLQFSx4bW1Sfer91LyFMdvoMGw1EgI85mYM/hhlSEdhEccOQSdMt676R5rUEcO
	JYHmcCM9TfgqCo7BC5yE3G/wl38bMvvS7Wpv04xgEZS/aArFzwTppaXPuhZk0BaOxham1FrPpg2
	Wyuc72XtE0LBcD3I8m3bono5Wp4iwuv4exxYPIWjtBwUwDgzoBW24r8OcB/gnVUUG9xnhR
X-Received: by 2002:a05:6102:81cb:b0:7a7:3485:3386 with SMTP id ada2fe7eead31-7a734854c44mr4067281137.24.1790091823401;
        Tue, 22 Sep 2026 08:43:43 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024f12c3sm19388516d6.36.2026.09.22.08.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:43:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:43:39 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chris Li <chrisl@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>,
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <ryncsn@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arKiK06mfWTw9I9a@cmpxchg.org>
References: <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F>
 <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>
 <e879ac65cb0940325736df7984c737edf1c6be94.camel@surriel.com>
 <CACePvbXThspPYD8DZkAeiJtYuMV79vGgC1SGhpMwhn4COWOtcg@mail.gmail.com>
 <785353ef79844e81a8cd97e87b00ef1f785b15e5.camel@surriel.com>
 <CACePvbXZ4i-DsmbQdNtBQb79y59uwZC9J8qHD2wTWpcYaet3LQ@mail.gmail.com>
 <83539be885f15bb567b30264f5f62e718f4a9fd0.camel@surriel.com>
 <CACePvbXZQERwLF_f2FYTHsv--kq_-Aw2vVVFF+z+ovdnsHy1bA@mail.gmail.com>
 <a75b2eac4297ca6b238dde6f9246d2c1807b935f.camel@surriel.com>
 <CACePvbW_-6M63_a7Cp+09dTmpHeMEdj9VDQZf8g8qoYKQD=wvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACePvbW_-6M63_a7Cp+09dTmpHeMEdj9VDQZf8g8qoYKQD=wvw@mail.gmail.com>

On Tue, Sep 22, 2026 at 05:23:31AM -1000, Chris Li wrote:
> In my experiment, 100% is already way above that bound, which is why
> I'm curious about your data point. How do you run and test your system
> at 100%? Please correct me if I am wrong, but it looks like you
> haven't.

You're conflating machine size with workingset residency.

Rik showed an example where the compressed set was twice as large as
the anon set, and it worked fine. And why is that surprising?

We know many applications have long tails of cold pages. Idle tmpfs
files and shmem segments. Things that get rarely used. memcache style
workloads have a small, hot index and a huge data segment with poor
access locality. Even if large parts of it are in compressed space
that's better than storage fetches.

Your "this will thrash after 7-10%" is an average based on common
workingsets that are actually hot. It doesn't mean there aren't cases
that benefit from much higher overcommit.

Why even get into this? Why even try to find some universal limit on
something that just costs memory anyway, when memory containment is
already a solved problem?
