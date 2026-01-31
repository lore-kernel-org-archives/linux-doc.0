Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CD4274659
	for <linux-doc@vger.kernel.org>; Sat, 31 Jan 2026 07:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844999; cv=none; b=nCASp7OlI3Qw5BZJkTu8harFohEQdtDN/HUVLKFS0pfuNF0E6HDmgVOuCfy2MBRbJdhsciFYzn636cyTb1thVaIBPYJc3lzrPjqwScEOctforZDJszgcB/RvO55zNJNafDX8wP5i/cBQyf66yWlycnFX2dyUdZHos+ba8a2ewEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844999; c=relaxed/simple;
	bh=nY7lzQOVExn4AJ6nTUtW8NcMqjv6w/dyQWietm+R40w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5kj68If0S7myroPmhqUI8/y0tMjU9GgwPYgzFIhUylJIYV9Nvkm1NiQFEgYapVpD3152HOrMCc8/FJ4asMO+npjgH6XwJvYskc6qda5W9C+fPfmydkCW3fspRAOmM3/AZUKAvMQ4iUzpKHt/1mWx2tH1uVXPxxUW/qZpwZkPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxUD/sd8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxUD/sd8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso28362335e9.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 23:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769844996; x=1770449796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n1UjayTk0hO0b45clVXSkBxo9hRuWG9N3/vJ5awb1g=;
        b=fxUD/sd8b3wQtQ+1lw6r6s407RaqfpNZfgGyYQigk6ugXox9dM52OaDnYiwwSqTzEl
         jEGEvibHs+f7Nqnaq7YuFS/JiIXWagxLk3hEhwz0ojyd/vHsiFtDQtX2FIKM4/RVsAzz
         F9HuybNgpagi9qIePKl/lGazzR8F4CR0P39bGKtsdeiqz1Z8AFU/nO9vMJgWj6OH/Cj9
         OyXk8Ln5zM7eieL5kmwj4GykrH3XxYSC/fe1Sh3xnK5tSExP682QdF4rTbYwfBxi6EqC
         7Wy1jeugDsSMWF22gL3pZV85LiwP9vGES3tElukotgVzSbOCKcBDDnCy2Glk5svSwHEE
         SZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769844996; x=1770449796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5n1UjayTk0hO0b45clVXSkBxo9hRuWG9N3/vJ5awb1g=;
        b=jN2PNizjnGjaYrl5oPv4Yx4nIFAGGoiGlN6RAoKRshDp5H5FJyJjEPDccic23Yp4ew
         /Mq4pfMbacQ6u+1RS+pyOTUueEiOpQxVSyHN3jhksYrxba0cq/1arnA86JsTcuw0xhha
         5pnxDZD3vSN4t6gp1fuRDLN2XZC+rPAzxUTLARu4s/kESEwu3W0cDsqyo7sikTFxxmvf
         H3EKwTNdUyaT/wMvyVvVMPh1zC46tK7Lr5Uirg9kKTUMoxny2TBZJBEor3zqFkrpHDZi
         pGXx84NaxvS6T/32Ly/KGuM5V/5XYRlBbKKCapXnq1uETOR3MplkkYewn6t4/8QMPgj6
         tDGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeXBkE/1PbZoJ2l/vtaQwIhphiulpe+iqWnePlxplToGrslQQkoXizshKYA9gP6s9Imt35JPYArMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAfSlFPOSVkwDrYeBFNJQIwbV3ge0a5+K9MtBaL1CS+4I7hkXK
	JRP/HyMdixd7U7+CJhxisGUk/+wElxxHcxqnzWluVdS8MYuRJ42xGIK6
