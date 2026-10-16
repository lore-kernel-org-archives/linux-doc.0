Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FFA34388D
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160410; cv=none; b=uZM4u2hv/Mg/3ebO1ObBcGGTiLKjyKENDZTCLPDqG4Of8qU8w8PT7vdD9LQVp6AbpjGtquT/epQgDXOxRDUJVjKXqk9fnWtQ/nELD3iZYZgXurE7Yjl2WbRHYCl54Uz53TXAWb9NPGuVd44JjjHYcXO8jcMYg3uvlGuqyBvTPys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160410; c=relaxed/simple;
	bh=YwzXpAOIl2Vv15haH4xKrFCc0zZX28zmgV8E0lOwtSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWObRq/ajHpono8tgSE0M/TjgbpX6gJSk1xczCZ3EExAEti8DTsPDbvNFWaT5lZhZXaXE7KEnnhJPOZGt+0Uy7m3Z1ozbszba0vn3r/ZdYodR4KoDzV0lUN00Fbz3IPONoLz7Uqsorl/ETfHeYaXObul1SWXBw14DpKsN16THdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/Q08eGN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/Q08eGN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16c399641so62739965e9.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792160407; x=1792765207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6uidg5CuGsKY6XwWY8ZHCyov81k9buURAeTyWzFMBtY=;
        b=B/Q08eGN9wnU3Sz5mqFoxOAC+QotyVNkZG2c1yU4adlK5ZOgzMotUat3PGgQDVKgaw
         8rbycccK/RMeyD0hKg3lulr/DepFBbSrKgXktRCJrAnat0yOBN8Iqifg35179W2c2Wl9
         6zlR3cpccThcEmLXvRv22thBTpepuOxqTGy+T8erm3gm0OwhDIzRdJCzhil6PGcRKxjj
         oP84QlawC+rZF0Xj63BSY44Bx0DYSZm6/WTD9Gsw6F8MBVDKMYuTiQNTLp6UeHezOp23
         GgbuB1JjbW5BsaSDJ8GDFAAAX+KC7u+2fkIRoK7OtdVmbX/C/IiqLJScFfvCTyyX202Y
         WsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160407; x=1792765207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uidg5CuGsKY6XwWY8ZHCyov81k9buURAeTyWzFMBtY=;
        b=yjXDu6uqL+urakQ1vC+dfqJwTJk5WJW+viov09JB//kDiMppXfwVKTKM+njB9vD+PA
         8gMN6DC5kEmjrHGbhDMdpCyE6UZ8Oz4jnAc/D6ZCBvPRHaxa7WNUsKmnp1OmylvjKq6s
         vspvbyFkN8mzty6dCH+qzg87CB4h7nKFfdGFYqRv6D46JeOcpboUFflb+D3D6jzMAwzc
         n+z+uZZ70KUV1iLTq39SiK/w0EmwCsIb1ESwzBHZDw/nXzgSiZK1ZaL0JEUoynT5bC+v
         dbR8fTG+jASFy+9x+7nsb9SL/E2k2UyAcvgCjiMwSY7KqgQjSJ/wbE/erG2NEPFg1q8r
         TxQA==
X-Forwarded-Encrypted: i=1; AKwUvBwatuLsEJsIlrTrk7cbp8KhrniLh3tgnAZgJD2X/GaQHfcG11ljFCUAiBLUAEP1vGYWBaA8WAEQ7Bg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjzdfAshpsQuRYj2ViToLEWco5qpHK8U7YH6ZFvzZ2dMa00XQ/
	2VmyG7rF90Lu8yHJAOXYaSARYw25GPhhP5lPUlb3gjEu6yY/PWXJ3eLO
