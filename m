Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3FF846B
	for <linux-doc@vger.kernel.org>; Sat,  4 Nov 2023 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKux1ERv"
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE99CD44;
	Sat,  4 Nov 2023 03:39:40 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-5bd6ac9833fso27663a12.0;
        Sat, 04 Nov 2023 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699094380; x=1699699180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5b30yn2MUc9o6D8IvOfB1jYv6Z+ywkQjdxHah+41o9Q=;
        b=iKux1ERvaZl5hGhzGJ3yD20hf4F8k+frNKYivWcocIVzQU6SmuYXFmrUWR0gZ2+M6Z
         Mnmv40Uakr2XPOHxO3YSmiNPCJx6LYLr7lgIbNWGJUMUqlYz8y/sd9K/C6Wp3IgSMd5z
         39DvgNqehyFkDjPW7l5BZVjreFU4Qnq58SUAwEoU3VB93orZic0M8X3WvjvrEd7xdCFQ
         B+jRDjzNmDYEQ7omJMsPimK99U7iN/HrXGBc1EokjpfpbYgX/vsMvVlSom7XNw9rBjCO
         hpINQeSSsovT3TeUMVT9Bb2i0CgvH8vIYStKgtxC1Q7QoyLs/07v6udMbGAAvtXnBaKH
         I/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699094380; x=1699699180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5b30yn2MUc9o6D8IvOfB1jYv6Z+ywkQjdxHah+41o9Q=;
        b=R5Lxhix2m5rpxaCcNlGrKg4ClACWgGoH65ShKLcDo+IBBbVuGTPmeBRoVm8Tm8PmnV
         ZxnjwyUAshyIg92noGbhPFz4zusN8b4NpeIe4jnHi2ijavsZ7dZo3PLo2gUWmVGJFBc8
         hh14qMMVp+pKdbRDXG1cyH4CopDFHqf0Y44H8VjhpYQaJe3zznyqzz6lSO8eikjcnXBv
         P6HmEaU2F+o/T5vpoiwijtvFqXSw1ACCXImBHLG5zU7yhxioQfBM81SZFilV2cIV7TeU
         t0LJ3oH9PG8c7cQxzH+VdQyDzcDmE3JbCvXMAfnzJag1wATOzqMDJccvvjOpuSe2VYsj
         zQBQ==
X-Gm-Message-State: AOJu0YzzL9j5V+1Lq6gDq9Hp1vE1ZxL4VyqqCP+YCQOUw2dSwlFHYTz/
	y9IM7YsaZiV5X+BzRf9ihHs=
X-Google-Smtp-Source: AGHT+IEt1VGGhmDmspMMrmE6CfOoRoBiXcAmVB/PEI3Fpfuszuqobw2sC4fokO1yRA0z21DvleNjQA==
X-Received: by 2002:a17:902:ccca:b0:1bd:c7e2:462 with SMTP id z10-20020a170902ccca00b001bdc7e20462mr24288899ple.11.1699094380319;
        Sat, 04 Nov 2023 03:39:40 -0700 (PDT)
Received: from localhost.localdomain ([140.116.245.232])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c15500b001b8b2b95068sm2705949plj.204.2023.11.04.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 03:39:39 -0700 (PDT)
From: Yuanhsi Chung <freshliver.cys@gmail.com>
To: rostedt@goodmis.org
Cc: mingo@redhat.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuanhsi Chung <freshliver.cys@gmail.com>
Subject: [PATCH] Documentation: Fix filename typo in ftrace doc
Date: Sat,  4 Nov 2023 18:33:30 +0800
Message-Id: <20231104103329.215139-1-freshliver.cys@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The filename for setting the cpumask should be `tracing_cpumask`,
instead of `tracing_cpu_mask`.

Signed-off-by: Yuanhsi Chung <freshliver.cys@gmail.com>
---
 Documentation/trace/ftrace.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index b37dc19e4d40..b93f11c430a9 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -2524,7 +2524,7 @@ want, depending on your needs.
 
 - The cpu number on which the function executed is default
   enabled.  It is sometimes better to only trace one cpu (see
-  tracing_cpu_mask file) or you might sometimes see unordered
+  tracing_cpumask file) or you might sometimes see unordered
   function calls while cpu tracing switch.
 
 	- hide: echo nofuncgraph-cpu > trace_options
-- 
2.25.1

