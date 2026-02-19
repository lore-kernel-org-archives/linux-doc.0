Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6930C62C
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 20:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771534555; cv=none; b=IhfaT5k/sHn3IrP15zUTTn2WJphcj1kFEQjPw44f5Q/EEANEzlIRzaJJxNMY/vf8mPnA5yS+pEbTKAu46tld0C7P83L/h38Gn5XFal78nrv4vU95S13p0q0MgGu6rGpSAmK/KwYiUSfxCeR7XABaaQslJO4nJJb9xsBHj9/dCqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771534555; c=relaxed/simple;
	bh=uXP1ohjFjM40tecGuIo8ml1RERwnAdFm4HtFsOJ4i1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hsi78SPnJhrmQ71xUAMgpcydCDcOroocFVjMcc6N9CamND7JKRTx2s3HYfkmcijqKo7OEr7a+GuIYGrvEEpfrZWkmM+Kl7Wk7QmSUiOU5g8tG+2NZC6ApZnLg7P1u2ZVD9fzUDuQKU7yt3aJv3+yO09Va9U3kXTOrzapIpBwV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BR68BVrO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BR68BVrO"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e4989dacdso1645606e87.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 12:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771534551; x=1772139351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oi4HU36xhM0rM4Q26SQ6PvvbnGglLWOBTSAiQhdXIK0=;
        b=BR68BVrOCmQmtna07PM2tglLLcIe3jP85n4aj350Lb2MChLGKGYoQfzsEqj7ndAgtp
         lEgZ/xFBvv1rbzB/rkOBwLhIaQU8iFIRxGh2SGI8gREPw0TdLQQiL5HnjvF8CvqoBDBm
         69sYMMKrT5TaHjpSP5cjDOpjKZG8QD2rmAgEi+rs2gp4aRtSOCwIqzB9CR5B5bB4lge/
         aeBYH3zw1tEwS2TlVFYEEzXAc6wn7lNK5U1HXXA44bcRxCBTzvt5kvonK/OiL+VS6nNo
         WEH49ZnH1vvVAs5KpVOFTAN7TDKn8WMlEgBFxoj4zCVQfRjRBgTHQ16tu+JRVwRRDhBa
         uXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771534551; x=1772139351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi4HU36xhM0rM4Q26SQ6PvvbnGglLWOBTSAiQhdXIK0=;
        b=PHNOULusX9DQ4hXHrYjud3tgyemAc6axrlBLoYJdAIQ66MhfTD2JMCaMr51ESO8ta3
         mWxwz1SY/INB5z39U6Sjqm3K7iHA78/3NMTmgfSJG2NcZRgi6yZSW9pJncEtC4lV8CxI
         vis5Ci916Y9WMrXXkLTrhKDpV5igsNWDiUrwHflU48vz3S43mWUPNhRZNBZ9bIPSclHZ
         4uGC/+ngrnd/jh94AY43M11XNMSJBSmvBSWOsYhEburSZIeO/0uUf7BFnEJtmvzk/3q2
         2kb+hQW5djlAXlspDKsFVpsH9XeOkHrBTlxligB4SmieCAkoWNMJ507ij0nKxGSkhMMv
         1iMw==
X-Forwarded-Encrypted: i=1; AJvYcCW8NdVKQy8fBPDUmPU0taP40jv4o+UYBN/64uMDjVSfP9/OS96xshDKru/nlWmvtCyiLvwbzGS5rOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPtCUNxe6AatFKFQNmqtY8EqknSlJrfZ/3SviqCSWu9XWNT0CL
	VLfgdvZxmngEuMzsB1NAw2BJp3Pgelto1ZIeWRuzn+kOjem6JuPbXK0f
X-Gm-Gg: AZuq6aKqTsz8mb6ufJnj+tJZBziNMwGn2pi0s7IS1loHSiM7+0oHx3F9PExIdM+eyVs
	xFF3i3Uxy7f97N+eV2X4nBXM8C4tZc9l63BRi9zQ8GoP8mFYja/gcpmrHtkTZgEj9RlILMjpTi5
	/rflVaQbmvpow+/YdiWvuNFxeD6VnGQJ2KUPORseJufAOlQF99v1+zdJX66xiNN99a66G0+A5T2
	j56WdKv8KH+xOC7a/uCFwXTcolChD3l4AcYPqgnFU1f/VlbG08bSEr9W/1M0BjOQmlqYoqeDFSW
	Pp1iKUl8DitnQCE3pXqvDqArxhX1Irf7KypepWUBuc5G62xws05DGl1tEVPJOpy+3nXiw602XNZ
	9oE0iJEGhmKXm+uXMe/Ags3QKxCdmNM2vloqXG+T6qIe+Tl7ruCKDZckBxzVdt2KY0ZUHT0OoO6
	8qR/RRI3RTJqOa+nJoVzw5pNKKBNtW/Ia95xbN1hQRgoclr09VKB/Mn6j3dIJGb9B0kZuU7rDMJ
	hUPslEih2uAuWQlL4vyzf6qg0ElFnF2aMY8+vpza3+9Ug==
X-Received: by 2002:a05:6512:3a90:b0:59e:38ba:1821 with SMTP id 2adb3069b0e04-59f69c789f9mr7564403e87.48.1771534551239;
        Thu, 19 Feb 2026 12:55:51 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f89a356sm5443917e87.92.2026.02.19.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 12:55:50 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 0/1] alpha: enable DMA CMA support (HAVE_DMA_CONTIGUOUS)
Date: Thu, 19 Feb 2026 21:53:48 +0100
Message-ID: <20260219205514.4434-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables CONFIG_DMA_CMA support on Alpha by selecting
HAVE_DMA_CONTIGUOUS and wiring up the required architecture hooks.

Alpha previously relied solely on high-order page allocator
allocations for coherent DMA buffers. With memory compaction now
functional, CMA can be safely enabled to provide reliable
physically contiguous allocations under fragmentation.

Testing was performed on an Alpha UP2000+ (SMP) and a DS10 (UP)
using a custom kernel module that verified the following:

  - Correct CMA reservation via "cma=64M"
  - CmaTotal/CmaFree reporting in /proc/meminfo
  - Successful 32 MiB dma_alloc_coherent() allocations
  - CmaFree reduction and recovery after free
  - Successful allocations under heavy memory load

No allocation failures were observed.

Magnus Lindholm (1):
  alpha: enable DMA CMA support (HAVE_DMA_CONTIGUOUS)

 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 46 +++++++++++++++++++
 arch/alpha/kernel/setup.c                     | 16 +++++++
 4 files changed, 64 insertions(+), 1 deletion(-)

-- 
2.52.0