X-Gm-Gg: AYBFou0N1RzCxupxudRHBEAdpX+HEsaZIyGUMjvtIQRN/PmRIauZns8mJpRG8PdsSJS
	EAitmIxmFYGhy77B5JSjmE71xODxylFYVV2lw5h1R6vsGz8dx+KYnD5kmdq1ysRyVUVFKB/S6E6
	W3YOoMROTlYQr8SuZE7s8psHkYx5eMQ0atk5f/66Zh5UBLrWF2Xa3HOKkZV3naTYUDbVXu6jKqj
	riRayGpEOknGQaWrW8w7KEevFPoCgYotrCtdSV79PR6zRArDpr0ei3AbX+gq9iSvJVUfPPj+o02
	ejF4bbA2zMhsQFoRh8FaOy4ZXdKMHoeyJqHGebHQ+XAS8qCKZ0IzytOH836jPj8HqDKdyWtmy8H
	jWtv1gAXosuBADjpi227RBhNjkxEbn7jRi5C8mXsSStvNchb4VP/feJEwye/Y3o7NDSnzmf6pYS
	Duvh5lqpHVAHnzqjq0MvHU8XobN4tqTwN8DuoQwtiYDxyJq140R5LXzQHXZtPPhBMZiVE8TV/QG
	ctXIdUnmONKQ05FWsIs30xMeT/cQgdGDQYBGlUzNDMhBGxI/AaTcLpkvaCQt4SeUiF/su/zUzY2
	GxhwNg8bzgULm/JQPUybZACvg4pmB4wpWTiIg46CjjCiR5vbrhp2yLscxjbx35ssJ3GVMT9gJQE
	=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr252470685e9.26.1792160406983;
        Fri, 16 Oct 2026 07:20:06 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm63818405e9.2.2026.10.16.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:20:06 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:20:04 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
Message-ID: <atIw3EWamd4KN4VP@gmail.com>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
 <8733u8w6p4.fsf@trenco.lwn.net>
 <20261014233956.605e0960@foz.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014233956.605e0960@foz.lan>

On Wed, Oct 14, 2026 at 11:46:13PM +0100, Mauro Carvalho Chehab wrote:
> On Wed, 14 Oct 2026 11:08:39 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
> 
> > Which versions of Sphinx and docutils have you tested this with?  I
> > needs to work across the full range of supported versions...
> 
> The minimal docutils supported is 0.16, and the minimal Sphinx
> supported version is 3.4.4.
> 
> You can use /tools/docs/test_doc_build.py to double check if your change
> is compatible with the minimal supported Sphinx/docutils versions.
> 

I completed the A/B matrix using tools/docs/test_doc_build.py -f. The
full matrix shows the improvement without a regression. 

I also tested Sphinx 9.0.0, 9.0.4, and 9.1.0, plus the previously
discussed Sphinx 9.1.0 / Docutils 0.21.2 pair.

In total, this covered 32 combinations and 64 full htmldocs builds: A
unpatched and B patched.

Successful, with identical A/B output and normalized diagnostics (26):

  Docutils  Sphinx
  --------  --------------------------------------------------------
  0.16      3.4.3, 3.5.0, 4.0.0
  0.17      4.1.0, 4.3.0, 4.4.0
  0.17.1    4.5.0, 5.0.0, 5.1.0
  0.18      5.2.0
  0.18.1    5.3.0, 6.0.0, 6.1.0, 6.1.1, 6.2.0, 7.0.0, 7.1.0
  0.20      7.2.6, 7.3.0
  0.20.1    7.4.0, 7.4.7
  0.21      8.0.0
  0.21.1    8.1.0, 8.1.3
  0.21.2    8.2.0, 9.1.0

Successful, with only the intended A/B output change (2):

  Sphinx  Docutils  Normalized diagnostics  Changed output
  ------  --------  ----------------------  --------------------------
  8.2.3   0.21.2    62 -> 62, identical     networking/kapi.html,
                                             searchindex.js
  9.1.0   0.22.4    74 -> 60, removals only networking/kapi.html,
                                             searchindex.js

Identical pre-existing failure before and after the patch (4):

  Sphinx         Docutils  Status A/B  Normalized diagnostics A/B
  -------------  --------  ----------  --------------------------
  7.2.0, 7.2.1   0.19      2 / 2       191 / 191, identical
  9.0.0, 9.0.4   0.22      2 / 2        53 /  53, identical

No combination gained a diagnostic or changed its build result. The
only generated-output differences were the intended restored headings
and derived anchors. 

Karl
