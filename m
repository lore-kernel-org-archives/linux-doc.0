Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618127;
	b=z2IitiIeftgFvlKlHq3CaixtqqHQtzFA93X/YN7FMf1TdVLMMS4hRocLF15ufbmSncTQ
	 NclYsHcXFBBDhxfq9+zIq8GCJd1IrasJZlAMT0Iklrdry3ecAknhSnLNu5T6ZxtInyi0r
	 MpdQnmwc1YiVKqbcyLb5xcnLwb0/AgHIcwt8GXeK2W+VNY4GfxfJRf4K/gopQvqDlMPq9
	 W4cUhdo3I9b139rHaQbE91GNbCSyT2hS0sruKXXtLTKEAQL6ogkmgcVkzPDXggdXpDG23
	 r8FujscsyCzFqPyS0S9cFr25sVPLJshk9yX4NTQIuud/wzFsdjaftFqbByTCvHSELNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=6SzHi6q98Zf0qdkiRBybrf+muUBlPpBVfDjgB0DMVkw=;
	b=LnKziJrhtKwHklOq01foydnT4gBLyAcut2+4fDclTbxyYX2NddQma5bdeHImQ8dlTYoR
	 kX5CETVTNEQHwWC2ORmSN0lJtGSAXG131C1de+j3VCRBB8z5rPzu5ukioI/N8VmUOy9Ns
	 oKgiuxmob4LEfG3dLwCridu+Q3YoJ0hFptUJ8koSUXPkRvbHPts+kN3uQbA+/aFIU7Hq5
	 0mTCxpYfrSUHjBjanMNtdD+iBhbZQHBPjS5R/85PUrV5YEGIy0ByoxNtvDMivuS7HrfCG
	 ihfSBgxntF/7Fs9sQvvSiS0P+axyegpxzwq6KsN4CgBMey7gwh6epC5I7h8KpR/fmEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HCdkd8N1;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E8606A338
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 11:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3E8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HCdkd8N1
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so25891015e9.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 03:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793618124; x=1794222924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SzHi6q98Zf0qdkiRBybrf+muUBlPpBVfDjgB0DMVkw=;
        b=HCdkd8N14dhw0wD76Fi6xYluJmi7zfqdDU+bd4lCW+LOcHyVT31OkC/sUlkbmCxyTP
         kiMh3d6FVUO2vjKqGXQYbYDxLXk9Dr5zhOZRqZGtz7ZgX/D2ClpXVpbyJTADnv8ViCDw
         cvziZAbTssbrRwJZCoJMzs8zs97k2K6y9BdwH2c179M2jN+GaYkvNa5k8D4Ck9WtjiUC
         kk9PaluE9YxpkJu/sXQSpR1DJVn04nCjWcNJUtKIw56sFYVq2BHujRXerBK1NVk93Ju2
         iW8Yk66kGYFAfzGJsABvDfOvp9/gwq6gFysjcQa3bfOBstgYPj2tUAalMbZx0pWrXg4L
         rVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618124; x=1794222924;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SzHi6q98Zf0qdkiRBybrf+muUBlPpBVfDjgB0DMVkw=;
        b=Iw1pUyRS4Uu4TWPZ1GjYo33XyzJ2A3nDIvIQxV3NuL62oDYdLkU7LuyHO+7xuRJ8t+
         v8HacWAqh3vqkBPKC3b3q4Dl4nvk3Wa9KfUNZfqR6aRMxt2GIgWMO3yoSQA4e/rVq8a9
         Qh0APb6dgzAEshcpbcg3JPWyf9d3gUgBG6rpFomWN+0B1RpxRyjadlFG2J8rs/z730re
         lb16Fn/u/b49miPzhX55+grWU/lPvtKMrYjhIJnpv3zvwokSdfygf2nc4+abZ4CqXKEl
         HGJnep/YikKOoVGM+sWx3qf+c7zPMx003MNhSg6rIIP7Nb/mY0WWEWoImUO1Dt8GUi68
         tmWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlUPgDaJgKPziK00++EC8jaG6OkEEybVobMtL5rBsNrfw8nN0G4Px/uGOBWuwpfZ01T7ctpPDv1Rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKADKq9omnS5zAVoZEuzZ1uqGAIY7n2dRtvuRKn1DTFXJn1R0yX
	atcTyXNupHUVEeTLF/3UJYvcFghF/DbfZhA1GH5Op8ZiegH9otRKlkVNMO6qGeaKDi8=
