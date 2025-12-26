Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226401DA23
	for <linux-doc@vger.kernel.org>; Fri, 26 Dec 2025 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766739686; cv=none; b=GbwUkzqqWR97zSosF9DLBFejMJymXVZuCMX59IFeRdU/JPKdvAWqYLtp10lNopwe8U+RCgxNe5qqHY3bdocdtFbZ8OzEIzL0krgOX/W+zvwClyrLQrqpYKHDaYHvzxP58eneS7zIYiiE8AlkUOviucs+nzB18GxvmtqPecDsP2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766739686; c=relaxed/simple;
	bh=deD0J4/ccFxT2UY2YK8a5I0EUQi+3nXDeOvzRQM2mRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UUqWKMLa4zjNHFG5M5SUY89L5/nK6kdt81A+VL0V2vChwubbTyvY7dpJ+4pzoNR4r4CWfAyWz8K83qxlNpGUjoT7g8LMtTeXmlnbkJd9swNTd6REwsCQfH+M3JgPGDlT1d4KOGDaunJBGAyETsBHMUhaFLW7heaFNlhejVtXuCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFGdAZxZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFGdAZxZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so14307785e9.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Dec 2025 01:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766739683; x=1767344483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s18bINRfaH8FxMijotjT+qAw1twcB52SKzl6f8O3Eqo=;
        b=iFGdAZxZc+CDZymOg0Sws74qVbaA93QDLpSYdD7bsjq5xo7g30cYQVGb7JmvOkUxW9
         wvuks/WFNHE2GhLLei3pgf/gmiNQgMk5edBwDUJQqToyePIFUO9ugHoEIcCKVlQRuxnU
         0e7TFRApTz1ge6LNeJKzbWD0SfI/s1pj/gN6YQ+I4uwfTIFMJT7NQWVk9lZPgUAg/L2L
         0tDgry6MFBfS1hvJobTJQWdG9cXlfP4cbJjHvhDfWT9274uZ8RiPOnddU/At7wIFV69M
         eT2ehEkH/hMI2b0p/yFrrl37l1e2yxzTRUVtkICAIdm6tpAXf92RnFfS1WtUwO51awWG
         0AaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766739683; x=1767344483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s18bINRfaH8FxMijotjT+qAw1twcB52SKzl6f8O3Eqo=;
        b=KizoaN7LqYqAs8cOfJwU9OmQwlafxnvRId67ku1BNyAG4kHCRVBCxjbLWlPoMpQsVt
         sGJjVDSkTzZn/0UO0e9OkyO6YWg9YfIwegb+4tPLcFOf8RP5/4F5I4jR1dhLezGGNUJo
         C/HKflhTSY89FJAjAknh+xrd4nz/vlfmZDwBOw2uKdAkCnj8ulJ73qeX9dteuLt/CxOM
         jrfknhnV1kxyY8VdHIwep46U7lIRZjm9MxxGpsZOTmKe572N6svao9Z32FgiWvk7RI/Q
         NbAmG4rhsqbvzDDwT2xvlFLVQmczFToAYfGgX963XooPXKYIVteXj+ByteL3ewj2Pz1Q
         MEqA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzSuHiu77hUmWq36rTcTv5I1m0tzzp5PBO/2TG/Bc++LU5kc1VIW8qFmCjkFdBvisFFIXo4FoB+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqdnW0P0v9EBzZywANI1y7jfHBrLzCRJ+Go+pMltgK9MWqv/j6
	p1g5e3t+Zqj/5eeaqy0hjiLRNVW5y/12i1cqIygEzrVgbw07eUG7yZmk
X-Gm-Gg: AY/fxX7faNiHeO2c4uL+f0Wwa3TiSXRGqq9Q1B65UoNShGnTejwOHUZD+FD2IFxftag
	5Mi48D1XXuSdRccRUaSMr1HiBz76GIV8y60LZXEnGnV+scSHrY/pZUd3Hm66i1KzNUwZqXz17MH
	5eP11t5D0Nsl3IGQYFr0YsJAJ3/f+Bx611O7LIofCQT0QaFYr5Yz/5feGS7zWXOENh3jtwfNb2F
	52l+r+g9rr3MXneVbB8x+8I1RqaObnf85gQikSlEplL3Ik1rbJB1Y8TpAtlemMfGvCyaxdnJnNj
	WpFIm2yOD4j27kytY73eySAvt19haovDfBT7h4j47iDIhmWrMOhFZroJsUPzLbU7ebkbn/XUMAf
	UHMC9zcwuxJf29rJ6BEVoblrK2AVSjE9CCndJmaOVLlZpXgTAWcKNf5e0gApGmyNNNdxpce1wb/
	m6UF5iBZePwk4KLA8OEGJpnszi+fPOf3mr
X-Google-Smtp-Source: AGHT+IEvO9nFAg3jDtthTOuFev3sgnrzZzBa49bU74TYQfzpknZpf5z3zzTfipYLabiiZ1MyGaNxbA==
X-Received: by 2002:a05:600c:154c:b0:477:7b72:bf9a with SMTP id 5b1f17b1804b1-47d195b4de0mr238458515e9.28.1766739683229;
        Fri, 26 Dec 2025 01:01:23 -0800 (PST)
Received: from localhost.localdomain ([188.51.201.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm436794315e9.14.2025.12.26.01.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 01:01:23 -0800 (PST)
From: mustafaelrasheid@gmail.com
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mustafa Elrasheid <mustafaelrasheid@gmail.com>
Subject: [PATCH v2] docs: Makefile: wrap SPHINXDIRS help text
Date: Fri, 26 Dec 2025 11:56:51 +0300
Message-Id: <20251226085651.198464-1-mustafaelrasheid@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mustafa Elrasheid <mustafaelrasheid@gmail.com>

When using `make help`, SPHINXDIR doesn't wrap around 80 characters,
causing text to overflow or wrap in incorrect ways,
which then makes the text difficult to read

Signed-off-by: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
---
v2:
  - Added '-s' in fmt to prevent word segmenting at the end of lines.
  - Reduced width in `fmt -w` to account for the added indentation of
    `sed`

 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index e96ac6dcac4f..e260df866f5e 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -98,7 +98,7 @@ dochelp:
 	@echo  '  cleandocs       - clean all generated files'
 	@echo
 	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
-	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)'
+	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)' | fmt -s -w 72 | sed '1!s/^/    /'
 	@echo  '  you may also use a subdirectory like SPHINXDIRS=userspace-api/media,'
 	@echo  '  provided that there is an index.rst file at the subdirectory.'
 	@echo
-- 
2.39.5

