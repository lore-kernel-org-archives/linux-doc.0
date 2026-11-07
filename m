Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794039067;
	b=Fxtrt78uj/rkC/L9wFmsnw8hxL6cQHecCXAmTQG/7ycYPqgQGtZGYpjk38JgWSkDo5kK
	 l+BqNp2U66xMyt+ddicD9CoyVva8w9x957UKH/FBhBUkUIZ9APd4LCng5dZSzqTXU7YAn
	 Rj3ajY9oDF2TX7HZ708+drmv17AQtRzB/i6/81ufJqrArBR+TOGuwerbnHVdkgyqQZSrV
	 s4xxcpZ8Oy3KE2PZ2D8+VOUkRUdSI79o68bYIr2TTFzZAMkpSIwVH6UrJZwR3fP3eO2xq
	 qLH6XnYf/WrUAAVhIJFPKMcJBaNbCvvcmjqUQ6s9FdcL6TNtbsVhKomzp4tgjXvnPjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
	b=u+hYjYsEzrNF/9aPpL4WkoCYov7HGZx9KaaqRJX5DgeMYDIlUZXonRmzJNlCu+P7kSyX
	 mf06GSezozXLBZJXT76NZ4LCo4VtiexF2Z0nUtxXqeKRLVn/ZvqD2FoBiWVLOpfPGDy0A
	 DRLPXeP5Unorlh0A1GtK9kgueGw1JNpE8PPwddVg0pHvZae93hrpIO+Nbwi7ied0F4EDK
	 Ba534d0hPSgZwEw9NCeYeJj+UykChLV80pW0oS3sEMt62cGhR4731QGfV8v9/H6LoblwO
	 qHqfmlQCulrnZM9Vltjvk2BY2y9I3gQhtIKUcX8T05oyJBkcSRgEFBg3ABO9u4KDWXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAngRiUm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3083606A32C
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 08:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3083606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAngRiUm
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d21051042so187956066b.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 00:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794039065; cv=none;
        d=google.com; s=arc-20260327;
        b=cxzW6wVk7wq3ll/BROP49/LaKpK/urUO2nzPYWFl7n8cqYwJZBDjAlOZ66oGYTmRtN
         BJ4uIVV1JwUiQEuWk0BPMVdr6940b60XIse4Zp6OjRNifIhdFB6f2AwRfVbDBWGUJzml
         yiC/9jjsQMDncAoPNL7cuFiZ7WfRE4Tm/M+GSR9vONBMZ2lrpoMliIS67FWMjbyfDCG4
         usv8nNSi5lCWqLPFnywHIhAQ8v2SRNr/dtQCvJ9Uj700T5i+SXVuSnJIEDLdSJgow7Gv
         CvTx8ny+QkhXDW58xpjnBAO3nGrX359wAkTnOPFjTMK7pgzvTCRUF/ZsR1zlkYzMGI3i
         cymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        fh=1iRklSTayWvJHo9kvE2kF4R1Y3LVOSkHbW5GrDW56ck=;
        b=jfsy4hp5mQnkwTfe/9d2cFOZ4KOnJBD2ukRpPcnNpkYPpldrrdvnnPbiZrHa5/nP6D
         1rza60/rBJnE6DP2yV82RP2sRImEWXUubUd0wxtzBFE/ptsdrNgfFthDfww+OvvBu8uV
         WrHlQwCl1xwn0MA8UWe9jWX974p2TUvfJbNbWoH3/gW1QAH6jDvDpboSTn3UlEAuE33S
         j7FFn/htz/5aSrbI+wFkJsUnDP436dz8Qw2hGdk59c6Dvb+vrQPPjl0Yz2C88P8M6vIq
         q+zmwnb/2eak2ipGYXq2NvbzyFl456yyKoMR4R/9AHRQ01Xg6p9pcPTuSx9hPodB1LKx
         UQOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039065; x=1794643865; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        b=UAngRiUm8pvle7Zr0N0Z3j/tjMuBQv7NRKrwX+M3eKVi62jW5XULdpmOnrOqCDRXFY
         oFpoFh15sCmEXCV5Wia4j+6VR+39+PY+YGPzpVJPSkhSxLs5LYJOEeGhs9yn5UXzcJF5
         KXTFAo3X1cM+Yn7TfMyxZ9OMfshOve/iLaZvoIN1D/CNAIhXbFez++hBzPhAsRYk5gLJ
         40VIwf/8wisKrQijYzuIhmjGodeFBP5g2dBCfNbv1WmcqOAtzxBKlQwEjKLP9721bR/D
         tC0AWJ+Fq9hG4gYji6X+AY3kbwU3keUZ28cD2W2q9ybn7Igzt6rtzTw8bZNUGApKSy9l
         /duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039065; x=1794643865;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        b=kgHNBUWRv46HbHUJXk6EiALkFXch5iGb5JwG4ZgHIb+szmdpOdF3TD+i2Wb9ekneeR
         ywM0om7FOyqe56a+k4vmGRvtnq05yqxYlAZKTaAUEh8qHz0z1HB5nBazNhCvpLokEw4n
         OK+bRr3sa/XKoyAh0u0iPmhedIERFOZ5o3M771DLYdJ7gR0OOX679f+kpx+/WrlYte0l
         Ugv3i7VO245MmEcnPeEhHgdCjs9rm4Csa/S5qbozY1HJsfB7muPo8ome9Kz0cEZblbZC
         E4AYnTeevTT9k42fd7s+MkCGgJjqSYF/eXyjt0Us5H8MXlBoWgfScRV5Au51p0t6cypq
         Hg5Q==
