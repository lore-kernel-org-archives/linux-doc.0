Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF68337BAD
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 19:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803412; cv=none; b=p9S63JQKTbxrKZKf7tIemgOp69P9oCiuOIOqHd6+6iq8hPq2mOz1iTjyhom+BJ1LdlpPb8sslzVxfId4Uj6MCfwILQVmx3o6HFZegmrLeGoed25APAQ93G+fAT5HkebK7KVkYaZL4rOqDdFL7YIV1Tr+Kaen29CXchx4IpvqJws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803412; c=relaxed/simple;
	bh=8bSDt6Sg/YjrTXUgYA3DkJzVQ6m3hYydLmfQSne4sVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uui59eS5ADRbdAx/qz8amgPURXmB7n9Xe3WrGXKq9xlSzRFcdd24QLFXpYXrTvxhvqmd0HaAVp6kt5yfcTkfH8Af3G5+iQKeCMzTlp0bWdbbMkqwEybksOmUo5oVRfLj6DMTDW/2blGLmRR/PkhIsun0oqSaM/wrlZXl7P7yyYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NXipsfvt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NXipsfvt"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b38693c4dso879266f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 11:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762803407; x=1763408207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neDRog/Ekcy0Lef8h9kFmYGsPx1FWmrolZIk562CgBQ=;
        b=NXipsfvtvlLw2IONctRhKaA48GArRiRGcgsvZoS8Uge9dQu2N0ZkTwTSgVlF91K8iW
         HA7fBJ+U6fbNB/vI5NO34W+3W3KXo4qt31Zmwqw81+9hlqf5p+yIWfrCu5135jFdpJUY
         R3ejWkhH1aIIKuDYYGRzCf2PDRE6vV+bI+RX2dU6UBgXserUxr5mnPE1pvKpH+Bh6lIw
         cJOg91vkbG8teIPqwWrtSlLBXfgfliHjzRc/sRmxkqmVA0lkEskBQST54NMDdK+TFGOd
         tQ4a3uXjAjYvAklbLDwH8Cl7slAktYIuiqbDOoNROGbkyapWASePAK/W3WAsvf2Q3EgG
         BEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762803407; x=1763408207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=neDRog/Ekcy0Lef8h9kFmYGsPx1FWmrolZIk562CgBQ=;
        b=dMAbUhl39cDXFXC56WCOYfL9mpQHAEA4s2iGA+YLDT0sZYbEJsfQ8huEc01HJnmwnD
         YgXGx53FbXVBMdYoQv226XPI9a83TaZdH4C9TNdsa/TE8JXw8r8Ym3yECTnvze9iIw5f
         i5Vb9yiddBdxOPnXCSnN0AR6piwOWpV5ZFLrWYdrF4NxlFBo/vrbdX53tvlfGzEzFQyx
         CUD5Tceo3EA0GylgyT9niGOAAoM7bwws42QEu5GRqI7jIfM/i1hiV329LG21PtDHIX+G
         TVj5R227ygSM039Um9nH0gbdW3uMCtXlTXPgmj10KZ6xs6tPIq1e2Ce3aqUp7cDpNWzT
         j7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdDL0EwXR86A0wsPdnCLV7kikBkce56PrD9ysxK+HOSNGtdq/5KffMtH9quh/UDTSAkycNEPHdFT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4fFpo5s45HgTeB0TsSSw0TxHgR1f3NiaK8xIKzq0nozbi6Wl1
	9FUy6SCZWBxdCEq062gH90dVLwMVPnhghtPKcM+7P4OYcOv66T5LNcHwjD3N8ZkLYlE=
X-Gm-Gg: ASbGncspCEQzopoz6EKPI6iJRZ4YsIJ90ZCwShXFBMHlkv3tEKp0iDlC6pO8Pe3wVvd
	DHfGHHBhE/QJvyLuqyiahiFYgukGDZxGC8EOCRlG/3e9NyV7sjnbyWfGwCHkWTleu4D9q6FeQwy
	q6clGqOdbs6beW25jxTyn490xmwrforKeslJlPAUH9vNvaUTGhPSfT7kBdryJwxfFT4lFS1JaOR
	WCYoA2hGbmaXES13L66yG58Gzbf7KTwfekXdtfXKOd22aRuOtslR9WLbkCsAGH9gXSPabuMmRi0
	HcR6qdH1EfS+6ya8YHmQ25PJZW6v7eM7pbUP5UjtaX1lrxtIPlUGg8qe6lntRuqK5sBOCjOCrLD
	gLHAkDmtfbtqukzH7ipptQio+YGPRg4U93wKtrt7GeLl+c1EYlG0m11Eqnza1YYx6jWUfVpIGZa
	soWQ/NnLr2CYj3liGeORUA
X-Google-Smtp-Source: AGHT+IF2h1TXIgUgdAGFGgAj8I/0Z7UVK0V5sWyQ2BHKHfBJkTvoEfi0Y20lPlByyzzwSf922qHPLA==
X-Received: by 2002:a05:6000:2905:b0:429:b751:7916 with SMTP id ffacd0b85a97d-42b2dc497bamr7399170f8f.45.1762803406888;
        Mon, 10 Nov 2025 11:36:46 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce32653sm336766725e9.13.2025.11.10.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:36:46 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Natalie Vock <natalie.vock@gmx.de>,
	Maarten Lankhorst <dev@lankhorst.se>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH RESEND 3/3] docs: cgroup: No special handling of unpopulated memcgs
Date: Mon, 10 Nov 2025 20:36:35 +0100
Message-ID: <20251110193638.623208-4-mkoutny@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110193638.623208-1-mkoutny@suse.com>
References: <20251110193638.623208-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current kernel doesn't handle unpopulated cgroups any special
regarding reclaim protection. Furthermore, this wasn't a case even when
this was introduced in
    bf8d5d52ffe89 ("memcg: introduce memory.min")
Drop the incorrect documentation. (Implementation taking into account
the inner-node constraint may be added later.)

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index be3d805a929ef..84985bb20c452 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1327,9 +1327,6 @@ PAGE_SIZE multiple when read back.
 	Putting more memory than generally available under this
 	protection is discouraged and may lead to constant OOMs.
 
-	If a memory cgroup is not populated with processes,
-	its memory.min is ignored.
-
   memory.low
 	A read-write single value file which exists on non-root
 	cgroups.  The default is "0".
-- 
2.51.1

