Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF743CECB
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667443; cv=none; b=NOGRqHfz86lsADuI0qnLM1qzCTr7zN3H1pDKtGs21cP3JWu7A1Fot259J4tgeHh+H2vUd9OkMHAxUErZRyroU6911A7p6eaoz3OvqhlrHnCaL6jlPxj0MxQnr3dmCmpXdMkdbbNSP+RewDh9gzZghBCIKc2fpJOad14ZwJmV5VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667443; c=relaxed/simple;
	bh=R+ywodY9/HEwLU1o/08HL92DtAFTrUi2XM/5yuI7Itk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ow/5Y/Pl/VKJT/bwYaSWdzS/93DOwlPXRE+ioY4yaRG/qrZHyClFr+MqKhud+qCS4I3aI2pdgGNGtd+A39M0iYlbcsBZrkASzxe0EH8I28Ovo7ILZbcjTLrz8NeWExyCfVk39YjSdV7Ph/10wm5hjCCHmGkWDQFbwL+8mJ1NATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQjgGC9G; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQjgGC9G"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso4247349a34.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667440; x=1785272240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGwW+xKeGyj9qdYgvsjMj0TNagE0SwrpwzZecGCbsEo=;
        b=EQjgGC9GxQzekN1Zx50JpyYcOmMzib8iIfjnjkZ+LQlu2ybsiLso0sYo9X24CTuqHA
         GQnzZ4LgBkizN1OeNKdKz4jvd+s+v5xhHJDX8xRgMjh9/XPa53fONErpAUla0Fl9bsWM
         3BKX68Uw7bQ9ASixWNv0xFFkxBNnyiFfZIB8ZMJU85M+pwpsXrysFj4WpMjLME85JyCl
         QnGNv8yfYskDsAKeeK4RDHJsmnDjH4hnDJdRqGmAC+qfk+H0ZGcjt28H6RH0ebmJpwFa
         DZBHBUHC1AqvAj1RVEfoqfcvJu0zJiT1zdap0OJ4hFRY2CROYOwjKgXoIlIGZESMhqHv
         Iv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667440; x=1785272240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGwW+xKeGyj9qdYgvsjMj0TNagE0SwrpwzZecGCbsEo=;
        b=ZHxp9Ak0Qz9hHroi3eoyeLwYovCKv/cKUd3uDfRE5InMuaLIkSlymHAUC2+x/nHEDF
         C/aAgYKLizH91tbLGJrWWgANqDhpVXsfITK1dpothVxoahn9m50OlxPZ3wNr5kT2xQXo
         fb22iWpRBAhZyrT2L9BHwl8kBAQuxKkhhk7hHYCnhYBhD1lM+gIfKE2o7sjNc2Ene3JB
         KpIIIRUFtL1YHZ7RD+1g4IVcMY7zVft6I30caOvggyvBM5Y+zbxO7vuSs6rxw17Kj2J+
         Zbso6rptOW598el49PUnfEf6S/mK7ybsy82YenDsUB5r0qaUJI7cHgAL7W4qSCcgl4M3
         v4hg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc9F+dCRkVFni7W537pt9MdPN4A0QU9edxHMU5X/D0CnA2O4ODgAtp+s4B/I9bVbXv+lgHaf0Rk0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbgp+pviLWNM97RuyLm4Btgf5u7Lfxdz/8STA0o+zA7yAkHW1K
	hovtJOmBN24sWMY2+7Jx/MYFYVHNpPv73uKJIWL1nKdf8nS5yiY6kfHY
X-Gm-Gg: AfdE7ck7i4J2MS+IuSqCgbTlUejUSfvfwyBjXOHSWk5/jU9l730Rl0Kon88dX3pNxKy
	i2/YfDG7YLdqPalvdld7ZSngC751cbjbi1uHNEBt5e6i3YW/VAjhUN7MX4F7Cw+pyqvOU+mwumX
	C1z+7DmV35ZraHSqlYrUne1TIzhqXvT24YPdDqWRk2eu8i7b7ZEvYAKNHkP+I22KRBNHQFliELe
	wwDf3A/G69vgWX82wojTUJFIpRnxMnoM3tmyJ9m/VTnqdH0L85Zz4YGv+uBA7L3GRnlYKTxj0Kf
	cOSRbgi+GUeGsFenw15bMkuD9qovoDBVp3Nea+Pwd49tPVhP7z8KSUg8dQWqLpbAikIpsFw6Y6q
	39Qdz2jeJ/vIEhI++S/MkrULxYpEV1ynjJAE08O6oeZG/ns9k31uR146TgzNc3sdYWnU2TnSXji
	wQVZiNYldyObDDPCd7v3cfozwqL1SCaoPlni0tSlpSSbQTP5FMsx7pX/uGW4S6Cq7xZVjzf4buV
	oOo7BRpBbm0XXSwnkYdQBlWRiBKe8Tl2bPD
X-Received: by 2002:a05:6830:6d10:b0:7e9:b4cf:d8c5 with SMTP id 46e09a7af769-7eda4d0f61amr9756553a34.25.1784667439823;
        Tue, 21 Jul 2026 13:57:19 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:56:56 -0600
Subject: [PATCH v7 07/29] vmlinux.lds.h: drop unused HEADERED_SECTION*
 macros
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-7-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=1428;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=R+ywodY9/HEwLU1o/08HL92DtAFTrUi2XM/5yuI7Itk=;
 b=vQYJyP8MxuOQv2u1cH/IFNbnG8o09EQeGls4zdY2WK8vQ/fxaMBvko4DFb9hGhCOlr6txKN/0
 PPhajOOjZloBRtZqJwj6BkpY4kujVHKjVnTzPFcaqBAaTzv5VgUKeh1
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

These macros are unused, no point in carrying them any more.

NB: these macros were just moved to bounded_sections.lds.h, from
vmlinux.lds.h, which is the known entity, and therefore more
meaningful in the 1-line summary, so thats what I used as the topic.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/bounded_sections.lds.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
index 8c29293ca7fb..268cdc34389b 100644
--- a/include/asm-generic/bounded_sections.lds.h
+++ b/include/asm-generic/bounded_sections.lds.h
@@ -18,19 +18,4 @@
 
 #define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
 
-#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_HDR_##_label_	= .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_label_##_HDR_ = .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
-
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
-
 #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */

-- 
2.55.0

