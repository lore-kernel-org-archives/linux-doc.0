Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0243B3886
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139234; cv=none; b=C4/ooYr4jIfqsd6U200kIjSIqNVrI+qczUwUYI52ZBhcDsLc3fZNVbVXrd9RsBv9VgsTPHd9xgV1fG4BekHnZxymbg7Htd50ASI/QjBjD7WHNBKG1mRtBmQmiUs6LFBK74//zgLLBdnCbFIPJgYmmDI44mpM2mfRCBo0BGnbHZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139234; c=relaxed/simple;
	bh=k57m5verdtW+cYAgqm+Bv50nz66tCGZeMDwC9+XvQNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PkvD744YiGPcc3WdQ8WYxXPy4+HPZkeSuGnpzGqfe0etvq5b/Zve29fWOxp/DfRKhY6gFtnJ+VieUsT8JuofFyFR2X6ODfanOgC+HiYxdiVRuxQ5nbNaxy75ZoNJgekFir85kzE2lDdcZUbBu1FjFzRd/EXDU6VBPOF9tiSCLrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XITzEaKM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XITzEaKM"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37c5dabff14so963330a91.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782139233; x=1782744033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=omh0azL6m04g0E+rxYjGBpdnggG9aKUZbb7rxFB1PDo=;
        b=XITzEaKM++DmlfzDFljP2OPeJ3hyDCwekBjDP8TVD5aIynNMJPS7fcyXz5nHkVjApP
         Sh63nJEzUBZEryXj2D4vYexihZ319hB30fN6goZvvnBcaL4gDWHtAW8OxkdwN79/S9k2
         wlBr9SMWVYLsOl3v6PGAVUTQy6RFHl70dv/mSP+SB51zc82x71/BGG8PSNXZGiooaoh1
         oYI09v+nofFcVXKdCfow7T7BUgLm8RiQFkA8Au/XeKVvpKaIFi4ov9aHhOBzZORIWAVP
         yxsT9w+dyB0FaxLwOP6BS6jl3SWzyp8q1kE0DwpbNeXXOYsGkurXwIPBPf9ozJYAIAXN
         9p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139233; x=1782744033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omh0azL6m04g0E+rxYjGBpdnggG9aKUZbb7rxFB1PDo=;
        b=YjsSQ6lHQTCzCUKSSGxYVkWPPWhbPOhLf9e5OUzPNqQ1RLDeifI+rmKrpR5boe8PXA
         9KjVChj+wovj4K28vVfa4TFQ69BZBH783sU4MPjKTQTADGMoJSrgR0BaPnMme+1GbbyV
         RLrAYjpFhQimHAR6Vr+2N/bSgZh5YENNnM77pr0tDVF25ZJHI1rjfJxHlsg0dw83ucij
         Bzc0e2vT4QK+HFY55E32XGMg/ZcnLOxl/LXs7xMZkwuKbT+nBeSv+JcpXNaqL5aXDwEL
         gk5G3MS76+SiDS4/jGrhAa00Gctk6j5c5nbCBJokBz6nR0iGb8UQq2KHmHT9g3v2RPis
         8sOg==
X-Forwarded-Encrypted: i=1; AFNElJ/AhYcdNVzk0PXvzdbvl5gzHu8/pNXo+vXsqiTF85RDOsGKOFRBt1uSf1tjUtdKQ5XY17wvI+c5nEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRUkKCsjUGewmCme0F3ShCGdf8Vybg9RvWxRgy5dqGAhDk53Q
	Dqjyud0JjzUb5oa0BJHJ1wMC8yXUAqnyrbzgWNeTUFAt0lq9D4HOhl0w
X-Gm-Gg: AfdE7cnThpwp1K4MI48CplXI84nDLnknUBhzoODWgRKo2lYN4P0ceznTjQThI5zAbpj
	KS+DGL947y2tHc04iRHYIBhAXL9xaF6bhzqADpNHlWaxLjCAT1xld/w5gAKiIkp4mvNUh/8+uxy
	0Hi7O57nWbiBbZgFStK/YtVkGT+Fpq9WJvQrgjQdt8TWuEu6BSAY5wQEhK7Ui3wA39GgHqfNyfb
	oAK1k4hq6FIe5i7/YGCVvS2nvaKfDpZBVaHbW/6SiPTaELlgWsJspIoSj5cG8bpKnfft/+O5qpr
	NrlObaC7BSwSfnZQYjtJVObuS8aYao+IpiDNMl4dBPiwK4Ix5K6ao0eGpt4ErIAqAYpXnAqrhvC
	NOmwOvmXanR6lv5jmCaDSurXeVUB6apptpKff3IGsWEM3Q6WDuHTdgE894KM4mSB0sYg3xrjK0H
	ecfaGVhLxwAqEf
X-Received: by 2002:a05:6a21:648b:b0:39b:8b59:4ec9 with SMTP id adf61e73a8af0-3bd0a8c52damr556803637.0.1782139232667;
        Mon, 22 Jun 2026 07:40:32 -0700 (PDT)
Received: from pop-os.. ([114.4.214.207])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bbffc2329sm7711940a12.0.2026.06.22.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:40:32 -0700 (PDT)
From: Yudistira Putra <pyudistira519@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yudistira Putra <pyudistira519@gmail.com>
Subject: [PATCH] Documentation: tracing: fix typo in events documentation
Date: Mon, 22 Jun 2026 10:37:35 -0400
Message-ID: <20260622143735.71778-1-pyudistira519@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in the tracing events documentation: "can by built up"
should be "can be built up".

Signed-off-by: Yudistira Putra <pyudistira519@gmail.com>
---
 Documentation/trace/events.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
index 18d112963dec..581f2260614b 100644
--- a/Documentation/trace/events.rst
+++ b/Documentation/trace/events.rst
@@ -1064,7 +1064,7 @@ correct command type, and a pointer to an event-specific run_command()
 callback that will be called to actually execute the event-specific
 command function.
 
-Once that's done, the command string can by built up by successive
+Once that's done, the command string can be built up by successive
 calls to argument-adding functions.
 
 To add a single argument, define and initialize a struct dynevent_arg
-- 
2.43.0

