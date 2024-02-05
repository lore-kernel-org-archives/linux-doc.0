Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642AD249F7
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707139653; cv=none; b=nCK0tEaAdvH5Pd74l9OBi51k5qx+VzAEPOH/OX+VxT0AMs6dF/MyEPjSOHyylT67QXGkl/POwjDdxF2d4/AWZtAsprAk1N2iPWIbwSBSpvzJvO6Qkj5NjaYbeWac/5DGLKkhjDpTByoz06GreZiggyH2gZyOKMXXmVf6nrlgiFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707139653; c=relaxed/simple;
	bh=ohd2b4QJUiBI+u2W+/bqlN+cDhKAzefVIpOzmXTVka8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pm3IQLSMT4tym4lYAC2x5JgWrRd5vIJXiTTbcLBYJLnAAqLdI8edzDeSso5ozbQ0wRdnmlk+ku+ve3VaGdUZjR+Y8LUXQbDf1RSSn4RFyI3G18XN5qC6SJP26LUVMncoQ4Q6ziGgK9mZxy3mRQCLRPa9Y0mT624Qjwtk7HD9FjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=iAU5Cygi; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="iAU5Cygi"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-51124d43943so6935136e87.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Feb 2024 05:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707139649; x=1707744449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5n4ydAnPupPd3U6BJzPTr7OuGw8QKp6ux4SyUSisFEA=;
        b=iAU5CygifKUFaYJGEH3oS0gj7Iva8mcgw/OQiuTgjCEMLRjVqStipxUTkoqBOlYoQY
         KWsAQsyuTePfB2bU/Hu1pCZVPbDAHeRBlI25qa3vAmtce32nCSjXrFBxcjFHpVcAYLrh
         Odzq0DozEyMYCsRB90eB6qj3rydRnpctqAb6rwGQhi/eyuKjVkdgQ2+7fdBsE2hylxf4
         RVesgnoDygat4V4dtH+k6G+HTpson1rBW0sZ0DNz/s34mNAGrKj4s/hfywStUGm2BQv/
         VWlIRIOzIc9uMGG3KVQ3XQDfDZhlL1AFAr0uTtN0GrB/yKRSCXLdZLgsJWSstPrNJ+Jt
         V2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139649; x=1707744449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n4ydAnPupPd3U6BJzPTr7OuGw8QKp6ux4SyUSisFEA=;
        b=vU+ksLY9ohKkrdPDNTjJUo1XRNY2npvk4VLTQQI6njkgkVqQ+yDzHjtakIRKj8cRDa
         6+I12i33vLh7umDag7Ob8GbWIQ9u2Ofey+JwvigFi1/j/71yU+mvYCwgMSXNHbT+ZHm4
         KK4QfV8rHzE7gVk4mucWn6jdJAwDimAgARq4yrgD/vpPm1jcatBdQGqb2iOD2uGT7mct
         fJZjh3kobTRJD4K/hDJZE0AFGLVgrDp7Bixiab8rGcqOgg6bPEWIB2xTo3Uydc2LPYxf
         l+9Mdk11lvTheApBNIxCbK5c6hK1pgENtuyeyf0vVF7thxFY+AHidYYgxodQa3atb+NK
         hHpA==
X-Gm-Message-State: AOJu0YzGu9982G3VTIvhoAX/DFQm+px5giY+dsvG9fhJIMp8Ytulss/f
	VNPbeBoTloFa6ddduxQKRoq3CPHiRLGnulKh4DkIFro4SWqhgthLHwwBux4nKH4=
X-Google-Smtp-Source: AGHT+IGu2gtE1cUt6AHDOUPwaptcYcsZjSXRvZxIhDCgcRk9JF0x2AihclIRoqRhXs/mFwdgEWbSeA==
X-Received: by 2002:a05:6512:5d7:b0:511:486d:454a with SMTP id o23-20020a05651205d700b00511486d454amr3380981lfo.39.1707139649198;
        Mon, 05 Feb 2024 05:27:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVNcP7Glt7qtXOYVGsFMgoaRvL0k6QMXQVxeVyrv4j2QCU7c3WomuBcT3v1VM4TcRpJ5K4aE4RfUhHCgSkIXn/wZTgUdO88TVSNTIzP9SKFNnTFyzM8K00nOEuBRVFNw1A1D6+WGp3BFvIcrmxMEy9qFDNfboDMWu7YQg==
Received: from debian.fritz.box (aftr-82-135-80-180.dynamic.mnet-online.de. [82.135.80.180])
        by smtp.gmail.com with ESMTPSA id lg25-20020a170907181900b00a3756cb9370sm2872837ejc.91.2024.02.05.05.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 05:27:28 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] Documentation: admin-guide: tainted-kernels.rst: Add missing article and comma
Date: Mon,  5 Feb 2024 14:24:10 +0100
Message-Id: <20240205132409.1957-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Add missing article "the"
- s/above example/example above/
- Add missing comma after introductory clause to improve readability

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 Documentation/admin-guide/tainted-kernels.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index 92a8a07f5c43..f92551539e8a 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -34,7 +34,7 @@ name of the command ('Comm:') that triggered the event::
 
 You'll find a 'Not tainted: ' there if the kernel was not tainted at the
 time of the event; if it was, then it will print 'Tainted: ' and characters
-either letters or blanks. In above example it looks like this::
+either letters or blanks. In the example above it looks like this::
 
 	Tainted: P        W  O
 
@@ -52,7 +52,7 @@ At runtime, you can query the tainted state by reading
 tainted; any other number indicates the reasons why it is. The easiest way to
 decode that number is the script ``tools/debugging/kernel-chktaint``, which your
 distribution might ship as part of a package called ``linux-tools`` or
-``kernel-tools``; if it doesn't you can download the script from
+``kernel-tools``; if it doesn't, you can download the script from
 `git.kernel.org <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/tools/debugging/kernel-chktaint>`_
 and execute it with ``sh kernel-chktaint``, which would print something like
 this on the machine that had the statements in the logs that were quoted earlier::
-- 
2.39.2

