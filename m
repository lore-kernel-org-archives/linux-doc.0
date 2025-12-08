Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D511D130E
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211435; cv=none; b=YLQqSz96MgmA+fAYavD09CRMZzEWAVLl3AD76tGVlLt2wiRZ3JOHtct5IW+VP0lROkTk8h0dH37tZOKUEWanEI68NM9uYoSB6o4RrB5hHIAkvxxcfR62YKWDgOxQc0Kfaa0Y1wPl62ynb72jWy4olARvMvBtyYRXpO7oCp5tL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211435; c=relaxed/simple;
	bh=r13oEC0d9oskp3beYLwKfA6dqhYR+C37wgdXlHRrTVA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sntMZ4WIDSknNwyipPDZ5Ir1LnkdWo0aV4iH3uFrwfj6Dti1oI6CM8DXHUcH8fvj6k330WAxHVFei6zfcaADAprksyZ65vCGAKEmWVKspvWbRC1UmiG4DIDi/QnA/8Ks/ai3be4teLk21kIPLz2CxwWuNGw7BS5ADTWLE0W1pto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMNBCFBe; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMNBCFBe"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-656d9230cf2so2695041eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 08:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765211433; x=1765816233; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yn/Eov4eLK5/dqr5YHmxb3fz8Pl4LJ/cN5azbcZHn50=;
        b=OMNBCFBetQsMxS0LWyyLCsmgYaMwqDqEe32xeyjHzhnTn6yGpJuxuoUgyxsi7LJr3l
         SVpgbc5HcEHOGgkV1H0ghBy24CdRzKVVvF/ms2eBR3+7z4RmoBUKI7DZetJprxCzVdba
         o1OxmNJ9pm2HtUwL7XYjzQ+Ve8kHUQwgqPHqPNAMNJL2JLp4qHN1bJGpIlYuSGFFqoTJ
         gJLFm3aX/tHg6ECycaV8aZ88wLBudlAtN8fdOZqsKllrFtUjEcM+ip2NQfLFRNmVTUKE
         Uq4cfqurZM3f6Ua3Cc/9sg6Nh+47tjM5Iqapc8orgvD8JmRoENMdowAJHYocn14qISno
         0MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211433; x=1765816233;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn/Eov4eLK5/dqr5YHmxb3fz8Pl4LJ/cN5azbcZHn50=;
        b=gPuj6Z1uFumxVzOleFGb0vdvNc0nDhLqImaWel9fBTgv8a/RsnHtOrnw+K7CKH4y/w
         zY8SChs4AdmsaKWpVRiVXjJf/bVn3rsT5xlmoXllr5YaFLorhKhXbpla4PgoSbOoJKG9
         n4iVPFYianZbzq770rvSXMz0iw5VSM9UMq4zf1OTq/JoxqU5URn4lDR9Z+tsd9kasFnI
         tVqNAUs76Sv1tVchAX0u2BRXbvAkKEFeo5F03BMiBxXD7l2AF2qDg7Tqk3y+8oF6Z//O
         4SQ+sGbp2EaZ+NL1toZfbY/WhRDEyBvHcT3L+anbDM8CBPaNLFZw4Ph8Be7PK1aOFKqS
         dCnA==
X-Gm-Message-State: AOJu0Yz/sJwlDdd/23rClcCXK8xwvK/nlRqA/RkKwm6e+jjafNG0Vt/E
	PTGUBrm0GRw151Ua2T0HuO7WSZlV6aIWG5YWUVX57SAOZaXCTzkJVQanH7kf2P3B9raR8QkGiGF
	wyzIemyC8bWP85AFMKxsODq4NfS39S3r/i7+A
X-Gm-Gg: ASbGnct6GllniZem1guJ9Ha6508I6ZiPxc8DoE14C4+8Fa58eDx+8gPPfp9d/jXzPYb
	DcpaLuF/txlrN2cRvTt9lPdXRBv84joOPDVhCbOxi1wOMJhJdRKTCGQvDFkTsQwXlEEv+hjiKzz
	ZuO++XlZ1xIFFZxus3kMYFBPZTkLVLmvy5PiIpuEEwSTZR0PQ/sY7qWZmcvXBXrHCROrwmgOard
	Gb1RwPXk5YBHolP9h9FJ2LIcrLZQRysQCFxA/TIkORRJ1m59qiJhAW6GO0emC/OJn+jgNplOvn4
	mald9CY=
X-Google-Smtp-Source: AGHT+IF/MhWfALD0fm1WyRlRPM4hwL1tmH4qeGHzmbHA2sbSycEANZLbIa3xJPFak9DOcycia4XwXifi3t/XzJH1qhA=
X-Received: by 2002:a05:6820:995:b0:659:9a49:8fa7 with SMTP id
 006d021491bc7-6599a8e2632mr3486709eaf.32.1765211432631; Mon, 08 Dec 2025
 08:30:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?= <kartikpro9599@gmail.com>
Date: Mon, 8 Dec 2025 22:00:20 +0530
X-Gm-Features: AQt7F2oZDM7vwCiFc1V5316nLjsFXfSYrU1yLN3fi5MpkodzDKbvQ-2jPmJD8AQ
Message-ID: <CAOCmVvAWc2U95-bWTsjELSdsj7eOvNBM25Y934T-LNOKGcbqqg@mail.gmail.com>
Subject: [PATCH v5] docs: improve introduction wording in howto.rst
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, bagasdotme@gmail.com
Content-Type: text/plain; charset="UTF-8"

From 22538f030fd806d0cdeccb6bdd6fcbc7f5a449e7 Mon Sep 17 00:00:00 2001
From: Kartik Shah <kartikpro9599@gmail.com>
Date: Sun, 7 Dec 2025 13:53:02 +0530
Subject: [PATCH v5] docs: improve introduction wording in howto.rst

The original introduction paragraph was overly long and repetitive.
This patch rewrites it to be clearer and more concise while keeping
the same meaning. It removes redundant phrasing such as "learn how to
become" and improves readability without changing the document's
intent.

Signed-off-by: Kartik Shah <kartikpro9599@gmail.com>
---
 Documentation/process/howto.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6..dd840115f 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -3,11 +3,11 @@
 HOWTO do Linux kernel development
 =================================

-This is the be-all, end-all document on this topic.  It contains
-instructions on how to become a Linux kernel developer and how to learn
-to work with the Linux kernel development community.  It tries to not
-contain anything related to the technical aspects of kernel programming,
-but will help point you in the right direction for that.
+This is a complete introductory document on this topic. It
+contains instructions on how to become a Linux kernel developer
+and how to work with the Linux kernel development community. It
+does not cover the technical aspects of kernel programming, but
+will help point you in the right direction for that.

 If anything in this document becomes out of date, please send in patches
 to the maintainer of this file, who is listed at the bottom of the
-- 
2.52.0.windows.1