X-Gm-Gg: AYBFou0a19g04vciSdqgqVrbzuJ+T9gDgb3+1w2P00evXM4ApCPLzx21tv+YITY6XPE
	CecdrzOz0Ak8niowHAZo5MDXNJhfRWeTXX4iN9Kkk+EJKO2Xu1K5DYIGYN+KDyfS4Idc+rpc5+q
	NTx3SdC07MTrn0uVeJTir/m8hgEAn2/SpOaLq+muvTVJzhqGXZUu5NSFrx1WbZbg4sePe0nR6S4
	GZcl3vx1kWzBHJDMdac3XAIOWmyp/+TLRI9TYhEuWy3q8J1FF2haLRIcoMftrpHuCq+lbEzCvJ7
	RKVqBOvUYAFx2ydTe15E18GLVKkfSH3RsV7+L6GUmXMguy9BDY7vIhvS0cIZJzPDKGze8covbSx
	iI2z4xDnDEVckZ5iR7a/bQW8tdX2LRLLYJiMsZ+xjUXwIp+ZIsWK843y1JrVj4oAyDtgVSCqBFW
	VNSfozYuqBLdgc5C+vkOrNrSKuVAykPwb1ZX5iyJoqbJuhahLoYzk3RjCy7zy5em/nNPw8gHecQ
	P8cPAmk5g6ZctFKnDzhJXwD8bfdglzVMQDbWzvtJ0M2BaTetxdLy0hPLX5utPDq42JD00BCG8Dv
	5CrleIV9hKpdekVqHZj/WjidYNcCiiIsVzq18PzaDW9tTN0jAfN4/Y6T7IbKEFcEnh1IZAXt4iS
	hlHxr
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr223689725e9.0.1793618123741;
        Mon, 02 Nov 2026 03:15:23 -0800 (PST)
Received: from localhost (dynamic-002-212-042-085.2.212.pool.telefonica.de. [2.212.42.85])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e71ba4ac6sm20690038f8f.52.2026.11.02.03.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:15:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] bpf: Use "new" URL to show if net-next is open
Date: Mon,  2 Nov 2026 12:15:09 +0100
Message-ID: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=kpOfJ1TrfdZHVkYvKgtWh+AXcSeppGLvncABlZecPo8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq6HC93TXUT0SXrPrMSnYvXjPvFbwfwFOJYXn43 P33eb25CKiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauhwvQAKCRCPgPtYfRL+ TgMvB/4pUxHXRzHQ8AGPJ4+Lp/xNQIHb0Cs4nPBQ+/e8+9kS1mMWqvZKaCxJDgfo4Uyc3LNOhBU Q5SFNd+oAZ9AG7cN+tLK2kRrPXtGCXT/rRswzZC4bwIcv/60jCJyLww9H2dFvrOJb1oBqifNyHd 8evI3/4wUM/7Rqqgp5xCQgK9vo9ASpmp2pDTVHkF1NJRLu1OiwX4cf6Ttjl+72IVtue3osS3P/d X/uRWPVKGlbCxK/QsON3JyWBIj9VAsHBmkpdxQ5fFrcxU54ZJktd476W0vlmXC/zREfTjKON7kr 7BdmWpKHO5d+vbXEzSrvvj+j28aEiTxDTfHoCx7sgJydJGQS
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Documentation/process/maintainer-netdev.rst was adapted in commit
524500873802 ("docs: netdev: update the netdev infra URLs") to use
netdev.bots.linux.dev as base for (among others) the "is net-next open?"
tracker. Adapt the bpf documentation accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I was unsure if I should delay sending out that patch, because it might
be considered a fix and I could have talked me out of sending during the
merge window by claiming that the (old) URL didn't tell me to delay :-)

Anyhow, it's not very urgent (I think), so I waited until -rc1.

Best regards
Uwe

 Documentation/bpf/bpf_devel_QA.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_devel_QA.rst
index 4729efd657c3..7f1531f0848c 100644
--- a/Documentation/bpf/bpf_devel_QA.rst
+++ b/Documentation/bpf/bpf_devel_QA.rst
@@ -243,7 +243,7 @@ a ``v*-rc1`` after the merge window, we continue processing of bpf-next.
 For non-subscribers to kernel mailing lists, there is also a status
 page run by David S. Miller on net-next that provides guidance:
 
-  http://vger.kernel.org/~davem/net-next.html
+  https://netdev.bots.linux.dev/net-next.html
 
 Q: Verifier changes and test cases
 ----------------------------------

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1

