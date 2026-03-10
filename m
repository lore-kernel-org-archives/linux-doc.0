Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2682F363C
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773104731; cv=none; b=Qkd0IdWY24BKKkkFgBWPyy9wqMF7cgX3F2cm53/nlE6o7EBIbPZi2qKBC181z0stuigi1gu0cPREar6eStMfzRU92TBoA6ErV0Rc+PAQX9EXjnpO8JLh+rLFpdJj4pubT2PbWg/kHnEb1+x93A0h6DIJ6oL2chBwzuftxOkKEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773104731; c=relaxed/simple;
	bh=Ecww305Ia0sJAMrTE+J6RL1VvL3KyXvIMciOwyWcBtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mAqceKKq6t2LzFhHKF5XwK+AYlLsYRpBX9yqEuJRHAQCzs6h5aoIIF3CuneUWFdb08f8BuUETf9XVe+Ihy5c7MwPpsz9svaoXI3OzYnj62/lCeFRAy5Zt3LoeqX/yIri7We0O3Pj9357B/53Oo5FAOANuEUGUWEK3K6RDLGnt9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwfJFewq; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwfJFewq"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89a018cbbf8so105405336d6.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 18:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773104724; x=1773709524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqXEa8MxQJga17ye0Ey4zThMjFUzQyDDE9YHUeEmLhY=;
        b=mwfJFewqTOsm+ZOWQyhkx5SnoU+/CnF/jhVyfetITEdXDlwguqu2nJo3vbP7+HPOgW
         YQFFg/knJxD8k+NA7wOIWjILy3iGj/HKjBoXIDIVbg+F9Uqy+hgZiyD4Jj0TRCCH+gt8
         Kd9xXFtTd9HAakgxz2Uo5fXARSvmpBmTTCaRLDHZLzEQwCHtPbzFYD4weRBYC3b6w7qW
         lT3HwPafDXN8/QcC6GOfojqXpcEero+xcX40GLZI0Yxi6L5saYnIuNn0wsMhqwtYqYiz
         xXQih5QMBtByKoewhGr0dloNzT84UM+SIR5+UFefyKf7DCoDxDyBC6OBAx01eeBLWiwt
         mCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773104724; x=1773709524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PqXEa8MxQJga17ye0Ey4zThMjFUzQyDDE9YHUeEmLhY=;
        b=mGRRtN7q2bIGQciseW5TB2ndWMBoJo2mPETwTxQbSjmig9KT3baMGpKtQBJaFdvWZ6
         ocZ57MolZLwN7UsjNp4n5tWVykHafgP4y+7DT8WwGHUSDP1F0i2tRZxbrqnHaNgy6nvO
         8kj433aapXlDkaxW7CO092m6h+MIhMa3rK3wG+yNhhL9LolsF0xUHRdM1QyiOMRLT6iu
         +ruakJPPkgL2oDhCP9dnqN6xRlc66tZ9+oPEmxNbik4nM8T/qfC+UTPU30cpuIY34oRo
         FHqQExKTErLMA+/JhXtlNYrlUW8zILlyFeXxCJSHQhe6lG9Ywpp+oKYrSAnf7705EWSn
         mS7A==
X-Gm-Message-State: AOJu0YzPtgpDrJ+SMvJG5QOQ49+eXuLQ9Alq9WCKM6cnZ9T9mLCbGrEQ
	6blwrdLuwTEuYJI0F/07STzKHCJ4Fbb0rAqadt99f8Mu6VsNKWlk2k9sUH6dnQ==
X-Gm-Gg: ATEYQzwZ4Vd2/C0YHDxw3MqlRl2ixQoBw+e/vsGfivm0jbXkpNPgFyZ5rOQpy2mXUFr
	IWM8yfLiTb2Z5WVs51R4qalH3otVEap7zmK5skHkodeleHUodc1TSuHVDC/DZw59Yc5c0X40Lr7
	jF5bO3g7xvnZbUfdnlYU2y5VKQpxN8Zgl92PvfxXGokSJ9PxR5ZNxGqT2vE8xcHhewaWOJLknYS
	4cWpG+y/gk56UM4H2bqPDdkkpRLzs36adQlZmqA5X4rEcw8mEQ6k1ctMUppn6i0oqBoRvKNbzsc
	ikOeoca3/YAZJv5Pki6IAV4Pln9kOBkW0iOYUJiJmN2pDQ3PKQFGpy0vIbrxsX6te+T9Od8n6Ls
	3xlR7wU23IqPdXCTMzRB4O1EbxcY+QgKlbhOKjwquSvRPuQDTbxixU3qgI88oa/6vPtZ33EZuU0
	KCFZ7r2sZ/5LDSzXf68CoVn1Y5gM9trg12jA+ZNDEFdQkM4u1iZd04kQ==
X-Received: by 2002:a05:6214:5089:b0:89a:424:984b with SMTP id 6a1803df08f44-89a57ce97bcmr23637116d6.31.1773104724541;
        Mon, 09 Mar 2026 18:05:24 -0700 (PDT)
Received: from daniel-desktop3.localnet ([204.48.79.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57c21650sm8852266d6.39.2026.03.09.18.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:05:23 -0700 (PDT)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fox Chen <foxhlchen@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: NeilBrown <neilb@suse.de>, vegard.nossum@oracle.com,
 viro@zeniv.linux.org.uk, rdunlap@infradead.org, grandmaster@al2klimov.de
Subject: [PATCH v3] docs: path-lookup: fix unrenamed WALK_GET
Date: Mon, 09 Mar 2026 21:05:21 -0400
Message-ID: <13011949.O9o76ZdvQC@daniel-desktop3>
In-Reply-To: <87ecltvuvr.fsf@trenco.lwn.net>
References:
 <13098721.O9o76ZdvQC@daniel-desktop3> <5332975.31r3eYUQgx@daniel-desktop3>
 <87ecltvuvr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The symbol WALK_GET does not appears in the codebase as of
0031c06807cfa8aa. It was renamed as of 8f64fb1ccef33107. A previous
documentation update, de9414adafe4, renamed one occurrence in
path-lookup.rst, but forgot to change another occurrence later in the
file.

Fixes: de9414adafe4 ("docs: path-lookup: update WALK_GET, WALK_PUT desc")
Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
---
 Documentation/filesystems/path-lookup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index 9ced1135608e..6957c70f18db 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -1364,7 +1364,7 @@ it sets ``LOOKUP_AUTOMOUNT``, as does "``quotactl()``" and the handling of
 symlinks.  Some system calls set or clear it implicitly, while
 others have API flags such as ``AT_SYMLINK_FOLLOW`` and
 ``UMOUNT_NOFOLLOW`` to control it.  Its effect is similar to
-``WALK_GET`` that we already met, but it is used in a different way.
+``WALK_TRAILING`` that we already met, but it is used in a different way.
 
 ``LOOKUP_DIRECTORY`` insists that the final component is a directory.
 Various callers set this and it is also set when the final component
-- 
2.51.0



