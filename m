Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792836596;
	b=tqTrXSrF4tNR5esGr3ambl6gqB3BvZnYqf+nnrfdejIzkXqo0L8bj08w9yCF/35ehOdd
	 hOnoU6xQKqN2qda8WyqTN5WwfVdlEUoXCQEnNseA4D+3Nwn9rdYv7iZRydHdP18uS2Afo
	 OgtCPp5zaLlALmD2tKne/3pp1HDVZlHP8vZcD7bIbzKeEhzEsNMZwEXqJA5mh06w3Qytj
	 eEBhnDW1vXGeUAE2vSoFIW80IuOEdRELBECq4buexY1DVLEoCx8aiMeqGoXs5T7m47qO9
	 8tqZNpcDgZpltqo1Xk8iVyxfOpC8zz3W9Q0BrQ6Hh8NZskWPUwfP+llrHEEt5uTlpng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792836596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gBmeT5JJ7GeeblMXaEFca81tlnSg9rFzTcGutmMmxPA=;
	b=jjB04dxnrB+euq2MQDj9N22M1wgmMbVYS49iJoj18Y4kWg7iVFu72MwiHGSPL8eLqI98
	 7HV/+pOyBkz/ojQOmq3tNBg4sEwJLVDtH9bYUNUY4pBbxeS4jiWEFLTHfXE/OQ98h5w/Q
	 8C84PNwFX9Q4WpXe9hVepumYvyr9yk2HwDW8r6zQYwzdQ6/usUN4N2A5vgOuzAjJtced9
	 DSfkD07FBIdTM16NtBRqn8NhoOGQWU0TNCfZIOBAxIGgSx4XnTDOMHEAHdJ5Tf8kHxyHG
	 8aW1LYL6ApT/6rzTHKue0f2ob89c+mW0RuMVX3Iq8+Gk07WzEvF85IUXylBjZAI6Hjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TqAKNBFG;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAB8606A31D
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 10:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FAB8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TqAKNBFG
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dd76b1361dso8919625ad.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792836594; x=1793441394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBmeT5JJ7GeeblMXaEFca81tlnSg9rFzTcGutmMmxPA=;
        b=TqAKNBFGu7Oay7kVjz7Sb1PxLYaXAZZlnGcKtDpMpW1Kkd/7x/OSpK9LruS07mebPB
         tKE1MRySUZvQYWM4iaaWg5mPC5JYbvK9zx8R50JsXjQCmWlk9va8JwWhVL/HqjZrFab4
         5F/HurqY1cuGtt5otkp9ge6GQ69QnVgkvSfIOh4eeuhNTwmPzbWuxQL88EPBGWvx2y7J
         J1oDcjYxDhRYkk1VETe0ofRev+SMfWEBuxl+qdIkIoN/26fgAPAO0ruvxdhUSsWj6ImW
         8KqUlV6s2/2rKJE0BlmvWgMbPJBeO/yFq74Z97y4/3qLCHrOL9crycND2eD5xdaVZbw5
         DsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792836594; x=1793441394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBmeT5JJ7GeeblMXaEFca81tlnSg9rFzTcGutmMmxPA=;
        b=VsUV/hg2LWp9TYHTzUdrzkcAkndYiquXzEJvZb+FNQAxbXxTlhTESApqtcMHM+HX36
         cQcPXMnoBq612DGOHKY5R6rk+00lVyWnpv3OwMSn4mxqd88zGXD/oys+5DR4TATgOwzd
         iwPaWtVd3fVOFARtQVaAUSQ+jT/Pf8h68CyaASn1EGfJ4dwdHqmdL4V2rqIEJfvEzc2x
         Xfwg05k21djgQ+whWVwEhWfePjkZSYU097bCrHpkH0WJzZchNYq/ppYzIqchrhAPJvf0
         6qsLBRrkhDbVbgUQgp5bKg4FyOFawRiyhlDVmwwOSxV54UeNTrAT8FRmWkXUWCXNZ0O9
         zxxA==
X-Forwarded-Encrypted: i=1; AKwUvBzNy1KSlTMFvl7iHwvYOrngs/u46u6RI3lJ9bIIuMqUny0po7tFx0F04+rIqAo2jbVYxJwFxpPz9IY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHFkKmU5CNE2KjaAN9nYP7M9cwN1NubBmKudbqZM02ASpjZK8K
	sN9M0beIocv1Orl/PhXdYWhFLD8+PWJ6dr6L6553tB6pfeGvEhlWNA96
X-Gm-Gg: AYBFou3TJll7ruR7vzviRd0e/4/N1SIEbf4k2K57Jsdw52zncS5ROQsf18a8QMHcJxF
	r5YfAVp7TS3Du3NAqRU/ZiC3sKnH1xrpGoq1OYi3TPXd4GE/kgC9mPB3C1W7MrkCZjb4YNrisnU
	YhR6E+h47dY6eEwRAhGwyB1vqSqvtY6Gr1EDqWDlF/MYHCR7Y/RBfp9w5zODWuQFCvtnShU3ot6
	l9CaNcJbLWgKkAW3AwEPArR/op1V56z8dkvZdhE0zhJHq340mBeXeqAiFTphfH1jYpWZa6/xiaC
	Q8WHg8p4bFLFO2McHhGmlkv9nNXpri1uuEEwzERWfjpODiutyL5QDIYSWKSJf9mTQ5OT131Ls42
	zP6GwnAvV9OksNNAk1RZEf0tuCwky2TnTbPZtnMtcoSJNWMIMss/3BWFWym1yZ6kl0l3IIkvePs
	TRf3ZYWU4Qv4cpBK0aFuUNMyWFo+JEIH+ZX32iXxcj95Y7aV5Vg59vVGB2fF81xcrMcCuen7MZV
	B1/eCe23BzWQ4SADco2tPNlJ8aRNCRjHVyO16qqh29TEO9bUBU8zAwMJghvOJCMRGW5b0k4qvsv
	/lGzU3w=
X-Received: by 2002:a17:902:d50a:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ea9c66bb6emr12267095ad.20.1792836594441;
        Sat, 24 Oct 2026 03:09:54 -0700 (PDT)
Received: from localhost.localdomain ([14.187.77.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1982d2sm4635355ad.41.2026.10.24.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:09:54 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Mark Severson <gr3yf0x87@skyn3tlab.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: Re: [PATCH v2] docs: changes.rst: set the pahole minimum back to 1.22
Date: Sat, 24 Oct 2026 17:09:45 +0700
Message-ID: <20261024100945.34029-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261022014811.2803450-1-gr3yf0x87@skyn3tlab.com>
References: <20261022014811.2803450-1-gr3yf0x87@skyn3tlab.com>
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

On Wed, Oct 21, 2026 at 21:48:11 -0400, Mark Severson wrote:
> Set the table back to 1.22, in the English document and in the Italian
> translation, which carries the same table, and remove the Italian
> translation's copy of the paragraph that the English document no longer
> has.
> 
> Fixes: fd5425b67355 ("docs, resolve_btfids: Document kfunc BTF annotation emission")
> Signed-off-by: Mark Severson <gr3yf0x87@skyn3tlab.com>

Hi Mark,

Thank you for catching the mismatching requirements (pahole)
alongside the Italian documentation update. The patch makes 
complete sense and resolves the contradiction cleanly.

Reviewed-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
