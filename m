Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0499732D45C
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684215; cv=pass; b=Z3eM5r5lescXj+jWKIQzxxBjWVC1X+Umx73t3Bao98SL1Vr4tnYBmoFIScNeY8OeNLmG3nVVxsSm07d3V4N/flNQCqllgCq5Qb/IGnymUf0VurhWAEJwZ9PfN6ta//BEO7qT6G4Zc+5FNerGQhkHDcQ16rvT1kWbQRSrdQ3a1BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684215; c=relaxed/simple;
	bh=KNzIzyFdGwoJAVx7hy0kRK+gY5zPmTyPzd0Wd0WQTas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJHV0UvQfQy1bC6y+RVF0QTzBO+7H1OM2JQmiJIIcdHGG/MlInkIGaBJE6iorVaNohUyfiTbFB14wL1Y+t2TmXA8Z+9BF7KRf4AYR0kK6cvytf/rFy92oe5oXxflEZTGunQPdV0n2GdHq4neM9BgCnuBZZaWRXOWtp44kAWgzUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O07WQe4D; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O07WQe4D"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271195d2a7so345376c88.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773684213; cv=none;
        d=google.com; s=arc-20240605;
        b=EUzRQoplaj+OW72yk3DSYfdvgHAFTAMbFASP4SK7aA9s237l49J/YFMbRGlYhy5lCb
         fxk+LapdZIs3AkJKwXMg3rAg+BHW0ZXylIWhtjr+ZdnZaF0ZqfAjJqUQbabXywukiTQc
         xkeHcMdDAMmohCsMyI5urLGLoWy2SHcQz1fTqSRe4ghZAeeqyIenATXS3wWUN6b4PPlN
         Rx1HQ4wTSRPgI/q6LPMYhuW6H7xHD13Kym5tYVzQnEYhS15sSiVSf6Ml1hjMCVBM9PZG
         gUaXapKAkYxe+LvQJelj2azzFnpI1AFE8N2LSjq5y+in1VrunHGHCV6S1tlAdWMIGERp
         vFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KNzIzyFdGwoJAVx7hy0kRK+gY5zPmTyPzd0Wd0WQTas=;
        fh=DGkUhSV9sQ1vybpvQl00iXMMVw7kSVuXEgDngeQNF8Q=;
        b=gGQwxI6hXYqQ5wpzF0VdCokfqt3p8+E9Vgt3lltPUPXvEftNleIcxPMomLsJY20vC7
         r7G5v7dSNO4hH6tYZd45fGwvUFt0JKQQ8PitPxpbSJdksXM53eONOiCnjymU44Y+Y4v+
         5BTVtChVxzrP/wcrMk3iqkgblnyZDqw2PQ2Qvf7qB+h8zW9pIY9BFyqvbD7GuYiWpWmZ
         4IAVVUQwQjicW642UbG2dbAcMyv5a6qVn4LYJRCgD/iOl7I1HX49SttvJFsS89v6Qnnj
         orkGiAWv0PhmBkrIAYYo5NQgpkOtm0ZqsCK8xa+Me90rPHFmnOwdnM+0xluq1wzTCOIF
         cdaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773684213; x=1774289013; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KNzIzyFdGwoJAVx7hy0kRK+gY5zPmTyPzd0Wd0WQTas=;
        b=O07WQe4DY8rR2TalssFliMhJMUanx8+Nj7/aoptmrFfrw6TU5RopcWFn1u2FSG5wj6
         WJdIdUVc/Jz6eCnjmFHsBrDLej9HM6xxU5LSAYT7wY1Nr5J1bsnTeGfQSWq0kfBKqxrp
         XvwlEB7du/N87ct4LCBjpa9pnRhybUocVzNtb6uI5T8kJQanDtMKVR8UhHxsl/SADP5T
         mzxmC+H2Cv7X9Hwrvl0HMDq4KajhQK3qoZVZ+9UoKOeh3YY8ehoAS3oRIrSqQ7/gFLMW
         2kRGTnGFAmkfbrRP7PH1q65ynTPsQ0glkjdQYpyB7zlLTEroJput4cJbSf77Ec7xTZ/n
         vr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773684213; x=1774289013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNzIzyFdGwoJAVx7hy0kRK+gY5zPmTyPzd0Wd0WQTas=;
        b=sLzK6Ugy45nvg7O6kCuYOA9AX5bIR5CSLAANNKzWZvJednQxvGvBG02WoerHcm3q/k
         47ve6FYZ9V/1KBJxiOKWtLF5fspUQJkT9ygQ5cYbHFEIOOTe9MRQ+Fn7HEAceZSr905a
         FTitEH+IZueFKcQOjExOzxrUK5RAbz6MZUqJ5gxwwUhM4xNuZh6CQD9r9RtHS62jTABq
         Jx9x5SsfoVi0hTZCUy5GNAg2UPmE+B9iX+aQTR67JisFtfBPUF4qRHHRIVjx/T7CdYko
         eEa13ken3nAsUbRhGi4zDBw/89MvtFMhdQw+a8vqzEUDkIM4AilUNH9OfO+X/ofBDCxq
         cgdg==
