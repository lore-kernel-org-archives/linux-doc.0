Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693960;
	b=UE/Tr3B36LSZ29XFRAeF8z7+X+RXQxk2SqEvJzxh/KC10yyQomYCsn42mN39Tnw6TOnr
	 L2XAKVLOM8kHdxfyKLvKe5BPjvt45ZJ3XMfX2ICK19TlOeUZp1Zjzf8HUQorMK+e6/n+E
	 rL+ppaZw2fJIcyq/0PwYOq2qrdqvFJh4U63oipjkjh7KlNfKx62jcDNgYQdRYJU9oR5/z
	 Jpqu0nFgTH1xZvDAl8qZsaA/Dct3VdqJx4s0WWFXEiKvWCvxPLPkZ9VLKjcFnP2HXbHZJ
	 GoeWljsVeBdMAt1yOU8/4ZcVMqBHqRrwFzRgCm4DYxrhIvDIl70MZXOMlZwajLaQD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Jz3Gl0iMuNeLWn97inBKvNEHHQ8P8yZhhufhRbL7IZA=;
	b=AER86LOuxwfta+/b/VGi8ora8rjVxnnHEzuLvY3jErxem6qWkW71Hmg8OiBQVE67549q
	 sb3zL1wPxKvM79PV2t2S0ynFwz9DwUCSSOaeskG62VzYfaShQDHQZ7BuXpIHDIo90oNeh
	 eDt4wOTYpFEZ6jAJobR0rKNRz2tzgEatLB/Y8GYQluEByGoCysK0xFwgZIiY7qDPZ5qLm
	 t9j+V3kFo5A4lJQWmB0C8yL3e8qGFmR7USQ8Fg4fTXZc0wmXdA4ZHxxVxurDdJsksDy2h
	 HSH0GqSGP4k7O1Y9HtOK9wPrPzomY2h5MT9WUaDsxQ2zSJHE4ddvLxJNGc3B349mJzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxrUK1DK;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDCC606A31C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 11:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDCC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxrUK1DK
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f066a193bbso35296645ad.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 03:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693959; x=1796298759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jz3Gl0iMuNeLWn97inBKvNEHHQ8P8yZhhufhRbL7IZA=;
        b=oxrUK1DKoynAXQWjzS9XaX8PirGiSfvGKnxZkuHtSZhQTILXepSdd6mKVhdsEFrQCg
         UY4x4P35bQHpmzFnckv0W6diUBUl0NQsR0yALoQHwP7Wtz1wKnaL3OLAPsJZn6gVnuQT
         W9ACofB7wHUWmlLJzwRAaQFAwzjq6kyODH3E/2SeCws3Qg1AsVC5bqfIB9NC483kZG4M
         7lTFxRNcIaf36MaVzIwZRZgcRPJzO+Mx0lRjFj8cHJ7kZ5e2NgPyHPhF1fy0jltNNf7N
         NsRIsi2iYnY27gv5vWJKZzzqPcm+3VfrzJB7p65bg4tdNfQt+ocmdKtr4of5vwS/ncTd
         51MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693959; x=1796298759;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jz3Gl0iMuNeLWn97inBKvNEHHQ8P8yZhhufhRbL7IZA=;
        b=UJI+8Zg5x+oolqTb5EOqvKweL23dP2EEZwgYSGfSyxf58OlleVQuByMEzkCEODcOBI
         CC1TlX+8rr78yXM/Xn2M168vzxcjJUkZJRGlwwi+LE7RYa78pmmpQoyZsvvF693yGxCO
         zpdg36F4bDDaFwNVielEux4flYtc3WIL+hjvh6EBwyQgpmhHpyDSvn9nvkbAhIpUI6ME
         TRLguWNJgtmF5PHRHJAHg4COJAbMnyxZtjwIcrgwu0GUHXYo0YoaQOGD3uWHykVbX8nT
         q3zpTFa1k4kfsRquPTmqe2X1GkAUbd2cetEpcwfVYvYZX5fgzUiGRqsuBC6wEl5Bz/M3
         x9lQ==
