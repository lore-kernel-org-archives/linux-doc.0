Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901E1B6D08
	for <linux-doc@vger.kernel.org>; Sat, 28 Mar 2026 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774684119; cv=none; b=kj4v1m6IP5URvYqB3nWrSBKRcTf0x9DzUmjXu/4mAOLsIJ3e1KnPmjlQhnLkUo1TIdpaNRZDBMJQzJJ2WEJEdByvIr4eXG1mXXSPKn69ho90qyEyvJ2dDl9ZLHSjhkhyA5gHy5jGPulYeBXsvT3bqmdcX+plmwbMeQGFopjbDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774684119; c=relaxed/simple;
	bh=dAMuMyhtsRPnxRv4ojblqSNFrdw1vw9bcev0LsRTLCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7lg//j5siumJ+eVJCvQD0yrsKGWFPgSjXDRE1+/BLg4B3rO4HG39L0hD9z++du5FZWe5r2ZHFIrtyZ0Clgj+t9EJPEnXqyCNCopUgLJ2tK9suYU6qnwHPzzhiiEwjAXwjUO/i3TQnPkfJkgCHhjBT1j84dI6oanI1Cjg+Gc4Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmvJ505Q; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmvJ505Q"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64e8ae85700so3305689d50.1
        for <linux-doc@vger.kernel.org>; Sat, 28 Mar 2026 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774684117; x=1775288917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFoQZa2dmnnD+JGA9WJFHJi0YQNPX0KSTuaC/bKeOTE=;
        b=DmvJ505QuxRvAnXclvLx1Ryb5/4kspiOIBmKE3FrUjaJfptWKTy23vGmHrFYocMEAF
         Zyktupf2YuOofVVDPVVlPdJNWP8AYKUmfsVJ/NwnzuNtPecl4HNZQCiYB1TjHTIYtyoe
         oD1Gx1hv85BboGqqP+kKLxWKTDWpP48NTKrzgOpyUp8OLCNOSFsIh8NRizKJnSINq0Tc
         39mMExxB7i7p8W2G/wubEzB7uuc63QXLsJpq2Aij9VyYjHBVOKySpCRbGNtaum+21ggw
         Y5BqwxrdiS0vm3feoSCaQ1i11ZFPHalosJHC3rwEfd2V1AwDxuReML7pdobgMFR0lwgT
         d8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774684117; x=1775288917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFoQZa2dmnnD+JGA9WJFHJi0YQNPX0KSTuaC/bKeOTE=;
        b=O7omREfsOWULGPklFnXjr7LO5BmWnvwxdkrjtZP7Lq1ZYLhmWnMeFEM8zwb58Bo0tu
         KuLx5+SSxWusx7TGUVaqhw6yh6MwulZiRp3FGJ+NrFBUkx1SU+T2+MnOhZFJ1sOQKDJw
         2I78Nr+VYgAHXU+EULe3UXivBIUJXzLp7DoV8NdVTeQfaP5X6T/uS8kcKZdqPSEK0tXL
         jQ5JkMS0xyj7yEbAfOLnAo0gcOyvXpJAV2c2ZCnnloW/W+CDxOm7CGBU6XIxKB3vqkqM
         XL1D9p1VHyL2ry8fspaMNz2zvD2KcDbAcI3965MUxfiLzXI1uAKkyKentNAHP7zJS3g7
         f/rg==
X-Forwarded-Encrypted: i=1; AJvYcCWsTlwUcwKon26+L5A67ITmISZ7k29lEZ7AZEv04rRM2jzh3JcdaZUNjNpCRZV/hW9iD1Hnc4qDJ/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4GB1d7zpPHpubbBT2Z3gT97RtU+iSaDGwjjEgAtJrs0MDzx6/
	GU2/rhGIH9UvUVWdhF4hCCZKYEmjzlFUiu5PWH+noyJhAAKgFbUTybtW
X-Gm-Gg: ATEYQzyJ9jQ7o4hjR/yQx3WrGWiRotMd67O5R1WG4j+ctI0PWu58lgKVbzBHFNJiZyk
	LHaYTAKhquby8sBdzyjjITpXMIuoJeaWNlJJ8qd/I+KR1TR4mcgHEf0FxpwWWRaGPIrGNv4sYdg
	/6snu6rsENEh2BuMXKu08A6dIXEn1G26RIC76g+KK6CH+j/og+2nWC/fPF/8jh7Vmhj0A600U/f
	uDsIBPFQdj8BBfRQIsk1vadgIeEOpeHTNX4EbFqNAXITAs/g4Tv97dcjKfbxT2IUvipCyrO8G8s
	IYlkHvzF//5JkyXe/B9ND5Dx0libMqwMOMf2Qc7xQck/HByfpth3hiDCQEGG26dIRDytUxQTE7t
	a+y6onwZgXWnLCH0oN14MyMgiULdKKbF8xid0BNp4o2Hp5oFLyG2/TzLu3TQEB52Smt4DKq0nkY
	TO2aF4kIvglGxNg7O/5Q==
X-Received: by 2002:a05:690c:38b:b0:79b:dafd:d23 with SMTP id 00721157ae682-79bddcb8e60mr51218457b3.13.1774684117457;
        Sat, 28 Mar 2026 00:48:37 -0700 (PDT)
Received: from Gentoo ([158.173.25.82])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cb9a8f2f3sm6554557b3.30.2026.03.28.00.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 00:48:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Doc: process: Added two important books for Linux Kernel programming and development
Date: Sat, 28 Mar 2026 13:10:42 +0530
Message-ID: <20260328074745.2309736-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These books are very well written and enhance the understanding of the process.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/process/howto.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6f50..c5164a27fc1a 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -34,7 +34,8 @@ experience, the following books are good for, if anything, reference:
  - "The C Programming Language" by Kernighan and Ritchie [Prentice Hall]
  - "Practical C Programming" by Steve Oualline [O'Reilly]
  - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
-
+ - "Linux System Programming" by Robert Love [O'Reilly]
+ - "Linux Kernel Development" By Robert Love [Pearson]
 The kernel is written using GNU C and the GNU toolchain.  While it
 adheres to the ISO C11 standard, it uses a number of extensions that are
 not featured in the standard.  The kernel is a freestanding C
--
2.52.0

