Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7C457E5D
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749818; cv=none; b=nQO5N3uwT/V0o6ZrR/z0dicR70zgothKYUI4+JazSwVGEGLSVkZGnRVlno9ZzrBBJOApKGADNWhHtG9F/GiILyDfRpeW2GsqxaAq4hFdJEE5LlLVZ6KoMNMHoB4Kx+TYFKsJrGRh9zNU7GfLIJjCxIeJM0uJwInLdXJoLNx9Ka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749818; c=relaxed/simple;
	bh=EK/AHmbH1n+ZAeHspiEn4hLS0GOcVytyzjbFj3NwaoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrU/9Z+hHQ5SG5HMFx8cLcPWCRVHUxcZwpOQ3qRzbez037w7QPtccklKn2kBJIb0qgS7nN2dpdDWWr/aSa1EYshaJQnQznrpEwkHNZ2qgmOWqs4+cYVbqE/ggD6CPjDzUc9rJbIIJXBthQ1bh6YgPiRMedTHZbefYuhSSS0Hkr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPC+t28l; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPC+t28l"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b05bf699easo7238447b3.2
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791749815; x=1792354615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDGl5tBxqOySAH/1T+QSowfg3OeZNJKzvcjJapnD0fA=;
        b=iPC+t28lknvSbybHRaYhiojnh1vHxRe9RlhN81mUnSnhFXY1y/u9/VGuNdcCytG4sN
         yu++I2OupkUeHtgnykNoysE9JWxxBdeZOe9SisaiGjRaPvPhA5ANCzvVdt8eh4Z72vHB
         0jS3nHINfBqTRPWepnioO0fZDedx+/9AkgI8D5LeTXmAkzsg6axVVG6LxhBsjGQcv2Ad
         5NFbqzAeJqxfBbK7cyxg0HL5+GziK+cSF8mcIwaJUey+bln5u00TddlMdpfkcS+ka19L
         20WewqphX1EM2aOk+4QxGIl4dzkZVCMLA0/dq+gGivKuAYvISitV3YU1ntMDzJVC9lZZ
         O2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791749815; x=1792354615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDGl5tBxqOySAH/1T+QSowfg3OeZNJKzvcjJapnD0fA=;
        b=uQmIfvCdZg0A8XoEXF27SqnYnz6mW+WmQ7w7/Wt1IHmHXVhrgJ3GuDFPlWrD/ujgFV
         dRVN+Q2hoEG19msSEDkKguZj5zq4aDuWH4jm32CmlmnDT2qDOuLHD10tqewPokFi7Okr
         dVccefYmlR9+EfuMqrZXTmc8bczZVjMqGRgD/6ikcBRh8Pr0eRg0LI1wzitmm5MGT7Ya
         I0rxgJB0rapmjdmurGRMxPYsU1LFVNWx3MlXnFxUcpkMX2FXLXl8pN3flRknn5jP+Qyq
         2RVOIzwi8K1q9wL1hzvYmG/zgEEaszbImnwXwzwO3OohULc+3BSWHMCQuLIg8pnOeSmn
         /WKg==
X-Forwarded-Encrypted: i=1; AKwUvBzGyP2vsCd5pxsRFqhJt61L8BW1H8SjHWa6MCfAcc5bEsvcdyWWpWDOqUJAFBZm4Vv6eFJ3lYYPZ2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLim9iou5cHhOw6EixBqq0NI8WwTI6P+BMRMoyMQ/8KZEfQg/Zp
	84i/4aZ31C5fP9667Yu+xkVTt/eLQ6wlA1H3INqUqhdcl0L68Ypx6AVs
X-Gm-Gg: AYBFou3vbMppVfCzp+Q5tgOxTGHfpYPTGHwK8i9Pj6Pux5RTdkI2NzYK9Dm7TFIvgHO
	GdHkRjp8lBjT3qwQvU9KYd0itiI4AKPQ7RZgldDXJGBVO39U/lteiPQIU3bwMa08SKHZdFzqRrC
	hkClCjbp/xOVLY6VXmBBeTkC61FoThYEkQR/g4hxKEpuyIpkvscLcBJv/hZGqY/vY52yV4w2V/V
	xmPfSthsL6wC9Sv+K4oFkIuKcdJMaBVEy5a0HqaTNqH4Wkg7Evu8ycT4n1EgNsvmqY7sMIx0LrU
	XoDCoMcLS7JdWvtNGhapGF5octiZNgI63F7XM5zsT4O9bO7CARjLovSl8/yu7SLxjwlr843pZUD
	IJXi7ds1Rx7AdMbnL2IfQQWerIGC0Sq+30FozlVAeY0H2/w6kpVRA9YNhrbbIEZkGBaozL9pZmt
	COnkPCgjeAgGkmEFqqBtn9FN7iKYsNs1KVIjpsmJR7Rdr9+4WnfMQQZg4AzvIkNoNLxLUf+Yu+8
	9XczEk9aukpjZA/whqZSUdGaUDCOj233B9cpJIpshODdltk/R8jhaW7
X-Received: by 2002:a05:690e:14c1:b0:675:40a6:142c with SMTP id 956f58d0204a3-67935f1c770mr2510955d50.22.1791749814894;
        Sun, 11 Oct 2026 13:16:54 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356ffbecsm2995049d50.23.2026.10.11.13.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:16:51 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:16:43 -0400
Subject: [PATCH 3/4] alpha: use user_stack_pointer() in KSTK_ESP() and
 dump_elf_thread()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-alpha-perf-regs-v3-v1-3-eaa625a39712@gmail.com>
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=EK/AHmbH1n+ZAeHspiEn4hLS0GOcVytyzjbFj3NwaoY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJOv1slrzqtPdz4pVV3ZCSTN2vLQi/23yz2efO+50UGW
 emsPfu94yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK5JaGD4X68+m2dhze
 Ffk+RmJ/evOFBn7f/2mPOxd3MNwrc8qZy1LJ7hr8wLI+O81eF552fzcfNsPtvFIXbu+7NbF9Qvf
 Ba+2MEhwAgA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Both open-code the same PCB lookup.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/processor.h | 3 +--
 arch/alpha/kernel/process.c        | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index c461a26d47b3..73251cd671e0 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -43,8 +43,7 @@ unsigned long __get_wchan(struct task_struct *p);
 
 #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
 
-#define KSTK_ESP(tsk) \
-  ((tsk) == current ? rdusp() : task_thread_info(tsk)->pcb.usp)
+#define KSTK_ESP(tsk) user_stack_pointer(task_pt_regs(tsk))
 
 #define cpu_relax()	barrier()
 
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 06522451f018..7861c9e767b7 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -318,7 +318,7 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt, struct thread_info *ti)
 	dest[27] = pt->r27;
 	dest[28] = pt->r28;
 	dest[29] = pt->gp;
-	dest[30] = ti == current_thread_info() ? rdusp() : ti->pcb.usp;
+	dest[30] = user_stack_pointer(pt);
 	dest[31] = pt->pc;
 
 	/* Once upon a time this was the PS value.  Which is stupid

-- 
2.55.0

