Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA382D3A77
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888855; cv=none; b=IXwGDwwgEYN7hwteLopVPnFJxzPUIwGkDfWeixTwdO2Ii33tFd0UPI6uGvgaVmY5buAQ/ZhiKGKzwkTRd2Uzx9Px2/w5L9vfl2zGgNk5sIdbMIdECWAcy0CsRkRFefDyisufwrBsBL76n2P/++liFU5q34i/+Mwe6QKRI4a8/S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888855; c=relaxed/simple;
	bh=rBGsz3z70HxVZuu4fg9mGRBWOBFs75O+avxMCiBk6mk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4NYP/RQGUJxPNKqsK6SRS8RuB12gOqtDTJB60wt57EuEZ/LYVZVqrRamZAN1pRzrxzd6IeaTpHDvA4yAibu17meBxLDjDlHjvnfEsrhOwiL0BymK73lrjitCOOkP4gGgQ6ptPRK72Ym1RtndLLlOG7NlbZEiET+V70ftVCxyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6L6udVd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6L6udVd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d256c2e6so532494f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767888850; x=1768493650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmZ8p9rHmLqxQPWnPXAfkHNkg4U8b1nKCMYFf0YxG1s=;
        b=W6L6udVd2BZU3AAchVmtR2asK1fB8Fi8kXiWRGIF8kP1fc9fbaU0Otpp2CTZJmxAgB
         7GZAfJQSx9IEJpbY7cCPwtKtINJ9kZd/Cg327lU0an8/8AqpBwSDF1JpvDG5BRo0+kX/
         HN8xa69zVDki/F/dMgDphlBLw205vcXx6agyTJa6SCttaoHTuuv48I1agX7Efg8QbOY0
         y5hGbiVQG8W+1r0/pcmHDo2Q7LjRUBXedXLjpUvOPF74Drv0lihgWyltULpnEHpc3nty
         SqGDtYM7D2F3dpOfDhUZdLenv3FTk30jXT0/of6zQTgmsl+EqrFRfNcHfeffqIT1tABK
         JGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888850; x=1768493650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EmZ8p9rHmLqxQPWnPXAfkHNkg4U8b1nKCMYFf0YxG1s=;
        b=iDQBMffRWobGAJqS7wYmAv3uy6eHuZ49NteSTioGELrZH9OW8D8Dmw4sotpgxuNfSo
         g7fb2YCC2YtzxKH6FwlJsQz08AL2+RPLwgpIzVZGBvMutqloJuqKPZjoEoSeAlwRXGly
         tnFdzMwtP0mGWfk0wLkml+XtiWcMyUFm3hMa+9RGzQnxvppKymDC8ynf0xHK7DMZayWl
         gJHBkslNak/G/I51rRPb9Wc6GrepK3TlwpFReJI7UyPJFUOUQwSFv0o9KjIS/NdtjZog
         jXUrs9v03vJVzqB9oQItIfT/0hRBUSagz+QpUuMBUrgPlJ5GlCFbpG4goMYqJLqfly5B
         axxg==
X-Forwarded-Encrypted: i=1; AJvYcCUOeMzdlu/B82lAHihP1Wv3/OWdiD9GJscxb7tKJGGiG9E1iONVKMNTmcIscohQk0rpGc9av0ncK3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT1Nxp8qxsf5A4jODxSE7fQkg/vVqN8xfGJSB+Nd8+SOhUKtFc
	6yMFP9/Ia2hSqo9g4fPQHUIhg3jUtfiknk4dWFKpt3yD6ctsqtKHEtJZ
X-Gm-Gg: AY/fxX66/oBcOtCylP0OgrFOFXn8lBuB58LDJojlQSWpV4mjKGN2mp8DK7qPOdSk1Sr
	CyK4YvFK2+spxJpFKQQNT7dJT9dn5jIkzkqVwrXujM5kknPxz3y1j8O/X8TciaHWXUex8JDPSls
	FVZg8EWQBEhK1edn2JXpgnbUJm0JaZBvIBvXjKZNDlYnCkb+76FqW643IkJc2JpIuLB21Qer6/b
	veGQdhFv9+HKOQUcXXiYRjEbiZxH8IA2OYsaJww3sMYgLW/ENsElf0y+7v/y4g/R5cXiy/ZmaYj
	z4BM/s6gs4qBJKbtCsIO34qSruYqccDbUB+Tk36SyLGBgpz8FJjei0cAr0UfOIMkC+MOp8xe9GC
	SDWFZ/SwitjZtxOfx0Lfr/unf+Nmn5L9DaAnJ43HufPEu2LlKpslLvSMPh1yRoFvzdkJrusPc51
	kATUUpunGS93tMkmkSSiUIwy6n9N8j
X-Google-Smtp-Source: AGHT+IFhbo79/crYqwrrB0zcxm/OK+WiMzLgjTkKmEaXHdfirGSsTvn6KlFnIEfCu0jLNNfmokXI/g==
X-Received: by 2002:a5d:584c:0:b0:42f:9f4d:a4b2 with SMTP id ffacd0b85a97d-432c3775a07mr8525845f8f.19.1767888850012;
        Thu, 08 Jan 2026 08:14:10 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:8115:84ef:f979:bd53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17140039f8f.29.2026.01.08.08.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:14:09 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	Gal Pressman <gal@nvidia.com>,
	Jan Stancek <jstancek@redhat.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ruben Wauters <rubenru09@aol.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v2 07/13] tools: ynl: fix logic errors reported by pylint
Date: Thu,  8 Jan 2026 16:13:33 +0000
Message-ID: <20260108161339.29166-8-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108161339.29166-1-donald.hunter@gmail.com>
References: <20260108161339.29166-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following logic errors:

tools/net/ynl/pyynl/lib/nlspec.py:299:15: E1101: Instance of 'list' has no
'items' member (no-member)

tools/net/ynl/pyynl/lib/nlspec.py:580:22: E0606: Possibly using variable 'op'
before assignment (possibly-used-before-assignment)

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/lib/nlspec.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/net/ynl/pyynl/lib/nlspec.py b/tools/net/ynl/pyynl/lib/nlspec.py
index 0b5277082b38..fcffeb5b7ba3 100644
--- a/tools/net/ynl/pyynl/lib/nlspec.py
+++ b/tools/net/ynl/pyynl/lib/nlspec.py
@@ -295,7 +295,7 @@ class SpecStruct(SpecElement):
         yield from self.members
 
     def items(self):
-        return self.members.items()
+        return self.members
 
 
 class SpecSubMessage(SpecElement):
@@ -570,12 +570,11 @@ class SpecFamily(SpecElement):
                 skip |= bool(exclude.match(elem['name']))
             if not skip:
                 op = self.new_operation(elem, req_val, rsp_val)
+                self.msgs[op.name] = op
 
             req_val = req_val_next
             rsp_val = rsp_val_next
 
-            self.msgs[op.name] = op
-
     def find_operation(self, name):
         """
         For a given operation name, find and return operation spec.
-- 
2.52.0

