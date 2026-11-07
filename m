Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070636;
	b=taRUi8JDiQhv23x2lmXxQho64df649+KRfEWP2r1PBxdnjCZUMqlCMatczF9QylROuCt
	 InyJHDRH0Vj6yWUBFxrVSACD1uXeFHlzYAu6Vf77eE/1GhyQ/0GZBlswMQTFrQwN2P6bM
	 XuAG2BvMy1X0srvdDzjSTw58FXzpUPy/u8BMB3ZvbADD97YHySkiyBrwSGiMIYmfEik88
	 4U9A08fnUZ37Cp6edU+I8Yz3n/24wvexo/xSx6AWBnavciHG5LVCAR7/t9V+boBAoL+Ce
	 j3uC2EHGt62xS5pJ52Wv745g1ztnOajFVMA11MUmChXhObBQjiidcbU5q3+T0ON0cNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ivuY9EEI4xJsyai8BcC5oRsS+qnZmw9EkgstKaheARM=;
	b=H7UEfeH4xOdrVjm+vnd2r/+P4uyJ1uctFDihuQDBXn9IvPgE2g5wYxOqbi/LtFtfqBTE
	 4GChRQ5Xr52glJZ0mMMHCYAi6HapkAtSFe4cYpZUVcr8XhcSLnQ0EQ6+veqBSUYMMdS2r
	 BrsTUc2nuxOKkXLyGmUFG+wD5JB4u1xnF0OMaSoJ1in6l4UmKFkm05SpOWpohCaTw30Do
	 n/9E++LOpa4RGl7eEzgpyxvhtI4ZbhakFCeBUBAFP7rlijp6kLNL3J/IXbUxZEyFOlJ8r
	 Mjn5fxJpbDsAC55F6JonsbLztc5rxfR/9tDzXoNe+9EDX0s7SYQKVy2pAAZRJWDsxqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gWKG/ZBM";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F7606A334
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 16:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3F7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWKG/ZBM
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b2513decc3so1057535c88.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070635; x=1794675435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivuY9EEI4xJsyai8BcC5oRsS+qnZmw9EkgstKaheARM=;
        b=gWKG/ZBMtHEsYYrUBcVs3+fgRDxaXmPFh30ADFzxgQHOTGcquQA37Ag/lJxXmcor9u
         7XiqubgiG85dnaFZiW2ujFYoyYD4nB2aCKH9CCI+K7l/GibAWOSWkE2GkaEaVob6Y7ek
         IQRIrh1MzTvjyhT7uumnwjWRxUxTFweJOAmBDRPLC/0lfZReX3ZBhBmLfgRzlxvFT3fP
         RGFEMCje7ecx48sQl11BSO49MRwVcupOnMeYIwOaGeaG9HotUIiPq+MIZSVHd5Vzn1xr
         17W6wkPEoaHMGFmYaQyc/JvDmSugfXBWNz1LqXUOE8iGQfDJ/va//Hyd3I2G+JPuowM6
         q1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070635; x=1794675435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivuY9EEI4xJsyai8BcC5oRsS+qnZmw9EkgstKaheARM=;
        b=BH/asmlS4rMiCQC6mJZxheZIdhtw+ZgEPp6ZLUzMIokcbDoEWTaAZUY0I6br4qT+E6
         N5I14690e7krkfZJy5WNgWXb6+Vaxi7WopC63N4sw1Mv0S4awZyopncfJINZ+lkf8Lna
         CqeUbyqoCiMsjDCWBrlfxD6sSDGaXjSBO34qNLk+mBZqb4PteqxoqwmRKRKDhPJKrsMk
         lFqAecHkgNkrz7y0rfA5eauJbxKJlFC2TvKAkdgGtuIhCvWARyRma7ud3uXx1pyXoQ92
         IFAiL5qOGZwyChOKQ9COwLHB8v6H6nhcCJzVDMKfrNUqDAm84sFhmIthu2o+aYCR/TnV
         vHew==
X-Forwarded-Encrypted: i=1; AKwUvBz2YqwJ3WDRloS72SC1bpIiSHOQpUK+EHvQDHlYlOKe+oRmBJ1aRqIdgJl6a7JFhn96rBQ3jeuQ6KI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pMCkfrMKfU5cEJnDQbZKFDS5dZPXNn3RY6P8CGCsPB/Ra53vs
	Lz5ZltfjxCNofTV0d6XIbELFKhvNIdNL7Yurv9btd61jb1tu6UceGyWM
X-Gm-Gg: AYBFou22sU6vgeZ9uqsqJHp3uUONr7JseYJ3/B07iME48xmvEUR7mj/g9IInPumemX2
	YldOJGdhZDVjcJLm9FCdrKc8iPvLDEWRkU0/p3/fryhP1rlAfMjWAlKS4MTlCgPAdAxO/FS3XWt
	iV7REt2+Wb3Ycu9rK+AugKYwFXXdH/oLybMsAUxxw11oqKK+U8Y4YAEuaOOipWxDy2L64sPlv9o
	IBgYyya3j/nXTTrWN0uBy48sNUjIHodlLYEGQhap4ammxBKkmXcxEJiIx4qXHxJ8nhxApzl/2XO
	VMjCrDWnQjIsAxAg4UV04ytQ9ZboGujnAx8cJR+i5LSemVJHLcFuHKRaZ7ZGUmZ7vVNxomT6oTY
	LTmbk/ePow96K0UeijIVD26bQXNcRYIBO8X2WE4xJuOql2Dc4FYpb8pAkDb3zUGebvhxhujKooH
	MbCkikNfCLeiNBJdZYomWskP3GH3fFxKNqgUwHYuqjKFNNyxCPy42/qc8v0/nts+8HOL4L53Xhl
	kREAnY53PPAUxcX7gx1in8DEXk4ut5w1efoi+a83BsK8MEd6iuKm73qWZdlWEUnhLUrMWMF69Zk
	oC/HZIn8q41pnRbjoNNTTLIw
X-Received: by 2002:a05:701a:c902:b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b26cba843fmr2296822c88.31.1794070634776;
        Sat, 07 Nov 2026 08:57:14 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:14 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 07 Nov 2026 11:57:00 -0500
Subject: [PATCH v3 1/4] mm/ksm: align smart scan skips with the scan number
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
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-1-16d5ce8b5fd6@gmail.com>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
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
 Qiliang Yuan <odys.yuan@gmail.com>
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
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Xu Xin <xu.xin@linux.dev>
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

