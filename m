Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187390;
	b=UlamYQ+nlUWh0s4NoctV9LhDgxwzobdiwFjvM/b5F6EAK8v1DSwkQNBTVOC2eqyFL5ls
	 Kt+aHjiCLjEqS4K4sV/19B8jHNrIg0WqTanxx9TgRItn11BDMQSBZ1AilmhTgvT23ophR
	 J1jnSXABJj26wcdrMoWqKTmQCIWDOTB61ldeSxxXDHPmCPhNr12v7Qpfli77hVIZ0gvSV
	 1+F0dRVV9wmELO2YKcONgz6QKocpnfgkUWrPmSyVRNAPS4S/B3Mgh6P+al2MFiHTGskiH
	 71nHN+1Q986jpB05gBmQnCM+rvflyZtv6ZrlaRgRfIb1BA1TryHFXQk3W6Hpnst0g6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
	b=126FjHafqCngPnPeoUsMy8aZwz73p9WEdceaTCNfTZz79yrjITdspVdekzinmREFs8Kz
	 M6Wx+XqIcaNknDcq4iIpuyHOibCAu2Co7QKZ8ldDn2WSoHmK25b1Md2xSQ9g90ze9Cbry
	 3JRFfW2IThwA95ktUL3PIT8k1T9kTXubpDFWBRZJBRDwPhyQ6NShxPlZj4FN5GPAVzC0R
	 GmFdF85/eaIxaSynIfr+c0wwdDkKkWyGlVkrnd5JkoeFu0s7y4UaETrAbIyFPM3SPdiE8
	 5HytlGtkxkLJC8vPvGg0rAKDtM07GGTLb40pUxuKwqXazScb0IJPX1MltoqZhJyGkUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8YvaNYB;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BBE606CCFE
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 01:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23BBE606CCFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8YvaNYB
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so898542eec.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 17:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187389; x=1794792189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
        b=y8YvaNYB3OxVaJ9hMq/KOa6Yw5s0K1WQp1FrX4v8U+wWxjTtHHKf6FfFW4IpimQbOQ
         gleXCx5Wgw188412YGJOc8KDRIOEFz2f4sYuhHpkypqD7KNaB+VaJ4aeBXfuaaasfx4E
         c3kwZ6wiu9o6K7KFb/B53Hae0+1vjxJoxviR82Eh4F7osMDv0M44eKvSO3Y9WgOjUbf7
         xn0viNKqIf0j4aWDXYWGUEi0hDRBZ+dEd1KR6Z8yc8HeMChsNXYwuuV6Q1YvxJLEdTnV
         2LnMPwB3sUowjvHqsCuqEpCVLMTlx2rBYnNu6opuH/FVY9IqcxKsPOgcA04rlhZ1nRaP
         GtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187389; x=1794792189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIKqZmT0ty0azcehpTXQx6Fod24WVOZtqlXVR1uvvAw=;
        b=LxYp2yZHoJH6dFaVUHAN7s8n2zUwegWWQL2m+4BidCgG6HdTTNRwvA3391dxGWsNlV
         TA1nXUBA32sT+hwV62U5APMI+UrBL9QVmTTONtca7ueUc+0p3y5pOv8nY5fyCxmu3esc
         V3VlkiwwZfcu/fhs6Nt2qARKTGDyT6OPUgjX2//E5uV281zzbeaZm9SiBFJh3hq6tOy7
         pJYqTJBxzZ9brdUcKLW77x3sxpOnVx1lSKjoRduk5cyiHtQM8xX0lN9YX80dv3LKi2yR
         ZurEOsKcFKqVahtuWP1HS+i+jFwlAsP0D+VqOGfdMHwguAIPmjd99rFEtqqQXVolByXd
         E7vw==
X-Forwarded-Encrypted: i=1; AL+hErFU/tv2qgiq8g4gbJRxJwS9RfvQGRlIckc4KvgG5QQzCx5HHFHhCwELMnNtgot00jdceHCNLxpj1OI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oCMUBe99iS9+evyDh3z3x14M0DRXtZtxZnB3jtFOqKFRaJDk2
	02CyrxVpXDEnfQ6ISX3jqHxvBCmJ1m7MJ184Oj34wNw2Wf8oylPa6eBy
X-Gm-Gg: AYBFou26uaj9R8El640DuAMcz+ZtBc/CVygoAJrxaSJr1wpZyOzf4y4GzDH6h5IKQG9
	fvZE6cIIqB3TnHsKrTLT09SoMSDuljtKPCDATb9A0pgPnmH4Dr9u7EJaloAisCfCmTDJP4upBPy
	wzh4H2VNV9w3ElPxDkozTHqhzKE8KvDWd1wJFSBb/W40xOQGTG//F7TEp1z6DkdaJQgw+4jCzJM
	XCBM5THG++49b2sXicQZ+VGxklVgRLwSNR+H+73z0H0xBVec1AluiHsCPoZZQZR7yo1hRQausDd
	fGnXjJubJKeYwObViBMdAplTIjaVePzDUfouvxasDBuxzWBKD7gq1NzG+G803CrNxlbkxTF6QBy
	UYOpZS4PEhXu8ZoAgvCSo/JiPm4gtgoDuGHZzA/BYfF1gaDJFFu1gWzrDPi4OQMtjAgSvGRY4y2
	4QUj3qZ31/daskT7TFjTyEriiStYAwn0iUFz50/ABR6GssNXH3b44rtNqmreLFndXyKCA4xK8kR
	yCXS0AE8ARN9yDrv/Fe1M7dTBmCpfZk8BlTuO1oqRmynEPNGBjDj6zI5tlsdE+v97hqCCga8+xb
	b3OMmW33QguM+r8HewoGExLE
X-Received: by 2002:a05:7022:2209:b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b39ff060a8mr6502765c88.40.1794187389081;
        Sun, 08 Nov 2026 17:23:09 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:08 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:51 -0500
Subject: [PATCH v4 2/5] docs/mm: ksm: describe how smart scan picks the
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
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-2-86be8fe77e7a@gmail.com>
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
Tested-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
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

