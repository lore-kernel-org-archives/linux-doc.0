Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE6817BB2
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707731540; cv=none; b=bI+R5ksxDyRQ85kfWeAgZnQHb011ofYrJgqgfhpwo86haNvBXUQxAYHSRL+DLtnKnu5XhrS/XVquW1SDd/9gh7pWFl/Q9KB/B2Ziaq2uIwznruLJn9IhcsBfNfXcU+yjxG/HWLPS0JuP/xsah+4CH5vYIj1Zsb3EayVDDlcq0bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707731540; c=relaxed/simple;
	bh=ZF6rXYNNIOq2KLy6c8hHoqHp0kSlA2/VdKUEAEOhCCI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=THhFzoOZXLEqQIdDkDuD3tQXoKzhSMPiXInRDgzVEI1Lt6QIlM2Qr5WcPhxDwhj7v7PjmC3IC5aOm/MBLnpT/zlcZpXZWTapdSsZL4zgYKvDs55j3v6E+cB2VCeRL7NmbkMKjlfJxtZBfn5+yRYRbXphGsOuL1B78dCxiTcm/I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itVHb9tx; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itVHb9tx"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-59cf563e8c6so856895eaf.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707731537; x=1708336337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CP0NcOiRJGJhDfn4ULCaGJamTIWKa2DJMjWoxMN11U=;
        b=itVHb9txEwyFOKSkuYfGxZyZz6r6XH1mnZ6WXQSRkq0mgPQTnbyfCPomgNDrqcH8e1
         shRe+Dm+1jZAv+G0Suh9cCdQcrbKVivb4U2Iw/FXV/fLPq9nQQHCcO93CAh4S9vJWDR/
         V0mlgHk7xTw/L2LxDkv8M3xc/Jbv8XJHYkyLRb7J01Fnb0iHV6ACaknN7r+TbM/0s0/h
         DcR8izNzJh+wjiFED7Cvl37TGzrBL8FO4NPpiQT7sPuEfUbjumYZtcdJCNq2UFPSrlbD
         8Q3viBrML5A1Xq+dIakiwW5hfUNP/FOqM4b9QQwscSBUAd54Zrka+zzUuoMnK2UemvxJ
         8PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731537; x=1708336337;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7CP0NcOiRJGJhDfn4ULCaGJamTIWKa2DJMjWoxMN11U=;
        b=EvSJU7aWYf+jYzqAbFBr4a9Bm7cHpz0F06f2eJM+xdQSNfJvLS3uneqjNGo7alCmmp
         x6KRNU3mLm7Tez8A5VqOZG8wCJVvpnI2Yc3ya82Mgl1ns3LZ3vXJ+AuOowjJ2wcx4QOp
         nUeYEG76Mk5fFD/CSfzY3RiBDaMsOFreRZampNFdGaOUsLmLxS86t2uAWdezlzT3+E4f
         ZL+yCN0NNxkINO1LCV4jVjAAIp3oy7nkLOZsv4ol42nBH0LWaSUYOEddyvimJnus5bpY
         Hpbwc8HWCvSnDRN6FT2oP+Nw6O0PBv3h8qCq4IrLHt4Gb9Cb7thImBkg4um+E9syGJWL
         Y4Xw==
X-Gm-Message-State: AOJu0YyGIqyPxlWDXo+sJmMGDECvmCO1xN4ChUEu170DmLD3XXl0U5rH
	cOPy31uxrppg9YdciWtbLUPIzxuQMNTHKoi2qdH1M7kjcEy23CQc
X-Google-Smtp-Source: AGHT+IHrLd8XjYXgpehcyDQ6VztwfvHqSKD1WFZqRedhxP4o9/jnY5FeRvw4x8y+Ti79Z6DZR68dTQ==
X-Received: by 2002:a05:6358:5985:b0:178:76f8:e626 with SMTP id c5-20020a056358598500b0017876f8e626mr9809634rwf.6.1707731537325;
        Mon, 12 Feb 2024 01:52:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOh2kpjDwBXy1gzHA/BijYRht5XFZbrP0f8kjVak75fFP+XP3eOLQxL7bIFNSas9Gl6WYRukzb6K5pJtMJMu4o4TuM9hUOcflT726fMXYcyw==
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id s64-20020a625e43000000b006e06aaf5e58sm5402604pfb.34.2024.02.12.01.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 01:52:16 -0800 (PST)
Message-ID: <54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com>
Date: Mon, 12 Feb 2024 18:52:13 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: docs: "translations" extension breaks "make latexdocs" with
 6.1.3<=Sphinx<7.2
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Akira Yokosawa <akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vegard,

