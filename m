Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A683559E1
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 22:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179591; cv=none; b=BqXAcl5L7WBIhcVAscNl/nQBGy59/U4FXPA27GEgUmizqhldzMAmQ8ww/Ql9aIJ/7qGSGoKfyS4cuCy5lRn3v3K55dNLIoJvrQ0OtrybosTQ1mwkAMgWN5501lckZtBySJZhzTkocdNygj+WJjd92cAnAHFmTeJL0GsOWYE5p/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179591; c=relaxed/simple;
	bh=uuNTx4qc25JmiOtcSrZROc24eW3q0s0py3Ks6ODa+Po=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xtd3cXzRqXekcZlH1cadIcIWIndvza2KRwlerEbyUAa1MMhmwIALeLK46r668ZV+rQ9cn00UnURcTBIe2XrCKJ2eoR5AHcLjlOJHEoFK6k38Tzb0AqEkmw/tPYXHQGHIc1dVcgvqAnvctocMyEQ+sB+g4fVTYZEJ4wrUSiPZaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=YBZR1kCO; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="YBZR1kCO"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-91550fe1619so19650685a.3
        for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179587; x=1780784387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTj0tA/bHNpv873y+awGsfoidHwlRovW0AIu32f5CU8=;
        b=YBZR1kCO+cVsB30CoEvIEbqeAFusIfaEDphvXJfAZRGbfyQpB2dBXuiKt7BUzhRKi4
         G9UR79BIDTBExj5vIaPEVZd6f0NdDn2Y8jkWrWIaJ0G+GZ7w/v/HMK/KDKLLQvCq76H0
         aro2OS/5v4gnBVq7emDCrR4jsGCMgTaOexavhALohtf4G6qB+zpetFfehVtBeKxGNRFh
         qjAaMiC20Jb/Iu7I3xdgX5uguKu6flyJywld+x0lViXrz0Sxdw9/H9j8NAi/Xq/1X9M5
         RBe/ROQaGtB+A0M3VC80F9s6VKNFjqTT3jnnCe6vC2c+hPGOjYIt+RE458v07jxVKZEx
         8i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179587; x=1780784387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HTj0tA/bHNpv873y+awGsfoidHwlRovW0AIu32f5CU8=;
        b=Fp8+vBhnHwikHKqsZzVbCSBkNr1olMm0b8MSnYAjX/qf2BAcZ/vH8cI7jq6Q++o8XW
         sM4+kfs4CDUsgO142R2ylD3KsUfuoNBq+vpoG5jqGLivx4g/s3SmM3pwSHLD7nvoVbfg
         XMnPf5AyxlG8CtPnmeh0tTe5KnSxiMLr1uSNFpG1zFOjNSZaFqdC9DD+t0eiy4hqnwsa
         NEy/+Rd8yHJU1Ae+CYEjYdQfMmqMpm1i0HLcD1pyNk6f4Cp6iw8wQdaW9Xff9vEq4wz8
         SXCn5uHXs0RymrobbjpBtFAnLHh+tJ04Bs5IUYbGMbKgMNb72YYnV7itivPdOVH9WuA+
         jNAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/bNO6aojHVeT05InOVITLQfDTn0QRykCwkX8mR7imomlM4oiiq3boXoigXhobPDooOgJjOIKV02k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8SYl/oE6a9NhWauPCodmXkjxfIQ+z1BYVVlq0qQl+Yh9TLPcR
	sEwpTe5WbIsNFDsfzADRxEiXh/trc7VIyDW7QZKsqfOXxG1kKOLelFxaGm4Jr7YCxrA=
X-Gm-Gg: Acq92OFwcmK5tpyksyv2OzAteGrlvMjXTtNUXD0HWWfj36/EznvW+CdUBSpJ/NlAKBi
	Why0d/UiEzvGNly248OkUz7snehEVvocVO9BQAUT6To/bXK7EqCVic1g71JRO0tExfw4RshmthO
	MAyW5YA68aTrUkYrsDateS//0a4JiVNZPa7tzkr1Uw7PneTeCE3Y9AVGZLsQAwUHKhusE1OqaWm
	ygMuVPs0G4ReKQmMPQl+Cq6BdcDcsDqKiikav45TdODf8Khy3UptLaDJAaFXdZclsPtKU4sn3lY
	LNlnGfx7GT7IK5+aFmhwJyOnLwc2Idx0e9qsZxTFq/aV8GGdu1HIsXRfFHKw6LTM2N1UZ9KNY00
	qrmTkEozREtZlmq3xXHKbqD2mV6WFPsTtPzPqqQ9cp8S4WOaSqUhbKNMFui+L4MUoQaurrtUNIL
	WURQ+2FEIbBQ9qdWoqGPuJd+aIeXdZWMQArSNTKqIhs885hkVmkDO8pzWCNuPNtA==
X-Received: by 2002:a05:620a:2610:b0:8f8:cdd0:df82 with SMTP id af79cd13be357-9153dcb4b99mr859487985a.58.1780179586864;
        Sat, 30 May 2026 15:19:46 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:45 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v4 02/13] liveupdate: avoid mixing cleanup guards with goto in luo_session_retrieve_fd
Date: Sat, 30 May 2026 22:19:27 +0000
Message-ID: <20260530221938.115978-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring luo_session_retrieve_fd() to avoid mixing automated
cleanup-style guards with goto-based resource release, which is not
recommended under the Linux kernel coding style.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 146414933977..8d9201c25412 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 	if (argp->fd < 0)
 		return argp->fd;
 
-	guard(mutex)(&session->mutex);
-	err = luo_retrieve_file(&session->file_set, argp->token, &file);
-	if (err < 0)
-		goto  err_put_fd;
+	scoped_guard(mutex, &session->mutex) {
+		err = luo_retrieve_file(&session->file_set, argp->token, &file);
+		if (err < 0) {
+			put_unused_fd(argp->fd);
+			return err;
+		}
+	}
 
 	err = luo_ucmd_respond(ucmd, sizeof(*argp));
-	if (err)
-		goto err_put_file;
+	if (err) {
+		fput(file);
+		put_unused_fd(argp->fd);
+		return err;
+	}
 
 	fd_install(argp->fd, file);
 
 	return 0;
-
-err_put_file:
-	fput(file);
-err_put_fd:
-	put_unused_fd(argp->fd);
-
-	return err;
 }
 
 static int luo_session_finish(struct luo_session *session,
-- 
2.53.0

