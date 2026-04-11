Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330FB387585
	for <linux-doc@vger.kernel.org>; Sat, 11 Apr 2026 15:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775922794; cv=none; b=i2bwVJ6wMMAtcDpNHgZjK4ajWxisCAA3wiiSSligs0zNaWs3HKG38znY+mw8AHLHNHzXqRWMZxduHQnt2JDXIRM9PdQBh0OMk8VJoVyIFSZz2zddnHUmJPTh/ZejyDbUkeSQiFTMzHe5rcsFmwDCafPyD9I5esJavkJOIcz2rzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775922794; c=relaxed/simple;
	bh=szNahsDdzfRYyvO/aj3g8rbqKjZFkB5X0HvgChFPezQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNBbMkFp4w0OMRQ2As/QSScoKN90G1xAYRSkQDYOnEJiNpzBqqPaxZnBPfQaBH1E3zqQ+UbLTj0rWWr3j+wxvzscNN1Zem/PtJcwmGtoNeEgnyzcHEWn1iRK+fu4t/KpwyTj10RTGI9H+8GY9NY8JYgh2PmsXUCDfJYEF4QIWuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRpIU7yN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRpIU7yN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso2405698f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 11 Apr 2026 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775922791; x=1776527591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykIj77DYl2q5XauhI3fe9hKv77dgJXi8Oulhxw3fmt4=;
        b=GRpIU7yNHRMkr9/ofoU6IHOjA8cLCh8oDH6TFfX04AsVmAhc6uaVS+rU6vNLZ71JEI
         K1iLJqWOpu62qIVHBYj3Z4j1OZjDTs30zeZTbH8dD3j9bA3upWsGU4PGT3pp9w5BWRpj
         SYpoShQIJKiZo7GWNJSoM1+0CFFRJtOSK7WOh+aMN5Duf0BUIL/h1PiSMhocout2LHnb
         SNC8LZm3P8/2EXIvow2CR4UY049dneTjOGdnIDpqbuZTG/v2lKMnevEhMrIXgAuLDbaa
         vL75D5cgnYRUsgLlZ1y8+6IGSD1u+6JQJvApS9e+sTwQRvUht+BkXDhdGms5OLDTyqYH
         ByrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775922791; x=1776527591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykIj77DYl2q5XauhI3fe9hKv77dgJXi8Oulhxw3fmt4=;
        b=Sh1befgedpgFmFMYSsq8wpt41YeYbxs1GNYqWUTIJLjEofwshTUh0EKI0UkawWdEL+
         4TRNYDgPkozZZ/3nvjw3or8reJEvVp7pyzc0sk5Bq6BuU4oJPL6Vt9JbWXuHp2W/doK8
         +0dyhhETI3Yvj9MyIoPG63gy2T0seLKhmkgpKDdy+b3wPzY8cfNwD2VgY3/2Wxnljjjy
         KnE3NXPgjipJulS4rUvaIzQrryb8cnfP1J2mnUT70QDeWiwzMV7KceOj/+/rm220C8PQ
         7IDrkd/mcqAmQwywBVMl3hYQXpkKJv+oFnsX+1529Mkr3joX0naeDpqiw15UKCcmCVS/
         Ve+w==
X-Forwarded-Encrypted: i=1; AJvYcCVCOfqrFN+5Rz5nYJvqoSm3vOI2BL/zPiBDFRXTxhEylTZI+x4eFMY2HMNUWl+UF25IwcRDs9aITsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMqRB0ofbbOdbn3AMmk0y3ra0YVe43psnWqKXbgW+wgOLxs3t
	J4iyUIqHC/BIbdwVEEbAecLmps8015SIJdQ77fK2eWWgsCeFb+WDEWeP
X-Gm-Gg: AeBDiett2Zt+YwAMYLebEJxV8JRJzfSRfC6NyZiDao4kn1OXowFLqC4VQQ8r3Oey+6P
	zFJj5MUX016FKNqvD5XljmNo6Cc+UYsrKeZcsC4HzVEIN/i2M7MCzG8t0uPuzpeDePeY8pi5O8/
	Htq5+eyJM5LXB+ChbbsNJALsmESAQ+s4ovbthB9j4t692Vik3M1MHse8iun+VUB9yKYF2mAf/Na
	8I88QoWJQ4S34x3PYuV2C44HgHmIG4fDCQ3BU3X0jWoVpQpvQxEvEiDcnF4zGysccmXY9X1CmmU
	tlYgMqpenHVNEYq0LzxsRH1rPlXZUvm8WeA9lnVv5I/kciuh1mqpvcZznZ9HSw67GKHlRKEc2mo
	33LKW2fhcl479TCGGntL1EyMl26vzmmk6dlnr1QjOjbZWE6eqa9EBV49Q5OlFuaDpA75yckDL3C
	/QssS7AIV1IJ0nUZOjjGUYYIUV6f+QR4VOOlMj4HGTOkUWcDUqbqKyOeYaOtDDalgMi84gzNEUi
	O7cfHekjzy9HdJ25DI7GwDDNUyEN2TQS6zVvo4wFvnUigqVILXJmxlp30KbYKvu0vHk5ZEjhAix
	KpxCmA+yYedhjf+Czq8G6ss1KoP6cvEv
X-Received: by 2002:a5d:5f92:0:b0:43c:fd7e:72eb with SMTP id ffacd0b85a97d-43d642cd31emr10983362f8f.41.1775922791535;
        Sat, 11 Apr 2026 08:53:11 -0700 (PDT)
Received: from hsukr3.localdomain (dynamic-2a02-3100-a01c-4800-fd8b-e688-91b6-420a.310.pool.telefonica.de. [2a02:3100:a01c:4800:fd8b:e688:91b6:420a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46713sm17958153f8f.21.2026.04.11.08.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 08:53:11 -0700 (PDT)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Sukrut Heroorkar <hsukrut3@gmail.com>
Subject: [PATCH] Documentation: core-api: real-time: correct spelling
Date: Sat, 11 Apr 2026 17:51:19 +0200
Message-ID: <20260411155120.233357-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo "excpetion" with "exception".

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
 Documentation/core-api/real-time/architecture-porting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/real-time/architecture-porting.rst b/Documentation/core-api/real-time/architecture-porting.rst
index c90a426d8062..c9a39d708866 100644
--- a/Documentation/core-api/real-time/architecture-porting.rst
+++ b/Documentation/core-api/real-time/architecture-porting.rst
@@ -74,7 +74,7 @@ Exception handlers
   Enabling interrupts is especially important on PREEMPT_RT, where certain
   locks, such as spinlock_t, become sleepable. For example, handling an
   invalid opcode may result in sending a SIGILL signal to the user task. A
-  debug excpetion will send a SIGTRAP signal.
+  debug exception will send a SIGTRAP signal.
   In both cases, if the exception occurred in user space, it is safe to enable
   interrupts early. Sending a signal requires both interrupts and kernel
   preemption to be enabled.
-- 
2.43.0

