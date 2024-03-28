Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0881AB1
	for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711635616; cv=none; b=pf06pk4mdGxlQ7gpfhN7BYS3o4z/6ikA44FIIc6MkJ/qaVb0pW2T/Nno+UKh+HGXxHdPqMU3pXfpG6Il8zPQEcI9+XA4X+ph0+c0rq46cGXFZVhKIShAOjWLCl//+VZHsFzkFAq+e1+46hEWsDoq0zvlxDU+D44gCVDyrIgDRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711635616; c=relaxed/simple;
	bh=YHZ2qDQtrHJ7X6uQMFA19oqP0aMOKlutpOAK5TIojS8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XozSt8QiSXCcFvn/CtUo3b1sWnNtWbueIYimXmEpEZDqn+kwOg19DcP16c9axgsIBvTqZXRRkc1k56rotEf2Mfg8QgqF/nrhnDzs/b2emRbSN3lvfDqhffDD0GjrWWc2UnQxxqIeNMu8t6PT9J4bRi8txJJQfyJ1LB8k+qr24OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VJn6ShWU; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VJn6ShWU"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dd933a044baso2532184276.0
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711635613; x=1712240413; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ywi9W0+VrdEwTHjF11TkVgGoMgKOQYfnHN16lHNeHLA=;
        b=VJn6ShWUsDGhgwyIAESpUvN+73/Tm07JGNVBcPqPRuzcYaop7wLxMq4rM1gBWQaIII
         gs5guBZyrHpywU6wcTzoDAAXFK/rJI4mQD/0rdyMm5eGnOX749TQEXwQAMJDrSHjxZPT
         E5VcsEMzLrxJuAsb9dT9sXeFU8qUS8CbRB/DQSTG5Yug5fT3sq+OPfmjD4RrT5Ptcd8d
         yvblBrnSq01YUNvrbkUceMqUDB9IviJCEgFRpSelBNwFrXGIvSCUMiC5gyxld2HpIqmf
         po8axAGEANyVb5maOSTLXJKjGjQfHB74EgLGyL5oOQ3meWfCBk7KZI9oMxCHEJ8Ik1xm
         MZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711635613; x=1712240413;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywi9W0+VrdEwTHjF11TkVgGoMgKOQYfnHN16lHNeHLA=;
        b=ptQOP1dFQHj9ingydsPh7OP2PYqPr6aL1OZH+BTwXtjNKjuCvCSMLIS2M/TGnscpSO
         ZDMDW2nsgeKWmdexON0gOmnw9NWoogJQqyll1jmeLjLMNa13Y4GQG8yfPooCSr7HA56y
         G7shL5poG5Fo8e2nMhzcZHozevlJOFCh2a/n2q+Aa6ArM8xqh/o74cNTkU84K5JzxEwu
         AAOyOnRE7LqFJQCdZbr4j6V3n+RD/WZgihav2XXUphFz/hiJ5C2XAoS2RJZjLxOihNb8
         YAQVC2LS7ifN1qcLlZHN7WcBtklSmu+dc4vs1RPe011jJxdwdzEL/XENsPoMHvH9tidb
         u5pw==
X-Forwarded-Encrypted: i=1; AJvYcCWafbUBx2598l3wWuaRwcOR8KcRhrTJX9MgRgFcZzfspwIravMu3Fsn7lzjelgWbi9ONoy1oUUB9iVNc75qRFCBh0kuVb5xICpq
X-Gm-Message-State: AOJu0YzBLBVRAF38toLwrLdZYDkl2bOjpCNrfL6FtHuc4fK5DVh2iunk
	JJ8u0DvndMa1Tef69Gu5qgRDzHoGc02bdS33VVkChXyhQrESR9Fr5BCr3W5J7OThwH/c5M2IWfb
	WO9wiakLaXQ==
X-Google-Smtp-Source: AGHT+IF5T/UC/ZI+sJghdQaQT7RB77mNf5c73vZHpF2Z2msrfpy5Y10FafAMAzCctl95KssMUBsd0WjxxlFQSA==
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a05:6902:1507:b0:dbd:ee44:8908 with SMTP
 id q7-20020a056902150700b00dbdee448908mr759573ybu.0.1711635612898; Thu, 28
 Mar 2024 07:20:12 -0700 (PDT)
Date: Thu, 28 Mar 2024 14:20:04 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240328142004.2144568-1-jackmanb@google.com>
Subject: [PATCH] Documentation: kunit: Clarify test filter format
From: Brendan Jackman <jackmanb@google.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Brendan Higgins <brendan.higgins@linux.dev>, davidgow@google.com, rmoar@google.com, 
	corbet@lwn.net, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"

It seems obvious once you know, but at first I didn't realise that the
suite name is part of this format. Document it and add example.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index 19ddf5e07013..e75a5fc05814 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -156,13 +156,20 @@ Filtering tests
 ===============
 
 By passing a bash style glob filter to the ``exec`` or ``run``
-commands, we can run a subset of the tests built into a kernel . For
+commands, we can run a subset of the tests built into a kernel,
+identified by a string like ``$suite_name.$test_name``. For
 example: if we only want to run KUnit resource tests, use:
 
 .. code-block::
 
 	./tools/testing/kunit/kunit.py run 'kunit-resource*'
 
+Or to run just one specific test from that suite:
+
+.. code-block::
+
+	./tools/testing/kunit/kunit.py run 'kunit-resource-test.kunit_resource_test_init_resources'
+
 This uses the standard glob format with wildcard characters.
 
 .. _kunit-on-qemu:
-- 
2.44.0.396.g6e790dbe36-goog

