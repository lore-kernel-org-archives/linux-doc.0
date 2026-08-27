Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C33840B363
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821061; cv=none; b=MwPOTz6rroEcY/zaD57ssrjjzzdaXcwndAKq0RcpE8bmJNTPZa23ymni1wLPIiKhTHRK1bAtyBI/kwmC5Ror5miEuL5+eBpdJ8HoRE+VJKqu7rMpj3sEMeQfvGR3AWdcDvQFLKhZzZ5kPoosY38qK4o7tvdd08zaeFSmXgmdRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821061; c=relaxed/simple;
	bh=dXPbsyRJWWoFEqMWFib4Cysn4+BaGubLkxC2/6qBhEc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YH97pN53RvjfFfHl0I4yaJfYBHkVQuKlyfO11udx7dSfFtdHqgNSLyHfaxY+O81qBEjuvDWv3zmKQGRIg+BlmBoHEp+9RC9O4xbtHi/JATl1aQTcfWAX+VB1MFTaI2tNoXi5WHeLtprdNAQKHiJRxFXLmnlnCk6Hrni5JLa/Id8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWa6gZad; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWa6gZad"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caed617615so20570125ad.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821057; x=1788425857; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wjW3UBtBE/XmT6KkSplPYiM6V7zSUQJYuA80LoB2NEA=;
        b=gWa6gZadG0TFjvHesOiMXEvnYgcfZym38CURq6GZ2x/BBolxc57rSyI1N3axRM1BS0
         OYq5YtoXdAASgl+vV6aCKwcD21LpZvg68bM5jGoiUn9Tc5JX5/dgJIfmNoTeVXDsgqqJ
         IDBRXrTDJr6gcZ9GkiWHCccP9F0mQuDkWJzF1zwNQ9pkD+0wowm7KDYjyJ9qMysiG8GZ
         PSDeAUzJtaU9EjERVyEIzoLXdSHlKPHN9Azxrwt6Jhe7sGhmCxmP77KdcpdJ/jReFd8h
         wqUrHiBVV/5YDiXV6fO5h9iKaAwvGjpraYm13INRL3ThKhv3C5iu4tBxjJ1YzVkGlc8a
         qx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821057; x=1788425857;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjW3UBtBE/XmT6KkSplPYiM6V7zSUQJYuA80LoB2NEA=;
        b=j6nnH/XxTS4eOH/XT7NskdJvm588cmNhbPreBSB85ceHhpajzFBF2Nr+MsiXz0rG5+
         uXEZu5GelvQPTUHw4F2OrlnvOrV6JX3uWRSvAierzv/xFVx1u+4VVN4X8LcWiCTdMBwr
         Xoz4c1VBoPI7QrcOnyOzUjsb3wmfZC7ieU8dRDYiaB3N/lYcsZo4MluJz32YF/59NrGq
         GHN3A1sfSU7Kq0sp84eUDjKlil4fzh7IRfxCjIhVrp/GgUEmjSfbvWgrk6g4wQy5T+FI
         gKSWprt65uAE0MFq9jD4+t3ulXFeKhKfbRNaYMWMkEMAFHgMndzJGi7PqHJXUR+eAI6v
         FGzA==
X-Forwarded-Encrypted: i=1; AHgh+RpHyubUZHoBM2cDQAsNcwMjL4l/cL5ehiUqLuwZAs7OlXGV28b6k1ZSB8KcFJUFDR0TwfHCAWCq45I=@vger.kernel.org
X-Gm-Message-State: AFuF++nr6gKPH+35TyJO/SAgRQ0r9CD+xtq79RIkXwX6/OyHUU8C1WJV
	8AFKJSoNDUR+g/fgQ5zSbFaT6OP9C2Tf9+cbiSWui/Uq9rMIwjwYSQqi
X-Gm-Gg: AR+sD12ZKf+iC42q3S0Ywov7qNG/7n9dRrUkb0PVSXqdS9+HpIymIe6N48pHT3OBOuy
	c6hCv3x9SSAHFn2s5NRwTCnvxMKEIJufuqIZ8dfy/yymEKGWS0VKdnru6xSSW2y6WXfMLpvTo5z
	Wx5ycvK9gT4IK8dQcn5j+x1ImqAY/TMIxsqIZmbV9yFkgz+qhcLgmam2tLLWyYwEAL/YJz81SbP
	UAD8CkEuroVZ1PwZNklxOOL+396fgVToX62YKmNFKhbO5mhjXsN9NZKX4z0NxoKhqukXMu7FCjr
	/77eoTZjH1+Mm0ovpEFVpEtl5zN9fRUndWGbk8RiNrNL3SO5esqsiVckG+O40SsZrGfHxZLMnL3
	bVulpzUVi/jmhCqGLtrRrqRZY7X4yxuTLp/54l9FvMeLiwu5wkiM0syk4q9sREDgMQquUlD/uo6
	yPv9/jhRfhSSD1COjCZd4sNNe44r9Hr26N2KBIyP8CBbremV4ZM1HpymVJ+zXW5WuJcGNG6+qXT
	hI2CMFyxyEY26RsK0GnFCEF7U48bYr2SBLPlzA2vVar14/JDfLyyo4Xt3Gwm80EWlNIMEedEBvO
	LffMHQ==
X-Received: by 2002:a17:902:c945:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2d72eddd21bmr80438055ad.3.1787821056640;
        Thu, 27 Aug 2026 01:57:36 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70493caf4sm15181155ad.8.2026.08.27.01.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:57:36 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:57:32 +0900
Message-ID: <m2v78wueir.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: ljs@kernel.org
Cc: david@kernel.org,
	linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
In-Reply-To: <ao_541nBaa3SJS9F@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
	<f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>
	<ao2Tl9CLL7WjHYun@gremlin>
	<bb9a3add-4849-4928-8b6a-0afc0c73b112@kernel.org>
	<ao2l9Ao7BQI6uRKC@gremlin>
	<m2y0dsuf1d.wl-thehajime@gmail.com>
	<ao_541nBaa3SJS9F@gremlin>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Thu, 27 Aug 2026 17:49:58 +0900,
Lorenzo Stoakes (ARM) wrote:

> BTW did
> https://lore.kernel.org/all/20260723093633.140989-12-johannes@sipsolutions.net/
> go upstream? Or another UML nommu mode? I've not been keeping track of all
> that.

The current consensus (IIUC) is above Johannes's patches are in
progress.  Another mode which I was originally proposed is postponed
in order to minimize the impact to UM tree.

-- Hajime

