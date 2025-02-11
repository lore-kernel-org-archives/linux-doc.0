Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02531805E
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 01:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235941; cv=none; b=PS9tBC+Z/bCtfWNFCYN3kNvKPeZVGdvC4AkxFGBcaR4SRP5/HhJ+Hep7IZhnMy5NYkk71nd142j1Swdjm2F506pRiYkyH7e/fS+FsbDs7z5HA64CQBvbVA4e73rj1td22yHKehprUsgbtlJglZnBSxMtSoQ5dqEwpXoTFSCuk0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235941; c=relaxed/simple;
	bh=K1S94ucNOBdzRSEy0I1Bna4AyA2fVzt9h5ZEAHDCmAc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byFnyKa7yBj/cXdzT4r6I50xd+xas75zUoElYhWPwAPpT+SfWuMVU0B4jipwfwneehmGJBBw0IOiseOmXT3c84dyMTbMjEJa3+d07fz0kDepRr/wC++vyH8dQqhVUNm8orlDlZD2Qn9R8i9zAAo9LL4m4QrI6PllsViIxsIlk/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3Vp5XEw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3Vp5XEw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f4a4fbb35so66061825ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 17:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739235939; x=1739840739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K1S94ucNOBdzRSEy0I1Bna4AyA2fVzt9h5ZEAHDCmAc=;
        b=D3Vp5XEw8Fb96T//tGdWMwRLAVLHY7J1iWGNH5IDu4f/bY7AhfA2pg/BVC3O7/XdxZ
         qMXjfJSJboTiY1PsysgztR6jn2388x0M3ApOLdgV7nSPr00zAnCo6eUf+27dgdl31ogo
         24b1IpmD8Ou3/a/OgABaGhYpuj59mg0BmvivrLaUMi98tSZHyuLIa16tPUykgwH514aR
         E0UKqQgFVraoJq3k54I2fJ9uivARS17xcEfQQPRAVnsJSivaNCjKl4vbpsxJcjBjwuvx
         782Hn3cxXObgXzV6NwuqzCKjbnOXQTbLgWTCbgFMKGEbGTSeKdNakB2iMgmP74GEOs37
         Hdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739235939; x=1739840739;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1S94ucNOBdzRSEy0I1Bna4AyA2fVzt9h5ZEAHDCmAc=;
        b=aLm6gqOy5cGGOsCsPCAM6ioqjOlhq2KFbRi7zAP0f0o7sQIJYD0qPSJ/9X0L6o4mL0
         X/RxySyknmRG8iikVvc6GfeY/MRIYSmlBkFRoOrE1U6mHw/JKfX2fNulsRQ0i91qPyNi
         RmkY+IAyrDC9TFRCi7zNwhYG50foWQ58gtLbI4A4s5LJ+1BZ4Z5lB6MmB2XH4bGfjXuZ
         m3ps33TJqLwVBf4BV3OUW2BNH+ALRGp5spWHOl1qKE046lIzPf2jXzP1q8y3sEen/pHX
         XAT1/owEc1ZGwyZ+Cfu0V/ZeAQPl9RJ3wrIdFpH2gl9Uy9UuqvAJcz46PeW9ljr48qeo
         AWBw==
X-Forwarded-Encrypted: i=1; AJvYcCX5XxigFT8eamXsaqVVc6nAn07n+ZuHEQfyGEKB/UvEZz/TDCvcz4CuC6M5A+HNKno+6o0eBIVhGA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvvIqIGOmJDHUgF9MTQQeoxIVwCaaw7FnpcEw4sOipPaX7UVvU
	yVuMHnT/CUkH5tSj/BhdKTD1rMWRERjbzLKDuQzNJYvQYV+FCGmd
X-Gm-Gg: ASbGncsm+jwLcepRtYIDtOcc2ToKOL3AtUMc+84DrlKXeDDgTvYBB5+XlA2XMicpC11
	gdnCOYh0TtLdAhS5kjstaFKkaI5sbf7Vc1OQoggh89k0PnvIDIpxTTgxNPzQa1dfYt2o7jco/2X
	QAicS8i69U+vkxf/S6zhWaGFPE2A/4h4ChCEGeDkfP5I7gKa4VnatadG7t1JDx2Ykyr4hvnM9IK
	Tjmnyft5ozPotjwj1DAo36+YGYYMn3al+rFablCWi7L1pAT/wNlqeOlvsbyqlUwp3XQqht/9fE6
	AOTi89vtJPJOQwoJrfYB4GYUUyC+ErVKi+JwyQ==
X-Google-Smtp-Source: AGHT+IHJ/h/Y49IPFE58NmIGxSLh7AOjZcv2Y9KOJnXJ0k/NdXO60kMLerCmrf3U0IoieowAOS1Ntw==
X-Received: by 2002:a17:902:d54c:b0:215:758c:52e8 with SMTP id d9443c01a7336-21fb6efda39mr25000615ad.12.1739235939090;
        Mon, 10 Feb 2025 17:05:39 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368cd38esm84154585ad.240.2025.02.10.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 17:05:38 -0800 (PST)
Message-ID: <67aaa262.170a0220.278074.3ec4@mx.google.com>
X-Google-Original-Message-ID: <Z6qiWESFExT2ZwS6@ritvikfoss@gmail.com>
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id A6A4D140124; Tue, 11 Feb 2025 01:05:28 +0000 (UTC)
Date: Tue, 11 Feb 2025 01:05:28 +0000
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] documentation/filesystems: fix spelling mistakes
References: <20250210043937.30952-1-ritvikfoss@gmail.com>
 <d85760e3-433e-429d-a6e0-458bee382d84@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d85760e3-433e-429d-a6e0-458bee382d84@infradead.org>

Thank you for guidance!
I'll make sure to not include anything other than changelog in commit message.
