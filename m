Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006D2EA485
	for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760883897; cv=none; b=d5IHyUQFsm8Q8VaH8vpzgI2GGxzhYwkdxbBUKhjxNEyt+YvZvql1B8PZUbMW4c3xhGJpzGgX6r7Ualg1KcPiaWxsyOpbBv/zN15KsS5Ry9+7zELiAO5Y3biBkXCUryzWXqtF/EzfTgB6qaLeiV0JXRHeFaXJ4vQK1P81Gh8gbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760883897; c=relaxed/simple;
	bh=RTLE8JAgt8732l0kQg9yy4IKx9RsbIMe70KNSVK4c78=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=KE6a4L+QjYnTeh9ImF3J4VD9iUOE7oMAFXIw4L+PrwFe9iSGS1ifYdu1VkQPsNWGKxm7kgFLZFO7euD+UvyLX0X4Rdmo1+6qCkJHiaW+ULwtw+WAJi26+M+IjtOxOsaClIgur+Xzp+Dz22XCIQJPz3h6eva9vT87CcBIj/FdwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeP7m8xC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeP7m8xC"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-339d53f4960so3565066a91.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760883895; x=1761488695; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0r+L+CXB90BmOOtvnYCFzPu+1ypeSjtCHjj153+Ar4=;
        b=BeP7m8xC8U+YEsnQb7XwnW7puOHvpMJsljZSbV9mYGEf+xVzb81ORp8kyJaVA3dCAw
         VsFg9jKisPsg9+mFrEtXHxaaGwsuinFMi3YfkPmdSxPdrxXlDzv//QwlgGKwhwam8DrU
         SgnoZ1+37RR7HkLD74iKAiE3MRYaTU2Xs1HWQ2P0ZBT2wT25FG0W+V+5RYzDRKnkkQ+6
         85rkXb7/r+Urkbn7iNgUUvwjn3QFv4+3j2MKqHhAhEUfk2cU3r3GbeQASSrRFUq6ybt+
         bWkPU2lOXRJN3Fx8WZLPytjb1+N62Lw9l/8gz3MgqY1uqxoU2xqAw+dYO4u2mx8mvUqI
         14UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760883895; x=1761488695;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o0r+L+CXB90BmOOtvnYCFzPu+1ypeSjtCHjj153+Ar4=;
        b=ItP9Ok4GCJ3OfmXQdd2H8bisXy0v6MGYeLW0mtYm2Qhxo3qPPT3bVfvA67oQc+sLXK
         LFhFN2Dj27G5h+LG2b2L5YfO7h5yqKnRmwiChjo6o4pQSje3xUMS6gjMPTC3v1qSAn+0
         F+3IMg8d4jWK62ROTxUydl6SSsCZC6lh1g+CvA/gwV3tzlHLcaMHwvlNMiNUDqW4iDUv
         dHby98J6CX+Chow3OBSU5UYwsCDMsdyLuNFKkMqS7YereRvwPL3Wo+hLXnk0Z42G9O3Z
         UxBwIZKsqi1ChN33779kzQ2urEqAhJs4B44nG96Vs9m5juehc/1ilXPizLmPl2Qddy7/
         L87g==
X-Forwarded-Encrypted: i=1; AJvYcCWqg0V81FnXTzOTfOdSbok6nTA8j6KfW8zeME7+Ti2XhKrA3UQt3UZ8ZCWOqlNTsPFSItEE2fsVzQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzflozjpj5m7S6BNEjBL5Vlcg7+MKGZuNu8EgZ8GZlQmimL6xzc
	m6VIBCQ214jhkkhik1nGnKrysQqU8qnFiWwQz4Pu7mRxHmgueWT5LE2s
X-Gm-Gg: ASbGncs5+zeSeHhMW4eoD63VjVOCWhyCDZYegE7cMmDX1YP4v7/yo+ocGPwiJMN3eqM
	XwmXCl07fJB7HNisQaMGqzZgFNDcAS7aFStvB+n4/tQzzwqN3uQlWmxoPjXqc77RHZBagBHKCNJ
	3gRW4RunO0Onpri9ZgPb6Tqp1f8US/7lTjPNZ2ZWtt6n1ohK0Kme1/CvJzq3nDmAMlqU33Ua0IC
	0PV7vBEY1vIuE/RDqv0fjWjgUyQriXUvjusPxcTo40mp/xHzQa6Gr62ZUHHu8ptatMwrVvBiLxi
	+BsoYtHmdZnqsTLuH7+529d7/KP2JQiMQfvCzAcVhTBy9CgpD6VrPVc7n0Zu77Fcgi0Oo9TKCo5
	lVJvOzZWPsMSKyWY+W4pOOAkb+WCjh6HyOF1n5WTM4jN/aYm+7iL0J0mBO9/ThsyZ0PNrIh3nqu
	psWJCVEhu6+ELMapCc7dTDX/j7ZGQAYc3/OeRyHMb5YQC3tV1DtDdk7E8XbClgIjiDaXE=
X-Google-Smtp-Source: AGHT+IF2+U10L5DU/ghYqtrjLidiGaiDqcootAOpdvRAdDHI9Rcyo7Idkktz7+i4ZlPbOatbDshsgQ==
X-Received: by 2002:a17:90b:5281:b0:330:a301:35f4 with SMTP id 98e67ed59e1d1-33bcf8e95dbmr13837249a91.20.1760883894658;
        Sun, 19 Oct 2025 07:24:54 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bba630bf4sm4527803a91.4.2025.10.19.07.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 07:24:54 -0700 (PDT)
Message-ID: <eaf4bfd8-fb80-45d0-b3ec-4047692ebbed@gmail.com>
Date: Sun, 19 Oct 2025 23:24:51 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] tools/docs/sphinx-build-wrapper: Emit $SPHINXOPTS later in
 args list
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The option list to sphinx-build via SPHINXOPTS should have higher
priority than those the wrapper comes up with.
sphinx-build will choose the latest one if there are duplicates.

To restore the behavior of Makefile era, when the documentation builds
at https://www.kernel.org/doc/html/next/ had been depending on it,
reorder the flag list.

Reported-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Closes: https://lore.kernel.org/20251007-awesome-guan-of-greatness-e6ec75@lemur/
Reported-by: Akira Yokosawa <akiyks@gmail.com>
Closes: https://lore.kernel.org/c35e690f-0579-49cb-850c-07af98e5253a@gmail.com/
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi,

Not having hearing from Mauro on this _minor_ regression, I went
forward and made this fix.

Konstantin, could you test this against your doc build environment
for linux-next?

Regards,
Akira
--
 tools/docs/sphinx-build-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 3e6d166d4102..1efaca3d16aa 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -298,8 +298,8 @@ class SphinxBuilder:
 
             cmd += [sphinx_build]
             cmd += [f"-j{n_jobs}"]
-            cmd += self.sphinxopts
             cmd += build_args
+            cmd += self.sphinxopts
 
             if self.verbose:
                 print(" ".join(cmd))

base-commit: 96b546c241b11a97ba1247580208c554458e7866
-- 
2.43.0

