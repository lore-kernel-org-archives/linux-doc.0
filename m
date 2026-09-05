Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA233F8A2
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576694; cv=none; b=TCPThhJVkR2ZkKpKo17KSknc07nJvMkKl22qQLvh/zSy1KDsuzhGqN9sHq5DGVVGXMfUisbbVuCsPSDQnDMvdI9Ik2COexFFjIR8T6bEsEJnq9rKGFyXHHyn5KtK0bMgOJyPaAGohMEd2FVbPrGf/zqOtNy/ltrDBQnmV1WfiZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576694; c=relaxed/simple;
	bh=0oDNB+NNpmi/Ia5UjiAAkWEUmzFeJsRXTEAWNh6e61Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uJEm47MjvtvCnJALlV5jUlmP0v4hY371IGQueSO0L+RnTDUulXBxmW5yo8N8nH8cBIUckO33V1C3J8HCNTVrkuaxmSbEOXppo0X/buQcI8iQq+VzFuQqUcvqdZMXjrg78ForjQRm8rfmZqfdmgj+z9SelHaqA8de814kusoff/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZYXIZwx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZYXIZwx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso11978425e9.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788576691; x=1789181491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7My75hWOIQc2thwMD1HFJppKK9ULfChR8ooEsnbLug=;
        b=MZYXIZwxo83oWGZmBhCE7jrDgqzAHjLHYUeJ4DYSrl6Djz/zts0RsT+68tVmOUH3zl
         rlQuk9KaOvxdZWWHUIzqiaUVhblYwptMIx1lj1QmgiQ8T+GgEOhFyOlEsPDQdYhmh8bH
         mp5ZsbQw6K/4Mzr+5GSx6qia9F9jwZCGUFOscIe04S7WK7VH7uP32iM8vPOZbc6LzpEC
         npjs+sBu3XV+v7uF045QkdrZ1u1Noj1AIafN95oQGHlcEqy8Eegixu3A8tlObLb61O8D
         TRheXGxsJRWAQ7PhyP5ZoEymvceVzIvY6jHb231772+6UoQZz7XT7htMCkjQ2RbhMYbD
         nfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788576691; x=1789181491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7My75hWOIQc2thwMD1HFJppKK9ULfChR8ooEsnbLug=;
        b=OcKh8Lng5uSQt7GcZighCl4ulUtZI2sY2X+VmzwaVj7iy+U55fo3k69i0DSC8K/CVw
         R/+YghifyXAv5p7lQcTGSM/bkWLYDi6Y4dCQT8dAuWzWBoStg3j7BmJzm/c/fXIpQeo3
         nOIIpfNssYEDd/egRKcRV7SKQSksRl17Vr/RQjQR1ku5jAKrrFfK2Q1qkqsB9C2srZWf
         XulkNOprI/FceBPDUstiOsN/cu5MlJ9g+3L40r8C+pc0hZbnQAIAaLvtbinBohHgfy9R
         Jexk0QMrDZ/pArsMJWVEKRnDBSzXUNAb1/lgAiH1j9lHEkYC63OrZHYGIS7D8BTE/xKy
         SaUw==
X-Forwarded-Encrypted: i=1; AKwUvBwL/iwNxgbsazpz8SpViY5RExnajmhOPDxRv3gFnFct0P+o7sxTlnTtdwg8+jE10EJ/z8cTTi68ZRI=@vger.kernel.org
X-Gm-Message-State: AFuF++mbPDg/C8HtX7viwvsgqKv0U2pdOnDp74/f1nvPekiGTL4w9BS+
	jjbQixKSKN7+jqcoGm2raSqTDBL33vCkeNjzthKeQ4Mue67sajieacTZ
X-Gm-Gg: AYBFou2xFXqcTTik8trcOG4+foZVqPPRZAsVrFYhAVOQ3XMZ8nbzpEGeYhAcg4QlcJO
	7mL/pyZrAVYEIPO/cS8WVQav4TzZOnXsGuZhuokH6rF3BvCiyOtdxHB9c0mgCCgKqLZcHDPO3od
	wQKhA7XOxhmPOdn9XCBgYcRITnlGwaZoukjKJUw8JKPvrmYF/poJMps5cwhmRnDjy0gCV4bJC1j
	AZl+j8bG2Ce5gk0It48uTgwvPCIu90KmfNmL7N71HNX8WimlocS94bxim6MI2aUqGfW0I6uTZfB
	y8mZ6taNfWY9T6z7FpiakneMhDmB4wMG3f/glP2qj9+aOZm8YC1mSRYMf4kggMbVVzM2pzPp8Rq
	Cb71zkOnI4peVESiJ6lxv9uTj9jw/8lRIZ40oM5NnK+B1tlTjCw1UbRMDGoT+yTQ3hv+iGyd/WL
	nXv0NryLWTruJXgkszAh7+DVDVTNQ0r2O0z2mGdrY18NTqKw1ZHAWKGLkeiqMYag3d63v7UvY0W
	PfzXHmew9NJQDNrJbQV1OO1ljgmLijisT8qda39IrypKGzpdxnEnBxm3SywhpQMooiWODHdksYD
	/4QZuPtSKJt6Y68vrKHrAh7d0cbck6aTQrmcEIBpoGHfQSvki2FtS7ejPpY4/Rkcxx0=
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr197015325e9.16.1788576690772;
        Fri, 04 Sep 2026 19:51:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm200740735e9.4.2026.09.04.19.51.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:51:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tim Bird <tim.bird@sony.com>,
	Harinder Singh <sharinder@google.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Daniel Latypov <dlatypov@google.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: KUnit: Fix cross-compiler prefix examples
Date: Sat,  5 Sep 2026 04:51:26 +0200
Message-Id: <20260905025126.83693-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GNU target-tuple prefixes shown in the CROSS_COMPILE examples are
missing their trailing dash.

Fixes: 46201d47d6c4 ("Documentation: kunit: Reorganize documentation related to running tests")
Fixes: 957063874c76 ("Documentation: kunit: Add CLI args for kunit_tool")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a3399f..9221acddf3fa8 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -189,10 +189,10 @@ via UML. To run tests on qemu, by default it requires two flags:
   Kbuild. As a reminder, this will be the prefix for the toolchain
   binaries such as GCC. For example:
 
-  - ``sparc64-linux-gnu`` if we have the sparc toolchain installed on
+  - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
     our system.
 
-  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
     if we have downloaded the microblaze toolchain from the 0-day
     website to a directory in our home directory called toolchains.
 
@@ -293,7 +293,7 @@ command line arguments:
   - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
     our system.
 
-  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
     if we have downloaded the microblaze toolchain from the 0-day
     website to a specified path in our home directory called toolchains.
 
-- 
2.53.0

