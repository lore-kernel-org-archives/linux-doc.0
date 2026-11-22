Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351455;
	b=h+9x6F4yewZN0HGTkNvmfi+z0TjJVhucoi3mv6nAeobgSzjZ4CKGAnB+AzzQtzV+efXz
	 4xCK0ZCfh+eyvZcce95ODMDpAcKeLjtt7oijSWHW/DY9iTn2TkEyNkokUYd3zrsrE81z2
	 ANXQ0bN9G+8Tac1uTqDlKh6gzRjLXu3+a0CmgwCBBuwoTdlQJ5EjExu1nI07ejGcMxppr
	 IlZ2Tdvz8munQBttIfAP+jnH/J+lv/0kRxlrwxswePJdzF0jP1uIA30kULNO0yA8IVC5+
	 1bj5airiz9Kc8l/Dg68Io1zG4NrFI2oM8tv77kGLAvjsIqHT4BxoH1ItRnTrj0vFdkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=14LnegLlUwns0/xDAhlDRDvD4G/8p4sFhn7pqvFB7DM=;
	b=BC4Xs2I5dux7GM5bTbwH6/iNKbsjoI1MDteOid6PjScAExr28sPz6sG6omBku0NqcVlU
	 cXizKsYM+FAg4B3y5GYapfUCwYAo+sai7wfKDRNKKN9gqJQg5BNP2rUbBp7sb9nRF3HiM
	 51vDwrw0gul3yFlMOgN/aHK8o1wx31HG9q8XOnb6cYTbA/vgtxOAI0CqnV3HZiS+WBrV1
	 RA2AvxfL5pcEZb7A+g+GVUZoqqRvfV2iN2jNVsHeDFMlhasaxsv/gt05hneaBGC2ihh0L
	 U3Y5eeES9mO3W2h7M5dGg7VhPCCkoYR+gejQVXBtVrUSGjMJSGKNps31vep7qmc/6DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FAIZKY29;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE31606A32A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 12:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE31606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FAIZKY29
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40312e2so5637420eec.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 04:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795351454; x=1795956254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=14LnegLlUwns0/xDAhlDRDvD4G/8p4sFhn7pqvFB7DM=;
        b=FAIZKY292g4PLAs4iho8SWMuRLmqE93tsKmh7In+GQxH3iPQA8UPqNy6H44ekr1QjW
         JdXkCtltk8ErXk+K3Uw5mPsLyHA9B7h6Xnpc95BBC1yxrZ/2D1IWEjNB12RQtBnm3lzV
         N71BRe6DNpDLOEy0ekAvSvEdLPYTVZtYWlVTxXYTOY81a+c3lTjTZSdWztZ9sdV1VNgb
         0cFfgz2OEGp5yJOtKdeAnKge9RG7S4eZG3cnVG7c7oqAV4o9wfPO7s3ZrJ8ZXcJBG/2f
         krk6ftoxRawuc8M6IEPolfH6SVVj0WQAGltJApmtotnuruQcAyVQ6k1ZMsB2WlCJ0uj7
         AurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795351454; x=1795956254;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14LnegLlUwns0/xDAhlDRDvD4G/8p4sFhn7pqvFB7DM=;
        b=dmgMRA+vY42yYoW8aQFQW8CdWqpaqe2fJzpQT3t0liCiFNcQuOESjW7sitSljx+VC0
         1r+7TI4S0Fycb/u0TlwIrl33FnP3F4wXIAnHg5EQEP2/YqymHV2NoLX19Ws9ehDgGZuG
         /tG/L53ah7alIfEm663UcnC924VABy+b2IkivmQzbGal8pFTfKr6OSQ8382ZsV6gAZnw
         RtRkaPPZFumnI/QjUGcw0tnilhZ9RHBF6TiHbi19attoiuoYjRxFPVZPZDB/PWVjBQA4
         t9EqIbeg6GvDNZ5REViWoqdxfwYc3mQDxNxHsr6mp0OeD4p+RTNW3sKWZyk8qFVIOqkF
         Ok6g==
