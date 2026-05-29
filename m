Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A37D3E008D
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056406; cv=none; b=Od6fOj9I+9tih/9b4eGZHftDuRPSDX4DANuTNG+gHcnqof3AJqz+hQRNrNhdWLRlJXtyAmMMo51ZKsMdSOr4Hm0e+HwE+y2IELiCx2N+/AA4XXamBvqxl/+vyTDHSFAc423lC7k0SHstnaDk94O8dFm/hP/eksvfhpGCK5n6P0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056406; c=relaxed/simple;
	bh=hMTekUZk7VJcI+1Zj/828Egv6I3G6W5x75YXUNbi4R4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=KGLHyedqMHiVbnSVoHLdyIxqd1GEC4GBeKSHZSNgRBZDxX09NMbDvFUJhWSYMdFcJ1ZNTLfCnHPNsvpmCChbDVy0VyWEsFnYFTPh8Gbiu1xGF7If+GcGyrSigmWyR/Hn35Sz0DKU4FLYhAIVI1a3Za9cm/2HxQUtnmffXNVlAAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPiFm8i+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPiFm8i+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-841513664bbso4453894b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056403; x=1780661203; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMTekUZk7VJcI+1Zj/828Egv6I3G6W5x75YXUNbi4R4=;
        b=kPiFm8i+jLZsBLFA5HfJufsgEyFUi53a0JmB0/hn3m0nCdRSICRmCXMfVqzRkpPL0B
         BidNhE4uVLU4KopEXFOGkJb4XV34DIvCNlLWQd37FD6at2I6gjEBT32jU5iKPABFxSQy
         5vP9HhVDXXkRpbZ/9odGugqiW+jr8SBmK9lwpiFZkIGnvUrfAsY5Zhh9eE2kUi7QxeQm
         11kruOcvV7m0h7mLgfVH+pJv3MIcz9nK1HMWop5/whBiMopk/xMkGDaRRG82PmCOMLyD
         gsoLuZ7vdAAuoQDNc/5vxEWAs6Yp7A0KqxLJWhmNCcPbt7RRDAifmF5Pay0cOxV+Go4T
         CgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056403; x=1780661203;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMTekUZk7VJcI+1Zj/828Egv6I3G6W5x75YXUNbi4R4=;
        b=QR/iSfdCZjFyJw4pYtLfu8p6k2ao5b+1e0eAsFibECfwmDofobjDuVWSH0Ydv7hBgm
         UQtncstT7AuiHoxaXtHrJQz9C6Wzv8SjnzbrgQ9PtQbOxvP7dsvXQxoypbAuuZmUpQrt
         jeqrNCKCC/nVgEUWZWx123+C6w681Xlsdx/UKSHwNCiOa0YuAH7ylNzyQBvE8fx36WiG
         +D/cQIAmmM9TosgCV1Ogejl2UwnFgqpnfkQnZzF9cRhVXm01vWHJwKKCRUE8E+ZPFtK7
         QMLS/rAlECNsfq/ETNbZruD5+VI3mt1cTnkUili4KoZzW1Pexckriu5D9UpJJjyr/dE/
         Otkw==
X-Forwarded-Encrypted: i=1; AFNElJ/XDAIJ5jkAi2IA8G2dzhiKy3Ah5xiNUHllzO3m3EAzWSmH2j5v6fmtjUr79pY1wcgQhqhPWQ60Nn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsZa9vJR8zef5GDZUjztfs6bj/WRhjdw1Z8VR0aoLWIZA9S5mq
	tfs6YOxxEhSlpYEX2eC7J+eJoP7ArzFSXoQ0HHw/1k2c8D3zhIvfs94N
X-Gm-Gg: Acq92OHIwiaMlZ1ubuD1/1XBVUOm6dHuNYJ8t7CQI0CO6+h7qsSsiE+oKxqODG0rDqI
	tTuJ7qf4MhXPChbD6W//wkVU7iOdftOcnlGeivM/ot1pycb0REiUJzoXN/2UXADugLX/TmvGoZ+
	RXUyv+eUZB58KB+wTe30z04AU9hY+/b8SAG7URxIdjqO7cdcYieFmTaoWs02+yzRQtmxAWEQ798
	faGhHovXborVSBRSrJ6Sto7LeLsj+pH61/uf88vm0+Abjz7l5KW99uQPmoYCIgswwpxfzlsznVe
	WdZVT8TCj6MIKmuPQPlbOKHdJYGYyu5PNWllYCLhZs/Rc7ST3dHyGyzGe/RltIjkcsAZ24o6Sni
	vOA84EXRMQ/PR7N6SoZPNikmPaXV6qr/TIfvdAxp/bAIlA+BDBrJYFmenPx/6ggMoxnp863Ri/T
	CkiNUatVBSn10kDoYmTXBAmuuHfxaeHQ6V
X-Received: by 2002:a05:6a00:e07:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-842119f9081mr2172322b3a.21.1780056402907;
        Fri, 29 May 2026 05:06:42 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214afffc1sm1838798b3a.7.2026.05.29.05.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:06:41 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH v3 1/5] KVM: PPC: Book3S HV: Validate arch_compat against host compatibility mode
In-Reply-To: <20260529141530.fc225a67-e9-amachhiw@linux.ibm.com>
Date: Fri, 29 May 2026 17:23:39 +0530
Message-ID: <cxyewhx8.ritesh.list@gmail.com>
References: <20260522152744.55251-1-amachhiw@linux.ibm.com> <20260522152744.55251-2-amachhiw@linux.ibm.com> <pl2g6xbz.ritesh.list@gmail.com> <20260529141530.fc225a67-e9-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> So, we would still want to prioritize the whole series
> instead of just this one patch.
>

Patch-1 could go as a bug fix even in 7.1-rc6 (or maybe with 7.2
bug fixes). - Maddy?

So, you may want to add a fixes tag and maybe even cc stable if you are
seeing this issue from older kernels maybe when nestedv2 got introduced?
However the new UAPI discussion might still require more discussion with
the community and I don't think it is ready for 7.2 yet ;)

-ritesh

