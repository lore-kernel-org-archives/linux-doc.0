Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB8131CA7F
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763535492; cv=none; b=Tu+Bdgm3yM9PSQx1VsFC5TMQG2pFWyeZo6COoOaF33xcVnTJEGM7hy5sP6UghwoscsZCG04rXe6nxiztXpgoXf4ftNbxkAGg3T7p6AQ4g+5yWDPAKvdBswTdKHHaDVm2sQt0lP+dwWQAIumuzgKW++N8HOJeGCu05Yzn2QBP25Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763535492; c=relaxed/simple;
	bh=amkKEi/Nubyr7sAN4dsqbCzHWGeMPZsYKqic4NkbWqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HhD2m1lL0MaWEOz8N0BS5BiSc6X0ZMEMaJfokJnOfAjRKTQNzrFbFQ1z3IozytnvnqtpP+79bhMS4temons8OICS2J18eMkjWAyWdezB3++DeOMH8ALLeSkExjh0v44Fv/MLwpaf41yRjXVqYp8+FLYM95XYlslOZuPvyaLhzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBebbB+x; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBebbB+x"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-298039e00c2so80768545ad.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 22:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763535486; x=1764140286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wjC6usQfWqeTxbeSqhEY568+hObAimGZsLBeFawkA24=;
        b=SBebbB+xoaYj9sIRRY5yZ+mbVgrvrmfnxXABNVXIhT20Igp8AqJHTG10q6mbKHlSNQ
         7i/EGtbKBSEr9HlTMOY1sRtPfGWvev44yFDdFJ8C3DwGqXw63eq8X122UuczP9pbtQlM
         KKHZLe4s/5sEGa6lFfwoBB0GXqDwc1lky11a75Voig0Y8IgimES0SYzzQna+gMM7WbnB
         cBNMgEJRUtSX2vPjLeV8w8XUM7e459Yp+eKgJhWSvJ76yMA+zZBD/fUDi9dyorMk6F+M
         yUEay9XOYb4TaXMRa7npCf//U3+2WWJCyOhca+Xd5tuyswN3bgZ8kXRT27t2bye+Aho/
         2Atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535486; x=1764140286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjC6usQfWqeTxbeSqhEY568+hObAimGZsLBeFawkA24=;
        b=uHCOmo6l1b4b0irx4KZjxYdyAnOSXjLKERtidPw8aUTBz7rzhWZE7Pnd1IHrobKcjW
         kxJb9DfneqevOYpxO8oGkh4B0P3KPZ4J19tbuqiIOcVeJ5f51FCYus/Jvs08zz3FqlUh
         q2HJ/AnL2pOm7MHr+q+mYJK3iyts7sno0NfDzFw4mEiLy7GpalhT5ccN5I+mFNOxVw+o
         GV9LT+4bLTKai07oUneUamtm+KsY9qBpmz8gcMkCGtt/y2RKP0pkhBHNX+SZFE9VhkQx
         ddR2jnh7j9fQxdtZVucsaro4ZeZ9729GJwBaCx2mSNqYPQy+BiEuSDpDdFKBIKrblFH1
         moXg==
X-Gm-Message-State: AOJu0YyPcW7z7Og8lOnbKNkqF+fv2IJ6P+DKVGF+R4a+1nq0PVIdQaGH
	IsXrStBCQKVyVVBGonCUV3NflFjdWL52BrXdyadEYqGNFiT+qdRYRKgkr8CTssec/8ZyTQaj
X-Gm-Gg: ASbGncvF+ykBDKWzphOx9mqd4jnngGiNYOWNoyA2rXnvNK/t/axYWMfA7sHDaA06KRf
	0oH4XnCamjksXt+TT7Gz4y0PPqAUKBvyp9V8DOMdyHye2PonLIDRg3Y85Zzvufu0Y2eGLBRQRtM
	E3loFyyLQQW5ZPXmFQgQmlioDPao1j/mHvcreWLiUQd940novyfMgEhyPgyiglCgtkOmwfrfqXf
	gexmq4V/KSQVOgM8QsxeFaoEfaOIM8Q2M7m/I4Bf5w4mKeOdMQAdOPpCzAIrDVVdDIZYriyUwB5
	Lm7bQPYt60+mxeazH4zJ7Su9YBjMwbNNbo57f6O4m6hAM2tjnvvS5tcxjITgBrJsirAI3g/xkXG
	yEIOQUuSr7q5ffC/Ttd51Ae3hfvwVQFmK7rrAqnE0c/bydnLg50YlIRZpUFqn4Y2K3ZPZ8eT1Hs
	1PIxRDsIOUuuA=
X-Google-Smtp-Source: AGHT+IE65kBAH+/u4BEpHo9QgEjL56cfS+Rqe9jKi6sj0RYWk9zQfO9VFupuqk5u7jivxzXZu1oV3Q==
X-Received: by 2002:a17:902:ebd2:b0:295:6d30:e263 with SMTP id d9443c01a7336-2986a755c83mr227883075ad.40.1763535486231;
        Tue, 18 Nov 2025 22:58:06 -0800 (PST)
Received: from userid-07.. ([157.254.21.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986e5ef32asm159443005ad.39.2025.11.18.22.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:58:05 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <jiakaiPeanut@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v3] Documentation/admin-guide: fix typo and comment in cscope example
Date: Wed, 19 Nov 2025 14:57:27 +0800
Message-Id: <20251119065727.3500015-1-jiakaiPeanut@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch updates the Linux documentation for cscope, fixing two issues:
1. Corrects the typo in the command line:
       c"scope -d -p10  ->  cscope -d -p10
2. Fixes the related documentation comment for clarity and correctness:
       cscope by default cscope.out database.
       ->
       cscope by default uses the cscope.out database.

Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---

Changes since v2:
 * Fixed line-wrapping issues to ensure patch applies cleanly.
 * Formatting improvements in the commit message.
Thanks to Jonathan Corbet for pointing out this additional correction.

Changes since v1:
 * Added the second fix for the documentation comment line.
Thanks to Randy Dunlap for pointing out this additional correction.

References:
 * [PATCH] Documentation/admin-guide: fix typo in cscope command example
https://lore.kernel.org/linux-doc/6017104c-740d-43db-bc53-58751ec57282@infradead.org/T/#t
 * [PATCH v2] Documentation/admin-guide: fix typo and comment in cscope example
https://lore.kernel.org/linux-doc/871plv5mlf.fsf@trenco.lwn.net/T/#m10f8ec032dd57eaf7388939da3722c9f4b599b33
 Documentation/admin-guide/workload-tracing.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
index d6313890ee41..35963491b9f1 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -196,11 +196,11 @@ Let’s checkout the latest Linux repository and build cscope database::
   cscope -R -p10  # builds cscope.out database before starting browse session
   cscope -d -p10  # starts browse session on cscope.out database
 
-Note: Run "cscope -R -p10" to build the database and c"scope -d -p10" to
-enter into the browsing session. cscope by default cscope.out database.
-To get out of this mode press ctrl+d. -p option is used to specify the
-number of file path components to display. -p10 is optimal for browsing
-kernel sources.
+Note: Run "cscope -R -p10" to build the database and "cscope -d -p10" to
+enter into the browsing session. cscope by default uses the cscope.out
+database. To get out of this mode press ctrl+d. -p option is used to
+specify the number of file path components to display. -p10 is optimal
+for browsing kernel sources.
 
 What is perf and how do we use it?
 ==================================
-- 
2.34.1

