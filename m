Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB62F8C58
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770499; cv=none; b=phQXBCDyYRxREwjNqEmgM6hbnAAFAUDE3SQH+kX2eL+8S8jtzBVyyzXlPo/1sjoQAgAG2RCkQ4MAWfPoeqnM8Ef1nA9MFEtSiUC13BzAotitKpoA+0jnUIFfseCyW8koZLOBBi1o1vl44R1WMkUxkP0eXPfYdp1LIVkhvUr3g/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770499; c=relaxed/simple;
	bh=pPXx5Kxdptb3GobS6onHLMsPrJKy1RvezPijhN9+wfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRqr5kA5ccPlg8M1oF7WHCaX6ZGLBooq4M++V/tBU+udX+nc/ijT62O3zNibCey9VrWDC743EO6UkC0Hyr/gHHikjDaNPH99KXlTHcPxrdj7cL3wqpgF/uxOMDIDo3OCQdKuJI8VYwp8WUq3wl3LmJOB20RykgkFUBPq2gDu28Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=by+4YpwQ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="by+4YpwQ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b391ca6146eso965082a12.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 09:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752770497; x=1753375297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zaVonVNWKr3b0dyGZR9LCJexaagL6PKA2t2eXcHfTo=;
        b=by+4YpwQoFG055y/j2Dc5ZCis2H6ppXAgr/XWtHMb5bmKNcDcEALmijXVsQ5oLI+pd
         lFwHMbGqZ8UX17q+AhIdSbZNjXn7BB2cX7lbYEa/KPTwgOuj9Y8URaF5Vvr0xgjKDLBK
         wxG8Dr0ChEC1UHMr+fg2KC0fkl+lAUQlhFqNcugx6Nh0EyaDb/xm5bvaKjTB5sa0a+F+
         UoPwT7h9BQ5J/h85zXtjr69+VL65gn6k+nsu6aUqny5age9koW71NyRm5/Cs5e/vlo4d
         y3kNnukkAil9fPhm+lJ/HywR0nVuPZ18/0L/aeUsvFNsO/py2ajvbm9CsOQPhw0rvZ43
         +a4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770497; x=1753375297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zaVonVNWKr3b0dyGZR9LCJexaagL6PKA2t2eXcHfTo=;
        b=T/y/KFSNsSkZz+egBBMcKX94LNqFtunk9Ion5r1sL/Sw4DZpngkVmESVC+AXYrv69C
         4ognHGv8o4/atl5jVOkYh+oZRReM8CKZSB8OnLamFoiJl5MK33ZWkHlQeBAT7liJ5P7v
         /gbe+keBLomiRyn2m81rEzIoEEBbSvJkuugVvdZxXCSRjBnCumDFDm+c09JXt6t3Z4Dg
         QDzIfMcSeEaXh2alJXhZQ1AbDHHydeg+KovUE5j5DBhh0n8+eHj3kZE6AVRTwTAKd5HG
         sDTW1AuX+WCJef12VozTN20fkwuSRrxgeW2oubfiV0OGffgHOoR3bTpwKeCQX+/Kr+me
         ybqw==
X-Forwarded-Encrypted: i=1; AJvYcCWrpHuSvD+6a+r/ud1Z1nqF6ZYz9GDmAdiMVBNgkJGkqAjinKelhwY8+k8pKpM7yTMcIxH8U7QjoeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YySoB3TcCyllJ9os6rjh4q+gGUsQMZVu5zPza55qJDVPFMYIdWn
	pJ+XmQJd4BkmQgCf/q+3GqLpQGcWDT+erwCOUOKM3tQS/FjbAWISCpVihnNHvfqTbAY=
X-Gm-Gg: ASbGncsLjtP2itMi9ONNS9QNmdxC/2IOpKxWpBB036H5w+20m4+ecj0vxHYECZMc1rU
	8FdfsG7lFhOd3njqXSB2y6GCwS7f9rnAJSqp0ZYHzN0ByMxBfrhASVGW6UuLVpuj7+7eDC40bbc
	1XSnznQ64gV8ACfQcGrXyvhuk09oNyWGhM0fM4I7ieQFrpln1EEAcGU0TPi+3KrwGrpr2DaHwWH
	zcnpIL5b7conbv4TE6dUSJ09cPT6w5DyC54NzpzgTKMtGEf9Qma5verU3TO8FIwG8Uu6D9nNqfk
	54KMATTW26+0MnFn/tzw2UjP/w6aaY/ODj7vd4PJVGSibdfy6Y4gqbwJVqlAJQci6Y+G95yX4Ek
	aAFAczdbFIitXRSJzmfTjMHjwzdovsvpI1Hlx7sincZjEdm8BDw==
X-Google-Smtp-Source: AGHT+IHnWxMFl+xdFfhd6iN1u48GSI5UYMmS7BfoELEh5F4oPsMjJBqSiWUBF1GSB6ivy5k7UULcDQ==
X-Received: by 2002:a17:90b:390f:b0:313:1e60:584d with SMTP id 98e67ed59e1d1-31caf844db3mr5977675a91.11.1752770497172;
        Thu, 17 Jul 2025 09:41:37 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:41:36 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 0/4] drm: Fix bug in panel driver, update MIPI support macros
Date: Thu, 17 Jul 2025 10:40:48 -0600
Message-ID: <20250717164053.284969-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
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

The second patch of the series removes the last remaining references to
mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
the driver to use the undeprecated _multi variants of MIPI functions. It
fixes a bug in the driver's unprepare function and cleans up duplicated
code using the new mipi_dsi_dual macro introduced in the first patch.

changes to v4:
 - Fix whitespace (I forgot to run checkpatch. Thanks for your patience
   as I familiarize myself with the kernel development process)
 - Initialize mipi_dsi_multi_context struct

changes to v3:
 - Define new mipi_dsi_dual macro in drm_mipi_dsi.h to reduce code
   duplication.
 - Fix bug in lpm102a188a panel driver's unprepare function which causes
   it to return a nonsensical value.
 - Make lpm102a188a panel driver's unprepare function send "display off"
   and "enter sleep mode" commands to both serial interfaces regardless
   of whether an error occurred when sending the last command.

changes to v2:
 - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
   driver instead of just mipi_dsi_generic_write_seq().
 - Update TODO item in drm documentation instead of removing it
   entirely.

Brigham Campbell (4):
  drm: Create mipi_dsi_dual macro
  drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
  drm: Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  22 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +--
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 197 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  47 +++--
 4 files changed, 98 insertions(+), 202 deletions(-)

v3: https://lore.kernel.org/all/20250717065757.246122-1-me@brighamcampbell.com/
v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.50.1

