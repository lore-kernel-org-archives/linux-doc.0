Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC3D2F2918
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 06:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449018; cv=none; b=srcrwX5bsDD456cAwjJXQxTMKmvmY2PobLUfigHcq7eBF+m1WWzDWMXJ/UC4szZrsvkOQELB6Tj3boecM7vNgd5AJ7s8ViI/vEqSY1Yall4k8DAbr0btKe4HbiXMmSax65CKzYX3FjkyChKAGBXsRiekzF3RqQcNaA8uHWWOKbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449018; c=relaxed/simple;
	bh=yP/G1BqoS+wnMXWLE9nfcRvcMRIMvhh4xGuSidx+u3Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PqUljDQ8/IGWzrbcdb54QwBmgkHUw2Ap319PaBnqBHDMLTB+rvh3xkhudCF5jHKsZFeAuwgwXLEDA3oN+bD2SrXGG80QUbS9sTrhOc7hTZIsO/0liGw/FcJ7cpwT1CzG0vsA0CTZQuwbG5hVMkm7a23vZR1XMvP1L7PrMfa9OpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESN9KTRs; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESN9KTRs"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6571763793bso2208801eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 22:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763449016; x=1764053816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eR7oRX3zoJvcN3y85JYH6/0LVrEFQ0JSOA8fVCbdpWo=;
        b=ESN9KTRs0bI2YbeWpNBzl6EUOaGz9geYRoJnNbxhSdOW95Op02pGnYrSh9HOaVve9U
         /emR+qub/CzIVWH+bmBT09hXNLjdu8gdrj14eY0taxu2eGdtA9UyAvAbrA9b2r52VXRn
         tvyZYyS7+lEavCsJNZM28rCo5nZ8/Pb1khiAPDkilh2zmwpoWY/hzcO+lSvT2IIGlLxS
         dOJ0MGa2cIK/1S3vbUJ5Mct5xQm5PJITl6KkzL8+F1XHSCPkgkf+RK0mnJpDzb5YNvpQ
         Vzq9gldR7Be+2AJZU6E11vV7zdtytLMngqVqoDJjyMi/mLUYMCo7JZ1aDrB5cO5V7PIF
         8deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763449016; x=1764053816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eR7oRX3zoJvcN3y85JYH6/0LVrEFQ0JSOA8fVCbdpWo=;
        b=pJ3R7xOrnisyilFGatbUkhADTQRVhOXbjbAItQ+jN0DjyT7BGDxisAHO1JOtVl8Uzq
         hvqpv55uyA8aRC3R/76xp1vESAoa5nH3bca/6lgXyBE2NQ2ikqLkj3lbMwNhyk4UrrED
         onCXmwVJIhYdrch0+Ygy7kJG+0vyYObPdEcYHi7QEyVj+TTT/kkQUoiImuEKgcivjW/L
         Q/cqhEQ3W0y1ErgEXIFjlpGj87HGcP6rPHOwunMgw5aHDALf76SIQr/myDBb82heo8wa
         e1W0J4O4WyvhHooEArWauR+N6pDqzgrtZDRm6O1JA6RbVNlZKRoxZzeWBQvwcWAzEinP
         tebA==
X-Gm-Message-State: AOJu0YzEOo4ncfhjzKVKBIgCb/bNPys9AFtWVVvvdBd8KLsAUr6KskBL
	rPs+pUcaZRh68lVQ7QlhHlOKTA0eauiEZ5CvNWHb6VPacrKVcQiuqxRMkosn43eadwMQ/ZzhwxV
	SBqWD8T6yvEK6O5DBXjaBYw24aE5R69zIN7teLnQ=
X-Gm-Gg: ASbGncvbmoPuEMe2h2ZPehGuVehiYktJv+KwUIGrTr8IRNnlYADS/CQk9ZfxvieVun+
	6FOVaWITmAhXzkMfMRhbBI4tR5hIcMDMwxJCrvMDQrUUZ5hbb1gAOEbnS22OppaB9HOIFDo4Rf9
	mKslCf9iDrnM1uv6p1vkcgAaNJD2pOkVVQV6+q/TPVLKgtUXve9eTSxAbSzs7t49kBEo9cFY4+b
	EHcB/Ws2wtyJI8HLz/0jLmzHF0RZlaPhbOI3D/mdEkcbCdbpOc4Zm6EIBj6
X-Google-Smtp-Source: AGHT+IEbZ63dg8PrbLOkhSJwZJ47RVEwAJi4DfPPkCGCPM+JElWST9Jt1+7XEZUtCk7fYKOsLhYbwYyef30H2f72hT4=
X-Received: by 2002:a05:6871:2b10:b0:3ec:3b04:510d with SMTP id
 586e51a60fabf-3ec3b047f97mr3763611fac.35.1763449015879; Mon, 17 Nov 2025
 22:56:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Tue, 18 Nov 2025 14:56:45 +0800
X-Gm-Features: AWmQ_bkmCsokEFqsiNMrpllBZhl4Enhuked4Uju2mHLIvDORAoUDTvnWNxpX_4c
Message-ID: <CAFb8wJv4pUusuW-NsSsa-v-WuHZmbHS8Ha9mydqQPrBAMMQt6w@mail.gmail.com>
Subject: [PATCH] Documentation/admin-guide: fix typo in cscope command example
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The documentation previously had a typo:
  c"scope -d -p10
which would confuse users. This patch corrects it to:
  cscope -d -p10

Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 Documentation/admin-guide/workload-tracing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst
b/Documentation/admin-guide/workload-tracing.rst
index d6313890ee41..dbdbed4a1b41 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -196,7 +196,7 @@ Let=E2=80=99s checkout the latest Linux repository and
build cscope database::
   cscope -R -p10  # builds cscope.out database before starting browse sess=
ion
   cscope -d -p10  # starts browse session on cscope.out database

-Note: Run "cscope -R -p10" to build the database and c"scope -d -p10" to
+Note: Run "cscope -R -p10" to build the database and "cscope -d -p10" to
 enter into the browsing session. cscope by default cscope.out database.
 To get out of this mode press ctrl+d. -p option is used to specify the
 number of file path components to display. -p10 is optimal for browsing
--=20
2.34.1
