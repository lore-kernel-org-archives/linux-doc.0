Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180AD3E3D8E
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729732; cv=none; b=BOD/Rp3izJOeUfNg7RxtWEjZYMeVbHM4j064dv0FuKaKR+aP81xz0osk+V5Mk9N5+e1dlqX7DPOggPSZg9enc3tmuq2KC0e9IJxZrdqbimGPeKLGCfb0LvH+BUMjtZYZy/IiWhnhdzbF8DHAjx18fz3L16nOcSZyr1W1FQa2wj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729732; c=relaxed/simple;
	bh=/LRjn4DsKeVQZ4dzyANbTGqQ6W2rGj3js9YDFwrFWZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VrNXM8FYNdSu9GXy6lOQxQsPX12xoOlRrfPzFhHW3P6t31doHHMCnQNrC4EToU9++LNZd1UKd6K4oca9qHZyJaaoXxpg9IILKZSZl4K9UnCxgPRw5S3P3HbUTo9gInrZmO8JdBiyopmoioB2+EHlpWmVD/CFOAQ4oIfKig07nVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pHhQ2/8u; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pHhQ2/8u"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837a718f41so44073125e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729729; x=1773334529; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMu0xUqSjGdHKDTYMSydPkunIn5YCF8kNNeiDqHV0Wk=;
        b=pHhQ2/8uHTpXv68YWMRQZBJDjsKwVeJRgcDzZmZL9spHMUz6RVYPrsZBQY6CXE5ySO
         RNPUa0ReqPw5OJazHnkzxakJYEiN23VXB4MRuviR7wRS/ppXc0/qAxASRBhmIhuyI/C5
         PtlLCwaS5vl2fOe2l/KpYcOmg+A63HT3ltfE0Iw25y9glu/md9uKhwirBllxdaLgYBd6
         t9n/AEfU3bt/QeFN7833QITar0rY5e2k9ysPjXCarpKq9eg9sF4ujvcbx+sKUDYdonJv
         nY3n/6XyF/clIZn/KFdzIJKwMmUVtHwTXf/06e5hS/LB2TGjDrA5G9yru5MIPxGL8pQ2
         blyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729729; x=1773334529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMu0xUqSjGdHKDTYMSydPkunIn5YCF8kNNeiDqHV0Wk=;
        b=vQZOXg9VlXtajL+VOLZhG8ACeRPs/hUz4+2D7LmNh5mjH21JCe87gJ07Us7uZUhVHl
         MJgmKCEJkT8deoxjHEkyjUPvT6dPoZuS7dsEFEIdXndoOAlkId77JXKXbSbVDINArcQj
         4ns16dseBMPWDcmDGRi/DJegBuP4L1hHkHnkWkmvXIm6TjQQ34AA3lGMmjitGFD69uq4
         HBKa5CqrlWTRwk/OvJEMEt+cjALcrpzFOSrA0bEIowDMR2KrCLK2m9yzN0/HzXClpVnC
         3xTJt24XS5wq8GwfM/pRzNWHYpBTdAMd8afy9Yo7ilwSZHbZs0B10L8beC63BtbBn6uh
         7OWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjCYIp9apRum1lzOKOBCJibVaOdbeiiXrvdly2fwxrNZQxSjxMWMgQJVvdwbuArzLvfZgG4vwsucI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTSPQQiy2oyvREaF5pbZIbv7w0VXZ8MCb+G3UwUlG9DvjqTgwa
	xdVya8Bj29yH0Tc9EIZB2Kjy6SPGfOd4lKWBbbaYzToycAsuYTTbU9OeHui9U9AJJis10sZtaHo
	aUjxcgAznz/MSHtu+sQ==
X-Received: from wmdd20.prod.google.com ([2002:a05:600c:a214:b0:480:4a03:7b6c])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c4a5:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-48519826fadmr111254425e9.5.1772729729537;
 Thu, 05 Mar 2026 08:55:29 -0800 (PST)
Date: Thu, 05 Mar 2026 16:55:24 +0000
In-Reply-To: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-8-6a76bf8b83c7@google.com>
Subject: [PATCH v4 8/8] documentation: remove references to *_gpl sections
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="utf-8"

*_gpl sections are no longer present in the kernel binary.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 Documentation/kbuild/modules.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index d0703605bfa4..b3a26a36ee17 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -426,11 +426,12 @@ Symbols From the Kernel (vmlinux + modules)
 Version Information Formats
 ---------------------------
 
-	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
-	sections. Symbol names and namespaces are stored in __ksymtab_strings,
-	using a format similar to the string table used for ELF. If
-	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
-	symbols will be added to the __kcrctab or __kcrctab_gpl.
+	Exported symbols have information stored in the __ksymtab and
+	__kflagstab sections. Symbol names and namespaces are stored in
+	__ksymtab_strings section, using a format similar to the string
+	table used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs
+	corresponding to exported symbols will be added to the
+	__kcrctab section.
 
 	If CONFIG_BASIC_MODVERSIONS is enabled (default with
 	CONFIG_MODVERSIONS), imported symbols will have their symbol name and

-- 
2.53.0.473.g4a7958ca14-goog

