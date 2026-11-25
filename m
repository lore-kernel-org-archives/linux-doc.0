Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612350;
	b=g7Bjl33bDM0PKsDlM44V+OmNuERH6481xS9InpE++8SOMfDRzkNg1NwIce0oIrbUuwj4
	 2ZEpbsCYM5x+XUrxkXAe86su0E7XZ4uRAgSCvDztGWwSnKrL23CrhugY7LQ+RQI/i2+8a
	 sIkQLqNw/spDofzJYUUdeRmvZliNXRLLZJL2gqhoSchTrCbDLybXugTV17j+m1IucbfVm
	 ItqsAXHYyD1yps7Yc9Za927HzkYAA6Llx+d2kZGLNJXtpbb3EWqbe5C68OFjtGMzol3HQ
	 qqonLGPEX/sZ7QMGHHBV68RYW4C10k5bM068+WIZHa+YEUM8XEnaaaKuY9MGwBgeGzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:In-Reply-To:References:To:Cc:Message-ID:
	 Content-Type:Content-Transfer-Encoding;
	bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
	b=nEWBkTiiRvrrkqXSMsuTfcvo3NiTPK1KviuH3r1XsuUbnAThcHakKmHehaDPHFFmGSbm
	 rj6MNAJkCtjZW6X/CtcXRQacpzIWPS2LFUaoYthPayDFlYeCyXO5gzrldF4hVL8UVc+TC
	 mfRDduvp/svRlkRLzNaiFz6W6qs/eaySaLBrf0zMAzmspyxDa0GeBeA7Cxdqbwxoctp19
	 Ne0efd+lRWpdglxmjHo67Lv7e3KG6hGkATEaWJ7I9xaiqMkScxm0jHKYSdFvHVVU1i7uH
	 Qn5jlwmNoMLiq+12VZMlpAHe2sduGxjs+LUaUdLL/LJncqqA7cUXuTLLOuBvSfLWHdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNbG6lhM;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED7606A32D
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9ED7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNbG6lhM
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53644b28706so92037441cf.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612349; x=1796217149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:references
         :in-reply-to:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
        b=nNbG6lhMNlg9s3RxRiJNbZFCcJfSZu9DNa7mYpBntzBscZz1jH+GJVdRxODmIBn/XH
         9T3QeSZ0dBdrShV+5UTQlvRJDGWmaSFgwPG8xaK78m9+1IsZbQZh8uwdbPQRLpLbeQ4O
         xVf9SGqpPHCiDraZ/vP2iJjFbnzcI39gmq/x2WCzCnLx8mO2lMKqvHamXx7lbVYnXZLk
         hcuvxmVxfNp9NbLMuVJ3iDg3B8wRXBSTMgQwkQF6CqLuXOfDj+xbdovSj5yUEFllih75
         XhL6PeZGqPIxDJiSVo3a5v8EE/vrplOfFcWFgb30mkGU9pUBVGKlZqSfFrPBsPBaAqh7
         Z59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612349; x=1796217149;
        h=content-transfer-encoding:content-type:message-id:cc:to:references
         :in-reply-to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
        b=ogdWE5/+VvyN7uQY1VNKC9FKDciWGB84oT/eNQEFPbRIOGthFClABK+R0aeujFHygE
         Ujnkgz0TsWskO1JGFXB2U/VC4hTbK0vCZ5XoEqiRRsMeO40TaWPVfPBH3v+TCJPwXleI
         EpfM4Pl2J8CtMpIw7j42WwlOq0doZpjo5iKbpsw3aC2F0BC+TtPqF1LoUyUivkKNbbrl
         uzLIWeDW0sYsPdCIWPCyq0hcwAN/yYYzkhFBBeO+SiPMvemJrqIOfEip7MFGxwt4+zba
         AOSReC/eBqIrZp/7xf22BUPqZaYCrXs8CZ0wGxMoBUBEw6fKOnTRiZiC7yApc/awv6je
         DzZg==
X-Forwarded-Encrypted: i=1; AL+hErGySgjBeHjUmv6T1VfSfrXZC3CyiFshzTp0OZD4J1cuJ2mWM2ajdB5Ce1NfvqVUTCDNu/Fx8L9WO5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UK3i13MBHnk90GJ5jKwHNVF6fA0SZvTTrwJMcGv3vkzWZJ3o/
	4PiDhts4xl1n/cAkN2ydLx+c0iNRiFAm8EnQ5mqg50bgNxfM3TPGzeM=
X-Gm-Gg: AZFdTZfp1WE1lKa5AKMBAvzal8slsAjyetr8dWh+/eAvVLmXf1EB8e8hC7/0TYDFYU1
	K6d5RUKrJnb+MdWdwHFI6eHFIr95XxG5Tg2jhDYzrn1Yc/5Tqa8JJL9H7CpucdOUdcY7tGsAHEk
	FXeA5ftzkEluw1D/8Lhc1SrhpAqmI3ftzA8ZcLMn+RqdyCM084ZgOzmgzy5mOD29bLRtBiC0jxP
	IuzXCheX0HP/UmMk/0IOGGyPbb8ekd0uHUarJsJ9X9yEPR0vEeSTOQ1IQwVUmd2WnsSKenb38fU
	q5ljK7c59clmlEuyQ2Wve1TVfNFQh9LKbnsL7s3UTYqHLIfAIMWL9ZaEe4Amzx5VY3hvx45yKu3
	6jNYG1dN00+BqRcEC5uM5aYTefAVBpJnDpnAwYtuwANGtB+yew5Hxwja9XiV5n1pkTX3Ng0okEI
	FEC+VULh3n1phlQDEkBaPUEasevJzq2ON6DnPyGS5kdMx6g6TK7OTiEm6cGrI8NZyVUPi/kHUDY
	6eo+pGzaNfQurl6RtNdXiWLFNKkwDJZCdkt16cry1wSAzILdgKRkhayw9TuZSpF4fJbQKLtHMGC
	E2VqRE+cqfSwvlJmSb0nxpPqG3gT0QK396gOlpMyJ+7ZDu+WN/bQToMuggq4aJasQeb7qfgwQuY
	eUKXfwF8FYOEVHjKoinVVdg4dtYLgofn1N+WdSnFO5RXF1I278v/Ilkvb3SbdQfD/i/7GM50=
X-Received: by 2002:a05:622a:34f:b0:55d:3695:c1b8 with SMTP id d75a77b69052e-55d768a24f3mr359297361cf.11.1795612348580;
        Wed, 25 Nov 2026 05:12:28 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm155981971cf.28.2026.11.25.05.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:12:27 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Wed, 25 Nov 2026 13:12:21 -0000
Subject: [PATCH v3] Documentation: kunit: document --summary and --failed
 options
In-Reply-To: <179561234149.225312.4673144866194884043@gmail.com>
References: <179558107134.36587.13120861622026385297@gmail.com>
 <179561234149.225312.4673144866194884043@gmail.com>
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179561234149.225312.11200387441465771003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

An LLM-based coding assistant helped draft these entries; I checked them
against kunit.py and kunit_parser.py.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Changes in v3:
- Reworded both entries per David's suggestions: say what the summary
  contains, and that --failed hides passed and skipped tests.

Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110..9e0d83d 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,15 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary of the test results,
+  including the number of tests run and how many failed, rather than the
+  result of every individual test. Does nothing if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed,
+  along with the summary line, once all tests have run. Passed and skipped
+  tests are not printed, which makes failures easier to spot in a large
+  run. Does nothing if ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


