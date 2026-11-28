Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795854544;
	b=qaHKCP1mvy+/TpJbqVTzRzQWuhTYVaZu2mrVYfesXzBqBVbbQR373z98QdHrDEU8qyp4
	 kyLF9cfb4pV5OHjHhOSYaA4fUxHE9AP00dXtrMUFeKWsKWNE+vbVNXzZ+qNSTY9DPfr2Q
	 YfiZVcU8AlKkXteD6zgOzq4nOJpqpfhbam5hTjPz7m9+p7OHHTKkoSGIu0iRoOkCV/rF+
	 2AOdPNnYLmz9Cr+KB2vszkCwx3hsWBFRqgo7149SLfwoM1G/sD+m1QsvcJs+9WJmAKmwR
	 vIgjmLr/VsbVYMJjPBKfV7LG9KcRJi4EHui0VDM/fSRkqdZ5w0YbKUhuKra/cUXmGYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:MIME-Version:
	 X-Received:Received:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=2JoM14t7FH+1NGjrD2mU/HrytF4EJVsMrHx/Wx2shbg=;
	b=zbP+PsuXMnewqlLUoVkJ24y8Cbhoo3l1NKeHzc9RicMezb/dM737/mCqoQaw5fBK0A5R
	 bndwVn2pJem2dAsi5JOfzxpyt9lVGiEAx9mo262Q1hRS5HbZ0ZK8bJaDXlLfh9SATKbeh
	 Sduz/MbcfLr3lYMk/P3AhsdAhvAp/oHf7yo6YD4VIuG+qtQZK5s2Aj9g5lBuael6VMa8E
	 YJMJYjZHX+A9i29sK/NiuoBFIhl+H9FLK6zjb/4scXvebOmrx5Fr2gb0O0XTh6+q+AJ4o
	 vSeOB9x99xILkiGqaTORocuhguopkKexFAanuhfyJHGY6brCEFa69dN3dcvhmk8IGQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jmjxib/D";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF79606A32E
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 08:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF79606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmjxib/D
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso8669256e87.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 00:29:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795854541; cv=none;
        d=google.com; s=arc-20260327;
        b=YrC/rgd6AZEN9OsCtdwllc12vF0RAn8lPvspdZTBKx28yO82c7WiedXfeeLejGhfXq
         Zu6HpL/+NQ4R6vjEdh5W2MHp0zQX/HNChFiTkY0ycsbb4yfdb3/IrESwJo2ad+X242Qr
         zAWVe/40m38Geg+siqMeTbv4YDDDnO5+dz7HGtv3FKRT9zPAu++AeFn3rGLYwRRN7A+5
         833G9tmYa4O/Yk3s9o1StCEqa23M1iXu592NgXws4x+kpDjh4iNI6nNWp3aEo5iRJIH8
         g3ZS0ra/SxTY4Tq7rclhqiE+OhENDihhofw0UdvlzYjkqZi82e8z58lnJJBn+6/eyMN/
         NbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2JoM14t7FH+1NGjrD2mU/HrytF4EJVsMrHx/Wx2shbg=;
        fh=GllHh0lpVYi9WnjaVTIpQqrtZp4bnPXCshSIb/WR6Mg=;
        b=BeN9tRyV4s7JyGUmL3gKyiKKrzmZsnXTeCw+XwmMKRYUmgm2vSp9U3jE7RHc0LlH8n
         1BhqqxLmFXLOB5OnXtUKK2a66IdAz2lXZlFBZr2isiiy8tvPpX7h+8PS9FRMUyxWKUsx
         rpPYToY/kkT61fy3X9ORlRmgdHxmIhRWVlFn2W1v5LCX7PXUKAIwoLPTB4K74FoUb9JZ
         Wr1aVBBvJ5n0soX3S1FYwbcgGk2VZma/gPtFjrw4g3f8vy/f769KaBFFiroODp1uCQWW
         MMsjgfvhp3utpvei29ldI41bwa4VByy35rS291ya9a4pPNKRB7Sry2b+k1nnzJEJ5An7
         ry5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795854541; x=1796459341; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JoM14t7FH+1NGjrD2mU/HrytF4EJVsMrHx/Wx2shbg=;
        b=jmjxib/Dzr79kXRGgAqe3kFXKI1dvJNDdnK9WGUapCXeXfxhNZDCy6ByXrxZ5NsYd5
         s3Jq+Iugv3DtZvpfeiuuV8iNztCysaHvdN/oNt3U6FggFLWZ0lyM6DwaS9JAjk63k82z
         VDhLP5uc6ErkEEXAEM1jQIt74I+I0TqKtJIhg8A5l5ajcDbj2WVbyssCLPw1etkm6Ke4
         vuKyEMdlShIQgGh//1l63WFq/lU1R9NQ9rRTKcqTQzABziVj1dPB+cotwt3WykdxJvWl
         MRBy3L+Dzqp9hxB8rkutGBtwe9E23Jrm5mrKkLN9rjobVglnI7/yOX7Zwa1OAT2SOPt6
         CGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795854541; x=1796459341;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2JoM14t7FH+1NGjrD2mU/HrytF4EJVsMrHx/Wx2shbg=;
        b=hpWZvnWaCMDobobgKWHztwafNckUdNIKo6xpjmNUkqOh4oC1tenqKCMhJSBNhWpjCG
         BcUBpZSP2xgYBNyXtNGTbpP3l6f51ge9XQzn8JGhLqOPshcEA9h9EvVrKhrrdrfB6G0P
         V39CVVFEVf/BFAQ04Mf7GI77bn0D6B5c9K7TvmM/IIvBCq6Ystzpx0IKTEygUDoEg18a
         iIN4mNahog/3X5hBle7e2nO71JDATz9/b7Qqbn813fADiGHMdeDjVaFXzMZ2lOOiuvq5
         IC4cSkZf1Rl51VguGPppHpUp5qzA/Msn+jdvnf9sIUfXKCiTHzF27sl52mz179wo2lZD
         7uEQ==