While testing update of sphinx_pre_install WRT pyyaml, I noticed build
errors in "make latexdocs" against Fedora 39's distro Sphinx (v6.2.1).

I don't mean the translations extension is doing anything wrong.

Repro:

    make cleandocs
    make SPHINXDIRS=doc-guide htmldocs  # for yaml -> rst conversion
    make SPHINXDIRS=doc-guide latexdocs

At current docs-next, Fedora 39's Sphinx ends up in the error:

    Exception occurred:
      File "/usr/lib/python3.12/site-packages/sphinx/util/nodes.py", line 624, in _copy_except__document
        newnode = self.__class__(rawsource=self.rawsource, **self.attributes)
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    TypeError: LanguagesNode.__init__() missing 1 required positional argument: 'current_language'
    The full traceback has been saved in /tmp/sphinx-err-7xmwytuu.log, if you want to report the issue to the developers.


/tmp/sphinx-err-7xmwytuu.log reads:
------------------------------------------
# Platform:         linux; (Linux-6.7.3-200.fc39.x86_64-x86_64-with-glibc2.38)
# Sphinx version:   6.2.1
# Python version:   3.12.1 (CPython)
# Docutils version: 0.19
# Jinja2 version:   3.1.3
# Pygments version: 2.15.1

# Last messages:
#   building [latex]: all documents
#   updating environment:
#   0 added, 0 changed, 0 removed
#   reading sources...
#   
#   looking for now-outdated files...
#   none found
#   processing doc-guide.tex...
#   index
#   failed

# Loaded extensions:
#   sphinx.ext.mathjax (6.2.1)
#   alabaster (0.7.12)
#   sphinxcontrib.applehelp (1.0.2)
#   sphinxcontrib.devhelp (1.0.2)
#   sphinxcontrib.htmlhelp (2.0.0)
#   sphinxcontrib.serializinghtml (1.1.5)
#   sphinxcontrib.qthelp (1.0.3)
#   kerneldoc (1.0)
#   rstFlatTable (1.0)
#   kernel_include (1.0)
#   kfigure (1.0.0)
#   sphinx.ext.ifconfig (6.2.1)
#   automarkup (unknown version)
#   maintainers_include (1.0)
#   sphinx.ext.autosectionlabel (6.2.1)
#   kernel_abi (1.0)
#   kernel_feat (1.0)
#   translations (unknown version)
#   sphinx.ext.imgmath (6.2.1)

# Traceback:
Traceback (most recent call last):
  File "/usr/lib/python3.12/site-packages/sphinx/cmd/build.py", line 285, in build_main
    app.build(args.force_all, args.filenames)
  File "/usr/lib/python3.12/site-packages/sphinx/application.py", line 353, in build
    self.builder.build_update()
  File "/usr/lib/python3.12/site-packages/sphinx/builders/__init__.py", line 308, in build_update
    self.build(['__all__'], to_build)
  File "/usr/lib/python3.12/site-packages/sphinx/builders/__init__.py", line 378, in build
    self.write(docnames, list(updated_docnames), method)
  File "/usr/lib/python3.12/site-packages/sphinx/builders/latex/__init__.py", line 287, in write
    doctree = self.assemble_doctree(
              ^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/sphinx/builders/latex/__init__.py", line 344, in assemble_doctree
    largetree = inline_all_toctrees(self, self.docnames, indexfile, tree,
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/sphinx/util/nodes.py", line 403, in inline_all_toctrees
    tree = tree.deepcopy()
           ^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/docutils/nodes.py", line 1064, in deepcopy
    copy.extend([child.deepcopy() for child in self.children])
                 ^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/docutils/nodes.py", line 1063, in deepcopy
    copy = self.copy()
           ^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/sphinx/util/nodes.py", line 624, in _copy_except__document
    newnode = self.__class__(rawsource=self.rawsource, **self.attributes)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: LanguagesNode.__init__() missing 1 required positional argument: 'current_language'
------------------------------------------

I did quick tests on Ubuntu 22.04 + venv (whose python3 is v3.10.12),
and found that Sphinx versions 6.1.3 and 7.1.2 also suffer from the
same issue.

Luckily, Sphinx v7.2.6 is not affected.

Bisection pointed commit 7418ec5b151f ("docs: translations: add
translations links when they exist") as the first bad commit and
reverting it resolved the issue.

Sphinx's git history shows that the code at line 624 of nodes.py
was added just before 6.1.3.  It was heavily refactored during
the 7.2.x development cycle [1] for improving TOC tree processing.

So this issue looks like a regression in Sphinx which has been
resolved upstream since.

Vegard, please let me know if am I missing something.

[1]: https://github.com/sphinx-doc/sphinx/pull/11565

        Thanks, Akira
