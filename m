Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63A927465C
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766950477; cv=none; b=EO4KYNdq9322XoYNf5FoMCYGWJ7hbkOZhB10UAsteOSL/dWyGfwJq58N+8XW/zd5HA9ATq4tyiju7i31qxGVuuXtfBAVK2154tfoLyt9PLstLTPRpVEYB1CHlK8ZcPzUDyv7r7eAIVKM7iJCe+nj8tWjTT4AbrIwpNQES8wKeP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766950477; c=relaxed/simple;
	bh=MvgwSe2uuAnSoqmyj7Z6BxaI7PVqfjMSmemWw9nwZVI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPQsCeUYkU87l4dkeELQ8kEQGqsm2uNBz6JLY47HcNn5r36QAMY5U+QRA20cAdDreCfcA4zV461HzKNLHiDNnq/7UKDAJHtJ+0w1D2BmwjgkcswyadadXMPsQAGrMJffpZyu3PtLqj8zE9EI6fhe7+iGs13ljpm+b7x28wGF5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnWapcZS; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnWapcZS"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso92041771fa.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 11:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766950474; x=1767555274; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8pEOxCzRMteaLHsxGxdhMSLmiiDxpU7yALXLsW+y30=;
        b=ZnWapcZSYqWxVlMJM+zbojFyY9+VJQ/6coJVjfGBp0rWqX8o1e/9KhtqqoQF+FNJz7
         /4xyZnhrdXCKJb8NH098whg1eDpb0Z0+CvIHsLOQ39nfG+XwztVfj6kEpIRGatkuuZVo
         KBCq+siMYzQGYYjv39ScG1C8WPeaSvo2S6/6+IGfXwJGFJywUllBrNdeoWnfeHRFnJd4
         IYZNzgBlHfxypCVhN7/crtuPmmTCZ31vMytEPnRqeSuTmD/Sef6ENhGq+aOA2BLye06N
         dItuSEf7rE+AvGgxcfdJkSKnJpNG0kjp32e9lQb4nQg2AIU56tcxVNBDEPgYTVrDzBmH
         0x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766950474; x=1767555274;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8pEOxCzRMteaLHsxGxdhMSLmiiDxpU7yALXLsW+y30=;
        b=CV5mt6hdAjPW+3VTcAWe/RIdABNIHhWVJvbA+qjynagopOcVU98jmpGr8K33BM0dqE
         fUIzi4PD2xlAxNIsAQtu9s4R6jSjpMRoGLrjn4KTgtE1YbVL8LRwQQtdPbpKNvqVCe4O
         sf84mo7OAmYZS1pZohx85oHlkZfg9Tg4NEdVvgYvuPZy9QbKOSB7pudCX79pMvw0cZvs
         9PfPEoPy0eJ7sfE6Q4nO+7Qv8GygDcnwgcv+0eCha2czdMI/Mh/NG43e+hkg/7zdFhUS
         dG3Josa9nyrnf3PvgCpOXB783KSBHvDObSzSQARMg9ejDXUpxttT5kLjCz2EtangWvs0
         uvog==
X-Forwarded-Encrypted: i=1; AJvYcCXNWBx/WYIYcTwCiaUQznUD4G+zo8eR0HBc2Ve0MLmbvZprzoitdvSWZppA5IROX+EC6bLusAmpWuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyko42wivqOmhIz+4jgFrF2g0hmeVAkflduXG6VnDdML4SUVHFt
	p+bIlWVCIQwvbyTNfJudPZ4QUeeajZ23rEzag2o6qPbEfaUj3VzU/ULDD7ZKyCH/TRtiZGBDLxp
	a2NGhcL2OztMsbbjdE2LdF9GqKe9JWxs=
X-Gm-Gg: AY/fxX4tJUet5beNign17FQeFFwqXBeWA/hQGEm37JoxGObtvVzBWUML1+xkxPiDj1a
	bMVjJRh6Dm5AWlMdUpwUiMWmgHMRDn6ULCyZ22cpAVgie+vorsDjukVZ5CslAlaJghoHaTZ7T6o
	LyviBJLLXcGecV91oGWoakRled3I/JEpjDdQTFHURarRF+rrxLbLz8SwS7xZPnp/mT/6KqKrReW
	KSPaDPhapI9KlZS6wVSKA6pNmF42Ow+NvfRKbyuuo23ZCpop1oRUlAwM/E/ygVkxKGNM3ZcfaWN
	UTy1
X-Google-Smtp-Source: AGHT+IGYAk4bMC2/pjRyf6BIqHe37o2OjVDQ/0bsuMuggkYk5wBNyeDmOFTnDfYXXJt0JphRJESJESf5hh8Xzq6T57k=
X-Received: by 2002:a05:651c:b12:b0:37a:432f:8ecc with SMTP id
 38308e7fff4ca-381216724dcmr100753891fa.33.1766950473729; Sun, 28 Dec 2025
 11:34:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:34:33 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:34:33 -0800
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228193417.1143676-1-benjamin.philip495@gmail.com>
References: <CAMEXYWegtqikPYBRaZcpd_JwQPH80cXhaRK66J8ZhWPrYc7-yw@mail.gmail.com>
 <20251228193417.1143676-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 11:34:33 -0800
X-Gm-Features: AQt7F2q_dd-58TCGjgqYM9cgx9poXOmTJX0Lk9ORVlxtpuuk3E7dr9mn5Pabj2A
Message-ID: <CAMEXYWdBH4k1n-dkMVRRnChi9baWpSx3xsEaNX8KaSaVa3UBdw@mail.gmail.com>
Subject: [PATCH 2/3] scripts: coccicheck: warn on unset debug file
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

coccicheck prints debug logs to stdout unless a debug file has been set.
This makes it hard to read coccinelle's suggested changes, especially
for someone new to coccicheck.

From this commit, we warn about this behaviour from within the script on
an unset debug file. Explicitly setting the debug file to /dev/null
suppresses the warning while keeping the default.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 scripts/coccicheck | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 2efb74afef2b..8dd766009de1 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -260,6 +260,11 @@ coccinelle () {
 }

 if [ "$DEBUG_FILE" = "" ]; then
+    echo 'You have not explicitly specified the debug file to use.'
+    echo 'Using default "/dev/null" as debug file.'
+    echo 'Debug logs will be printed to stdout.'
+    echo 'You can specify the debug file with "make coccicheck
DEBUG_FILE=<debug_file>"'
+    echo ''
     DEBUG_FILE="/dev/null"
 fi

-- 
2.52.0
