Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7353449B01
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054674; cv=none; b=CAi0FTZDRDuhWMb3mzvIpwj2mX7WQt3M0vuZJZEENsfXQXICpsXrbxU9cBhQpVI14T7pO4uh2YKerLwismcsq1s+Sc6xihZ0N4U/HfAVaW+KAkzRdvYcTsSzdbNZXMJE4R2z7vmkwRAUJ3UQfY27fft0evw8uauMQONjiqJZMQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054674; c=relaxed/simple;
	bh=pTT7qBp+WwKNO/c77Q6ABkmdFmw3o2ARDNzMO0aj2XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+M+cvsVB+cW1+HQVqFvhTMNqV82AU7JAqYL+LGhK1b4h0A1qjVSnDruUyNX5dVz7bqZWvyuTCRh72JWbBggPt8ZwKc2eNcduIvXM7KrY0puOLd4jZ9FeXNwLkHrDAhUC3oo9J562zC5fL+7oSNMn9/W89H+53k7rasWVH9O3Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mofg/T+S; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mofg/T+S"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so38004081fa.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787054671; x=1787659471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5SA3qexvx0UXWIAtCFlkPfhyZbzB9r1OKgCFasYg5A=;
        b=mofg/T+SZOP7Yo11ffvnvQjcnTSLpCnVdmeItvjT6TX1wl5Sfe0U5MocxkiHiIlaYW
         R8PKrj6nUmZJfzmTdWLbaw1G39onHBd1lYF39w2PRUQF4UbzEG96w8zHmSTm0nxySBmm
         k2wiMe/97TdeHyX6/ESu6bGKvwYZaizhmzA0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054671; x=1787659471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5SA3qexvx0UXWIAtCFlkPfhyZbzB9r1OKgCFasYg5A=;
        b=IgSaxagpPcQvAMx3pU0y5tDI1N4d+VUkUmvJ+Rw743LoKhNylugRIju3MnE9xz0OgW
         LmS956VuVxuURHyVHO+ocfrJ4Kg0EwDpeTCOL3COZdJePOwwDRSETckaV6OqTjvTdedT
         JDsQBOTYgPyv/mPwMyeaBRFdno3x5Sj+smbf5kvwasd+bUarJ53xnNc5vj7svXH9ilxL
         /00G4IKUxKUsVtgMnWQNKmITMufodalGC/HmsBKlanecsSXySnoEuhldkFfON5XdETdl
         Ow7PYjn7ChF9EsFUAarFy8m7sQeh83A5t8zRw/6VUHLsnHYE7RwK2Vrxcjk7tln7Zf/k
         rOAw==
X-Forwarded-Encrypted: i=1; AHgh+Rqm1vNi8XYAAHFneDQYYj9RiSgGG4ywv5cMzCS43rrLN1RdFA3qL0P7r/KjOma9eJc1SpG3VhiIXEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkzp2ffDR9prAuOhtbZvTbgTD+ornesTUFzdW+PtocRPtvU1y8
	NfGYpW1oO3vlyltzYKYRuPl/cxu7aysLI9O8H/gjpK34+CDBi75c4Vw6G6SS252sJQ==
X-Gm-Gg: AR+sD132AK2AiJ4zaoi7h59st/fkpjl0USgt+isUoEGskB+cnapy891XxvOZ4E+NfX+
	FVKBVEaHhFnAmuswCG3mivVMxfsRFIi8RIsZ7vzxwecTlBOCFaetsoH/NyRfO+f4IIFeEUhfO+F
	+4Ag1LgjFzW7sl1GwFGmccG5zzC8hdTuVf9Az7hw8ADsV8XZUrpMomtOLdyQK+VAVwyFcTdTcvT
	2GwyxD0PenI3ZJPlsyQ/6ifbRsaYWaiQbKmzY3mTXzN9w7qL7zprlbfkiaotWTz4EaaeAUccllu
	WSdVto4OeUkJvHW1aNR2GobEuYpxQ17R1yFdRYfF7817VdHV8vZGw5n4PilF8dalDnsBaOVb4Sx
	RSioYiArf9VJBNNC963qIPhEBRS6QD8iEB622xs50j5yRGkAZ2/79gfVvjNlA8aW00IoV1ugOiv
	RN2fZFsRswSjWe2U5PDShm3OdIQinbk6LzsNjmZvptWR7/NLPwLBMGAtw3zohPCkznE/KoNWFNs
	iin8ibv6kjmdbBBWbZ4+YLYUjfMR5sauoiPMLDxseOE
