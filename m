Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0432F5A27
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117955; cv=none; b=eCvfeTw1pBtEw1he/T/wPHroLjobwWcgwbISsC9gwU7mvMSmxusTwtptLrqwBDXD2GFkv9KsVmOBgVARdIsoI8TNkEfFOoxB1nZVbM6BlgBr+knJNJnG56xGIcqpRsqtKRwIxrO8avDGYKRDnbilRtI3YBGGeScytrCrGgmo2xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117955; c=relaxed/simple;
	bh=5N+bM5amrNetXwXJxRuKz0Pnn27FUWJd6XEgHZXg6Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZBGRNYVUugti4JrZSpZqQ+NjFzN24WPCIGiEvCcV0QKhqbkOC+wfGUoeWQ4KJtyCK4Aug30UtOJ9FnPBlkHUCW5hACjgfP29tUK2ZvP1RnlvylTMdKdJOi8WGCT5RFhv+q2Acq+GThkGM4jNkowN7psXdXVamFut0PisbNDG7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ri65JzYp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ri65JzYp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-471075c0a18so68026475e9.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 00:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761117951; x=1761722751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pKMoThOVBKwHugFJponVe6vbvCHZyCwokPD8AF+alpc=;
        b=Ri65JzYpaiGjNVRoLE66+Za0BWXPSvMvIz287hil8hacoVa4rALLTcEHkyCBVKfviF
         r5cAbsnZEy7KZCgHdhNYmr3X2OTqjvGtM/Mp6DgzmgwMAc3LvwWZAGK30o+wtRvWFSCu
         paycjfuUaKixEjEjFI8FnKSMY2D/OBDtswVWzfWBMvyGLPKilnUBtkSd3V6GwfrrgstE
         dCjNE1lzm2v8780XvBzvtYCRo+9crc83yQGNfVi9TCeAMYzMTuTc7QZQ2+ITZwPOK9yY
         NwROGqCUdMc/52N1zEEsk0wi7z4TtZZWaCqf3/xirLpTYIyweYDo7Ym4v0DeohNj3AAn
         SfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761117951; x=1761722751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKMoThOVBKwHugFJponVe6vbvCHZyCwokPD8AF+alpc=;
        b=FvUdPDyKJJqnQU14zWv6jSUPRsO6P6BNO9jL2+O2/bL9DUgYUVo7V4Kyyu036Nxt9t
         Vl/xYaxRgU9hAUbPJzSq5JOOf+7ifnfZUCGCtd5hMIpsnZj7OF3pwW5SL2iOluSzqFux
         nQZI3BCoQBQ4QE4pDeFY4r7gBaxWsj/ovqclQlRw61xC7CZhb+dGAH6nNE3TpzDsFfK1
         EIep7P9WISvMUUEvDMITvnEpdkUO5aH2HqZQ6f4doFonGvKmU6aVaD+FlvxOvc1DFXdz
         h5Y7bFQQzRKqb0lKlbzo/p5Cdmy5HQr2RbXXmMtXMEYejduwOyaO6JLJlq4HSTNy/YEk
         bZyw==
X-Forwarded-Encrypted: i=1; AJvYcCWopXMZ3iJSAqxfy/AathlZ8wYmQUHJt/nAHCXwfZJrIOC6IJnjLA855ME8lpWQngDUURQQioP6pf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyX59/TIovN5x7Zj4mmgwrFi27S/PIRt9g//plZzGXxLYgtaki
	cCWefE7iSlICow8rX9jiPrPAJriMw59lKc6iKZEDodWCHtb41wE1ZzLE8iiVRrLynjM=
X-Gm-Gg: ASbGncvBLrx/EcaACi+DsLCDdfU1uFBCfFa0dR8tVfwNfxCkti4itRmRn3D6DElkKTm
	jjqJZFseM8Bx/EUwlW3lHF6DiYbyN/mCiRXfDBathyX6lb9G3hdtNOhfF/waVVOXtFVOeid7QAm
	cRBEv/mDEP3FBmBQZ5nwbi0O9GyAh4Vgwfa33NeGjd6R5eChKRejcr1jhD2aTRd7+VuJElU7Cmk
	2d5xGRqemfgE35pinQsr222IoZfqbBL3JdHhaiaUIh6uYfR606vhrhygtg7M0aAYIPw7/87+wcZ
	/qIi5ehdlPVmp7ASh8sjh1K8OowJhwSEuIr5BJadJaDJgfr5cSuTzDOELxRCBGFM9PB2zHLyJu6
	uIqhgTOC/rYo2ABEsTS8FErRbYLpGi9Dv2D2Rl9S7bEHVXdWat2C1Vx9x7s6R3T6o8ZUl2I7l2e
	FWd90u3A==
X-Google-Smtp-Source: AGHT+IFlPf+i5rM3V2aPth3/QorfaAiBmBO6+U2yQMIYWYZnD3lbKAlJhKzYMQ1lM3lkudsWOGqQEg==
X-Received: by 2002:a05:600c:3b03:b0:471:15df:9fc7 with SMTP id 5b1f17b1804b1-47117906a72mr140545185e9.26.1761117951513;
        Wed, 22 Oct 2025 00:25:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c428a534sm33459415e9.6.2025.10.22.00.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:25:51 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:25:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ally Heev <allyheev@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Hunter <david.hunter.linux@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-pm@vger.kernel.org,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
Message-ID: <aPiG_F5EBQUjZqsl@stanley.mountain>
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>

I made a list of the warnings this generates (on Monday's linux-next).

None of the warnings are real bugs.  Every single one of these has the
assignment as the first statement after the declaration block.  We have
had bugs because of this before but Smatch and (I think) Clang detect
them so they don't last for long.

regards,
dan carpenter

arch/powerpc/platforms/82xx/km82xx.c:30:
crypto/asymmetric_keys/x509_cert_parser.c:63:
crypto/asymmetric_keys/x509_public_key.c:151:
drivers/firmware/arm_scmi/shmem.c:199:
drivers/net/ethernet/intel/ice/ice_flow.c:1576:
drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1015:
drivers/net/ethernet/microsoft/mana/gdma_main.c:1508:
drivers/net/wireless/intel/iwlwifi/fw/uefi.c:821:
drivers/net/wireless/intel/iwlwifi/mld/d3.c:1788:
drivers/opp/core.c:1413:
drivers/opp/core.c:1480:
drivers/opp/core.c:1797:
drivers/opp/core.c:1888:
drivers/opp/core.c:2874:
drivers/opp/core.c:2935:
drivers/opp/core.c:2989:
drivers/opp/core.c:3065:
drivers/opp/core.c:3085:
drivers/opp/core.c:3104:
drivers/opp/core.c:312:
drivers/opp/core.c:330:
drivers/opp/core.c:412:
drivers/opp/core.c:450:
drivers/opp/core.c:608:
drivers/opp/cpu.c:157:
drivers/opp/cpu.c:204:
drivers/opp/cpu.c:59:
drivers/opp/of.c:1272:
drivers/opp/of.c:1331:
drivers/opp/of.c:1428:
drivers/opp/of.c:1469:
drivers/opp/of.c:149:
drivers/opp/of.c:1505:
drivers/opp/of.c:174:
drivers/opp/of.c:276:
drivers/opp/of.c:352:
drivers/opp/of.c:409:
drivers/opp/of.c:48:
drivers/opp/of.c:98:
drivers/scsi/scsi_debug.c:2964:
drivers/tee/qcomtee/call.c:648:
fs/overlayfs/params.c:451:
