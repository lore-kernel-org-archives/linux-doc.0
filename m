Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B6713FEE
	for <linux-doc@vger.kernel.org>; Sat,  3 Jan 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767460812; cv=none; b=YGAYWDIPkhmYDrVV1QR0PA0PIU0Fc2M+WsMClmtA8CdQGFW+ue733LJfCAVBG6pUwqYeyJTw+gfbVrrUDdaOk0Xtyj6REPU1T2MTWPPsMIPtt9Xt2I0A4nQWqQFzH0eSSEfsEoJOX1Cu8oUo2xyFN+dHPI8raXpXG5OLiRfOTGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767460812; c=relaxed/simple;
	bh=OOoC5a2qWDukvD9Q9IgZaI0jHdlfR7ROhfQhC4czC1k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JfuZgpL9AIbqR4yULijhrkyR1wIx1atH0EpnVZuvu+ZghQU4eD6w0ZkLgsog/seqGwhDSpmnxvuDBGE1yekciaqlan4Miibojp+ca9jYpihe12Lr/cvDWSdf/HTzyHmTHds36qtbVOK2uWL2h8xhHVCoPtAa3UcsQCCPwafPbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CejCUY+t; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CejCUY+t"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0a8c2e822so33779305ad.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Jan 2026 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767460810; x=1768065610; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHj8EFboTfNxjqt2lCppeckAIkNTqozct8ViOApmGho=;
        b=CejCUY+tBR0I3TKbiaze5Qjl9el1jd8WvTEI3gLOtbwpnYMfA0wBvf0InGk/JhZn7Z
         5REWQnOp0pikCd5GJLFm3q7H3NTKq/MN3w8DBAMrMhypbfsn95abh2Hf+ao2swP+0PHJ
         /zuT+ZEojT44n/o3pfkA50uHNKP3Hr8uTZOeWCslLR3xfRAmzgExXOnHiQPL5wsxYcWT
         tsX89wK8sdR1lyWrlNsjyJVvRRuW3O9tncGD2hjkLgYZMYixmLvrpJUvRVRPa6p6iRCA
         75RGfPNEuguowy/p9Oe9he5nuv9fFsV5EKU1r4GEFsMgQmZKdgoffD+2+97dYBDXhmhw
         iPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767460810; x=1768065610;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHj8EFboTfNxjqt2lCppeckAIkNTqozct8ViOApmGho=;
        b=mS5/0f/UhV15tPIxUrJ0vyqs6AKGRTFGCfr+pRqTKxcO9jeBgNqsZ7gF5zLtGkWlZp
         kLTiQ6s1cJdoIX8LtHWmJVQZCtTlHLdabDllB7rXUtbrZoJYJzLc7SFD53DCMM8hupSW
         5LSvMV9HidRCKe8jVZS4nEdsw64jAx36fgEhLUzMYXgELL7x5TytqnfwBz29/ak10tPq
         DNA3BHMolXzNeqOiyufwihPBq45YbDKdy0p2VokPxUuNsCxZz09Ji8C9tgYtWkZMNGqq
         J0OdcMSS2UfRMnQcJ+8j0FqsS0aVTmj9P3th4TKMAOGGvurrA5pQ5HTpzOe5MfcWYL9W
         1Rfg==
X-Gm-Message-State: AOJu0Yxej27pSFOoVNFFfWCRAdINFl4ioptdb4KmL4iXeYDDWyo8Pb6h
	hY56bQsSKwPbFED69n4GIX3XEEnfy8LlvX+PPnvNWxqHQdhPVSX0zbpu
X-Gm-Gg: AY/fxX4qL78/qsZprbxbhHWpt+1jL0JntYng6McAI2E7aBnwtPjAavHAyupUcKQUPca
	J81Rw3sdcwOUycbofyALEdY8LQrK8S247fEB/aLrfxdMzIh0BiFGACvOdhbB/SU+GhRV4zl48Eu
	v2AsOBdVEiwwyykembC8sCP91hpLHv6V107iTGvkDeG9/eulEKgFVyvGUD4DlRknN6C5b6wDmsv
	bk4eTjr9hNFrDUzMiSjMPiRoABhK0HlvG15D0WdHIbC8EPTs2h54COts8JRzzUeOBSmvQvfGwPZ
	mdBaEV+r38T3QA5MqXxTjORFlRgq/WYP4BbiSFGoJBEu/CwW5JndC0qL7Gzt8+fxFWewVUnjokr
	rXruz3vdJILE3SmdGFNFC1whBobN8isxVhb2vj5BB07Rg5cdxbo5gVNhZKQ61Oou2FwwLHBA35B
	j4cgVVl8Sx4BRPGn50oA0=
X-Google-Smtp-Source: AGHT+IFOmJAP6pq1zhwL+3D/DZsfdHGGyJKcmTKpzzyzmhjbb+gnSpGjeJn0WEA9KJ6f4qNtMnW4eQ==
X-Received: by 2002:a05:6a20:cfa6:b0:342:1aab:4c79 with SMTP id adf61e73a8af0-376ababa3c1mr28890913637.3.1767460810296;
        Sat, 03 Jan 2026 09:20:10 -0800 (PST)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c62637bsm38318087a12.30.2026.01.03.09.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 09:20:09 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
Subject: [PATCH 0/2] docs/ja_JP: fixes in howto.rst translation
Date: Sun, 04 Jan 2026 02:19:37 +0900
Message-Id: <20260104-ja-howto-v1-0-53e5564a47d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwMT3axE3Yz88pJ8XYO01CTTFHMLk8RkIyWg8oKi1LTMCrBR0bG1tQA
 tg2L5WgAAAA==
X-Change-ID: 20260104-ja-howto-0feb5d784ac2
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.2

This series contains two small fixes to the Japanese translation of
Documentation/translations/ja_JP/process/howto.rst ("HOWTO do Linux kernel
development").

Patch 1/2 fixes obvious typos and duplicated phrases.
Patch 2/2 fixes the translation of "freestanding C environment", which
previously implied that the kernel is independent of the C language.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
Masaharu Noguchi (2):
      docs/ja_JP: fix typos and duplicated phrases in kernel development guide
      docs/ja_JP: fix translation of freestanding C environment

 Documentation/translations/ja_JP/process/howto.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
change-id: 20260104-ja-howto-0feb5d784ac2

Best regards,
-- 
Masaharu Noguchi <nogunix@gmail.com>

