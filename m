Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4E46D57B
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656956; cv=none; b=UxUgjHT84KWrcYiNqM4FrBOfw2a8n7fBk5gSP0HRq+AGW+AjpH3Y5f4/nialDYRZ3SUsCNru3vfClYMJy6PFb7YS8mASKA/CjpbvruJUIT8nirkq53Ie3P6QnioigwS3J9kLcLdeHNrTWTBMTBebsUEpuOs4Bq1zOC2LdAHHuTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656956; c=relaxed/simple;
	bh=HKH0+HbokDXh/rn5p2SK+C0zJmVZ73sN1daWgM6y5QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+QUpPF6vKrGencvDemni+n8zj5kQzBWNxfIcaThzH+k50oDl6NEMnZTbxNy+ElsLX/G0/zrxRuAS6gXH0xkm9R3HCc28LOPRgTDq9Aop2jNU7yzR2GSJmZ9bsT2xSoNfG205kyqya9Yi48EQfo7QOUcJ8lRf/XHYH3xl/Mym3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oG7yqNu6; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oG7yqNu6"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso3397387a12.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 11:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784656953; x=1785261753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ToKjxxyfW8IKJFoIuUe/iSEPgjioSXrKsuhUrkem51E=;
        b=oG7yqNu69K3tLhKYigDMCIpO8Nwc7TX8dlAzrUEWlyawyuOvkwx4U2OuQV2bIMtDqy
         48XLsr1ywQ1VZ2SCVlUC9tf4Hv24x0GVzE/9ei+SVeVxa1wnH+6jLfNTSPgwpgAYOLaU
         /gSr4Ibl8mZyd0COUgV9Cznghbq7v3ABMQ871aMDEOjFrytcXiZPbkrRNdcCyivlCI+S
         Qilo7+W2+myC7C5XPiSHhynb6rFmG8+MewjKUQnIxV4/XlqtzQXkn79RlH7RQKn2VzWO
         q6d+O50AP3bs8Aiqeef2anCr7iC94D+ctN7/47pi36OZd8T0iZr9KEzXoYxqfDr/0qa/
         IH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656953; x=1785261753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToKjxxyfW8IKJFoIuUe/iSEPgjioSXrKsuhUrkem51E=;
        b=Gs2Bmwqych0wACGcPpG/Zu3lhrJAEcsCtsv85E2T2S8kCYlYHZagI9/GaofRULItT6
         271pD0C3/uQmRMGI6/p07tUnvyRDDAstpuh09lWHZAsaz0dtIH2NGb1Hus5b58iBzH/d
         DROaprb6kcW5u71UyNe6KBWD5c7eMuatsaKFzEj1VypVvD4LKjWr81Y9AdvqWUayLdNn
         eXBBfHdvomvGI60bCvBTdMS+WosYhotLHTp/TWG1MpzSHK277bSjhov/63J7+6xAHJmF
         VDUOXDH1qv39u9uZzmqm00Do7ORLGpHydzOOZ/Y+wvrYmprFktuD+KZNjin061KS8UrK
         Ph8A==
X-Forwarded-Encrypted: i=1; AHgh+RrqxgG2nZHeepkj+658bdGNu11v2horhA+VbwQDaPLwRVcTYTm6gF4SjSKACW5rZ3nHyyDHvQHzs8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhvj/fcuCskAbyEWCnIH/ZPylADYb0wZNggfMrEDXMRrnnFCOr
	rdL4Bnc+Uer1cgZ/GV98Mr8QP2ZLbr8u65Nv7tJLguZv1ouEx5zxlVlV
X-Gm-Gg: AfdE7cm+3dStCNeuiMhvqGN+BialEdJqVuYMisTEDf8Ct4sx8VAYhumvZ4U4Gbafh0r
	GYa4SjxkkCHSE2AwuT4c75/YFTopJsd5ZaYcR0r7QXVUkgzd4WNB3kD61nSRoLEy0vWr5Rity3L
	HzoeEEbSyinUp8sgEUnZJaKV7OwP+kj8eAf9pnIWv0FFltIyeSwAiSBwp/rJ10MIRsDPeBSXUb1
	Il9qlEfLEhAARC2T8ytm/ZV497/KIDx4rEFTmLIsDhQZSnPUHU8KUj++eXtjYQPPutj4czNliAG
	ok6Egv/TSUDuS+ukJ1tD25H8uBsDqGtun3/REu5SssyT3GztGDXgTMKnipWZL5ZAIQ9onnMC3XF
	6bg8eKy0kvD82feuP3Me+hssZfwSbtu+uId015fkARMGH+9u33Sb1Xz/MZq1j8qqyI0jk+HKmmW
	7gOgeaYqD6JuTHYOHLoZec3N65kyIh4TtaNmuXFinW93XQCEQE38oyfA==
X-Received: by 2002:a05:6a20:748a:b0:3bf:b625:5bd0 with SMTP id adf61e73a8af0-3c42929ef6dmr608881637.9.1784656952671;
        Tue, 21 Jul 2026 11:02:32 -0700 (PDT)
Received: from colten.. (61-227-26-231.dynamic-ip.hinet.net. [61.227.26.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm2097316eec.21.2026.07.21.11.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:02:31 -0700 (PDT)
From: Jyun-An Chen <jun930436@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Jyun-An Chen <jun930436@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list:MIN HEAP),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v2] Documentation/core-api: min_heap: remove undocumented min_heap_empty()
Date: Tue, 21 Jul 2026 18:01:26 +0000
Message-ID: <20260721180127.132730-1-jun930436@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

min_heap_empty()/min_heap_empty_inline() are documented as part of
the Min Heap API, but no such functions or macros exist in
include/linux/min_heap.h or lib/min_heap.c. Remove the stale
description instead of adding unused API surface.

Signed-off-by: Jyun-An Chen <jun930436@gmail.com>
---
Changes since v1:
- Per Kuan-Wei's review, dropped the min_heap_empty()/min_heap_empty_inline()
  implementation (unused API with no in-tree callers) and instead just
  removed the stale documentation for it.
- Signed-off-by now uses real name instead of GitHub handle.

 Documentation/core-api/min_heap.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/core-api/min_heap.rst b/Documentation/core-api/min_heap.rst
index 9f57766581df..919dcf1bdec7 100644
--- a/Documentation/core-api/min_heap.rst
+++ b/Documentation/core-api/min_heap.rst
@@ -240,19 +240,6 @@ This macro returns `true` if the heap is full, otherwise `false`.
 
 **Inline Version:** min_heap_full_inline(heap)
 
-- **min_heap_empty(heap)**: Checks whether the heap is empty.
-  Complexity: **O(1)**.
-
-.. code-block:: c
-
-    bool empty = min_heap_empty(heap);
-
-- `heap`: A pointer to the min-heap to check.
-
-This macro returns `true` if the heap is empty, otherwise `false`.
-
-**Inline Version:** min_heap_empty_inline(heap)
-
 Example Usage
 =============
 
-- 
2.43.0

