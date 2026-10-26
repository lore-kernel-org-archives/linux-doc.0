Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978214;
	b=W+aQJu660wm7G+jKfhFirljCME02hcT16AK5ReMwme8UNgtLU+jpoYC5kz81ocEpVP+R
	 pAvQsF9WhJ1ISjsiCuptdVf4JvHa5GU69vP8Ag3D1Vbut99LDV63TxoL/h1Hcmb96qWw3
	 j9bJ53A+kTsvEnVvMJvfwMUzqFIPc2ayRa8QlP2XsvMrg4GIXz2SH5GjiVIyPBXAutR1m
	 /xT2iV5P/es1thjyWlsR0sfM3sx/ayGyk4VFSneNpWQLkqNP2kUR8lEyu4vkMYynnlhkK
	 H7sB3lOYLi7zCXOL2cLYTE+mmNpOGZcUfXGTbB53fznQB1XUmivsxaI9QKgekcYeWmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:From:Date:Subject:To:Cc:Message-ID:
	 Content-Type:Content-Transfer-Encoding;
	bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
	b=W72GxcGp5cZ/d7y5UEQGzeQOwTHsxvLdlLaUbx6uNPqNXK/bf50RJKBgLv3kD2FZdS5a
	 gVsofk2nLVYBXjB7GJOPmTolh82ZYttgjuau+a/omERVGg9UASDfL6Yg4jSd45ROi0vMU
	 ZpOoMouV+mKFUGn92wO5/+r2U63Uo+77nmfZhpLU283+AWMJk1RcomtxRbo3wnr6WGPSM
	 9FCvMx1+bdS0sz6W0WXsnhJ3dE+Q4KN0ynK6CCiLLU9zpCiO2RFs4Ouwop6y1qncCnwBO
	 6sxOzm7ma8zippkZnPxqf8H5zuPkuSizZk7/8RyycrHuS/L4RwwOxjC4yu5D9bk+IEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bN4CDDSI;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F44D606A328
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 01:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F44D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bN4CDDSI
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53394bffe0fso40595651cf.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 18:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978213; x=1793583013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
        b=bN4CDDSItCtt/QdxJizZA1Za1opqZMedq/YPSVbx9jVRAv+IQ7BFhAlMW/7NWv7ESx
         FOoNXzrrhQ70rmZRcW0No3Ylb+06pJxeoqOtFVFIorI404RFF6MVzF3J07lZ+JXWLnu0
         1OogcxTj5x5ZvERUql8WIiWWtEvKJpNIRWrukVprl/HOa0/eQaodZXXR4TIWJznoPfGz
         WavttMySLc0Eu8wWcw7mvnRfL0vkXcISSk+dgoaOGTsyaoI5HbC6Hj4RuSz3JG9/T1kI
         gg+c7bDGE/WyczdoMvnqKbAXOTkO88ZjMyMyz77+GcBMs/G4//5VjKd/6u7OZDW5awkn
         5SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978213; x=1793583013;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
        b=iiJviaZzwjbeLGUeELz/BlHRJh8P3izNm8KI8gWUVe+Xj3RMbqXX5I1NY2EDs+RQPD
         vB5+SoMrd9HqsJsksdDEyNsnnDu1hy0qTq3P9fTjC7HDysvjWlVSqv+wuA3XsepfKPAh
         Vu+gpl4tNtGxhawTKVqOVIfHUxNpQLsREPl/PLAuKh6Aavl86GqY5qHAcrPJcp9ZY1xL
         XMMvERmAPU1VmniiAcLQmSUsO94seNyvIdzq1o9PSPpCPB//NEtrS/74KnJYf/N2ahXz
         qlFtsZz4nf2gT54HynsgwAAL4e7ER8LpIkk3AJSOurEl0Iz8SNMDyriK87R+7Eb81aZJ
         vbrQ==
X-Forwarded-Encrypted: i=1; AKwUvByBUtrQPIDpJ1mZ2gB7JIQ9gzjitg27UOJl98R3qdGa+EKuKoGy4GTc0Toyjt/qC0OeyjjxIT4xTXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVmI2fq1QNso7o+UmZzse4q8eNhOdpM/fH0KxkL1Pnl0tUaCjq
	Eoni3ipT9nVMQvTPdW5Yy052thldWNBnnzMSzqm8okR4hap2m0pWSFI=
X-Gm-Gg: AYBFou1hDEOpabblpvh8bTyHznp+luSzkmhWPdA00hyimYSiET3z+kYVXV3I3C3E6QH
	c6+SGkkJW84den1TixYMs5Q5SHRO2LzSFZm3TOy+0ScHH0LPYKJVarOGxwdYUiFxapp1BZ/LzYo
	eaHGESVpFo5A6gCefgo/uDiv3Gc3eoUmFjra6Ma6jLMu3EAYsEYTi/IXtvO0b2Euj5tFeXOAozH
	ANVVrp/a7p5MVdF81goo8f3FS1O2ZGK5uO38OX2IfIuSIp/bD32pMMiae6QwdJMu6sbhBhaZ5Yj
	VBDjyMaeUueEBogHEFXaFVunxuhMxsv83msDBtbWQRXfWpLKBqZog6gSELsxRD/6dYO9sx946Ha
	ygPQl76QByXg4nwGC3/+okzyojuo6OYbgVcrCM4nZKAGDNP8atLd7uG1/1+JhkK8bsL/kP7hvbd
	i9i6Ww1s5zanXc+abCCTePIUjW4hmWIKo662nqXvEjDlWjf6ntzTH/FqBP+O/wpSzYyTW+/+IQ6
	hPCjnAsZ1sVs5tnmPcYKrTB2mCOh5Jja2CMKGGdgfDx7KdWHC/XMfV7CYHBxvRvOym5csYcGaJo
	W1DzVtDyw1OAkoSR0+CVERFiIWemjC0jABJc1ZWNVBwTZ7ZRRIkh5HTjtBUIdMorn47t9P4YPim
	R9kfVXRAOC60kk9Ce87Vt
X-Received: by 2002:ac8:5d8d:0:b0:535:1d5b:a7fa with SMTP id d75a77b69052e-5383ba8566dmr80965731cf.14.1792978213302;
        Sun, 25 Oct 2026 18:30:13 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970a2basm44270051cf.18.2026.10.25.18.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:30:10 -0700 (PDT)
In-Reply-To: 
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com>
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Mon, 26 Oct 2026 01:30:03 -0000
Subject: [PATCH v2] Documentation: kunit: document --summary and --failed
 options
To: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179297820302.2598507.5712076951623488183@gmail.com>
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

Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a..641ab50a 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,14 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary line for parsed test
+  results, rather than the result of every individual test. Does nothing
+  if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed, along
+  with the summary line, once all tests have run. Does nothing if
+  ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


