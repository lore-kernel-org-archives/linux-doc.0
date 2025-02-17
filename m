Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6165722540F
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739813539; cv=none; b=umQvKQOg7k9v/8ScqLiQfNkycCxndC8Qny/HcvjcI62uZ0IOSWcncSNPOL9M0layPjB/4cNOFS/v2BzACa+LY/s6icnUNmhlX3ycbPNk8WQYtISxMeEDJtsPqPJJl2Zsy6sqxT2GlLxV6nKLu60QL5TiioCbz19eym8mlIBUmMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739813539; c=relaxed/simple;
	bh=KFP2R/TEoQs/HPOcYZBYMz6WTXXfGWe3Uff7RYjgJzs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ve/AN3MHnALKnYfL3/PCyoLfpNmEgyewRPA69ljbJY8pX9Sdaa+KTDn1oab2nGhjFNg/7FkcamVyt77D+vyGIhcFmlGaOC2wpMNpdQQCKLYvSDTUIDItDXrUVlCd9fJ7c1RQ7l71uuWdCc9DPqedbnCsVNF2TLQCfx5BaG7bCV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hIMBKmnM; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hIMBKmnM"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43970e7df5bso11314885e9.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 09:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739813536; x=1740418336; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BJBiaucnVrlyZGdfwKV5yu0lTpLHyTZbtjA6zJmjN0c=;
        b=hIMBKmnMtD+YOsMjjRNrOgEE2I3dhBIeC8ofHAoIw48Xy+aKeSIlWhzTvBS0a+LAcn
         hAYLynhsgdYXRfWDTmSmy3O+ea6T9wLWSZDl7VaDUqr6XmGND4KunpaNI3PV0MGtWG84
         s5OdKoJvnxFt+03PYwYfD/5lZbyaYb5g/amWstYroX5jCrr+Oa8U4x+SN/yOoNYZUu71
         wyuUjZcXKrUMj5JjxaIyRr4DMYEWdefMnmPZzJ+OTVOCRyW+6E2iWTb4I6icLdISeMXi
         iF2kgqm9Km4Uw69dwOQRrai0K62qWRDvH++4M2aB4ay2nuPZgL+z7nwit4wQLsOtu5VT
         iVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739813536; x=1740418336;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJBiaucnVrlyZGdfwKV5yu0lTpLHyTZbtjA6zJmjN0c=;
        b=l6oK3WeaUr1bw24mWv880/FBskW9tEVb/tpJWyQ28cvBbOeOQfO3I4LOtW2MkNaReS
         hdoQbLIsZzo1iLTqo2hYDoo3+sy8C7wSoDjHHrEv+H/VheODJfHQuJE95+b89Sgimr2W
         peIDkR/THadKnhrF7vjCxje7FOL6352L43Z9y/F9dVMRt5YOdG2EV68aSbtJtAyGYTq0
         x7hNnlzzQ4zJjajATkU6f1Hh1F0QVo/aA3s/0NwWGefkS9NQ9lYdM43cS5rQqoQ6wmdJ
         NPJsphPg4BFntThiTj16RUUYNr4+sy2nCX/Zmv36RpkCX+sTXiAmlYOOcatlXvRPwQZZ
         dqxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBDbFz/pN0ph0ZZ4Qx0iI4LNblFOHr9g5aMF/gR1rb2phNRJLdyuALDKXZN6nZjbDpyfFkO0IvYWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG1vlLUia/++DvP1BVeeCFpXHhsnvgfu2eitPLyqW9sDIpSHHv
	lMnisNRaXSV31I6XSh75k2CFTRKDskV/Fc7Ce8TAc1BNPyW9mlLlWYjJQkWdEzJcuswS3sMU6Sp
	QCMABcrJJzw==
X-Google-Smtp-Source: AGHT+IE5jPgEVsSxIuJGXGUw+3v//iF2J6brAaVYjtJIUEC2xhRWmWP+EKgasIeGSMeRMeIDp9K4HtBhF8fANQ==
X-Received: from wmpz21.prod.google.com ([2002:a05:600c:a15:b0:439:8cc3:4f3b])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:870f:b0:439:84ba:5773 with SMTP id 5b1f17b1804b1-43984ba5989mr45001175e9.31.1739813535785;
 Mon, 17 Feb 2025 09:32:15 -0800 (PST)
Date: Mon, 17 Feb 2025 17:32:09 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: b4 0.15-dev
Message-ID: <20250217-checkpatch-ignore-v2-0-ecfb50e03bb0@google.com>
Subject: [PATCH RESEND v2 0/2] checkpatch: Add support for checkpatch-ignore note
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Checkpatch sometimes has false positives. This makes it less useful for
automatic usage: tools like b4 [0] can run checkpatch on all of your
patches and give you a quick overview. When iterating on a branch, it's
tiresome to manually re-check that any errors are known false positives.

This patch adds a feature to record in the patch "graveyard" (after the
"---" that a patch might produce a certain checkpatch error, and that
this is an expected false positive.

Note, for Git users this will require some configuration changes to
adopt (see documentation patch), and not all tools that wrap Checkpatch
will automatically be able to take advantage. Changes are required for
`b4 prep --check` to work [0], I'll send that separately if this patch
is accepted.

[0] https://github.com/bjackman/b4/tree/checkpatch-ignore

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Changes in v2:
- Switched to the "graveyard" instead of the actual commit message.
- Link to v1: https://lore.kernel.org/r/20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com

---
Brendan Jackman (2):
      checkpatch: Add support for checkpatch-ignore notes
      docs: checkpatch: Document checkpatch-ignore feature

 Documentation/dev-tools/checkpatch.rst | 46 ++++++++++++++++++++++++++++++++++
 scripts/checkpatch.pl                  | 34 +++++++++++++++++++++++--
 2 files changed, 78 insertions(+), 2 deletions(-)
---
base-commit: 619f0b6fad524f08d493a98d55bac9ab8895e3a6
change-id: 20250113-checkpatch-ignore-1096914844eb

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>

