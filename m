Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C512FF16C
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764545738; cv=none; b=q8yigOriACOa1FkGVDQbPQkmCxuX7y4rm4Mn/Z4X4YR9cIkO4l22FabrAzv1SohOdd6LxhSZUGeTpyAz3uU5sLJ7UF79Qd1u8O52M4Vu3d16Ulo8pbzzzpzKgmbXJ7ZYn1w+IFx2+uoMuZ+JKS6ITRXHvnny6jk5mBCHBEXIlEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764545738; c=relaxed/simple;
	bh=G7RQvwuA5HOESStkbO7E13FYoPystOeEJRkdlljNekE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4qhOY2akYtZTUYRIGZjv67spyZV1nYc5NDo2erpZOVB+ep+UM8Vwz+KztJB3I9vyskr2TAv70Yq7nLKINe7GFwuxdd8zBw5K6ubu01ZdBt372LEPgkxlJKAi4PH35LpscgwuGEWZt6J6cuAFcb4PjIdkg1PW3b1lVdWbB0vapE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWPJXlyG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWPJXlyG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so31106855e9.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 15:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764545735; x=1765150535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqQYwi6yKkW0pXFhK5Fhz7jwEEb4HUCqJfGCd/MpDPo=;
        b=PWPJXlyGt4wao7lV6oiZY0rxvEb8bgtplIE237q+H4mxDYxj3xg0vcLxj7XidXCpmU
         Lvi5QQfarmRv5UKCd7OviYxXSpVaYeXR6/4cBy1r+sYwURl6ydLsuBa3tNEqcwhranPO
         CbmBRJvmSsdsP52OcGlwC/xVB49PUQ+zUJoEDBLpDMVtS0ih6tlBIlk0zNNlxJDV9ioL
         P94dYAmPleF6O0lQM5syKuOR+kfsjbjiAx58dzpTzKKxRgW8pM5mLBQ+eRO8ofsFA0L8
         UsL1T7fG9mJOsg/TwyUEdclaUtmt2tTbsPzNawTJPjJCvHgxbx/ZHi2JaRiCMG9PWtBF
         5Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764545735; x=1765150535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqQYwi6yKkW0pXFhK5Fhz7jwEEb4HUCqJfGCd/MpDPo=;
        b=Agx+TQbJMo3nCuBG/+DsrMTSYBTFlkHHnTnMPYZ0gd6lnlOXo+f6zd/8ptan3OCC2v
         Gv6csCtpeWVvGURGRbprieVAi5jU3xHpX0fmRO2XlQZ+i3TrWhcQOY5edcr5bxSCEm+V
         VMYQXcFD0G5prdPSmpGQ05ND8IZxTL05VJUECA4uxRFWiIf3VcrvW037++BvIDxMo/qE
         CIunkz8IbCFgcLKFoJLfhEE8DyTmfl5t/F5bRd1PmC1ZBoGPpF93YBDQo3Qf6i51JDM3
         bqAAeKZt3sSaXOxl+MJiayYt2apyzk/ywrJNaZyaRSIL95auryHBwcpMu7HLnVSVxXuU
         fYcA==
X-Forwarded-Encrypted: i=1; AJvYcCUolNr3AloRvJCuO2LLnvo/KhdAqQIID0RSEuE4FnYf1xdC5w8wJYJKOqZyJABvG8JeD0wPKWq2uww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy41KBDWI0L6CcL+EhhZ+D3gYlHTYzZi0QTDjxs7dTBg22GhKYX
	8TTWJTdIYFdokDSvB/GJCIJl0ZMJcsZMUFJAcRGOpta7/2XXxTLzWWCt
X-Gm-Gg: ASbGncv0VLbO4F38KHtIK4Xr+DA+otfSOoh7IyWmkqg5TyLUvuDP5Imv1xDI9Q8aLaa
	iqlCOIAjG4ieZzz6JRFriXp8ItlvOXmJihZOmDrIZG+aMOsZuon1hIEqOAnn7UEmgiyu+434lHX
	zu4JCZyMjzw/+A7XvbhnS9cUdZ2QZje9S+8VbgRuzQhqcV4lvGNihorpB9cKc1npmrBNzPFpqQD
	/Y7E48QphkvOmayDtcZqeE5HWJqTYY6dc9yMK20liu68QItJDWyHOm15LqWD+vZder4zJUboZ8L
	j+vUXktkcH2hwQ7yK2WjyXWWI2sEyYO6yuOMsxwO+Hoo6F3o/z3biCC0mdBnLjWBtKPrty98+Lb
	J7XRnLbeUP3IR8byxUPm7PBp7zxcqzCuEZ91M4WSwVH8iPaioOoilsosN4/v2ttYW9Rlhtf+Iq+
	TB0Kw4/c9XQqxA3Bepp4dGsng6E124fyyo+NOsHt3JblYYb/kCQ6v4DStICtnl0uN/UmzlDt7AA
	GRLdj9EJH7aguHZNXTb65k8+TU=
X-Google-Smtp-Source: AGHT+IHgav/tPp3nDxDwQbNFJXjlN5z5JlpJjaWPnlbmKTfJs2yUPwa5uXWlHjxmsi5Gji90OcciDA==
X-Received: by 2002:a05:600c:1c1b:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-47904aebebdmr257224195e9.14.1764545734689;
        Sun, 30 Nov 2025 15:35:34 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm142722075e9.1.2025.11.30.15.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 15:35:33 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	David Wei <dw@davidwei.uk>,
	Haiyue Wang <haiyuewa@163.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joe Damato <jdamato@fastly.com>,
	Simon Horman <horms@kernel.org>,
	Vishwanath Seshagiri <vishs@fb.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	io-uring@vger.kernel.org,
	dtatulea@nvidia.com,
	Stanislav Fomichev <stfomichev@gmail.com>
Subject: [PATCH net-next v7 2/9] net: page_pool: sanitise allocation order
Date: Sun, 30 Nov 2025 23:35:17 +0000
Message-ID: <77ad83c1aec66cbd00e7b3952f74bc3b7a988150.1764542851.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764542851.git.asml.silence@gmail.com>
References: <cover.1764542851.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're going to give more control over rx buffer sizes to user space, and
since we can't always rely on driver validation, let's sanitise it in
page_pool_init() as well. Note that we only need to reject over
MAX_PAGE_ORDER allocations for normal page pools, as current memory
providers don't need to use the buddy allocator and must check the order
on init.i

Suggested-by: Stanislav Fomichev <stfomichev@gmail.com>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 net/core/page_pool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index a085fd199ff0..265a729431bb 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -301,6 +301,9 @@ static int page_pool_init(struct page_pool *pool,
 		}
 
 		static_branch_inc(&page_pool_mem_providers);
+	} else if (pool->p.order > MAX_PAGE_ORDER) {
+		err = -EINVAL;
+		goto free_ptr_ring;
 	}
 
 	return 0;
-- 
2.52.0

