Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660C7081F
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 04:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776571916; cv=none; b=PpUe9jQBEhTMpgiL6xZ4hMwqCLULjmrOviRZ+PLNYa4B0uQXtVzqpbNHzWSSC5L7/HBdFZT1DzgKaqFg4ScZ/xMqaYxtHGRX+XZHndO1dsDpGBtG8sb1mMXZxC/7qhf7J8I/GuqHL347E8yQYK2BRW1w+hIZH0sGiPw6jyjMzqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776571916; c=relaxed/simple;
	bh=rwkZyPJHowgTvteFIKcMHs2QMro7vvfl61B+ONhW7eQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QKbynM8awTgrc6lr/+SinwE7vw82oZY0m1MaYUwQ+96msjeA6Lxu5n+5lUtyyXx9GHx2z8BsjxN4q/Fe04P+Dohx6vNkvtpXK4sQ2vF4qd0z2chFy1IlXbdinjCicRrLEBTAJN1W3/SEfOB5r6wtrdlFQQQ+bowqjIQcln15TBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCQyetNA; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCQyetNA"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8e0a768331cso319739085a.0
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 21:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776571914; x=1777176714; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVtxPBGnCgVKFRrTeWoVJj1LFDo3OCMzE1ejj6WLoyo=;
        b=KCQyetNAdXqxWtiBcNsnSxA1FChupZqBpWpQAxspjpo3bnrMiE74yBtlrBZQqC+G/x
         2G+6Y/uAUGeKkcev3BVjVdSFGqg8IeCN0jhlYdBbQMnNiUpiXIy5GsD3M0/PEtraC/hl
         1BJ0eqA9qlJTnJXUjyvsGFKyUCdMBWNyhz0Opbxfht2yj+vUl9h6gVeLzgAzJsRbfTGq
         ifS5l4Iw6ugxB2NMHmkp9FonYP4P77XBWOsqohIdgmvnPCt0Q0qu45ZsAuIy1Iy5z8Dn
         yI1RMzGPs1mlVlz5e1Kx9Oo+LCiWM6NNAZWk2l3IGV4gbpfkN+4uvAN6zkk7u8AOecN7
         Btcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776571914; x=1777176714;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVtxPBGnCgVKFRrTeWoVJj1LFDo3OCMzE1ejj6WLoyo=;
        b=UtcEVMUhqUqvTVWO6WulvcE/VCjt/Sw5v96TY18KeXjCdphAstesG/IxneBkNjqjE4
         CJpog5dq0CdvfH1d4zJ1Zc9dzTVYIZeLHePR8OCgqo2P59hApnBGSAej31vNikUY8yfq
         W+f/Pj30oZFDhw89HbUVM2htQh+yNxLWLCb6mZaphZQOfjYWGTVc04ksyAbMv1N0AUKy
         +1ubC0G3jgKJ+4no7K8Nq6StEbDrOeaLqTMlpb3SqI8q2QMTnSN9ltcC8GApq/MPNg7o
         Jc2tnZBoaLqua9Uj0m9e+Z2PqfuZ7Pez0AgtqLLe4k1ATaIfzAcz0XE38YF/16WWWx7f
         CPEw==
X-Gm-Message-State: AOJu0YwIl/LBYhxblf/CLOMaavF7p4cr1k0hMuWWkTje3QWcpaJsz7GD
	xQulFbnW1QZF7KQ3JO7odfaaVSaUuAWW7cJX+Tuiq0+iWda2nUFWWwuJ
X-Gm-Gg: AeBDies+M2IghD/oko2y15OGRYslkMH5pPGKbYwmToiYAPTLv7jiEq/TSdGeIQOkiig
	GxUQXCSI4voymLNz3Xy1UeWWGRvpFR+M1CjmuD4yrFfYq89liIjcoAocmyUh1cRMjbpcfuFrh3j
	XKaqmDYmoVCgWQ++5PK3ECkVuI2Qg/dBlYPYLQEgFSbjywRku/yuAGyWHQ9JivQyvP0myYZBa/E
	Ku3AumTdvZ72u/6OirLum8oocm2iV14igrYQZTX8MYFT3c6FjdbfPz/l10dAJpvrTnmYC/zfxzB
	AUglnYnoRbZnrl+/xVLLbgA8rBIXGVQhjuZBTGX7lWyGTJe5DrjGPlV0FfK6c8nVxtfOFc9ZXm1
	Q+8K9VIQUdhfGvVZD2EOsavZM5Ia0eOzRekCAJYoVGg5/nz5+fLAnrxSkwAXV4TjifjrLatKe9U
	xSMv2ilFnLtywP6cKYyiaqhwCU4+vaU9IwP8G6u/BVTTl9EpT1sivyLVGp5OUotYc=
X-Received: by 2002:a05:620a:460e:b0:8dc:3a83:9c08 with SMTP id af79cd13be357-8e789c5a0aamr1049192885a.7.1776571913676;
        Sat, 18 Apr 2026 21:11:53 -0700 (PDT)
Received: from inky.localdomain ([2607:fb91:4c8b:380b:91a:9dec:26e7:3d7e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe98dcsm508388385a.7.2026.04.18.21.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 21:11:53 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 0/2] Documentation/binfmt-misc.rst: Clarify "P" flag
Date: Sun, 19 Apr 2026 00:11:01 -0400
Message-Id: <20260419-binfmt_misc_doc_update_p-v1-0-757c12f33cc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVV5GkC/x3MQQqAIBBA0avErBOmkoiuEiHmTDWLTLQiiO6et
 HyL/x9IHIUT9MUDkS9JsvuMqizArdYvrISyoca6RV11ahI/b4fZJDlDuzNnIHuwCQqtdhM1hBo
 t5DxEnuX+18P4vh/sGE9RagAAAA==
X-Change-ID: 20260418-binfmt_misc_doc_update_p-0a4cbd3d040a
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776571911; l=706;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=rwkZyPJHowgTvteFIKcMHs2QMro7vvfl61B+ONhW7eQ=;
 b=uTi176URT93ETW9wBjN6zZXUrjhyrUdfRr1vSDJuCme+FIlFtDY/vCj5hw4TExP4+QVGT7iX1
 H5JIwfhdRWCAY6kHIyRut/iwSDPeiQOyB9JWJXN457UCiNRhYw+3RdV
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=

Improve the wording of the description of the "P" flag to explain that
the interpreter gets the path to the file provided by execve and not the
full path as well as documenting that AT_FLAGS can be read to see if the
"P" flag is set.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
Charlie Jenkins (2):
      Documentation/binfmt-misc.rst: Include AT_FLAGS info in "P" flag description
      Documenation/binfmt-misc.rst: Make "P" flag path desc more precise

 Documentation/admin-guide/binfmt-misc.rst | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: ${change-id}

- Charlie

