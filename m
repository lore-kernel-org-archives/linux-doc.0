Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013792;
	b=b19AA1NOH/PM+MZTojRJjIbziC0Pj6eEcphJO7zTJ6n7ZbRHuu/NXZf0l8Nz1k1tnnxh
	 gtCM2eul8HcJji41TDe3xnJZxuCn9sD67CRrHShhBAAkVkqRPsmK3Ad62aEhvw6iRquZT
	 xpfucuJy1zLdiO+1XHfsDw5mTtstLh2Q3RQxgM9nT9JGMWZ7J5HaSXus/4evcOiFhHy1b
	 SEKjPjPEvfvOb7bM7viFIhcSn0NsWwrc2sdfaJgagbGX5hjfXM+EDFTxRzL8X9Mf9ybBB
	 +LJ8Pd+Cmjy4ryqgUpYAMmuvc2csqcpfnwmXnSmhj1It/vbYiJOc6cJadartxh87ytg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=Pt4uKwQ2JQMqBpqG35YVL83bINioR+SmPDBUrwkRSWs=;
	b=pfpkf+XmHyD8Q2mvdHf+dd6320FohEf2/tTedSJmwGSOsghoTZX1KsvuMLkAGtN7sug/
	 ARJf9Tw14WMpSSmNPH6MRZEjBL7CS88AlpU9hiK4Lg/lzu8DmNhbEyZ5CrXI/H+4asqco
	 d2afaYEYcF1HRm4lg1hUhi21jAfc97h+lnYdJSnMy2HNAE87TJVl4Srn4wcZiT5l/upv/
	 v71WjWctpToKOZ5Bq8WekXxlO0/VO+Z2KGON8++XUiwxqjn4DsAPBoJqXiZb4mJo6IzlI
	 3CRxBR5x91f9wV301NDo/qMwg84nIAJXoKJvuqdbZde0/T4QXHOKSMesbIYqKW6JyDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daGYSa8F;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ED6606A32F
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1ED6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daGYSa8F
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso335907a12.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013791; x=1793618591; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pt4uKwQ2JQMqBpqG35YVL83bINioR+SmPDBUrwkRSWs=;
        b=daGYSa8F8xbIMySK+Pca7kaOypuoNEpJVcyKqgAYf06C48zjDKxHWPSUsPLFvaLEX+
         M0XmVWpECqKwJNB8LRrAGriON4KPD6jl5qItXhnYCZ6gA3MgVVUrFsvbb4taXwGm2KkT
         mXarMeCKjnKudQe0uCBL0qHn9axr1wevGz9keUKeL/xmN0h9xqYbgp7YzS9U5hT5UqJ6
         u+XKl9FEF7/EU91K6g9X/GUOP/nyIe9J4EcOdZAJHlQQhpahVM0ZGZGMM0sPje0Fyv8G
         tkyHiAvqPTTxNZB/RLxiFpqm+MiT8KTEhZpbGSkEu2Kh8S8jtzco56ngT/H8NWyH+zFG
         /OyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013791; x=1793618591;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt4uKwQ2JQMqBpqG35YVL83bINioR+SmPDBUrwkRSWs=;
        b=wCIxN87ixIjUraUeiQr6US51dkARDs8dCDwMgubz+ikn4x23zik47oayl5eNsPtm0g
         JLB5bNtddI2LNjF3jv9LI3QJvPd3m3YdAK1UP4u+71i7e6iZjlmJ/vaAhYyFq2CMkxM2
         3ehGyQPbnMalehmjsWEaXOIRdaTDAVnnUf+O39zNWo9488XcGwSWVkdfM6Xd58SkdnM5
         u5KiAU71r1aBn2i5Thav9Va8voW0acUBPpeXHP8PBlo9bvuuqXc5rCqsnxWei5KgpxfE
         dArLiAX/cS0i2ehSyzSDDzWTYRvuVnFsQ3mR4X62Qb5h1zWcNwNP8VqMpx1eCUQXXVnX
         u4VA==
X-Forwarded-Encrypted: i=1; AKwUvByTq9fsqGUscpF2ExRE3FOx4ziI01RyS2b3AXa/FSaUCB2QENULKu5FaqQ5HBWlJnlKF5YPP7E4i9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmndrYvsDKbDsOE6q+bBR8CTLpuoDLr5hB0aHKlm2NM6CfelWV
	WnnSesJxXTulOkt1qTva3qaGTszi7D+KQLtVvnI9djaeGxUpljw52fgR
X-Gm-Gg: AYBFou2dgPKHGsrmxgU6EEGKHM9Eu9FpgZKkunkUAzSuQ0CMaEV25onWR6k/xUgEgw5
	UB0PN+kK4CunvJVaAO/sj0tlGrK1IuwxJhctZtdk31uOrrDvZJMk91LTXe4JepFQZ6vD11JDjCP
	+/FGfkLJ+UqsBEbG97TMTSPwdohBvLJgugcLTrS5BkL1c/j0QH7f0VC0sgV5fNEo19fdHMn6PRr
	HwJ0+S+BbqXZnVGS3Ee8ipsF7eC/izsNaVS1lSbADPVrQlsABFiUf1nZrLzv8BOg63pzs1K2gvd
	85UJ+QrvKCgPT3A8LR2D8w9v4p7K1z5PlUAHOjcVizG/OhyICrn8fc+/bti2D4HT8vRWKXZ6Fok
	KR6HVc6LbBcTE4F7X9MqKsUAlR6v+DX9tcGB9/y0Ds7RbRAQIt8kGt7pZ0a0C/gX9hUOFo/KPca
	OP2Cdx2SHybwIrJYow1JBsAqD3Y1ZC7P00hLoNIlCei+sUWw/2GKz8+zURFxRLVXtgLrV0zcREW
	vGzEbD7u/h+DkW8NMaTMJh9D+kVhKPE99zdyPGjjlYZCvQyatpRPgiYU8eb1fybVXXgV9SPZjVs
	B+NrXqFozDDpxxwXxwxMHvDh0FFUSEbpVNYXNQa50r3iOzucXeiCLA==
X-Received: by 2002:aa7:8895:0:b0:89f:43e4:8ac0 with SMTP id d2e1a72fcca58-8a367824c35mr4636851b3a.49.1793013791296;
        Mon, 26 Oct 2026 04:23:11 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bb2968esm1150041b3a.35.2026.10.26.04.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:10 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] Docs/mm/damon/api: fix verb form
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
Content-Transfer-Encoding: 8bit
Date: Mon, 26 Oct 2026 22:14:38 +1100
Message-ID: <179301327249.2.1896995843401183120.damon-docs-grammar-6@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

It should be "All you need to do is include", not "including".

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/mm/damon/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/api.rst b/Documentation/mm/damon/api.rst
index 08f34df45523..1f330429b486 100644
--- a/Documentation/mm/damon/api.rst
+++ b/Documentation/mm/damon/api.rst
@@ -5,7 +5,7 @@ API Reference
 =============
 
 Kernel space programs can use every feature of DAMON using below APIs.  All you
-need to do is including ``damon.h``, which is located in ``include/linux/`` of
+need to do is include ``damon.h``, which is located in ``include/linux/`` of
 the source tree.
 
 Structures
