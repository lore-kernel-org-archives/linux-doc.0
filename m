Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF66C1A9F84
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733630; cv=none; b=f21ROU9p4l6CwWwtMQxiXd8y523R9G7/S47IeS5uYwPcJopQrPVhLzzBtrYg7G638Mro14RimX6awdyQTL7LWY9QB9LB+4Oq2BV/KjFb+xWLje8x5Ue08QMTOVOeeodTGd8r11pXHc16aCDXLsyUfGUWOWi6nN3vkBIJ4IXa5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733630; c=relaxed/simple;
	bh=h3MY+etQFRyDC5vTUte9Ey6CUC24f9Tomj2v46v8wQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nDcx6Ls8uI7JhYBii7sBkRraA1p64QC8o9720HIRa9+9TBUK7dw5NaW75LRW1lu1Ze2zPoG1umsR5Pw1uf2godRlVrCW793Y8yHJ5l7oNIh7OGBnaa/tplMkeGFVOLMvaoldDZKxVauCerwGtB3U8USUJhUAUJPtq92Ux6NA72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXhJIbN2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXhJIbN2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48584dc164fso2742490f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788733627; x=1789338427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zX+QAFEbpQP+MEQRst9ypdyQVxu18GwQkXl0+/O/eYs=;
        b=GXhJIbN2ot7mXoqA/x1uEVefFrm/YfBLP9mffbiVXwqAriZ9K9zLbxlJtt5U1dOi/D
         1NihEwNR0JauAkHnm1oG18YHu5UPKk/YZlKUkyrdfu1Jh1+dTVMAg5qjkAaS79s0BF/a
         /CJVdy4floyEOvwOOYZmTyBgB7FrgYMozOKPFJOfgvPFAuNsHQzl9OI/KYK7yEaiZ0ps
         mAowL7A2xx+yzg/PA86VXCXZgoXVQdADtsX/3LEWciS1kB3sgGqkvk1fpptNvw6zFGLj
         +0PZJbaj3SPOg6+apQqqbBadq04AAOUZ69HDg0nT9Y42BDjyqJ5OPEQSq4AW5zgGsd0Q
         8a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733627; x=1789338427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX+QAFEbpQP+MEQRst9ypdyQVxu18GwQkXl0+/O/eYs=;
        b=dOtOpBhOJo9RB6hb9uEu2EE82MByxxsW7VWVGrZHeUKmTyI4YosZgOE/+8E+gkmq76
         c/WTxBszuJw7zTnu0sSXGjlycIOOCgWIaSZ56VrukS/2U6m98NXlAB3iX3eM7yu37Vdk
         5nUkIdoASIRmSV/9ENlkTpjfEed6zXu2RgDMsHcpTCnJD+NcVC5s3vYUQFKCvZdoQcpZ
         Okjr+uy2KDALe97TxWqjm5UYkCkGuFcZkFxW/DDxqWpBFgSiN88sZOJUw3SUtXFB5oQk
         el+9/CSvEHs09RJvfXzGOLLChSNPHktmVRr542Ru4ssS9HhnkIKdi7akFrX+lhdd1EuH
         dPVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlAvy5q5nh264VzXJ4W+o01ik/4BzpYai8BCmKeo4KQHthUM6h+aMf2ieuOo16zpyGD7UHdyILzOI=@vger.kernel.org
X-Gm-Message-State: AFuF++nDscorLip5Zed6xCH01R3WIn5Uo9eZ2gzTFHLns6a8yEm472tv
	yE0p0QYRagb8L8bupd9A11WVfi10X21qnwUU6YLRpaxWS6U2FGkoqN7+
