Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E8D22E3F0
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 02:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512847; cv=none; b=KV3c4Oy6yNKzfAjMehNp9kD1puuUtiOolo5e/Kis6nl5Gt/7TDWAAJjpoDiaq3gDfGgv8o4YVY/Nf5BOnOu6pfQ2LSq6dg81VweISg1MuaoVM5+1HJnf+Ham+n41Fhp+QLSc6KV4qD//AtPLNgIqfvPDEHPlz070EslZ5d5IRmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512847; c=relaxed/simple;
	bh=JwGkgzwokMzpIScEyi1ei75DHmBzq41nQT/f/BciPTA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IOGjLwXQVcJunRPwjFEEFhtn8f9/yNTlbLqElJdL1J/weWSg8VeIzjp7BrozVUQNB8SE0IplZzgsvu0396IODUxrkyV22h2AEb1nZ/nIyJ/y6K9qUUGJUy+jfPmnJUb3INl+1BQATw8RmMlXtDIQynP5u3HPW2WEOU/FrPAZztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0VevoXq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0VevoXq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so2721408a12.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 19:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791512846; x=1792117646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JwGkgzwokMzpIScEyi1ei75DHmBzq41nQT/f/BciPTA=;
        b=D0VevoXqUSlXfGT/xvScGUIUboLpPuk5Dww34Q2KwdgxEm8QnzftOItk65ew1YhqNf
         psDpcfcV42I8iSwSN4e68D+Xq9EddKLN8R9cO1SAfLi2olUD1zkuAfyaLgCQ5R1yDB4S
         6IiOMONrImuLKiKcXtDHxH9q5MDo7hZL1kLUvDPeLY7OphDl3aowNsjBv3sWcUnKzJ+k
         3dlEHdtROlbhcEJ6UYMohySoAtY/TTp0wKCBiNdsoWJ8wiYpTqI84zCoAo324rfBsXmc
         Rkb4aJcIkfUfVrsNQ3mxKFhpUEHUgp3nsoeFplMtlNLoTUArjDuriB7nMn/GU8mVFAig
         hD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791512846; x=1792117646;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwGkgzwokMzpIScEyi1ei75DHmBzq41nQT/f/BciPTA=;
        b=OCBmOc8/qz5qVgG/jzDTWBli4Y5/14cYQYKGD3K4Kj7jdFbedwLOS0CiOl9xm+l+5E
         NFevdIzkfWrtlW0uaQOL64Z0sJklRd4Fc7C2yUquW6Lg2wAxWAs5p+r8i8HIE86yKxRx
         zWCkUrPK+15lmIyYDPotqTxvsJbyHqpY8NAUdEHdNbuaaCGyW8dpjB2p/SynEQURGLFn
         wdULZ5WC7bsGzisgrtmQQ+8J8oFoN8xY8Jc/TSNGnSSq3JicNd4zBDU2xp6BbYZFeipQ
         qYvaJN1UmUUCV8WaDE7A8k1dUzAOq9q02EbvxTqG01iIV2L6PYEHJzEsUr0sUVmuyO7E
         C2iw==
X-Forwarded-Encrypted: i=1; AKwUvBwX32qKgTd86uViX8pH9yZ7kWY5WoJEUqYJTLAuer61t6aa+W6pQqR1m8wAu4yTLwf+qMF8H+RAh3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXlBESGFVtXyVHj1cxcIlfKUrnRApNdfRAVxO9Wszh6vJnfEv5
	/Ju/wXWXqnzp7Kc/ZSkRuA0uCcMVSwLay3xceNfzM38Erw2hmqK8173x
X-Gm-Gg: AYBFou2Yb08fS5ld27AbhdAYxR21CWmztlVCB+CroocYc/mugGiOnIfbLhSXKjIspwn
	ZeT05vdTELRtHAeOx+kaMEuBShQ0ap6wcvAkZT2TJY5AaelEoQKtMYrF6noPJCLG0KtwFn3rby8
	L1VFcqy2Iqy1uw4TAbXUxNp/10gVtw4MHKVcqxUqp2W3azosNSHgcc/S/vQO5gtoUvXd/bX7zmh
	GQEytdYrPO6ke2e7WlPgQ1fMu+7lfy2EiHF3CqDkdGi36Cg9l0fv6jKwiPEQg8R+G/e3Xxso9dF
	oOGyiUFZ2UncmwrKxRVst9sVwlbde8SL0+mgKZcZDAnU88DzUBYjJDJMgU7f9AN0XnDTTzhzSjS
	+YW9vB0CAAE5zZzRgh/8901Vb38150WDumV7FcMfV0BwopSytK4FvgOBG+bkVx0vTeOl58pKeoZ
	GpmoTmrzze2cmdfDVy59vLCTdyDg2DA724q727tzADvLACcWxI4Iy8HWhkS2NEPifTP8xXJOshX
	9WafRQPsE1td9Ut4hGaNnhDb6TXDgEUJTYmHy/BbZguunLMGC0BuHb1JagxLeBOkPwhcGXDbAAx
	oVaF+SlqiwF6CE4q
X-Received: by 2002:a17:90b:570f:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ab3ac5e4damr522714a91.48.1791512845632;
        Thu, 08 Oct 2026 19:27:25 -0700 (PDT)
Received: from [0.0.0.0] ([2406:da1e:f76:8d20:77ec:b3e7:5372:2d36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9633fsm1491593a91.6.2026.10.08.19.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 19:27:25 -0700 (PDT)
Message-ID: <2f94adb3-3390-427a-b223-eccea470ef16@gmail.com>
Date: Fri, 9 Oct 2026 10:27:18 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gaoyang Wei <yhyxwgy@gmail.com>
Subject: Re: [RFC net-next 00/12] net: add the PON subsystem
To: John Crispin <john@phrozen.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Christian Marangi
 <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Gaoyang Wei <yhyxwgy@gmail.com>, Ziyou Xu <xuziyougm@gmail.com>
References: <20261008143249.3439762-1-john@phrozen.org>
In-Reply-To: <20261008143249.3439762-1-john@phrozen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi John,

Your cover letter explicitly presents this series as following the
framework discussion I started. Yet neither Ziyou nor I was copied on
the cover letter or any of the twelve patches.

Given our participation in the original discussion and the cross-vendor
follow-up, both of us should have been copied. We find this omission
inappropriate.

I've added both of us to Cc. Please keep us copied on future revisions
and related framework discussions.

Gaoyang
