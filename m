Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446898;
	b=vl8mlr6umAgnvmoI/hOsy+r9OZHU6ZKk/QCx0HbytABg5LMsHRT/Obz+f/bPkZG31h/l
	 Csd8oyBwSrSpInd6322xEmNhCAkUIYRx9up9LIKVClm7pNaujnvz1OSk/t4A9OFl5LDf/
	 557iPtXydXFmjugXI/aCS+/FyRLJ1DyzoSqq7jaGmp5Bu/gc316mG+Dki9orfGYQre20K
	 AB2S2t1j+B9jeG/JnzrQRThdM/wEL4CCQvCaFDtIkGaQUZtsU3h/rZhag76UDGdno5/zr
	 vhngcryDuoK/nHiG1yWWxeC/dWeE/JvvoICghUQLiDptActz89Wk00A8lUW+tb5lJQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To;
	bh=L5M3f6tXuCeudVEXZHMryiVzKAWS6njMK2AQVRvQJEE=;
	b=MARUkWmYmPzU8QMunU+pSJ4w5EY38YJgu79+9nu3/5Rkh1GZT1HndYqeYa2K508abKmP
	 ekTJTOBUFSl85oiMOI1d21P1T2TZdGFym3rG3RuRU+nXVngkf/xd2F6VyagupVoO3Gvat
	 Pon2ooCAPdyyTA0wDhULLwyaB2q0Mc7r+cw+DdOZg0w2wH3cZwckJeBCWpnb8z7N0iQo/
	 0qF+N9YUFL+tHsxlDlHS0cFIGNXhCFsFYNYLjutHP5uhRNXBWn7eRdw7LMHQ0LMpFdSs9
	 EKa6Ko3ykhFA+6bmyww8CmdsHrNIh1rcGSUXo7y+TWKRg3eupHmOIAewWzxojQCYHSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWJhogjW;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E09606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E09606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWJhogjW
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3330042f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446896; x=1796051696; darn=vger.kernel.org;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L5M3f6tXuCeudVEXZHMryiVzKAWS6njMK2AQVRvQJEE=;
        b=HWJhogjW4F7JhplhpATcu7xz59o+fdiJyJlkt4Gd5l5/alTmIffqCyC0lg0JI87ZC2
         fA/OtviKtevbQLCl2rIUMBl7Ek+oP1Ud7Pjnca/Gv0LTzFPZZDRFooI76KWfhXOqv93h
         9uP98akzjfJ3mjOzyCA2srhUm2bD2Ry1Bxvs6nAw3OPXRN6Edbamdyhho39D6Bc+02rc
         ZuhDfErCAJzIsFZjkfDLHMixxhJjOO7bDj7V8iq52XySePXOBpm/CX5ufH5KlPItNWsZ
         CAbXKtJtwZMPPhH7O8d5xBhV5U+gLxoKlRN0stX6IW/2cWExG+NLrT9GC8zOp8ox3ErA
         /sUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446896; x=1796051696;
        h=in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5M3f6tXuCeudVEXZHMryiVzKAWS6njMK2AQVRvQJEE=;
        b=c+NgEqlgtO5Y4KmF0Fgu0vd9nV9Vqryt89xps3XwPqn0r8fLksTeQsoBiJVc7BBsfQ
         +zv2eCGG3yvytc9DyufmnKtTqnRw33BfO8+Beu4hpwYaP8NQBKKHIdiTVh0BjOB2Qjcv
         sRw45SpHRvFZjdKQb8Fhk/ld5q47Glz8G4NZICd6iduIyNBbe4Lq8jOKfEgNK59g8fmW
         mFoNOKvDAJkmtR0A9f0ckuELrUpD8IcPsVyKgjABFxuIhrWz+K2fxKBjMzpmR5rDGBt3
         rlNmNuovfcPcB3hxCjpt7eJlDExiCyKIOZmsj8dKepXDMnRLzhkcD9uw+s2u7fGYySxy
         5wsw==
X-Forwarded-Encrypted: i=1; AL+hErE+par3A/+LXtvbYG0oI6La/UvT0gu5jPzR38J5RpSRK+SWjPny9rTYAj5qrhkDnEZqsmGQep4RL/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BjmjrQpw17tGBQvrWc5exhuaSfDwQgM/kEw73BOx3nFbddygE
	wRtQtq8tgJbcCHbRA1DszI5cgPiparwA+l/uaJJZegzo2xjjm7SwUtkY
X-Gm-Gg: AZFdTZehAZYrFN7hIEbUR4UPe27N/mudk2CIkO0UuU7DYaP9OfEpi8fe3o3vyFIqXIu
	jHQeQCIIQR5q1G1GNtmcoIxHACKtoWYbGyG0Gpuh+I5QtkJVCHdshFomYHP1PtQf2XKBQLzwSPk
	Jrwl6P/UA2mYDv/6CYsB+EK9iEof2/f0uw2BR9/wvd/Pudzb9cXTaRM6wByPy70MiGOs79qnO8I
	R062aPv/ZJHr5OEJ7E1SFPVt2TA1+NxutboP07GGCDkHDBdqkecl62KF7zkQMg8q3RTQFs+sktv
	b6Mqo4fVd7R314u31oVInwCbcWS4korXg5ezoYFd5AD10Zg6ZzelW4+ICBf7bidCi7NuzUzPjjO
	kPCIHMHDfjGZWcFZQvxv2EJiyTNDzd58K+9iazSwppPEWK/lmNmUGMnNGSGPU33aoxxzR7CXFGs
	chFWaexqYnXtknaElJZrMSqzJ/JfrGE5iK4w7rLtDqaHI9MB9KjGBzQi/o1LBJuNxWFDk+i8Bca
	zlHX6WdTf7WSFI/p6vzRqhXOwL1a0yQQrOeDbVWFJxQMKBcrH5ft8YUp1NWHbdic/B2DWUfCIQ6
	sHYV2lDYRC/Ys7yCkbeMTt9R9OMM3X2JX8Kv6BrAJRo4o7+QVc4Sp9VAH/pMVkL2GAXdkjAaAYf
	5ZNg=
X-Received: by 2002:a05:6000:4b15:b0:48d:df08:307c with SMTP id ffacd0b85a97d-4abb8ac0d92mr20304624f8f.44.1795446895827;
        Mon, 23 Nov 2026 07:14:55 -0800 (PST)
Received: from localhost.localdomain ([196.178.137.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm19778632f8f.17.2026.11.23.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:14:55 -0800 (PST)
From: mohamedalibouhaouala@gmail.com
To: jack@suse.cz
Cc: willy@infradead.org,
	corbet@lwn.net,
	mohamedalibouhaouala@gmail.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: filesystems: update filesystem type, superblock and inode documentation
Date: Mon, 23 Nov 2026 16:14:38 +0100
Message-ID: <20261123151438.47681-1-mohamedalibouhaouala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <p7wf376fhejkqtke2l6jxwzytlhiiaidjdaeapw36jxukbk2qx@kyk2wc5m
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

hurn>
References: <p7wf376fhejkqtke2l6jxwzytlhiiaidjdaeapw36jxukbk2qx@kyk2wc5m
hurn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Jan,

I checked the patch against both master and vfs-7.5.misc. It applies cleanly on top of both branches, without conflicts.

The previous documentation work I submitted was a separate patch updating Documentation/filesystems/locking.rst.
I wasn't aware of any ongoing work overlapping with the changes in this patch.

Please let me know if you had a different set of changes in mind.

Best regards,
Mohamed Ali
