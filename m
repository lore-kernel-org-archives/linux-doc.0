Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078E21A4DA
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442098; cv=none; b=hsMbnDOUDY2/K+aGBmQHWSiX4Vh7W1mUB0gs+H7Ngdz0G6nPOap3rHREiMJqPlsE3kXWR7O05RuMds2ExcoGSvn0NzLp6oeCFHHT3+pm5d6CMlbEURymtZ9I+v2xuob1YrUSBT+nLf4t8ORGdl72S2gLlwZXjXlAcB1ugma1t5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442098; c=relaxed/simple;
	bh=FJxuu9SZEvE8/lpXK8JtYaTHBfXuBPx5hwpAA4obJiI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tfNAkLzVZXuJg9CoiBHVEGYuBXkbXz89zXomy7gh24Uz1pbgFWKBJuNdEByE20S4TBN86Pwur5MymXdXnDH8uNGoQiWXkI1xK3x91cceHNT7CMvhxdKuenbhisweFEMLnhfJY/+0k6zoPRiEGw4sryyyag+pm9CriFBGQbXU/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XZ51q6Xs; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XZ51q6Xs"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e2971589916so9674644276.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442096; x=1732046896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZebOFvXhdHbUqBa6VoAUwcXkgGJWlmZrSal3cue+e0=;
        b=XZ51q6XshVizEXnh5VDUie5LrWsdSgFXmg7auY3003qlpQXCLSqlY/bOx1JkBpxMN3
         xF83J8BTjEezwB2F62KmjaGSkQMtJbSpuwtHNsb1ctmFLfWU4JJRH8zozy9NUtVU1V8Y
         9wbT7zYXLPRD4O1sS2acXb6m+fTTMeGAoOJ3FbR69vYIOQA2BepmNbRw1Y9R+qPNpfNk
         mz9qE1hdV94y5KfKNmh9sZ7wT48pRKkMtuozEp4REgd7ZftVA0pW9nYxQuLSr4Je0EdX
         z4RR72T4Fic19WZdPKBwOWtQsN8vSeVMLS9iR5mjKO8hJRUo9CcNtdVdsr7uCobwL3w9
         aqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442096; x=1732046896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZebOFvXhdHbUqBa6VoAUwcXkgGJWlmZrSal3cue+e0=;
        b=o3KCIQV3vRhszRm/ou3J3jqmJ/Zs/BVp6gpvTTkRBZ/HAloH2RVtIXr2bRvKVyn5Zz
         nBnWWKXVlV+cUJSVmKTznFuczadmTYsVRp5At93nCWf7PajBQiosOQbeqmsrLHwzNGo0
         IvQsiqAipAU98u2jj1OdTKd63FV/l6Rchjw89qabpSCfX5iw1zJMEQcnOOsc40xZ5Iuw
         9chuix5b0GbtjXfIe4EdIOoBkmBJlor/3FPtQ7nXdE4EbFfjedsyUkh3yciia+p1kvul
         1J6E4VZaMikVnkvyTHIIuGlvbeeU3aRdDmcMBdrt1sbUIzw59PacuWeb7XgHjI6/ghP4
         nUDg==
X-Forwarded-Encrypted: i=1; AJvYcCWnw6q+BUuQtt3qjXSTLS5l6GJWsNPv//BQIZis+3Sjt3hyA0sH0KF0ZR/Zb8Xtb7Pf+lraNS2uy+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgvf81q83/p+NEq0a9aLjXoFeD500rXBwD6f/MgTf0LHCKTRJO
	/vWATrq2UhYsPKzYlUmx8V7ZXImor5J05GsGO/LF/AOa9+/hzp421PPNBqoCd53iUZZcoCWqNA=
	=
X-Google-Smtp-Source: AGHT+IFHMV1811rm2dOpYbT3VPVmCYSYVxNohph1lrNLKTBJ3I8s7FaDFr3MiHn8g8q048q+n0kQifFS+A==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a25:6fc1:0:b0:e2b:cd55:11b3 with SMTP id
 3f1490d57ef6-e35ed246250mr179276.5.1731442095955; Tue, 12 Nov 2024 12:08:15
 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:47 +0000
In-Reply-To: <20241112200748.791828-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241112200748.791828-1-rmoar@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-5-rmoar@google.com>
Subject: [PATCH 4/5] ktap_v2: formatting fixes to ktap spec
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix formatting of bulleted lists on KTAP specification for new version.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index d4529f4e38c7..496799e7b87a 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -22,6 +22,7 @@ consists of important supplemental test information and can be
 machine-readable.
 
 KTAP output is built from five different types of lines:
+
 - Version lines
 - Plan lines
 - Test case result lines
@@ -40,6 +41,7 @@ All KTAP-formatted results begin with a "version line" which specifies which
 version of the (K)TAP standard the result is compliant with.
 
 For example:
+
 - "KTAP version 1"
 - "KTAP version 2"
 - "TAP version 13"
@@ -517,6 +519,7 @@ Example KTAP output
 This output defines the following hierarchy:
 
 A single test called "main_test", which fails, and has three subtests:
+
 - "example_test_1", which passes, and has one subtest:
 
    - "test_1", which passes, and outputs the diagnostic message "test_1: initializing test_1"
-- 
2.47.0.277.g8800431eea-goog

