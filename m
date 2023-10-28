Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EEFDF59
	for <linux-doc@vger.kernel.org>; Sat, 28 Oct 2023 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWag7P9H"
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32827BF
	for <linux-doc@vger.kernel.org>; Sat, 28 Oct 2023 11:22:43 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso2898270b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Oct 2023 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698517362; x=1699122162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWZHwbHH5Jw6suHsJrDVFCqpyI99LB7jrpML+AzDazI=;
        b=bWag7P9HxWDdH4Z9GR0oq43NF3/rCdoyR+5i2UKMHsgs7YQHhBdDFwOsIa3QnbyMm6
         RJ23xXRRkKHBl1qCHZfzSp5qFKpys2TlWWzZ++HzDcRtHUSVH9N6YUl9qZ/FEWPYxnW3
         1/QB96hU8eLTuQmEwUi4envBil/ATkRCFj0fdrbvuvK18sfxIYmVrOWJKsl3qbcGRmD5
         a0A5sQwAO+SsohqFOghghpLBW7W1OB7KE9PXGZR22k3gkz+n2GAKdtj/7tcI3coM7vLm
         3a6s47ELdCDoy+OFNXXpgN0JDEqcaxdwzt5W/9+dMV0k27CtD9/UcYf5jN1wQB1LWW50
         isLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698517362; x=1699122162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWZHwbHH5Jw6suHsJrDVFCqpyI99LB7jrpML+AzDazI=;
        b=Jm6JU4tbc+1GoZ4IopaaDu72qbNGjauCsjFzciHl1+su7JDKtN/KdMrOAbI6vnmOSc
         IT3fPtQs5BQBHe2nX7xdPaCeY3/5lnQgSnfNZapdZbKTF8NHSniiXf0Xb55qeRG0rFBD
         OsfkSLMvS5n8V7QJu5W5Dol/wYFEEoemD+Nzf64nZX9VYescNrK3iugvEZH2kZAsN6px
         ww1MRYZqHVYr3CrMJ/0a92d8riCR+uetlLABlE5Xf/0mrueyuppzdXb7+YmmQ86lVm8r
         eGhFHWd1ha/Uti8KSUB1k3kRJMF3W1Aam57ad/mw3/86WUuDdAVZRAEeY6nDg/4TBfrX
         zXOQ==
X-Gm-Message-State: AOJu0YyUJ4y5auYIQxroT3cWy2HNkM0RpgBAx4zIUxn5TN710jOPq8Fz
	oRdJCAsl+UV2Owr82cF2ejf7gDhNC6sxeg==
X-Google-Smtp-Source: AGHT+IGmVG198oKTgBduvZ9KtnDQa6FkYKviYi4bbFl/ltu6kcETf7NFbhU3hUiuMcamD3IPvLai6A==
X-Received: by 2002:a05:6a00:1a4e:b0:693:4108:1eb7 with SMTP id h14-20020a056a001a4e00b0069341081eb7mr6203594pfv.30.1698517362472;
        Sat, 28 Oct 2023 11:22:42 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.229])
        by smtp.gmail.com with ESMTPSA id m5-20020a655305000000b0056b6d1ac949sm2027330pgq.13.2023.10.28.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 11:22:41 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: corbet@lwn.net,
	yujie.liu@intel.com,
	linux-doc@vger.kernel.org,
	swarupkotikalapudi@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] scripts/kernel-doc: fix make htmldoc warning
Date: Sat, 28 Oct 2023 23:52:31 +0530
Message-Id: <20231028182231.123996-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make htmldocs has below warnings:

..
Variable length lookbehind is experimental in regex;
marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
<-- HERE / at ./scripts/kernel-doc line 188.
...

"-Werror" option in make command,
needs "-Werror" to have space before
and after while running make command,
hence space checking is sepratly done,
and is not part of lookbehind regular expression.

Below command also didn't
show any error:
 make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o

Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index d660e1f4b483..aa9e3e198d12 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
 if (defined($ENV{'KCFLAGS'})) {
 	my $kcflags = "$ENV{'KCFLAGS'}";
 
-	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
+	if ($kcflags =~ /(?<=^|)(\s)-Werror(?=$|)(\s)/) {
 		$Werror = 1;
 	}
 }
-- 
2.34.1

