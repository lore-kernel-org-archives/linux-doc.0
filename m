Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EA24F897
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 23:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707780994; cv=none; b=tuHH7Jae5EU8v+EeC0zGcMUeoJaIwOE+jW3UBQbCk9WVRV3Kr9tdF2def25sN5KvRkN+2ksZN2vd556udBDuCd7H+a7A6XwvGXi6ShWDJmA4KvRZzGfFfS3J4RE/SLFntcBgoB8pF32RBKzZ0xWZK+9Zu1flEwYVklN69vbA+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707780994; c=relaxed/simple;
	bh=23qauOezLdGd/qvi+eoGfAUmo21GdLnF/O1XuhUSBhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddlPkEk9UIVAwLznuz8ZiBxVvbEL1YAmigixO26ywzVMhLOVqrn1I6BJ+OGsFuixPejFxRvUqSeB7FtDWY5oRmNmv+l6IvzQYIC1X796fK2MULD0Q/oyCArQxc1cGORylno73K7QygkQdWB+d84DDhiFjO3f/74bCp7i7kArTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tf4ChCzx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tf4ChCzx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d91397bd22so28732335ad.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 15:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707780992; x=1708385792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Olje9xypbAZ3WrcqD8VBFVJOFseKRGh8fXym/RnF5g8=;
        b=tf4ChCzx/Hj+RYsN6Ac80lxqJv3vYBSruRXqTZk1FxjhH4uAwbk3vEOmYcUrVNBiV+
         CX+emMhJMtE4DWMVm1q3InjvIYO06AHPco8+E9evzXat++4qDL1DL17qqU9gyb/kfWpO
         jr6jl1AC4isis+UeI+BHTMOnlzH77HYPJKFefnYtZtYP53y8LAprhU2PCufvDPS4fya0
         5HtNINojcz5yqQSsV4GZ4zDMTQjIdHWdlynNv35cC5bxbUKTzgVgsX/G2gMnvaUbO5s6
         zN4WKQi0Ltd9zrexwPJB+lHIzt3yUxmtlqbrBez+WvhJtOc9hL9qmz2w9iUCnoJt9ldg
         jitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707780992; x=1708385792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Olje9xypbAZ3WrcqD8VBFVJOFseKRGh8fXym/RnF5g8=;
        b=Wpz15l7KBhvEABUVmtcxx/UCOM1qafNQfc/4Seh/+vK+urLtmcd29O471ebfHkVz1A
         WvdQ9eIVHXudvaL49Y1DHCe5TCQ7GDVbFJCjzJUWtesGmOcpTZM/rjCxHpX8NlNKGRlY
         wXheLsYUt196Xa0jSPH4e88IJlCRFWRhDKXmQT/0ld+fXwqzaO1ef0dZLjwm2CQrZmzz
         atNJuxiRl8St1GkRRJJ80oWUTP3KpKid/fIywhwn/b4MsCEyUhkDYmP9MeJCjlt+UWay
         ZGD+CoVOjIRJbvx3vBYXmx5RdRRXXQEfyCdJ4OGhnirqvCNzVSNMcA5YuQC5mqXId8Ep
         /JEw==
X-Gm-Message-State: AOJu0Yx0Y0F7pCV7AUiu0YbE4rT9o2QBr22HxAEs0DYoAP/tHavRL6Ug
	PXlgyj6FCnNHODlGbNr6e2X9E8KjpL47JOn87HR43vsMaXdglHSzSAL8oOEUGziOiyrOjYzwGIP
	F
X-Google-Smtp-Source: AGHT+IGOdL3DrCigpJSkV5Hyr5gHXGMCKTbmU/aGTha2J+6odxlz/IBG86EKAkZRn2/3Gp0s/00GPw==
X-Received: by 2002:a17:903:110f:b0:1d8:a93f:a5b2 with SMTP id n15-20020a170903110f00b001d8a93fa5b2mr8982004plh.12.1707780992600;
        Mon, 12 Feb 2024 15:36:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9IHTBBsAU+LBcf9fWTCl49GRnlyxiyibnmfNmj/O7/h+tbt6+9IJmYjNakft2CXqPJE2jvAw7F08375+jC2mD8UEKwPVTypk5fDmJjKI4eySgbBuL41RNQiPmVh/G39Mt/x9gU7kceMUF8weph87jKzxgRSZYh2uoc0/jU3QHfpFOt++Vig/JOI89YyFKpz9KzEiw5gqb52lYt9ZyFN1i9QwIao8p3HsGo7mlb0dGMvYrmwUGIh7WwIBRywBXQ81Dsu7c6/iZGoPu/ACXbxByF8/LQ5BzCqKpUcLiixH9vZw4FNFoWJ0s74FhJty9ej228GQJZAzOn8FA1/UJvVNtlr65vPY33AkHuEDcnKBD5Ygcf073mQheXvc3jmkAooEpSecmNLA=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b001da153682c5sm888693plk.261.2024.02.12.15.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 15:36:32 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 12 Feb 2024 15:36:26 -0800
Subject: [PATCH v11 1/4] riscv: Remove unnecessary irqflags processor.h
 include
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-fencei-v11-1-e1327f25fe10@rivosinc.com>
References: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
In-Reply-To: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707780989; l=639;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=23qauOezLdGd/qvi+eoGfAUmo21GdLnF/O1XuhUSBhA=;
 b=3fk1hPn8uk0LHRB8yl3Y0RYndhVQhDbBlNi5Ce1BSrXXKhsMTW4JUlwl8LFpuZbLYzru9RLEH
 y8tsCF/wTQcAF+CZe6nMI0QqK6iZZlmz8RM55ve7LYSJeVzXo12jwfv
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

This include is not used. Remove it to avoid a circular dependency in
the next patch in the series.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/irqflags.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 08d4d6a5b7e9..6fd8cbfcfcc7 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -7,7 +7,6 @@
 #ifndef _ASM_RISCV_IRQFLAGS_H
 #define _ASM_RISCV_IRQFLAGS_H
 
-#include <asm/processor.h>
 #include <asm/csr.h>
 
 /* read interrupt enabled status */

-- 
2.43.0

