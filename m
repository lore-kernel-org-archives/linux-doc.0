Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B514B2DE70B
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001350; cv=none; b=LAd50BVDzRb4GmFQfaV4Rwg4TQsGYPP0tc1qWceF4p6ALGLzMeQMMEcatbN2A1W++TIqqkDo8VWNNJPlotbrS+W6mMl7/H2nqpd0/jiMFIUZkkgaLUw9YbPWMCsIzfG0cVaUNa4P5x20+irQQkMi9WXHfeGxs5rb5c1OEioDjSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001350; c=relaxed/simple;
	bh=GCQf+fSlRoXWlrGzxejOS59aSKVCoeuvh+mZuQCTo+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RaGi4foO53RoMa1RX5AyAT2iO48dxq0EBvCUCHcTEI/IhmwzwzTJxpcKbZjCM15nqF+MKwgBJnh/fod6ir6Naopf3CFzm/WsrkpkksSW5HoySUd9GFkq5HCCAOeGT8R0ah77Lw7jusBFl3TMmtCP1wFurHEEMNPisVoZLBhRO1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SM/fyGzH; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SM/fyGzH"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b54a74f9150so3369449a12.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 22:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758001348; x=1758606148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JEHaZ9jq/KrcjOhCPcE4D4fEK4s5Ukw4ZA9TW8oNXo=;
        b=SM/fyGzHXgmiYo8u4kQIBGF1zOunDjnHlB0OV1kto4pyb22PEh3TdeSjIBESE6lGGu
         KmtDez5WmcpwM6PL44HzTq7GcvBZNShAxgKpT+/siSPbxmH+AmF+mX9B9hoeKmHL9kKQ
         rjCEn6OSXkvHWCZoqnq/U8gCy3inXT8GkRB02vrMPMIYnwnYpvpuhICILA66JAmjiDxV
         AS8nwuAIEeKnHJBJh14O4J2dusk/UJ9Osy1lf/UlQWz+ohe/xw58zdrEP4m3mvwjaiF1
         O6fNHfNGGY1jLuJBGzMLAN/p7qKvLphEaSlnWYaHKzv6mzPe18QLm6/W+7w/ggC+Hy7c
         Vd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001348; x=1758606148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JEHaZ9jq/KrcjOhCPcE4D4fEK4s5Ukw4ZA9TW8oNXo=;
        b=JOQw3vRw5mK0f5MmG9QAztNh6ru95QNBUG9tTcCIk3iPNjt0ZI4jdEwpFZpSSxjw5m
         uwUAkh4dWjjz9Avhdw2+/3Fx1g96hx4oPN3BdtRYSmXTFAsTXfcSwXDkDNpdhg4GkkXK
         DhIVaRhX7meUmGZtEVjj14LC+ZIgPisz1To64oOXUuzJiuNiTuaxjkEC8OvQqeH/eGrC
         4wmqFeIg/QvoCKYaegEzl6fstHYUkrB+lru7k5kmohMEjyY5qt1sFCQRcsFNaH1bKS+z
         Tlb+t31Nb3/FFs139klawSnKldJ/ibKrm2XIq3CwcBNM3CIlbEwMvTXCQUXYqXG9BBM2
         8gMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdmdcSNxVs6+dJ+xuHO5gcD/nncISwF/RHCnP3dFFgMUmHm5Y5fUvxVsqVFL4U+izX7s2x/wyKKXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHpa0rDc5rftH2A0cfpJM4Sv0FWhQLbuf8vArySx+h4C72iWP
	kdgpk6fkUIdNyuq2hwoWMKmWmK5N8DfHtKgOVh/naxYXy9+xH4spt7UW
X-Gm-Gg: ASbGncuMUKhJQijtdck7dT4tDcVVvaPvuWfT7aGUfPM8/JWVDAjsegLjWYgj8vEE2wH
	e5hAkjRdnaSKMyp3tf7b888vfN5k5HA8diwfDqWr7zV4hBt4unUNTMxIg8OeeuUgYN8oGfrWot1
	gXgfmwxsr3p6d3aBr/hlAU6D0AgyN7Bw1bVRS8QQbzXiJaFKC0QJiS7yvr9bamVBNzjrdfy7zUF
	pYN88YJtNZMHNCeylOzl0zdmok0nmRJB5oaMe1uWiUCP15H8Xvxmj3ZywA8WEyRUacdT1khfb90
	u8GVIfj8OxGHd5N1hSfLknqOx6GYM0RKvRLAOgSWEY+75s7n5ArNFg1sYhtJSX51nl2VztxuWsF
	F+uJmjCizJYbv4RAjvh3l75gKCw==
X-Google-Smtp-Source: AGHT+IH2awkKQxguyzU/uwVtBqGOg3ZGaTcFUil9iVYCCLUicJLX7MvepKfcuJU+DXVC/gjlgfE9Zg==
X-Received: by 2002:a05:6a20:14a4:b0:262:1611:6528 with SMTP id adf61e73a8af0-2621611681cmr9714164637.29.1758001347998;
        Mon, 15 Sep 2025 22:42:27 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32df315f9dfsm11822877a91.21.2025.09.15.22.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 22:42:26 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 97AF54227237; Tue, 16 Sep 2025 12:42:19 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tom Zanussi <zanussi@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 5/5] Documentation: trace: histogram: Convert ftrace docs cross-reference
Date: Tue, 16 Sep 2025 12:42:03 +0700
Message-ID: <20250916054202.582074-7-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916054202.582074-2-bagasdotme@gmail.com>
References: <20250916054202.582074-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=bagasdotme@gmail.com; h=from:subject; bh=GCQf+fSlRoXWlrGzxejOS59aSKVCoeuvh+mZuQCTo+Y=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBknfpizHYkUTnk/IZ7D/nWJo3ycU5jjTR1Oo+W3/Tp9z j8UXlTUUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIsYMDI8rDyau8S8y1QvPens nXDVtwE2C3yYpl3XeLa3RdbnqPM1hv8FL6a/O23a1cgSsatpmhBnYYbvEf1Eb7f1mX+0951auIQ dAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

In brief "Extended error information" section, details on error
condition is referred to ftrace docs, which is written in :file:
directive instead of a proper cross-reference. Convert it.

Reviewed-by: Tom Zanussi <zanussi@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/trace/histogram.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index d158dadaa42447..340bcb5099e7a4 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -209,8 +209,8 @@ Documentation written by Tom Zanussi
 
   For some error conditions encountered when invoking a hist trigger
   command, extended error information is available via the
-  tracing/error_log file.  See Error Conditions in
-  :file:`Documentation/trace/ftrace.rst` for details.
+  tracing/error_log file.  See "Error conditions" section in
+  Documentation/trace/ftrace.rst for details.
 
 2.3. 'hist' trigger examples
 ----------------------------
-- 
An old man doll... just what I always wanted! - Clara

