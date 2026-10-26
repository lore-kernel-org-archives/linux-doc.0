Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014059;
	b=PLnXgXbPwV3n0zSAELUmdoufyCtge6BM8eEH6cLugBUFi0arL0yuklKaAWKMH/1gh7mn
	 DYZkmZz3dG+reFCs3DGWMIs/xRrfzLuOO+qJh++U55rtggievGvTktxHyG+RXJ1n4qjsT
	 IbAkEEN6M5eFkuvRS8P/SmNQzj9kT3Rw/Yk/A+FrwsmXZ9tBQr3xfEx8BoASime5OGOlJ
	 SO0zn0WFvWJ3TiEMe6b4E7IbF22jk9JbfpoeBMnLBvxH+/7VwfLZFOkpkbKITE8+/zYOB
	 kx/bqynqCMVNda5Bv34dji+IxToU2J88JMfuq4Trh2NWsubmpN2UkGQIs/nUoFEEFUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=pTjWS3+ZRB465NndO+clOkv+MUj94hyH9IhI9lFDqUc=;
	b=cbISbeibBOvf6wtu5YaZk3W3zxuLjiH2ubOPphMa1U41Ja5Go4ox7WkKm6KLFvwCvXIu
	 WKqtBxpKmYzcAhmByYHcvc8XRyzOAWCxA6gNHZCfiAVgaL1wuAzUqbbOOGIVoRoXUdcSU
	 0uRrpRPtCDRQHjLV9abHjhJ3zS8udaNPYgEvxBp0kE/k87fm+8Oqzj8TyLxbu4D0hwv8d
	 wGMTqcOqEgj6/OW2uVK8cpSPtFBIP7lOUG+3JHthz8K1WCyylxLJzQINF8Jsgc8OSQ6vD
	 ZR+di6S5xADEIQ+/ynjRTW6o60Ba+CVvW9v77R3/9PzgdTKe8QVM18LOzHLsmuNXXVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SQulp+gM;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C05606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C05606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SQulp+gM
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac5f801d7cso547749a91.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014058; x=1793618858; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTjWS3+ZRB465NndO+clOkv+MUj94hyH9IhI9lFDqUc=;
        b=SQulp+gMWlR4/dEcKBNYFq9mY90ctys6NsQZcuWqMA+/QEBr6ivvI5bD/PF2PMDuJb
         wnplr+QNhUIBqa4cdkzycdQfWng133bUG7ZMIcxXhVYjocKz92Q+rYBVvHAyvpPfe9J9
         XEkaUlctuf/JI6idd8HPQKf4VwZUxVZ/gnxOpDnBlZrtn5VATJSQM4IMg63UwTrwRyA+
         Y+nbUHGbK/eNks4Lkj3OpkZLJ73CtoaxsHMcrDtETain9zXolhhpIKvF+hnJov80xPLQ
         QgONHQlzJgipT8abst7aCQSe0lm/GXZ+L2NXpOIReuteY1R2ORLLxs20pLv3dOS+wcYe
         /15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014058; x=1793618858;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTjWS3+ZRB465NndO+clOkv+MUj94hyH9IhI9lFDqUc=;
        b=PTK1WvcjucDbu3wwqmVmm63CQA2TRuYkWtVEQsM8/87zCt/ImuSp7stKHkNbeijtJB
         yWEmCgbE9BoTlUVXDRUTB4MweBy5HYFwS3SNpheIeSZ5y234R7O1K3sBn5dHfw4Pa9Jv
         uW7OcgWV3nvZuH6KSZApHHkt315RFzAkLmVXT+xvbUPlyRg4xuBhznndDnOuwBz8bSj3
         kwCMwy/aZ6Ozsqomkv3TTJBRCLXImdLHfLL45ZT38c+8t1V2zwPm/Av3i/scJE5SKPNp
         p4SCnXVUvhc2hnGMZIZZm5qs7vdKG4odIdax+YI67yRHixYY3QpndlGib2lDNsa3OXmC
         st5g==
X-Forwarded-Encrypted: i=1; AKwUvBz5bMehAEACFaTeyzXp5OXjZubwA4JNwRwYyH/CyUw1R396srGG+uPd7IaMkKfczlh+s9MELcgl82s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy71I9hEXkugm8AiMwR49HJgy3wpaJvkLlA5iyA2+hcxAjNSja
	bf6Jv9e7v19smyh0E+XjBpBtR+TUVqGJ3bK6nVIjooaGmtkSTyyy4kDy
X-Gm-Gg: AYBFou3xi4OxM1RTN/QqHdYYORs8hQ3LtyZ12Rry5irlx/MQlXr7/W3axJb9lHrlIGb
	o/yRGkZvmS/Wviw0tC/LupzaOMc1NynTIpaR5JKgc9/6is7K74IUCyDAJpx28y+9JyCBbCfTQVt
	9RaPH9/WODCYR5nEp1FB/CX8o48ZW9E1HcVS0ZmxL0NVnpVkbXFs8HnyJPd0jjSuu8bwV0VYxce
	dggIofGeKDQTAHyumY2L178qdpEHs8ln3AkZiC67qYjcGozI/KbxuMVOUHErAKNQopR+0aurZt4
	aqUGGg02gayHvEBM9GAvw2eets61gatLGBDa6ai0/ooeOFqIyFEPdQcVcgG6OUzpSm9HI515TvP
	PF9jxI3PcO+RkpsyATqwTCns34vdUIljjTpU7vXlfG3qTgn+CKiF6wf/tEJAcS80OT/VYEBjUAe
	Z2K9vLwN3jlRDt/9p630zzf+9B8eBxUPzRbV8gILIKAKCznmy/WORIXrKc1tZxBEx/jmIw4p+hy
	4CiwA1QS5f3KfwnJDdoKW9IlsG9AJ0Slo+Rfxw2R5IjVQnZHgqcUp7ePCdpLaLeIWJVaTHffuYk
	3tpfZl1Ywd6lotC36YEBi/X++DgZ22ybc5bbwVQnkIdPQ8RrVQYTmQ==
