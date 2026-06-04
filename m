Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93DF352F87
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 03:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780542146; cv=none; b=lZgVsbNno/+Nsfe10k2vcb49bMKQW1taDhf8dqERDSi4OAnIRiPa4REtaCopGOcx6WVvPUgUep+Y2jhR3zQh6NJXbHl6ACdv3VwkYRGPuT5bQSkhtDYaxfpm/2Wex1qftYrKNaHOVAxnHjX1S55Njipl8+YT0wiGvAGrd7Cj658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780542146; c=relaxed/simple;
	bh=mcn8eTAJBUzp+2HCwQ2h9D26B2RJ6FXlFNzX6lNkNSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bPF/vziCVsHLsWZU6DBAc1DrRGZj0DhH20NSKPJiJDJ/hDgVzioUmVHSjb6TO8zdtYhE5gfF+XLIytzKVDTG9IFSSC72YtoP7Ixw/UAn5P7H+Tj29/M9oO/uvkgV8usQK62MhTZ43pP1dI+TjLI/ubgfalkb8HQrCRLllM3+Plc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFzKGHlq; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFzKGHlq"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1363e78746eso224419c88.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 20:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780542144; x=1781146944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHc+Sh1wsfJljfJ6ATkikDkDHFynSW+ZDFzPKyfVdiQ=;
        b=UFzKGHlqMCoxURVBp+tVcubLpxRSraSdfr9iolx6AdP45MYhflmNlIMvkcTyfRtbO6
         WUaeLfhlRTNWDM5JkfkK6RQT/y2/iBgrBoElhakZa02Hm2b5xCyganZoBjYGB0wy3A9h
         +K74RGy0dhjH8f6N/dLSrk+pHViRS8oe+ccet9YRAbZxeF6fYsS6M4DmpgQd5Zae/RYc
         M9cdM2VROhqkT5GJ3YkxKpKX5kXgFsfFjClOz0MXl341Q2I8zeeU0X+OmZ6urI/d3a7C
         FRUoepugNz9h+vZlk+pDgMw5DoM53ZXozQBXCu6gcaV5YrOXsh/gNbmHqBTVfIzeYKgW
         204Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780542144; x=1781146944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHc+Sh1wsfJljfJ6ATkikDkDHFynSW+ZDFzPKyfVdiQ=;
        b=GiV8EANrwbIPDp7N17hlueqoKk/NJhje7h4pZLReqn3zbILPGMds389yXXAY7v3Gm9
         9D2gWYaqXUN9dohfrmtHQ9O5PL6yPQt8grvxuCUvBTtdpvuUSo46qLoJM6BoQLa0j6yo
         MxlVoMhQVbOyRUKA1MMZ6F69AavuHYAO0zr5hpTyrcrnEHMeG59qIlyrZqn03N6j58pf
         Uz5h4dbZ2B0iujvWqHACQqoNGJ1SQvLz5lCDjmXBPHyL8ccy2UhVck44c/JNyDI/DM28
         IrzFz8kErdFBz1k7Ff1PL9k3NFozQ401BjSi2sYE6c8f5Fi5BloPehf2ESE0NOwfsup8
         x/Ig==
X-Gm-Message-State: AOJu0YwO3PveE5xoOM5Gwc+BaaCXM/zHXq8h1GOO3WcIMGOmxqu/KECy
	3EVN7pjNeTYW/4woEDNKhyJGaWIppY3IU4kV5iH8l8PDX2j8mDGMTRo7
X-Gm-Gg: Acq92OHN6ZykDcLjXJPNlV6VbvF1U8qqWG0AGQvXbnGJ+aQKbyAIiSYKbRP0HBY8ORZ
	pui91cYWRPRLqvi+SC7altuJP8XxN4ZCuOvN6p/d3GaJ9Otu3eqh05+dms/jgFlhWfo59EPDli7
	KmRrY1fcMXsP6AsIaXDqQjThy1TsmiLASNsJ4KcMDED7xZrban1wXCrBWkwGHBJQj83abJEcrFV
	tmmUrLWHSpFQckUPh/wGOldnRoIjLO0seBu3UtUl/QJTulQsU/G7sByNffDYMkbxGGC6lHbCN3r
	7vdUfwxapd9KJMRSs3JvziCgvbrqg6tFvW1DAbJfwPMNEqqBJHJGPuKQRDmxFS1fxFJRvYGbNLJ
	4UNk2YLGoKtAouO0Pd/mWRFNa2v3REiHdNWUTGsAUQLVC7X3Bl8XI5wWeg23yb/BnCA8Ee9CAy6
	ju0fsjYSStjoSS+rurU69cridy08Ld7PD5QFjejMyCXg==
X-Received: by 2002:a05:7022:6282:b0:134:a731:e759 with SMTP id a92af1059eb24-137f6c4bbedmr2384760c88.40.1780542143547;
        Wed, 03 Jun 2026 20:02:23 -0700 (PDT)
Received: from localhost ([2804:7f0:3d7:5e7:f9f4:fcc8:ba79:ce46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f549bbefsm3284429c88.4.2026.06.03.20.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:02:23 -0700 (PDT)
From: =?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org,
	=?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Subject: [PATCH v2] docs: pt_BR: update "Purpose of Defconfigs" section in maintainer-soc.rst
Date: Thu,  4 Jun 2026 00:02:14 -0300
Message-ID: <20260604030214.15291-1-amandacorreasilvax@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This update includes the "Purpose of Defconfigs" section translated
to Brazilian Portuguese.

Signed-off-by: Amanda Corrêa <amandacorreasilvax@gmail.com>
---
v2:
 - Adjust translation of section title to "Propósito dos Defconfigs"
   for better clarity in Portuguese.

 .../translations/pt_BR/process/maintainer-soc.rst    | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-soc.rst b/Documentation/translations/pt_BR/process/maintainer-soc.rst
index 5a3ae213e..eb8040a62 100644
--- a/Documentation/translations/pt_BR/process/maintainer-soc.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-soc.rst
@@ -8,7 +8,7 @@ Visão Geral
 -----------
 
 O subsistema SoC é um local de agregação para códigos específicos de SoC
-System on Chip). Os principais componentes do subsistema são:
+(System on Chip). Os principais componentes do subsistema são:
 
 * Devicetrees (DTS) para ARM de 32 e 64 bits e RISC-V.
 * Arquivos de placa (board files) ARM de 32 bits (arch/arm/mach*).
@@ -220,3 +220,13 @@ A linha de assunto de um pull request deve começar com "[GIT PULL]" e ser feita
 usando uma tag assinada, em vez de um branch. Esta tag deve conter uma breve
 descrição resumindo as alterações no pull request. Para mais detalhes sobre o
 envio de pull requests, consulte ``Documentation/maintainer/pull-requests.rst``.
+
+Propósito dos Defconfigs
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Defconfigs são usados principalmente pelos desenvolvedores do kernel, porque as
+distribuições têm suas próprias configurações. Uma mudança que adiciona novas
+opções CONFIG a um defconfig deve explicar por que os desenvolvedores do kernel
+em geral gostariam de tal opção, por exemplo, fornecendo o nome de uma máquina/placa
+suportada usando essa nova opção. Isso implica que habilitar opções em defconfig
+para máquinas não upstream não deve ser aceito.
-- 
2.43.0

