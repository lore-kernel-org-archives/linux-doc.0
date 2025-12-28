Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786F2737FC
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766950624; cv=none; b=OwTSQbnODuPCkPvuNFcHgxdw9agpK+y99iAdkyEkUz1FvH6HSAUxo0J9lnEhV30TCF7+OlKyaC5teUOtvZVn7LFaY++n2H5HFSCxpjzIzqbnwWf+MYy2YCtmtRE80CsuFqkMKJOvH73FTjpN7JEnsDxvPK8ONU+fv4Ij7kFdB4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766950624; c=relaxed/simple;
	bh=Ja68HZD8n/Mecl05e+HzN9NzVeHRRawWqVqaJPniPSA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yd+eag745CKsV0Ssa8d2e7ojnnl6gr7VCYH1tABeKNLV0SPsiRznXc6bVa7UDQ9niDGsM0APpua23V6wINmqWMReFkyAmMzUQ4pOXJx9y7r387NIf31fmJMsg7VJrfLgw/b/G8+an0py9C8zcSxZ6++zRE5nf+8leEsuwC9RN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9d0DImZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9d0DImZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-595825c8eb3so8735839e87.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 11:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766950620; x=1767555420; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADTTnGIZjP2u1Oe9R0dqscHBsTYiL86hsl8c8md8O10=;
        b=J9d0DImZCC39w6HycqCM2XZMuJQvSqR10Ny6abV6N17M5/LhRsHK/cRwbyDIYyaNbt
         vqLa9sVIeoijmkTzow2yL7T6PCcAmNWwUKn+Jn8h9ErdjYj0OnY0bmeKgirRdEa5fgwF
         fWBe3rRS3rHhWWn9Yx2l15Ok6OOBL9GJDWSgA0WewZ7EolWNt76QEf+oO/wdVyO/zCAY
         6D3UjFdjl4QZPfMAXX2CHbfeXAioPcdgwSsnu/Ql/PkCEEPtJzIhb30LDhlF0aRecfVW
         T7l6ofa7Xd9Gaxy2aVEJmdxXUcOVD72FyfwvIHwcPQDIN8fEswUFqIzNNI09qZzkJaVd
         IPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766950620; x=1767555420;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADTTnGIZjP2u1Oe9R0dqscHBsTYiL86hsl8c8md8O10=;
        b=nnwSlBVV4wQ8iEhTI0Jm56dzwBzmHr+AB9o3Q9cze7WuhvHhm++wxRrksT+8ZCjG9i
         Bs0GRGUsD4KNGEfZkcEV/kD9iZkH9sjpDjIVqGw4W0JIlGw6DIRzsbaCnMiJY4LLpJWq
         01x+vRG8m4GtuTmfU6UbLdJ384HEuqEPmgKzkeanD5VHLasLZ7425IF5pvXhNCUiWJSr
         z7cuBVvqRmEuy2Q8cfAp/twXEWid2Q1etLLST5+XueaD0UplAQfeyxjBi9+0tVuzb5ul
         7XCMT0xSyrXljzj4vgQkZ1d3cIuocfIF9V8fh9iezsUca+MbNVo4Wjkmu+wxM5kQZkWu
         /CUw==
X-Forwarded-Encrypted: i=1; AJvYcCVed4+vXSYyXGbF9ll8UxT6lDE19YZng42rHkpackCufT2eip31NkAwm46bj9+tdpCf/fKwIMJAW3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhC6GsLha5sF/CAw2GlnfzWV1+XYc40MLEKcGkOTXeBIN+TH8u
	Y4LHM5CGviBRMkXFBUpgPxogWj34PD8so2oJuCqgLhGV0X5c+8eXW3gSSB6lrWfddrAOMEhGJzS
	4OGJ0gvWjI/QLfUq93FyCAocIrJPBgUc=
