Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013440;
	b=hHH9l6dFAnw5bZKa+RpK39BjNaMl1WG2DdrvkHXBS0hRefMMFbITA1skJzaU0Er/Oma2
	 BWZ1IQYOEpfH1IF22yLO+UlUUgAEshfbLkKksXs/89bRHG1kRV5Gl3D7R5ya/EGnZABzv
	 32OIvyG8Avl6oy7Q2/wjeoXvKLuxHsWD0Zwe/h8Y8noG7GWWSx2049v+NNVXy6iiWaxXQ
	 YrUgkJu3Lij2ewhjW8DqgVbVP4wCChajLTqnBDhgrLxwjQn0mxphTD2OMyN7srJRXNny+
	 RKCxXy4F49OliFcCXlOSCYvoD1cn6rpUDm+/lsZUvphDo5gKhEygIRhBDfmHEDEoHKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=fmsyrygG81C38l9zQdlGfkeoPAPtMMphWRdYuBnpfhM=;
	b=4+09CwNeQCP9uO5PgWBuZxoNZVoJkgHpr8Rg3NJ+sraDvD41TFOzh87gs5TC+PNGB6hx
	 ObPkwlZBT9FjwsQ28lwdynkSKQjmcMWVJOAL+HDPOzSGbEUQbFC7Vviue2ZZsDFASIyB2
	 kk/bbK/FGlrhUOHnuuGWz2/mZbN4SQ1MYyXkMTWcMCjJszQQ+0Ndw4fSIcZiWG8DhUDWn
	 TiM+xqLcqF8cUO2mcahcwn11vRDQLzdDElBGeEDfXwRvfCXLy4zOJwbm75BTlhmUgwS79
	 P52pXS9JnzFu/Tg3UAqEqPXLfakciaucfqbtHPESNY8EHHqD3EGkGuYFtPviEfk/xfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VzrrUTnc;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D7606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 356D7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VzrrUTnc
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ea19bc317dso23372605ad.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013439; x=1793618239; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fmsyrygG81C38l9zQdlGfkeoPAPtMMphWRdYuBnpfhM=;
        b=VzrrUTncN/o2GRkTl9FF7gc0lN35ukiRUt9yxbGohobiZTuWuvestC/uHneEx53f3q
         phOsGNTPDFkwwzTlUy/W4K3NxeLNQkEYXq84S133i64u6ZXuyK795nqQM+Hn5EBfKMWt
         6N/AH2TsDwCIfKUHtitPYBVrc94WLuJJtvBapqXcFQJVRXD8ih9NMgAtdG4/ixyL0WkR
         HipByeASH8+F1wD8Opszv/9hhAwn/Kpq1EFKRBuaZ//pg4YwL+8o4oB/bttTE5zr4LPQ
         QYMvddCXRAIsK5CNx+GL65U9IfVV0emGQ31yx3eR6FJGCUYzPviEzJgKGOjn/HmXqFbc
         Zzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013439; x=1793618239;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmsyrygG81C38l9zQdlGfkeoPAPtMMphWRdYuBnpfhM=;
        b=jyQEW/NmZgqcGkLDJsVJ1Jceg3ZIMALJv9069EFEHcyrGHUzWfPatcVX9mX3+ItLLH
         J0yVaiZ/aikgHKJmU7XCd2tVLLgY4KrGIoX0K1d61T6HVtRkqgdFuxWQZJ5xGRKp+oTG
         sGYOCoOlfnCX5O4yzuUo4e9sfruxwaPGGln9Sr7vYBBy4l71ise4T7u+s+zTOWXnFNiu
         SEhqaQcYfeDPHJfqJV2vhJgWcBK3R87pO3UqEEVNwGO1T2vf+ePjHuomloc0UeyivlFW
         ZVV65RjOJ3KSBnFPjPWE55cK4jg6FpvsfeAlN3BmKtpWqmREwbRM8/KcHC4/SaU54dq+
         38RA==
X-Forwarded-Encrypted: i=1; AKwUvBw/vAbY4uzl9ecHbe9nyN8CiDPyZ3E9sNYlMbOrgt9HsT5DFYOFfpnB802SE8pExEydk693ZGyxfe8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL08KgHibg6qE7ZVRJ2tSA42SCGGYTmNJJ3uvCRetd4iFQAib77
	qPw4i8DSHcn28HYTfzkujpJwHmZ4JW7Am2yT+pK4LsqNGWd6jGFZntTwDzDKksuwrCsi4A==
