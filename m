Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC345A295
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604895; cv=none; b=XSAHiHOsBGrzZa6pL8rrHke9STPtF1i+/oZkq4v4lPgFvUnBdfsUWU5Jc1vjMsCTlc2jHL6AQF7U9bn81U6X+1L3aPjr9qBkpaRW30mneSc9elPu3J1E+ZwbEQdRRTZXy1Ny9oaq3CEFQ2tzGFeW/darqscjOYTQT3xEtfN++Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604895; c=relaxed/simple;
	bh=lK6SylEY4LAQZljQVEJN4LwYrq5OYAYHrr5rGGnYhXE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dGGChBfcndDdgpKfYGbVZxKxVLgDfS95X3ue9GHym017fNMA8DbXipy6guXI8uH8nBlViyMDDGSDDMhdJDviX3twV0C3rK29xx9KOXqWAHWrRZak1FznJqk0EdaAPNqiccIXpd+o3x8gpDITsK6XjEsbROzLuAIV8lGr/w3gFN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbZdrZJN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbZdrZJN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so1896005e9.2
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 03:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604889; x=1789209689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jxq0uSbWX1tJusqk7o1sA3mVysrnqKqxAe3TJjvp4t4=;
        b=ZbZdrZJNtU1Ua2LMgPCwpjpisRBcH4qHFB7GIZYEypIlrxFQ5GM/I4/SB8hjdfOY2W
         3oin8dF29iy5doVadsw+iovnNBRz1gO9uqt5iuP3xF2wd0gTNy5CBlNsjYQKkJHbrIev
         6owPGdcI5PxHhYrMsmYJMAWEdgwUaorAw5tavGebO34Z82SS/W5hUIbHneemvCUlneN1
         s1DJ8P3i32SCACZQRTiq4TYbrPJXuohqJjJxlEmWuHMBZMS8NLajp/bTchHHcKNkDIAt
         pl4Kki3ukvKPfEyiBoUihaU5WGHvtl6kZym1JZFBm38hk50wFNVHZRptE6ntAA2TD6qe
         jzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604889; x=1789209689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxq0uSbWX1tJusqk7o1sA3mVysrnqKqxAe3TJjvp4t4=;
        b=fLoqS4CmPBnrjNYrPjGeIvHknsGA1o7Ru9kLJwkV458t6vY+OL6My5PvyDTxhpdiZf
         HOTj4PDIA8uZKwM3w0CKIExlTbqaESe84t/LExMu9TuBgJaXfq/gBNjnR145B6nmLec1
         jzFytySUiiFTCP/Yd2l9dYizTsrSEJB3Z/wOSHXCGyLiNSYbm8qo4mevvx/2JbGQ4LCk
         /woJWDRLK1SylFHhvFEYbECRMGmrgj1oW4enCwGVaRYUor5BHVCJP0c0J3giKf7hXOWy
         ka75E6GLHwikpwYWBAa83TtD5j65KiCKJ2XhaUQkwGtFGYI2Mg90aZEHMkI7Q1A2+18A
         0pxA==
X-Forwarded-Encrypted: i=1; AKwUvBwWUn27yjSU6kJrfsrfRD1EdZkpFWn9UFf5tWMl1JZttMZW5BPQrpVi/QHSOC5UtH28tmXinW9sBQo=@vger.kernel.org
X-Gm-Message-State: AFuF++k1BrIiVv1PxcJLx6JjcspNckboBUAJi7z0UvLlPzB9bKmyw67H
	vUM0QxiD+KWotvGYg+OS2Jk03B1y39AgqTyiuTW8s2uaayGUVYlmO7YU
X-Gm-Gg: AYBFou2UJ59Vke3NTq4Q/dijwPSMXNw9JCSslDOc1SoGOrQKosatdMqJ+EgqWi065g/
	Cv0hCnDYpoeLx5aLYv1PdSLPuxayVai45tZ1b5IvQsOxrtIRgnaqIB3b14lb506/11H5SpWgsgm
	6fQ2b9KRf1SQA6czqTgjBykZWuMPQYh3ViN4cgeqioU5wNNG/wUK6LSumVEHeD0gzXFuyVokGz2
	maPOqfEX44plFgxheHgpG0JcBXbP7MPGmdZzSnNt95H2jTV63uM3485+i2EgYEBRDq5tYoQHSDb
	MkUaeMF7jk1xbxiv+K342aKDQbKqvDWpZAih6m8pfW3VqUoiFWl/XHdIhNYi6RPwk5ItT/iVgTJ
	LgJfRHoSOsHcdtsT7GXHsvxOAvtfodHKpo4c5G2MU4ZEPrC0kJKIvBoxa8ggWOrMKDhk6oFbFhM
	yK1JkPm9dM7f1Uck7J2cjb7CXUURLgo9Sp02WcR9n14/X+TLg3ZeyCUAi2dvoy9UWuodaulWh+D
	ZcjJOUZvn0BkTYWRVbe4bDycRtOSg/dFTJKqVOsxsqzi8vY3RDyCFUswyYBIaXwjWKjKwR92QTN
	gUq/tu6+i6PXOW9iw1fMQdK1NDMxTPNQV/0LQiD7XzPZfaszljifelU0aQJjocFfmpk=
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr117889645e9.2.1788604889257;
        Sat, 05 Sep 2026 03:41:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm179967505e9.0.2026.09.05.03.41.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:41:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <courmisch@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next] docs: phonet: Fix the struct sockaddr_pn name in the example
Date: Sat,  5 Sep 2026 12:41:23 +0200
Message-Id: <20260905104123.43511-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct sockaddr_spn does not exist; the name is struct sockaddr_pn.

Use struct sockaddr_pn.

Fixes: 297edb600326 ("Phonet: support active connection without pipe controller on modem")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/networking/phonet.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/phonet.rst b/Documentation/networking/phonet.rst
index d705cc5b09fc..e5551fc45c78 100644
--- a/Documentation/networking/phonet.rst
+++ b/Documentation/networking/phonet.rst
@@ -172,7 +172,7 @@ two endpoints directly, using connect() on the active side. This is
 intended to support the newer Nokia Wireless Modem API, as found in
 e.g. the Nokia Slim Modem in the ST-Ericsson U8500 platform::
 
-  struct sockaddr_spn spn;
+  struct sockaddr_pn spn;
   int fd;
 
   fd = socket(PF_PHONET, SOCK_SEQPACKET, PN_PROTO_PIPE);
-- 
2.53.0

