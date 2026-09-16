Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE1348C6B
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570395; cv=none; b=KmuLdP7hQ88snfV5ZathTml4gOtkEWjlEpLJXPrp7qIU9zXN7GrFQi98SQGgWTOP9ucq6qlZySujJXQzrWvsNCd8m6oo5NDmpl6y+E2kn+y2l7aOi3ekpR31Rm55zjIpdMA3Po4sfReiBvD8TI2JqQZv6VxxNiv1hageA0UPjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570395; c=relaxed/simple;
	bh=OuC/W/DNESdwVjHCYITglUUqtb1LIzuHPvq0FWVR0VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fk4TmsysRCIhIJecspGUTUL2yWtBfeC0a8L9DNC1EjqN7UmFfCh3B+o3gpcPfPz/BPHd1jVywD31MgyTmnQb/wA1RX/f6wobuwC50D4KvM7H2zS6JkT4G8r4h8/ICcb1jX2g/yZA7pAIz5m2HypLyQ9WZ0DCMr2hsLPa3DTr2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=XZmh/oNP; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="XZmh/oNP"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20e86cfeso126221d50.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789570393; x=1790175193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RW23e0CCUw23TNIxrY8dug480YZmKW8Fw0A6LLlcPJA=;
        b=XZmh/oNP32aU78zXe69kHDDX9SVy4LiEvpPNDqLOmx6LS6a7Yck4tikMYUWR9sxUea
         JA9AELJJVIldGwQDuKTD2SzXO428XaiiAckas9kVYi4+XCJbCL2N7iI5R6GuH45f2+p7
         uLZrU4a4bYKtwP47sMacr7DGSTc9e9UV5hLJMSgAcDvP1ir8dMw1dy3bgWOmFLLO6s0r
         7QTRV/cWymqw0Sg+SujDWvX+ZUotS599nnPMPXMPdKtQKULJOnrah3k92oT4b2LD9/36
         OlL2DnI0TcBW+K5qKbc/wF+nCavAe5jBWcZ3jBLIHH827BFmw6Fo3b7lFnirSMXB0Q7D
         8HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570393; x=1790175193;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW23e0CCUw23TNIxrY8dug480YZmKW8Fw0A6LLlcPJA=;
        b=m+jGuedWcCRoAbN+2kFdVYJshNTE46QSfkQm4b8oBUbXxHd/G1ViKkvXOEDlyBRB1p
         MTQB6ciRyNNAf3H1uQDIz9UA1HDpSXAuhchB8d46PGfjYPtBKWF14Bvqhux71zF6kcS2
         SjkR3XKAf2rDPZFSLWy3mv4Pp31yY/UofwZrmhkN6AXXLe6scZbta4BQW4iRlAoqsnyS
         Uig9qzspFTYBMdZJv4UpE/Go0dnqRbEx2T7pF53G2bxu80UPKL/PMK9RGCrzDtUg46Vl
         lNs9iZUmL0HoGOk3rFHxLo1dSxiz0XPAa7vPjBvwATi6mhH8aLN6UrpRbpkC+pb8Ojom
         ebLg==
X-Forwarded-Encrypted: i=1; AKwUvBzW71GFGpUMnFnbuwkYV5EoM2wQYV5j90t1k5nOq/bsBGP4t08byO/7Sw9wPKXQM3cqNRlT3qnGSxY=@vger.kernel.org
X-Gm-Message-State: AFuF++kD/n2GxWZD6kDCzKIBfOUJh3euQZhyzkv9/hxzhKwjxSidbae9
	dodbjAc3mPX1c7QIpQH/JuQh8GgK3ZD4Xq9FqQgu1FRmHLVq6wspuv8+rI/ZPD2JrmnU
X-Gm-Gg: AYBFou3cWrxxSj7HVSEVeJxaHGc2QgHWDasw1WXfhrrJ9x3jvS/i02hXjgNwQiT9vcu
	9TkkLWIfoCgMzlhp8sA61DLlT2Tbn3NSTKVK27Bwfzcwbfq/aNuYHtvEoBFwF4subxBDihgJNzR
	JgUhxtkZVATbmgJ7K9COyNSCiAIgyX/M9SYNolnMAPyHQFqDV9CtSMuF2makDKTQ+ZiVB/GMrYr
	An4QsIH/0n4/EtkTqBUTg5Z2i5p+vny8fL5NNMveT2DysW5DIQ65dReOvEOBbq8+geA0Jb76BAI
	1Tpf61NbZr+WMes+RBZSBB28s/V6eMbzx5sjouQsyrU3Djl7DdDW3Qr0Jut8Jb5AXSyGJlHRTA6
	LlSsbfQC+neDNGUSm78Gi3ci1CJtodsiK2YcDNO48zFFdar91qc2NrxFfHtv0hRBD4cN2HPcY70
	SKprgqoTJ1DodLnqbsJwmpvrlCBbhHigUzA9xDrCetC0NvmjT4mz5lzxMs/9QvEnbwKjV3z3LNc
	G36XfkMd/ljEc3igm57RN5u9OWHKYbYA+wAyzU=
X-Received: by 2002:a53:cd11:0:b0:66f:c852:209f with SMTP id 956f58d0204a3-671631f60fdmr1054076d50.2.1789570393120;
        Wed, 16 Sep 2026 07:53:13 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6715f787276sm1397653d50.19.2026.09.16.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:53:12 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: landlock: clarify TTY signal scoping
Date: Wed, 16 Sep 2026 10:52:55 -0400
Message-ID: <20260916145255.1587381-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqqJAZfG9FC7PgMW@google.com>
References: <20260914.b8a029f9abb8@gnoack.org> <20260914180946.1462099-1-clusk@northecho.dev> <aqqJAZfG9FC7PgMW@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Günther,

Thank you for the careful review.

The phrase "or otherwise driving a terminal" was LLM over-generalization,
not a separate mechanism.  I checked the paths I had in mind against the
source, and none justifies that broader wording.  I am dropping it.

You are also right about the verbosity.  The generated text expanded a
two-line distinction into 15 lines and obscured the main point.  I will use
your suggested sentence and remove the signal enumeration.  I do not have a
stable kernel documentation URL for that list, so I will not add a citation.

v2 will contain your sentence and a short LANDLOCK_SCOPE_SIGNAL remark in
landlock.h, matched to the recent MAKE_REG whiteout remark.  I will post it
as a new top-level patch with a Link back to this discussion.

I will keep the positive selftest you suggested as a separate follow-up so
the documentation clarification can be reviewed independently.

Christopher
