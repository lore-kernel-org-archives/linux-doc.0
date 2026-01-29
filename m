Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B97238C36
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 15:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698869; cv=none; b=PZ8OE5clBA2qpGkkCJOX0Pkg0FXWqPSh4OWQNB0hR0tjECzMI7mxRXw3+iK/qWs2Nk5jiNsDlAfny3S25npVAZSv9Q/XE/dIUxOnqbKPmFZ77mniG3FPta6FDNWhXXgPE+W2zPGt8s6CaW4DE4h+2GdKFtZxiGMLOMfiJY6fESs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698869; c=relaxed/simple;
	bh=Lr0gRlWXmJSBfvv/mHBNT2m9wjy59gkDa6uMR53IbXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBBqOZ1DF7clp4VwuYx43z+Fyg5FBrUmXTvY5wMEQ5072KKsX0QooLPGk4mPGUvDRF750m9gMWKGn37zwp+NK8LXcDyyIzIp+QeAnfpIPhzmthyr6sktCJSrXop+KGaIeh+C0dk1jzLJEE6HpIezqM9KqNuIz8WpQ0esSJ/pedk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jePiA0gk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jePiA0gk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a871c8b171so6214955ad.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769698867; x=1770303667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lr0gRlWXmJSBfvv/mHBNT2m9wjy59gkDa6uMR53IbXk=;
        b=jePiA0gkn/iMQk/CTZkqzBGVWcFQuVs7LyUETySO+V/Fzx0SPuT8nUtSAf0W5wi4nS
         82y7SnEMQHhGM04g0mCBpNEm8uvsAiJYETeKLQtH8827X04VPpLr1jflATfSq29oQ6DT
         j/h6oZhAJr+U0owjj7qS/mib1Dh/sG92d1OtDapt1wxPeMsILTp1stUEZLJUa6OOfcRr
         iyb5r9cc/vKUTZDHbb3Mm3TtBn7/JoF8nnmGJjZBVsuJA/CNT8csGQGqnPBjKR1lB3bl
         0bh5Je5lO9cTAolyGmZoUtvsnvDHXJv5uGtHC+GHXe/5RJXM8Fuzi05TmTAM1RfXGIQN
         bxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769698867; x=1770303667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lr0gRlWXmJSBfvv/mHBNT2m9wjy59gkDa6uMR53IbXk=;
        b=ZonASzZ/EfWf9jV4yxrpAEdrqRkCmeHdjGWq7aB2p2xr8mbS703RS6XhdvJP1ofsh5
         C9mv5iotFlhpRYVrcw7y4a2YlV3RqbGvwAIN0ll0YCAXDZivfXTQxVX6bfH+jevNUTeI
         zaxINiFfBRgvr28ggkOHMsQp32IKRrYmwnQDsid9TTObLQRfk8G5giBnzVKjnBSqPoLV
         24S5Ezc5vE9D23LKRT9RqB3TRcm1W9+WZ0M+edNOQb3+r/lmtJJ+Sx7rLRCPi3SwRF8W
         npUJoXLxdv6vig6DVm3zl88yEtvV0iNyQtdXxQc4ptthqEVF/nuH/LK8I90QFbJmu65g
         o0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVk7Nes3tGIakjuN9KNYL8au7RYvQXLLz/2lO6MNU3x5fwGR7bJyQs+mWjEfhIQi+xocrqabzQkMX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyB5e4/mot0CStrb9ZHkWiIB56CWyG6/i2Z6TCM/WfPKLsZI6I
	PP3kwSmBX8ZGeyvHKODCh4k51X0hHdKkMvonfRbTN9t4492TpcpiD3D/9GxQaave7Ng=
X-Gm-Gg: AZuq6aJGRmc/mngfnSL9Gknl7EGq+W0Q6QoYZYEWIm/oekl1UwmjS7E9M8bvRRc6lhs
	XFd1JANExjJQSv0T+2AjQTE+u0e3F2SLN5FT24bYph2FUlTyYyDfk68z5tz8StwrEROgBKCArp4
	R+HFW2J2UtpfLZFoZ08GGQ6L5ka6Ewf+9XLHHR2SHfpyB3k4qr5ptBt7wFPBzzryHTQlHGQfr0r
	CeFbQqxOYk8kmBFyaXIPgGojwwB/aDk+/T18Wvx3IPa2ZlnV4uXjZ//xegq/+GAQ7pMhsfszoLh
	YVngib33JaDA0j8ePk1kuN6CACKE8H7MUILFvD+MAesiJugBCPtFVDJCblpflDG3AVcSHv+7FoL
	7E96kLQoZBBcsHk7UhKvnoH6AwR5eRWQBWfcDUtYb9gdHyXaVo818LIHppB0E0nvT9kgcaYjub3
	jAO9cugUPQCiFg2pnupQ==
X-Received: by 2002:a17:902:ce82:b0:2a8:7814:47ca with SMTP id d9443c01a7336-2a8781448a6mr83266595ad.0.1769698866897;
        Thu, 29 Jan 2026 07:01:06 -0800 (PST)
Received: from fedora ([2401:4900:88b9:4745:b6a7:8b73:65c5:8fa4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4148d0sm52208905ad.27.2026.01.29.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:01:06 -0800 (PST)
From: harshdaniel66356@gmail.com
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org,
	harshdaniel66356@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Add bindings for dim2 compatible strings.
Date: Thu, 29 Jan 2026 20:30:54 +0530
Message-ID: <20260129150054.41709-1-harshdaniel66356@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <2026012906-gristle-junkyard-0c96@gregkh>
References: <2026012906-gristle-junkyard-0c96@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry about that, this was my first time sending an email via git send-email.
