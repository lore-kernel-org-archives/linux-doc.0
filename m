Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E609937F324
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636586; cv=none; b=KLhUjVca+Rw5yXqfcB20vzHwHa1OyLB14cd9aWJZk9vetIZuVZsCJ41IJB1zbwSX3RndjeSfylViovQe3LzPyLTlDANVyBTIfTOxwy6LBCG+ozqtlTzB2ELuvSngJ8GN9xUvR0RYKtfEzZHDWDcNo3ios/9J8up5OP0CqdWicEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636586; c=relaxed/simple;
	bh=d64vrkzV8SwOJMlfAMFEdEJjMT39PCBSfivQv0NFu/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3hheY5P8eSePqupmmYIbX18mpMKap/TxnQhYWxaZtQjPyK6Ek2GySI+9CAxEWvepHMhpIb1+/wK24hsXjjMsqSs/ZDEglgVkzrV6/412PGkVWmKqyL0TO6+Z1dOUyvam3fbAeu8MUL9QVvcIczusgItdqNxNrw+sY/tvK4x+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAxC8DJ1; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAxC8DJ1"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-87005a0e052so26191707b3.2
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636580; x=1789241380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JdpH8z6Rb7sleDgNsPa+IW/WQmX2mRqnvOWICUv+Ss=;
        b=qAxC8DJ1oJZprWRGoKUSueX/DlAhcE+NuMXLAsk9BHdRXX8yaVbHQ3MzyRiBMmSimv
         PkyBxif8MLuX1LP0skZhoucKFX50HDgDZ+S5WkwCoduBxtQHwW0E7ptlG9W/HP5LOH9M
         5yVeLlE7V8TcPFAj+kbpJDXTfAjWSC/5GDpXO5kIVf6dAxBzOackN3UfgCfINaTTXe/s
         Gx+juww3HXV5O+jrJLrRpTZ3t125Q3kCnohUHCnRocgel+CcABF7lMb6IEvRK3MTjlyc
         TIBrzYoY/j/jR9vHiAKtN3SMIR26aFBgO7yzH7R883Hrihl46OlVP5hIgNbNufrEiToP
         Cmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636580; x=1789241380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JdpH8z6Rb7sleDgNsPa+IW/WQmX2mRqnvOWICUv+Ss=;
        b=h/3np5KlVuSEG2SdNXdv99uLoNCAPJLXJZ2pVamUMZfd1m04GApMnTuEIU6eVoIkWU
         VB5u9RMIrJ11rn/qchBtW5iyBzwSNwMfY6gB3IG5qM2pa6nYGl4uymPpOLjv9b87/Ebe
         aYE3DBFRXO7Gh6LEqTYnqc+gK4JJsCGxtwMb4+9f6zNlGPXW4gLr9XcaiHfPit3qiMUs
         sWMhgrwjieewUI7kABTUX9sPuon3BmzkBNt9H4NMsV7ARzFZkDF++4rLd9nVS/sNRbTF
         MPUaFEn44HRBBc1BNGu1MvxiK9031I4H25GaSQagiM0h1Z0YqIgJJ9nUSNeixuEhYbE5
         y+XA==
X-Forwarded-Encrypted: i=1; AKwUvBw8TL/phA1MwlwaB9yQp1zQ4QINXVgYtX72M8QOPrb3WhALL2O5lWtunaN4fqwsvStuJGDEc4oRO6c=@vger.kernel.org
X-Gm-Message-State: AFuF++m20eC1aWuyev/KHxXgLXZuPyM20ExfWwP1CF1B0ZW5WYeswijY
	5Lzl5a+fx3pcXx+D+7j9fkkjhKWLwSwCAqrPcN0Qd0i9P4tXlrsIq1x4
X-Gm-Gg: AYBFou399s9DEJtNpGXV50JnurFyYH7Ipxex+np4kd/sxkYY/OCtNjYQQ4lHBcXy2AG
	SAwzTdJ+ceD+r95yK+IhoHePH066SE6sVBRyq52X6eWHEvHiYWHBKypb8HCOy3Rslf6JpAzrA/t
	h5NxRqC+PeKBDGgq8kfB8pr1hEohB4Gc4xlTzC4BuvQsN1fkh7Rdq1MDBq580Lfn6OtMlr5Rjp/
	yXf2ehFkdbUAyIIfS3XALj6eaMWzmtBB2kZHoJUP9OtG3Evj0x/0YLGJ/8qKpT58YDBzt7pdGg5
	Ymt2eF50gW5fkX0swV8XMK/TL9okEfiCmv0ZErWqafl58maRw+PIx6mL9jPLCgW2qdV438VDI3O
	4tVDyksz3hOZBCi+ii/2dQeKF21HGDfUw/CbfpTryVeusynoripvcb9EF+6F9YvMlMNbz034WfX
	pplGEtE++N6KY01T9RFxOE0PgdaItTlpXGER/zLvXSQo8O6JVLs7mobxv+iGmK
X-Received: by 2002:a53:490f:0:b0:66f:c1bc:4094 with SMTP id 956f58d0204a3-66fc1bc485dmr2007771d50.87.1788636580506;
        Sat, 05 Sep 2026 12:29:40 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48fb6d5sm4938594d50.11.2026.09.05.12.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:39 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:28 -0400
Subject: [PATCH v2 07/22] alpha: select ARCH_HAS_FAST_MULTIPLIER
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-7-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=d64vrkzV8SwOJMlfAMFEdEJjMT39PCBSfivQv0NFu/w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E52OS953f6VlMGdbfOOiZqUx+b8/qvsEHX00sZJp
 28vXqD7v+MjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCuMVRnZHhVdITDzN
 X1/ZZT7/jk5OsuOnjyCsousnkdKlJ+fmvWU05GhlWLgz6/ueSyxFBtt1aHXZf9g7iqWEbJAzp/n
 s9ceDK2hwUA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

All Alpha CPUs have hardware integer multiply (MULL/MULQ). EV4 and EV5
implement it in microcode; EV56 and later have fast single-cycle
multiply. Since no EV4 system is likely to run a modern kernel, select
this unconditionally to enable multiply-based fast paths in hweight and
string routines.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index d039b7135d18..2672971b83f3 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT

-- 
2.54.0

