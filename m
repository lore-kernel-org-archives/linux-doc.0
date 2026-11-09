Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187384;
	b=T1gylajyReLNydH6wo0vcifSLpUiOf8aqmcNcAZCnFYMO+zuOfpq4U3s0K7oY+lZJPqd
	 HlMFT5elpk0lmeaVkAEbLWdEdNZ0kNsSQhoxsTr6vq7QfynGAI3A7/ljm09DZ29NyIF5R
	 G5Rlzxma5yD/WSodqYasFyFSTQEt3i17bsHGefx6ucBWfxvILCBhM0PeQcwEb9Nwn+mck
	 D3OjWwgOO3OI2isTEjIp8Gy9DMozfvW3opWTluPgCQOhNZdStTqypK/lF6zsxLtwfJwzj
	 3xY3dDXV4HJvDj9ea0ebRqZ4MkLFAkERU3WH6mYfTOPz0FssJ7dNrsKgFSZvsWxGNAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XX9ESCVfSBNTpp12XWWFYyZTazCHcyRRL6wSEZ9nPSY=;
	b=46MUXZIo8A5qd/1t8VcuzRQ/gvTel/Xagh73vl4U7M8f9jqfQ/ULdTFZWr7gPedkzD9s
	 Kk57tR+6NTZTU+h4DREka6tHlpmdw8l78R926G9DI2fW7BqMIjWJVGY+5kYT9HJeTM73c
	 1wPeP14Drwq+iBqYvqAWhOlNg6bhCiJpXg1u0BODcJXtbM5G47PQPJnlrFEPp4PUrI/bk
	 YPgYoXwfwHfsICSw24mcqPmqMKW08ts72BNueKBNE/qRNsU4f81frPqEuro4Ht5X1+4lL
	 4kO1LPlw70o9BKvh2GnQi68mzxrhCrcdxRDf+gRyfFeqqfQd+1RH5yPe1pusgwsuosA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SE0qTeFz;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2260A260A
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 01:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB2260A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SE0qTeFz
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso364284c88.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 17:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187383; x=1794792183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XX9ESCVfSBNTpp12XWWFYyZTazCHcyRRL6wSEZ9nPSY=;
        b=SE0qTeFzqaJu1j4culD59qlETogr4FP2tlhi3RdWubs2Rq6jhDqKWZvimjhU1ipQCO
         BED90XOaroUx7mK3TKABT5wicefxpFqjgzEyVcWH9LZb6WyLHUvFzDiM9ccNkHq/WY1m
         ZR0TtXFtschd0HQXj+fYBViVncxDK6vmflvAfcQDtx6H72X5G1WjzntJZmgQOJqZLrdD
         mYAPv2dNk6EnIB7rdZX0yVKJ/3PgNdN62PXUsT2c0aiem4FV23qwQaydrLsTgUjR/9gO
         sMaRYZXGJVSHxLdIijypmxp9xqYE2S064M8BEvrU75am7Tcfbx20c/FyRHDRaBIcbTIt
         0clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187383; x=1794792183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XX9ESCVfSBNTpp12XWWFYyZTazCHcyRRL6wSEZ9nPSY=;
        b=Uq3lqOOFPrPNc7h5D3ycx+c+3IJXEXySFmbTuYqhi7dKaXJdsNjy1FkT3CQVR2pLQJ
         HexELmheGWJPiYu60PUkNs8x5fJDlmcFevJnXdEVDkEuIhQQxhefo4XptOcASU8AFvEP
         jrl6V1Xwvq+HdYQF1+9Nc+z0tkeZIYuUsl+1aoslV6+8nnpzjC8yxZxpwULd7PHXa15U
         5/I7wf7Yi8xVBrGBtto14PK5bLfGFPOh6qpjEVvmLKeaTVyUZ6Q7WEUR7x08xarl/gqb
         x/WhWamrQY3Ud+jy4FFCdc+rOY3zauKiK3PKtj0jctAYdEAT0MH2YZ5bqaoJvIuWsZn2
         I/8w==
X-Forwarded-Encrypted: i=1; AL+hErF232R2nxh3rfvPMxISjG69e9Vf7pZKY1rVtC963KJQNq3LhsA5KBIlCqPP2fu107Y0VH7yb6Rbva8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lU1lM89T9+MACs6tCDKIlyRpxv64yAuIsxX15BuSUknkVigRk
	ZUPlvg6k/qtI6u4N/fjO1BQExQmh5HRRx+RKtDJkO7BR0UTcjvlZNXKn
X-Gm-Gg: AYBFou0tKuXF6azKYpR5vRQUkiYkrHi44k2DpoZEoj4gswtU/1vSkarxTXl7KlhmI6A
	12NMMpzi9LEZQH1Pw80vOKMrvzsOjNXMgVb+/WRggm9kxhSk2+d9focDeNW3iPOvq3EHFfYVu1d
	uXezkz7dDkFeieNg3vJU9B7IxHdTDM4+QfAsS5AF3aziqo7KeN18OM4ytWBDloZwxnCZrT8zyyy
	eORs+pvjfMwiDdL/Reh98ZhkGkvUMSI2FpVKU5QWzdDGmnIppJFAi20qX25PwiYqfPrInu8uQcK
	cnAs6GwHrFiKZCYAtFM1vbcmrFlSLypoSVKzCt3LWFKN2TInNHv20e5rB8yQAqjGXQnUTWHkpqn
	F3Z2Np8dpRg3jHOT/I+hNKEkbHG4UKZPF4bwzg+S7gpbu2+qpLkBXIxYYtdudj+Iv+AEe9jfXG1
	nru/S7fsLVjGwl1oGE+tmVMdIxFQ/2Dej4o29tsyqoHKitlSeXsCZcteRshLLSxMMy2QuF0RKZ4
	/EJ8MnhFcZujkZNAJbf8lPm4F23sTUHWaeiJpUstU1ffOj1WgeW7iPP9dWo/MKtDdP8z39C07cH
	cwWZ0RCVEdSamNS0fciEgqboeA==
