Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF4839E2
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711438699; cv=none; b=OnSviT2pLeqF5BIuj/Qu84I4QkIDHnt6ZwiOMG56zXpxaL0wIE0xgnaZdvLTS2wRwLcvrZQD8kHprADOvfP1VGmmpW6aZEZAMmiYCoWwu17X5xrFMfONLMf6erapAqDLCdaYZJwMDBkHt1V8KaSO/Sx0GC/9umrc6J6DWtFkdgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711438699; c=relaxed/simple;
	bh=9XJh0CzYDWGiCksBgfcLCO2dZJOCVan0S7tu1cQ1viw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mbV+VYcJlyPrLxu3Cw3egIvgnO3Qe+AF+YGvmMzwtbhLYFtp0PU6VrDB1872uWorxm5fJHxGtE3i1F2xiZWZioPmoJ0XnYfjdsDt9AFk4h3XbtnDBWkL7fjhpUFWpKzcXs16DhckYFhD/Ar55kjY6XdpiJuZCIKuRBQ49w8t5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v2trDSC1; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v2trDSC1"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a0815e3f9so79487887b3.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 00:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711438697; x=1712043497; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=egxD8lhrCUbXKjoayD1s0sEl15YwV5GNDF5jJ/ZQHhc=;
        b=v2trDSC1H8X7t0d9eLGNTIX9pt7wsP2woiJVBvxY/WkoDWvx+INkFeP3jl6XzplKf1
         HnEK1PRaAqundtnPbKUajH5/6jNzxumXfz3/M40jnG9SrMzkMEgb6XmdSeJLtfYYvedn
         B3MCp0NJA0EBEN2aG9pl4TeWC8aURawOiQa6as4pRIRa1wLOxYraSQM4fX3PDiJ9vyX4
         yqyUhpRflgJQU5k4PIfLua8kWBTAS/tqNHcj+khJDvnvSNzE1U94Vh36CpO5vs8Ewf2R
         RNcbigq6CeHIM6Pq3eskPyReQm6BGe2iFM5flzS3PKphiNPoz7G2ceW4RN3yV90W28ZL
         FEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711438697; x=1712043497;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=egxD8lhrCUbXKjoayD1s0sEl15YwV5GNDF5jJ/ZQHhc=;
        b=vDhxZTJiVyF3pGZw4J4Xq7kCfq6MfuxIK8JhIdl7zj9nZWV4bhjVuMbyE43qyXU5zj
         tz0jhhABGUYxnweE2VftXK6LF6SsjA2WZw9rulcojZ0aXHwnSdIaUZpfB675WaDzGr9e
         TNx4y2X8W5OJnWNvbx+M2W+BjElUeYDpOmZeJ5vkwX0smAM50Orc1K273fle+ZBTsGP3
         23jYZmD9yvour01DUwNlu8ih5uwlKib0oISoUnr2oPBseBUyhelssEWEonUktkJsN0bs
         vhiWFsBjLL7meaj/Hlj64lZEHz1etqnsAtIVqDgKIE9vKOS5G8vxEFCvCo+unWRcL+vW
         scuw==
X-Forwarded-Encrypted: i=1; AJvYcCWZdgdat2viGeXiRY9erMr+40WYgS8XBsnEL2YXXZpHc0apFf1K+gD1+5Z10FHN4LSzPKWPjdWGtlooVEh80U0Jyh9t3q0FCZiV
X-Gm-Message-State: AOJu0Yxsdrc85Zvpq2K04V4rodjZ4Ul4TquFe/Tah4zKkZRn1L2Q6ugb
	3btJIJ7EtyAizt7RCjdiox2i7ILXUTNJiJ34dYGONXZAmLn/y0T44aO51PoTGwV3VwuArRH+tB3
	n8Q==
X-Google-Smtp-Source: AGHT+IEd+5GPQZQNt+Hcw0OMk85Ig7li+vYOFhowC9mcnO8i7BoXvgnyYvR7c53gQ53uZs3OxbGiR0BbG+w=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:f77:52ef:ebeb:2cec])
 (user=surenb job=sendgmr) by 2002:a05:690c:7303:b0:611:9c16:6cb8 with SMTP id
 jp3-20020a05690c730300b006119c166cb8mr531299ywb.10.1711438697064; Tue, 26 Mar
 2024 00:38:17 -0700 (PDT)
Date: Tue, 26 Mar 2024 00:38:13 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326073813.727090-1-surenb@google.com>
Subject: [PATCH 1/1] Documentation: fs/proc: fix allocinfo title
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: sfr@canb.auug.org.au, kent.overstreet@linux.dev, surenb@google.com, 
	linux-doc@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Fix "Title underline too short." warning in the documentation.

Fixes: d08b311b6d49 ("lib: add allocation tagging support for memory allocation profiling")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/filesystems/proc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 5d2fc58b5b1f..245269dd6e02 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -955,7 +955,7 @@ reclaimed to achieve this.
 
 
 allocinfo
-~~~~~~~
+~~~~~~~~~
 
 Provides information about memory allocations at all locations in the code
 base. Each allocation in the code is identified by its source file, line
-- 
2.44.0.396.g6e790dbe36-goog

