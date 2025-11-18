Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FE234B434
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 10:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463463; cv=none; b=LfPt0Ibve+wr+an2nczUCeJ6W1AbsWuJtbW+m990vpQ/IyQNd+9gn+3lC+gmW4VWzkVjZUKdpzg4nbD8cv3+ESEOJTHEFKIgUGvKJOdSeylE6IH3mRzuvIoEqo3kdf9E9vY3VyU65EFWZ2zUi9Rnnv+OU0CX7iR+Sxasn2kMKZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463463; c=relaxed/simple;
	bh=G16fQaHgSTQQBwH/Riq2ovpdEcw37ptOj4myLxoaGag=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AHwN9274+3mBAPFlweck6qXUfAPvvIJUmpS7UAq2PU4osoFJzlEawOY0V0bSeo2O+1qfoml1pN5oal4Sz6hpdIpsaet/I9L3gV8JT57vRLPW9lGH+/YgoCyuQ9yZZj2fgNC1uQQeqFy2f4BElHPWLnpL3KeBvoId16KBA+a7/F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0PQ4vG1; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0PQ4vG1"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3ec31d2b7f8so694779fac.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 02:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463460; x=1764068260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3fZ9q6YClYXxCHFqWiPmslFJxSDuofBOf9/IZOsTsE=;
        b=L0PQ4vG1Nn/caIykuxF0GHV3jF2H2nsGVVMDTBl5yR4M6yrwDISS4tsFDebb2dN7pt
         g/XQeHpgbtU0C+pZ8LjWuHkDFnMkOzy3sUeZl6yQR3razFiRo7Fn+anpkjaqsJag9JlG
         8n5AYt5olj8obw0/T4+emZiyCOrwpxNxBjauho/xljhkN/IlN2ySCuPKIz6POk5H+GPX
         qwv175v0x3MSTKWmgv4nX0VQXTLQGp9h6dmuNJMa+2ktAOp+jEnZu2/itYWSbWr5b9Xy
         PIQFeN43JKiIririhFN2mzHFg7vlBtkabzOOCMIyR79F7fBQOzC9MGlvI2WUeOnW6X5J
         CARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463460; x=1764068260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3fZ9q6YClYXxCHFqWiPmslFJxSDuofBOf9/IZOsTsE=;
        b=Z/rQzwitkeivgfxFFdXZcl6T4+O4JiTN+SSbHAhUAw3Wp1eHdeK6soc0VXImX+i4WM
         i4YjK3sgFf4B8pkQ3lgcqWOwWI8sZxSl09CQgl+EvBFWO4w2q/aQXXFJXxzkK7pGp/Rs
         jcrCEupO66frGQlQx+pDqCd1KRsmRGtt8PxVB15Ke5PGqdGgc5qt61exZdNpMiY6Y4Sk
         ngTNMNeF1iiEDptZ3BrFI8z+fWwY7YobJUhx1Z5GggZT90zElake/E+uZurgOMD7Kkwf
         5UAmaenP5kggwaSQiF30994qXYmDRr17leuepCF2pqQKNHfYCHvajabEMyC+p6TS82or
         d3YQ==
X-Gm-Message-State: AOJu0YzC+QsBbVqovDvFPPrZaCWv05yBGsLb6Yjs6bZVZl8enKaRRYhI
	ZVM9R22j5bK+RdPDPGbZDbMKrS3CF9rZ17Y2nNyBXyBE87NJ3IMW3fanpIu8PDw0EDoi7c2Axyb
	KVy9gH0Wq142gTRsUn/mi9qaR00IEBhgEUYV0G2I=
X-Gm-Gg: ASbGncugF/xm+75nZnVAJyhi4aQkc0NMMEywXcmekhq6HqIABEsSsJ86hutkzRrsvwh
	b/x1+L30p9MP07eb7DDD0DUzud5lEFcj5R9IdtAI4qcCb4aGmmERaKTjzxSKAWy3wQDRDVSqXWZ
	InbK6VLeb9aeqlTkNV086URNdy2iE9PbkNdIC1EsSOWX73PWtpj57QP1HFa7h6aPT97FEwjOEP1
	W0x/xUku6/jiblzkCPXJfX4pUAY4IR75gdBwKswW0xJmokf6qvzBKnqM/mFfjTYjtoNBQ==
X-Google-Smtp-Source: AGHT+IGVdqoi1CQipD6zQWtyZtvBHW2Ln/uNgP6iIIXr+5fMsowkXsOEGc3q1NFZBeuRibrdfvEeOGdK5RgD/w8W9yc=
X-Received: by 2002:a05:6871:4d1:b0:3e8:5248:2db7 with SMTP id
 586e51a60fabf-3e8690b0658mr6936345fac.27.1763463460400; Tue, 18 Nov 2025
 02:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Tue, 18 Nov 2025 18:57:29 +0800
X-Gm-Features: AWmQ_bn4ewYKNSC80EaDB5gFmhEWqsfJSLDpRd5dWgUkU1ZoxT9DHpfHO_TclX8
Message-ID: <CAFb8wJvoKtiOA0DZqNJhHALe97=BFkGeLwDYpK=x7L1woLQ6NQ@mail.gmail.com>
Subject: [PATCH v2] Documentation/admin-guide: fix typo and comment in cscope example
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch updates the Linux documentation for cscope, fixing two issues:
1. Corrects the typo in the command line:
       c"scope -d -p10  ->  cscope -d -p10
2. Fixes the related documentation comment for clarity and correctness:
       cscope by default cscope.out database.
       ->
       cscope by default uses the cscope.out database.

Changes since v1:
 * Added the second fix for the documentation comment line.
Thanks to Randy Dunlap for pointing out this additional correction.

References:
 * [PATCH] Documentation/admin-guide: fix typo in cscope command example
https://lore.kernel.org/linux-doc/6017104c-740d-43db-bc53-58751ec57282@infr=
adead.org/T/#t

Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 Documentation/admin-guide/workload-tracing.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst
b/Documentation/admin-guide/workload-tracing.rst
index d6313890ee41..1751368bc3da 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -196,11 +196,11 @@ Let=E2=80=99s checkout the latest Linux repository an=
d
build cscope database::
   cscope -R -p10  # builds cscope.out database before starting browse sess=
ion
   cscope -d -p10  # starts browse session on cscope.out database

-Note: Run "cscope -R -p10" to build the database and c"scope -d -p10" to
-enter into the browsing session. cscope by default cscope.out database.
-To get out of this mode press ctrl+d. -p option is used to specify the
-number of file path components to display. -p10 is optimal for browsing
-kernel sources.
+Note: Run "cscope -R -p10" to build the database and "cscope -d -p10" to
+enter into the browsing session. cscope by default uses the cscope.out
+database. To get out of this mode press ctrl+d. -p option is used to
+specify the number of file path components to display. -p10 is optimal
+for browsing kernel sources.

 What is perf and how do we use it?
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.34.1