X-Gm-Gg: AYBFou1yb+PeTBUDU9BJDhFOP01sFkm0uJzFTQSVHKkppAgzItwm0VuHFxGZXwoAuWl
	A8OZLbJZW9HngUqHvRyPNDHnX9XpdcfFP9DB8cglA1un++pV5KQqyNrpz8I51CD1SC5CQs/MniT
	E7oG6I8mvG3vHx/++kt9GWNCMO1JeUzAEMSvxqAcyh6S98GmSfiWmGZcpvti2N+XX+S8FONZf+h
	4+tWqrlBmLlghi3B9Vo79I9sHggEUkgyHKm6IS9SygJSXVeMnsH2vCvAlYRdtsp2NFiXD+anzGt
	iEtvpQ1sEdXgmCff3hu4hw3fXLk4S+ppwXDv1lcnQzoUT98jsskqp6rFQp4C1cOPniFoy3Mn18R
	5FrVowEtyEqoGMgy4RJluDyINxmv4kax5/a7EYTL5xUNN2wxAmwCKpjkZdakt2mmcd3AxAPB7Wk
	osnmKSRAU7bByP/jUXg4sys4Vu4CQvCuudwadsdYhSl9qeem4C4AGN/0c96m5kvuSZCXdUgknuX
	VoMeXkPgXHWTr2wjMr8m2CFrm7n/jPMOaPCQ4cxWpLAJw+UwY4+B1JMqF4amKlB2gjNI3DBPqGZ
	w8i/nnObW8A8rxKSqrI5MiFsfc6Lv9Vnaz7JajDLURLWNZfq2rHzAPeZTBNG32K9yipV5rbhO42
	1ltN9yVI=
X-Received: by 2002:a05:6000:1785:b0:485:91ac:434f with SMTP id ffacd0b85a97d-48591ac44a5mr10269844f8f.16.1788733626624;
        Sun, 06 Sep 2026 15:27:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de. [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm22396316f8f.36.2026.09.06.15.27.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 15:27:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Vernet <void@manifault.com>
Subject: [PATCH bpf-next v2] bpf, docs: Fix two struct names in btf.rst and kfuncs.rst
Date: Mon,  7 Sep 2026 00:26:56 +0200
Message-Id: <20260906222656.3459-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct btf_variable and struct bpf_cpmuask do not exist; the names are
struct btf_var and struct bpf_cpumask.

Use them.

Fixes: f063c889c945 ("bpf: add specification for BTF Var and DataSec kinds")
Fixes: 027bdec89364 ("bpf/docs: Document the nocast aliasing behavior of ___init")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: the two one-line fixes combined into one patch, as Alexei asked;
    the two Fixes: tags stay because the typos have different origins
    Randy's Reviewed-by, given on both v1 postings, collected
v1: https://lore.kernel.org/r/20260905095649.42351-1-kmehltretter@gmail.com/
    https://lore.kernel.org/r/20260905095527.42261-1-kmehltretter@gmail.com/

 Documentation/bpf/btf.rst    | 2 +-
 Documentation/bpf/kfuncs.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/bpf/btf.rst b/Documentation/bpf/btf.rst
index 3f05f17990ad..004aa1058d85 100644
--- a/Documentation/bpf/btf.rst
+++ b/Documentation/bpf/btf.rst
@@ -416,7 +416,7 @@ If the function has variable arguments, the last parameter is encoded with
   * ``info.vlen``: 0
   * ``type``: the type of the variable
 
-``btf_type`` is followed by a single ``struct btf_variable`` with the
+``btf_type`` is followed by a single ``struct btf_var`` with the
 following data::
 
     struct btf_var {
diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
index 85f73e0bbd0f..57831eda0a33 100644
--- a/Documentation/bpf/kfuncs.rst
+++ b/Documentation/bpf/kfuncs.rst
@@ -536,7 +536,7 @@ For example, for the following type definition:
 
 The verifier would allow a ``struct bpf_cpumask *`` to be passed to a kfunc
 taking a ``cpumask_t *`` (which is a typedef of ``struct cpumask *``). For
-instance, both ``struct cpumask *`` and ``struct bpf_cpmuask *`` can be passed
+instance, both ``struct cpumask *`` and ``struct bpf_cpumask *`` can be passed
 to bpf_cpumask_test_cpu().
 
 In some cases, this type-aliasing behavior is not desired. ``struct

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

