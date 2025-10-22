Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC6309EE3
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 08:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761121577; cv=none; b=lzVGr/iig5SKvlomuC41G2K2z2VdF56/9C+BhTHQPT9GgbNVyQIplgjN8R6s9OqkGnsAdNpm9u4blYY2RMeZoCHYeTVbbj29V3deImLsuROZWuHgyHNojvD2cRVjewwleC/9rHsX1iyyJYBc4YPSo8PSM5uX8bRyViFvKrZoJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761121577; c=relaxed/simple;
	bh=Q6H986X15qYys1qfZkB9W2dW8AtLZxTL9G3Hoa0FETk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzQdJcn9wG2sFKp3haW47c24JtZnH7ThAAGAnNM02EbuGhvk96ZEJJ5i7uGoicR4IVK+N6lnWBPjg+x5IwrjJxJIv8nG0T3twbGiHfXpaLO91ExMbduQRr8Iri7zypXtdc8RHUz1ASlw0KeaIQefHqTMGnhI8pMxhI3ZsgXt5KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9lSf9jl; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9lSf9jl"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1447607766b.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761121574; x=1761726374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDyEa99uEXhpux+y1jdsG/DCyMfzL2pd992wei+/e1g=;
        b=g9lSf9jlzTL74ZxyfEMsa16zdauZydvqbq6C8BlT0oq+R+RCOZKV7QlN+n7Puwk6X9
         TK11E1pXhHLdAuoU9qJ8OVl+4QcN5CIDLdvrtHDuaQdch6/it+z8DAx58sBJnRfAmgVz
         vG4xalYkaDCAiv6gJpIiu08tQML8GZKeBJuCErAqp862qz7oIFTxEML3NDQfa42+q1m5
         JyZrQGPFKnbdBW9dDJ4+v/Qb2AY9ddKozGeODolVFc91lLhGagiEvJAxutp+Fa0TKdf+
         VbXPxrycqhr9LTv3VpU2DzC8PZWvGeSgNpfGHO24xPNLpypRN3tDJdofqxE6Q/w05re7
         zT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761121574; x=1761726374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDyEa99uEXhpux+y1jdsG/DCyMfzL2pd992wei+/e1g=;
        b=bJ8BUsSZj4J4iS3IPLcOz7lnqjOfPCWFpeX79wtR4jYDcWi2L+YaReYeB2fbEM1xvU
         DA6OysL86m1Hw2wYcyl30FU0ciOEGNy/FiaHDaADHH/+KNd2OVmroos0JftyjN+2Camn
         94EpKNBwyaG6TBrcuD+Kl9C3J4/kbbB+paJiPghKDGWXM4mVrIl1LlItueQ2PGs6sVn2
         ack3QkTeFq6PU4eFqf/b4dh9D1UlCq0p+6wGfYtRJWD+L4og++rXWZVAhjJIDuPaDAEb
         IrJgVMRbKDHsntdJW5ibyiZprpbATpHLXaEOjARKdPC1Z5Ky4P4+RowDtHdSpIV8FJ2O
         SXTA==
X-Forwarded-Encrypted: i=1; AJvYcCWS0EYAusaLjKBcEoDSK/6TgY1l1269cNelpp+pCCscKOViLS9+G7JsNk316s910mkzHx7+uBPAXA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZGuryBoa7lKnFUo7/ggxCiisXhp86TwBGklnZiF9yzc+LOYp
	Jfxbog3tiFXl90jeMddyOfK2u52efr0gZO6De9+Q7PsqXltxKEzTRcGw
