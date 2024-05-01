Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3A53A9
	for <linux-doc@vger.kernel.org>; Wed,  1 May 2024 03:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714533375; cv=none; b=XXM/GyqCLtSqC8LDGSZRw3u/5xx+wwNrrE8BGy25NvuRzb1bSo2ZD2eQ5KhZXxeKspJKsrtwhQ8PKsdvc/Q6s1rF7NgqhLWAK+iDdJIhuMG/ZeAL6Ccfgc1bYUHLewhBnG+jkRIhju3PM4R7jmdv8o3Ga1y5qmGJIShMxbxBsIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714533375; c=relaxed/simple;
	bh=fM3E7VHV8igY21z0/KR6kXLNmpKU5S2nd3tKDXDF7J8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lFZHJGnX8y2R7EEZL9R1dVA8ViBxFetJrgKuXs1muQs0lKrZR2+2vTszjyn0eDuOmlrze3l+dVveNU6V+6jGvnHAZruxhyudfrIenNDSzPXtm05Nz5ahdILiHM9Z9wLtABe3V6+6enekbdQT3jVN1tMKoQpD1uL7vCJmPyE7T3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jm3bo8lL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jm3bo8lL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ec44cf691aso3281225ad.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Apr 2024 20:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714533373; x=1715138173; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaDVbAwDlSNwpvz9fy1n4YZ/u6100O7JsUxkVH9FuGw=;
        b=jm3bo8lLv+1dCJ/GlanAF+SiLClpTk4qaukV/iWRwQdrK/gnsUwrR0eZGyv8ZBMDlx
         EqAguQpe3T3wDLPuLRI/4RyNoXN9kj2JZl5Oj2ydQ3cgvBBt8D3mH9dT7G9B2jGYdAok
         idX2wg2WTFU5mmdpvfStLCrj6KLr2g2LYD3DrELlwCYAAaf28R/daPNdD4oFT3JzHFgS
         qRzBWthcZ3irH3RDQ1Rmc4FeGcuYPHwnwOZWTkzGFUIks0sj3IpnSpbVvy288wutSyv+
         +7ETgB5LYDviN+Is2VhexmIRBr19Qw3mcMm7o/29pisosr3/zexevMVWycKKZeSDlUCB
         Nx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714533373; x=1715138173;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xaDVbAwDlSNwpvz9fy1n4YZ/u6100O7JsUxkVH9FuGw=;
        b=PgNM8+MsnirFFKnKUjJRvfYWQWWMBrHbCdO/QXG/bS9Tk/58cj/R/UOJOQyBLSb2u2
         aeFutD8W7Jt44vQWkwofJfats9CpczDGYfjzpmevOtfzyllt1IeG/PZXdycxfofZNY7Y
         f0PgOQfKk/9D83CID8H20DcIpV/QBraYPj2+v+6PLEFPr+3QDiLipQG+mIjXGFIjEusz
         kOQcEmi6hyuCWjc25GD+5N4swqpYtcwCeW4rw3DY5A6sV61aeAGXOgDDkIqQlr3dOF2Q
         dwhD7M6aHEZA6VgzGCouqp1sYhczsxrV5SHdeAEIrWkC5Gs/GZ4q0DHuMnrLBXQ9hayk
         4S8Q==
X-Gm-Message-State: AOJu0YwLXKzLFOM70Kt+3yfz9cOKWRf9EhAopeywGvUWjjtQmfHn/u8l
	rCqDhADSFrWXDoYqnU3MT/5tI4XfwhBVAqRu5v2Us8RulsHgbdEeAUcBHQ==
X-Google-Smtp-Source: AGHT+IH8vSawCsPDuxSNhs7qy4I+qB3Uvj1eXQ7Ah9VFnLdJ1uURupAT0VAnB1RzOO5j02B58B9QvQ==
X-Received: by 2002:a17:903:244e:b0:1e5:c131:ca0e with SMTP id l14-20020a170903244e00b001e5c131ca0emr6614801pls.6.1714533373017;
        Tue, 30 Apr 2024 20:16:13 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id e13-20020a170902ed8d00b001e4464902bcsm23199622plj.60.2024.04.30.20.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 20:16:12 -0700 (PDT)
Message-ID: <faf5fa45-2a9d-4573-9d2e-3930bdc1ed65@gmail.com>
Date: Wed, 1 May 2024 12:16:11 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: kernel_include.py: Cope with docutils 0.21
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Running "make htmldocs" on a newly installed Sphinx 7.3.7 ends up in
a build error:

    Sphinx parallel build error:
    AttributeError: module 'docutils.nodes' has no attribute 'reprunicode'

docutils 0.21 has removed nodes.reprunicode, quote from release note [1]:

  * Removed objects:

    docutils.nodes.reprunicode, docutils.nodes.ensure_str()
        Python 2 compatibility hacks

Sphinx 7.3.0 supports docutils 0.21 [2]:

kernel_include.py, whose origin is misc.py of docutils, uses reprunicode.

Upstream docutils removed the offending line from the corresponding file
(docutils/docutils/parsers/rst/directives/misc.py) in January 2022.
Quoting the changelog [3]:

    Deprecate `nodes.reprunicode` and `nodes.ensure_str()`.

    Drop uses of the deprecated constructs (not required with Python 3).

Do the same for kernel_include.py.

Tested against:
  - Sphinx 2.4.5 (docutils 0.17.1)
  - Sphinx 3.4.3 (docutils 0.17.1)
  - Sphinx 5.3.0 (docutils 0.18.1)
  - Sphinx 6.2.1 (docutils 0.19)
  - Sphinx 7.2.6 (docutils 0.20.1)
  - Sphinx 7.3.7 (docutils 0.21.2)

Link: http://www.docutils.org/RELEASE-NOTES.html#release-0-21-2024-04-09 [1]
Link: https://www.sphinx-doc.org/en/master/changes.html#release-7-3-0-released-apr-16-2024 [2]
Link: https://github.com/docutils/docutils/commit/c8471ce47a24 [3]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Documentation/sphinx/kernel_include.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index abe768088377..638762442336 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -97,7 +97,6 @@ class KernelInclude(Include):
         # HINT: this is the only line I had to change / commented out:
         #path = utils.relative_path(None, path)
 
-        path = nodes.reprunicode(path)
         encoding = self.options.get(
             'encoding', self.state.document.settings.input_encoding)
         e_handler=self.state.document.settings.input_encoding_error_handler

base-commit: fcb5bcefdbfbd939bf4edfa71182df0b56d20a49
-- 
2.34.1

