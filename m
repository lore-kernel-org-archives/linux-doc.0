Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975431;
	b=bFQFEvQAVYr47798rgYz7I///eCKuGeKpr7H82Lnk3BCYUlS+rh83HLoJRJCNE21giAM
	 pw3AshaeBe/jV2sXiSaDW2wakfvyUL1I36L6YmSZB+IJshel1aG1BYTGsvRf3v9/udH7q
	 F9wpiBmMuLt4lWUEmWse/wEZnVDmYh9grA3tPXmZlKTfm43tAyDtU8U+mTTjzo0S3IYU0
	 ntaYx4W5TSmZAy82ff9PBzfkcruVnf7S92IXXoQ7VVVVrspAM7+VXYfWGjlmX61nOrM3i
	 IryQOdoxkA5DUOxBQQZOFayDcxI94rYBb/u7qH4VMHjiyIwFXAfNBMW46s0aS5zIS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Icbrb5scngfWY2aFD/U0pe9nOlFPqhkX8KD+VMafQzQ=;
	b=dXYKZVXgYuGh6LJep7yTIgdieSc1nQQ2G28NXMNGESYL7aysnOeW4iww5F2lU+LYnAFy
	 IMCI/vnFcsRMnmz15pdP0gqT/oFsZQTBilhqpQan672c7nDh6WzmLTl7TexC96IbEUWAx
	 u73SuDJAqqJzdHtmfv6dSTj+nxbd4aw7OJX+1QR1R/VkKquvDF9QZLzMCYzXkEAk7vXZ9
	 GFxO6PLYbl8MgKSZwK26lBqFXFrO3u6csN8gyByHqI2RUD+frfozGjKNXm6mCEhoaoy6H
	 fFPm6OUa/O+N19invSjZcZC2ckJsS6Ca9EbY4JAY+vOlHCG1s6nUbUKOEP1Xg0U1ZQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCB+gXEt;
	arc=none smtp.remote-ip=74.125.227.203
