Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC723570AD
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783266536; cv=none; b=HzvrBZr9eweKxhBuD2Hjx0Kcsu8FuvZrXMUnn4NUJmhaze4nldDkoIF5W/q0j7PS69to0x8TbN4kkR3N6v/wN+3CKpB6ETn08zVi3CJq2+J/b2xX/Af8212aRoufXl0yoS0IzqnsY9XtYxSoZXaB0UHVTJ05R3JsqOAM6C8SeNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783266536; c=relaxed/simple;
	bh=pFbMuVYsU/xvX/0LLtpdghcgCql2qU4DXnChcmYSlXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlQ95LpasHWT71ycl2b1K55MfPLE9RMUR8bC/7Kx0sSJSkSTfdjo0jubNd+dp2i0xi/uZ5O9yPw5QV5MncwO3UWC6hQxaiFI35qU23fCGF91VdDnEiKU1E4M10vD6hb0ZSzieodkwD1VMgkS9fQT4yJhrBlGzZ4aFQkrrl8pBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRAHy/iD; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRAHy/iD"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-84780c95e2eso1582592b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783266535; x=1783871335; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rSMUS4NwFgQ8SXxeyhwy5pUZgSfUfiZAQKzYnFAb0Q=;
        b=QRAHy/iDFnKi7XVj/2ZGeZIzb9PNaS5FCStgCEjp94FuyG/NPv9fVWOK+OI5SAeSXr
         sN7/JE8Jx8HaS1EOu3thoXY3iu4jnxxcQAyEJioat8bui8wNU1JoASFY1rRo6PcNp+DM
         9LO9J0yEqN+EN8+8r2u04WVM97EpIaDZsf2qe5ZVoWrLDIkqiF6uhL4+d+pz5w+xv9oD
         eyAFvVZKeI76L/7286K59O/FK8Dk96JTixzu+PgDB+WBcByCEy1kkon3HrMIFggjg14s
         BvGfCyF4ncuJiXIgEhKBaJkOI2JxQkTcgWTwkiDctBW1XXRtyKbQ61P/T0/fqp7pzXD6
         +T3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783266535; x=1783871335;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6rSMUS4NwFgQ8SXxeyhwy5pUZgSfUfiZAQKzYnFAb0Q=;
        b=Tq81BQuWiFg8WJvLepaUz01FD6Ln78D2pQUF6mIjMHwoFK/7P7Eyq0CWyNypujhgyX
         aZdHEYoS0MTbZPVc1kkwHOAlBz4d1RG1aPKAYLefxzb1aJsVb/CaH9Jp7EbmcAqcqXJq
         04Rer2uvRo/YRA1uh52Q4CBYKN1aZUzGaQG5LTkWV5SNko6ULCInMXgzuMfdGZ+dffWR
         zbb9Yra6i9s6uSo6pUk5fJTSt76c6Qr5JNGMrhkpeEh9oIXN0RP2c9bOTvn6HN7z6JEX
         1XswNJ0/Y+6UMvVAPD8bZLkBwWjFlwgdGlI8Ui22azJCa5nSf5CgmU9VQL6FKX3YEdar
         1COQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzEserewMIR1O/bhMeeyKR7LNkKe4WhP2cKw4u+cnN1zZMXPsegorWTMFq4n0nwWGaucLK3ADYZDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQhSxd8HlAMIxwuFjIJj/Bs91lu1BvLbosj1WOcSTUUJXBwuYM
	hj7+LudNISUdOpmqLws7ImbfwIJ32SRey/bwfn1vymssn+TWOpcl8txBrtmSWl9DJwE8PA==
X-Gm-Gg: AfdE7clismeuWHKGC75TDc8KaY9B4O3QtQix6VSfNYEQW0uRU1tQMOYim8NcKuf84q5
	0qB3NRZzA+YyscKOtSf3wCFfS5uMpoOVzfpmFBEHulJjWQ3vB8JLymvQt9ZzIi6PxVzM6TYLFBt
	iBAQrFQNrrBvrFB4+cKbV2HYVuHMguxPR/xBQwKuME5CByjYCN30KjGHdCYztoiloxoyjJeRkNP
	ywNGZntDbBKr+K1kiFhU/zeBLpe6eI1WbUcCubfoH1R0UJztVMv0mC+V41KYauajOfM234x13mM
	1+PDBaKcTmGEiMFSAYf5qJe/e20BlQbBqsPKN5lu/jr+qjqFL9H0YXlbK0skJ4Qeo9vsOEsBWY3
	wZ0UbpQXMKfUCbxOAuRmflX6MsarURVCtptlCE0xRoU1AAxzi4AWst7vciwwG9PEr0oJkLFFmk9
	ZU3CWQ3DlaHnBrlXj/TlVj
X-Received: by 2002:a05:6a00:8d86:b0:845:ec1c:71ff with SMTP id d2e1a72fcca58-847f6f3cf0dmr6746348b3a.46.1783266534767;
        Sun, 05 Jul 2026 08:48:54 -0700 (PDT)
Received: from localhost ([2409:8a4c:cc0:9ab1:cd4b:250d:9228:2c4d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6162esm2450119b3a.11.2026.07.05.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:48:54 -0700 (PDT)
Date: Sun, 5 Jul 2026 23:48:51 +0800
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs/zh_CN: add process/changes.rst translation
Message-ID: <akp8A8rPEMxN0O3U@archlinux>
References: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
 <20260621131215.1303439-2-qiujiandong1998@gmail.com>
 <f9d35cb9-4fc6-4d2e-821f-ff949035eef8@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9d35cb9-4fc6-4d2e-821f-ff949035eef8@hust.edu.cn>

On Sun, Jul 05, 2026 at 04:23:58PM +0800, Dongliang Mu wrote:
> The latest commit for process/changes.rst is 2c1ccd9a1d78(docs: changes.rst:
> restore pahole 1.26 minimum (regressed by sort)).
> 
> Could you please catch up the latest git commit of original English
> documentat?

Hi Dongliang,

Thanks for your message and for pointing out the commit.

I see — I had been working based on Alex's docs-next branch and didn't
catch up with the latest upstream commits, which is why the translation
missed the recent change.

I'll update the translation to align with the latest changes.rst in the
next version, and I'll also mention this commit in the commit message to
keep it clear.

Thanks,
Jiandong
