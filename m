Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542253;
	b=SWTIGC+G2Ks7Yb1Qlxc6L72IVkV4ZQkLIEjV6gHJZA2gykqScrw4OJYi+2EFhKyKd8cq
	 fgTaweu0WpYZ2e9yAS6J6OCtq+TnN/LNTesBMJdtwaKudyeUpA1YGMPlWdz18bOGrh8u3
	 SI81T6cWq3HoFXkVUhuFrwThcrZJuvPOiV6btC114JH73GrjmioRZ07q4HtKMqYua8sHk
	 ikiwUEngOIdLjZ2QEHHvOj0RyF/yCIX17eOl6a+s8BivLBiXH0iha80Kd3AZeFZwSUOec
	 wDjf1kJJV8EOrzoBOSJBE8+4uJdfJ2+lhEV1g3meNnJb5MaCIJLP8P16sHQWXvGWjnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
	b=ySyQC8au3zz7L24EAFbZ6SI6ExpsgXruvjqLzmGuLXgjlREvTzpSU4mDMc8lRiVgqvvm
	 u2HeYSW5SneF67WXZwigx8MW37Jm8TavJDF926esacMSrcEq8F4OpLWNyhf+UWuOTdNyA
	 CA+1KYhakxEWiZnq0NfnsGyWhZ7RJLK7ChvdQaeE5cdmpDP8DonLn+CnX/GE7u39dn/xk
	 I+Cbt9U+lsdw0Ya00ZDk6eKCcPCsShPw9NbbHrLMPrexZ906gIWzfjWXvoYYS3sGnWigY
	 cpAIFQ6JFDcd29fZXstsgT1tbix7mJVgF07ptADy94Y89e2SijnHFsNZFgWdc/h10Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UiYvQjLv;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A03606A321
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UiYvQjLv
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so5863443a91.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795542252; x=1796147052; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
        b=UiYvQjLvg/dD1tCSWefP5QrPsFFRp5iXlT+nm9Mnl8uNBuRz5H7ahG6sNLFLOLMjgs
         ptpXWJdaq11jXMjwjGk73Pz1VBPIsypaPmqPZGuxttol6VaIKGiCCOKHYpxZ3chuCCDL
         xk/tgdYCH/6c0E5sTqI+YSzXAeUdTJikqEa5MiorGNaG7b1dH5U1Par6WamULKijHjn0
         zoDQC67gSRjBA9yBw6fb1vj0t2pLmkFnM+xRzrCsjVucuclm8xgK3TeKnhe2JN8xhi7X
         dShYp1xCRmS4dSTjLqobvWeiDh9VRsKVoHblGcTn/BC7AplTPLU9IObhuI14/chIdbRD
         TUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542252; x=1796147052;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
        b=1/VNozCzbk/0PeYVBlBlFrI0H9ckBkXHWu653MiC0oUmtd2N974kJHzN6N/iHFfb/o
         +OMuFeZok2eEiwjAqkovlY7nDB7CrgEQEJ/MEyb7OdeD+/aaMvo9Y1It8/f25vHNh9Am
         zB813i3NuCMkTswQXMGHn0XXgVvwJjRXBwI8XLdETn4JYmu+hcYanUzYZNdNF9WB8LO4
         HojnuqriTL4VPg8ijLKAz4lqJ8FcQ01CqCkBGCW7T9L/im1ErE14jxMxtMVhJ5tNjmx/
         R0mxcR5KM6QfQIVzvchMYcxX+Au88l9e6r1x9kk3Z3UWXn02rwNnfhd4MIhYstmuAOd6
         Oyhg==
X-Forwarded-Encrypted: i=1; AL+hErFmRJMIbRWVcbg//+ESsWYtpFx/waJBr51E8Mb4hrZb/qQez8pOKaTenhxe+UJZ3oAzWMsThJWE3ik=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7wDlzoGR7EWaMqpPxFrM/oHaCWbngkB1Nxpw4tURYJkgzsoZi
	JwTe1+0tPb3WfRlwgWjbbNeUqlcfOE21AZofsw+9Xit/XAA4JbvFKW1wsk+20xZxhzZMsd77FuZ
	DtuqVNk7R986Zkq9DdppO+UnpjWfaZPizCQ==
X-Received: from pjbci6.prod.google.com ([2002:a17:90a:fc86:b0:3ae:c401:753])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c11:b0:3b4:1336:4f6b with SMTP id 98e67ed59e1d1-3b41c905a49mr14294021a91.33.1795542252059;
 Tue, 24 Nov 2026 09:44:12 -0800 (PST)
Date: Tue, 24 Nov 2026 17:44:10 +0000
In-Reply-To: <20261110002437.2376944-1-rathodpriyank@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com> <20261110002437.2376944-1-rathodpriyank@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124174411.4183038-1-rathodpriyank@google.com>
Subject: Re: [PATCH v7 0/2] PCI: Add Lane Margining at the Receiver debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn, Ilpo, Lukas,

Gentle ping on this series.

Note that since pci_force_enable_link_state() and the bitmask return
value of pcie_aspm_enabled() were deferred before v7.4-rc1, v7 as posted
no longer compiles on current pci/next (and has a minor Kconfig context
conflict after PCIE_EDR).

I have rebased the series locally onto pci/next, resolved the Kconfig
conflict, and replaced those deferred ASPM calls with a small
PCI-internal, reference-counted pcie_aspm_inhibit() helper in
drivers/pci/pcie/aspm.c (leaving include/linux/pci.h, pci.c, and
pci-driver.c untouched, and preserving existing ASPM/L1SS/Clock PM
state across sessions).

Would you like me to post the rebased v8 series now, or hold until any
broader ASPM API rework settles?

Thanks,
Priyank