X-Forwarded-Encrypted: i=1; AL+hErHnYiiiEGCA1DcWpmnwkIel8O7zoWF0HAL4kckFlPf5Zh4sU5fD56CsOW92BATZ9epM8NnvgO7fNd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MNsY1zYg6k55G41+jTpQ+GB4ifnoUN26t5QzgVhpsRIEA1Jzc
	dDjUAqsusNH1HyvIGisavcfOcJWWzICIW78K6jIt6y9gHmP8bZZZ3DWX
X-Gm-Gg: AZFdTZeIndOeEhyJO86/a/+YVeO4fPm4JYTt31KlMCMReN4FqOjsnenq+wbWM6o8fbx
	tSbkidZEvBmgJq+XnTzePOByHO+yhjqV+WSN7WJICupbBlwh934ag5Ge7uVVIA1H2kXrdK2a/9G
	hdBDa+AeM4ENkydJhs2unTw+3fR8YZWZFngDHxXOa0rhAJtSGYjlhc9h3OUFvu4zyiduf3Y+88I
	x9HL1gwX3iRTzLP+XA0kLx2l9zbGODlOfyVkp8Q5/pgSDNW2LWYWwDpNRDj2MuQwgi3TmnkQr+D
	TPE6bIKzzlDbkOlnf50U1WAvUeZl9wvP1Tc3UHBMEpmzrDc5Dip8y2cK/g5ODEJzRzVIImMVvf+
	Z8NCW2Fi/NrXvFdEitU7AFQHf0Z/BPoNaBCKdrWIDEVbv5CVI4/QefAKcBpiUCf8M1+rWCsY1zj
	K9RiziZ1n19Z8BooWBowE2l45YNCdOb/q/eX4uJu22I15izZdYt0MRvs9BMx8O8MlzXOHVODc5Z
	Bp26aKnnBItkcx9U6m3wI1FeAT49LVlWlMtfhJkvTAmYOXbZ5BtZRLIZFDblqzqtia1WaY2zb0Z
	lIaJVCQFryasczEodKjzbbtzui2ZVPnsJBa/32a3YsaUCmymnxg2jlh/XbPFhVPmTedy
X-Received: by 2002:a05:693c:880b:20b0:386:b025:1e1e with SMTP id 5a478bee46e88-386b02522d2mr110063eec.16.1795351453747;
        Sun, 22 Nov 2026 04:44:13 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm33447310eec.5.2026.11.22.04.43.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 04:44:13 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Gregory Price <gourry@gourry.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	SJ Park <sj@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Yu Zhao <yuzhao@google.com>,
	Vernon Yang <vernon2gm@gmail.com>,
	Zicheng Wang <wangzicheng@honor.com>,
	Chen Ridong <chenridong@xiaomi.com>,
	Tal Zussman <tz2294@columbia.edu>,
	Kairui Song <ryncsn@gmail.com>,
	Xiang Liu <liuxiang.277@bytedance.com>,
	Ehab Ababneh <ehab.ababneh@intel.com>,
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Hui Zhu <hui.zhu@linux.dev>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 02/17] mm/memcontrol: allow update of LRU statistic without holding LRU lock
Date: Sun, 22 Nov 2026 20:43:36 +0800
Message-ID: <20261122124345.66978-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
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
Content-Transfer-Encoding: 8bit

On Thu, 19 Nov 2026 05:03:34 +0800 Kairui Song <kasong@tencent.com> wrote:
> From: Kairui Song <kasong@tencent.com>
>
> To enable moving file pages in folio_mark_accessed directly and lazily
> for MGLRU, allow updating the LRU statistic atomically without holding a
> lock. It may cause temporary counter underflow, which should be fine as
> the counter is eventually consistent and only serves as an estimate.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM,

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

> ---
>  include/linux/mm_inline.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
