Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8729993D
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960350; cv=none; b=Uii5BRCXEniTcQCnhRBcJdnYSZ1DmWa/5tlAWAqNZHChMlCjb9QoK2VcPzsrG08PquoJ0XjU0mQ1D6wiUd4Fm6BnCQLjXRj9L7tCPD4yt8vwae1yeHZCyy4zfh2lPBJLw0C+JWhTc+Pv0Whp+vZGf6RehKNkPNTgKNoxcOH4XmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960350; c=relaxed/simple;
	bh=wypA2EBmpHp+y/b2ODxhiTcNbDIFZEPcjrmQqxW5FIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UinEs0AtKB7ujJ+3BYFcjwzgna2yprg1SSmjNQV7xvZbtO0sUdFD84/tJkQyDjBt39zmz1/r2fkfCBiPot+3y7QXrLCGH0Ey+/diZQSqG8+fX2Gix+RXSUls9OP/gT/vTQjQ30oGdMKfqLSSYhLSQ5HR6T19d71NmTogl55or/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=CL55tIaj; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="CL55tIaj"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73c17c770a7so4988670b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751960347; x=1752565147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN7aSjUU2m/lgLen2skU4S+C9lHA5hU+Z1BWGyIcRGk=;
        b=CL55tIajcxGi82FtpZGUu1hsD2cqwt6I9lYcPqxmJx5qm9tHAijELkYnA/8yhEpLjy
         G5mAovIu7QkKzXh/HaLLr6Zh2cL0ytnExTVtm7ng2NLC4nCJ8ZdYn05sFEFMwURKmLz0
         FXu2wUK1DW2oktKXdh3pxSTmbrqzoONkEk+xXEAXQaG/F0lJOyssz/LX326Q1OfXX+WD
         T0Fuc4LVk0rnR6+wIBHOxC7tub+14bawjVF6N6KeXkOFWpYKVgILj/cEGp+Cl24ic0uU
         Oy+4SNQHDkdkvq9GeE3cWcvLfGYHCTdmUBbQNIPofwL5EGOBuDP/jhi+yw51m77vqQPW
         HIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960347; x=1752565147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN7aSjUU2m/lgLen2skU4S+C9lHA5hU+Z1BWGyIcRGk=;
        b=J5dRF2c49LRWaMkIbg2JTx1zcTczkLSwIrqR5beV5qI77HYxPytiFLzeIORWdTtymy
         KnwBFMl5geCBpW1azQ7h8sV1f0rGFarqSZeBDtUdK+Np3vDc9bZdp6IgzGVipxZ3uTUe
         brN2sdcAd9IL+4h+q8nNbk5c9cXdLOhxiUuLC7SgnmpCf66tWX3xQQPAxwP75egmirnE
         +dclZkkyYNlN3NPm9hJpn+9YdiW9g7bej2EfD9ez+lPulfN9O9msHsyIsyNxhHkF3a+a
         Vig/OhXHw77sIMOEl141wTmYkJ79LJGgol9H2BA20FvH2dwiHpNABKFn6lRdFZUZSPCX
         zrXg==
X-Forwarded-Encrypted: i=1; AJvYcCVR7Hx2VFBk3PBaqk0g8HfTVUtj/dNySkgn1YGVR32zwjVB01sMjZ/BzYkpNPs1dZwqWx2UMyLxp/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCarEEagPna1sd88u06Eoc8KwZtAepNa1fQK/O0p0Lqq4Dp8Y5
	zgr6hvIk4kjKWOPd02hgKtfAeicU85Ul3riBNF69RFqH+zPMnNwT+SFiqJkhyuYKt98=
X-Gm-Gg: ASbGnctLf7rzM0T6C9diBJeNaCct3GI4MpXQ1m/iBQaKQ7CBUrq1aLxkQpKzlw/Sk/H
	lcXb7vCZSa1aIysbtFRj9Cttlg5twTor7f+mkqlrkhrHKeeF4MDGIILAwTxJVFODmTngYNFmiYj
	qtZD4NG4nc8/qeUzK4GcniRNwMgWwvfaC9H1dhI5Jwi+mipShilSPJQ1usdxTKL4BYjL4ymFeCj
	JVsCEkLUCQq9JzQ/L2ln3wZtH5gviad67aEn00hiHjM47ouV1fey1KttYBXyk2ayl1WyEBxLMI3
	fvlCiAwOmz2zi3Soeay7IlaRWzHZ4JIkXM3om7XaaKa0frJm+zHPdbqeVERs6NcYNmLWjYt1WzI
	So3/wBXKtB2NiDlXaZQ==
X-Google-Smtp-Source: AGHT+IGcYNPUjs2kwjkvmFdGShMU4syGWz/FE+DbOGjtHhPQiV8ZsbgVj6QjspJrmZqOo3MkvanzoA==
X-Received: by 2002:a05:6a20:e687:b0:21f:cdfa:120e with SMTP id adf61e73a8af0-2260c839353mr26223435637.30.1751960347004;
        Tue, 08 Jul 2025 00:39:07 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:39:06 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 0/3] drm: docs: Remove deprecated MIPI DSI macro
Date: Tue,  8 Jul 2025 01:38:57 -0600
Message-ID: <20250708073901.90027-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unintuitive mipi_dsi_generic_write_seq() macro
and related mipi_dsi_generic_write_chatty() method from the drm
subsystem. This is in accordance with a TODO item from Douglas Anderson
in the drm subsystem documentation. Tejas Vipin (among others) has
largely spearheaded this effort up until now, converting MIPI panel
drivers one at a time.

The first patch of the series removes the last remaining references to
mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
the driver to use the undeprecated _multi variants of MIPI functions.
Any behavioral modification to the jdi lpm102a188a panel driver by this
series is unintentional.

changes to v2:
 - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
   driver instead of just mipi_dsi_generic_write_seq().
 - Update TODO item in drm documentation instead of removing it
   entirely.

Brigham Campbell (3):
  drm/panel: jdi-lpm102a188a: Update deprecated MIPI function calls
  Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  26 +--
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 150 +++++++-----------
 include/drm/drm_mipi_dsi.h                    |  23 ---
 4 files changed, 71 insertions(+), 162 deletions(-)


Link: https://lore.kernel.org/lkml/20250707075659.75810-1-me@brighamcampbell.com/
base-commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a
-- 
2.49.0

