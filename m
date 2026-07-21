Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03543F9F22
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 01:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597681; cv=none; b=dyyDr6Na8qlXa11QBPESnF18RfjNvwdABINZXbTeTe2q9LneSbFioGreQouHK5uDOwkdRNgKGkFEh//Uw6SXFJ+HuLAnZN6F2r7TjIwTn6EvoUVbBjRdMIWow7Ga5W52yLSq9gUZuiEztK0ZrNYdqcDN4r2lrnbi/KWdCJWKih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597681; c=relaxed/simple;
	bh=mJLkB0+y/24FxCNgyMJp03dtT/BJdht1U42+/E+iqig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hpe3kT7Y7gTnFyMheO73/aw5sPtnw/j3VYEdPpiQeTa4Vn5iyUGjh8h3usxZl7spUoP45hUd+3KZn52cGbVWcT+kDJWMroepy+6EZ59hE64NiInY+rX5C8Zf2fN+nlthMVN+3df48m2zyVXdcsg8tJV9bwG35GMIcBk1PFu8k9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VT/tBh2L; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VT/tBh2L"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caf228a910so84795625ad.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784597680; x=1785202480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/tCUmc6Af/w9eCR04YBcQ5lmA7aoPQojmTNJw54oAM=;
        b=VT/tBh2LY1SZGWTd4AR/GFkm/zcDflV/A0+82fg8aap6XKNuZ5lajAl6uLr4ezBRAj
         OIo4nVA8NI/4Yvn5Bk1iXLP+n1siVifvJeRj7v89M7WxQsr428RIbCfzs/MHognwdCpq
         rwrX+H/vTaeloGAaBg/L+9l/9wvFkp7DNyWMAAqTpRY6gFPJiP8hExJNcJV0pIaFtn5+
         H1rfvyqJETqrWMQGTM07hWxHXJVTPWDPCHj/NxCnFCQo6kLoTl1uhUDExHGhLvuAVqo6
         Z+mJ+8zeA2YOp0IwIXreOko63ZWAlu2fZBLLI0MekRL5BvWvoz9wbOrdK6tXIVEsGRTL
         olZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784597680; x=1785202480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/tCUmc6Af/w9eCR04YBcQ5lmA7aoPQojmTNJw54oAM=;
        b=jerZIlo2GaAY2xprewi4gxuLjPqF9BrSS5GsAPSjVj3FofxqqYH0dlcu0xK7foG+ZV
         QP+sURXLmdD7tP8+Wel7Q499bdfHnFHiJK1l8Wml1Edmk8wWCVkqUtbUiw6naa4vKrny
         R5X/h1z290ZEKlZAgty1bMQDVAMKua8CMpbFSePZoR9PqbK3+Ormwnk2kiX7Gc6OIIBn
         ODgfrn7HtxW6E3L0Mq9MFPC2Y4sUxJ1OhZ/S+oXACnlvApdx5773gjhB11955OmZwvj+
         rGGB9oUtXeJU1pGDphXd/HQjaF25jkgrLqcdWz820m9rwfn2o3ra0t7zmf6fTsCJKoGl
         iv0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqyUQhCpc6pTbeFf/QHX+VzQTRR6uYc3Iiq2AdbapT6ykV6VapQH5JFPlxlv+DEtDl5rWHVTxNbX9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLSDdePTiERjPCzLxVlrFXg3GtmnFPF6LUTB24vtP9N3JrMFe
	k9gKOE7rIX3JkhapZv6J7jIK6adARB8mVaX6F1+vn0D6bD4YkGcUgxnF
X-Gm-Gg: AR+sD13Y1rrizVFF5brqNs3ik2+Pl65fMp2XEiR+iNe0aO7Bn42Nd+2lKOQwNMntSrn
	o3rAwUAiiLbLb9dgTG+Kwj+HQx/48JeuyMVAU9rQrzSjrHCJGYAwefxvLKWSNOJDv85iLcmAlF3
	8pxoIDhOquKRV+NoP9DnZjl3Y49yDT3Zf1cX5slrv+j4IJEaeoABunbASB5tfJyTCEdNRs/mWcZ
	jKDc2epUj0WUYQQMExatP6j2rP4OdJRsd0C6jVSWScYgmyZKL95PNNrMKwQeG/7V4qq0Wxv7+gW
	C7M6PnquzWwnHT7u5ZIUAW/pmO9NdKQy6swXvkcu9yvtZl7ic9efw3B1FRTHtDB2wjLL+weG76h
	BXAleUvM0c/MoTVDOzf25LmNtgZ/N2l+bQ2YWSHUPQXFBq6B1awFjE9mwnNsDTwsgMe2gKoysfI
	ZfrtbQeg38HhDjLlGRWavuOvIAuXA=
X-Received: by 2002:a17:902:da85:b0:2ce:93a3:c16c with SMTP id d9443c01a7336-2cf348665f8mr180911895ad.12.1784597679975;
        Mon, 20 Jul 2026 18:34:39 -0700 (PDT)
Received: from localhost.localdomain ([112.65.87.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f91bsm65631895ad.8.2026.07.20.18.34.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Jul 2026 18:34:39 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: sj@kernel.org,
	david@kernel.org,
	ziy@nvidia.com
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	npache@redhat.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	daichaobing@sangfor.com.cn,
	wangkefeng.wang@huawei.com,
	gutierrez.asier@huawei-partners.com,
	zengheng4@huawei.com,
	kasong@tencent.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lianux.mm@gmail.com,
	lianux.wang@processmission.com,
	kunwu.chan@linux.dev
Subject: Re: [RFC PATCH v3 0/3] mm/damon: introduce DAMOS_SPLIT action
Date: Tue, 21 Jul 2026 09:34:30 +0800
Message-ID: <20260721013430.40303-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721004755.93824-1-sj@kernel.org>
References: <20260721004755.93824-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

On 7/20/2026 5:47 PM, SJ Park wrote:
> To me, it's still unclear what is the real user impact, though.
> ...
> Only after understanding what is the problem and how bad it is, we
> will be able to think of different approaches and assess those.

You are right.  I will work with Sangfor to quantify the real impact
in their production scenario -- what DAMOS action is driven by the
inflated hot-memory readings, and how badly the monitoring error
affects the actual outcome.

Thank you, David, and Zi Yan for the honest and constructive feedback.
It made me realize I should have led with the problem, not the
mechanism.

Let me take a step back, gather concrete data on the problem severity,
and come back with a clearer picture.  I will follow up in this thread
once I have something solid to share.

Thanks,
Lian Wang
