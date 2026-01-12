Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B0035FF70
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232121; cv=none; b=tccmSvdjEfC360XtIN3lUtOCd3EKhmo1WRlnC0GLC56vcfFRHKTHHu/gI6wY7hF4Qhu7YBeXm/UNilsmm2o93skkO5OskuSNtoVWHApWI4UaLgqGTGV7gWupomN9WWjl06MhUahthe5t+qH0COIsZ6Uh7xdSrXGzfAs/l5/n6H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232121; c=relaxed/simple;
	bh=CqkrBbQJARC77HViTJ7Fw835RSSe59j00Y/6Yal3gVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fVSOBW3WM0ktYow+pqP+XGWg02V535NBhy8gVqwmJYrgslvHsogDqfze9Q9TJ/k+q1uAP5+HYa8yVFG0Nohg4AYLEpt9eodmASNyOEZLmHDfzON8m8LAUMJsgFGJDS+KK4W9bEdMMMm10HEoUPTCsOo/dwe/EyaV7umyxURICdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9n0X+7Q; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9n0X+7Q"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-432d28870ddso2313516f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 07:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768232118; x=1768836918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bisDuv4nPIuBAuwZ3nv0ukh31CRRL1f/LFbl87ZPJiM=;
        b=D9n0X+7QWT8DaUBECRPZFql2/dw1VTf8WiXIdYwrvAqtKEL/DOi2N6oXE7P/u5K6MM
         Kml8FbKjx05yrg8GbLcH6gH5mMKEeZQH+ww/hUgeeueG0kyhyjHcXFCW51B3lZ223PX5
         iYGBF6lWvo197Uw8CRni2C9jMPerPEn8ebrrbdtlehZKIoCpd6qDNvKyiKh/gN5ccIeg
         pPOoJC+1qr3Ld6TsSSfLBHS0FoGTnG3w7nQv9MWabMicebP6XgojgbB70Zqsws08TYdp
         EKqZb0pvCcWuJjJSvp6XGTcdZ8V27izgbvxETc0mlRMzHBXxhAMc7ABkgnQcZbk3q8dy
         IEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232118; x=1768836918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bisDuv4nPIuBAuwZ3nv0ukh31CRRL1f/LFbl87ZPJiM=;
        b=A7jHlSkMzkjg9P/nkVPkzqWyKCYEo/Cfg8Gs8XT2RgeBida9OCWHBq+Vf6i25VeMlO
         ozd8IjU9YrvG8+KJ/X4aR2zWP/L1zQ6DkxXYs9hmRmxsbIhpXtqRvA+0Z09aoxpf5Mle
         pKOm4EOgsLhvuQm2Epin3gj/quUl85RFK4zfDFArIx05hgcYooosTcdHkC9JufPGL1GJ
         7l1Kqdi4as0txi5PaXIt/R7WWfiVIH/3HxB2aHDfm9WEd0ZDIz0LlmV+pQ3+JFjQEBEf
         jotDuAEEG/WOzQdKKd32T10gV7HLWr/o527RZsEwTSk5uQO/JfvqYpceqVI3N5cmb6f/
         NHkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZLlakTD2YREfPVKG6L5N+A1lXj/o5cRhVTbWWtdzkKGxU69prbJf1fEdv8nqypBPlG9kVW/Q4G8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHvpZQPZ6lsXbzIu5q7Wkmmaif1SyOFXIP0tHpVlTENGydKSY
	loDcvY8JJXeJ5eebw1guuxEnubt7SOCiic1Eff2LoQe4LhW2GIMtL/0Q