X-Gm-Gg: AYBFou0qA6U5BeTQlo6qntlw53S/gxqiBeaCuZeYqpvJWjQ4GOLQm2qrtU7jqG7KAOk
	OZvOKW7LE68ladTvMFYfts4Dik9YHlYcyVEW5utJHiP0kzucQZH8j9uCaU/AvBuxNFjtkrw6PQn
	+1Yltz4pm3/7RVxhbx0L///HT5OHywHItzbAzoAdVzlcRA842iRIO5OaSmuyJnXhpCAKSWZVzVT
	OuHcTA9SsP4zzBbKedjcOvdUrfOhd2abCTHBm3Ae6qkTSBqGubZZrPOmcvCtYdSHlKpKlRwDC3b
	uaS+qBoSsF/IeFb607Z3qpQijzsVwdrLOnt2Lb5h2Vmxwalz1KmKcSqXm5+oKVRFAg4XbCzyHyU
	YlCTgYh7oXT2JWyUW5yxQXV4iX95q6sWrBtKB/hFwxwPes0QWd+QPB06smZ4EeGdW1G9SXOWdZ9
	k/HQukLEDd5URULNHkmlIiW6VwqZSHrCvxLhKxnI0YfJ8s+JS58s0GV3NppLlyTEG1KeT+faKwc
	unrNQjp6WAI1T5GJ5qUD0fLEGuwJWeAMeQ0I3w5Hy0E/z9cQ3t1V6uOBIM2XmScQgbGmAWIGDRY
	R50/SVqMQTWtMFeT0terkW8DysnkhmNRjQnmiGc5XpKg5fsKFHFubQ==
X-Received: by 2002:a17:903:3905:b0:2e4:aa09:fa9f with SMTP id d9443c01a7336-2ea9c84b404mr55890135ad.57.1793013439353;
        Mon, 26 Oct 2026 04:17:19 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1df35asm14878235ad.60.2026.10.26.04.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:17:18 -0700 (PDT)
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
Subject: [PATCH 1/8] Docs/admin-guide/mm/damon/start: fix grammar
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
Date: Mon, 26 Oct 2026 22:14:33 +1100
Message-ID: <179301327249.2.1796164575094900927.damon-docs-grammar-1@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

Fix a few grammar slips in the getting-started guide, like "make DAMON
monitors" and a region "that has not accessed".

"The line of the commands" used to be "The first two lines".  With only
one masim line left, I make it "The first line". 

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/admin-guide/mm/damon/start.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/start.rst b/Documentation/admin-guide/mm/damon/start.rst
index d98b0eb8e771..a83fcc2265bd 100644
--- a/Documentation/admin-guide/mm/damon/start.rst
+++ b/Documentation/admin-guide/mm/damon/start.rst
@@ -63,7 +63,7 @@ the execution. ::
 
 The first command of the above example downloads and builds an artificial
 memory access generator program called ``masim``.  The second command asks DAMO
-to start the program via the given command and make DAMON monitors the newly
+to start the program via the given command and make DAMON monitor the newly
 started process.  The third command retrieves the current snapshot of the
 monitored access pattern of the process from DAMON and shows the pattern in a
 human readable format.
@@ -71,7 +71,7 @@ human readable format.
 The first line of the output shows the relative access temperature (hotness) of
 the regions in a single row heatmap format.  Each column on the heatmap
 represents regions of same size on the monitored virtual address space.  The
-position of the column on the row and the number on the column represents the
+position of the column on the row and the number on the column represent the
 relative location and access temperature of the region.  ``[...]`` means
 unmapped huge regions on the virtual address spaces.  The second line shows
 additional information for better understanding the heatmap.
@@ -95,7 +95,7 @@ monitoring results to a file. ::
     $ ./masim ./configs/zigzag.cfg &
     $ sudo damo record -o damon.data $(pidof masim)
 
-The line of the commands run the artificial memory access
+The first line of the commands runs the artificial memory access
 generator program again.  The generator will repeatedly
 access two 100 MiB sized memory regions one by one.  You can substitute this
 with your real workload.  The last line asks ``damo`` to record the access
@@ -170,8 +170,8 @@ set size has chronologically changed.::
 Data Access Pattern Aware Memory Management
 ===========================================
 
-Below command makes every memory region of size >=4K that has not accessed for
->=60 seconds in your workload to be swapped out. ::
+Below command makes every memory region of size >=4K that has not been accessed
+for >=60 seconds in your workload to be swapped out. ::
 
     $ sudo damo start --damos_access_rate 0 0 --damos_sz_region 4K max \
                       --damos_age 60s max --damos_action pageout \
