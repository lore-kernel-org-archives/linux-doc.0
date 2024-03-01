Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ACB1EA71
	for <linux-doc@vger.kernel.org>; Fri,  1 Mar 2024 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709304087; cv=none; b=IqPwjaF/QKzPyH8sf4agWYew3HhtQM+4wIYF8Z2CFq0KWV+oMEcrnAfNcNWXX4hey3RM3ewuQrRZEdIXQoo7aSaIr8QFoQRPnioSgX/h2QCKnpfPyFzbzoTyXlwDsf0Vh2Gviqmo0+L6++pRm2hiEFwXO+GxqBm4oIXnAkYkqdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709304087; c=relaxed/simple;
	bh=Kcnx6hNY1yqpD03yLkhxq241qrgfYM7pcgRCP3Wo6io=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=oclX+OULC+HCjpnCJ9EisZYDjpuG7QTtWrWIOO9LO/ds0qqhH11YA6G2TVlN96hnWKKOZnuTm/lnEGWFsLoPWJtVK0OFr6J1GFDXouudvLg6A8T5ZFkj1TkKTOLy06S+cxXSk+rcLWBHPxKaVSa5gQ0rJKb3nRorNngemoTZxaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1qjblep; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1qjblep"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e5c81ccfb9so425859b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 01 Mar 2024 06:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709304085; x=1709908885; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP1c6Pa/S4QZd3rEEVEzViKCQcjPTGeFe/Hrxw+MiiQ=;
        b=i1qjblepbOooal34fQroOqoiHv5hiMDh1zeNQxTGhb+1QnbcOS/1fVh7lq8TAujjH4
         EOirOixtF324cVZI0P4mGzYF1JZB3KDjMqiefZKXLSEPtj+RXrOu3xHRvThBISQvlQ+a
         ck1K42HnbIwh1t+s7etFks6CFj5KK/VbSfph9mOCzT+iU4I3x+FrnVM9/+DZ3mdIahMV
         wBAls93kjheruh1Mv1nFEUV0al1lkLWmqwyv5/NysG5WAPORC/brL4IuejxEDnsaor0/
         AZebDLBWxySy2M0J899JmE4XQYa67gGTD7gWgAl/42JC1MzQaNq30hoeZPpHyFzU51za
         aCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709304085; x=1709908885;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TP1c6Pa/S4QZd3rEEVEzViKCQcjPTGeFe/Hrxw+MiiQ=;
        b=VTUdiKA5/rwJrNCUUBcXBX0jj4iw6lqv7tD4kdVV8uPdBc1nF++UBp7WinbHpSlayC
         JMwiSpzl7xB15u9BHT3witcVglrVnNy5AJbjkOXHMGVLK+yMK3gS/qSq+60wr1Q/1v5Q
         LzP7cil+cvlC5qju+KvtLSYxiQ0+lwUya/7rGxx8B4Xxao8sqJl58dTizJMx4kyVv6U4
         thvxz5+3JtGZIrHnPHNGbTlrW4TXJ4ie4qolb+yw3DWRR9HjHF55uHxHuS1Rkqx4W829
         5Dqg6Q1h6We3FgmNEBbRRnVtkt7ciaD09Tfd4qpIxNDkOueiXgPFDtfsCdAFxNb+q3un
         Fa2w==
X-Gm-Message-State: AOJu0YxTjyZZIjk0H7BhPeMeQDboHdDs+TObN3ee7YniJu3e8r/H2uks
	AVODfGdARu0sWW00OXQONmCFy9rBhadvUwirf2PBaRGylxhm528a
X-Google-Smtp-Source: AGHT+IEwIcqUkuFuDVnjx80Sh5xxSCUT2m1/fOpdB0yu93PKeHYU0INeC22/O7qCv/Fn0nZdSCFvOw==
X-Received: by 2002:a05:6a00:2291:b0:6e5:6e5f:1782 with SMTP id f17-20020a056a00229100b006e56e5f1782mr2310664pfe.24.1709304085301;
        Fri, 01 Mar 2024 06:41:25 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id g22-20020aa78756000000b006e5588d1c9fsm3028245pfo.156.2024.03.01.06.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 06:41:24 -0800 (PST)
Message-ID: <ed1ec6f2-0050-46f6-807d-8679f26427e9@gmail.com>
Date: Fri, 1 Mar 2024 23:41:22 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: kerneldoc-preamble.sty: Remove code for Sphinx <2.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that Sphinx 2.4.4 or better is required, get rid of
\providecommand{}'s for compatibility with Sphinx 1.7.9.

While at it, reword the comment on \sphinxtableofcontentshook
for better description of why it needs to be emptied.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Documentation/sphinx/kerneldoc-preamble.sty | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc-preamble.sty b/Documentation/sphinx/kerneldoc-preamble.sty
index 9707e033c8c4..3092df051c95 100644
--- a/Documentation/sphinx/kerneldoc-preamble.sty
+++ b/Documentation/sphinx/kerneldoc-preamble.sty
@@ -54,9 +54,7 @@
 \renewcommand*\l@section{\@dottedtocline{1}{2.4em}{3.2em}}
 \renewcommand*\l@subsection{\@dottedtocline{2}{5.6em}{4.3em}}
 \makeatother
-%% Sphinx < 1.8 doesn't have \sphinxtableofcontentshook
-\providecommand{\sphinxtableofcontentshook}{}
-%% Undefine it for compatibility with Sphinx 1.7.9
+%% Prevent default \sphinxtableofcontentshook from overwriting above tweaks.
 \renewcommand{\sphinxtableofcontentshook}{} % Empty the hook
 
 % Prevent column squeezing of tabulary.  \tymin is set by Sphinx as:
@@ -136,9 +134,6 @@
     }
     \newCJKfontfamily[JPsans]\jpsans{Noto Sans CJK JP}[AutoFakeSlant]
     \newCJKfontfamily[JPmono]\jpmono{Noto Sans Mono CJK JP}[AutoFakeSlant]
-    % Dummy commands for Sphinx < 2.3 (no 'extrapackages' support)
-    \providecommand{\onehalfspacing}{}
-    \providecommand{\singlespacing}{}
     % Define custom macros to on/off CJK
     %% One and half spacing for CJK contents
     \newcommand{\kerneldocCJKon}{\makexeCJKactive\onehalfspacing}

base-commit: fe2562582bffe675721e77e00b3bf5bfa1d7aeab
-- 
2.34.1