X-Received: by 2002:a2e:bc84:0:b0:3a1:39d7:c6ea with SMTP id 38308e7fff4ca-3a1751ee9b7mr13195061fa.11.1787054670724;
        Tue, 18 Aug 2026 05:04:30 -0700 (PDT)
Received: from ribalda.c.googlers.com.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b204389sm12047321fa.42.2026.08.18.05.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:04:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
To: dmitry.torokhov@gmail.com
Cc: Julia.Lawall@inria.fr,
	bentiss@kernel.org,
	cocci@inria.fr,
	corbet@lwn.net,
	hadess@hadess.net,
	jikos@kernel.org,
	lains@riseup.net,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nicolas.palix@imag.fr,
	skhan@linuxfoundation.org
Subject: re: HID: add documentation and Coccinelle script for FF registration race
Date: Tue, 18 Aug 2026 12:04:28 +0000
Message-ID: <20260818120428.2546810-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.55.0.699.gb54405d56f-goog
In-Reply-To: <20260803-hid-ff-input-configured-v1-2-1dc9bbacd88c@gmail.com>
References: <20260803-hid-ff-input-configured-v1-2-1dc9bbacd88c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dimitry

Looks like media-ci is not particularly happy about this patch:

https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/108127901

/usr/bin/spatch -D report --no-show-diff --very-quiet --cocci-file /builds/linux-media/users/ribalda/scripts/coccinelle/hid/ff_race.cocci --patch /builds/linux-media/users/ribalda --dir . -I /builds/linux-media/users/ribalda/arch/x86/include -I /builds/linux-media/users/ribalda/arch/x86/include/generated -I /builds/linux-media/users/ribalda/include -I /builds/linux-media/users/ribalda/include -I /builds/linux-media/users/ribalda/arch/x86/include/uapi -I /builds/linux-media/users/ribalda/arch/x86/include/generated/uapi -I /builds/linux-media/users/ribalda/include/uapi -I /builds/linux-media/users/ribalda/include/generated/uapi --include /builds/linux-media/users/ribalda/include/linux/compiler-version.h --include /builds/linux-media/users/ribalda/include/linux/kconfig.h --jobs 16 --chunksize 1
Position variable r.p2 on line 20 must be attached to some other token using @.
coccicheck failed


The following change fixes the issue for me... but you probably want to double
check it, I am not proficient at cocci.

diff --git a/scripts/coccinelle/hid/ff_race.cocci b/scripts/coccinelle/hid/ff_race.cocci
index 479f5d1e3184..7cf84936db13 100644
--- a/scripts/coccinelle/hid/ff_race.cocci
+++ b/scripts/coccinelle/hid/ff_race.cocci
@@ -9,7 +9,8 @@ virtual report

 @r@
 identifier probe_fn;
-expression hdev, flags;
+identifier hdev;
+expression flags;
 position p1, p2;
 @@

@@ -17,7 +18,7 @@ probe_fn(struct hid_device *hdev, ...) {
   <...
   hid_hw_start@p1(hdev, flags)
   ...
-  \(input_ff_create\|input_ff_create_memless\)@p2(...)
+  \(input_ff_create@p2\|input_ff_create_memless@p2\)(...)
   ...>
 }


Regards!
