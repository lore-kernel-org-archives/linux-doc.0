Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01D2EA17D
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863379; cv=none; b=TgxsWsYzm86JkRMOY3/bn00P0LUjC5zLpCCsyocwqKm6tF8uINVWsVvzKNj1zTEYXX1OJ1JVmQZAk9bU3qTS37lMeA0GE3GS9b/5Z9NXK2wkMVWJnrMdrDixRiN8/2SUI561FiWoYiBa3CaBYpzYX9669hSBfHkdAKuha8nkV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863379; c=relaxed/simple;
	bh=CloW7FhMBhnWY7ih3iN8vM0ZFn5kYPF7XeKW8uvATJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfC7X4neATG3i6VKuXWt3DA9Ju3ZOtU5vTpli+7bd/OlLTMMMdvXvEwLeFgFQdHKUaVP89RBPg63r04M3YIdb/FmZrzDIar/KvSa1fMeN3P9h85TddDqBB0sNlO9dn9oSHfSLDZiogtZw0p0Al72JJh92Yh1qsdJVbpqbUjXYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4Ky9h9W; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4Ky9h9W"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so4073385a12.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 11:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863376; x=1760468176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMcgMtnQhy1DPy++ljFQ5B7lhaXeK21GW1cVMqM8xVY=;
        b=X4Ky9h9WDcNjF8cSIRN6d5b5X66n0vVJCtcNld6TIPkAjY5biZyMs08YBXlgo5b1a1
         /rc+1U85GP8WerYXsurZGjUBPJ1puo6fxY9HwXvroLUk9js2r/vv1UEICZFgLbDrtZbH
         gxeqJ8usCdp/AMuLjdTztUYmQjd2avCOP3HbXAEol6l1WV++JBnulZb+rEHXio4Zoy+q
         me++zmHBNitE7+nAkjEae1gHG7NEbenTHlZlNQX5twO4df2czDOM38bh/FzoT7Enk+9l
         3zJe2XX8g1pb46blmYti3VxLa6X5N9JaX/qvanXUXFwfA7o7A8rFNI4PEuYXPWh4aWkg
         I6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863376; x=1760468176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMcgMtnQhy1DPy++ljFQ5B7lhaXeK21GW1cVMqM8xVY=;
        b=cTzbgILa0cBYhMDRr5hmPstOhwZ9BEJtgLf9MF7iCPg4aktBnI2vYa5FtPZUjwXKOL
         17GfRfZ176okTMr7Wrl/YEZbM08/+/Ar0MqweTOR9yaELB7yD+Lvyg1ZgVX+n1dsuvOB
         zc/saYiqPUfU8vsp2RPzynusnrzUDj1o96BVAMUadiL6RUO8fi/BVNqqRm79i/WofbSN
         SpOFbqZU42uvxASWW+qUUQnOB8LfAL+0u0BkEHAx6xBw7jpw2ADC2pUNbmkDMx/ITh2K
         ax4Sgu/+DLs/lwFoZ1imeZxJ4j35ZwA4mS0JixdJs3tOSEQDhVEcS8+uYPHk9Td2IcuU
         Zklg==
X-Forwarded-Encrypted: i=1; AJvYcCWt1pY/PUb/bYAQn5FDGIcRgT6jxFjIBq7BBnX5mL//dyKm45AFM09NTULOay5P7yQTMAMKZO9skUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyviuZBEU83ypjDSWwhm97nCX9LjDSGlaoRaW4BilbnXfPvuhth
	F6N7hvrTz4Sca0zmvw5Me3sCat0KHNzWnw3CAOXrWvUtpvaQR+7JKCLg
X-Gm-Gg: ASbGncsSXGgc0mg7ZVK63s4QLihGUb6tr+rVaY/OWqCVKmCO1V4MGgzSSLQn5CxA8j2
	E6gMVxX0ke3IfMhmeUuRksEwFiIRI+e6Dopnt4I98d0gErqDWIUvInkht579wUa8cxfTYzAZdWz
	pCCFkeBgmHkwOcM5VHOOOCNKVzIhlLi1l74aj9sOMbNjR/sPuKq0xGPwUCIIkCtPDnfD9u3ZbDf
	+R+gbEdFuHmQgBAjz5PLvhYwPkfrmPnTx8xcq8pJDb44Ngc1CldLQUIH+QIR2WtOAdS5gW5syTz
	5udRcOwPLXAJax81WN3Al9crE/O+qZSaqzbqY970y3MWG9zZItapcNek29xzhUXl4sLyYSVTkwO
	wwow0nsT17tsU76hiKhPdKF6NrK4vK/aOoryPxKzSWIEJhgfqYuZVRifJmuD3e8ZDzw==
X-Google-Smtp-Source: AGHT+IFcXfO6RvhF3YXlYYvUUUIceGO4XmoS0wX/IMzMllJDL9x+dTFS2NyLyCwMy0EW7eslfVVevA==
X-Received: by 2002:a17:903:8cc:b0:27d:69cc:990 with SMTP id d9443c01a7336-29027402f43mr9430955ad.49.1759863376259;
        Tue, 07 Oct 2025 11:56:16 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:56:15 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	tglozar@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 8/8] Documentation/rtla: rename common_osnoise_options.rst
Date: Wed,  8 Oct 2025 00:24:57 +0530
Message-ID: <20251007185508.40908-9-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007185508.40908-1-krishnagopi487@gmail.com>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

common_osnoise_options.rst is intended to be included by other rtla
documents and is not meant to be built as a standalone document.

Rename common_osnoise_options.rst to common_osnoise_options.txt to
maintain consistency with other common_*.txt files and prevent Sphinx
from building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../{common_osnoise_options.rst => common_osnoise_options.txt}  | 0
 Documentation/tools/rtla/rtla-hwnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-osnoise-hist.rst                  | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst                   | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/tools/rtla/{common_osnoise_options.rst => common_osnoise_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_osnoise_options.rst b/Documentation/tools/rtla/common_osnoise_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_osnoise_options.rst
rename to Documentation/tools/rtla/common_osnoise_options.txt
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index 60a237de1e2d..26512b15fe7b 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -29,7 +29,7 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
 .. include:: common_top_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index 55616085275e..007521c865d9 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -24,7 +24,7 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
 .. include:: common_hist_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index 8a852949df21..6ccadae38945 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -26,7 +26,7 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
 .. include:: common_top_options.txt
 
-- 
2.43.0