X-Forwarded-Encrypted: i=1; AL+hErEBTFf+hUsTZinl84tzbh7Crqg7ut9uYMhwFCRvHKDw++9yZbmzh4HT2DtxykBVUIkkU0Ov6jDS5Fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y0epUWjoE12U+6DN7fzG92yMdXspFt6DXndoXlU5eoFq3D/La
	hpdtwuDHZIW/tl115Neaj2TDtc9smcmNq3NbNHH9QKyiWK9Bz7lRVCJw
X-Gm-Gg: AZFdTZc1SOlew83ZGrkD3Oq9ju7yAAQi3rXa9youlNuo8+/27OHuNk4yIJGStbsxP1f
	2jeqyqu/Bs67nvv+DMiSplyqSfDE73m6YzmXg0UHBrNjiuxCD/0jkThY9HVNzPTtjn8LjZjzqqE
	EN7Hhb6a2H9KmvOuV8SnWiZJjDS4A8+KpiFqQdtDWFrmuP0mMo9lm7xRU4ycVtyl5D9e4Z1yRQ9
	5H25UFfMXn9FamXDtTupyW4meMlA3OwpQLTsfe4DBYZ7uZYH0l2NyDHawjA80lpcQ3kdEAtH2Dz
	WTijSW60YC4mVBFndUNtqcSOArNG4rJtvzkW2X/M2asONMxi9e7iID4LaDhTzv4spA1uaR5nl3N
	lAtFRyT2dPBqZBFl1sq2m08K0I/UVO87WnAmK8WAOVdiScJGF5hekVF7S45Sk/UAp9pCV7zDodR
	F5EsrqBvy/JTRLPByPaWkrq1iv6anE/XIXJwuCYB6TTsuBdb7S4/4exT4W3Vgt2I2f3DjT6F1KG
	DXbKYhrhhX9EsT4b4ny8BX6iDpDGZPGfPx6ptMISmXznekf0fm7kLQL3O/FwmuwKk/v0IqfomOK
	bz6LH6zAxeHn0J87cqhkEXCYJw==
X-Received: by 2002:a17:903:1c3:b0:2f0:41c7:9a3c with SMTP id d9443c01a7336-2f041c7b2ebmr213510435ad.8.1795693959476;
        Thu, 26 Nov 2026 03:52:39 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:61d:93ac:f2c5:2564])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm105486475ad.1.2026.11.26.03.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:52:38 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: bigeasy@linutronix.de
Cc: frederic@kernel.org,
	darwi@linutronix.de,
	john.ogness@linutronix.de,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: Re: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Date: Thu, 26 Nov 2026 11:52:26 +0000
Message-ID: <20261126115226.617382-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125150114.eWhmDZrv@linutronix.de>
References: <20261125074658.33117-1-w1355457260@gmail.com> <awbgq0xQyJATel0_@localhost.localdomain> <20261125150114.eWhmDZrv@linutronix.de>
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

Hi Sebastian,

On 2026-11-25 15:01, Sebastian Andrzej Siewior wrote:
> This is pointless. The enqueue-to-invocation latency is meaningless. If
> you have a RT task which preempts another task in its RCU-read section
> then the grace period (and the invocation of all callbacks) will be
> delayed until that RT task is done. Either way, even with things like
> RCU-LAZY the callbacks can be delayed even further. That is fine.
> Nothing really should rely on the callback execution.
>
> The important part would be time spent in call_rcu(). And the latency
> observed by an "real-time task" outside of RCU that is affected by this.
> Also I prefer testing these things on bare metal so the host not pause
> the guest for some reason.

Thanks for the correction and the detailed explanation.  I agree that
enqueue-to-invocation latency is not a meaningful metric; v7 no longer
uses the QEMU result and keeps only a brief description of the tradeoff.
I also followed your suggestion to reference the existing CPU isolation
documentation instead of duplicating it.

Thanks also to Frederic for confirming the call_rcu() perspective.

Thanks,
Zixin
