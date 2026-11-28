Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827354;
	b=1DiWxuVw5VX33NUUKQi3YzwTPSF4Qb9Cqiu1zKm67Uv8+b9CIpoau2HiJMXu4I8gBi7u
	 qelknB0e4CWF662I0PDvZtG+70fGpQOHtFDCmTCDM/cj7gBuvqtP8uDPEVug3C2aExDoJ
	 8eB2UuZwo7GSJ0/9snXVXPcorzcyCwnm5WGTgMcMkkQgOIxUa8ucoYEkxol7pmPFYKD1v
	 DBRk/aO4uwqwTKvh60FFi8jsADQtHOwA7adE0OBZSPtHBqxXDb5LYCroY4JnS7+JmYh9V
	 htgb5PFBvdsuNaT1BYScvGd6+IgDWcyi9XREZUTr6hWiwAyw+uU6eEaopSR0zTf1OKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
	b=OlOtu847ZeKjaBEPO3mk+qEEjIdI9jN66WUTbQfqhbcqKJLTLJOP0Tvxhlt0kIZT7mp5
	 ks7PdzM07VSWP/G1mtlq4mtdrBtl1CrOXnAmrcc8eUjjz34MqBDXimi5CPw5OfUGR+uFi
	 VhuFCrQMuXBTyZ8uIq97ZEFOG0xq31GphN8mQDl6OAE3cpYvKHHPxloSRxPO0vonooeFl
	 uUezRzj+GvHSkquuGTdWHgaFQirkDF+C5zA5rglpeCQ6qTOrd11Gh2ndTxFJsIptyevV6
	 ZEROrXJjFq/BXwQewkFfMyT6Ix/Psz9Swq/SiqX5CJYvDetEbIYw19kBU/Voj8VplKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egc5oRyU;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A342E606A31C
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 00:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A342E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egc5oRyU
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so58026675e9.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 16:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795827352; x=1796432152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
        b=egc5oRyUW6VFDIcdxYwZDeGVcRPdqVVcw0/9bUs8kD5ZsjJsFc0wc7Ij4lq+IUwayF
         w2XgNkLL/plAb0xjtXjWDmbgHsj8BbN8y5QH4zabvGdDwwb8xzCpvOiS/FFDQ1pAmNwA
         4uiU6YjDORB86waZuFacytNoIhdLmWlhX93TlunzFDHBxP1tk3JWqemA4JUyNxNFOtfh
         CKwdIz1EOzEmUqFvrYxqw/6yXUkip8rv4zUWrx4HDc3q++gCUskaW4sXZoxU4kXNS894
         nnM8O1l8kivUFX2WTqpxfjbMSvlGbzGIvqyGbP1cvEGn8taKbCLd436XionhZ+TbNkl7
         Tb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827352; x=1796432152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4YJXz2C1qqMpFfvawPlwYq2ZIDKs+0ke0HB93yAMqs=;
        b=VNuZGEvR5Nkk3ej7MQ7OIn6wAZduFOyakyoAZpCo5Al+KmZl6mrZslAH21XhPGLARK
         iBlm6ych9ofqPlDsRUr4JUpMWko5fnj9aKFhhVqzMK7iHD3icg8qpWOuxsETXbAoTGLn
         l8C32PeywC2Ohi78KO9yEJvJp1XWczZ4ZKPronDza+fI8HwczGSIefWe1OToPLXBiHqz
         aE3JLFsNxF0bRAbDfwj5R5hd04IMf/HPSpP6lCoxYcr/vGlvT6sOqbtCu7p11M/6Lo4/
         wPK4Y/HqSPPzdSDzVVFzSbyV/Qfqtx3fXZ884HRh6B0IwKMH8bZd79nZhjtmzt9TuM4r
         QFZA==
