Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE53D9696
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865638; cv=none; b=cdO87S8pQRT9RNPr5Tz+6wMTjIJy97moPzt+67e3h8wYdpNPQOU85ngCNRbuZ2rItKYP7HaWbIs09pQkFax2Qnb2Va15RAI3jyddGekS0CYr5ptU20gePTMR1AcXgEjMQWW2GrqgYfmkj0l4LuSximJoCP4cVDG6aLdOVqI7p5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865638; c=relaxed/simple;
	bh=fFuadDs+H7/u75qOFSKI7F2nBapOds8GkF/7nX3dyVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sQOigi2ZLbaEFFbTHgi2VfgtXCMAZTihwmF41B7mQ8/G7D7odiwVmL43x1X2gqG3rBhYSMrSlU3MrE2yOi3PZDn6gWPMBkfAB4M7mYxNRq+F+xExAs3JUwqxgtLx9Osh3VeDUj7eC6T2zfASrf/ZA9PcoDGn51AhlC61Sfppe00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=NFh5RQ9n; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="NFh5RQ9n"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso441875e9.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 10:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1778865635; x=1779470435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lUoioocy03AcJ42VfqZTQUoHuPSfrkeCK7eee51wvo=;
        b=NFh5RQ9nGW+ou2o0CRt8La7iVjjqBmPaRey10VaBOZxSS+Sn5jC+B2KlRhx4cOvEi6
         vlIAckHmnmdQPaX3Ch2ogltWFfR15MmIR+DCp6D9oeLVScjlkpcOUQmB7vNgDfACcvgY
         YcOfu8f7D9xbNx7LnG4YuVE8HS23Hvv+pqAHxmHr3eFrbEMEqw2/Wx81wKAcntn/D8He
         nCwn1Hjt9tJT3PtFWAS/+gfjQX+XtKZwLNyspP4Aukd7aTAfOTO49d3lL3nFiXxFhTlK
         ZWzOjjbRfunHDvpoZ7MRGKkHX22aiED026zY2UkugeVdeKoZkiWfJS5VkMdyxQt1Pj3A
         Wxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865635; x=1779470435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lUoioocy03AcJ42VfqZTQUoHuPSfrkeCK7eee51wvo=;
        b=EWnaoUF7lihfIC/k80Gexuaklu8Jpi4k251Er/BzzlWSG+QZgfwAIzUQabYjlNnSHP
         KwEnEGz3eASq+E3A4ZNJU//yaP9cqhNSZABrxVlvlAhRI+Adii57ry1yHJHv/p6G/yCH
         QnDBwXE2T/ESbnMtypX93P3yOp9H8Hkigx9ZFilAiJ0poOQu5+1uExJr4pnAqGBF0Un9
         stOLN3vq7pEkkp+3g8HfYJmwD6E1piLC0EY+tbKZmq5T7+txY8p+H4mwD+7OHgsfYV5n
         JHk24OplDgFd0tcmBpkumxydMvD8xI94DdM0HwUz9rQktvxAjOUR1o8323rUSnwOMYbi
         ubuA==
X-Gm-Message-State: AOJu0Yxbrkfg8b/H01ed5vhKSqS+xKGAjUz+sDUNCxevc87QP/wspeMN
	13ydbg0kgk32dETtK7WMmgko9sHk4spujrYBpNdisb0Fn8SOqJLGOG0T6dXl8rGvPZZqmhLrj/q
	0ocw=
X-Gm-Gg: Acq92OFZv1u36q134v6w1BYl8H4tFsgUWxsnUQO6IenLX06fTm0gUpRAO8yE4s3Sow4
	sfM2iXXmHBZxFOqy4lkfGc+BUFmk2VjffRz1kVZYrq+vWXiaQdBwY2rh7N4ZNPO0WdwDmf4ZM1o
	55cMuxWD9ATdMzFd4ZVGOZUWw7jmYK7MlydxJR5cCoWa/9Q//JDrIh/PbpA/1e9kaVgtqKHWrQM
	GwhAYZSaalTO+OXejBdb+ve60zshk1BiQNDWSSczv7h68nYwUuJDLBTfvfporzQOJ5kJrrzFsjl
	aUoKC8oMjqK217dg9Nf194QImLw3+AhKmvvqmY1IqXUJWyOFlusDMx61Rybhri7JqJj0+nU8dDE
	Q2hlfZX2CE69sNgQHUWmTHTM4TGJn37yaC+5cxh4Cltu7YRoavj7qdN9iMCbK0lYdYwP9euOSfw
	2eMISccFM1S1xii/qYNLuND/C0EbZK1jVrPOZqxnw=
X-Received: by 2002:a05:600c:3e07:b0:48f:d1c0:721e with SMTP id 5b1f17b1804b1-48fe60d7823mr75476505e9.12.1778865634776;
        Fri, 15 May 2026 10:20:34 -0700 (PDT)
Received: from [192.168.2.212] ([185.209.196.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm77251515e9.14.2026.05.15.10.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:20:34 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Subject: [PATCH 0/2] module: restrict module auto-loading to privileged
 users
Date: Fri, 15 May 2026 19:20:18 +0200
Message-Id: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBvQUA14lSIlnYx2ihiZiSKId
 zfV5Vv8v4OSMCm0xQ5CKyvHKaN6FIBfPw1kOGSDLW1T1lVt/JLiGH14C2kSxmSw942zDp/BWcj
 dLNTzdj1f3W1dPj/C9B/BcZz9FRLIdQAAAA==
X-Change-ID: 20260515-autoload_restrict-cfa6727c4d72
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.15.0

Add option to restrict the module auto-loading to CAP_SYS_ADMIN.
This is heavily inspired by CONFIG_GRKERNSEC_MODHARDEN of the latest
available Grsecurity patches [1]. Instead of checking whether the
callers' UID is 0, check whether the calling process has CAP_SYS_ADMIN.
The reasoning here is that many modules are autoloaded by systemd
services which are running as privileged users, but do not have UID 0.
While systemd-udevd runs as root, systemd-network (which often
auto-loads a module) for example runs as system user (UID range 6 to
999).

When enabled, reduces attack surface where unprivileged users can trigger
vulnerable module to be auto-loaded, to then exploit it. Recent LPEs
(CopyFail [3], DirtyFrag [4]) for example, would have been mitigated
with this option enabled as long as the vulnerable modules are not built-in
(or already loaded at the point of running the exploit). 

[1] - https://github.com/minipli/linux-unofficial_grsec/blob/linux-4.9.x-unofficial_grsec/kernel/kmod.c#L153
[2] - https://systemd.io/UIDS-GIDS/
[3] - https://github.com/theori-io/copy-fail-CVE-2026-31431
[4] - https://github.com/V4bel/dirtyfrag

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
Michal Gorlas (2):
      module: add CONFIG_MODULE_RESTRICT_AUTOLOAD
      module: restrict autoload to CAP_SYS_ADMIN if  CONFIG_MODULE_RESTRICT_AUTOLOAD

 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 kernel/module/Kconfig                           | 15 +++++++++++++++
 kernel/module/internal.h                        |  1 +
 kernel/module/kmod.c                            |  5 +++++
 kernel/module/main.c                            | 11 +++++++++++
 5 files changed, 37 insertions(+)
---
base-commit: 663385f9155f27892a97a5824006f806a32eb8dc
change-id: 20260515-autoload_restrict-cfa6727c4d72

Best regards,
--  
Michal Gorlas <michal.gorlas@9elements.com>

