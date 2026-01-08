Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FBB16CD33
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 01:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767836418; cv=none; b=nSFvry2rKGmjGN/5d0nN2v3U8jWOrm3eNHK/lxsflPusBkHqOMXLfDlYdiMhOdXmPr+q+tOWX0KqsJIvJaG/1uNSXPlfYwbr5WvRWOvLRtS3GgirUj7cFpu3r4mAmAT4PONG7Y4CG21XbdeV+eM6TXeaZgwX/YANPjBP/1DVf0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767836418; c=relaxed/simple;
	bh=HHRfH3X41hhCOddhpPOPMeRdNO/jeP7c7O3PwHZ4JSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bc10BNMwR+ZRmuo3w8yIKxRHRnP+AeVG0Hn8DkEFxJgZ2JvZ+DiQphoKSqaQeWuOapUAfDZGdgG1GgQbhXygw408DsUsuDTSX1eYVA/twz7qfjFFkQHtj+9cRqAEZrusE8LjR7JO/onYvSJyFfbmAkEB9tyWwhGC3oVBKuLfUOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7u4xzBF; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7u4xzBF"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c227206e6dcso1820672a12.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 17:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767836416; x=1768441216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNPrzm7KtpivJF/6ghwdGmvDMU6ng/7y8+6forJAiAI=;
        b=k7u4xzBFjHxUrRgkPv0M49zL+4W2rfolS64QKRTyV6O20SDQlxWhnR/TSh3/iUcbDI
         Xp3VPojQa5EsLx3ARkR2D/hAzmQG9EfRjLWcA7QhN/6TLWWUd7o3UHAOXMq+gyUlNYN2
         3P6x9kSmRaU0ne1HLr91Ll96+8rRoEV4OL2z+ZnZz544SA7AtUP2PwovlmhoJuYcriCN
         gEaLf67ToI8yfqWPg5nBsnzIa8yuJ+ZIe3wH2d1hXbVgbT8rMFgj+q+1/KZCLjLzqpa/
         9wTaUXyNu8nHk7f5ozKeWxc7Bo8czoZwugc99gk6137DPONmefB+laeseCBPiaifavVC
         fMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767836416; x=1768441216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNPrzm7KtpivJF/6ghwdGmvDMU6ng/7y8+6forJAiAI=;
        b=hSjAFrfJsfkYeg3001+sbxVaqp2nLvez3GZp5BIrjpJtSN9PFMGIlpmlLEjG1Hguel
         GVDttD+j347+DboHujxiVt75oL9FI4qV2kRNggAVWs09o756hznmCEmxmVfGZVe6snLY
         FshZZoH6EbDyHAjpAoJfZOpnYOwjj+hTn1j1+ewS6EVgm9V9ASbBAoC4U6SQxym7BT0E
         FdfBNz9+XDl78zGJzzIv8EdWyFyGy9/yHtN9G1mZS4UEljfctPrBBX9t8lopWF8w9Fc3
         ZgWI2lUVdLM/6oueBzb6U13qjJ9BREBE8e4WhAxnF+vMr9Gkkwatg8KBdCP2HZu+fsVq
         G8SA==
X-Forwarded-Encrypted: i=1; AJvYcCU5puW5geeo++tf8ptDv8rDwHDkQNzjLShdyc4Kc8FbIfVl0tdrZqQntJPOHhQJL4eBgN8DiD5CPZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTgZ7ZXd/680Kkq6JPADNUojNGRqO8xbVL2DltAyJN6VFcTnbx
	8my/kjzNcoTEgc4epvR8Yffjz9H1z/h1Gsq2Dgx2zCtjLgOVcpmBsuBa
X-Gm-Gg: AY/fxX5VKP5mIO2ktJUoFyr/GCiSGKrK/FCUOkeQQ04pqQKoX1EwzpEzD3dukw2AUGK
	jH9Dm9MelGCyr1FM0yrscn1kGr0xIJzTeJ7PTuUpSR7Y2TSbj64XfsO0vKWRISjWfGLt4Z3RGUF
	H0SjbkqVi3kPXf8gDm0PsZhSsSbAj2j7CdC9P75qdO1W0hEfjqrgaO35O0/vOANAI1AzCnzK5C3
	jA9dbFivLZs90lzSR4M2eeCd0uptfh8XRKnU+6KggGqb2PhPcd7uTbdtRjMI4q0WeBrz4KZw66F
	XX5JyOyeLtAwzgeS/JRQu1P4OuemzBG4Zq6buwPuapIE//Sp1n6+Z+n789fFyhUNRTR2qw+4VTX
	aB9kkuKrQiZcm36phLsv83uG54vzpafSWZzLgbABqElNd1ehvSx57X/x2ztlrJizoHqLvoDNjv5
	dl/R/jMGn5wkI=
X-Google-Smtp-Source: AGHT+IEOc00Wl1EkUV014Pbq9GIB5Eq7Iumzjn2kIUXu5uwyutQk6/3jrqjjb47OlaBQPlPTGatplw==
X-Received: by 2002:a05:6a20:430a:b0:35b:d15f:8fc1 with SMTP id adf61e73a8af0-3898f8d025cmr4029536637.1.1767836415880;
        Wed, 07 Jan 2026 17:40:15 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d2932bsm6453659a12.21.2026.01.07.17.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 17:40:12 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id ECD264505E0A; Thu, 08 Jan 2026 08:40:08 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 2/2] Documentation: tracing: Wrap PCI tracepoint examples
Date: Thu,  8 Jan 2026 08:39:56 +0700
Message-ID: <20260108013956.14351-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108013956.14351-1-bagasdotme@gmail.com>
References: <20260108013956.14351-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=HHRfH3X41hhCOddhpPOPMeRdNO/jeP7c7O3PwHZ4JSs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJnxnHu3LhDM+8zyLYXnXcuJaUndF3Tl9X/xsN9qn554e 99SZ2ejjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzk2laG//5pfRX2kmt5H0rr vpih4TXRU0Pns4Se/bPoNRqHSqdvaWT4H/ByzVK9xYFL77de97y54W76o4VX0oJOBE7e/9F2UtW FNzwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports htmldocs warnings:

Documentation/trace/events-pci.rst:43: ERROR: Unexpected indentation. [docutils]
Documentation/trace/events-pci.rst:74: ERROR: Unexpected indentation. [docutils]

Fix them by wrapping example shell snippets in PCI tracepoint
documentation in literal code blocks.

Fixes: d0eb853678a21b ("Documentation: tracing: Add PCI tracepoint documentation")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20260105160000.0368ec8d@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/trace/events-pci.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/events-pci.rst b/Documentation/trace/events-pci.rst
index c1ad0fc54777e0..03ff4ad30ddfa1 100644
--- a/Documentation/trace/events-pci.rst
+++ b/Documentation/trace/events-pci.rst
@@ -33,7 +33,7 @@ state changes.
 * ``CARD_PRESENT`` - Card detected in slot
 * ``CARD_NOT_PRESENT`` - Card removed from slot
 
-**Example Usage**:
+**Example Usage**::
 
     # Enable the tracepoint
     echo 1 > /sys/kernel/debug/tracing/events/pci/pci_hp_event/enable
@@ -64,7 +64,7 @@ Monitors PCIe link speed changes and provides detailed link status information.
   - ``4`` - Hotplug event
 
 
-**Example Usage**:
+**Example Usage**::
 
     # Enable the tracepoint
     echo 1 > /sys/kernel/debug/tracing/events/pci/pcie_link_event/enable
-- 
An old man doll... just what I always wanted! - Clara