X-Gm-Gg: ASbGncvHhWubHGpSexrTqA8jYGtPvvz95IKY5vngJIa+4RP2XgIMszisQMli3domBU6
	XD/UWt5M/ftXj1HrmDQWYFBsBFALEDBT7xnHHkZjSap4B15P3N+OpBq1DSss21a94bc5+gs8HeB
	Dr85L/Klm6GNmHi460pf29W77C85OBfJD3E8muS+sVtPtJSACjNNceBeHNvZ50nRB8530S4QkO4
	QcbTIIyGJvaDmofUvEt+ClfH5KZzKBKPYVLW5vL9/WK6FqFNZzPWbo2Jrhes0Q+qzGJl1qBEb/R
	D5nTryrghvR+nKZwkbXLAJpwv/inGrmmAIxxit/2/zESyVN9AmEE22RW4/UT/zD5kf6gKnHJuKJ
	Ds3SpThdLUH4Qahv6Y7Sgapx2oysQKHNc4MvVS4nTRTJDmQDuL5xAnrBXu0zKWM++5WU0oe6EAK
	gB
X-Google-Smtp-Source: AGHT+IFMC1ZTRJ80d2+tQCzLJZEUcRjgNolpnafRAvb1tXsgv9lX8RVp0jdHUx6GvU3poKNRSafE7g==
X-Received: by 2002:a17:907:7ea6:b0:b3e:3c1c:d2f2 with SMTP id a640c23a62f3a-b6474940fc1mr2581204566b.36.1761121573582;
        Wed, 22 Oct 2025 01:26:13 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6cfa6cb6e6sm365510866b.49.2025.10.22.01.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:26:13 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: hch@infradead.org
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	arnd@arndb.de,
	axboe@kernel.dk,
	bp@alien8.de,
	brauner@kernel.org,
	christophe.leroy@csgroup.eu,
	cyphar@cyphar.com,
	ddiss@suse.de,
	dyoung@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	jrtc27@jrtc27.com,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	krzk@kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcgrof@kernel.org,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	nschichan@freebox.fr,
	patches@lists.linux.dev,
	rob@landley.net,
	safinaskar@gmail.com,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v3 0/3] initrd: remove half of classic initrd support
Date: Wed, 22 Oct 2025 11:26:04 +0300
Message-ID: <20251022082604.25437-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aPh9Tx95Yhm_EkLN@infradead.org>
References: <aPh9Tx95Yhm_EkLN@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Christoph Hellwig <hch@infradead.org>:
> On Tue, Oct 21, 2025 at 03:05:35PM +0200, Christian Brauner wrote:
> > Without Acks or buy-in from other maintainers this is not a change we
> > can just do given that a few people already piped up and expressed
> > reservations that this would be doable for them.
> > 
> > @Christoph, you marked this as deprecated years ago.
> > What's your take on this?
> 
> I'd love to see it go obviously.  But IIRC we had various users show
> up, which speaks against removing it.  Maybe the first step would be
> a separate config option just for block-based initrd?

So far in recent months 3 people spoke against initrd removal. All they are in Cc. They are:

- Julian Stecklina. He planned to use initrd with erofs, which is currently
not supported anyway. Also, he replied to v1:
"You have all my support for nuking so much legacy code!"
"Acked-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>"
( https://lore.kernel.org/lkml/1f9aee6090716db537e9911685904786b030111f.camel@cyberus-technology.de/ )

- Gao Xiang, maintainer of erofs. He also planned to use initrd with erofs,
which is currently not supported anyway. Also, he said to me:
> Again, I don't have any strong opinion to kill initrd entirely because
> I think initdax may be more efficient and I don't have any time to work
> on this part -- it's unrelated to my job.
( https://lore.kernel.org/all/79315382-5ba8-42c1-ad03-5cb448b23b72@linux.alibaba.com/ )

- Nicolas Schichan. He has million devices, which use initrd. But they use
root=/dev/ram code path, not linuxrc code path, which I'm removing. He
explained this here:
https://lore.kernel.org/lkml/20250918152830.438554-1-nschichan@freebox.fr/

So, this patchset will not impact these people. So, I think it is okay
to remove linuxrc now. We can revert this patchset if needed.

-- 
Askar Safin
