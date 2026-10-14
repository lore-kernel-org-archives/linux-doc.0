Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DA0560AB6
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992770; cv=none; b=rijGKASYOvN2RCTn/iZOnOuXYPHfJtEfGd3jRVjD15iOH5ds0NfSL2D6LPF8g/5Aehpl0H9NzhjRN36QI0dAEFsM1/3RP7XehDVu1iePmS9Yna1nwcSaDJgAat6VuW7mcjyGRgEW81YQXFz28sUjAZ8pYfhBK0N0lIEhFiXOM6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992770; c=relaxed/simple;
	bh=nWe/k9FLePuIunsVevsIKBcKBQYbwAkGez+IHcMgm+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=reuf/kT44OjPTblih3H1kvO0XRR4Erl1Rj+YHmGOMj/iiBawQVWlMlTqsapOOcj3ddMjLKnOROl0p2r08Yau2NUTg0vXPCeUzY3Ut7Krws7aZ7bJxpBEnRP888lSXfx5HtuTywPbLyyZ2mo5IMLGn3//rHAHpQXLeiv6bqMAvms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhuCpz5X; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhuCpz5X"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2363181a12.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992767; x=1792597567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guVsG4hFn4zNEbHwQhhELW9kDSSxFBpoASzURJMZkH8=;
        b=nhuCpz5XIjmW/GLZGvdKdubNtUyJJ82xBIzkCHKSTtS+LjoOEMTwADMEwO+2mkz+dO
         nL/fJv0Ymh0AN/gZN88E24fpoXNE1F7c7dQEfls2fNnJ0IDTCVn9531t0nM4Ajk45qFg
         90k2gzUGge9gcI+ASLEfqM/71O9oGxvXgfrFJesDUIr7nDE8hOorBD/S9LH0CGoXZ/2E
         jsnxIljAVC2IxqEvzSqxsiIyAUYqpr1nCbZoBW1ZiVaSKbZPve52NQb0X8EbeLxamKG0
         R9m8OyIZb3nOxayXBH1HP0fTOSARkuEfTu8O2vBFQb999CuUvj0eRixpihemWTtr5kAU
         5DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992767; x=1792597567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guVsG4hFn4zNEbHwQhhELW9kDSSxFBpoASzURJMZkH8=;
        b=0S4FRVzPj4mv55uVT/mx5Sm1U5YqKIG8mjqvTpGaGbjEunUkqeVhplSyeN0/I/rpK7
         YsiDDh8wPWZE3dr/Sp/q3PFF0J2J/CvaSh6frkI3vBsNkULuAma8r09kAJ8lqhYOemVL
         IomwfCAMVxk0HrxYt2phmZQbO8odiBePj/3G/9qD9LDILsIyCZa/H2IUipEnJTDN7I25
         J/xjjBq0R2lhR9z1aGHILP41074zi0dfT/hNLrsehSGK/2sRJZ2fxDxr0N5MavE6AImG
         AFN0WISDjsMVCDVExcWdVHOwtMIEWegGFYssPvEQFUfgtMoxlWBqjxnwkCtRF3VasDT7
         7EVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlEGg4hf6KseYN82Pqr0jePTZMj6PbKgWN5oscVGKMpG8qowlM20LMSJqSeqQ46piSdKc6GFY79Vc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYmZwVWbGWTY0EU6z44bjpTJS66ByFNxq9s6LwUayHKIL9Las4
	93RXzQ/K3CuSvcK/wFclg+1t5blbQi5oSp8EON8T3d64/qx5kWrBnHUz
X-Gm-Gg: AYBFou3y4dcQwQXtErEocRlmylqqW4WxaPLvxsGJAj0mc5OPaPDJmu61HOwljqZG+7M
	YFFl93FCBNuREi51VqC+XUAqK2X6EpcBumTf7EXZUepRZWjWNtwfIVbL2bUZ9Esl4bqJ+GaWPrC
	cS9TQ2fibN6ST62zQl9Mk4QrFQYtfR7B1jDLTLe7am4Rhk7GrgP7aoNIexytbKsuStqFdK7STGV
	afcikhy+U0/426v5CY2huOA/E6ZLbJvgBYJXHsvOU/nxY9kMeCarXbzMnNslY13GyohWNhEt1c0
	DIWqh1HcmYOC3Ia+cEH8AbNRvOvX5jhWFk7E+geT12deRX8ASBlcXVDB/AMUcV3H4gHadD/IVP5
	nURfKj2DCSFzxeqU8skq8wr0noowLAnnDA+9swQAoLLV01KCylmqFDzoAA9ZYWMHeuAJeQ6y45N
	UF+6+gU87HaFFbRd/XGRshEk4QyJITry3pVkQwyCMM3mAJM81J/MWBU5bqRyL/ffPxe0oxzUeBN
	iDi
X-Received: by 2002:a05:6a20:a11f:b0:3e1:3734:63e0 with SMTP id adf61e73a8af0-3e16bec52eamr10308336637.41.1791992766832;
        Wed, 14 Oct 2026 08:46:06 -0700 (PDT)
Received: from localhost ([37.22.102.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm1300598b3a.56.2026.10.14.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:46:06 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v6 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Wed, 14 Oct 2026 22:45:51 +0700
Message-ID: <20261014154554.231015-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but they are DMA
allocations of the device, so they go away as soon as the GPU is unbound,
and in particular when probe() fails. That is the case todo.rst asks
about, and the one where a GSP log is most useful.

Patch 1 moves the debugfs root into the module data. Patch 2 adds a
gsp_keep_logs module parameter: when it is set, whatever the GSP wrote
is copied into module memory and kept under a "retained" directory until
the module is unloaded. Patch 3 drops the completed item from todo.rst.

v5 got no comments, so this version only carries one fix and a rebase.

Changes since v5:
 - keep the "put" pointer read before the barrier in the copy, rather
   than the one the copy reads again, which is not ordered against the
   rest of the data (reported by the Sashiko review bot)
 - rebase onto current drm-rust-next

Tested on a GB203 on top of drm-rust-next with the TLV firmware images:

  - without gsp_keep_logs nothing changes, and no "retained" directory
    is created;
  - with gsp_keep_logs=1, retained/<BDF>/{loginit,logintr,logrm} hold
    the full 64 KiB of each buffer after unbind;
  - binding again does not disturb the copies, and a second unbind
    replaces them, leaving one set;
  - with a failure injected after the GSP has booted, probe() fails with
    -EINVAL and the logs of that attempt are still readable;
  - with a failure injected into the driver registration, the module
    fails to load, leaves no debugfs directory behind, and the next load
    works;
  - repeated load/unload cycles leave nothing behind.

No warnings or oopses in dmesg. Each patch builds on its own, and the
series is clean with CLIPPY=1, rustfmtcheck and checkpatch --strict
(apart from the MAINTAINERS note for the new file, which is already
covered by "F: drivers/gpu/nova-core/").

v5: https://lore.kernel.org/nova-gpu/20260923045551.229259-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++--------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 255 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     | 101 ++++++++--
 4 files changed, 356 insertions(+), 112 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 5a1b7121a6c4db6c0239d3ac3fd1c2bb33a40025
-- 
2.56.0

