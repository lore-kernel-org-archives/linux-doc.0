Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE518EB0
	for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 22:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740265196; cv=none; b=EJF8+MTr5wouCRPr9pVUB+iHA/Hogp5j/d/0OWfFSqXcmv1BK8iYnIUemL9nq5IULhCXCCm6PU8nEmWxXzAOjWLMxRWifTfsQwrLFM9WYk+AybDK6+ADUF4DH08FbuJqZjH5KBGcEdpKeY9MdtU4TpqoIrkLolWJrnxOhofGAnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740265196; c=relaxed/simple;
	bh=JGONQCy7gcEKBoSFWgAtInJYVCHXtZ0XDYqR6Fylt+E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ptex3Nn7wYuvN5hWiY31vKUq3BTkM3Z+8BuHgawWwhvo6emlZFL6PSQ40T05wltmWyGrKwfplUgvVP3Qjb+tUGJ6Z5m5/j4rJLLDSl//YG+Tvt3Lve9n84G5tJ5MXWu+4ZMPxF5pL/M47kvU6rR4WVa14AzQRMHbrlmn+Vufd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jp-hosting.net; spf=pass smtp.mailfrom=jp-hosting.net; dkim=pass (2048-bit key) header.d=jp-hosting.net header.i=@jp-hosting.net header.b=d94UP90+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jp-hosting.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp-hosting.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jp-hosting.net header.i=@jp-hosting.net header.b="d94UP90+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so526170366b.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 14:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jp-hosting.net; s=google; t=1740265192; x=1740869992; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J9tMt+EK0YudwF9jtS4SHJ6SYGeHMC+PbFfRXfW/kVY=;
        b=d94UP90+Etv5Gyfy2yol3q0XKFCE/w9LfsEeuFOes4p6/cbv4IDN0lgdzoGCT5SiP2
         f4vdDHuT8I0vstNVHWux/Iyk49LSdtqxDNTV4G6jOTskwlXYAzzGlhh+hKz1js7jEQY3
         Mg3W+JKgNtDno9q+LdtQxv+CEhoyQQoe0SAnMXW+nrIJJsgnT66u48cfxoai7wxJu+BJ
         /Ek1ecH2U0uxNsH9nVfwho8vOf0oeAKQ78bPe5WbvKLLnIeHoe0T6TS1+cmgPpObn2Js
         HFYFKnfvAH3Ouneq1s8DPuekGtzNGl/x0mEdrj+ysz4xALs41lAMdjlN0swJjB9tLwqN
         DDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740265192; x=1740869992;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9tMt+EK0YudwF9jtS4SHJ6SYGeHMC+PbFfRXfW/kVY=;
        b=bbhm/4bqrLrp78gBL6Mlg+koOCY/SakRpcwaM7c51ERwv58nb06OPVNLZrFHdcEJLp
         NLNrHkZnQv33wAirnadZlJJeaGic7IwBiCPxTxdJ8slfP6kDYV343oJhiS7t5BohLvwZ
         ou5tqTCSIdsoU2V6Nriu2+FKxrb1FvGTPa+/uNXPpfuf5OV1dUqTRsLz2aabmW3oi3Ek
         Qc0s/soSYeBhVEAm6holovjWVXNIHkRt7efd70F8rhapD5eY6IZ9KUNTeNhoTOQz00PF
         bEO/xR3ln77UkO9QdGLoB+FHFJxfRsdW+b/UEydBxPkkb4pUSitbbhIyJbkVxUV5NGRD
         JFJQ==
X-Gm-Message-State: AOJu0YzNZfbTbVLO14WYiFEfrKQMv+k4ymqcF+/VUuHCIoAYrF9j45H0
	Qh9Pymwsty2biSF2UdWFVxagSATwMydGBvCoabEymnZkPZ2Uz63P6eiC3xvMn+t5kOAKfN80+xp
	bS/hnE69eOwaKLsC7ciyQppN42gty2Xaz6FV4VskJ6x3HZZu+sA==
X-Gm-Gg: ASbGnctpL5d9AxWWsjdHStvFEPyOPLTaK2C9w5B2g9UvhIXegCz/SPVsXf6gQR6Z1mq
	PHVoY5lI8ysFqDRaWx6T6jWMT9XEN1mO8KDgwxQHw2L2H27v0hXSasRcWo8RZDY8frI2zAxQrgl
	Ioc7rx8CA=
X-Google-Smtp-Source: AGHT+IFFPvW8oWXAKklOTm83otWUHT9MLutAFS+B4mGgpjA17vTFVD2A9ce1SWHUZzodKUrgNx2V+OAQADv1Vr8Cg5g=
X-Received: by 2002:a17:907:2daa:b0:ab7:10e1:8779 with SMTP id
 a640c23a62f3a-abc09a9c58emr946437566b.27.1740265191502; Sat, 22 Feb 2025
 14:59:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: James Addison <jay@jp-hosting.net>
Date: Sat, 22 Feb 2025 22:59:39 +0000
X-Gm-Features: AWEUYZlESqP7mPxYkQtdvBORqFNysiXSlHm_X4fH0yOl4sa2mGVUN61igMriRes
Message-ID: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>
Subject: [PATCH] docs: Disambiguate a pair of rST labels
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Because reStructuredText does not provide lexical scoping rules for
labels, resolution of targets that have duplicate declarations is
ambiguous and produces nondeterministic output.

To improve the reproducibility of the HTML documentation,
disambiguate two labels both previously titled "submit_improvements".

Link: https://github.com/sphinx-doc/sphinx/issues/13383
Signed-off-by: James Addison <jay@jp-hosting.net>
---
 Documentation/admin-guide/quickly-build-trimmed-linux.rst     | 4 ++--
 .../admin-guide/verify-bugs-and-bisect-regressions.rst        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index 07cfd8863..2d1b6f750 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -347,7 +347,7 @@ again.

    [:ref:`details<uninstall>`]

-.. _submit_improvements:
+.. _submit_trimmed_build_improvements:

 Did you run into trouble following any of the above steps that is not
cleared up
 by the reference section below? Or do you have ideas how to improve the text?
@@ -1070,7 +1070,7 @@ complicated, and harder to follow.

 That being said: this of course is a balancing act. Hence, if you think an
 additional use-case is worth describing, suggest it to the maintainers of this
-document, as :ref:`described above <submit_improvements>`.
+document, as :ref:`described above <submit_trimmed_build_improvements>`.


 ..
diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index 03c551513..1b246d8a8 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -267,7 +267,7 @@ culprit might be known already. For further
details on what actually qualifies
 as a regression check out Documentation/admin-guide/reporting-regressions.rst.

 If you run into any problems while following this guide or have ideas how to
-improve it, :ref:`please let the kernel developers know <submit_improvements>`.
+improve it, :ref:`please let the kernel developers know
<submit_regression_tracing_improvements>`.

 .. _introprep_bissbs:

@@ -1055,7 +1055,7 @@ follow these instructions.

 [:ref:`details <introoptional_bisref>`]

-.. _submit_improvements:
+.. _submit_regression_tracing_improvements:

 Conclusion
 ----------
-- 
2.47.2
