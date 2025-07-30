Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9B219E7D0
	for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753913190; cv=none; b=TJuqNZWd5jmhMiqGK3B3PPoYZVtSzEJoeLtwUK14tOlKl8IGCAB+xk8k+ZA6JJtNdobGkQOCcoqhUaI/bBhepsQuKkVgho4N89LvEXbeYoMos7/QoRwBxaSC9q1zPIlflcV2JVal+d/Pe+8C1pckcHo2h+h57b+I5fmMJyl3xxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753913190; c=relaxed/simple;
	bh=5FDyXQRbCQzjtmA0ZBTa4CrTmcIqeuFjE7UZ+wGrZ08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=da/tn57foBk3LQEGD3N1oTIRUFt2ubaObmYeX2rGAk1N8DZZx+DHe79uIXOHY++z4ykryBPF0IJsxaFWKq5dFcc6zydsYJvr0a6R9BR1IX65A7L/4yo+FnoiQAPi3C2wNUOedGPigVjsmM8Xdx1mOumTpLLcZLR3IvSXKpen3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-74264d1832eso425468b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Jul 2025 15:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753913188; x=1754517988;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEntMuJf8K1VWn94KVCjax79vkBqXY4AtaSYgFOY52A=;
        b=qLbSfa8fTZRAaAfnQt4NSKKXuDhBWv+ab+Ob3niogxwwd4aWM6FN9n43L369dQ1qEq
         yI4YvBxsb9J0e+npii7mmlY/rpjOKFaefNc+e/phqCRi53jEWxrfAY3MtY/WbKP/89RK
         5P2kvSt5wmXyfryEG+Zecnyfux61kPszMfZ+Bk0iSDTv6/U0Mgb9GnURMfZddWtV+r/u
         pFvJ4lPexObqB6WsftqgvoDY5SwT1AOMoxEoGZRjbdE7e8AfP1D7gNaH/PIX6NWPVqad
         Uuch0pQOo0W7q4xIf8JK3wFvDfWnzS9cIyVPBMTTHEeXZzFcWtRHx9qBKJ//qjoD/3Tc
         L2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM0kToqE2Hws6XOsKhMe//+eB9Y9rOZfWm4gYJDDekgPWVsD5YArik+7D16bkBz9w2NjKbhTLAL7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Nek6+GXTSWpD+f9LQkdZz8n6LEjMD3M+CvgeUzoKdnmfTBPv
	bucSfhDFhtwxbgo0KEhEXiXZv/sw178Bqw2ydPNL3BsKVt6J45CHEaqETkk/5G/pRhk=
X-Gm-Gg: ASbGncuFabmdJjNOgByXaf64IAFmn+WfZ8We/XhDfRh+amEVWgZUGIJ3EibYBIR0rQM
	WO2ejlMqd3K3xZ6osKlGu7CONEMeYGVj7jDtBKsPuFcdY71BvYCNkAZ99xxKAQH+HWixS9+7HFs
	1D3px0otuTmj2IebFFsWSMVlxVF+03uXg1UtZZQT3Pzpnfe/QQqK573ovpCRfAr4Dr3gTNr8dU+
	1dHlrQsSjpHgpP70P8jQC5JNIqB3cQ0V7QjHkXnaNDijyW9jNXZZ8y4CuJzdyvydbfSpDezl6Oo
	pSzJB14T87KhMr3MgK7UGpNClSScxJtBiSA2K/5U9mRfvYykEbW19DQbG9A4bYK657MvUwMD5wW
	Oq6WtogXywnh91SuAOszg
X-Google-Smtp-Source: AGHT+IGKMwSJ63Nd2yH1XeUzJy9fbrTtsLW845jouCtlujT+wryYRIBOXBjfDANPssG0sgMTm8sLcA==
X-Received: by 2002:a05:6a00:4b4e:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-76aade688a3mr7553796b3a.0.1753913187759;
        Wed, 30 Jul 2025 15:06:27 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640872a180sm11482407b3a.29.2025.07.30.15.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 15:06:27 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org
Cc: sashal@kernel.org, josh@joshtriplett.org, kees@kernel.org,
 konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org
Subject: Re: [PATCH 1/4] agents: add unified agent coding assistant
 configuration
In-Reply-To: <20250727195802.2222764-2-sashal@kernel.org>
References: <20250727195802.2222764-1-sashal@kernel.org>
 <20250727195802.2222764-2-sashal@kernel.org>
Date: Wed, 30 Jul 2025 15:06:26 -0700
Message-ID: <7h1ppxcp0d.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> Create a single source of truth for agent instructions in
> Documentation/AI/main.md with symlinks for all major coding
> agents:
> - CLAUDE.md (Claude Code)
> - .github/copilot-instructions.md (GitHub Copilot)
> - .cursorrules (Cursor)
> - .codeium/instructions.md (Codeium)
> - .continue/context.md (Continue)
> - .windsurfrules (Windsurf)
> - .aider.conf.yml (Aider)

This doesn't work for aider, probably because the .md it links to is not
YAML.  When I start aider with this, I get:

  aider: error: Couldn't parse config file: while scanning a simple key
    in "/work/kernel/linux/.aider.conf.yml", line 3, column 1
  could not find expected ':'
    in "/work/kernel/linux/.aider.conf.yml", line 4, column 1

Not related to this series, but related to aider... I'm curious if
anyone has got aider to work with the kernel repo.  It seems to have
problems with large repos.  When starting in the kernel, I get:

  Unable to list files in git repo: cannot close exported pointers exist
  Is your git repo corrupted?
  Unable to read git repository, it may be corrupt?
  cannot close exported pointers exist

but neither claude nor gemini-cli have any problems with the same repo.

The aider FAQ[1] mentions using .aiderignore to ignore parts of the
repo, but even with an "ignore everything" rule, I get the same error,
so something seems wrong with aider and large repos.

Kevin

[1] https://aider.chat/docs/faq.html#can-i-use-aider-in-a-large-mono-repo
