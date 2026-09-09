Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09938DC75
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975449; cv=none; b=dxCMAGhMKeUmtX4996iH7c+Og5XDiPD7mW2/NWbx9d/YMJepUZI/h1k36VYNu8BNHCR9dY5pfwOs4t7yk2XIulrXOD5JN8QSusy/iuGcy90mTzIa0F4HtS+w3QCrMCnIhL4PuKYorasiCK62MC1oppgQmQj0gKU/HwN5sRfTS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975449; c=relaxed/simple;
	bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
	h=MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=VBjm7Y9hT8DO+WkExgojFSvm0n7k4awlEscIYiUrCq7R2jrkZbpYsdn7aosWN1ywWrLupHUNFnPXg2G/MvzlmRRSVfLCagmsFo7K53HkHBdq7JEgJvNlgdvLrFnJyBAF7RJs/9su9dLYksKrpxVetMWALlfSGb8PhOZBtFu810g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gvuO/HSK; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gvuO/HSK"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso103135a91.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788975447; x=1789580247; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
        b=gvuO/HSK/9iYthsXgB5bsFybkF6WCELlRFvN6jycMcN3Fzj24u00/ioZ36PivkUnmF
         YqeZWV3FhohwZle0aIxlcdJvY7Qddu0t7uXPM+FVbPUs6c/k1InnWz0YOug5LJh8VQn2
         Rsuuj8tWfVCzZmuQ/WqW5INOiplmvrTshXEVHrxkCk1cNplAxtsEmWTFbHA/dL/llN8q
         xWy5GgYU2qr4HtR9SkqmHGB4Ci+PqgnvMbvp1FcsZDbMfRIMEADD0LbuvY3ceAp+NPXF
         7zF16NTnAOX0SbUlBUAcWrbmqGN3uXCkJu6/Kg6hGIfq0EgJcja1gwoAKzkqDCIu8/lP
         AIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975447; x=1789580247;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
        b=IiCOUpGCmKmUxCTeBBUrICaDvRTFdUnT58JGRE89RL2Q8TylQXm/Ryb6rs2HuUavBH
         2frSbhh0TxgDcFa2YDUP0uc2MpGNfCKUovCtMHRI9HFEEMnCA77W4WXR42WHHb+M8GyZ
         +VpcvyR9e/3jUSYn5OiiDjBIJgxM/LiluqY0SfHXv0ADni18SIQm89A8NybT12jUJ+vL
         p9JJKE1Z4cutzN1LgL7aIjrp6tNsC0W7rYysl0dwPw6LJLanreusmNyrewqj6yShMf3V
         1j3Z4awSS5pb1mT/4ywPuOfM8IWbwXTZqJgA5402zDWslvZDeOviMdfPXc6lowHyA4KI
         rXBg==
X-Forwarded-Encrypted: i=1; AKwUvBw7KQk430ZQ5aKmYmcyAk8ZdR0MRZoR+7+DdZRppucmqGIdE8I/Ys3+d3CSHlhhEjizxeCYaDuZ+0c=@vger.kernel.org
X-Gm-Message-State: AFuF++lNRWGa1dLHq8PXE423ljQAUXxoG8omebZU7Nt3QroyZLhzLzEq
	NbYvyVbpyPmnH3MTowWCq5GLeQGO1vLrJkpdCujQdnelks+KUSgLj1vRou/5tpjhSaKm9KfKxBm
	q6tJRcrJmpQBO7iYMvgbOHiyCTIm2JRIc7w==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: from pjbpm12.prod.google.com ([2002:a17:90b:3c4c:b0:396:702b:655e])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:37cf:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39d77aa1851mr284135a91.8.1788975447027;
 Wed, 09 Sep 2026 10:37:27 -0700 (PDT)
In-Reply-To: <202608260405.gHL6gOJf-lkp@intel.com>
References: <20260824-pcie-lmt-v6-1-bab4ce233fa5@google.com> <202608260405.gHL6gOJf-lkp@intel.com>
Message-ID: <18d3b7b0cfb6fcb1.3137322e31392e39302e313337.965f0.0000sendgmr@google.com>
Date: Wed, 09 Sep 2026 17:37:27 +0000
Subject: Re: [PATCH v6] PCI/pcie: Add PCIe Lane Margining at Receiver (LMR) support
From: Priyank Rathod <rathodpriyank@google.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-kselftest@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the report!

This series has since been decomposed and restructured into a 3-patch stack,
and this issue was already resolved in the v3 submission:
https://lore.kernel.org/r/20260904-pcie-link-endpoints-v3-0-4b9a91bd4b35@google.com

Thanks,
Priyank
