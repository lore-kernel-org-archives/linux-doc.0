Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070641;
	b=HNf6fznKucQ8jstq9O72PI6PH69ELwY8w11L3nR0HdUut2BIAWCnP6di+PxkRbcljNSM
	 57WrBJ5AmxNaMvKA4QaeZKbtLYEIxY1pGuuluFYFonf6bd+cW3px78cyybM/kcxOIVSZf
	 BOEfB+HXuVYcCFl8hUrYGZU27CYdOR9UtuyFN6HNsaihMG8dfvYYJuCNvgQXZn5dUkHAz
	 koeg7oqtoaUsF4Ht1/QR8mH5ltanQKLH3OsipT+PI2jCG1FlIlH8u7CzqbZBMfAEIUh/O
	 1TYQO6QNcnj3p8foJQyP6o+mMges7l/oR2BgsXgemEvyD6Eu9sRql+OK3L4tHDJYpHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
	b=ejV68y4BRjbgDLzwDsu49olwyuHhnX2FdGqivFER8dbUwYYCfCBStUAhrEHO3EBrhnVr
	 u2nDCzyWOBX5VDPHO0FK2+axPuXUZb4uo9+fsfi+Q9wJDvwMFsCeOBsy2sPwCLfw3vps1
	 2pUBucE0DocKvF8xsErsPBtcPSBz9Zwxy8rM5/7ge4P2QIHiZ7hs3t3RS0n2FxsBsuOBB
	 jXYjgvV+N9ecwqb8dMTAZS+oIzTg/5DEOALnMVRvIpypKtaersFMwJOklbbkfYWxix3ep
	 KKrnJTytm0yKMvOxd9FSwQapNHj3sj5WbpgaTwugxxg/qYHmtwiyqmiwSmtzSfadSCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVbx9nZ2;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0B7606A335
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 16:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0B7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVbx9nZ2
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso487018c88.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070640; x=1794675440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
        b=FVbx9nZ2ZQU/Elz+giW71b2m0Bac3qeomfVqTX0WiyIt4mAJdLaKsWVhSGk2pUiUpy
         cpzvDvXBUBsmrsfeQuJ+D7gsbcQK8ztdetkr06L53bMUL4YkCCkC0Z70DqQY5tK83ehs
         x8kQS562yWqhZ7zMv3AQYRkKC3IzyAYzzljvPmJmA6RIE/f5lzFm/puQvZDX5KFVzcC7
         QYH2kyHHjXJGksKwIjGlUtHpmAdZne9UdiaTWs7xx5MOwQboahwUbuG9lskgNAVngZUP
         YpnCQej80VTWKfth5/o8/BUtIDUJmsylsOtEDA3GTYHp15Tion5NtJt6Gr3KLf3pppci
         PC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070640; x=1794675440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
        b=iQeoycT3WnncrJcS6Tz2NqRYTxBeDNi90FNt8BGZ4Je3rIXKZNPurvL2VqN4/1AnHh
         5gFis88oa9tdFewEXYKHV2V6nQVMgM9EMn4DB8eCHxKGR74g+UZfD/JUbEer+OUYcu5d
         FNUXHy/beb0Oif8c0nJ8tInF2tfVTFx93oGT9e9G3OZ1PGe7O5NqIxrywhmVkWecqeM3
         COTBhzpsOy/EeNwQQjMC2HDjMxVUoy184VzB4OvmRSTLqbGaPIdQ7BCXyP2dOpKWzMEn
         F44EP2hf6m3ED+Dx7Gv7rjUJAmKTFd+NQEfNDBk0rrRbPJZCoKzC7KjToF1IjgVYBuE/
         rTmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+qgQ1o3gAGeyuFDJaamHbDQtTy26lWdyEZvjEpNmFxPWnRtrQmC3vfuFvg3PKHeIc8cCEhcoCbwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y6yWEBj/aGL2Ri//wEN6sbJlIg8VplbmEVGQ8p2GcPHlU02vo
	tIHjwvVPmp/u/runzaXP1nYc3LnE+MWrlX4tKZDt/vgM7er4rMLS+FxR
X-Gm-Gg: AYBFou07IvkS+x4OcenViRaX29JmE9C4i1q3CGTNQQcyaOLIeKQfSAoT6P0gVGDhYQn
	s0aBob36vV+S/dqb9C3EtR03sKLL8xIF0cOVAb2fq9sgOzDj57wdTydtYNY2gf8YOJpikTySfBZ
	bTsbiVPP+ckZ5k+go8d9/Q8szT1gFPbomubcKI4hCAd1M07KnBeXogtMvzTQKPBPGtcOs7sWgss
	gyrBKGgNSmQ0K8UqCif+kcZRL4STN4fb2jzzhNsTO5RQdAEMZcte/7EQA+ZoUwaWc12Ll9cNOG3
	Fy6IHer4Noqjwc+5xYuS0REfD8MWt+gSmzVuTMLsxshFQ8e1Vi9iwsVfJnN7xomvIDioD4BqjWU
	hiEC3ballaP1/EkP20WGnOKaKvbq4h0mDBJfV2vvWhBuB6D4Hj4HPr3wIqXexx7gXxEVpIS2uXK
	Jr/DFRMz9kZnIH83dCgKJ2+w2sjoiQ1TEV6m6UGUaeYBg5HvqMkScGcS9IVHmRDZwETrB/nbc4a
	5Dg5u6lmC1Ce7h1W392m3/y/XWt8JkNXuIyhsuow6jLFLsqHbh6BETobWY+9Tvqqan14YU/4sdY
	iGvh8S1tS/EPkkXnjRbZr3Ez
X-Received: by 2002:a05:7022:5e09:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b25d36f9dfmr7314191c88.40.1794070639786;
        Sat, 07 Nov 2026 08:57:19 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:19 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 07 Nov 2026 11:57:01 -0500
Subject: [PATCH v3 2/4] docs/mm: ksm: describe how smart scan picks the
 scans to skip
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
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-2-16d5ce8b5fd6@gmail.com>
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

Documentation/mm/ksm.rst covers the stable tree and its reverse mapping,
and Documentation/admin-guide/mm/ksm.rst only says that smart scan skips
pages KSM has failed to merge before.

Neither says how often an unmerged page is looked at, or that the scans
are picked by the global scan number so that identical pages of
different ages still meet in some scan, which merging through the
unstable tree depends on.

Add a section on smart scan that describes both.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 Documentation/mm/ksm.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
index 5a80573162def..f954d221e8017 100644
--- a/Documentation/mm/ksm.rst
+++ b/Documentation/mm/ksm.rst
@@ -75,6 +75,22 @@ The whole list of stable_node "dups" linked in the stable_node
 The frequency of such scans is defined by
 ``stable_node_chains_prune_millisecs`` sysfs tunable.
 
+Smart scan
+----------
+With ``smart_scan`` enabled, ksmd skips pages that it has already tried
+to merge without success. The ``age`` of a page's ksm_rmap_item counts
+the scans that went by while the page stayed unmerged. A page younger
+than three scans is looked at on every scan; after that it is looked at
+every second scan up to an age of five, every fourth scan up to an age
+of eight, and every eighth scan from then on.
+
+The scans that look at a page are picked by the global scan number
+``ksm_scan.seqnr``, not counted per page. The unstable tree is rebuilt
+on every scan, so two identical pages can only be merged in a scan that
+looks at both. As the periods are powers of two, every page is looked
+at on each scan whose number is a multiple of eight, so two identical
+pages meet at least every eighth scan whatever their ages.
+
 Reference
 ---------
 .. kernel-doc:: mm/ksm.c

-- 
2.43.0

