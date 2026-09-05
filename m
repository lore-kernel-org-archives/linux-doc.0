Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05603403E1
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598489; cv=none; b=Z467PcrI9gfRKUFhIjdTNwjwww3bAByfbPKsz66ow4EUhb+HLJ1HEOi79ofLeUAZbJKXaziY8U/mrFay6lDlY9rQ5T5NtU+LPvPOlT5l7jB5RlV2dXSL+cqgO3ayYruSIcZ3xbyCYKDdg33922ijneofNdAtKBU5DEqXlwupxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598489; c=relaxed/simple;
	bh=AzS8kxUPhvFUTkrXrorT2U2YAmKfAWnJ+Ks1vmHgAIw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nnee5qjEXhSW81242zheK2Cyi5XX6WacohTyVTNpfRAOOa+MOkfkSaQAfXErYCee//xfWpRsWWVNJorAgZ086jfTOSr4pXTfhmSuDkujAs9zh4T5kWkh6kZDt5wnd3mhaU/QAOlpWzzAyW9HUcWmF0FZcvRbJQN4fEwf7a5dDeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/p36OVu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/p36OVu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1207962f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598484; x=1789203284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFhwSRfGah5Spb5nDUFBQpIZn8bFCwRbrb5DbdOXQJA=;
        b=l/p36OVu+xiKsejefLefKTGPHfql2WSJPT7d9Cdmb0s8nWSX32ieJAT1VfSrSiAmUt
         4C1lhpVPBZXnFKXLsiluqU1ebA40KaQJizEsCock5aHTsVmbGeKN5uyLEGJq+e1/B5bp
         TwIXum8FRQ8Lq0xnhYJV4NYiqXGygyOCB2eUvEwTIuEWOpGiZVUAaLGBz1vTOolHSkzk
         gl1rmp/fH6dLS9vlhckQmr8fHKx3hvqXoaIK0WaA+YPXpVEK5poytxTvhuI07dqFBjP0
         leIP/fGcloQOhSxB1C7K/S8C/BpfaERXepdGPk+XgMBbao6HAO6cvNPmXVKHzUk70huT
         xBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598484; x=1789203284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFhwSRfGah5Spb5nDUFBQpIZn8bFCwRbrb5DbdOXQJA=;
        b=NgPc58ZNdv8tLIEivvu3FqrwxrkKUKNh+2ShqmXVIlf+IFHyScejItbVPZbrFV4mEC
         gfhvhoUFIp9WWY8xTfO3AP6vFA6DPqlmbJ0BZsNralEeYkgL7PAjHSsZHS6dnLVCLS+e
         vIi0HLJ44uEUupbUHq6qhKtCU1PGysTGz0256u22IoJlpKdcvtfsvUBKSisJ/zH49LH8
         3bU5XlUiV3+JTJmAvR+Oyoe8ef1zIe/RuoOxlSOaM2t8gpmCoMCTJLL+QNXdMC9uxr1V
         B2MsfOqE6D02wuHB0DDsqbkO5eP1gW0g81VMrnHsv1D0BJhgV71uMEPENFwqHZ5ZNgNv
         Uw3w==
X-Forwarded-Encrypted: i=1; AKwUvByxA1y6RNgipnJSfirnYmGJ6Hhg09PyTrKrrJQjQPdCaY6N9+svIozi4eVZUsy32kwk7KLTl7r59eA=@vger.kernel.org
X-Gm-Message-State: AFuF++nj/YjPOK/aN2qRCqc9m/CG8Qu7KbAEUBZod7zGDMUu5n3qW4nI
	HmWcwSy7QuWIrfDO0yh2dyeSe2QzFvZ94E73ump56BXFwI6gGbMnCrxs
X-Gm-Gg: AYBFou1ZqnBJdhToWGfan8fxMXWtgEe5TRUwhA7H9F0rC0zo1Qr+nKGvkEZ1R83m8td
	1QbQBVZ2U6ee9yukomulPmghiVc4dntvNIj9opwAjk/OWlDa9kyuaUipT8VifMT5P3TTHtGejFg
	Nfbu0+hG5ylHGmzLwjzC4KAYYSTz2+VESqdUkOLGVTlfuxYKobynHShV+K0633GqX0I1LusSuEC
	66OMyXHhqrdwtPPBVZx+Zi7oOlGT4zTEBr4DEVvMN3IlnVsf4tCbdWsLCvcCLoP7cbKckmSBms7
	Ba8pnigZQckYNKiy3FkI0S7Srohx/UCKBtUZZodabTxZNOJwVHrJv9NKBYHdc13+44oxO/G8pxC
	MOMMdVF1S41+xPm4ERSVR5hv3CeYNLP2viEZKWrPnd7tGnwklHr5/Gv44dcLh8iSAVF9baEYot6
	LDJb8POQCw3KELC4KQt1/LXCQtf0igMvthnWUvdfQJhdZqVaVHYyqlAsv+RMzMC/9yIEzxdAokf
	alFuD0RgUy0noP1kRhL6Xjvcju9bZEOvPytwZJiIeHxQP1htbJEa/6li49ZaL2Or4onvilFnJrD
	M3Mu1mb1WL0FxfqEb60gT3ExohDI74B73aBMTduLFy1oq/wkjW/0F0P1kN0MGKyURGs=
X-Received: by 2002:a05:6000:186b:b0:485:8c16:a35b with SMTP id ffacd0b85a97d-4858c16a72bmr10150423f8f.51.1788598484139;
        Sat, 05 Sep 2026 01:54:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm9407165f8f.3.2026.09.05.01.54.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:54:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	live-patching@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: livepatch: Point klp_callbacks kernel-doc at livepatch_external.h
Date: Sat,  5 Sep 2026 10:54:38 +0200
Message-Id: <20260905085438.40349-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

api.rst asks include/linux/livepatch.h for struct klp_callbacks.
Commit dd590d4d57eb ("objtool/klp: Introduce klp diff subcommand for
diffing object files") moved the structure and its kernel-doc comment
to include/linux/livepatch_external.h. Since then the Object Types
section renders the other four structures but not klp_callbacks.

Add a directive for the new header.

Fixes: dd590d4d57eb ("objtool/klp: Introduce klp diff subcommand for diffing object files")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/livepatch/api.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/livepatch/api.rst b/Documentation/livepatch/api.rst
index 78944b63d74b..2a98c517da9d 100644
--- a/Documentation/livepatch/api.rst
+++ b/Documentation/livepatch/api.rst
@@ -27,4 +27,7 @@ Object Types
 ============
 
 .. kernel-doc:: include/linux/livepatch.h
-   :identifiers: klp_patch klp_object klp_func klp_callbacks klp_state
+   :identifiers: klp_patch klp_object klp_func klp_state
+
+.. kernel-doc:: include/linux/livepatch_external.h
+   :identifiers: klp_callbacks
-- 
2.53.0

