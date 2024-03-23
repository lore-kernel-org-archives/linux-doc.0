Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F886523A
	for <linux-doc@vger.kernel.org>; Sat, 23 Mar 2024 06:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711174947; cv=none; b=fQbsdlZnh+lwbW5tjQQRrUksG4nk+ezsex8nwWpjFAmiCnAI7qBwfcq6FpU6IkRdcG5czW3OGrNFmlf+IjApuRy67Idp7P2kAsZpwjFHLWOoyq5Lf+CNy2kcoIbUYQnyITc4xPHMpUQW1bm+5cEfWTtflQ5w3ectOJT3+ckHbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711174947; c=relaxed/simple;
	bh=FxwFeU46JDBpQaN8L6/1kLVRQYz1ndBpn3eXE2YomPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fc5mAxWDevMHUIG823dQ1doT4o9yiEf8Gjo6wd4VARtvKp4DAO6l24EIaTK69k8pHG+TEWrM0gZ4B/7qshdrSWBOGJz0Z02V2lyDTwz/fLMrmIJJiE9V6fzjLSItNc2eKlwZCcNF/YZ0eCTsvd0dEz2sJSuBRvpxJUPjhD1eZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfi4LWoJ; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfi4LWoJ"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-56bf5104ce2so583890a12.0
        for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2024 23:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711174944; x=1711779744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7MjMJYaqaSQ+F/7yeB0R6TUmO4GaH0a6w4KALJXpsnE=;
        b=cfi4LWoJCkVqUvZZ/M+zIU7RW37yOMCDStjkS8Ep/fJZImfCmhZXUNDcqR3ZtQXoWx
         Un1/n9NSDV3pZNgjjo6reWtZQRkcR0R/t+9gLfjz9F89yDZGm9AM9AOEinnXw9fJQeFU
         aPGIdaQ2aGjFZBT1xNWhOXQMvPYC2cab14cGQyQADriX+kZ8QEKyxQon77J8ufH2tXz7
         M1fN5LXhE5AAK2qCpHTOO8BWD4yFLOR0P/D0uDw7b4pejdMUOBv/HbMPBVsgkRFFslF1
         jjFrND7fXpXER8Nl0R/MYp2IivkoGpqhoAFRF7Qmjg8CDRK4NvYp9G5yyMg/FApS5k51
         2dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711174944; x=1711779744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MjMJYaqaSQ+F/7yeB0R6TUmO4GaH0a6w4KALJXpsnE=;
        b=OnNiFfBiWrJU4PfWOQkRE50BpjflR/tFI+naO1eYvTtiqTsaJ4K1soMUuR/OC3ws2a
         qbzqMgVl6PT+zNk6lHcEn9EyeghG70gwU5PfR0Dh/H2J90sCoLF95gB2v19+5WZxH54F
         x5ooSXxJUEkjNIVl8z6cjs8801vuHNglq+zw/8RfC+C06R0LyiyWyYE03jUmQtMgk67B
         hsmz8/fyKM1q1TF49aCncPk/ZIwNpNLsWkokxtWC0HV3hinV94aEAGK0SYY7x8pga5e6
         CovY+hUCbJfbkVo3Q/yxZDMHhmL4HvX/fp6YzeOAWDv4vQ7naXfNDVA5VUOx3mmkOMuA
         qzMg==
X-Gm-Message-State: AOJu0YwRIljmnnmKB7Mp+LiLbpTpwBIiqQ2rGXoOIW6Woy0pTz9jWPIL
	sYf8EE6PLPIFhG8raE5YG3iqwqIwHRKDtGH4FBpQgTq09ojIWaNc
X-Google-Smtp-Source: AGHT+IFHoEVv1TQLnteiDarPHVbvp8UmuvhqW+Kr3+frPChNjQGWpBy2wWGBTNeKllpHvGgiWd7eNg==
X-Received: by 2002:a50:cdde:0:b0:568:ac53:83f9 with SMTP id h30-20020a50cdde000000b00568ac5383f9mr1013740edj.7.1711174943483;
        Fri, 22 Mar 2024 23:22:23 -0700 (PDT)
Received: from u.localdomain (ns31597299.ip-146-59-111.eu. [146.59.111.137])
        by smtp.gmail.com with ESMTPSA id r10-20020a508d8a000000b0056ba017ca7fsm540218edh.87.2024.03.22.23.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 23:22:23 -0700 (PDT)
From: Maki Hatano <maki.y.hatano@gmail.com>
X-Google-Original-From: Maki Hatano <Maki.Y.Hatano@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Maki Hatano <Maki.Y.Hatano@gmail.com>
Subject: [PATCH] doc: fix spelling about ReStructured Text
Date: Sat, 23 Mar 2024 14:21:12 +0800
Message-ID: <20240323062141.14863-1-Maki.Y.Hatano@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- ReStructured Text should be exactly reStructuredText
- "reStructuredText" is ONE word, not two! according to https://docutils.sourceforge.io/rst.html

Signed-off-by: Maki Hatano <Maki.Y.Hatano@gmail.com>
---
 Documentation/doc-guide/parse-headers.rst  | 2 +-
 Documentation/index.rst                    | 2 +-
 Documentation/translations/it_IT/index.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
index 5da0046f7059..204b025f1349 100644
--- a/Documentation/doc-guide/parse-headers.rst
+++ b/Documentation/doc-guide/parse-headers.rst
@@ -61,7 +61,7 @@ DESCRIPTION
 ***********
 
 
-Convert a C header or source file (C_FILE), into a ReStructured Text
+Convert a C header or source file (C_FILE), into a reStructuredText
 included via ..parsed-literal block with cross-references for the
 documentation files that describe the API. It accepts an optional
 EXCEPTIONS_FILE with describes what elements will be either ignored or
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 5298611e00ee..f9f525f4c0dd 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -107,7 +107,7 @@ Other documentation
 
 There are several unsorted documents that don't seem to fit on other parts
 of the documentation body, or may require some adjustments and/or conversion
-to ReStructured Text format, or are simply too old.
+to reStructuredText format, or are simply too old.
 
 .. toctree::
    :maxdepth: 1
diff --git a/Documentation/translations/it_IT/index.rst b/Documentation/translations/it_IT/index.rst
index 70ccd23b2cde..9220f65e30d1 100644
--- a/Documentation/translations/it_IT/index.rst
+++ b/Documentation/translations/it_IT/index.rst
@@ -132,4 +132,4 @@ Documentazione varia
 
 Ci sono documenti che sono difficili da inserire nell'attuale organizzazione
 della documentazione; altri hanno bisogno di essere migliorati e/o convertiti
-nel formato *ReStructured Text*; altri sono semplicamente troppo vecchi.
+nel formato *reStructuredText*; altri sono semplicamente troppo vecchi.
-- 
2.43.0