X-Received: by 2002:a17:90b:2745:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3adeafd682bmr5302506a91.50.1793014058211;
        Mon, 26 Oct 2026 04:27:38 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc20fe8sm1495402a12.5.2026.10.26.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:27:37 -0700 (PDT)
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
Subject: [PATCH 8/8] Docs/mm/damon/monitoring_intervals_tuning_example: fix grammar and typos
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
Date: Mon, 26 Oct 2026 22:14:40 +1100
Message-ID: <179301327249.2.2968995103662294177.damon-docs-grammar-8@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

Fix a few typos, including "Moniting" in the title, and some grammar in
the interval tuning example.

"starts looking degrading" should be "start looking degraded for", as I
think the sentence means the cold region detection starts to look worse.
Rewrap where the lines got too long.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 .../monitoring_intervals_tuning_example.rst   | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/mm/damon/monitoring_intervals_tuning_example.rst b/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
index 7207cbed591f..367b031ce55a 100644
--- a/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
+++ b/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-=================================================
-DAMON Moniting Interval Parameters Tuning Example
-=================================================
+===================================================
+DAMON Monitoring Interval Parameters Tuning Example
+===================================================
 
 DAMON's monitoring parameters need tuning based on given workload and the
 monitoring purpose.  There is a :ref:`tuning guide
@@ -38,7 +38,7 @@ access-hotness of a region.  It is calculated as a weighted sum of the access
 frequency and the age of the region.  If the access frequency is 0 %, the
 temperature is multiplied by minus one.  That is, if a region is not accessed,
 it gets minus temperature and it gets lower as not accessed for longer time.
-The sorting is in temperature-ascendint order, so the region at the top of the
+The sorting is in temperature-ascending order, so the region at the top of the
 list is the coldest, and the one at the bottom is the hottest one. ::
 
     # damo report access --sort_regions_by temperature
@@ -56,7 +56,7 @@ list is the coldest, and the one at the bottom is the hottest one. ::
     total size: 62.000 GiB
 
 The list shows not seemingly hot regions, and only minimum access pattern
-diversity.  Every region has zero access frequency.  The number of region is
+diversity.  Every region has zero access frequency.  The number of regions is
 10, which is the default ``min_nr_regions value``.  Size of each region is also
 nearly identical.  We can suspect this is because “adaptive regions adjustment”
 mechanism was not well working.  As the guide suggested, we can get relative
@@ -91,7 +91,7 @@ aggregation interval.
 100ms/2s intervals: Starts Showing Small Hot Regions
 ====================================================
 
-Following the guide, increase the interval 20 times (100 milliseocnds and 2
+Following the guide, increase the interval 20 times (100 milliseconds and 2
 seconds for sampling and aggregation intervals, respectively). ::
 
     # damo start -s 100ms -a 2s
@@ -129,17 +129,17 @@ seconds for sampling and aggregation intervals, respectively). ::
     [50,400,010,000, 59,720,011,000)   4.000 KiB  |*                   |
     total size: 62.000 GiB
 
-DAMON found two distinct 4 KiB regions that pretty hot.  The regions are also
-well aged.  The hottest 4 KiB region was keeping the access frequency for about
-8 minutes, and the coldest region was keeping no access for about 7 minutes.
-The distribution on the histogram also looks like having a pattern.
+DAMON found two distinct 4 KiB regions that are pretty hot.  The regions are
+also well aged.  The hottest 4 KiB region was keeping the access frequency for
+about 8 minutes, and the coldest region was keeping no access for about 7
+minutes.  The distribution on the histogram also looks like having a pattern.
 
 Especially, the finding of the 4 KiB regions among the 62 GiB total memory
 shows DAMON’s adaptive regions adjustment is working as designed.
 
 Still the number of regions is close to the ``min_nr_regions``, and sizes of
 cold regions are similar, though.  Apparently it is improved, but it still has
-rooms to improve.
+room to improve.
 
 400ms/8s intervals: Pretty Improved Results
 ===========================================
@@ -196,8 +196,8 @@ good enough to make some meaningful memory management efficiency changes.
 =================================
 
 Further double the intervals (800 milliseconds and 16 seconds for sampling
-and aggregation intervals, respectively).  The results is more improved for the
-hot regions detection, but starts looking degrading cold regions detection. ::
+and aggregation intervals, respectively).  The results are more improved for the
+hot regions detection, but start looking degraded for cold regions detection. ::
 
     # damo start -s 800ms -a 16s
     # sleep 600
@@ -243,5 +243,5 @@ Conclusion
 ==========
 
 With the above experimental tuning results, we can conclude the theory and the
-guide makes sense to at least this workload, and could be applied to similar
+guide make sense to at least this workload, and could be applied to similar
 cases.
