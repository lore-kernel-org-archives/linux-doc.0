Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F622079
	for <linux-doc@vger.kernel.org>; Tue,  2 Apr 2024 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712062280; cv=none; b=CoogSbMnX+BpUkFy3sw26uLkjAMC9uo7F774q9yVx5V+5x/1hIYwBUewX1b3afKTMWZ94QtsK3FPzBdPE7jM7ePLvD9xyC8TlL4nVgA86frHDcMcOHSTsY8fgf+ecARNCaQoxUJgFtalZU9eK3TseZRvWl1IACpCnmc+vetX4KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712062280; c=relaxed/simple;
	bh=oElAllZ5P13j3PQNwwFCGQdwmNrFpD3NdwRGZk5W9/I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GqxeP+556Na+jNelgZdYN/3d/t0cWDT1/cleWJTtLYP6r+U7UMwYsOG4rgAQrlC+3AZ5pysDnLv6aKhdansSuFWb72wblc4GAOMaBMs91kMpV5pO4VJLMylgbvazDfLn0ZUCZcMwTiTUNfNM3W72Dn11HuexiVLqGEsX2OPDFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WhPGom5Q; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WhPGom5Q"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3436714e286so456605f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Apr 2024 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712062277; x=1712667077; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OP/IorpMEPaYCSeI9noOVqFaOql+UUAA/5aBbuRUBgs=;
        b=WhPGom5Qr05vODwOwaTYza70q//55pTRbPI01HS8jbimMeTxtWmnoS+wa3UUP1vfxy
         yjcglvuj33MbRRaOQ4vNvnz+Ogdgo92XuhJnsVJusT6ja+5zZUo4ZKifDjzGq84KdFVg
         O5lYvddvGLi38WF6OGEoQUzipfE+p3CjRRlskuQUdur07wzgw2VBZxvN5pereZaO+kcX
         toOUvA3rvvXqMcBcW+UhWMvJ1Ae+EPNaAb7c8qFGwL927A9Dfe+K0iP6M0QdE+XWyPg+
         +/WpFfj5/Y1bgoRrRtYPdhD1WQukpLbEwyejUfDeCk3/T4GQaiE1izvbNZV9r1ytRtT7
         Ip9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712062277; x=1712667077;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OP/IorpMEPaYCSeI9noOVqFaOql+UUAA/5aBbuRUBgs=;
        b=P0rIHYXHJ/MREJ6N/TvCt86YNnYwUzBCo0OtOPMP9IPXtGS11v/1bZVeX9+EYS+CLO
         k+3nj5wxCnGQFQGG/YNRYnPX+b3hLQxrYeJqD14Gn+4o5s07XowCMH5oXO3mpiWAurYG
         OdxvV4MNHh0w1/IkOkEOew2yB3VFNONGzqV6FUJrTd47Y0KciJBAjpoash8w0BgOssSE
         xY15agYcCIH/BZz81vkBDojnPELd/qxyV2ckaJXkYOuhZQA4elopayeEkGaX9AqcSZHJ
         dlLtZtdo8fSRaCYv+4GSKV6o1ZzM1zReCnoPAITke4ytFJ9pi4w6OxfHD2G+Ypld0dS/
         4Yow==
X-Forwarded-Encrypted: i=1; AJvYcCUPfd4nWrsTGcp+mmeJmLshPV1u9Fb7nfIzF+IVg3zwliv0872b4pKnKRS0yS+1IJWd5EPKA5mtCcz45Juphe6K2NC5YIGyOIMc
X-Gm-Message-State: AOJu0Yx0nL4mLmCTPSf5dR7mtkMUS/U0mjtt6Uzx3TzZ1SqXtjRhEkSD
	8pvDK4viZ3Lc4YvkcX+i/qDbIdHLHyBN4B/iFzowqMSf2YjOfRrPP8JW8Kqd9NWGWjI0/Sf4OQs
	7nVmVWTozSA==
X-Google-Smtp-Source: AGHT+IEKQGJhcSfFP21Fqdj+QH/10fP9Zd12ZW+9WsU+VBFP3ePpDhwuu5yXNp94FAP98dcP14owPuAgMCR6Mg==
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a5d:6608:0:b0:33e:d4b6:eac3 with SMTP id
 n8-20020a5d6608000000b0033ed4b6eac3mr28105wru.6.1712062276866; Tue, 02 Apr
 2024 05:51:16 -0700 (PDT)
Date: Tue,  2 Apr 2024 12:51:09 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240402125109.1251232-1-jackmanb@google.com>
Subject: [PATCH v2] Documentation: kunit: Clarify test filter format
From: Brendan Jackman <jackmanb@google.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Latypov <dlatypov@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, davidgow@google.com, rmoar@google.com, 
	corbet@lwn.net, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"

It seems obvious once you know, but at first I didn't realise that the
suite name is part of this format. Document it and add some examples.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
v1->v2: Expanded to clarify that suite_glob and test_glob are two separate
	patterns. Also made some other trivial changes to formatting etc.

 Documentation/dev-tools/kunit/run_wrapper.rst | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index 19ddf5e07013..b07252d3fa9d 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -156,12 +156,39 @@ Filtering tests
 ===============
 
 By passing a bash style glob filter to the ``exec`` or ``run``
-commands, we can run a subset of the tests built into a kernel . For
-example: if we only want to run KUnit resource tests, use:
+commands, we can run a subset of the tests built into a kernel,
+identified by a string like ``<suite_glob>[.<test_glob>]``.
+
+For example, to run the ``kunit-resource-test`` suite:
+
+.. code-block::
+
+	./tools/testing/kunit/kunit.py run kunit-resource-test
+
+To run a specific test from that suite:
+
+.. code-block::
+
+	./tools/testing/kunit/kunit.py run kunit-resource-test.kunit_resource_test
+
+To run all tests from suites whose names start with ``kunit``:
+
+.. code-block::
+
+	./tools/testing/kunit/kunit.py run 'kunit*'
+
+To run all tests whose name ends with ``remove_resource``:
+
+.. code-block::
+
+	./tools/testing/kunit/kunit.py run '*.*remove_resource'
+
+To run all tests whose name ends with ``remove_resource``, from suites whose
+names start with ``kunit``:
 
 .. code-block::
 
-	./tools/testing/kunit/kunit.py run 'kunit-resource*'
+	./tools/testing/kunit/kunit.py run 'kunit*.*remove_resource'
 
 This uses the standard glob format with wildcard characters.
 
-- 
2.44.0.478.gd926399ef9-goog

