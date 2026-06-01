Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E6F37DE97
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315527; cv=none; b=Rmhez/VbNJTSINUrEweeIq9upV1bnBXVB32OEF9AssVtd+Qb6Zfc4blD0Z4pbaxE7g0dQYCfTaqghi5FUjdtJzwTVm57ZbWcAW4oj4lnt34LwDRa9ljwn6nAM6LGO00fKz0Dfz8X687vpvky040ap9mB4/q+ftrPUXAFmD5go4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315527; c=relaxed/simple;
	bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpQVX6VhbzKSeG6hvr8JUKnq8Vpmroab5vJqLJ1iPr7f023wABXUQG+CoMVHXras9FSf7iI8tzeRCmXpjyozFTrBFxIGKQvFNgD9yo2praL656E96TjIlHQ4HyTtUb8XybAUHX47H5HKdPc/IWVu2chydDFywhDv5qL5rhNr+8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZbkFmeE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZbkFmeE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49050bfe053so68931885e9.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315525; x=1780920325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=MZbkFmeEo3XmFlxNHBlOoTQjs+Mb5yDDM8wh1loUbi448+CjVfx/NHRaN8hcb3bCcO
         3SUPjVZdaY76Coza0febN6euUj88hY8h45LLjCR4/xD17yBY46ifGYMI1l8+pv2OJ7Oz
         C/gcKEO5FF+L4We7iIpXfTVk9Wcz79wnIfwZfihNebGhAygvv7D2jQZB3WaZYiEYyCEg
         QhMRQjVNpLgbHWrpv05q9YYoPAvzZ3UbcFz65bAXa+v7vnogaAM7KK+twX3AUdfxPCwK
         j3PHl0PChtq/0k/BI8Gu2fSP1nYuD0AOGNaInHMdGNY9HL0TWpaOnEDclO/IoxGvi3M8
         rgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315525; x=1780920325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=NOfwLujOCXPQZW+jqSzqNzaGUI7W+8OTbL+FdvKu1VdE/e/6LVnfNFb0FWMn9rKhn7
         5ftT5Ha6j1IKnirChKJvx+PaaMQ5ONx9g+EzFo0OQRztDIhqxUonmoLepNzqmnEMhTPC
         dPz9ItevdBzYzWRb1nwfI2dGU3MaoeXcNQgFBf5ofOIwXtf2QBaaKM6VAmiYH+1nzpap
         /aeXp+zppEaJy4sYv+8iMra7d/Jk7GUD8aGHypiYsKt+Y5CumwHN8mysWpTRdD7mkekL
         I3rLu+VzrZc5DSsMYMhXP7mMDBw5MnZp2FQv7dIrbgOI8xq9MNU1bbDQ48M1kpCue0vx
         F3XQ==
X-Gm-Message-State: AOJu0YyzPBE/3upinZXYtfGZNBorNUJEyt/+8gMRSW8PxqDMiZWPTtgo
	9ciCLveVIHltFgvlCO5LrVTx/aFnbUyvx2QTjoBomfTpPJrsRGw8prFO
X-Gm-Gg: Acq92OEH4qrgs7Pt6Z3brYvGxNawqFxWFBvGhypK/Y3gClRlRBsd0C6hW6Ds/vwmZLB
	oIGtCR+FFwhVtTmc71aYve9psWXBtJ6om9Pq6l/5Nfv+DtT+rFYh4etHVyutRukrB43dRY7VkbO
	SHUqtOTtKQ7mt+sCML7/5CkFGVLu1RVshedF2/O2XQfFjcYSv7SVc63T9eOUnY/IkxNPHwvn/XK
	GR6B0a/tuxv3ouPYWlftPgXtuZneQVW+dEmpv4BCsOiNwxoDD2kZTybZKbI/4Y5TDqYp+gDxhns
	4/vHc7J+dgfXCQnMMZWBpUNQffCwkM4GcwkdYeCmI3Y940eG+qtctOKoaT6MawhsmO8WCq+vdmi
	qjsfxWmj/hv3y0T3Q+GJ5P7eplyKoBJWGCBHMcmcVWe+t9BLux85Jab6DS/JanR+v9PfcZRyiCL
	5Gkwm4YDr6BYsvmOtqimGpISwIZ/VhJv28pszd8oTRgw==
X-Received: by 2002:a05:600c:64c8:b0:490:a298:acf7 with SMTP id 5b1f17b1804b1-490a298ad48mr185339785e9.17.1780315524059;
        Mon, 01 Jun 2026 05:05:24 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:04:56 +0000
Subject: [PATCH v3 10/24] dyndbg: reword "class unknown," to
 "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-10-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
In-Reply-To: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=1309;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
 b=4n65AvgYtX7DtTVqkK1I41Xodkq0iZVSmLxfv1Y6t8k120KPHW6PpndNmLzsyHWrgFjRlxjH3
 1OE/Ktc1/TcBtwgSTMRYSIw1FJSESkUk8jXihxInLBxLSKTv4/NPkPP
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When a dyndbg classname is unknown to a kernel module, the callsite is
un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

NB: while this might be seen as a user-visible change, this shouldn't
disqualify the change:

a- it reports classmap coding error condition, which should be
   detected before review.
b- SHOUTING the error makes it uniquely greppable.
c- the classmap feature is marked BROKEN for its only current user.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6b1e983cfedc..a9caf84ddb22 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1166,7 +1166,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 

-- 
2.54.0

