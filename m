Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D78248F57
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 02:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763347199; cv=none; b=pe2vWGN7E6XZp4JwlvKL7K0qaoSoBz8r1Xb0V2i1853Wa1Fk7p4Bi3aoCgB+1X3NjhL3EVW8Eigcy8zjZcGzU8mYkx3aDdGDqyZofSgDrEgzEZWfp7z8866t4J3seSyviD1ZDZAEtW7pesPaQumNGDFXs+q5OUITvy1ksUpzXuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763347199; c=relaxed/simple;
	bh=HhdF9OYU+QV7SzB42QhUC87p9MkJlTtKwJScQKxAyo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BqRpU7GROn8cH2OMN1b4zR4cfDEZdGgjAta2URX4QDofAJD54K4ti0mqdF+elJ6AJzjb9HkgCtGL1Q7hcB1qn/0RcWV20G1V+4zCS2juJNKq1/f/Rfb3SBZ5PaTr9yIflFSSHWoYIMoFT7beQ6UX8a0dbwnb7neLXI0d0H2D6X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkMCcl8+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkMCcl8+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so4048000b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 18:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763347196; x=1763951996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOf1IO3iV9NFMRVLrNnp7+aRuUjv89KLH0/8+weZfzo=;
        b=lkMCcl8+O32KSVUIdmti0TYGm8OzD+bpuovZcdvkKtiQd+rs5loYNf2NjvL+ul1fgm
         xjV1Yw4wEtHQrIJyltGHAaufeUjb8ooz5HOATDPyg/cz4mcafk4QRtH6eSZOrdlCWxuH
         L4KDtjMVq0thEWwwo9BBL4paa9kv7cMM7PaT2ve7t/McWWZOKE+7ds5DChmryXPhMbJa
         gMo4G9q7S7r6xHuj0ik4s1al2fTh8Jh6Ac/4jM5kHbHu9TKYVz2gr31Yx1p+o6gC1tJz
         ehNabG1YdIZMVGYWlKK9sPct/+HbUBVIekmuaA1XIaZbdGLDFfDbgJtYNll6ycKr/acV
         nTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763347196; x=1763951996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOf1IO3iV9NFMRVLrNnp7+aRuUjv89KLH0/8+weZfzo=;
        b=LM0VNtBQ5TKTn6/Axp3Dc3INYJRm3l6E9tEZdBy7iqRqTXViB6+Piln76/SbHc44nV
         vgx16zjTgZSLbkb6maHgHP96kpHTnzT4UWlQXv2F0t9Jt2f8Il7kxVGjstItC8MZFD1V
         ri3G6VW/fYG1+VPkACbUBGXrk5HppV/RWrDI7DwRR4g7jgP0bIPwGF0Ww2Hn7cc+mca3
         e/RLhf5eUgu+MnFjgYDPZ04BTeEfO+GHUtnJRCad5HINI4D12Tf+TgevWiLjL0tQxKbl
         kezQ9uCOst7wCXbY50fW1qTrvwabRqXiu1Ji4KxBPGMNmyr/VGuQGspgQD0fJrP6z0ET
         x+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVPU/l8/7YmOX41mHFqV/Y35o4HdxK0KLFXzcryG6NMYR0NfidymPveFXJnBqxP2P8qFNDLTFEuLUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylztxeT5VXtYE5fMhlJX91mhnE/WJqKQmicth3Gaa5g5uAn4UQ
	e1hCyHZ6zcI8W8zChaz5QdNMVP7lF9pCm05w2H7Z8rCNn63d0MIb+iDr
