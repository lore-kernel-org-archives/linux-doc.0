Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFDC219E3A
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442091; cv=none; b=cnSTjSixMe6Q1WIEzIA3a/M052Yf62IbeiuUvx5ZBEY5G/vYFZlA0sVYxVIX6sehOdIKm9QhiJqHxFxUazB58clY4dS6HFQSGij6qc26i+imiNVMdOml2db53D/Gc86WZqxHEZ/tO/BCNp9P6c+o0bqeQ6tOZktCpXYebjZpUd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442091; c=relaxed/simple;
	bh=Cm/eSbmPeMPfJ/E//ira1pv4Z1VsSaUAw7VZkKz7sRA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KtbBwcq73VsiLUA+hCbZ3nhhuTg+SX68PCDS6iXcvStzDaIe/Yh3Ed0SNRWhTelux/gLpNAJdBIk9B/MT94WA4eR/8H19XESZBJEFm04SWgRjVxrPcRZ8qizT8aP5l+geknf/d+fUt/R3jR/XetDCKXdqkHrP2zFRjYLsUMTEWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IoH0jiXV; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IoH0jiXV"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7b15659b098so739864085a.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 12:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442088; x=1732046888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQtsjzam/tQ6ilcR7zH4AHmKAym/OiKHd6SuoQU0pLU=;
        b=IoH0jiXVW5QRUUG41sckqQ+wzcHFai31/r5PFjCpzgAfM64pB/6V/Fo4ytIdWQpf3Y
         FAdUjHkI81dcGfqWo/19sGkc5Hqt5xsKr4n/P97da1gR99h7JP8Yx4GjKo09CtplS0Fu
         UK2nyG3QZBD9L3L2hP86v8Ubu1c9Z3kn+CfJBZW08ph5mEKkxY4Qjaj7ekA6HZ2GFFVh
         dQoHu/gSFVP4RMfR4Gs5KaDJq+FnCAT5QdpTFSArNkXfaCOvqxvR9Izpn+H8Y0NEhJIz
         P67pnzbvI4LudxVsSoq0FU17oB++aRAOm+aoFi41KpB4V8hVcjsHmdEFgQZ5VZUYxS3O
         0qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442088; x=1732046888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQtsjzam/tQ6ilcR7zH4AHmKAym/OiKHd6SuoQU0pLU=;
        b=DNsVR/UAVAaQEvcCk6MveL5tfnDqPvkPSGqzvYkEbli3Yv3R6mhuxnxRyQZkczHPyu
         jt/Rczxdysn+BxhiCKLpxJWwoP2BHX3241UUg5R1UtUr8PvNVXy1W8DWym+/N5XRtkr7
         K84zM/fzoVMSuMY7qa9jYIs2GVZrmY2s8Y09EyPVT8FDvYF2qKxcvvFtetNG5qPkaLJq
         SlPCHrLn8FBoDQHAxFbz1hrILxw/z9HwkVy8HQi7mxOCBlouRPCSZyzp5FH+RrwZ0RmM
         VzYTNVpaW84WP8wdQHgu+fkO3yt1oCsPdV1Hv5BgxwmtrRkXgLwtjhe72/1AGo0aOwlN
         HYtg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3a01sy7BUx3RsjBhpm26jUbIwRcEuGyn6ZfUUF5plHP72K3oABiNDdwh7gcnQCJW8lYeb6rZOZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNdLIPeKdcCH4B74yKoCQe65eAGIwr5sWEhsOeD3FkcxmyjxXH
	X7tgAH56O2Gk5N+kqWskYNgh8saZo5JjUQ25jZyzVhAFFD6q6+lOnhzcwzLMbqA3ennon6I8gg=
	=
X-Google-Smtp-Source: AGHT+IGfGyU7tdZqjtr7KJw/2/4k9KdVjXiekuns5ySOGstmvVLOLtq64XkmS7ScAEgZKCZ7k/oCEnEgBQ==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a05:620a:172b:b0:7b1:50fd:4cd2 with SMTP id
 af79cd13be357-7b3528cea97mr40585a.5.1731442088098; Tue, 12 Nov 2024 12:08:08
 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:44 +0000
In-Reply-To: <20241112200748.791828-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241112200748.791828-1-rmoar@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-2-rmoar@google.com>
Subject: [PATCH 1/5] ktap_v2: change version to 2-rc in KTAP specification
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frank Rowand <frank.rowand@sony.com>, Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Frank Rowand <frank.rowand@sony.com>

Prepare KTAP Specification for the process of creating version 2.

The version will remain "2-rc" until the final commit to complete
Version 2.  Adding the "-rc" ensures that none of the development
versions will be mistaken for the completed version 2.

After this commit, Sphinx complains that we now need more '=' signs:

  Documentation/dev-tools/ktap.rst:3: WARNING: Title overline too short.
  ===================================================
  The Kernel Test Anything Protocol (KTAP), version 2-rc
  ===================================================

This warning will disappear in the final commit for the release of
version 2, when the "-rc" is removed.

Reviewed-by: Rae Moar <rmoar@google.com>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 414c105b10a9..333193f51a53 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 ===================================================
-The Kernel Test Anything Protocol (KTAP), version 1
+The Kernel Test Anything Protocol (KTAP), version 2-rc
 ===================================================
 
 TAP, or the Test Anything Protocol is a format for specifying test results used
-- 
2.47.0.277.g8800431eea-goog