X-Forwarded-Encrypted: i=1; AJvYcCUHHYtLXCHSv7mD/o3dOs2oc3DpZmmpj3Ottm7wNnwbTj/iQaiycNDCpRKOHv/W1Xhe6td3sCeUFq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9yMcw4WZ54C7crR2w2DVL3UDvoI859BSCnbtTecnn9VlmY6DL
	j9+qjQAAvCKGxPBo/S7rqO7FiAjXiEqdYjDmBox0S98BL7B/TUOOVpNGdoH7Um5VNPkttvGjVvm
	m2r+9XFBQXgxOlAYu3cbI1SoFSdx401o=
X-Gm-Gg: ATEYQzwmrnboUkOGgqGTHBmcJKGZfrUAaMCugLLWdCho9cV5OKArlck2UV4VXqmP0rA
	VHHm2asEp/kIUZ4W+TdADdBZItButY8P3SL97deXNdPxymBgFcJNtwvHktC/Nnb4syfQZ5OAWDm
	l3YO2tD69TpK+hfVWAHmVhdNAroM8C8Q7Y7dP3GeTQIFeY6a1JMMuWQWh0K0iEMmRNElMahNMsH
	iJVKVNct/p8NEipIzsUKSPUf2bMA6jIpWEKw9vTPi9Cg5WDhcZjCEbftdH/H+agz86LsPtJGUPV
	j4+PNTPjjCaioSIFbQuCsHkaiD1yfue8nfJMU/0P
X-Received: by 2002:a05:7022:e1d:b0:128:d786:8aca with SMTP id
 a92af1059eb24-128f3c6b032mr6448350c88.0.1773684213034; Mon, 16 Mar 2026
 11:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314201348.1786972-1-atwellwea@gmail.com> <b042de90-79e3-4976-9bbe-b6df3266caea@redhat.com>
 <CAN=sVvyNpkyok_bt8eQSmqc4f7g7QoZBUmRmNRLoFz1HasEzMA@mail.gmail.com> <e93ce797-4153-4e6e-89b6-3839a0b8bca2@redhat.com>
In-Reply-To: <e93ce797-4153-4e6e-89b6-3839a0b8bca2@redhat.com>
From: Wesley Atwell <atwellwea@gmail.com>
Date: Mon, 16 Mar 2026 12:03:21 -0600
X-Gm-Features: AaiRm50ReSwavo1j1ssacOUbWxtcgznlHmGlPHkMg2HYVcwTt0DGLUUEq90y36c
Message-ID: <CAN=sVvx8jNC-OAMkv19Wv13jTpV5_wVEabwUCjPLMwTvS4czow@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/14] tcp: preserve receive-window accounting
 across ratio drift
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	edumazet@google.com, ncardwell@google.com, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	mptcp@lists.linux.dev, dsahern@kernel.org, horms@kernel.org, 
	kuniyu@google.com, andrew+netdev@lunn.ch, willemdebruijn.kernel@gmail.com, 
	jasowang@redhat.com, skhan@linuxfoundation.org, corbet@lwn.net, 
	matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	0x7f454c46@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

The link I meant is the netdev regression discussion that led to:

026dfef287c0 ("tcp: give up on stronger sk_rcvbuf checks (for now)")

The report/discussion thread is here:

https://lore.kernel.org/20260225122355.585fd57b@kernel.org

The revert posting itself is here:

https://patch.msgid.link/20260227003359.2391017-1-kuba@kernel.org

I should not have implied that there was a separate prior
regression report beyond that thread.

Thanks for the note on formatting. I will keep follow-ups in plaintext
and avoid top-posting.

Thanks,
Wesley