X-Gm-Gg: ASbGncs4eMLB/ygajxJL0IU3XwbKWwmbc1w0ibGOQU5uA+p/KDbag3m3DMDmu7lJHU8
	orPIlaAN29YNRbeY9VzTpshvW8t5tHmQkyaREV1e5NqOKTYyHcbQGe9KhBtICxsOL2LwFMnniB4
	vXyaRw03IqEaJmeV13oy8+y+q86y436OWBvm/P91BPOkJaIo2epl0pPp7Ot6NZ2pNf7OJrfob1w
	vpR3o8CTfcYgGuLHO094SWPR4eWdenYXYRCf1GXWC5s44ULKOpu3HanJFswxQQLz7/tjWlfDnzE
	GGLa0++liIRmpcj2di0w1cCJFQsbjASTCbSBSzboMmF7bRg2j3XNtp+qpPc/KytVRQDIeIAeAGT
	XW9BQYUStzjp8yLBd4nxoLop1RY/9bGz7j3nf8JBDHQHowWUnQx0cWsq96aLDf9gZTM/qd8VO9y
	PBW4GUj9Vbtp+X08hxB+gP7Kqp25VK+tXyueQsmF7ooxSUcGbPWKL/RibQ
X-Google-Smtp-Source: AGHT+IH7X48eCGWixEiNwPlmpERSifoBu/b0ZTmcGSRhT4una/cpOnMf/79+MWXGYzANOF6NkR8O1A==
X-Received: by 2002:a05:6a20:72ab:b0:334:a784:3046 with SMTP id adf61e73a8af0-35ba17aa0e5mr13313300637.38.1763347195661;
        Sun, 16 Nov 2025 18:39:55 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92782ad04sm11347998b3a.61.2025.11.16.18.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 18:39:55 -0800 (PST)
Message-ID: <ca5ef73b-c394-4c63-b47d-40f2ff61ef42@gmail.com>
Date: Mon, 17 Nov 2025 11:39:52 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: f2fs: wrap ASCII tables in literal blocks to fix
 LaTeX build
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: corbet@lwn.net, linux-f2fs-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bagasdotme@gmail.com, jaegeuk@kernel.org, chao@kernel.org
References: <20251116102644.25400-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251116102644.25400-1-nogunix@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 16 Nov 2025 19:26:44 +0900, Masaharu Noguchi wrote:
> Sphinx LaTeX builder fails on nested tables in f2fs.rst, producing:
> 
>   “Markup is unsupported in LaTeX: longtable does not support nesting a table.”
> 
> Wrap the affected ASCII tables in literal code blocks so Sphinx renders them
> verbatim. This avoids nested longtables and fixes the LaTeX build on Sphinx 8.2.x.
> 
> Changes in v4:
>  - Rebased on 62242ac51061
>  - Cleaned up Changelog placement (move version history above '---')

This is not what I asked by saying:

    These background and change history should go out of the Changelog area.

Changelog ends at '---'. See:

    https://www.kernel.org/doc/html/latest/process/submitting-patches.html#commentary

>  - Verified `make htmldocs` and `make pdfdocs` build fine
> 
> Changes in v3:
>  - Replace TABs inside ASCII tables with spaces
> 
> Changes in v2:
>  - Wrap nested ASCII tables in literal blocks and fix missing blank lines
> 
> Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> 
> Link: https://www.spinics.net/lists/kernel/msg5921848.html
> Link: https://www.spinics.net/lists/kernel/msg5918264.html
> Link: https://www.spinics.net/lists/kernel/msg5875662.html
> ---
>  Documentation/filesystems/f2fs.rst | 131 +++++++++++++++--------------
>  1 file changed, 69 insertions(+), 62 deletions(-)

./scripts/checkpatch.pl emits the following:

------------------------------------------------------------------------
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
  “Markup is unsupported in LaTeX: longtable does not support nesting a table.”

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 62242ac51061 ("Documentation: f2fs: Reword title")'
#32: 
 - Rebased on 62242ac51061

WARNING: Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html
#46: 
Link: https://www.spinics.net/lists/kernel/msg5921848.html

WARNING: Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html
#47: 
Link: https://www.spinics.net/lists/kernel/msg5918264.html

WARNING: Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html
#48: 
Link: https://www.spinics.net/lists/kernel/msg5875662.html
------------------------------------------------------------------------

Also, please apply your patch on your own before submitting it and
see the Changelog looks good to you.

Thanks, Akira