X-Gm-Gg: AZuq6aJKImxhAh9B3F2TXLP91zbOwSEDq5TQJciNdkOJF+FVnSGnpxG4xRlqOAk2+Q0
	W3TvJCJKYF1YA9RziRdDtU/9R8/M82++fwSfnj62WnGevvW5UQvPcc/+7Xn5nvwnG6tN0dG4Oe3
	51qtPeFCqjKrtHaersBvWjjB1sju4Pqxr3swZvsIIipY3fkpQka5rcXSMQfzDF9KcbhBHlKFtie
	WpTn1w+a0qvMNWfyYm4uHZhEvB+6W7YzMRAgwZxT9pg1GgR+SHNj6aqvAQNJzYAPMgjdXf+mFPs
	QiWbs9e+7Tm1TIX9V/FEqM+Ci9vjdzSckiDFFrBk887Oo3jluuKnyTGH0ehOa78bZdlCIz+ClUE
	pABUwhpC1e8onTvccGxTYkLCQ6Exa+GXc+KHIXY3zQaMnQ0fxV/0N8fCbt3KsDDvGpEifyp8QOK
	VI
X-Received: by 2002:a05:600c:1e89:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-482db4ac0f4mr57301605e9.34.1769844995600;
        Fri, 30 Jan 2026 23:36:35 -0800 (PST)
Received: from legion.lan ([2a02:a58:9200:ea00::700])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cd8fadfsm248952145e9.0.2026.01.30.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:36:35 -0800 (PST)
From: =?UTF-8?q?Mihai-Drosi=20C=C3=A2ju?= <mcaju95@gmail.com>
To: linux@weissschuh.net
Cc: arnd@arndb.de,
	arnout@bzzt.net,
	atomlin@atomlin.com,
	bigeasy@linutronix.de,
	chleroy@kernel.org,
	christian@heusel.eu,
	corbet@lwn.net,
	coxu@redhat.com,
	da.gomez@kernel.org,
	da.gomez@samsung.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	f.gruenbichler@proxmox.com,
	jmorris@namei.org,
	kpcyrd@archlinux.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lkp@intel.com,
	maddy@linux.ibm.com,
	mattia@mapreri.org,
	mcaju95@gmail.com,
	mcgrof@kernel.org,
	mpe@ellerman.id.au,
	nathan@kernel.org,
	naveen@kernel.org,
	nicolas.bouchinet@oss.cyber.gouv.fr,
	nicolas.schier@linux.dev,
	npiggin@gmail.com,
	nsc@kernel.org,
	paul@paul-moore.com,
	petr.pavlu@suse.com,
	roberto.sassu@huawei.com,
	samitolvanen@google.com,
	serge@hallyn.com,
	xiujianfeng@huawei.com,
	zohar@linux.ibm.com
Subject: Re: [PATCH v4 00/17] module: Introduce hash-based integrity checking
Date: Sat, 31 Jan 2026 09:36:36 +0200
Message-ID: <20260131073636.65494-1-mcaju95@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The current signature-based module integrity checking has some drawbacks
in combination with reproducible builds. Either the module signing key
is generated at build time, which makes the build unreproducible, or a
static signing key is used, which precludes rebuilds by third parties
and makes the whole build and packaging process much more complicated.

I think there is a middle ground where the module signing key is generated
using a key derivation function that has as an input a deterministic value
on the build host, such as /etc/machine-id . The problem with this approach
is that only hosts knowing the value will be able to reproduce the build.

Maybe this is a solution to NixOS secret management? Introduce minimal
impurity as a cryptographic seed and derive the rest of the secrets using
something like Argon2(seed, key_uuid).

There might be another approach to code integrity rather than step-by-step
reproducibility. One may exploit the very cryptographic primitives that make
reproducibility hard to ensure that reproducibility is most  likely valid.

For example, the module signing issue, the build host publishes four artifacts:
* The source-code
* The compiled and signed binary
* The build environment
* Its public key

Now, we don't need to sign with the private key to know that building the source
code using the specific build environment and signing the result with the private
key will result in the claimed binary. We can just compile and verify with the
public key.

So a traditional workflow would be:
compiled_module + module_signature == module

In this case we build the module, sign it with whatever key, distribute the
builds and the private key to whoever wants to reproduce the build. Or we build
locally and the key stays with the end-user.

While the cryptographic approach would be:
verify(compiled_code, module.signature) is True

In this case we distribute the builds, source code and the public key. While
everyone can ensure that the compiled code is the result of the build
environment and source code. The signature is verified using cryptographic
means.

As long as no one cracks RSA or an algorithm of our choosing/has an absurd
amount of luck, the cryptographic approach would be just as good as the traditional
approach at ensuring that a program has stopped with a certain output.