X-Forwarded-Encrypted: i=1; AL+hErFoXbNSgxIxnUDU7bicrkv6xE1G2+Fvf3amZSxSE3ZCtDWlUpRvEBNUqruvJiSFL4cLKja31MY6Xuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pgu9zucuxIPaUfJfSlBwwf01LFOi+RD+zucdv3H6PQlvmUguR
	3T540fM+oYqw87y2dQVeEvm8Gkz7bYNG1kMqb/JGMOufnGI022gNi9nd64QRQq6qZk+gtBibuUF
	G9E/cyEzafRl/BEwrdBQ0nKH5A71Evjg3gg==
X-Gm-Gg: AZFdTZcQRBv3vSW2klYZRfmtswl/FvPnTai+JPWtdkBhwXljvP7yZ2+hwouzYbIDbKo
	TPXw/DH5VCRn/E6hE7y4aLSelIVi1/rAeSYWYF5yyZ6G4J2KHKFRyC7odDickuYFt5KqIsMUp+e
	tcGlpiYAB8OiD2sbv7EmSQfPJxZO9HwL54SjUFY9E7+XnaeYoWkU8k+0+Erd4AvzKfgEGXzi9Ow
	Ys/oWdxeisu4CxB1AxTDH47rYbSbuZbmJnHkqadO3NPub+CDNZREIsCr33sjSMjvOFPauZQd28I
	IOZl9uFU0RdqvBqbOycGW9jueA4PpMUvFyoo17yDoz0TqVA9K20mHAUhWcH/ebFkihAY3ELMEot
	nx1ZEEGtVUce0CQu+r/02PlKr6hCy19Hn0uFOQcaA2xa8bHNYQE3hpzV95len9aZTwztqIi+mRC
	oXMlIrj6YFblCJ0HFXAJg62O6dTyQ=
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6512:132a:b0:5c1:acf1:337c with SMTP id
 2adb3069b0e04-5c1bc884041mr6979553e87.36.1795854540957; Sat, 28 Nov 2026
 00:29:00 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 28 Nov 2026 02:29:00 -0600
From: Prashant Aithal <prashant.aithal@gmail.com>
Date: Sat, 28 Nov 2026 02:29:00 -0600
X-Gm-Features: Aa3M54ok9czH8y5GsoBTJU4U42v9AvP_hVfQAAYhuojDMMlAZ3fmmSw24ij6Opc
Message-ID: <CA+tAuhOC7ifPWgWJDTPF03nzF82VdaFSi+RSxEeNMNbS1-9F2Q@mail.gmail.com>
Subject: [PATCH] Documentation: fuse: fix typos in fuse-caches.rst
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fix a misspelling of "successfully" in the cache descriptions
for lookups and dentry revalidation, in two places.

Signed-off-by: Prashant Aithal <prashant.aithal@gmail.com>
---
 Documentation/filesystems/fuse/fuse-caches.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst
b/Documentation/filesystems/fuse/fuse-caches.rst
index 0778dd3d3..de1a452fd 100644
--- a/Documentation/filesystems/fuse/fuse-caches.rst
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -156,8 +156,8 @@ in several occasions:

 - When a new file system object is created (e.g. ``FUSE_CREATE``,
   ``FUSE_MKDIR``, etc).
-- When a lookup is sucessfully performed.
-- When a dentry is sucessfully revalidated (``->d_revalidate()``).
+- When a lookup is successfully performed.
+- When a dentry is successfully revalidated (``->d_revalidate()``).

 A dentry expiry time can be set to 0, indicating that it is stale. This means
 that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be
-- 
2.43.0