X-Received: by 2002:a05:701b:2306:b0:1b3:a22c:7f68 with SMTP id a92af1059eb24-1b3a22cb4a4mr3636286c88.29.1794187382778;
        Sun, 08 Nov 2026 17:23:02 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:02 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:50 -0500
Subject: [PATCH v4 1/5] mm/ksm: align smart scan skips with the scan number
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-1-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Smart scan skips pages that KSM has failed to de-duplicate for a while.
Once a page is three scans old, its rmap_item counts down its own number
of scans to skip, 1, 2, 4 and then 8 as it ages, so an old page is looked
at every ninth scan.

The unstable tree is rebuilt on every scan, so two identical pages that
are not in the stable tree yet can only be merged in a scan that looks
at both. Each countdown runs from when its own page became mergeable, so
two pages that became mergeable at different times end up on different
phases and, once both are old, may never be looked at in the same scan
again. They then stay unmerged for as long as they live. The pairs below
are counted by making a page mergeable, waiting for 0 to 20 full scans
before doing the same with an identical page, 20 times for each wait,
and checking the pair after another 64 full scans, on two boots per
kernel.

Pick the skipped scans by the global scan number instead, with periods
of 2, 4 and 8 scans. The periods being powers of two, every old page is
looked at on each scan that is a multiple of 8, whatever its age, so any
two pages meet at least every eighth scan. The longest period goes from
nine scans to eight, so ksmd looks at more of the pages that never
merge. The rest of the table is measured on 64M of such pages, median of
five runs of 256 scans on each of three boots per kernel, CPU time from
schedstat:

                              before     after      after/before
  pairs merged (of 420)       361        420        116%
                              334        420        126%
  pages looked at per scan    1792       2048       114%
  ksmd CPU time per scan      6.30 ms    6.88 ms    109%
                              6.40 ms    6.96 ms    109%
                              6.15 ms    6.88 ms    112%

Fixes: 5e924ff54d08 ("mm/ksm: add "smart" page scanning mode")
Cc: stable@vger.kernel.org
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Xu Xin <xu.xin@linux.dev>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/ksm.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index d24b129932bf7..3053b438e9c10 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -197,7 +197,6 @@ struct ksm_stable_node {
  * @head: pointer to stable_node heading this list in the stable tree
  * @hlist: link into hlist of rmap_items hanging off that stable_node
  * @age: number of scan iterations since creation (unstable node)
- * @remaining_skips: how many scans to skip (unstable node)
  * @linear_page_index: the original page's index before merged by KSM (stable node)
  */
 struct ksm_rmap_item {
@@ -214,7 +213,6 @@ struct ksm_rmap_item {
 		struct {
 			unsigned int oldchecksum;
 			rmap_age_t age;
-			rmap_age_t remaining_skips;
 		};			/* when unstable */
 		unsigned long linear_page_index;    /* for reverse mapping, when stable */
 	};
@@ -2457,16 +2455,14 @@ static struct ksm_rmap_item *get_next_rmap_item(struct ksm_mm_slot *mm_slot,
 }
 
 /*
- * Calculate skip age for the ksm page age. The age determines how often
- * de-duplicating has already been tried unsuccessfully. If the age is
- * smaller, the scanning of this page is skipped for less scans.
+ * Calculate how often a page of the given ksm page age is scanned. The age
+ * determines how often de-duplicating has already been tried
+ * unsuccessfully. The older the page, the fewer scans look at it.
  *
  * @age: rmap_item age of page
  */
-static unsigned int skip_age(rmap_age_t age)
+static unsigned int scan_period(rmap_age_t age)
 {
-	if (age <= 3)
-		return 1;
 	if (age <= 5)
 		return 2;
 	if (age <= 8)
@@ -2516,17 +2512,17 @@ static bool should_skip_rmap_item(struct folio *folio,
 		return false;
 
 	/*
-	 * Are we still allowed to skip? If not, then don't skip it
-	 * and determine how much more often we are allowed to skip next.
+	 * The unstable tree is rebuilt on every scan, so two identical pages
+	 * can only be merged if both are looked at in the same scan. Pick the
+	 * scans by the global scan number rather than per page: the periods
+	 * are powers of two, so pages of any age meet on every scan that is a
+	 * multiple of the longest one.
 	 */
-	if (!rmap_item->remaining_skips) {
-		rmap_item->remaining_skips = skip_age(age);
+	if (!(ksm_scan.seqnr & (scan_period(age) - 1)))
 		return false;
-	}
 
 	/* Skip this page */
 	ksm_pages_skipped++;
-	rmap_item->remaining_skips--;
 	remove_rmap_item_from_tree(rmap_item);
 	return true;
 }

-- 
2.43.0