X-Forwarded-Encrypted: i=1; AKwUvBymOtVcTO7SImibz1qVX3MQmfG1aO0JSMaU2uj05p1LsiIWdz8jhXeZEq/W6v5YQgR94/H4dbb8NWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5NYecaC1sd8OV42p1IHk4FZy5GBJaLDAhD5w2TsFSzXEEP+OO
	1zYFL6VnSxAPYeteBsNXpMw3HklvOiim8H+8IUUfALjvSLGPXQMNkqpDJWaIWv8TyhOUuY6efti
	Ad1cx4UEIgyH5RGTyDjsUAE1knhrXAW8=
X-Gm-Gg: AYBFou3JlhqLF5PW/pSoInwVCyEURjqc96ayHqqnSFcyG+fzkZkqVthyMXhbWgnNVcp
	aXVPJ0yHqscxi5aft608clmrw4PIwpJ7upUwP1pCX3O4yeUNOc+DNYgxnShF8tGq5fq8FvQuBew
	2h+aFbIKbLWLvBSAFgRyailSYiVsBnrkAcpN+qaS1jCxe3MGuMOXc3ESqgVXKw5zDb/hghcoqj3
	navVSZ4nY5PjY9QreP8Sezvz5kB77vkvdULLCTTaXvoJKCLPlBRVjm6B4QpNJGu+2r2KxuG1E8M
	oNuooLjypFT+bcQQVqG+m7dRcpAbdrKc2q4ZsUy8FE+KD4fLilvF2iWQmx9uVheLKdMQqcTbpOG
	W8uxKwW2Tq8O4JtjFltUpK1X8yQfbbC67PerYz74=
X-Received: by 2002:a17:906:9f92:b0:c41:30be:4f82 with SMTP id
 a640c23a62f3a-c4d355ac266mr404152166b.39.1794039064583; Sat, 07 Nov 2026
 00:11:04 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-doc-modernize-git-v1-1-8b59c1a578ba@gmail.com> <871p8x9iqw.fsf@trenco.lwn.net>
In-Reply-To: <871p8x9iqw.fsf@trenco.lwn.net>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Sat, 7 Nov 2026 02:10:53 -0600
X-Gm-Features: AclHuK91DUkFbpNIFEt0OfQGSbn-rF_ZJ46dBlm5lWx6Q5YsF6mXZsaQ93GyhPU
Message-ID: <CAHDi9tqKP6R_zE08jLLMcYHP53sZB8r2M+fRgP8c53GT8Dxu+Q@mail.gmail.com>
Subject: Re: [PATCH] doc: process: clarify legacy status of applying-patches
 and point to Git
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>, 
	rdunlap@infradead.org, krzk@kernel.org, wy@wyuan.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

Sorry for the confusion and the noise. The six earlier messages were
accidental resends while I was learning how to manage revisions in b4-
please disregard them.

This single patch is meant to replace those earlier attempts (I also
accidentally duplicated the commit message into the cover letter).
Would you like me to resend it as a clean single-patch v2 without a
cover letter, or is this version fine as-is?

Thanks,
Oscar
