Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47408221D96
	for <linux-doc@vger.kernel.org>; Sun,  7 Dec 2025 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765096086; cv=none; b=plZMiCG+59zTwC+YzdqLJ1PBmzWBTgXco5FCKay0czrClWeCbe7eXWfP0x4EDh7t3oJzXOkaNrLLkgckyvsYVXmyF0ls7Vn2+qcaYJ5NBrYvrfmfEZYhwt0LFG0ILL6ZFja3Wr2s4fseGW1tikyswWNCbr4hp6wWd7/UaOtmZh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765096086; c=relaxed/simple;
	bh=5ClmdOCDf1/5vy5FcD8FPn1RmL5hgK40HTsQEKjypJ8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=K3wzl0IBMoAr11QhusTGUiyU2u0GvAn4Z8Eyf5NHz8gJEfKiE7UdszGP9QHPfAXJVyMQtcXq4eSqGOHaJ7qoCxoLfYNJBMzD1d/hFOYS5UdhcbSv9kVzseiMimH1QvHwxsxMrJEDjkS+4XgEiABIoQJoXKiN6i1P+OglYTdWd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7eAai9X; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7eAai9X"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-450b2715b6cso2061344b6e.0
        for <linux-doc@vger.kernel.org>; Sun, 07 Dec 2025 00:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765096084; x=1765700884; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PSAbD04h6sKFXn0OQd9iQeA/OzsRyavRDpci7LcwMbE=;
        b=T7eAai9XHLZSA6LZnlYJj0aL5JdF6D3aQiOSSL2IwLpVRF1nB2vK67sfQ+UWtjg1yh
         FYT7AkDvXKNd5MOYGUhwEsgs7MvwAiwvIfHKMK3G81OyFcbpvDxzM7Pu7Yoa2hH49tlW
         i5UuVlu/DS4LKfapSwwpyDtrHb6XkpDDv6cF1OiRe5Ft/twy+ylc49cajXJs4MZXwc8I
         kcVUJPKQVrPiDMN/EyTMwjp4QdMj50t3DJyDLVo39Idwnuu4prTb4GmRQbXazLa5Sh7S
         /i7BdnNZY5XBhjMafVS2Ni9SFGuYx4vQO4IaIIiemMVXi2+07Xa4V078yZykTPIP9mxj
         2muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765096084; x=1765700884;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSAbD04h6sKFXn0OQd9iQeA/OzsRyavRDpci7LcwMbE=;
        b=F5/d2GDV7KO+gCjy4JxooQYaVYhyl9vB4spC9Am+ZYGYTL4NSdMI4pzoeJyraVEsKS
         ymiUChlpn7/qi49WFEjwfSGo1Z0ez5GSG1mXAk79PbhbG4SSldg6Poyd8A6fPjA1kKf8
         Dshz2lzCyVS9LGQb1B36I51v/OjE/GqyIl+xm35EpfCAppSkyL0rRJPFLkorBWpTSBV7
         GCUrV5QnG2Q9IjmO9sCWqQATYSF5zmPpsH4xgfJ0tOZ6YD4ytL2GOQjzrHiPqX1ZR+Z4
         NRjIxRmhdVdsi5TJwrjdCr4mxoqLVVTgjWaPgH96ZTeSjBtwgWCJciHX8NphvZfJNAU3
         Hi4A==
X-Gm-Message-State: AOJu0YzKJEmjIekqDPsAhnkm5N56Oog+rSGrYqHuzcaRb/rUEmqxy/5p
	YWkghxuZZzpXvEYo+zlFTyA/ggIk1pYQa39mR/pJub1VCSx8SbiKtS3CXT7+iAaFYxho85lzL7t
	Z1guVkqAB/eU4GGw1Jtjma7K3uA5bhfLhkmL0
X-Gm-Gg: ASbGncvua6MdC5Ak094pLZR/cRRsetlr/snRHKvp6CZUgD9bjBsBIJ+aP6MAWsKP/++
	h/7rXk1q6Ig2KOzDjg6GIhXA+lH2AMMwoPprt5tRmTXsPl9BgY5DpsPkH9HCp4ScjYLv+9yhzZa
	7+8YnerAuy4myLDZcA8Rt2Ai3yzh0Y2omE3/zo6X3LPoe5K7MVbzN2hVAf4FXOKBkx3O3qotUUA
	5pu4l/Eod7sdntHwLOYxb1+gnAAwp85n58tEjHZez9D4RkHvUM88roPnn0EF45Co3snDnJb
X-Google-Smtp-Source: AGHT+IGWgKDILXuE/BLfH2/nRzQWJWplxqtYTz7baQB1t4HCu/nI7k2cteHOAIeOOpe+F2Fn7O9wifBeympC0NPLyYk=
X-Received: by 2002:a05:6808:150b:b0:44f:e471:b52e with SMTP id
 5614622812f47-4539df93050mr1676029b6e.11.1765096084158; Sun, 07 Dec 2025
 00:28:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?= <kartikpro9599@gmail.com>
Date: Sun, 7 Dec 2025 13:58:05 +0530
X-Gm-Features: AQt7F2qrIHeiyKU2Nd1BaqzGbTxRxEQ1WLgu4AhstzQ_c1kwQLM1QYhYhTt_rz0
Message-ID: <CAOCmVvBrTQiNZi1Du=d6CT_zj5nLpBKt68xJm0kR5nSxGBtNNQ@mail.gmail.com>
Subject: [PATCH v3] docs: improve introduction wording in howto.rst
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From cc05fff6b2ad1a5ca360f5ac9730ccc499d4606e Mon Sep 17 00:00:00 2001
From: kartikpro9599-hash <kartikpro9599@gmail.com>
Date: Sun, 7 Dec 2025 13:53:02 +0530
Subject: [PATCH v3] docs: improve introduction wording in howto.rst

Signed-off-by: kartikpro9599-hash <kartikpro9599@gmail.com>
---
 Documentation/process/howto.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6..dc299e05e 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -3,15 +3,15 @@
 HOWTO do Linux kernel development
 =================================

-This is the be-all, end-all document on this topic.  It contains
-instructions on how to become a Linux kernel developer and how to learn
-to work with the Linux kernel development community.  It tries to not
-contain anything related to the technical aspects of kernel programming,
-but will help point you in the right direction for that.
-
-If anything in this document becomes out of date, please send in patches
-to the maintainer of this file, who is listed at the bottom of the
-document.
+This is a complete introductory document on this topic. It
+contains instructions on how to become a Linux kernel developer
+and how to work with the Linux kernel development community. It
+does not cover the technical aspects of kernel programming, but
+will help point you in the right direction for that.
+
+If anything in this document becomes out of date, please send in
+patches to the maintainer of this file, who is listed at the
+bottom of the document.


 Introduction
-- 
2.52.0.windows.1
