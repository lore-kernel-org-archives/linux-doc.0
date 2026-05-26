Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83CD3BCD2E
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821814; cv=none; b=K8OcBxzvjo3oVrDAwR1Dus3a8PGe4hPbkRPtdDP8urog8/vNGtr/VfV9+6X7nx0josOZkWhxZr/vaCjMYPqu976xI8qS0frEYzSW18xypfx9xljtaYAvIHjCnEAyAkUdfk3qJOcuCa9omOeNirNamH5OAAgpVM6ms6FJorXCia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821814; c=relaxed/simple;
	bh=DFEJvy4/kZErZG7uAiAHXJzMGIBUD2dQ9EYHr4sKilg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=G4X+HXwq31dB9xkXTIwg/0hx3IwFHuTRa17o+lep6KhWxT+HmMi9mE8MrOHG/0z4RDidEwQF3B0uQNaN9PJkkvPueS4uhvGhZ7+wW7JT/vAzAEUAYi1nAWWU5Gc0EBSz7XZh8qSdNHJlZ+SSsRdJpYBss76oTAWazF82l8McJFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwYOinqr; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwYOinqr"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7c2fa14795aso86463887b3.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 11:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779821812; x=1780426612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X06M8fe6ArW+TP7qkYaP7LiibL4twhyfnPdPwC6BYEg=;
        b=CwYOinqrKEDVy+gSpe8fOy9mFf2+BEyLfGn6EM+DyLweZTSdS60/+4+UmzKEAPlBj0
         gSk9t4MUfQewzAC6IvidIPH8npVgY2RQ2SuLk4ufbNp5p2THbRbw3n6uJBmdmfhBnWl8
         kYoQfYWZ+MRIw1B1+UyyiWLpZAjBZNnpec98l+UV2evOj3FH+gqovnUUmgxus5t1M/cJ
         yg9pf+8kbuf4XesQyy0jww745hu2kIwqF3b5kxyx+rwrUTd4U+wpP0dCGkT6sjFMLav2
         tZwrG1ovDxgKx6Px84kb2E6j8tS0kFZl+dnygtNIldqf7ld/s75eL+ftP2CQrvZVR7oh
         gvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821812; x=1780426612;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X06M8fe6ArW+TP7qkYaP7LiibL4twhyfnPdPwC6BYEg=;
        b=nFv2aFgySGfJb76dy63mZzWPqtmCDZx50WLhK5MG0SijukjbRxzc5ZjQ8WxpU+PVyI
         AW+94CaiYtpgqym3Tccmy+thaI1zoWKIyZFrIkuFH8Li3DffHgwu0Qt5W1lUnaqclhfR
         8INpa/oERQEhrmDQi5KidlLcgMuDqOw/+Etc+nsZ2s6/RSHs66U0g0FF0bEyRVYNADCt
         E6ITBYnSNKPaouaZLqTVTe37nHj83R9JqL0eHD06VjPcxJf73PXCsbZdt568zqq141FQ
         5vrN+/MkOguqOPPEnGoR1aYodjeZYrsgnlbAVaeiTNJlfZu3JDgYj6B1rz+LKIEUkqOZ
         MCMg==
X-Forwarded-Encrypted: i=1; AFNElJ8/o0coz9kBFEvCsN7qIKxxXSuTkL+5fw/hCfbXzM3iejWSlCsUQEb9pz0/ut+4f1qd3ButgjwcB3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQeNQ4TgPk3s3gf9uihdaUAVxRZkvYw4h09yVP9Ya88zznSuCp
	f3NY/Jk4Vch9FfltCzr0+VxGsa7ZxboByfssTv7lGJIWmURzuiYG+ZEu
X-Gm-Gg: Acq92OEZR4+i1wfaD2IBxYEm8XWNAlhebRqO2+0hlCvlOHz6Qo1xkQ74pLKjUH8050J
	biBbxygFADwH9JMLmnxOhxuc4had5u0Sfb6IffmIAZ7k30yAFDnpJ9GBl3WePdStnX5MZx8tV8B
	niQK5ZCo+8MxTOt2RTBN6FoscV38MjCQbuMYRmxaDOcPngoV2/bIamKH9HdguaTjpgrGv0BRv5W
	TYDx1G0E5FH9g5h41kwsZPlpcyBLEm2ons0aKvKD3Ia4oNeBwwZK9GLMBe2Nkd7iMLwSxlmezp7
	Uhiu96N1U6l68cFiZDNC7weRoqbSpAXu2g227TPYygkZFJ6imhZbCsLnYzM/jHhUkv3mrLQRkYT
	fBEXxY7m6ypbtf1RENyXcrLp5TXO0zMvJGgTcnTkGGh6o1a4blXkXsGM5Dedpen0k23+UcB7gjS
	fx501VndCDHRgAEM3jdbsJ79rmMkq9V8lljognI+0r6wqEnf/cUKmliTTSFoApU697iDP9LHiuj
	dkmvT9nIrSyIZ4qcw==
X-Received: by 2002:a05:690c:4a05:b0:7bd:8952:1338 with SMTP id 00721157ae682-7d339f5eac4mr210805757b3.25.1779821812504;
        Tue, 26 May 2026 11:56:52 -0700 (PDT)
Received: from gmail.com (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d3898167besm64991967b3.1.2026.05.26.11.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:56:52 -0700 (PDT)
Date: Tue, 26 May 2026 14:56:51 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 corbet@lwn.net, 
 vladimir.oltean@nxp.com, 
 willemb@google.com, 
 sdf.kernel@gmail.com, 
 ecree.xilinx@gmail.com, 
 jesse.brandeburg@intel.com, 
 linux-doc@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.2e79bc9a2ae8a@gmail.com>
In-Reply-To: <20260526160151.2793354-10-kuba@kernel.org>
References: <20260526160151.2793354-1-kuba@kernel.org>
 <20260526160151.2793354-10-kuba@kernel.org>
Subject: Re: [PATCH net-next 09/10] docs: net: render the checksum comment in
 checksum-offloads.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> checksum-offloads.rst seems like a better place to render
> the checksum comment than skbuff.rst.
> 
> Remove the stale references to sections in that comment
> (it no longer has A, B, C, D, E sections).
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