X-Gm-Gg: AY/fxX4QnaCsWQZU8Uhjiy8VgFcvYhrYEYlcQt+PnNdpOkpBMmRN9uK19C8InmefNmd
	tTyV32zalt4ptwHZf5R1TyGwuvNEwq0wt8w3Ze1RPZbV5aHPLyF4IM7fcB3b+TKTSL0hY7s1uAM
	OOMsFYhJ6mUbva62YPVaJiR5JKhfWNhhre3sHC1cT3jYd8T00qZy48vO0MDVTp0Y1bs/e3qdU9g
	GG/VLPTcHCzStVnENzCXu50Zh+pFNHHUhGJWWfu46oHSkGGTcz1siJQEk+G2rPTKYdzVeAGSzg3
	+sX/
X-Google-Smtp-Source: AGHT+IEjLwwl0rS0LTYlhd2cdL11fDgszL6gw/6sfMpPXrUmy9mHWgnuGvwJ+khXGtCLqbUuvebxIoficoUgt+rViVM=
X-Received: by 2002:a05:6512:304d:b0:598:f1a1:9611 with SMTP id
 2adb3069b0e04-59a17d46307mr9266404e87.32.1766950620107; Sun, 28 Dec 2025
 11:37:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:36:59 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:36:59 -0800
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAMEXYWegtqikPYBRaZcpd_JwQPH80cXhaRK66J8ZhWPrYc7-yw@mail.gmail.com>
References: <CAMEXYWegtqikPYBRaZcpd_JwQPH80cXhaRK66J8ZhWPrYc7-yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 11:36:59 -0800
X-Gm-Features: AQt7F2o4TnnTitmnSO1AXOGAIw0BbCkBgd8exok1Zu9FNWssb4dmPyVfsyXQ8p0
Message-ID: <CAMEXYWfwKDBSW9p2k6f2Fs7NvROUCmEFyQWgCZKCOzje4gratA@mail.gmail.com>
Subject: [PATCH 3/3] Documentation: Coccinelle: document debug log handling
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The current debug documentation does not mention that logs are printed
to stdout unless DEBUG_FILE is set. It also doesn't mention that
Coccinelle cannot overwrite debug files.

Document this behaviour in the examples and reference it in the
debugging section.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 Documentation/dev-tools/coccinelle.rst | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/coccinelle.rst
b/Documentation/dev-tools/coccinelle.rst
index 6e70a1e9a3c0..c714780d458a 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -127,6 +127,18 @@ To enable verbose messages set the V= variable,
for example::

    make coccicheck MODE=report V=1

+By default, coccicheck will print debug logs to stdout and redirect stderr to
+/dev/null. This can make coccicheck output difficult to read and understand.
+Debug and error messages can instead be written to a debug file instead by
+setting the ``DEBUG_FILE`` variable::
+
+    make coccicheck MODE=report DEBUG_FILE="cocci.log"
+
+Coccinelle cannot overwrite a debug file. Instead of repeatedly deleting a log
+file, you could include the datetime in the debug file name::
+
+    make coccicheck MODE=report DEBUG_FILE="cocci-$(date -Iseconds).log"
+
 Coccinelle parallelization
 --------------------------

@@ -208,11 +220,10 @@ include options matching the options used when
we compile the kernel.
 You can learn what these options are by using V=1; you could then
 manually run Coccinelle with debug options added.

-Alternatively you can debug running Coccinelle against SmPL patches
-by asking for stderr to be redirected to stderr. By default stderr
-is redirected to /dev/null; if you'd like to capture stderr you
-can specify the ``DEBUG_FILE="file.txt"`` option to coccicheck. For
-instance::
+An easier approach to debug running Coccinelle against SmPL patches is to ask
+coccicheck to redirect stderr to a debug file. As mentioned in the examples, by
+default stderr is redirected to /dev/null; if you'd like to capture stderr you
+can specify the ``DEBUG_FILE="file.txt"`` option to coccicheck. For instance::

     rm -f cocci.err
     make coccicheck COCCI=scripts/coccinelle/free/kfree.cocci
MODE=report DEBUG_FILE=cocci.err
-- 
2.52.0