Received: from mail-pi2-f11.google.com (mail-pi2-f11.google.com [74.125.227.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E70606A329
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 14:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E70606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCB+gXEt
Received: by mail-pi2-f11.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so162699a12.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793975430; x=1794580230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Icbrb5scngfWY2aFD/U0pe9nOlFPqhkX8KD+VMafQzQ=;
        b=qCB+gXEtl/HXLnDDkuxkOBFu8aV6oTrgkxcK6fT9IjAzCKZmg+o3QVBZcV9tU/CXQ4
         l+Xt+SigmsN70fJIExTXEcn46MAwd3R4o9zRI6rmkpZzdNZRJVwGVg/pbUXXxq4rDZzd
         GQRrJW1xtGXXpFHHZ/XaBg4ZBWoXOR1CjzZT6nsGkyRt9asrn+/fkzIZFfshJi4fii1h
         4/qTmfblktYjHQP0EJK+lwlvy7mgES1X32dL8j05SzqaR5UsFj2xTD42nIjyFzQq7HFJ
         TI8LyecU21B6YjRQTHMfdfltO7QAgAGxzMpktecvsBxiL8e730BGMXO9KRTnQ4AYf1Ko
         IKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975430; x=1794580230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Icbrb5scngfWY2aFD/U0pe9nOlFPqhkX8KD+VMafQzQ=;
        b=a0kK9bbtWkS9K0e5gy5ZE0HUEe29RwLg+9uchlpw1U0DnEqKKAQb6Vz9dyKrYkctsk
         IcgZhmKqd6OmyaTZrue5Mv8bLdJ2rnrtUY2N21DvBLzbbckiSDtOGLeWmiweJZgs2R1x
         /KcvVrzbEVosevyo1f9xBxJ9wLvRN3zzcGC/P1MjhbujjZUNeRGhmStrhlm/yiRLBHHo
         rfd94a5GH99rAMxsJPm0Uo4Ch2PyyScaipYT+Kj+QnSA8dgPSiesjTF8zcygkY+ZJyyC
         AN2+j8O078qCqAQg07ykMblK0T618Lomqmj3uD/VTIq9bFbS7fRkksg7CRMeZ8PV6jZB
         1zpA==
X-Forwarded-Encrypted: i=1; AKwUvBzflRhzJo2orq8MS47v6U4hVXzfrLX+kMldnWHdC2L6nqsCR4/qusG8kof/PqVpra4BH3y++xTJ+Rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eb7EZtkaZOJY7sIUbiMOIEs60i2g1UKFyknOso0Go8tZCQXz7
	LH75t6jXb2uzoej1Gf6Y26ypjDYNcuAi5LYLfJWU8nVv1K2sCWNzxFVl
X-Gm-Gg: AYBFou1f5trdEJVWkUCE0yT8LRzZohn3TQiVmQ1y+lgpYATLo1ECbqMsurUuvA7j+LV
	ObDEhRpmjneTFR1CplHjAgGUPc2iJVQoBnxSvcdZExo15ERjpl7AngJQQNpA/DK4vVwGbWTlRAg
	PmEuhe8OGrh516+r09HBPOxbimdy5NITh4Q/pM2mRs10bhw5rl6Oc4/mEYwLYHOXdu5lzQpbJmr
	luJXi86IDm8yhPVd9mmk5lan018ELsQfxWSTt/3DiV/xLW12yPIsHsFUNrnu5i2Zl7Tq5kcWr9C
	pC9Mb5c0/fStTQPnOJ60lZIfj9JNqdX5l/ZLoIUbaFowyjKXkT5mJtacBFItFqW7p9guK5WfoYZ
	Ka0lLlUpZROv35b9r3xBGyi0vASCvYAcKL2leyV7/CBu2DJSUt3Gl5tFAk8oIAFh1lZCD9RW/ET
	k5LS1b0jbuZCh775vq7fbAf0ODpO7sJxCiZ1vE6JdJ9fnvWAYszWK2yT1Kf6DvTB8xqg3tJmVX/
	cEBh1ZAgc7/DBZYZpp/rMCZKMoUd8M31s41rzb0kuo28Mm4dBpAgFCA7fuMV9nMbJVqLZYmkaU3
	pRjo91Hs+/CNOo4Hh7Fvg74tPwRrVDzMeN7zqEbkLf8IxNNCtB60LsOQElmX6Q==
X-Received: by 2002:a05:6a21:7016:b0:3e8:b7fd:626c with SMTP id adf61e73a8af0-3ebb29703e1mr3102628637.20.1793975429990;
        Fri, 06 Nov 2026 06:30:29 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e056:a8e3:ff2b:1543:5b95:16e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dc7805sm649845b3a.40.2026.11.06.06.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:30:29 -0800 (PST)
From: Vikash SS <thisisforspotifyvikash@gmail.com>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Vikash SS <thisisforspotifyvikash@gmail.com>
Subject: [PATCH v2] netfilter: conntrack: document sparse hash table eviction
Date: Fri,  6 Nov 2026 14:30:22 +0000
Message-Id: <20261106143022.412406-1-thisisforspotifyvikash@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106135816.391285-1-thisisforspotifyvikash@gmail.com>
References: <20261106135816.391285-1-thisisforspotifyvikash@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When nf_conntrack_max is significantly smaller than
nf_conntrack_buckets, the hash table can become sparsely populated.

The early_drop() path examines at most 8 consecutive hash buckets
when searching for eviction candidates. Under table exhaustion,
this bounded search may fail to find an eligible entry even when
evictable connections exist elsewhere in the table.

Document this limitation to clarify the implications of configuring
nf_conntrack_max significantly below nf_conntrack_buckets.

Signed-off-by: Vikash SS <thisisforspotifyvikash@gmail.com>
---
 Changes in v2:
 - Reword documentation to provide configuration guidance,
   as suggested by Pablo Neira Ayuso.

 Documentation/networking/nf_conntrack-sysctl.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/networking/nf_conntrack-sysctl.rst b/Documentation/networking/nf_conntrack-sysctl.rst
index 4426cce2a..c7e9016ac 100644
--- a/Documentation/networking/nf_conntrack-sysctl.rst
+++ b/Documentation/networking/nf_conntrack-sysctl.rst
@@ -99,6 +99,10 @@ nf_conntrack_max - INTEGER
         the reversed address). This means that with default settings a maxed-out
         table will have a average hash chain length of 2, not 1.
 
+        Make sure nf_conntrack_max is equal to or larger than
+        nf_conntrack_buckets, otherwise early drop may fail to evict
+        entries when it gets full.
+
 nf_conntrack_tcp_be_liberal - BOOLEAN
 	- 0 - disabled (default)
 	- not 0 - enabled
-- 
2.34.1

