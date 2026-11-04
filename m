Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811386;
	b=HAq3gwg2PZbBqRTnWRyl+x1h4cdB0ViT9nW3t0PxWdVLpofmCZ9wyg3hgyTzXrxo3aCx
	 rNoncoDQd2HzR/uSWbrhMrH4m8Av3GaWNY7/nACJsaoO6VanWnPJOq6qeovsOEp9g0Mns
	 4o/B5VGXinN0EXYVIx0/MSNcfowIpud2YJPyT+nH5CpUPnnRMIKPXt7wzQCBU1BRBXUW3
	 uTk10u10jlNE62NTl2Y5O5OnV8LIzmt5oG0Wbs4NboSFgfzoDbUdrnrVGUAsTrZqnVsgH
	 RCorVkq7u/+6zjXptzuuzrchE87S5SXRevq88Wjj48+5XiM9sVVyWBPaOHnBh5NZ7OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
	b=ILTyoVSicS4jzkMkyfbhbW6wvd9m539Nb92DShUpoD/RX/JiDrBixKYQgBXlgreDVYl9
	 htTaeUEGLzkSrV61lUeSquQDgnyYp3eyUQJ7LdlR18L02avStrcehiicrJ4xYF6LW96WX
	 nA0gZ+L7TTxrkj3zRnGI/zN0dCF4HyF+9vRDu+QPCQ0/Eobvl7k5uoR1RjIJ8H9b91zOH
	 HPb+tNjuCrLgmNW8x7qhQGMVug4jfOtAMw7f2BiuVahPTEiwFzqvmlMhbu4JmhZU4XeAB
	 x9iOsCBvka0Ah9SL9x+gByZt25Q59G5/4vCFTTaHzZKQY/EU06KgJ5C6q4sc50YAzkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ds9ImoNF;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FA8606A33A
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13FA8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ds9ImoNF
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so1761916eec.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811385; x=1794416185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
        b=Ds9ImoNFnqIw6Qw1Xrge8SkX9ej0FZa29MRVRM8wFsA0dQhuXWwqhtoYP7h4kad5e+
         CujAQIMvVoW8e/ktVA4RJkhE4uKZXGsISnstiGMOLDEmO9nifwT/0JQRpt004gFRJZka
         aEN6hIa6lRyLDyjswYqiyD8FDsS/G+5MA7geCMPJHINQ1V8ZqZdDIveb0rMC984y8KI3
         eR95uJTOaQOkLl/fbaGQHrdaL5TBwFQZNwuQsEHOhhRuT4aizhsDX+zooDipclNZN4so
         bW+qgoLjH1gb/KVmb6CxV62RY4uS8XAiAEaBZKn2+qXwuceGSXYh9D9dKoNtagpVAIhu
         D+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811385; x=1794416185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
        b=fkQs0h2TepaDTbxUQjvGjrHtNmcw+98yOC7AwxGxHUVDEnpJl8K/8YqvQqhoSTLrtl
         xMYft8eJGyGyv+chf4KE/P7/qu7As61ztC2zKE3G8XY4VdO36dMwGIKTtWAq78u+unH1
         vby7pD0GwO8oqpYTQaf/+SpKmGq64qBY9gImY6ByKX7/D/Xeyv+Kn4GUuR6hiNw8fxUC
         7p4FChdSnZ6gV2WLjxdceUDyxItiL9xW9ejwZ7PgPoUNZeVuzaqd2ChUirIb0STE/hde
         2/J5qqD+U8v2NNy9XT3cXCsl+JOLf37X3b6/ap+Ba6OX+H1MMwzpA3CAp0hPodkFQef2
         3VDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZmxYurCRiJCV1ZCjYzR6+QNwamE+BGwCWyY0M2UiLEMmLFJve6PuY8Ae6Ous3n2YjwlYOW/wOpno=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QUiOZ2IOmnmQR1g6/TQSsn+WzwGvg3Or4142FzgAPV3OhvNn3
	COz1eDnIKZbN3FXPyDZ4rE/5iNTsmPeGj7Ei9+QJLsJp6gY3zoja0xnt
X-Gm-Gg: AYBFou0nOmlsgbd5gSyYDkYyjKeNP985pH75PaFV+QHHRLjvLq0WaLyf9Jukea1kfOP
	y7qexBYANfc2oI0BeYF28xeRZIex39EV/QoQbHUyEUbMjifw+oF16U/cv2SUMBSRv4Uj8gtn/oc
	IOhqUb5XbZDV+ugOS2/895tkXyOPUfRByag2vBYuk5M58J31n4gBKYHJ+suXR75SFQfzSexjcCu
	i70Ho0GZA4Z8T8BVNQ92yQoCFIk9sTcAOfIsEpMbUjXQQjtGUa+ocKCrKkgzrXZJsSGhh9nau0Z
	68N2WRBHCw86Fcev7mHQAw90QnJ5hZ5Ssw2s1ZBYdiszX4DGHYD9H0/g7HSqrXBhOV+n1GUDcL/
	fVf1LyUUBw+PAGw4TlekC3Vt34cfyb9yHch8qDx202SGuIE1/stqG8smRrT7m6URvSLvH2079uH
	CTuTPxcxPxLCc5MNTF66nWMu+QNoRPgc5W05Zq2T2LYaINk/bL0A76ufB7WsoogRZ8tAWDkBIIJ
	vWEkn8+07uqqj0PYEMP9dE7T37FqDfw40bcZSXLMJhDQXb3OaX/TffA4Wmx4kH7v5mX/6XDz5sP
	8Z3pJdb5fHdXybe38J5ijgxWrpgaNi2KB0o0bA4=
X-Received: by 2002:a05:7301:3d06:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36a42404840mr36237962eec.33.1793811384606;
        Wed, 04 Nov 2026 08:56:24 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:24 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 07/28] hazptr: Fix kernel-doc of hazptr_release()
Date: Thu,  5 Nov 2026 00:54:25 +0800
Message-ID: <20261104165504.2430480-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

The second parameter of hazptr_release() is named @addr, not
@addr_p.  It is the address passed to the matching
hazptr_acquire().

Fixes: 17969a0e7f7e ("hazptr: Upgrade kernel-doc headers")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 299ad8a07156..0fb48518525b 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -315,7 +315,7 @@ static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
  * hazptr_release - Release the specified hazard pointer
  *
  * @ctx: The hazard-pointer context that was passed to hazptr_acquire().
- * @addr_p: The pointer that is to be hazard-pointer unprotected.
+ * @addr: The address passed to the matching hazptr_acquire().
  *
  * Release the protected hazard pointer recorded in @ctx.
  *
-- 
2.43.0