X-Forwarded-Encrypted: i=1; AL+hErFkCz/n8K6uN4k6famPOG3B3TeU9rgSw4kRCCrIYm05eB67FzCOEep4jo67H649X1M1IzE2Ku+toIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RdcnA76S+ZWwVdBC0zT2jH1MYk52eSa1+9ZjAfme8EbCZuf/W
	IovES+Thzi75hvLYm8PqVcqR9YdDZ3vuK9rDvTByECrb0jvvfZKaf1Mz
X-Gm-Gg: AZFdTZeIrYN0kRO6ZC2dx06P82BtY62gQYpJNOLLv0+lhbFty860RaXGzkUfiuL8ro+
	742mRUIFFO6ANPYfEsnE3uOraGKS4QNSk5EmBQqFbTWhJdfQhJBZA7t13FJCeL/08OKrPtWbo0e
	QOZTcEA0I1fiNSA9Vsedtur1VbJ+AT1rBlwPo4uBNCbBwUyw3sO0xB7/RMTkVKamdYsP48Apkq4
	BDVND9mRAa84IULmMIjeZd3lVKQt7vRaxKw5Mppf5FevlNdVuk1mP22i0hz3YdAcUc79Ua++eur
	jFVrrCooHsWQpE4qU4BQnA/jgXRL3+LYkbHW5FXOnMkWEkPR9Vn1R1cqhUtcsPpmyDPNDSSZbVz
	XBmv5EcHCViJ1NYfpqpEqo8sgGfW52Ju5Uhk0VoEYagPKyFpRyeiQrvkot0oJWYt2J0kKlw3WTl
	Iun1cx4jDTjfoAMPUNJvpi3HmJia/vpQipM9BUPV37yS2J8q1NFN8OwxBlrE1PK7pCcJn13QCWS
	hLgj2LJDSW4+lADV5XtVhZhRLAOVacKqOWDrjjnc625pRoLedaL8hck2NFVbT+Gg0ILoYAT7Lt1
	hyyB2sjg/UhW0wlz1+50jzI2qQ==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr541218935e9.32.1795827351797;
        Fri, 27 Nov 2026 16:55:51 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm1328407645e9.4.2026.11.27.16.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:55:51 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: jarkko@kernel.org
Cc: aleksa@amutable.com,
	alex@amutable.com,
	arnd@arndb.de,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	containers@lists.linux.dev,
	corbet@lwn.net,
	dhowells@redhat.com,
	ebiggers@kernel.org,
	giuseppe@scrivano.org,
	hughd@google.com,
	jack@suse.cz,
	jlayton@kernel.org,
	josef@toxicpanda.com,
	kees@kernel.org,
	kpsingh@kernel.org,
	lennart@poettering.net,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org,
	luto@amacapital.net,
	neal@gompa.dev,
	oleg@redhat.com,
	paul@paul-moore.com,
	ptikhomirov@virtuozzo.com,
	sergeh@kernel.org,
	skhan@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	zygmunt.krynicki@canonical.com
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
Date: Sat, 28 Nov 2026 03:55:41 +0300
Message-ID: <20261128005541.873229-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122193539.3334213-1-jarkko@kernel.org>
References: <20261122193539.3334213-1-jarkko@kernel.org>
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

Jarkko Sakkinen <jarkko@kernel.org>:
> Work on this feature started in 2025 after reviewing David Howells'
> container object patch set [1], whose underlying mechanics made sense to

> [1] https://lore.kernel.org/all/155059610368.17079.2220554006494174417.stgit@warthog.procyon.org.uk/
> [2] https://lwn.net/Articles/1102593/

You put wrong link in "[1]". This is not Howells' container patchset. This
is Howells' fsopen/fsmount patchset.

Link "[2]" seems to be wrong, too. It is not something "earlier", this is
very recent LWN article.

> While the patch set is manually written, the original motivation came
> from isolating LLM agents

LLM agents are too strong for Linux containers. They should be isolated
using VMs or using some Linux reimplementation, such as gVisor.

Bacik said that he tested his patchset in Anthropic. But I think it
was tested not for agents themselves, but for something else.

Anyway, I suggest to drop this phrase from your cover letter and think
about some other use case.

-- 
Askar Safin
