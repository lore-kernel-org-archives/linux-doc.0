Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347541;
	b=alloJsWwKiNS3bawYA29kM+uVjs9WCCG6ddhTvU12vD8KXniYUSqmVa8tGN1jybQN8x4
	 l6J/9WprBRR61yw5N+kjJYeCItzMAnvdQfxWNo+vS2SiQv2+k2UvlD86/5Fk4klU4nPb8
	 w6yWlam/EKB0zNHf8mTXUtDbFAIQmXg4LokF+KLx/EgnM2v1A3XoJjxC1jtQ6bXBZ6yy4
	 GfZMZVXG1uF364WdsdydP08A66R//F2HcYa9DCwNFJJdPuDkj3qZASrixoYCk+og0KMtR
	 Qdl3WDR+fMRAimK9ouznj/sEOqaXEIhF/WSf0gOBywqOplOEKJBGSGl+29PEGd/e4PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9SL2nw3BljIJfL2BNxy4TtTwunpxe4OhPHoB+8Eji+8=;
	b=ErNA7NRK3pIgqP/QGMMDdX559iwfOSuoFg0KQn48uSwrbxd9L6Qe3Sk4X8c2FiK5fhTu
	 qpeane8tYiWlOtZb/MjbnXSzLJzWxQY7HQ2GW5/tXo173qwx0pf0M6e68eKK+5B+I4lvp
	 TnI+YSFJgnew6GrN7X0ndFr0Pt7W/aTxtsRoSE3+iVW4bWGHCOvIkwBu9ddaudGz4JuQ8
	 ur/8KmrKZIYUxfkP6Q0sPDhNq0sLcHU5h6uFVfcredpBi6zpFKhcZH2fOZ5xmcOJQrnsE
	 ox+8t0hKP67E6kw5+GEHlQsfHPtdudffIw8YcDnPxgMQh640vMcxY/FyPI4jYfkEpjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWH39Jbp;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16FE606A32A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 11:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWH39Jbp
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so7176219eec.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 03:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347540; x=1795952340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9SL2nw3BljIJfL2BNxy4TtTwunpxe4OhPHoB+8Eji+8=;
        b=xWH39JbpK+tCheqveo2u87AQgq0TnNUTvJnMZWpxRBFIlKxzsEJJc0OCsjeXDFd/Rt
         8r2t45ifgCg8vHXxBmEn6LGP+C7AcPS13+4mRxdWPaBivAKml0DlftZOdDlin+l9bTCi
         +SDVrJ5UL6FBmF0XE+CLbRFyWoYG7wFwdoIiNaxldrUJl5F0VzDOkTW8aInFIK0tjurH
         dy77usrjTK1GFy1mCLsmeN2cOt2dLUoIQfbDibM6pAZ0jM/GyNTMRl9YBtHUBR0bqiSl
         RnYS3kHMqPY4+j/rYH/gtt6AFODiGfwRIzD/ZBd/dX2PrbrHI0PO+IC/073wauJTK+zh
         QLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347540; x=1795952340;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SL2nw3BljIJfL2BNxy4TtTwunpxe4OhPHoB+8Eji+8=;
        b=TifwK6G7BG2sMChRdX+hgdelqhifzstnu+5WuyTetjw5MDcOxZkBHR9pJsCnzrNqaM
         QUW2G6mkaseNsJrMx8rdNjdGNF5Ky2wcqdn4ULmjIRdTXiT2DEiSW0lKA2nG0kWQoxOk
         b75cngXNVvkBKs/NbzPneKKNsYIgno4seYWSIHhXUJI99W0zAMcp7xFAJW8fx0G48aTq
         +SjCGTUwFzXQLAdns34ZEs/AtE1T2yQRzfJBHPonpW0hAgzQ0M4xtszSfanqVFqbfISW
         eqwK8hsuMTZQ6A4jhGGcXHmgtE+AQEXeAG6SV0GIe4NNGEDKXUAko+fKXMEZaGvbvqMa
         fAhA==
X-Forwarded-Encrypted: i=1; AL+hErEwa6o4K/oLWIBbdvWQJxyjlXoxKutJ46/G3mizP/A2QQYGfEPw05/aXyc+BWkQDYYKRvHqc5YJXQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yUxs1Mqud5Gn7tjue1dSW/RDlmX13Nw6afNq6QcjkVroRuGPJ
	OOogpdrBx1Eh/qtnkjeuPUePlZlcKfdOKeykdA9BR2T9Wb+ukye9hqlw
X-Gm-Gg: AZFdTZcwsoNZFjSMJMclQMRL7FvWfrfkW27F9YvQx2HngOO/PkMcpzaFHrRoLR5ju4j
	DkBr8+xv9GPY8/iJxyNv8KIRU+5AJbZglJ1obYk0gKoICFiSPlbd7U76sV2fYAgfs+eBOCBvR9u
	qsJlZ5/qEHwS4mrVa0yB/+Ada1qMJAEwlNEWSj7I3rPgHQksBh3ZUCJoo4prG2HeHgpRnXsbvNv
	udhY+iUCwwaubc8wtrDTrfsL2tsC0iUcFdzj2VO4XjEKoATDPI8H13ZyySoCmK4medNjSPBrnJl
	glVJFbCqpBm6Qg6bd9WzNd4rFAyP13qCBr4UhQvGI6FBK+tZ/mObclZ76Jlhr4Nuy67gEwZzK/m
	QfkzUlRXumutv5cc9tI9YnuN2W1mAAbovyM0N1h1bNfXX94zbRnqjOJRLNIwfNGhHZqjj16C3zf
	D0vKXjhGo1IIdF/GWtfw3Nr6Qx+C9yZ6lTX6PoSRFIF0h6guSANjmU7szPDQUOt4SqyLxt8hRJx
	vJPf7ubt5nQxxIyeZdzdHk9Xyl6jGdsbbP+30iDC5Tff18zlDee7Ds3fbiTc8Bupv0p9O1Y0eYf
	ly3sSLx/kA5t70chxZRvL3I5tDdOrq+zZjPeYecnuX+0lPJbF8R1t6uEaen7PBWvkto+
X-Received: by 2002:a05:7022:f509:b0:1b3:ad88:b9c5 with SMTP id a92af1059eb24-1b5568b7e07mr8368775c88.24.1795347539687;
        Sun, 22 Nov 2026 03:38:59 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm3717851eec.18.2026.11.22.03.38.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 03:38:59 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: wang =?utf-8?q?lian=EF=BC=88ByteDance=EF=BC=89?= <lianux.mm@gmail.com>,
	linux-mm@kvack.org,
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
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG) and flag cleanup
Date: Sun, 22 Nov 2026 19:38:17 +0800
Message-ID: <20261122113833.62817-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
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

From: wang lian（ByteDance） <lianux.mm@gmail.com>

Hi Kairui,

On Thu, 19 Nov 2026 05:03:32 +0800 Kairui Song <kasong@tencent.com> wrote:
> - Rebased onto current mm-new.

The v5 build checks on x86_64 passed without issues.
I'll continue to report results from additional tests and workloads.

So feel free to add:

Tested-by: wang lian（ByteDance） <lianux.mm@gmail.com>

Thanks,
Lian