X-Gm-Gg: AY/fxX4GFimUUl6B2e3kANC4G4/ctUtOS68OgRwfDcfVnKby/gnXlpjnnZpC95kGSev
	t59tHGaX6K/4hQL6sR7hdHUHxfR4tawzjOj+VDgKEHl9O4g6o4BSfh1Xkzvgp64Dyun2vr71Q3a
	meQfhmTaOwCAxqj+NYcspez+nu1zx00wRZitqz9bWokQ7d7/HB/eJ+aOMnvEJ3TURHHewjC3mXQ
	3f4y0xfbjrWY5XbDNAJ2Zk7WaFQxG0/9NsLQcAqvwsH9Y8e72dmZI8UOWHMWZYuH9UtsWN0sHHW
	JjbJ2+FNNJ3rxhRKQcrPX09LU1WWuNZ8bg9WkruqJ88IAwCsBFUZdJzEwIrbgEtyJ2W03yFmlqh
	VKUnEhsSP/0DMZnPK9A/bavGKF3k+bNa67GU9vZksQufTOCT/3A+O4yxo6q8TN6G8rxd7ukXx35
	BD4m5+LMf1EdNbRH4vPe+gbMDZC/Di0I7LAg==
X-Google-Smtp-Source: AGHT+IFkionbBPxAVMu1Bo9fnGCSD/FhMiTLzbgpT1ra0OiOGliqUo8UWo/OByWQL36OmxlkAVQrNQ==
X-Received: by 2002:a5d:64e7:0:b0:430:f7ae:af3c with SMTP id ffacd0b85a97d-432c374fc2dmr21802974f8f.31.1768232118128;
        Mon, 12 Jan 2026 07:35:18 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:c1a8:6cc9:af79:502a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm41592789f8f.24.2026.01.12.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 07:35:17 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Donald Hunter <donhunte@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net v1] tools: ynl: render event op docs correctly
Date: Mon, 12 Jan 2026 15:34:36 +0000
Message-ID: <20260112153436.75495-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The docs for YNL event ops currently render raw python structs. For
example in:

https://docs.kernel.org/netlink/specs/ethtool.html#cable-test-ntf

  event: {‘attributes’: [‘header’, ‘status’, ‘nest’], ‘__lineno__’: 2385}

Handle event ops correctly and render their op attributes:

  event: attributes: [header, status]

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/lib/doc_generator.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/net/ynl/pyynl/lib/doc_generator.py b/tools/net/ynl/pyynl/lib/doc_generator.py
index 3a16b8eb01ca..8b922d8f89e8 100644
--- a/tools/net/ynl/pyynl/lib/doc_generator.py
+++ b/tools/net/ynl/pyynl/lib/doc_generator.py
@@ -166,13 +166,13 @@ class YnlDocGenerator:
                 continue
             lines.append(self.fmt.rst_paragraph(self.fmt.bold(key), level + 1))
             if key in ['request', 'reply']:
-                lines.append(self.parse_do_attributes(do_dict[key], level + 1) + "\n")
+                lines.append(self.parse_op_attributes(do_dict[key], level + 1) + "\n")
             else:
                 lines.append(self.fmt.headroom(level + 2) + do_dict[key] + "\n")
 
         return "\n".join(lines)
 
-    def parse_do_attributes(self, attrs: Dict[str, Any], level: int = 0) -> str:
+    def parse_op_attributes(self, attrs: Dict[str, Any], level: int = 0) -> str:
         """Parse 'attributes' section"""
         if "attributes" not in attrs:
             return ""
@@ -184,7 +184,7 @@ class YnlDocGenerator:
 
     def parse_operations(self, operations: List[Dict[str, Any]], namespace: str) -> str:
         """Parse operations block"""
-        preprocessed = ["name", "doc", "title", "do", "dump", "flags"]
+        preprocessed = ["name", "doc", "title", "do", "dump", "flags", "event"]
         linkable = ["fixed-header", "attribute-set"]
         lines = []
 
@@ -217,6 +217,9 @@ class YnlDocGenerator:
             if "dump" in operation:
                 lines.append(self.fmt.rst_paragraph(":dump:", 0))
                 lines.append(self.parse_do(operation["dump"], 0))
+            if "event" in operation:
+                lines.append(self.fmt.rst_paragraph(":event:", 0))
+                lines.append(self.parse_op_attributes(operation["event"], 0))
 
             # New line after fields
             lines.append("\n")
-- 
2.52.0

